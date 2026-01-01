// TDLib API Code Generator for Dart
// Generates Dart data classes from td_api.tl schema file.
//
// Usage:
//   dart run tools/td_api_generator.dart [path_to_td_api.tl] [output_directory]
//
// Example:
//   dart run tools/td_api_generator.dart td_api.tl lib/core/tdlib/generated/

// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:io';

// =============================================================================
// TYPE MAPPINGS
// =============================================================================

/// TDLib primitive types to Dart types
const primitiveTypeMap = {
  'double': 'double',
  'string': 'String',
  'int32': 'int',
  'int53': 'int',
  'int64': 'int',
  'bytes': 'String',
  'Bool': 'bool',
  'boolFalse': 'bool',
  'boolTrue': 'bool',
};

/// Reserved Dart keywords
const dartKeywords = {
  'abstract',
  'as',
  'assert',
  'async',
  'await',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'covariant',
  'default',
  'deferred',
  'do',
  'dynamic',
  'else',
  'enum',
  'export',
  'extends',
  'extension',
  'external',
  'factory',
  'false',
  'final',
  'finally',
  'for',
  'Function',
  'get',
  'hide',
  'if',
  'implements',
  'import',
  'in',
  'interface',
  'is',
  'late',
  'library',
  'mixin',
  'new',
  'null',
  'on',
  'operator',
  'part',
  'required',
  'rethrow',
  'return',
  'set',
  'show',
  'static',
  'super',
  'switch',
  'sync',
  'this',
  'throw',
  'true',
  'try',
  'typedef',
  'var',
  'void',
  'while',
  'with',
  'yield',
};

// =============================================================================
// DATA STRUCTURES
// =============================================================================

class TdField {
  final String name;
  final String typeName;
  final String description;
  final bool isOptional;
  final bool isVector;
  final String vectorInnerType;

  TdField({
    required this.name,
    required this.typeName,
    this.description = '',
    this.isOptional = false,
    this.isVector = false,
    this.vectorInnerType = '',
  });

  String get dartName {
    var n = toCamelCase(name);
    if (n.startsWith('param')) {
      n = n.length > 5 ? n[5].toLowerCase() + n.substring(6) : n;
    }
    if (dartKeywords.contains(n)) {
      return '${n}_';
    }
    return n;
  }

  String get dartType {
    String baseType;
    if (isVector) {
      final inner = getDartType(vectorInnerType);
      baseType = 'List<$inner>';
    } else {
      baseType = getDartType(typeName);
    }
    return isOptional ? '$baseType?' : baseType;
  }
}

class TdClass {
  final String name;
  final String parentType;
  final List<TdField> fields;
  final String description;
  bool isAbstract;

  TdClass({
    required this.name,
    required this.parentType,
    List<TdField>? fields,
    this.description = '',
    this.isAbstract = false,
  }) : fields = fields ?? [];

  String get dartName => 'Td${toPascalCase(name)}';

  String get parentDartName {
    // If parentType is empty, or we're self-referencing (TL uses different casing)
    // extend TdObject directly instead of extending ourselves
    // Note: TL names are camelCase but return types are PascalCase, so compare lowercase
    if (parentType.isEmpty || parentType.toLowerCase() == name.toLowerCase()) {
      return 'TdObject';
    }
    return 'Td${toPascalCase(parentType)}';
  }
}

class TdFunction {
  final String name;
  final String returnType;
  final List<TdField> fields;
  final String description;

  TdFunction({
    required this.name,
    required this.returnType,
    List<TdField>? fields,
    this.description = '',
  }) : fields = fields ?? [];

  String get dartName => 'Td${toPascalCase(name)}';
}

// =============================================================================
// HELPER FUNCTIONS
// =============================================================================

String toCamelCase(String snakeStr) {
  final parts = snakeStr.split('_');
  if (parts.isEmpty) return snakeStr;
  return parts[0] +
      parts
          .skip(1)
          .map((p) => p.isEmpty ? '' : p[0].toUpperCase() + p.substring(1))
          .join();
}

String toPascalCase(String snakeStr) {
  final parts = snakeStr.split('_');
  return parts
      .map((p) => p.isEmpty ? '' : p[0].toUpperCase() + p.substring(1))
      .join();
}

