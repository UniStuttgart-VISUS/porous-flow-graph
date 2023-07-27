@echo off


:build
mkdir build
cd build
"C:\Program Files\CMake\bin\cmake.exe" ..\ -DCMAKE_CONFIGURATION_TYPES=Release
"C:\Program Files\CMake\bin\cmake.exe" --build . --config Release
cd ..


:install
xcopy /Y /E build\megamol megamol\
xcopy /Y /E build\luavis\bin luavis\


:run_MegaMol
start /b megamol\bin\megamol.exe project.lua > NUL
timeout /t 5 > NUL
megamol\bin\remoteconsole.exe -s screenshot.lua


:cleanup_MegaMol
timeout /t 5 > NUL
del megamol_log.txt
del perf.log


:run_LuaVis
cd luavis
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace '\"colorByNodeType\", false', '\"colorByNodeType\", true' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace '\"unscaledNodes\", false', '\"unscaledNodes\", true' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace '\"showInterfaces\", true', '\"showInterfaces\", false' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace '\"screenshotMode\", false', '\"screenshotMode\", true' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace '\"activeMetricID\", 1', '\"activeMetricID\", 7' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
@powershell -Command "(gc -Encoding UTF8 assets\scripts\luavis\vis\Graph.lua) -replace 'frameNum = 0', 'frameNum = 62' | Out-File -encoding UTF8 assets\scripts\luavis\vis\Graph.lua"
timeout /t 5 > NUL
run.bat
cd ..
