set( CGAME_NAME "cgame" )

set( CGAME_SOURCES
	${SOURCE_DIR}/cgame/cg_consolecmds.c
	${SOURCE_DIR}/cgame/cg_draw.c
	${SOURCE_DIR}/cgame/cg_drawtools.c
	${SOURCE_DIR}/cgame/cg_effects.c
	${SOURCE_DIR}/cgame/cg_ents.c
	${SOURCE_DIR}/cgame/cg_event.c
	${SOURCE_DIR}/cgame/cg_info.c
	${SOURCE_DIR}/cgame/cg_local.h
	${SOURCE_DIR}/cgame/cg_localents.c
	${SOURCE_DIR}/cgame/cg_main.c
	${SOURCE_DIR}/cgame/cg_marks.c
	#${SOURCE_DIR}/cgame/cg_newDraw.c # only for Missionpack
	${SOURCE_DIR}/cgame/cg_particles.c
	${SOURCE_DIR}/cgame/cg_players.c
	${SOURCE_DIR}/cgame/cg_playerstate.c
	${SOURCE_DIR}/cgame/cg_predict.c
	${SOURCE_DIR}/cgame/cg_public.h
	${SOURCE_DIR}/cgame/cg_scoreboard.c
	${SOURCE_DIR}/cgame/cg_servercmds.c
	${SOURCE_DIR}/cgame/cg_snapshot.c
	${SOURCE_DIR}/cgame/cg_syscalls.c
	${SOURCE_DIR}/cgame/cg_view.c
	${SOURCE_DIR}/cgame/cg_weapons.c
	${SOURCE_DIR}/game/bg_lib.c
	${SOURCE_DIR}/game/bg_misc.c
	${SOURCE_DIR}/game/bg_pmove.c
	${SOURCE_DIR}/game/bg_public.h
	${SOURCE_DIR}/game/bg_slidemove.c
	${SOURCE_DIR}/qcommon/q_math.c
	${SOURCE_DIR}/qcommon/q_shared.c
	${SOURCE_DIR}/qcommon/q_shared.h
	${SOURCE_DIR}/qcommon/surfaceflags.h
	${SOURCE_DIR}/ui/ui_shared.c
	${CMAKE_CURRENT_SOURCE_DIR}/ui/menudef.h
)

add_library( ${CGAME_NAME} SHARED ${CGAME_SOURCES} )

source_group( TREE ${CMAKE_SOURCE_DIR} PREFIX code FILES ${CGAME_SOURCES} )

# Add the include directory
target_include_directories( ${CGAME_NAME} PUBLIC
	${HEADER_DIRS}
)

if( MSVC )
    target_link_options( ${CGAME_NAME} PRIVATE 
        /DEF:${MISC_DIR}/msvc/cgame.def
    )
elseif( MINGW )
    target_sources( ${CGAME_NAME} PRIVATE
        ${MISC_DIR}/msvc/cgame.def
    )
endif()

# Set the library version
set_target_properties(${CGAME_NAME} PROPERTIES 
	VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME ${CGAME_NAME}${ARCH}
	SOVERSION 1
	PREFIX ""
)