String getDartType(String tdType) {
  if (primitiveTypeMap.containsKey(tdType)) {
    return primitiveTypeMap[tdType]!;
  }

  final vectorMatch = RegExp(r'vector<(.+)>').firstMatch(tdType);
  if (vectorMatch != null) {
    final inner = getDartType(vectorMatch.group(1)!);
    return 'List<$inner>';
  }

  return 'Td${toPascalCase(tdType)}';
}

bool isPrimitiveType(String typeName) => primitiveTypeMap.containsKey(typeName);

String escapeDartString(String s) {
  return s
      .replaceAll('\\', '\\\\')
      .replaceAll("'", "\\'")
      .replaceAll('\n', '\\n');
}

// =============================================================================
// PARSER
// =============================================================================

class TdApiParser {
  final Map<String, TdClass> classes = {};
  final Map<String, TdFunction> functions = {};
  final Set<String> abstractTypes = {};
  final Map<String, List<String>> typeHierarchy = {};

  void parseFile(String filepath) {
    final content = File(filepath).readAsStringSync();
    _parseContent(content);
    _buildTypeHierarchy();
    _markAbstractTypes();
  }

  void _parseContent(String content) {
    final lines = content.split('\n');
    var currentDescription = '';
    final fieldDescriptions = <String, String>{};
    var inFunctionsSection = false;

    for (var line in lines) {
      line = line.trim();

      if (line.isEmpty) continue;

      if (line == '---functions---') {
        inFunctionsSection = true;
        currentDescription = '';
        fieldDescriptions.clear();
        continue;
      }

      // Skip type definitions
      if (line.startsWith('double ?') || line.startsWith('string ?')) continue;
      if (line.startsWith('int32 =') ||
          line.startsWith('int53 =') ||
          line.startsWith('int64 =')) continue;
      if (line.startsWith('bytes =') ||
          line.startsWith('boolFalse') ||
          line.startsWith('boolTrue')) continue;
      if (line.startsWith('vector {')) continue;

      // Abstract class marker
      if (line.startsWith('//@class')) {
        final match =
            RegExp(r'//@class\s+(\w+)\s+@description\s+(.+)').firstMatch(line);
        if (match != null) {
          abstractTypes.add(match.group(1)!);
        }
        continue;
      }

      // Description
      if (line.startsWith('//@description')) {
        final descMatch = RegExp(r'//@description\s+(.+)').firstMatch(line);
        if (descMatch != null) {
          currentDescription = descMatch.group(1)!;
          final fieldMatches = RegExp(r'@(\w+)\s+([^@]+)').allMatches(line);
          for (final fm in fieldMatches) {
            if (fm.group(1) != 'description') {
              fieldDescriptions[fm.group(1)!] = fm.group(2)!.trim();
            }
          }
        }
        continue;
      }

      // Field descriptions
      if (line.startsWith('//@') &&
          !line.startsWith('//@description') &&
          !line.startsWith('//@class')) {
        final fieldMatches = RegExp(r'@(\w+)\s+([^@]+)').allMatches(line);
        for (final fm in fieldMatches) {
          fieldDescriptions[fm.group(1)!] = fm.group(2)!.trim();
        }
        continue;
      }

      // Continuation comments
      if (line.startsWith('//-')) {
        currentDescription += ' ${line.substring(3).trim()}';
        continue;
      }

      // Skip other comments
      if (line.startsWith('//')) continue;

      // Parse definition
      if (line.contains('=') && !line.startsWith('//')) {
        _parseDefinition(line, currentDescription, Map.from(fieldDescriptions),
            inFunctionsSection);
        currentDescription = '';
        fieldDescriptions.clear();
      }
    }
  }

  void _parseDefinition(String line, String description,
      Map<String, String> fieldDescs, bool isFunction) {
    line = line.replaceAll(';', '').trim();
    final parts = line.split('=');
    if (parts.length != 2) return;

    final leftPart = parts[0].trim();
    final returnType = parts[1].trim();

    final tokens = leftPart.split(RegExp(r'\s+'));
    if (tokens.isEmpty) return;

    final name = tokens[0];
    final fields = <TdField>[];

    for (var i = 1; i < tokens.length; i++) {
      final token = tokens[i];
      if (token.contains(':')) {
        final colonIndex = token.indexOf(':');
        var fieldName = token.substring(0, colonIndex);
        final fieldType = token.substring(colonIndex + 1);

        if (fieldName.startsWith('param_')) {
          fieldName = fieldName.substring(6);
        }

        final field =
            _parseField(fieldName, fieldType, fieldDescs[fieldName] ?? '');
        if (field != null) fields.add(field);
      }
    }

    if (isFunction) {
      functions[name] = TdFunction(
        name: name,
        returnType: returnType,
        fields: fields,
        description: description,
      );
    } else {
      classes[name] = TdClass(
        name: name,
        parentType: returnType,
        fields: fields,
        description: description,
      );
    }
  }

