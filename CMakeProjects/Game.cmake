set( GAME_NAME "game" )

set( GAME_SOURCES
	${SOURCE_DIR}/botlib/be_aas.h
	${SOURCE_DIR}/botlib/be_ai_char.h
	${SOURCE_DIR}/botlib/be_ai_chat.h
	${SOURCE_DIR}/botlib/be_ai_gen.h
	${SOURCE_DIR}/botlib/be_ai_goal.h
	${SOURCE_DIR}/botlib/be_ai_move.h
	${SOURCE_DIR}/botlib/be_ai_weap.h
	${SOURCE_DIR}/botlib/be_ea.h
	${SOURCE_DIR}/botlib/botlib.h
	${SOURCE_DIR}/game/ai_chat.c
	${SOURCE_DIR}/game/ai_chat.h
	${SOURCE_DIR}/game/ai_cmd.c
	${SOURCE_DIR}/game/ai_cmd.h
	${SOURCE_DIR}/game/ai_dmnet.c
	${SOURCE_DIR}/game/ai_dmnet.h
	${SOURCE_DIR}/game/ai_dmq3.c
	${SOURCE_DIR}/game/ai_dmq3.h
	${SOURCE_DIR}/game/ai_main.c
	${SOURCE_DIR}/game/ai_main.h
	${SOURCE_DIR}/game/ai_team.c
	${SOURCE_DIR}/game/ai_team.h
	${SOURCE_DIR}/game/ai_vcmd.c
	${SOURCE_DIR}/game/ai_vcmd.h
	${SOURCE_DIR}/game/bg_lib.c
	${SOURCE_DIR}/game/bg_local.h
	${SOURCE_DIR}/game/bg_misc.c
	${SOURCE_DIR}/game/bg_pmove.c
	${SOURCE_DIR}/game/bg_public.h
	${SOURCE_DIR}/game/bg_slidemove.c
	${SOURCE_DIR}/game/chars.h
	${SOURCE_DIR}/game/g_active.c
	${SOURCE_DIR}/game/g_arenas.c
	${SOURCE_DIR}/game/g_bot.c
	${SOURCE_DIR}/game/g_client.c
	${SOURCE_DIR}/game/g_cmds.c
	${SOURCE_DIR}/game/g_combat.c
	${SOURCE_DIR}/game/g_items.c
	${SOURCE_DIR}/game/g_local.h
	${SOURCE_DIR}/game/g_main.c
	${SOURCE_DIR}/game/g_mem.c
	${SOURCE_DIR}/game/g_misc.c
	${SOURCE_DIR}/game/g_missile.c
	${SOURCE_DIR}/game/g_mover.c
	${SOURCE_DIR}/game/g_public.h
	${SOURCE_DIR}/game/g_session.c
	${SOURCE_DIR}/game/g_spawn.c
	${SOURCE_DIR}/game/g_svcmds.c
	${SOURCE_DIR}/game/g_syscalls.c
	${SOURCE_DIR}/game/g_target.c
	${SOURCE_DIR}/game/g_team.c
	${SOURCE_DIR}/game/g_team.h
	${SOURCE_DIR}/game/g_trigger.c
	${SOURCE_DIR}/game/g_utils.c
	${SOURCE_DIR}/game/g_weapon.c
	${SOURCE_DIR}/game/inv.h
	${SOURCE_DIR}/game/match.h
	${SOURCE_DIR}/game/syn.h
	${SOURCE_DIR}/qcommon/q_math.c
	${SOURCE_DIR}/qcommon/q_shared.c
	${SOURCE_DIR}/qcommon/q_shared.h
	${SOURCE_DIR}/qcommon/surfaceflags.h
	${CMAKE_CURRENT_SOURCE_DIR}/ui/menudef.h
)

add_library( ${GAME_NAME} SHARED ${GAME_SOURCES} )

source_group( TREE ${CMAKE_SOURCE_DIR} PREFIX code FILES ${GAME_SOURCES} )

# Add the include directory
target_include_directories( ${GAME_NAME} PUBLIC
	${HEADER_DIRS}
)

if( MSVC )
    target_link_options( ${GAME_NAME} PRIVATE 
        /DEF:${MISC_DIR}/msvc/game.def
    )
elseif( MINGW )
    target_sources( ${GAME_NAME} PRIVATE
        ${MISC_DIR}/msvc/game.def
    )
endif()

# Set the library version
set_target_properties( ${GAME_NAME} PROPERTIES 
    VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME ${GAME_NAME}${ARCH}
    SOVERSION 1
	PREFIX ""
)