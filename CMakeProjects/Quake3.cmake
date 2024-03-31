set( ASSEMBLY_FILES
	${SOURCE_DIR}/asm/ftola.c
	${SOURCE_DIR}/asm/snapvector.c
)

# Configure the header file
configure_file( ${MISC_DIR}/msvc/resource/version.h.in ${SOURCE_DIR}/version.h @ONLY )

# Set the icon file for the target
set( ICON 
	${MISC_DIR}/msvc/resource/win_resource.rc
	${MISC_DIR}/msvc/resource/q3.manifest
	${MISC_DIR}/msvc/resource/resource.h
	${MISC_DIR}/msvc/resource/qe3.ico
)

set( IOQ3_SRC
	${SOURCE_DIR}/botlib/aasfile.h
	${SOURCE_DIR}/botlib/be_aas_bsp.h
	${SOURCE_DIR}/botlib/be_aas_bspq3.c
	${SOURCE_DIR}/botlib/be_aas_cluster.c
	${SOURCE_DIR}/botlib/be_aas_cluster.h
	${SOURCE_DIR}/botlib/be_aas_debug.c
	${SOURCE_DIR}/botlib/be_aas_debug.h
	${SOURCE_DIR}/botlib/be_aas_def.h
	${SOURCE_DIR}/botlib/be_aas_entity.c
	${SOURCE_DIR}/botlib/be_aas_entity.h
	${SOURCE_DIR}/botlib/be_aas_main.c
	${SOURCE_DIR}/botlib/be_aas_main.h
	${SOURCE_DIR}/botlib/be_aas_file.c
	${SOURCE_DIR}/botlib/be_aas_file.h
	${SOURCE_DIR}/botlib/be_aas_funcs.h
	${SOURCE_DIR}/botlib/be_aas_move.c
	${SOURCE_DIR}/botlib/be_aas_move.h
	${SOURCE_DIR}/botlib/be_aas_optimize.c
	${SOURCE_DIR}/botlib/be_aas_optimize.h
	${SOURCE_DIR}/botlib/be_aas_reach.c
	${SOURCE_DIR}/botlib/be_aas_reach.h
	${SOURCE_DIR}/botlib/be_aas_route.c
	${SOURCE_DIR}/botlib/be_aas_route.h
	${SOURCE_DIR}/botlib/be_aas_routealt.c
	${SOURCE_DIR}/botlib/be_aas_routealt.h
	${SOURCE_DIR}/botlib/be_aas_sample.c
	${SOURCE_DIR}/botlib/be_aas_sample.h
	${SOURCE_DIR}/botlib/be_ai_char.c
	${SOURCE_DIR}/botlib/be_ai_chat.c
	${SOURCE_DIR}/botlib/be_ai_gen.c
	${SOURCE_DIR}/botlib/be_ai_goal.c
	${SOURCE_DIR}/botlib/be_ai_move.c
	${SOURCE_DIR}/botlib/be_ai_weap.c
	${SOURCE_DIR}/botlib/be_ai_weight.c
	${SOURCE_DIR}/botlib/be_ai_weight.h
	${SOURCE_DIR}/botlib/be_ea.c
	${SOURCE_DIR}/botlib/be_interface.c
	${SOURCE_DIR}/botlib/be_interface.h
	${SOURCE_DIR}/botlib/l_crc.c
	${SOURCE_DIR}/botlib/l_crc.h
	${SOURCE_DIR}/botlib/l_libvar.c
	${SOURCE_DIR}/botlib/l_libvar.h
	${SOURCE_DIR}/botlib/l_log.c
	${SOURCE_DIR}/botlib/l_log.h
	${SOURCE_DIR}/botlib/l_memory.c
	${SOURCE_DIR}/botlib/l_memory.h
	${SOURCE_DIR}/botlib/l_precomp.c
	${SOURCE_DIR}/botlib/l_precomp.h
	${SOURCE_DIR}/botlib/l_script.c
	${SOURCE_DIR}/botlib/l_script.h
	${SOURCE_DIR}/botlib/l_struct.c
	${SOURCE_DIR}/botlib/l_struct.h
	${SOURCE_DIR}/botlib/l_utils.h
	${SOURCE_DIR}/cgame/cg_public.h
	${SOURCE_DIR}/client/cl_avi.c
	${SOURCE_DIR}/client/cl_cgame.c
	${SOURCE_DIR}/client/cl_cin.c
	${SOURCE_DIR}/client/cl_console.c
	${SOURCE_DIR}/client/cl_curl.c
	${SOURCE_DIR}/client/cl_curl.h
	${SOURCE_DIR}/client/cl_input.c
	${SOURCE_DIR}/client/cl_keys.c
	${SOURCE_DIR}/client/cl_main.c
	${SOURCE_DIR}/client/cl_net_chan.c
	${SOURCE_DIR}/client/cl_parse.c
	${SOURCE_DIR}/client/cl_scrn.c
	${SOURCE_DIR}/client/cl_ui.c
	${SOURCE_DIR}/client/client.h
	${SOURCE_DIR}/client/keycodes.h
	${SOURCE_DIR}/client/keys.h
	${SOURCE_DIR}/client/qal.c
	${SOURCE_DIR}/client/qal.h
	${SOURCE_DIR}/client/snd_adpcm.c
	${SOURCE_DIR}/client/snd_codec_ogg.c
	${SOURCE_DIR}/client/snd_codec_opus.c
	${SOURCE_DIR}/client/snd_codec_wav.c
	${SOURCE_DIR}/client/snd_codec.c
	${SOURCE_DIR}/client/snd_dma.c
	${SOURCE_DIR}/client/snd_local.h
	${SOURCE_DIR}/client/snd_main.c
	${SOURCE_DIR}/client/snd_mem.c
	${SOURCE_DIR}/client/snd_mix.c
	${SOURCE_DIR}/client/snd_openal.c
	${SOURCE_DIR}/client/snd_public.h
	${SOURCE_DIR}/client/snd_wavelet.c
	${SOURCE_DIR}/game/bg_public.h
	${SOURCE_DIR}/game/g_public.h
	${SOURCE_DIR}/qcommon/cm_load.c
	${SOURCE_DIR}/qcommon/cm_local.h
	${SOURCE_DIR}/qcommon/cm_patch.c
	${SOURCE_DIR}/qcommon/cm_patch.h
	${SOURCE_DIR}/qcommon/cm_polylib.c
	${SOURCE_DIR}/qcommon/cm_polylib.h
	${SOURCE_DIR}/qcommon/cm_public.h
	${SOURCE_DIR}/qcommon/cm_test.c
	${SOURCE_DIR}/qcommon/cm_trace.c
	${SOURCE_DIR}/qcommon/cmd.c
	${SOURCE_DIR}/qcommon/common.c
	${SOURCE_DIR}/qcommon/cvar.c
	${SOURCE_DIR}/qcommon/files.c
	${SOURCE_DIR}/qcommon/huffman.c
	#${SOURCE_DIR}/qcommon/ioapi.c
	${SOURCE_DIR}/qcommon/md4.c
	${SOURCE_DIR}/qcommon/md5.c
	${SOURCE_DIR}/qcommon/msg.c
	${SOURCE_DIR}/qcommon/net_chan.c
	${SOURCE_DIR}/qcommon/net_ip.c
	${SOURCE_DIR}/qcommon/puff.c
	${SOURCE_DIR}/qcommon/puff.h
	${SOURCE_DIR}/qcommon/q_math.c
	${SOURCE_DIR}/qcommon/q_shared.c
	${SOURCE_DIR}/qcommon/q_shared.h
	${SOURCE_DIR}/qcommon/qcommon.h
	${SOURCE_DIR}/qcommon/qfiles.h
	${SOURCE_DIR}/qcommon/surfaceflags.h
	#${SOURCE_DIR}/qcommon/unzip.c
	#${SOURCE_DIR}/qcommon/unzip.h
	${SOURCE_DIR}/qcommon/vm_interpreted.c
	${SOURCE_DIR}/qcommon/vm_local.h
	${SOURCE_DIR}/qcommon/vm_x86.c
	${SOURCE_DIR}/qcommon/vm.c
	${SOURCE_DIR}/renderercommon/qgl.h
	${SOURCE_DIR}/renderercommon/tr_public.h
	${SOURCE_DIR}/renderercommon/tr_types.h
	${SOURCE_DIR}/sdl/sdl_input.c
	${SOURCE_DIR}/sdl/sdl_snd.c
	${SOURCE_DIR}/server/server.h
	${SOURCE_DIR}/server/sv_bot.c
	${SOURCE_DIR}/server/sv_ccmds.c
	${SOURCE_DIR}/server/sv_client.c
	${SOURCE_DIR}/server/sv_game.c
	${SOURCE_DIR}/server/sv_init.c
	${SOURCE_DIR}/server/sv_main.c
	${SOURCE_DIR}/server/sv_net_chan.c
	${SOURCE_DIR}/server/sv_snapshot.c
	${SOURCE_DIR}/server/sv_world.c
	${SOURCE_DIR}/sys/con_log.c
	${SOURCE_DIR}/sys/con_passive.c
	${SOURCE_DIR}/sys/sys_autoupdater.c
	${SOURCE_DIR}/sys/sys_main.c
	${SOURCE_DIR}/sys/sys_win32.c
	${SOURCE_DIR}/sys/win_resource.h
	${SOURCE_DIR}/ui/ui_public.h
)

