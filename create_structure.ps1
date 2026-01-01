# create_structure.ps1
Write-Host "🚀 Creating AnnoGram Folder Structure..." -ForegroundColor Green

# Hapus file default yang tidak diperlukan
Remove-Item -Path "lib\main.dart" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "test\widget_test.dart" -Force -ErrorAction SilentlyContinue

Write-Host "📁 Creating directory structure..." -ForegroundColor Yellow

# Buat semua folder
$folders = @(
    # Core
    "lib\core\constants",
    "lib\core\theme", 
    "lib\core\utils\extensions",
    "lib\core\utils\helpers",
    "lib\core\utils\validators",
    "lib\core\services",
    
    # Data
    "lib\data\models\chat",
    "lib\data\models\call",
    "lib\data\mock_data",
    "lib\data\repositories\interfaces", 
    "lib\data\repositories\mock",
    
    # Domain
    "lib\domain\entities",
    "lib\domain\repositories",
    
    # Presentation
    "lib\presentation\providers",
    "lib\presentation\routing",
    "lib\presentation\widgets\common\app_bar",
    "lib\presentation\widgets\common\buttons",
    "lib\presentation\widgets\common\loaders",
    "lib\presentation\widgets\common\dialogs",
    "lib\presentation\widgets\chat",
    "lib\presentation\widgets\call", 
    "lib\presentation\widgets\profile",
    "lib\presentation\screens\auth",
    "lib\presentation\screens\main_app\tabs",
    "lib\presentation\screens\chat",
    "lib\presentation\screens\call",
    "lib\presentation\screens\profile",
    "lib\presentation\screens\common",
    
    # Assets
    "assets\images\icons",
    "assets\images\backgrounds", 
    "assets\images\emojis",
    "assets\animations",
    "assets\fonts",
    
    # Development
    "scripts",
    "docs",
    "tools",
    "test\widget_test",
    "test\mock_data"
)

# Buat folder
foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
    Write-Host "📁 Created: $folder" -ForegroundColor Gray
}

Write-Host "`n📄 Creating empty Dart files..." -ForegroundColor Yellow

