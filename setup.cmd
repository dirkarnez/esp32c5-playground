@REM run as Administrator
@echo off

set SEVENZIP=C:\"Program Files"\7-Zip\7z.exe

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

set GIT_DIR=%DOWNLOADS_DIR%\PortableGit
set GIT_EXE=%GIT_DIR%\bin\git.exe
if not exist %GIT_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe" -L -O &&^
PortableGit-2.42.0.2-64-bit.7z.exe -o%GIT_DIR% -y &&^
del PortableGit-2.42.0.2-64-bit.7z.exe
)

if exist %GIT_EXE% (
    echo git %GIT_EXE% found
)


set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable
set PYTHON_EXE=%PYTHON_DIR%\python.exe
if not exist %PYTHON_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/dirkarnez/python-portable/releases/download/v3.10.8/python-3.10.8-amd64-portable.zip" -L -O &&^
%SEVENZIP% x python-3.10.8-amd64-portable.zip -o"%PYTHON_DIR%" &&^
del python-3.10.8-amd64-portable.zip
)

if exist %PYTHON_EXE% (
    echo python %PYTHON_EXE% found
)

set CMAKE_DIR=%DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64
set CMAKE_EXE=%CMAKE_DIR%\cmake-3.29.3-windows-x86_64\bin\cmake.exe
if not exist %CMAKE_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/Kitware/CMake/releases/download/v3.29.3/cmake-3.29.3-windows-x86_64.zip" -L -O &&^
%SEVENZIP% x cmake-3.29.3-windows-x86_64.zip -o"%CMAKE_DIR%" &&^
del cmake-3.29.3-windows-x86_64.zip
)

if exist %CMAKE_EXE% (
    echo cmake %CMAKE_EXE% found
)


set PATH=^
%GIT_DIR%\bin;^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
C:\Windows\System32;

set IDF_TOOLS_PATH=%DOWNLOADS_DIR%\.espressif

set REF="v5.5.1"

if not "%~1" == "" (
    set REF="%~1"
)

cd /d "%DOWNLOADS_DIR%" &&^
git clone --branch %REF% --recurse-submodules https://github.com/espressif/esp-idf.git &&^
cd /d "%DOWNLOADS_DIR%\esp-idf" &&^
install.bat &&^
export.bat &&^
echo %PATH%