# Set the output directory for the binary
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/app" )

# Add the targets
if ( WIN32 )
	add_executable( ${CLIENTBIN} ${ASSEMBLY_FILES} ${IOQ3_SRC} ${ICON} )
else()
	add_executable( ${CLIENTBIN} WIN32 ${IOQ3_SRC} ${ICON} )
endif()

set( CMAKE_PROFILE_OUTPUT_DIR ${CMAKE_BINARY_DIR}/profiling )

if( ENABLE_PROFILING )
	message( "PROFILING ON" )
	if( CMAKE_BUILD_TYPE MATCHES Debug )
		target_compile_options( ${CLIENTBIN} PRIVATE "-fprofile-generate" )
	elseif( CMAKE_BUILD_TYPE MATCHES Release )
		target_compile_options( ${CLIENTBIN} PRIVATE "-fprofile-use=${CMAKE_PROFILE_OUTPUT_DIR}/default.profdata" )
	endif()

	if( ENABLE_PROFILING )
		add_custom_command( TARGET ${CLIENTBIN}
			POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E env LLVM_PROFILE_FILE=${CMAKE_BINARY_DIR}/profiling/default.profraw $<TARGET_FILE:${CLIENTBIN}> -skip-functions=__tmainCRTStartup,_WinMainCRTStartup,BaseThreadInitThunk,RtlUserThreadStart
			WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/app"
			COMMENT "Running ${CLIENTBIN} for profiling"
			VERBATIM
		)
	endif()
