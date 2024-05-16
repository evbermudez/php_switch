@echo off
SETLOCAL

SET HERD_PHP_DIR=C:\Users\evber\.config\herd\bin
SET PHP_VERSION=%1
SET PHP_PATH=%HERD_PHP_DIR%\php%PHP_VERSION%

IF NOT EXIST "%PHP_PATH%" (
    echo PHP version %PHP_VERSION% does not exist in %HERD_PHP_DIR%.
    ENDLOCAL
    EXIT /B 1
)

REM Remove existing PHP paths from the PATH variable
FOR /F "tokens=1,* delims=;" %%A IN ('echo %PATH%') DO (
    SET NEW_PATH=
    SET PATH_TMP=%%B
    FOR %%P IN (%%A %%B) DO (
        IF "%%~nP" NEQ "php82" IF "%%~nP" NEQ "php83" (
            IF DEFINED NEW_PATH (
                SET NEW_PATH=!NEW_PATH!;%%P
            ) ELSE (
                SET NEW_PATH=%%P
            )
        )
    )
)

REM Add the new PHP path
SET PATH=%PHP_PATH%;%NEW_PATH%

REM Update the PATH variable for the current user
SETX PATH "%PATH%"

echo Switched to PHP version %PHP_VERSION%