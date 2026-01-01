#!/usr/bin/env python3
"""
TDLib API Code Generator for Dart
Generates Dart data classes from td_api.tl schema file.

Usage:
    python td_api_generator.py [path_to_td_api.tl] [output_directory]
    
Example:
    python tools/td_api_generator.py td_api.tl lib/core/tdlib/generated/
"""

import re
import os
import sys
from dataclasses import dataclass, field
from typing import List, Dict, Optional, Set
from datetime import datetime


# =============================================================================
# TYPE MAPPINGS
# =============================================================================

# TDLib primitive types to Dart types
PRIMITIVE_TYPE_MAP = {
    'double': 'double',
    'string': 'String',
    'int32': 'int',
    'int53': 'int',
    'int64': 'int',  # In Dart, int is 64-bit
    'bytes': 'String',  # Base64 encoded
    'Bool': 'bool',
    'boolFalse': 'bool',
    'boolTrue': 'bool',
}

# Reserved Dart keywords that need escaping
DART_KEYWORDS = {
    'abstract', 'as', 'assert', 'async', 'await', 'break', 'case', 'catch',
    'class', 'const', 'continue', 'covariant', 'default', 'deferred', 'do',
    'dynamic', 'else', 'enum', 'export', 'extends', 'extension', 'external',
    'factory', 'false', 'final', 'finally', 'for', 'Function', 'get', 'hide',
    'if', 'implements', 'import', 'in', 'interface', 'is', 'late', 'library',
    'mixin', 'new', 'null', 'on', 'operator', 'part', 'required', 'rethrow',
    'return', 'set', 'show', 'static', 'super', 'switch', 'sync', 'this',
    'throw', 'true', 'try', 'typedef', 'var', 'void', 'while', 'with', 'yield',
}


# =============================================================================
# DATA STRUCTURES
# =============================================================================

@dataclass
class TdField:
    """Represents a field in a TDLib class."""
    name: str
    type_name: str
    description: str = ""
    is_optional: bool = False
    is_vector: bool = False
    vector_inner_type: str = ""
    
    @property
    def dart_name(self) -> str:
        """Convert to Dart-safe field name."""
        name = to_camel_case(self.name)
        # Handle TDLib's param_ prefix for reserved words
        if name.startswith('param'):
            name = name[5].lower() + name[6:] if len(name) > 5 else name
        if name in DART_KEYWORDS:
            return f'{name}_'
        return name
    
    @property
    def dart_type(self) -> str:
        """Get the Dart type for this field."""
        if self.is_vector:
            inner = get_dart_type(self.vector_inner_type)
            base_type = f'List<{inner}>'
        else:
            base_type = get_dart_type(self.type_name)
        
        if self.is_optional:
            return f'{base_type}?'
        return base_type


@dataclass
class TdClass:
    """Represents a TDLib class/constructor."""
    name: str
    parent_type: str
    fields: List[TdField] = field(default_factory=list)
    description: str = ""
    is_abstract: bool = False
    
    @property
    def dart_name(self) -> str:
        """Get Dart class name (PascalCase with Td prefix)."""
        return 'Td' + to_pascal_case(self.name)
    
    @property
    def parent_dart_name(self) -> str:
        """Get parent Dart class name."""
        if self.parent_type and self.parent_type != self.name:
            return 'Td' + to_pascal_case(self.parent_type)
        return 'TdObject'


@dataclass
class TdFunction:
    """Represents a TDLib function."""
    name: str
    return_type: str
    fields: List[TdField] = field(default_factory=list)
    description: str = ""
    
    @property
    def dart_name(self) -> str:
        """Get Dart class name for function."""
        return 'Td' + to_pascal_case(self.name)


# =============================================================================
# HELPER FUNCTIONS
# =============================================================================

def to_camel_case(snake_str: str) -> str:
    """Convert snake_case to camelCase."""
    components = snake_str.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])


def to_pascal_case(snake_str: str) -> str:
    """Convert snake_case to PascalCase."""
    components = snake_str.split('_')
    return ''.join(x.title() for x in components)


