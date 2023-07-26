echo "Building LuaJIT"
echo "Source directory: %1\luajit_download\src"
echo "Target directory: %1\luajit"

REM build LuaJIT
cd /D %1\luajit_download\src
cmd /C msvcbuild.bat

REM install it
cd %1

mkdir luajit
mkdir luajit\bin
mkdir luajit\lib
mkdir luajit\include

copy luajit_download\src\*.dll luajit\bin\
copy luajit_download\src\*.exe luajit\bin\
copy luajit_download\src\*.lib luajit\lib\
copy luajit_download\src\*.h luajit\include\
copy luajit_download\src\*.hpp luajit\include\
