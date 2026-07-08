@REM run as Administrator
@echo off
cd /d %~dp0

set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%


@REM set PREFIX=D:\Softwares
set PREFIX=%DOWNLOADS_DIR%

set PYTHON_DIR=%PREFIX%\python-3.10.8-amd64-portable

set IDF_PATH=^
%PREFIX%\esp-idf

set IDF_TOOLS_PATH=%USERPROFILE%\.espressif
set IDF_PYTHON_ENV_PATH=%IDF_TOOLS_PATH%\python_env\idf5.5_py3.10_env

set PATH=^
C:\windows\system32;^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
%PREFIX%\PortableGit\bin;^
%PREFIX%\esp-idf-tools-portable-v1.2;^
%PREFIX%\esp-idf-tools-portable-v1.2\tools\bin;^
%IDF_TOOLS_PATH%\tools\xtensa-esp-elf\esp-14.2.0_20241119\xtensa-esp-elf\bin;^
%IDF_PATH%;^
%IDF_PATH%\tools;^
%IDF_TOOLS_PATH%\tools\cmake\3.30.2\bin;

@REM python -m pip install --user -r %IDF_PATH%\requirements.txt
@REM python %IDF_PATH%\tools\idf_tools.py install-python-env
@REM python %IDF_PATH%\tools\idf.py menuconfig

set IDF_TARGET=esp32s2


cd /d %~dp0 &&^
python %IDF_PATH%\tools\idf.py build
cd /d %~dp0

@REM cd /d "%IDF_PATH%" &&^
@REM install.bat &&^
@REM export.bat &&^
cd /d %~dp0 &&^
python %IDF_PATH%\tools\idf.py -B cmake-build menuconfig
@REM python %IDF_PATH%\tools\idf.py -B cmake-build build
cd /d %~dp0