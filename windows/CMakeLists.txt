# ==============================================================================
# 📄 FILE: windows/CMakeLists.txt
# ==============================================================================

cmake_minimum_required(VERSION 3.14)
project(annogram LANGUAGES CXX)

# Nama output binary aplikasi
set(BINARY_NAME "annogram")

cmake_policy(VERSION 3.14...3.25)

# --- Konfigurasi Build Tipe (Debug/Release) ---
get_property(IS_MULTICONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(IS_MULTICONFIG)
  set(CMAKE_CONFIGURATION_TYPES "Debug;Profile;Release"
    CACHE STRING "" FORCE)
else()
  if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE "Debug" CACHE
      STRING "Flutter build mode" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
      "Debug" "Profile" "Release")
  endif()
endif()

# Setting Linker
set(CMAKE_EXE_LINKER_FLAGS_PROFILE "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
set(CMAKE_C_FLAGS_PROFILE "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_RELEASE}")

# Definisi Unicode
add_definitions(-DUNICODE -D_UNICODE)

# Fungsi Standar Flutter
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_17)
  target_compile_options(${TARGET} PRIVATE /W4 /WX /wd"4100")
  target_compile_options(${TARGET} PRIVATE /EHsc)
  target_compile_definitions(${TARGET} PRIVATE "_HAS_EXCEPTIONS=0")
  target_compile_definitions(${TARGET} PRIVATE "$<$<CONFIG:Debug>:_DEBUG>")
endfunction()

# --- Integrasi Flutter ---
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

# Masuk ke folder Runner (Tempat Target 'annogram' dibuat)
add_subdirectory("runner")

# Plugin Generated
include(flutter/generated_plugins.cmake)

# --- Bagian Instalasi (Penyalinan File ke Output) ---
set(BUILD_BUNDLE_DIR "$<TARGET_FILE_DIR:${BINARY_NAME}>")
set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD 1)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${BUILD_BUNDLE_DIR}" CACHE PATH "..." FORCE)
endif()

set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")

install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
  COMPONENT Runtime)

if(PLUGIN_BUNDLED_LIBRARIES)
  install(FILES "${PLUGIN_BUNDLED_LIBRARIES}"
    DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endif()

set(NATIVE_ASSETS_DIR "${PROJECT_BUILD_DIR}native_assets/windows/")
install(DIRECTORY "${NATIVE_ASSETS_DIR}"
   DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
   COMPONENT Runtime)

set(FLUTTER_ASSET_DIR_NAME "flutter_assets")
install(CODE "
  file(REMOVE_RECURSE \"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
  " COMPONENT Runtime)
install(DIRECTORY "${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
  DESTINATION "${INSTALL_BUNDLE_DATA_DIR}" COMPONENT Runtime)

install(FILES "${AOT_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  CONFIGURATIONS Profile;Release
  COMPONENT Runtime)

# =========================================================
# 🧬 ANNOGRAM: TDLib Binary Integration (Drive R Compatible)
# =========================================================

# 1. Tentukan lokasi file secara absolut berdasarkan folder project saat ini
set(TDLIB_FILE "${CMAKE_CURRENT_SOURCE_DIR}/tdlib/tdjson.dll")

# 2. Print Info Lokasi untuk Debugging
message(STATUS "-------------------------------------------------------")
message(STATUS "🔍 [TDLib Setup] Checking DLL location...")
message(STATUS "   Path: ${TDLIB_FILE}")

# 3. Logika: Cek dulu sebelum Install
if(EXISTS "${TDLIB_FILE}")
    message(STATUS "✅ [TDLib Setup] File FOUND! Adding to installation list.")
    
    # Perintah Install (Hanya jalan jika file ada)
    install(FILES "${TDLIB_FILE}" 
        DESTINATION "${CMAKE_INSTALL_PREFIX}/${INSTALL_BUNDLE_LIB_DIR}" 
        COMPONENT Runtime
    )
else()
    # Jika file tidak ada, beri WARNING (kuning) jangan ERROR (merah)
    message(WARNING "⚠️ [TDLib Setup] File NOT FOUND at the specified path!")
    message(STATUS "   Build will continue, but app might crash if tdjson.dll is missing.")
    message(STATUS "   Please check folder: R:/Projects/annogram/windows/tdlib/")
endif()
message(STATUS "-------------------------------------------------------")
# =========================================================