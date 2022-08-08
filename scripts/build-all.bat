@ECHO OFF
REM Build Everything

ECHO "Building everything..."


IF "%CI%" == "true" (
    PUSHD "../engine"
    CALL build.bat 
    POPD
) else (
    PUSHD engine
    CALL build.bat
    POPD
)

IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

IF "%CI%" == "true" (
    PUSHD "../testbed"
    CALL build.bat 
    POPD
) else (
    PUSHD testbed
    CALL build.bat
    POPD
)

IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

ECHO "All assemblies built successfully." 
