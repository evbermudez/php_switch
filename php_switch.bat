@echo off
SETLOCAL

SET PHP_VERSIONS_DIR=C:\php
SET PHP_VERSION=%1
SET PHP_PATH=%PHP_VERSIONS_DIR%\php%PHP_VERSION%

IF NOT EXIST "%PHP_PATH%" (
    echo PHP version %PHP_VERSION% does not exist in %PHP_VERSIONS_DIR%.
    ENDLOCAL
    EXIT /B 1
)

SETX PATH "%PHP_PATH%;%PATH%"
echo Switched to PHP version %PHP_VERSION%