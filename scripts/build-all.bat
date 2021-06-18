@ECHO OFF
REM Build Everything

ECHO "Building everything..."

IF "%CI%" == "true" (
    PUSHD ../engine/scripts
    CALL build.bat 
    POPD
) else (
    PUSHD engine/scripts
    CALL build.bat
    POPD
)

IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

PUSHD testbed/scripts
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

ECHO "All assemblies built successfully."