else()
	message( "PROFILING OFF" )
endif()

target_compile_definitions( ${CLIENTBIN} PRIVATE
	BOTLIB
	$<$<BOOL:${USE_CURL}>:USE_CURL>
	$<$<BOOL:${USE_CURL_DLOPEN}>:USE_CURL_DLOPEN>
	$<$<BOOL:${USE_OPENAL}>:USE_OPENAL>
	$<$<BOOL:${USE_OPENAL_DLOPEN}>:USE_OPENAL_DLOPEN>
	$<$<BOOL:${USE_VOIP}>:USE_VOIP>
	$<$<BOOL:${USE_OPUS_CODEC}>:USE_CODEC_OPUS>
	$<$<BOOL:${USE_OGG_CODEC}>:USE_OGG_CODEC>
	$<$<BOOL:${USE_RENDERER_DLOPEN}>:USE_RENDERER_DLOPEN>
	$<$<BOOL:${USE_FREETYPE}>:BUILD_FREETYPE>
)

#Link LLVM profiler
if( ${ENABLE_PROFILING} )
	target_link_libraries( ${CLIENTBIN} PRIVATE
		"-fprofile-instr-generate=${CMAKE_BINARY_DIR}/profiling/default.profraw"
		"-fprofile-instr-use=${CMAKE_BINARY_DIR}/profiling/default.profdata"
		"-fprofile-instr-use=libclang_rt.profile-x86_64.a"
	)
endif()

if ( WIN32 )
	# Link the Win32 libraries to the target
	target_link_libraries( ${CLIENTBIN} PRIVATE
		shell32
		user32
		advapi32
		winmm
		wsock32
		ws2_32
		psapi
		gdi32
		opengl32
		crypt32
	)
endif()

