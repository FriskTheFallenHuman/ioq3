set( Q3UI_NAME "ui" )

set( Q3UI_SOURCES
	${SOURCE_DIR}/game/bg_misc.c
	${SOURCE_DIR}/q3_ui/ui_addbots.c
	${SOURCE_DIR}/q3_ui/ui_atoms.c
	${SOURCE_DIR}/q3_ui/ui_cdkey.c
	${SOURCE_DIR}/q3_ui/ui_cinematics.c
	${SOURCE_DIR}/q3_ui/ui_confirm.c
	${SOURCE_DIR}/q3_ui/ui_connect.c
	${SOURCE_DIR}/q3_ui/ui_controls2.c
	${SOURCE_DIR}/q3_ui/ui_credits.c
	${SOURCE_DIR}/q3_ui/ui_demo2.c
	${SOURCE_DIR}/q3_ui/ui_display.c
	${SOURCE_DIR}/q3_ui/ui_gameinfo.c
	${SOURCE_DIR}/q3_ui/ui_ingame.c
	${SOURCE_DIR}/q3_ui/ui_loadconfig.c
	${SOURCE_DIR}/q3_ui/ui_main.c
	${SOURCE_DIR}/q3_ui/ui_menu.c
	${SOURCE_DIR}/q3_ui/ui_mfield.c
	${SOURCE_DIR}/q3_ui/ui_mods.c
	${SOURCE_DIR}/q3_ui/ui_network.c
	${SOURCE_DIR}/q3_ui/ui_options.c
	${SOURCE_DIR}/q3_ui/ui_playermodel.c
	${SOURCE_DIR}/q3_ui/ui_players.c
	${SOURCE_DIR}/q3_ui/ui_playersettings.c
	${SOURCE_DIR}/q3_ui/ui_preferences.c
	${SOURCE_DIR}/q3_ui/ui_qmenu.c
	${SOURCE_DIR}/q3_ui/ui_removebots.c
	${SOURCE_DIR}/q3_ui/ui_saveconfig.c
	${SOURCE_DIR}/q3_ui/ui_serverinfo.c
	${SOURCE_DIR}/q3_ui/ui_servers2.c
	${SOURCE_DIR}/q3_ui/ui_setup.c
	${SOURCE_DIR}/q3_ui/ui_sound.c
	${SOURCE_DIR}/q3_ui/ui_sparena.c
	${SOURCE_DIR}/q3_ui/ui_specifyserver.c
	${SOURCE_DIR}/q3_ui/ui_splevel.c
	${SOURCE_DIR}/q3_ui/ui_sppostgame.c
	${SOURCE_DIR}/q3_ui/ui_spreset.c
	${SOURCE_DIR}/q3_ui/ui_spskill.c
	${SOURCE_DIR}/q3_ui/ui_startserver.c
	${SOURCE_DIR}/q3_ui/ui_team.c
	${SOURCE_DIR}/q3_ui/ui_teamorders.c
	${SOURCE_DIR}/q3_ui/ui_video.c
	${SOURCE_DIR}/qcommon/q_math.c
	${SOURCE_DIR}/qcommon/q_shared.c
	${SOURCE_DIR}/qcommon/q_shared.h
	${SOURCE_DIR}/ui/ui_syscalls.c
)

add_library( ${Q3UI_NAME} SHARED ${Q3UI_SOURCES} )

source_group( TREE ${CMAKE_SOURCE_DIR} PREFIX code FILES ${Q3UI_SOURCES} )

# Add the include directory
target_include_directories(${Q3UI_NAME} PUBLIC
	${HEADER_DIRS}
)

if( MSVC )
    target_link_options( ${Q3UI_NAME} PRIVATE 
        /DEF:${MISC_DIR}/msvc/q3_ui.def
    )
elseif( MINGW )
    target_sources( ${Q3UI_NAME} PRIVATE
        ${MISC_DIR}/msvc/q3_ui.def
    )
endif()

# Set the library version
set_target_properties( ${Q3UI_NAME} PROPERTIES 
    VERSION ${PRODUCT_VERSION}
	OUTPUT_NAME ${Q3UI_NAME}${ARCH}
    SOVERSION 1
	PREFIX ""
)