# Buat file Dart kosong
$files = @(
    # Main
    "lib\main.dart",
    
    # Core Constants
    "lib\core\constants\app_constants.dart",
    "lib\core\constants\route_names.dart",
    
    # Core Theme
    "lib\core\theme\app_theme.dart",
    "lib\core\theme\colors.dart",
    "lib\core\theme\text_styles.dart",
    "lib\core\theme\dimensions.dart",
    
    # Core Utils - Extensions
    "lib\core\utils\extensions\context_extension.dart",
    "lib\core\utils\extensions\string_extension.dart", 
    "lib\core\utils\extensions\datetime_extension.dart",
    
    # Core Utils - Helpers
    "lib\core\utils\helpers\dialog_helper.dart",
    "lib\core\utils\helpers\snackbar_helper.dart",
    "lib\core\utils\helpers\platform_helper.dart",
    
    # Core Utils - Validators
    "lib\core\utils\validators\input_validators.dart",
    
    # Core Services
    "lib\core\services\local_storage.dart",
    "lib\core\services\notification_service.dart",
    
    # Data Models - Chat
    "lib\data\models\chat\chat_model.dart",
    "lib\data\models\chat\message_model.dart",
    "lib\data\models\chat\user_model.dart",
    "lib\data\models\chat\group_model.dart",
    
    # Data Models - Call
    "lib\data\models\call\call_model.dart",
    "lib\data\models\call\call_history_model.dart",
    
    # Mock Data
    "lib\data\mock_data\mock_chat_data.dart",
    "lib\data\mock_data\mock_user_data.dart",
    "lib\data\mock_data\mock_call_data.dart",
    "lib\data\mock_data\mock_group_data.dart",
    
    # Repository Interfaces
    "lib\data\repositories\interfaces\chat_repository_interface.dart",
    "lib\data\repositories\interfaces\auth_repository_interface.dart", 
    "lib\data\repositories\interfaces\call_repository_interface.dart",
    
    # Mock Repositories
    "lib\data\repositories\mock\mock_chat_repository.dart",
    "lib\data\repositories\mock\mock_auth_repository.dart",
    "lib\data\repositories\mock\mock_call_repository.dart",
    
    # Domain Entities
    "lib\domain\entities\chat_entity.dart",
    "lib\domain\entities\user_entity.dart",
    
    # Domain Repositories  
    "lib\domain\repositories\chat_repository.dart",
    "lib\domain\repositories\auth_repository.dart",
    "lib\domain\repositories\call_repository.dart",
    
    # Presentation Providers
    "lib\presentation\providers\auth_provider.dart",
    "lib\presentation\providers\chat_provider.dart",
    "lib\presentation\providers\call_provider.dart",
    "lib\presentation\providers\theme_provider.dart",
    "lib\presentation\providers\app_provider.dart",
    
    # Presentation Routing
    "lib\presentation\routing\app_router.dart",
    "lib\presentation\routing\route_generator.dart",
    "lib\presentation\routing\navigation_service.dart",
    
    # Presentation Widgets - Common
    "lib\presentation\widgets\common\app_bar\custom_app_bar.dart",
    "lib\presentation\widgets\common\app_bar\chat_app_bar.dart",
    "lib\presentation\widgets\common\buttons\primary_button.dart",
    "lib\presentation\widgets\common\buttons\icon_button.dart",
    "lib\presentation\widgets\common\buttons\floating_action_button.dart",
    "lib\presentation\widgets\common\loaders\shimmer_loader.dart",
    "lib\presentation\widgets\common\loaders\progress_indicator.dart",
    "lib\presentation\widgets\common\dialogs\confirmation_dialog.dart",
    "lib\presentation\widgets\common\dialogs\info_dialog.dart",
    
    # Presentation Widgets - Chat
    "lib\presentation\widgets\chat\chat_list_item.dart",
    "lib\presentation\widgets\chat\message_bubble.dart", 
    "lib\presentation\widgets\chat\message_input.dart",
    "lib\presentation\widgets\chat\typing_indicator.dart",
    "lib\presentation\widgets\chat\chat_avatar.dart",
    
    # Presentation Widgets - Call
    "lib\presentation\widgets\call\call_button.dart",
    "lib\presentation\widgets\call\call_screen_header.dart",
    "lib\presentation\widgets\call\participant_grid.dart",
    
    # Presentation Widgets - Profile
    "lib\presentation\widgets\profile\profile_picture.dart",
    "lib\presentation\widgets\profile\status_indicator.dart",
    
    # Presentation Screens - Auth
    "lib\presentation\screens\auth\login_screen.dart",
    "lib\presentation\screens\auth\otp_screen.dart",
    "lib\presentation\screens\auth\welcome_screen.dart",
    
    # Presentation Screens - Main App
    "lib\presentation\screens\main_app\main_screen.dart",
    "lib\presentation\screens\main_app\home_screen.dart",
    "lib\presentation\screens\main_app\tabs\chats_tab.dart",
    "lib\presentation\screens\main_app\tabs\calls_tab.dart", 
    "lib\presentation\screens\main_app\tabs\profile_tab.dart",
    
    # Presentation Screens - Chat
    "lib\presentation\screens\chat\chat_list_screen.dart",
    "lib\presentation\screens\chat\chat_screen.dart",
    "lib\presentation\screens\chat\group_info_screen.dart",
    "lib\presentation\screens\chat\create_group_screen.dart",
    
    # Presentation Screens - Call
    "lib\presentation\screens\call\call_screen.dart",
    "lib\presentation\screens\call\video_call_screen.dart",
    "lib\presentation\screens\call\group_call_screen.dart",
    "lib\presentation\screens\call\call_history_screen.dart",
    
    # Presentation Screens - Profile
    "lib\presentation\screens\profile\profile_screen.dart",
    "lib\presentation\screens\profile\edit_profile_screen.dart",
    "lib\presentation\screens\profile\settings_screen.dart",
    
    # Presentation Screens - Common
    "lib\presentation\screens\common\error_screen.dart",
    "lib\presentation\screens\common\loading_screen.dart",
    "lib\presentation\screens\common\empty_state_screen.dart"
)

# Buat file kosong
foreach ($file in $files) {
    New-Item -ItemType File -Force -Path $file | Out-Null
    Write-Host "📄 Created: $file" -ForegroundColor Gray
}

Write-Host "`n✅ Structure created successfully!" -ForegroundColor Green
Write-Host "📁 Total folders: $($folders.Count)" -ForegroundColor Yellow  
Write-Host "📄 Total Dart files: $($files.Count)" -ForegroundColor Yellow
Write-Host "`n🚀 Next: Update pubspec.yaml and start coding!" -ForegroundColor Cyan