def to_snake_case(camel_str: str) -> str:
    """Convert camelCase/PascalCase to snake_case."""
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', camel_str)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def get_dart_type(tdlib_type: str) -> str:
    """Convert TDLib type to Dart type."""
    if tdlib_type in PRIMITIVE_TYPE_MAP:
        return PRIMITIVE_TYPE_MAP[tdlib_type]
    
    # Handle vector types
    vector_match = re.match(r'vector<(.+)>', tdlib_type)
    if vector_match:
        inner = get_dart_type(vector_match.group(1))
        return f'List<{inner}>'
    
    # Custom TDLib types become Td-prefixed classes
    return 'Td' + to_pascal_case(tdlib_type)


def is_primitive_type(type_name: str) -> bool:
    """Check if type is a primitive type."""
    return type_name in PRIMITIVE_TYPE_MAP


def escape_dart_string(s: str) -> str:
    """Escape string for Dart."""
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('\n', '\\n')


# =============================================================================
# PARSER
# =============================================================================

class TdApiParser:
    """Parser for td_api.tl schema files."""
    
    def __init__(self):
        self.classes: Dict[str, TdClass] = {}
        self.functions: Dict[str, TdFunction] = {}
        self.abstract_types: Set[str] = set()
        self.type_hierarchy: Dict[str, List[str]] = {}  # parent -> children
        
    def parse_file(self, filepath: str):
        """Parse a td_api.tl file."""
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        self._parse_content(content)
        self._build_type_hierarchy()
        self._mark_abstract_types()
        
    def _parse_content(self, content: str):
        """Parse the content of a td_api.tl file."""
        lines = content.split('\n')
        
        current_description = ""
        field_descriptions: Dict[str, str] = {}
        in_functions_section = False
        
        for line in lines:
            line = line.strip()
            
            # Skip empty lines
            if not line:
                continue
            
            # Check for functions section marker
            if line == '---functions---':
                in_functions_section = True
                current_description = ""
                field_descriptions = {}
                continue
            
            # Skip type definitions at the top
            if line.startswith('double ?') or line.startswith('string ?'):
                continue
            if line.startswith('int32 =') or line.startswith('int53 =') or line.startswith('int64 ='):
                continue
            if line.startswith('bytes =') or line.startswith('boolFalse') or line.startswith('boolTrue'):
                continue
            if line.startswith('vector {'):
                continue
            
            # Parse class/description comments
            if line.startswith('//@class'):
                # Abstract class marker: //@class ClassName @description ...
                match = re.match(r'//@class\s+(\w+)\s+@description\s+(.+)', line)
                if match:
                    class_name = match.group(1)
                    self.abstract_types.add(class_name)
                continue
            
            # Parse description comments
            if line.startswith('//@description'):
                desc_match = re.match(r'//@description\s+(.+)', line)
                if desc_match:
                    current_description = desc_match.group(1)
                    # Also parse inline field descriptions
                    field_matches = re.findall(r'@(\w+)\s+([^@]+)', line)
                    for fname, fdesc in field_matches:
                        if fname != 'description':
                            field_descriptions[fname] = fdesc.strip()
                continue
            
            # Parse continued field descriptions
            if line.startswith('//@') and not line.startswith('//@description') and not line.startswith('//@class'):
                field_matches = re.findall(r'@(\w+)\s+([^@]+)', line)
                for fname, fdesc in field_matches:
                    field_descriptions[fname] = fdesc.strip()
                continue
            
            # Skip continuation comments
            if line.startswith('//-'):
                current_description += ' ' + line[3:].strip()
                continue
            
            # Skip regular comments
            if line.startswith('//'):
                continue
            
            # Parse class/function definition
            if '=' in line and not line.startswith('//'):
                self._parse_definition(line, current_description, field_descriptions, in_functions_section)
                current_description = ""
                field_descriptions = {}
    
    def _parse_definition(self, line: str, description: str, field_descs: Dict[str, str], is_function: bool):
        """Parse a single class or function definition."""
        # Format: name field:type field:type = ReturnType;
        line = line.rstrip(';')
        
        parts = line.split('=')
        if len(parts) != 2:
            return
        
        left_part = parts[0].strip()
        return_type = parts[1].strip()
        
        # Parse name and fields
        tokens = left_part.split()
        if not tokens:
            return
        
        name = tokens[0]
        fields: List[TdField] = []
        
        for token in tokens[1:]:
            if ':' in token:
                field_name, field_type = token.split(':', 1)
                field = self._parse_field(field_name, field_type, field_descs.get(field_name, ""))
                if field:
                    fields.append(field)
        
        if is_function:
            func = TdFunction(
                name=name,
                return_type=return_type,
                fields=fields,
                description=description
            )
            self.functions[name] = func
        else:
            cls = TdClass(
                name=name,
                parent_type=return_type,
                fields=fields,
                description=description
            )
            self.classes[name] = cls
    
    def _parse_field(self, name: str, type_str: str, description: str) -> Optional[TdField]:
        """Parse a single field definition."""
        # Handle param_ prefix for reserved words
        if name.startswith('param_'):
            name = name[6:]
        
        is_vector = type_str.startswith('vector<')
        is_optional = False
        vector_inner = ""
        
        if is_vector:
            match = re.match(r'vector<(.+)>', type_str)
            if match:
                vector_inner = match.group(1)
                type_str = vector_inner
        
        # Check for optional (nullable) types - in TDLib these are indicated in docs
        # We'll mark all non-primitive object types as potentially optional
        if not is_primitive_type(type_str) and not is_vector:
            is_optional = True
        
        return TdField(
            name=name,
            type_name=type_str,
            description=description,
            is_optional=is_optional,
            is_vector=is_vector,
            vector_inner_type=vector_inner
        )
    
    def _build_type_hierarchy(self):
        """Build parent-child type relationships."""
        for cls in self.classes.values():
            parent = cls.parent_type
            if parent not in self.type_hierarchy:
                self.type_hierarchy[parent] = []
            self.type_hierarchy[parent].append(cls.name)
    
    def _mark_abstract_types(self):
        """Mark types that have multiple implementations as abstract."""
        for parent, children in self.type_hierarchy.items():
            if len(children) > 1:
                self.abstract_types.add(parent)


