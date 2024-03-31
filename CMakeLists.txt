cmake_minimum_required( VERSION 3.5 )

if ( EXISTS "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake" )
	set( CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file" )
else()
	message( FATAL_ERROR "Vcpkg wasn't not found, aborting, make sure to git clone this with all submodules!")
endif()

set_property( GLOBAL PROPERTY USE_FOLDERS ON )

set( CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules" "${CMAKE_SOURCE_DIR}/CMakeProjects" )

project( ioquake3 VERSION 1.37 LANGUAGES C ASM )

set( CMAKE_C_STANDARD 23 )

option( DEFAULT_BASEDIR "Extra path to search for baseq3 and such." "" )
option( BUILD_CLIENT "Build the 'ioquake3' client binary." ON )
option( BUILD_SERVER "Build the 'ioq3ded' server binary." ON )
option( BUILD_RENDERER_OPENGL2 "Build the 'ref_gl2' rendering backend." ON )
option( BUILD_AUTOUPDATER "DON'T build unless you mean to!" OFF )
option( BUILD_STANDALONE "Build binaries suited for stand-alone games." OFF )

set( SERVERBIN "ioq3ded" CACHE STRING "Server binary." )
set( CLIENTBIN "ioquake3" CACHE STRING "Client binary." )

option( USE_RENDERER_DLOPEN "Build and use the renderer in a library." OFF )
option( USE_OPENAL "Enable OpenAL support." OFF )
option( USE_OPENAL_DLOPEN "Link with OpenAL at runtime." OFF )
option( USE_CURL "Enable curl download support." OFF )
option( USE_CURL_DLOPEN "Link with libcurl at runtime." OFF )
option( USE_OGG_CODEC "Enable Ogg codec support" OFF )
option( USE_OPUS_CODEC "Enable Vorbi codec support" OFF )
option( USE_VOIP "Enable built-in VoIP support" OFF )
option( USE_MUMBLE "Enable Mumble support" OFF )
option( USE_FREETYPE "Enable WIP Freetype support" OFF )

option( ENABLE_PROFILING "Enable LLVM Profiler" OFF )

# Set the default build type to Release
if( NOT CMAKE_BUILD_TYPE )
  set( CMAKE_BUILD_TYPE Release )
endif()

# Don't define USE_CURL_DLOPEN without USE_CURL that's silly
if( NOT ${USE_CURL} )
  set( USE_CURL_DLOPEN OFF )
endif()

# Don't define USE_OPENAL without USE_OPENAL_DLOPEN that's silly
if( NOT ${USE_OPENAL} )
  set( USE_OPENAL_DLOPEN OFF )
endif()

# Output the selected build type
message( "Current build type is: ${CMAKE_BUILD_TYPE}" )

set_property( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY CMAKE_EXPORT_COMPILE_COMMANDS ON )

# Define the type of CPU and OS Type we're usingy
include( CPUDefine )

# Get the architecture of the current system
# ONLY used for the binaries naming scheme
if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    set( ARCH "x64" )
else()
    set( ARCH "x86" )
endif()

# Yes, it is copied from CPUDefine.cmake
if( APPLE )
	set( OS "macosx" )
else()
	string( TOLOWER "${CMAKE_SYSTEM_NAME}" OS )
endif()

# set the number of jobs to the number of available processor cores
include( ProcessorCount )
ProcessorCount( N )
if( NOT N EQUAL 0 )
  set( CMAKE_BUILD_PARALLEL_LEVEL ${N} )
endif()

find_package( PkgConfig REQUIRED )

# Find and link zlib library
pkg_check_modules( ZLIB REQUIRED zlib )
if ( ZLIB_FOUND )
	include_directories( ${ZLIB_INCLUDE_DIRS} )
	#add_compile_options( ${ZLIB_CFLAGS_OTHER} )
endif()

# Find and link minizip library
pkg_check_modules( MINIZIP REQUIRED minizip )
find_library( MINIZIP_LIBRARY NAMES minizip )
include_directories( ${MINIZIP_INCLUDE_DIRS} )

# Find and link openal-soft library
find_package( OpenAL CONFIG REQUIRED )
if ( OPENAL_FOUND )
	include_directories( ${OPENAL_INCLUDE_DIR} )
endif()

# Find and link SDL2 library
find_package( SDL2 REQUIRED )
pkg_check_modules( SDL2 REQUIRED sdl2 )
include_directories( ${SDL_INCLUDE_DIRS} )
set( SDL2_LIBRARIES SDL2::SDL2 SDL2::SDL2main )

# Find and link Curl library
if ( ${USE_CURL} )
	find_package( CURL REQUIRED )
	if( CURL_FOUND )
		include_directories( ${CURL_INCLUDE_DIR} )
	endif()
endif()

# Find and link Ogg library
if ( ${USE_OGG_CODEC} )
	pkg_check_modules( LIBOGG REQUIRED ogg )
	find_library( LIBOGG_LIBRARIES NAMES ogg )
	include_directories( ${LIBOGG_INCLUDE_DIRS} )
	#add_compile_options( ${LIBOGG_CFLAGS_OTHER} )
endif()

# Find and link vorbis and vorbisfile library
if ( ${USE_OPUS_CODEC} OR ${USE_OGG_CODEC} )
	pkg_check_modules( LIBVORBIS REQUIRED vorbis )
	find_library( LIBVORBIS_LIBRARIES NAMES vorbis )
	#find_library( LIBVORBISENC_LIBRARIES NAMES vorbisenc )
	find_library( LIBVORBISFILE_LIBRARIES NAMES vorbisfile )
	include_directories( ${LIBVORBIS_INCLUDE_DIRS} )
	link_directories( ${LIBVORBIS_LIBRARY_DIRS} )
endif()

# Find and link jpeg library
find_package( JPEG REQUIRED )
if ( JPEG_FOUND )
	include_directories( ${JPEG_INCLUDE_DIRS} )
endif()

# Find and link png library
find_package( PNG REQUIRED )
if ( PNG_FOUND )
	include_directories( ${PNG_INCLUDE_DIRS} )
	add_definitions( ${PNG_DEFINITIONS} )
endif()

# Find and link freetype library
if ( ${USE_FREETYPE} )
	find_package( Freetype REQUIRED )
	include_directories( ${FREETYPE_INCLUDE_DIR} )
endif()

if ( ${USE_OPUS_CODEC} )
	# Find and link Opus library
	pkg_check_modules( OPUS REQUIRED opus )
	include_directories( ${OPUS_INCLUDE_DIRS} )

	# Find and link OpusFile library
	pkg_check_modules( OPUSFILE REQUIRED opusfile )
	include_directories( ${OPUSFILE_INCLUDE_DIRS} )
endif()

# Set the location of the source files
set( SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/code" )

# Set the location of the misc files
set( MISC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/misc" )

# Find all source files recursively in the code directory
file( GLOB_RECURSE SOURCES
    "${SOURCE_DIR}/*.c"
    "${SOURCE_DIR}/*.h"
)

include_directories( HEADER_DIRS
	"${SOURCE_DIR}"
)

if ( CMAKE_COMPILER_IS_GNUCC OR CMAKE_C_COMPILER_ID STREQUAL "Clang" )
    set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-no_lazy_load_dylib" )
    set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fdebug-prefix-map=${CMAKE_SOURCE_DIR}=${CMAKE_BINARY_DIR}" )
	
	check_cxx_compiler_flag( "-fvisibility=hidden" cxx_has_fvisibility )
	if ( NOT cxx_has_fvisibility )
		message( FATAL_ERROR "Compiler does not support -fvisibility" )
	endif()
	add_definitions( -fvisibility=hidden )
endif()

if ( MSVC )
    add_compile_definitions( 
		_CRT_SECURE_NO_WARNINGS
		_WINSOCK_DEPRECATED_NO_WARNINGS
	)

	set( CMAKE_C_FLAGS_RELEASE "/O2 /DNDEBUG /DBOTLIB /Oy /Ob2 /GS /DYNAMICBASE" )
	set( CMAKE_C_FLAGS_DEBUG "/Zi /Od /DDEBUG /DBOTLIB /Oy- /D_FORTIFY_SOURCE=2 /RTC1" )

	# Set the compile options for all targets to include the multi-processor flag
	set( CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded" )
	
	set( CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /GL" ) 
	set( CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /LTCG")

    set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MANIFEST:NO" )
    set( CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /MANIFEST:NO" )
    set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /MANIFEST:NO" )

    # 4244 conversion from 'float' to 'int', possible loss of data
    # 4305 truncation from 'double' to 'float'
    # 4820 padding
    # 5045 spectre instruction
    # 4668 unknown macro definition
    # 4061 explicit switch case enum mention
    # 4242 possible loss of data (convert int to short)
    # 4464 relative include path
    # 4619 warning id is not available
    # 4245 return signed/unsigned conflict
    # 4100 unreferenced formal parameter
    # 4255 invalid function prototype - missing void
    # 4389 comparison signed/unsigned
    set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /wd4267 /wd4244 /wd4305 /wd4820 /wd5045 /wd4668 /wd4061 /wd4242 /wd4464 /wd4619 /wd4245 /wd4100 /wd4255 /wd4389" )
else()
	set( CMAKE_C_FLAGS_RELEASE "-m64 -O3 -DNDEBUG -DBOTLIB -march=native -fomit-frame-pointer -funroll-loops -mtune=native -flto -fno-plt -fstack-protector-strong -fPIE -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security" )
	set( CMAKE_C_FLAGS_DEBUG "-m64 -g -Og -DDEBUG -DBOTLIB -fno-omit-frame-pointer -fno-optimize-sibling-calls -fsanitize=address,undefined -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fno-eliminate-unused-debug-types" )

	# Set the compile options for all targets to include the multi-processor flag
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread" )
	set( CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++" )
endif()

if ( ${BUILD_STANDALONE} )
    add_compile_definitions( STANDALONE )
endif()

# Set the version number
set( PRODUCT_VERSION "1.36" )

add_compile_definitions( PRODUCT_VERSION="${PRODUCT_VERSION}" PRODUCT_DATE=__DATE__ )

# Create CGAME shared library
include( CGame )

# Create GAME shared library
include( Game )

# Create Q3_UI shared library
include( Q3UI )

if ( ${BUILD_RENDERER_OPENGL2} )
	# Create GL2 shared library
	include( refGL2 )
endif()

# Can't use gl1 if we're building the renders has a libraries
if ( ${USE_RENDERER_DLOPEN} )
	# Create GL1 shared library
	include( refGL1 )
endif()

# Create Quake3 executable
include( Quake3 )