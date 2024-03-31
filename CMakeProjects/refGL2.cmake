# Print message confirming the task
message( STATUS "Shaders are being stringified." )

# Find python3 for shaders processing
find_package( Python3 COMPONENTS Interpreter REQUIRED )
execute_process(
    COMMAND ${Python3_EXECUTABLE} glsl_stringify.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

# Print message upon successful completion of the task
message( STATUS "Shader files have been stringified." )

set( GL2_NAME "renderer_opengl2" )

set( GL2_SOURCES
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/bokeh_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/bokeh_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/calclevels4x_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/calclevels4x_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/depthblur_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/depthblur_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/dlight_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/dlight_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/down4x_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/down4x_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/fogpass_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/fogpass_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/generic_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/generic_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/lightall_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/lightall_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/pshadow_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/pshadow_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/shadowfill_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/shadowfill_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/shadowmask_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/shadowmask_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/ssao_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/ssao_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/texturecolor_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/texturecolor_vp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/tonemap_fp.c
	${CMAKE_BINARY_DIR}/dynamic/renderergl2/tonemap_vp.c
	${SOURCE_DIR}/client/snd_local.h
	${SOURCE_DIR}/client/snd_public.h
	${SOURCE_DIR}/qcommon/puff.c
	${SOURCE_DIR}/qcommon/puff.h
	${SOURCE_DIR}/qcommon/q_math.c
	${SOURCE_DIR}/qcommon/q_shared.c
	${SOURCE_DIR}/qcommon/q_shared.h
	${SOURCE_DIR}/qcommon/qcommon.h
	${SOURCE_DIR}/qcommon/qfiles.h
	${SOURCE_DIR}/qcommon/surfaceflags.h
	#${SOURCE_DIR}/qcommon/unzip.h
	${SOURCE_DIR}/qcommon/vm_local.h
	${SOURCE_DIR}/renderercommon/qgl.h
	${SOURCE_DIR}/renderercommon/tr_font.c
	${SOURCE_DIR}/renderercommon/tr_image_bmp.c
	${SOURCE_DIR}/renderercommon/tr_image_jpg.c
	${SOURCE_DIR}/renderercommon/tr_image_pcx.c
	${SOURCE_DIR}/renderercommon/tr_image_png.c
	${SOURCE_DIR}/renderercommon/tr_image_tga.c
	${SOURCE_DIR}/renderercommon/tr_noise.c
	${SOURCE_DIR}/renderercommon/tr_public.h
	${SOURCE_DIR}/renderergl2/tr_animation.c
	${SOURCE_DIR}/renderergl2/tr_backend.c
	${SOURCE_DIR}/renderergl2/tr_bsp.c
	${SOURCE_DIR}/renderergl2/tr_cmds.c
	${SOURCE_DIR}/renderergl2/tr_curve.c
	${SOURCE_DIR}/renderergl2/tr_dsa.c
	${SOURCE_DIR}/renderergl2/tr_extensions.c
	${SOURCE_DIR}/renderergl2/tr_extramath.c
	${SOURCE_DIR}/renderergl2/tr_extramath.h
	${SOURCE_DIR}/renderergl2/tr_extratypes.h
	${SOURCE_DIR}/renderergl2/tr_fbo.c
	${SOURCE_DIR}/renderergl2/tr_fbo.h
	${SOURCE_DIR}/renderergl2/tr_flares.c
	${SOURCE_DIR}/renderergl2/tr_glsl.c
	${SOURCE_DIR}/renderergl2/tr_image_dds.c
	${SOURCE_DIR}/renderergl2/tr_image.c
	${SOURCE_DIR}/renderergl2/tr_init.c
	${SOURCE_DIR}/renderergl2/tr_light.c
	${SOURCE_DIR}/renderergl2/tr_local.h
	${SOURCE_DIR}/renderergl2/tr_main.c
	${SOURCE_DIR}/renderergl2/tr_marks.c
	${SOURCE_DIR}/renderergl2/tr_mesh.c
	${SOURCE_DIR}/renderergl2/tr_model_iqm.c
	${SOURCE_DIR}/renderergl2/tr_model.c
	${SOURCE_DIR}/renderergl2/tr_postprocess.c
	${SOURCE_DIR}/renderergl2/tr_postprocess.h
	${SOURCE_DIR}/renderergl2/tr_scene.c
	${SOURCE_DIR}/renderergl2/tr_shade_calc.c
	${SOURCE_DIR}/renderergl2/tr_shade.c
	${SOURCE_DIR}/renderergl2/tr_shader.c
	${SOURCE_DIR}/renderergl2/tr_shadows.c
	${SOURCE_DIR}/renderergl2/tr_sky.c
	${SOURCE_DIR}/renderergl2/tr_subs.c
	${SOURCE_DIR}/renderergl2/tr_surface.c
	${SOURCE_DIR}/renderergl2/tr_vbo.c
	${SOURCE_DIR}/renderergl2/tr_world.c
	${SOURCE_DIR}/sdl/sdl_gamma.c
	${SOURCE_DIR}/sdl/sdl_glimp.c
	${SOURCE_DIR}/server/server.h
	${SOURCE_DIR}/ui/ui_public.h
)

if ( ${USE_RENDERER_DLOPEN} )
	add_library( ${GL2_NAME} SHARED ${GL2_SOURCES} )
else()
	add_library( ${GL2_NAME} STATIC ${GL2_SOURCES} )
endif()

source_group( TREE ${CMAKE_SOURCE_DIR} PREFIX code FILES ${GL2_SOURCES} )

#Link the libraries to the targets
target_link_libraries( ${GL2_NAME} PRIVATE ${LIBRARIES} ${JPEG_LIBRARIES} ${SDL2_LIBRARIES} )

#Add the include directory
target_include_directories( ${GL2_NAME} PUBLIC
	${HEADER_DIRS}
	${JPEG_INCLUDE_DIR}
	${SDL2_INCLUDE_DIR}
)

if ( ${USE_RENDERER_DLOPEN} )
	target_compile_definitions( ${GL2_NAME} PRIVATE
		USE_RENDERER_DLOPEN
	)
	
	if( MSVC )
		target_link_options( ${GL2_NAME} PRIVATE 
			/DEF:${MISC_DIR}/msvc/ref_gl2.def
		)
	elseif( MINGW )
		target_sources( ${GL2_NAME} PRIVATE
			${MISC_DIR}/msvc/ref_gl2.def
		)
	endif()
endif()

#Set the library version
set_target_properties( ${GL2_NAME} PROPERTIES 
	VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME "${GL2_NAME}_${ARCH}"
	SOVERSION 1
	PREFIX ""
)