if ( NOT MSVC )
	# Link the crossplatform libraries to the target
	target_link_libraries( ${CLIENTBIN} PRIVATE
		nghttp2
		idn2
		psl
		ssh2
		ssl
		crypto
		zstd
		brotlidec
		z
	)
endif()

# Link the libraries to the target
target_link_libraries( ${CLIENTBIN} PRIVATE
	${ZLIB_LIBRARIES}
	${MINIZIP_LIBRARY}
	$<$<BOOL:${USE_OPENAL}>:${OPENAL_LIBRARY}>
	$<$<BOOL:${USE_OPUS_CODEC}>:${OPUS_LIBRARIES}>
	$<$<BOOL:${USE_OPUS_CODEC}>:${OPUSFILE_LIBRARIES}>
	${SDL2_LIBRARIES}
	$<$<BOOL:${USE_CURL}>:${CURL_LIBRARIES}>
	$<$<BOOL:${USE_OGG_CODEC}>:${LIBOGG_LIBRARIES}>
	$<$<BOOL:${USE_OPUS_CODEC}>:${LIBVORBIS_LIBRARIES}>$<$<BOOL:${USE_OGG_CODEC}>:${LIBVORBIS_LIBRARIES}>
	${JPEG_LIBRARIES}
	${PNG_LIBRARIES}
	$<$<BOOL:${USE_FREETYPE}>:Freetype::Freetype>
)

if ( NOT ${USE_RENDERER_DLOPEN} )
	# Link the libraries to the target
	target_link_libraries( ${CLIENTBIN} PRIVATE
		${GL2_NAME}
	)
endif()

# Add the include directory
target_include_directories( ${CLIENTBIN} PUBLIC
	${HEADER_DIRS}
	${JPEG_INCLUDE_DIR}
	${SDL2_INCLUDE_DIR}
)

# Set the library version
set_target_properties( ${CLIENTBIN} PROPERTIES 
	VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME ${CLIENTBIN}${ARCH}
	SOVERSION 1
	PREFIX ""
)

# Copy DLL files to build output folder
if ( WIN32 )
    # Create app and app/baseq3 directories if they don't exist
    add_custom_command( TARGET ${CLIENTBIN} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_SOURCE_DIR}/app/baseq3" )

    # Copy executable to app directory
    add_custom_command( TARGET ${CLIENTBIN} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${CLIENTBIN}> "${CMAKE_CURRENT_SOURCE_DIR}/app/${CLIENTBIN}.exe" )

    # Copy other DLLs to app/baseq3 directory if missing
    set( DLLS_TO_COPY
        ${CGAME_NAME}
        ${GAME_NAME}
        ${Q3UI_NAME}
    )

    foreach( DLL ${DLLS_TO_COPY} )
        add_custom_command(TARGET ${CLIENTBIN} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${DLL}> "${CMAKE_CURRENT_SOURCE_DIR}/app/baseq3/"
            COMMENT "Copying ${DLL} to app/baseq3 directory\n"
            VERBATIM
        )
    endforeach()

	if ( ${BUILD_RENDERER_OPENGL2} AND ${USE_RENDERER_DLOPEN} )
		# Copy GL2_NAME DLL to app directory
		add_custom_command( TARGET ${CLIENTBIN} POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${GL2_NAME}> "${CMAKE_CURRENT_SOURCE_DIR}/app/"
			COMMENT "Copying ${GL2_NAME} to app directory"
			VERBATIM
		)
	endif()
	
	if ( NOT ${BUILD_RENDERER_OPENGL2} AND ${USE_RENDERER_DLOPEN} )
		# Copy GL1_NAME DLL to app directory
		add_custom_command( TARGET ${CLIENTBIN} POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${GL1_NAME}> "${CMAKE_CURRENT_SOURCE_DIR}/app/"
			COMMENT "Copying ${GL1_NAME} to app directory"
			VERBATIM
		)
	endif()

	# Remove file_to_remove.txt from the app folder after build
	add_custom_command( TARGET ${CLIENTBIN} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E remove "${CMAKE_CURRENT_SOURCE_DIR}/app/libopenal-1.dll"
		COMMENT "Removing libopenal-1.dll from app directory after build"
		VERBATIM
	)
endif()

# Set the working directory for debugging
set_property( TARGET ${CLIENTBIN} PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/app" )