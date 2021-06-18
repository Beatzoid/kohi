@ECHO OFF
REM Build Everything

ECHO "Building everything..."

if %CI% (
    PUSHD ../engine
    CALL scripts/build.bat
    POPD
) else (
    PUSHD engine
    CALL scripts/build.bat
    POPD
    IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)
)

PUSHD testbed
CALL scripts/build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

ECHO "All assemblies built successfully."