# =============================================================================
# CODE GENERATOR
# =============================================================================

class DartCodeGenerator:
    """Generates Dart code from parsed TDLib schema."""
    
    def __init__(self, parser: TdApiParser):
        self.parser = parser
        
    def generate_all(self, output_dir: str):
        """Generate all Dart files."""
        os.makedirs(output_dir, exist_ok=True)
        
        # Generate base class
        self._write_file(output_dir, 'td_base.dart', self._generate_base())
        
        # Generate event type enum
        self._write_file(output_dir, 'td_event_type.dart', self._generate_event_type_enum())
        
        # Generate all objects (split into multiple files for manageability)
        self._write_file(output_dir, 'td_objects.dart', self._generate_objects())
        
        # Generate function request classes
        self._write_file(output_dir, 'td_functions.dart', self._generate_functions())
        
        # Generate barrel export file
        self._write_file(output_dir, 'tdlib.dart', self._generate_barrel())
        
        print(f"✅ Generated {len(self.parser.classes)} classes and {len(self.parser.functions)} functions")
    
    def _write_file(self, output_dir: str, filename: str, content: str):
        """Write content to a file."""
        filepath = os.path.join(output_dir, filename)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"  📄 {filename}")
    
    def _generate_base(self) -> str:
        """Generate the base TdObject class."""
        return f'''// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

/// Base class for all TDLib objects.
abstract class TdObject {{
  /// The TDLib type string (e.g., "user", "message")
  String get tdType;
  
  /// Convert this object to a Map for JSON serialization.
  Map<String, dynamic> toMap();
  
  /// Create a TdObject from a Map.
  /// Returns null if the type is unknown.
  static TdObject? fromMap(Map<String, dynamic>? map) {{
    if (map == null) return null;
    
    final type = map['@type'] as String?;
    if (type == null) return null;
    
    // Import the factory from td_objects.dart
    return TdObjectFactory.create(type, map);
  }}
}}

/// Mixin for TdObject classes that can be created from Maps.
mixin TdFromMap {{
  static T? fromMapOrNull<T extends TdObject>(Map<String, dynamic>? map) {{
    if (map == null) return null;
    return TdObject.fromMap(map) as T?;
  }}
}}

/// Helper extension for safe list parsing
extension TdListExtension on List<dynamic>? {{
  List<T> toTdList<T>(T Function(Map<String, dynamic>) fromMap) {{
    if (this == null) return <T>[];
    return this!.map((e) => fromMap(e as Map<String, dynamic>)).toList();
  }}
  
  List<int> toIntList() {{
    if (this == null) return <int>[];
    return this!.map((e) => e as int).toList();
  }}
  
  List<String> toStringList() {{
    if (this == null) return <String>[];
    return this!.map((e) => e as String).toList();
  }}
}}
'''
    
    def _generate_event_type_enum(self) -> str:
        """Generate the TdEventType enum for fast type switching."""
        lines = [
            '// AUTO-GENERATED FILE - DO NOT MODIFY',
            f'// Generated from td_api.tl on {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
            '',
            "import 'td_base.dart';",
            '',
            '/// Enum representing all TDLib event/object types.',
            '/// Use this for fast switch statements instead of string comparison.',
            'enum TdEventType {',
        ]
        
        # Add all class types
        all_types = sorted(self.parser.classes.keys())
        for type_name in all_types:
            dart_enum = to_camel_case(type_name)
            lines.append(f'  /// {self.parser.classes[type_name].description[:80] if self.parser.classes[type_name].description else type_name}')
            lines.append(f'  {dart_enum},')
        
        # Add unknown type
        lines.append('  /// Unknown or unsupported type')
        lines.append('  unknown,')
        lines.append('}')
        lines.append('')
        
        # Add extension for string -> enum conversion
        lines.append('/// Extension to convert TDLib type strings to enum values.')
        lines.append('extension TdEventTypeExtension on String {')
        lines.append('  /// Convert a TDLib @type string to TdEventType enum.')
        lines.append('  TdEventType toTdEventType() {')
        lines.append('    return _typeStringToEnum[this] ?? TdEventType.unknown;')
        lines.append('  }')
        lines.append('}')
        lines.append('')
        
        # Generate the lookup map
        lines.append('/// Map from TDLib type string to enum value for O(1) lookup.')
        lines.append('const Map<String, TdEventType> _typeStringToEnum = {')
        for type_name in all_types:
            dart_enum = to_camel_case(type_name)
            lines.append(f"  '{type_name}': TdEventType.{dart_enum},")
        lines.append('};')
        lines.append('')
        
        # Generate reverse map for getting type string from enum
        lines.append('/// Map from enum value to TDLib type string.')
        lines.append('const Map<TdEventType, String> tdEventTypeToString = {')
        for type_name in all_types:
            dart_enum = to_camel_case(type_name)
            lines.append(f"  TdEventType.{dart_enum}: '{type_name}',")
        lines.append("  TdEventType.unknown: 'unknown',")
        lines.append('};')
        
        return '\n'.join(lines)
    
    def _generate_objects(self) -> str:
        """Generate all TDLib object classes."""
        lines = [
            '// AUTO-GENERATED FILE - DO NOT MODIFY',
            f'// Generated from td_api.tl on {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
            '',
            "import 'td_base.dart';",
            '',
        ]
        
        # Generate abstract parent classes first
        abstract_classes = set()
        for cls in self.parser.classes.values():
            if cls.parent_type in self.parser.abstract_types and cls.parent_type != cls.name:
                abstract_classes.add(cls.parent_type)
        
        for abstract_name in sorted(abstract_classes):
            lines.extend(self._generate_abstract_class(abstract_name))
            lines.append('')
        
        # Generate concrete classes
        for cls in sorted(self.parser.classes.values(), key=lambda x: x.name):
            lines.extend(self._generate_class(cls))
            lines.append('')
        
        # Generate factory class
        lines.extend(self._generate_factory())
        
        return '\n'.join(lines)
    
    def _generate_abstract_class(self, name: str) -> List[str]:
        """Generate an abstract class."""
        dart_name = 'Td' + to_pascal_case(name)
        lines = [
            f'/// Abstract base class for {name} types.',
            f'abstract class {dart_name} extends TdObject {{',
            f"  @override",
            f"  String get tdType;",
            f'}}',
        ]
        return lines
    
    def _generate_class(self, cls: TdClass) -> List[str]:
        """Generate a concrete class."""
        dart_name = cls.dart_name
        parent_name = cls.parent_dart_name
        
        # Check if parent is abstract
        if cls.parent_type in self.parser.abstract_types and cls.parent_type != cls.name:
            parent_name = 'Td' + to_pascal_case(cls.parent_type)
        
        lines = []
        
        # Class documentation
        if cls.description:
            lines.append(f'/// {escape_dart_string(cls.description)}')
        
        # Class declaration
        lines.append(f'class {dart_name} extends {parent_name} {{')
        
        # Fields
        for field in cls.fields:
            if field.description:
                lines.append(f'  /// {escape_dart_string(field.description[:100])}')
            lines.append(f'  final {field.dart_type} {field.dart_name};')
        
        lines.append('')
        
        # Constructor
        if cls.fields:
            lines.append(f'  const {dart_name}({{')
            for field in cls.fields:
                required = '' if field.is_optional else 'required '
                lines.append(f'    {required}this.{field.dart_name},')
            lines.append('  });')
        else:
            lines.append(f'  const {dart_name}();')
        
        lines.append('')
        
        # tdType getter
        lines.append('  @override')
        lines.append(f"  String get tdType => '{cls.name}';")
        lines.append('')
        
        # fromMap factory
        lines.append(f'  /// Create from Map.')
        lines.append(f'  factory {dart_name}.fromMap(Map<String, dynamic> map) {{')
        lines.append(f'    return {dart_name}(')
        for field in cls.fields:
            lines.append(f'      {field.dart_name}: {self._generate_from_map_expression(field)},')
        lines.append('    );')
        lines.append('  }')
        lines.append('')
        
        # toMap method
        lines.append('  @override')
        lines.append('  Map<String, dynamic> toMap() {')
        lines.append('    return {')
        lines.append(f"      '@type': '{cls.name}',")
        for field in cls.fields:
            lines.append(f"      '{field.name}': {self._generate_to_map_expression(field)},")
        lines.append('    };')
        lines.append('  }')
        
        lines.append('}')
        return lines
    
    def _generate_from_map_expression(self, field: TdField) -> str:
        """Generate the expression to parse a field from a Map."""
        map_key = f"map['{field.name}']"
        
        if field.is_vector:
            inner_type = field.vector_inner_type
            if is_primitive_type(inner_type):
                if inner_type in ('int32', 'int53', 'int64'):
                    return f"({map_key} as List<dynamic>?)?.map((e) => e as int).toList() ?? []"
                elif inner_type == 'string':
                    return f"({map_key} as List<dynamic>?)?.map((e) => e as String).toList() ?? []"
                elif inner_type == 'double':
                    return f"({map_key} as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? []"
                elif inner_type in ('Bool', 'boolTrue', 'boolFalse'):
                    return f"({map_key} as List<dynamic>?)?.map((e) => e as bool).toList() ?? []"
                else:
                    return f"({map_key} as List<dynamic>?)?.map((e) => e as String).toList() ?? []"
            else:
                inner_dart = 'Td' + to_pascal_case(inner_type)
                return f"({map_key} as List<dynamic>?)?.map((e) => {inner_dart}.fromMap(e as Map<String, dynamic>)).toList() ?? []"
        
        if is_primitive_type(field.type_name):
            if field.type_name in ('int32', 'int53', 'int64'):
                if field.is_optional:
                    return f"{map_key} as int?"
                return f"{map_key} as int? ?? 0"
            elif field.type_name == 'string':
                if field.is_optional:
                    return f"{map_key} as String?"
                return f"{map_key} as String? ?? ''"
            elif field.type_name == 'double':
                if field.is_optional:
                    return f"({map_key} as num?)?.toDouble()"
                return f"({map_key} as num?)?.toDouble() ?? 0.0"
            elif field.type_name in ('Bool', 'boolTrue', 'boolFalse'):
                if field.is_optional:
                    return f"{map_key} as bool?"
                return f"{map_key} as bool? ?? false"
            elif field.type_name == 'bytes':
                if field.is_optional:
                    return f"{map_key} as String?"
                return f"{map_key} as String? ?? ''"
        
        # Complex type
        dart_type = 'Td' + to_pascal_case(field.type_name)
        if field.is_optional:
            return f"{map_key} != null ? {dart_type}.fromMap({map_key} as Map<String, dynamic>) : null"
        return f"{dart_type}.fromMap({map_key} as Map<String, dynamic>)"
    
    def _generate_to_map_expression(self, field: TdField) -> str:
        """Generate the expression to convert a field to Map."""
        field_ref = field.dart_name
        
        if field.is_vector:
            inner_type = field.vector_inner_type
            if is_primitive_type(inner_type):
                return field_ref
            else:
                return f"{field_ref}.map((e) => e.toMap()).toList()"
        
        if is_primitive_type(field.type_name):
            return field_ref
        
        # Complex type
        if field.is_optional:
            return f"{field_ref}?.toMap()"
        return f"{field_ref}.toMap()"
    
    def _generate_factory(self) -> List[str]:
        """Generate the factory class for creating objects from type strings."""
        lines = [
            '',
            '/// Factory class for creating TdObject instances from Maps.',
            'class TdObjectFactory {',
            '  /// Create a TdObject from a Map based on the @type field.',
            '  static TdObject? create(String type, Map<String, dynamic> map) {',
            '    switch (type) {',
        ]
        
        for cls in sorted(self.parser.classes.values(), key=lambda x: x.name):
            dart_name = cls.dart_name
            lines.append(f"      case '{cls.name}':")
            lines.append(f"        return {dart_name}.fromMap(map);")
        
        lines.append('      default:')
        lines.append('        return null;')
        lines.append('    }')
        lines.append('  }')
        lines.append('}')
        
        return lines
    
    def _generate_functions(self) -> str:
        """Generate TDLib function request classes."""
        lines = [
            '// AUTO-GENERATED FILE - DO NOT MODIFY',
            f'// Generated from td_api.tl on {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
            '',
            "import 'td_base.dart';",
            "import 'td_objects.dart';",
            '',
        ]
        
        for func in sorted(self.parser.functions.values(), key=lambda x: x.name):
            lines.extend(self._generate_function_class(func))
            lines.append('')
        
        return '\n'.join(lines)
    
    def _generate_function_class(self, func: TdFunction) -> List[str]:
        """Generate a function request class."""
        dart_name = func.dart_name
        
        lines = []
        
        # Documentation
        if func.description:
            lines.append(f'/// {escape_dart_string(func.description)}')
        lines.append(f'/// Returns: {func.return_type}')
        
        # Class declaration
        lines.append(f'class {dart_name} extends TdObject {{')
        
        # Fields
        for field in func.fields:
            if field.description:
                lines.append(f'  /// {escape_dart_string(field.description[:100])}')
            lines.append(f'  final {field.dart_type} {field.dart_name};')
        
        lines.append('')
        
        # Constructor
        if func.fields:
            lines.append(f'  const {dart_name}({{')
            for field in func.fields:
                required = '' if field.is_optional else 'required '
                lines.append(f'    {required}this.{field.dart_name},')
            lines.append('  });')
        else:
            lines.append(f'  const {dart_name}();')
        
        lines.append('')
        
        # tdType getter
        lines.append('  @override')
        lines.append(f"  String get tdType => '{func.name}';")
        lines.append('')
        
        # toMap method
        lines.append('  @override')
        lines.append('  Map<String, dynamic> toMap() {')
        lines.append('    return {')
        lines.append(f"      '@type': '{func.name}',")
        for field in func.fields:
            lines.append(f"      '{field.name}': {self._generate_to_map_expression(field)},")
        lines.append('    };')
        lines.append('  }')
        
        lines.append('}')
        return lines
    
    def _generate_barrel(self) -> str:
        """Generate the barrel export file."""
        return f'''// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

/// TDLib API types and utilities for Dart.
/// 
/// This library provides strongly-typed Dart classes for all TDLib types,
/// with efficient fromMap/toMap methods optimized for use in isolates.

export 'td_base.dart';
export 'td_event_type.dart';
export 'td_objects.dart';
export 'td_functions.dart';
'''


# =============================================================================
# MAIN
# =============================================================================

def main():
    if len(sys.argv) < 2:
        print("Usage: python td_api_generator.py <path_to_td_api.tl> [output_directory]")
        print("Example: python tools/td_api_generator.py td_api.tl lib/core/tdlib/generated/")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else 'lib/core/tdlib/generated/'
    
    if not os.path.exists(input_file):
        print(f"❌ Error: Input file '{input_file}' not found")
        sys.exit(1)
    
    print(f"🔧 TDLib API Code Generator")
    print(f"   Input:  {input_file}")
    print(f"   Output: {output_dir}")
    print()
    
    # Parse
    print("📖 Parsing td_api.tl...")
    parser = TdApiParser()
    parser.parse_file(input_file)
    print(f"   Found {len(parser.classes)} classes and {len(parser.functions)} functions")
    print(f"   Found {len(parser.abstract_types)} abstract types")
    print()
    
    # Generate
    print("✍️  Generating Dart code...")
    generator = DartCodeGenerator(parser)
    generator.generate_all(output_dir)
    print()
    
    print("🎉 Done! Don't forget to run 'dart format' on the generated files.")


if __name__ == '__main__':
    main()
