set( GL1_NAME "renderer_opengl1" )

set( GL1_SOURCES
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
	${SOURCE_DIR}/renderergl1/tr_altivec.c
	${SOURCE_DIR}/renderergl1/tr_animation.c
	${SOURCE_DIR}/renderergl1/tr_backend.c
	${SOURCE_DIR}/renderergl1/tr_bsp.c
	${SOURCE_DIR}/renderergl1/tr_cmds.c
	${SOURCE_DIR}/renderergl1/tr_curve.c
	${SOURCE_DIR}/renderergl1/tr_flares.c
	${SOURCE_DIR}/renderergl1/tr_image.c
	${SOURCE_DIR}/renderergl1/tr_init.c
	${SOURCE_DIR}/renderergl1/tr_light.c
	${SOURCE_DIR}/renderergl1/tr_local.h
	${SOURCE_DIR}/renderergl1/tr_main.c
	${SOURCE_DIR}/renderergl1/tr_marks.c
	${SOURCE_DIR}/renderergl1/tr_mesh.c
	${SOURCE_DIR}/renderergl1/tr_model.c
	${SOURCE_DIR}/renderergl1/tr_model_iqm.c
	${SOURCE_DIR}/renderergl1/tr_scene.c
	${SOURCE_DIR}/renderergl1/tr_shade.c
	${SOURCE_DIR}/renderergl1/tr_shader.c
	${SOURCE_DIR}/renderergl1/tr_shade_calc.c
	${SOURCE_DIR}/renderergl1/tr_shadows.c
	${SOURCE_DIR}/renderergl1/tr_sky.c
	${SOURCE_DIR}/renderergl1/tr_subs.c
	${SOURCE_DIR}/renderergl1/tr_surface.c
	${SOURCE_DIR}/renderergl1/tr_world.c
	${SOURCE_DIR}/sdl/sdl_gamma.c
	${SOURCE_DIR}/sdl/sdl_glimp.c
	${SOURCE_DIR}/server/server.h
	${SOURCE_DIR}/ui/ui_public.h
)

if ( ${USE_RENDERER_DLOPEN} )
	add_library( ${GL1_NAME} SHARED ${GL1_SOURCES} )
else()
	add_library( ${GL1_NAME} STATIC ${GL1_SOURCES} )
endif()

source_group( TREE ${CMAKE_SOURCE_DIR} PREFIX code FILES ${GL1_SOURCES} )

#Link the libraries to the targets
target_link_libraries( ${GL1_NAME} PRIVATE ${LIBRARIES} ${JPEG_LIBRARIES} ${SDL2_LIBRARIES} )

#Add the include directory
target_include_directories( ${GL1_NAME} PUBLIC
	${HEADER_DIRS}
	${JPEG_INCLUDE_DIR}
	${SDL2_INCLUDE_DIR}
)

if ( ${USE_RENDERER_DLOPEN} )
	target_compile_definitions( ${GL1_NAME} PRIVATE
		USE_RENDERER_DLOPEN
	)
endif()

if( MSVC )
    target_link_options( ${GL1_NAME} PRIVATE 
        /DEF:${MISC_DIR}/msvc/ref_gl1.def
    )
elseif( MINGW )
    target_sources( ${GL1_NAME} PRIVATE
        ${MISC_DIR}/msvc/ref_gl1.def
    )
endif()

#Set the library version
set_target_properties( ${GL1_NAME} PROPERTIES 
	VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME "${GL1_NAME}_${ARCH}"
	SOVERSION 1
	PREFIX ""
)