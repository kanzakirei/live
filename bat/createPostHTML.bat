a

@echo off
pushd "../html" > nul
for %%f in (posts/*.txt) do call :MainFile %%f
for %%f in (*.tmp) do del %%f
popd > nul
exit /b 0

:MainFile
echo %1
type nul>main.tmp
type nul>../%1
call :PostFile %1
for /f "delims=" %%t in (library/postBase.html) do (
    set dirFix=%%t
    setlocal enabledelayedexpansion
    set dirFix=!dirFix:../=!
    echo !dirFix!>>../%1
    echo "!dirFix!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>../%1
    endlocal
    echo|set /p="."
)
echo;
exit /b 0

:PostFile
for /f "delims=" %%t in (%1) do (
    echo ^<p^>%%t^<br^>^</p^>>>main.tmp
    echo|set /p="."
)
exit /b 0
