@echo on
cd %CONDA_PREFIX%\share\openmm-torch\tests
dir
setlocal EnableDelayedExpansion
set "summary="
set "exitcode=0"
set "nl=^"

for %%f in (Test*) do (
    echo %%f | findstr /I "Cuda OpenCL" > nul
    if errorlevel 1 (
        echo Running %%f...
        .\%%f
        set "thisexitcode=!errorlevel!"
        set "summary=!summary!!nl!%%f: "
        if !thisexitcode! equ 0 (
            set "summary=!summary!OK"
        ) else (
            set "summary=!summary!FAILED"
        )
        set /a "exitcode+=!thisexitcode!"
    )
)

echo -------
echo Summary
echo -------
echo %summary%
exit /b %exitcode%