  TdField? _parseField(String name, String typeStr, String description) {
    var isVector = typeStr.startsWith('vector<');
    var vectorInner = '';
    var actualType = typeStr;

    if (isVector) {
      final match = RegExp(r'vector<(.+)>').firstMatch(typeStr);
      if (match != null) {
        vectorInner = match.group(1)!;
        actualType = vectorInner;
      }
    }

    final isOptional = !isPrimitiveType(actualType) && !isVector;

    return TdField(
      name: name,
      typeName: actualType,
      description: description,
      isOptional: isOptional,
      isVector: isVector,
      vectorInnerType: vectorInner,
    );
  }

  void _buildTypeHierarchy() {
    for (final cls in classes.values) {
      final parent = cls.parentType;
      typeHierarchy.putIfAbsent(parent, () => []).add(cls.name);
    }
  }

  void _markAbstractTypes() {
    for (final entry in typeHierarchy.entries) {
      if (entry.value.length > 1) {
        abstractTypes.add(entry.key);
      }
    }
  }
}

// =============================================================================
// CODE GENERATOR
// =============================================================================

class DartCodeGenerator {
  final TdApiParser parser;

  DartCodeGenerator(this.parser);

  void generateAll(String outputDir) {
    Directory(outputDir).createSync(recursive: true);

    _writeFile(outputDir, 'td_base.dart', _generateBase());
    _writeFile(outputDir, 'td_event_type.dart', _generateEventTypeEnum());
    _writeFile(outputDir, 'td_objects.dart', _generateObjects());
    _writeFile(outputDir, 'td_functions.dart', _generateFunctions());
    _writeFile(outputDir, 'tdlib.dart', _generateBarrel());

    print(
        '✅ Generated ${parser.classes.length} classes and ${parser.functions.length} functions');
  }

  void _writeFile(String outputDir, String filename, String content) {
    final filepath = '$outputDir/$filename';
    File(filepath).writeAsStringSync(content);
    print('  📄 $filename');
  }

  String _generateBase() {
    final now = DateTime.now();
    return '''// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on ${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}

/// Base class for all TDLib objects.
abstract class TdObject {
  /// The TDLib type string (e.g., "user", "message")
  String get tdType;

  /// Convert this object to a Map for JSON serialization.
  Map<String, dynamic> toMap();
}
''';
  }

  String _generateEventTypeEnum() {
    final now = DateTime.now();
    final buf = StringBuffer();
    buf.writeln('// AUTO-GENERATED FILE - DO NOT MODIFY');
    buf.writeln(
        '// Generated from td_api.tl on ${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}');
    buf.writeln();
    buf.writeln('/// Enum representing all TDLib event/object types.');
    buf.writeln('enum TdEventType {');

    final sortedTypes = parser.classes.keys.toList()..sort();
    for (final typeName in sortedTypes) {
      final dartEnum = toCamelCase(typeName);
      buf.writeln('  $dartEnum,');
    }
    buf.writeln('  unknown,');
    buf.writeln('}');
    buf.writeln();

    // Extension
    buf.writeln('extension TdEventTypeExtension on String {');
    buf.writeln('  TdEventType toTdEventType() {');
    buf.writeln('    return _typeStringToEnum[this] ?? TdEventType.unknown;');
    buf.writeln('  }');
    buf.writeln('}');
    buf.writeln();

    // Lookup map
    buf.writeln('const Map<String, TdEventType> _typeStringToEnum = {');
    for (final typeName in sortedTypes) {
      final dartEnum = toCamelCase(typeName);
      buf.writeln("  '$typeName': TdEventType.$dartEnum,");
    }
    buf.writeln('};');
    buf.writeln();

    // Reverse map
    buf.writeln('const Map<TdEventType, String> tdEventTypeToString = {');
    for (final typeName in sortedTypes) {
      final dartEnum = toCamelCase(typeName);
      buf.writeln("  TdEventType.$dartEnum: '$typeName',");
    }
    buf.writeln("  TdEventType.unknown: 'unknown',");
    buf.writeln('};');

    return buf.toString();
  }

