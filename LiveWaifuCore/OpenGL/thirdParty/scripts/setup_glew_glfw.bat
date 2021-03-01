@echo off

set GLEW_VERSION=2.2.0
set GLFW_VERSION=3.3.3

set SCRIPT_PATH=%~dp0

cd %SCRIPT_PATH%/..

::::::::::::::::
:: Setup GLEW ::
::::::::::::::::

:: Download and extract the archive.
echo - Setup GLEW %GLEW_VERSION%
echo Downloading...
echo Extracting...
powershell "$progressPreference = 'silentlyContinue'; expand-archive -force glew.zip ."
if %errorlevel% neq 0 pause & exit /b %errorlevel%
ren glew-%GLEW_VERSION% glew
del glew.zip

::::::::::::::::
:: Setup GLFW ::
::::::::::::::::

echo.

:: Download and extract the archive.
echo - Setup GLFW %GLFW_VERSION%
echo Downloading...
echo Extracting...
powershell "$progressPreference = 'silentlyContinue'; expand-archive -force glfw.zip ."
if %errorlevel% neq 0 pause & exit /b %errorlevel%
ren glfw-%GLFW_VERSION% glfw
del glfw.zip

echo.
pause
