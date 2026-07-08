@REM @REM run as Administrator
@REM @echo off
@REM cd /d %~dp0
@REM set DOWNLOADS_DIR=%USERPROFILE%\Downloads
@REM set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

@REM set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable

@REM set IDF_PATH=^
@REM %DOWNLOADS_DIR%\esp-idf;

@REM set IDF_TOOLS_PATH=%USERPROFILE%\.espressif
@REM set IDF_PYTHON_ENV_PATH=%IDF_TOOLS_PATH%\python_env

@REM set PATH=^
@REM %PYTHON_DIR%;^
@REM %PYTHON_DIR%\Scripts;^
@REM %DOWNLOADS_DIR%\PortableGit\bin;^
@REM %DOWNLOADS_DIR%\esp-idf-tools-portable-v1.2\tools\bin;^
@REM %IDF_PATH%\tools;^
@REM %DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64\cmake-3.29.3-windows-x86_64\bin;

@REM cmake.exe -G"Ninja" ^
@REM -DCMAKE_BUILD_TYPE=Debug ^
@REM -B./cmake-build &&^
@REM cd cmake-build &&^
@REM cmake --build . &&^
@REM echo Successful build


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

@REM git clone --branch v5.5.1 --recurse-submodules https://github.com/espressif/esp-idf.git
set IDF_TOOLS_PATH=%DOWNLOADS_DIR%\.espressif
set IDF_PATH=%DOWNLOADS_DIR%\esp-idf
@REM set IDF_PYTHON_ENV_PATH=%IDF_TOOLS_PATH%\python_env

set PATH=^
C:\Windows\System32;^
%GIT_DIR%\bin;^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
%IDF_PATH%\tools;^
%DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64\cmake-3.29.3-windows-x86_64\bin;

@REM cd /d "%" &&^
@REM install.bat &&^
@REM export.bat &&^
@REM echo done

%DOWNLOADS_DIR%\esp-idf\export.bat &&^
python %IDF_PATH%\tools\idf.py build

cd /d "%~dp0"
pause