  String _generateObjects() {
    final now = DateTime.now();
    final buf = StringBuffer();
    buf.writeln('// AUTO-GENERATED FILE - DO NOT MODIFY');
    buf.writeln(
        '// Generated from td_api.tl on ${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}');
    buf.writeln();
    buf.writeln("import 'td_base.dart';");
    buf.writeln();

    // Abstract classes - collect subtypes for each
    final abstractClasses = <String>{};
    final abstractToSubtypes = <String, List<String>>{};
    for (final cls in parser.classes.values) {
      if (parser.abstractTypes.contains(cls.parentType) &&
          cls.parentType != cls.name) {
        abstractClasses.add(cls.parentType);
        abstractToSubtypes.putIfAbsent(cls.parentType, () => []).add(cls.name);
      }
    }

    for (final abstractName in abstractClasses.toList()..sort()) {
      final subtypes = abstractToSubtypes[abstractName] ?? [];
      buf.writeln(_generateAbstractClass(abstractName, subtypes));
      buf.writeln();
    }

    // Concrete classes
    final sortedClasses = parser.classes.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    for (final cls in sortedClasses) {
      buf.writeln(_generateClass(cls, abstractClasses));
      buf.writeln();
    }

    // Factory
    buf.writeln(_generateFactory());

    return buf.toString();
  }

  String _generateAbstractClass(String name, List<String> concreteSubtypes) {
    final dartName = 'Td${toPascalCase(name)}';
    final buf = StringBuffer();

    buf.writeln('abstract class $dartName extends TdObject {');
    buf.writeln('  @override');
    buf.writeln('  String get tdType;');
    buf.writeln('  ');
    buf.writeln('  @override');
    buf.writeln('  Map<String, dynamic> toMap();');
    buf.writeln();
    buf.writeln('  /// Factory to create correct subtype from map');
    buf.writeln('  static $dartName? fromMap(Map<String, dynamic>? map) {');
    buf.writeln('    if (map == null) return null;');
    buf.writeln("    final type = map['@type'] as String?;");
    buf.writeln('    if (type == null) return null;');
    buf.writeln('    switch (type) {');

    for (final subtype in concreteSubtypes) {
      final subtypeDartName = 'Td${toPascalCase(subtype)}';
      buf.writeln("      case '$subtype':");
      buf.writeln('        return $subtypeDartName.fromMap(map);');
    }

    buf.writeln('      default:');
    buf.writeln('        return null;');
    buf.writeln('    }');
    buf.writeln('  }');
    buf.writeln('}');

    return buf.toString();
  }

  String _generateClass(TdClass cls, Set<String> abstractClasses) {
    final buf = StringBuffer();
    final dartName = cls.dartName;
    var parentName = cls.parentDartName;

    if (abstractClasses.contains(cls.parentType)) {
      parentName = 'Td${toPascalCase(cls.parentType)}';
    }

    if (cls.description.isNotEmpty) {
      buf.writeln(
          '/// ${escapeDartString(cls.description.length > 100 ? cls.description.substring(0, 100) + '...' : cls.description)}');
    }
    buf.writeln('class $dartName extends $parentName {');

    // Fields
    for (final field in cls.fields) {
      buf.writeln('  final ${field.dartType} ${field.dartName};');
    }
    if (cls.fields.isNotEmpty) buf.writeln();

    // Constructor
    if (cls.fields.isNotEmpty) {
      buf.writeln('  $dartName({');
      for (final field in cls.fields) {
        final req = field.isOptional ? '' : 'required ';
        buf.writeln('    ${req}this.${field.dartName},');
      }
      buf.writeln('  });');
    } else {
      buf.writeln('  $dartName();');
    }
    buf.writeln();

    // tdType
    buf.writeln('  @override');
    buf.writeln("  String get tdType => '${cls.name}';");
    buf.writeln();

    // fromMap
    buf.writeln('  factory $dartName.fromMap(Map<String, dynamic> map) {');
    buf.writeln('    return $dartName(');
    for (final field in cls.fields) {
      buf.writeln('      ${field.dartName}: ${_generateFromMapExpr(field)},');
    }
    buf.writeln('    );');
    buf.writeln('  }');
    buf.writeln();

    // toMap
    buf.writeln('  @override');
    buf.writeln('  Map<String, dynamic> toMap() {');
    buf.writeln('    return {');
    buf.writeln("      '@type': '${cls.name}',");
    for (final field in cls.fields) {
      buf.writeln("      '${field.name}': ${_generateToMapExpr(field)},");
    }
    buf.writeln('    };');
    buf.writeln('  }');

    buf.writeln('}');
    return buf.toString();
  }

