@echo off
cls

astyle.exe -v --formatted --options=astyle-options.ini --exclude="build" --exclude="vcpkg" --exclude="code/tools" --exclude="code/asm" --recursive *.h
astyle.exe -v --formatted --options=astyle-options.ini --exclude="build" --exclude="vcpkg" --exclude="code/tools" --exclude="code/asm" --recursive *.c

pause