  String _generateFromMapExpr(TdField field) {
    final mapKey = "map['${field.name}']";

    if (field.isVector) {
      final inner = field.vectorInnerType;
      if (isPrimitiveType(inner)) {
        if (['int32', 'int53', 'int64'].contains(inner)) {
          return "($mapKey as List<dynamic>?)?.map((e) => e as int).toList() ?? []";
        } else if (inner == 'string') {
          return "($mapKey as List<dynamic>?)?.map((e) => e as String).toList() ?? []";
        } else if (inner == 'double') {
          return "($mapKey as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? []";
        } else if (['Bool', 'boolTrue', 'boolFalse'].contains(inner)) {
          return "($mapKey as List<dynamic>?)?.map((e) => e as bool).toList() ?? []";
        } else {
          return "($mapKey as List<dynamic>?)?.map((e) => e as String).toList() ?? []";
        }
      } else {
        // Check if inner type is also a vector (nested vectors like vector<vector<pageBlockTableCell>>)
        final nestedVectorMatch = RegExp(r'vector<(.+)>').firstMatch(inner);
        if (nestedVectorMatch != null) {
          // Nested vector - need to map inner vector too
          final innerInner = nestedVectorMatch.group(1)!;
          if (isPrimitiveType(innerInner)) {
            // Nested vector of primitives
            return "($mapKey as List<dynamic>?)?.map((row) => (row as List<dynamic>).map((e) => e as ${getDartType(innerInner)}).toList()).toList() ?? []";
          } else {
            final innerInnerDart = 'Td${toPascalCase(innerInner)}';
            return "($mapKey as List<dynamic>?)?.map((row) => (row as List<dynamic>).map((e) => $innerInnerDart.fromMap(e as Map<String, dynamic>)).whereType<$innerInnerDart>().toList()).toList() ?? []";
          }
        } else {
          final innerDart = 'Td${toPascalCase(inner)}';
          // Use whereType to filter out null values from fromMap and ensure non-nullable list
          return "($mapKey as List<dynamic>?)?.map((e) => $innerDart.fromMap(e as Map<String, dynamic>)).whereType<$innerDart>().toList() ?? []";
        }
      }
    }

    if (isPrimitiveType(field.typeName)) {
      if (['int32', 'int53', 'int64'].contains(field.typeName)) {
        return field.isOptional ? "$mapKey as int?" : "$mapKey as int? ?? 0";
      } else if (field.typeName == 'string') {
        return field.isOptional
            ? "$mapKey as String?"
            : "$mapKey as String? ?? ''";
      } else if (field.typeName == 'double') {
        return field.isOptional
            ? "($mapKey as num?)?.toDouble()"
            : "($mapKey as num?)?.toDouble() ?? 0.0";
      } else if (['Bool', 'boolTrue', 'boolFalse'].contains(field.typeName)) {
        return field.isOptional
            ? "$mapKey as bool?"
            : "$mapKey as bool? ?? false";
      } else if (field.typeName == 'bytes') {
        return field.isOptional
            ? "$mapKey as String?"
            : "$mapKey as String? ?? ''";
      }
    }

    final dartType = 'Td${toPascalCase(field.typeName)}';
    if (field.isOptional) {
      return "$mapKey != null ? $dartType.fromMap($mapKey as Map<String, dynamic>) : null";
    }
    return "$dartType.fromMap($mapKey as Map<String, dynamic>)";
  }

  String _generateToMapExpr(TdField field) {
    final ref = field.dartName;

    if (field.isVector) {
      final inner = field.vectorInnerType;
      if (isPrimitiveType(inner)) {
        return ref;
      }
      // Check if inner type is also a vector (nested vectors like vector<vector<inlineKeyboardButton>>)
      final nestedVectorMatch = RegExp(r'vector<(.+)>').firstMatch(inner);
      if (nestedVectorMatch != null) {
        final innerInner = nestedVectorMatch.group(1)!;
        if (isPrimitiveType(innerInner)) {
          // Nested vector of primitives - just return as is
          return ref;
        } else {
          // Nested vector of objects - need to map both levels
          return "$ref.map((row) => row.map((e) => e.toMap()).toList()).toList()";
        }
      }
      return "$ref.map((e) => e.toMap()).toList()";
    }

    if (isPrimitiveType(field.typeName)) {
      return ref;
    }

    return field.isOptional ? "$ref?.toMap()" : "$ref.toMap()";
  }

  String _generateFactory() {
    final buf = StringBuffer();
    buf.writeln('/// Factory for creating TdObject instances from Maps.');
    buf.writeln('class TdObjectFactory {');
    buf.writeln(
        '  static TdObject? create(String type, Map<String, dynamic> map) {');
    buf.writeln('    switch (type) {');

    final sortedClasses = parser.classes.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    for (final cls in sortedClasses) {
      buf.writeln("      case '${cls.name}':");
      buf.writeln('        return ${cls.dartName}.fromMap(map);');
    }

    buf.writeln('      default:');
    buf.writeln('        return null;');
    buf.writeln('    }');
    buf.writeln('  }');
    buf.writeln('}');

    return buf.toString();
  }

  String _generateFunctions() {
    final now = DateTime.now();
    final buf = StringBuffer();
    buf.writeln('// AUTO-GENERATED FILE - DO NOT MODIFY');
    buf.writeln(
        '// Generated from td_api.tl on ${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}');
    buf.writeln();
    buf.writeln("import 'td_base.dart';");
    buf.writeln("import 'td_objects.dart';");
    buf.writeln();

    final sortedFuncs = parser.functions.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    for (final func in sortedFuncs) {
      buf.writeln(_generateFunctionClass(func));
      buf.writeln();
    }

    return buf.toString();
  }

  String _generateFunctionClass(TdFunction func) {
    final buf = StringBuffer();
    final dartName = func.dartName;

    if (func.description.isNotEmpty) {
      buf.writeln(
          '/// ${escapeDartString(func.description.length > 100 ? func.description.substring(0, 100) + '...' : func.description)}');
    }
    buf.writeln('class $dartName extends TdObject {');

    for (final field in func.fields) {
      buf.writeln('  final ${field.dartType} ${field.dartName};');
    }
    if (func.fields.isNotEmpty) buf.writeln();

    if (func.fields.isNotEmpty) {
      buf.writeln('  $dartName({');
      for (final field in func.fields) {
        final req = field.isOptional ? '' : 'required ';
        buf.writeln('    ${req}this.${field.dartName},');
      }
      buf.writeln('  });');
    } else {
      buf.writeln('  $dartName();');
    }
    buf.writeln();

    buf.writeln('  @override');
    buf.writeln("  String get tdType => '${func.name}';");
    buf.writeln();

    buf.writeln('  @override');
    buf.writeln('  Map<String, dynamic> toMap() {');
    buf.writeln('    return {');
    buf.writeln("      '@type': '${func.name}',");
    for (final field in func.fields) {
      buf.writeln("      '${field.name}': ${_generateToMapExpr(field)},");
    }
    buf.writeln('    };');
    buf.writeln('  }');

    buf.writeln('}');
    return buf.toString();
  }

  String _generateBarrel() {
    final now = DateTime.now();
    return '''// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on ${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}

export 'td_base.dart';
export 'td_event_type.dart';
export 'td_objects.dart';
export 'td_functions.dart';
''';
  }
}

// =============================================================================
// MAIN
// =============================================================================

void main(List<String> args) {
  if (args.isEmpty) {
    print(
        'Usage: dart run tools/td_api_generator.dart <path_to_td_api.tl> [output_directory]');
    print(
        'Example: dart run tools/td_api_generator.dart td_api.tl lib/core/tdlib/generated/');
    exit(1);
  }

  final inputFile = args[0];
  final outputDir = args.length > 1 ? args[1] : 'lib/core/tdlib/generated/';

  if (!File(inputFile).existsSync()) {
    print('❌ Error: Input file "$inputFile" not found');
    exit(1);
  }

  print('🔧 TDLib API Code Generator (Dart)');
  print('   Input:  $inputFile');
  print('   Output: $outputDir');
  print('');

  print('📖 Parsing td_api.tl...');
  final parser = TdApiParser();
  parser.parseFile(inputFile);
  print(
      '   Found ${parser.classes.length} classes and ${parser.functions.length} functions');
  print('   Found ${parser.abstractTypes.length} abstract types');
  print('');

  print('✍️  Generating Dart code...');
  final generator = DartCodeGenerator(parser);
  generator.generateAll(outputDir);
  print('');

  print("🎉 Done! Run 'dart format $outputDir' to format the generated files.");
}
