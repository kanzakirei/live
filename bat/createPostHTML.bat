@echo off
pushd "../html" > nul
for %%f in (posts/*.txt) do call :MainFile Posts/%%f
for %%f in (*.tmp) do del %%f
popd > nul
exit /b 0

:MainFile
call :PostFile %1
echo %~n1.html
type nul>main.tmp
type nul>%~n1.html
for /f "delims=" %%t in (library/postBase.html) do (
    set dirFix=%%t
    setlocal enabledelayedexpansion
    echo !dirFix!>>%~n1.html
    echo "!dirFix!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%~n1.html
    endlocal
    echo|set /p="."
)
echo;
exit /b 0

:PostFile
echo %1
for /f "delims=" %%t in (%1) do (
    echo ^<p^>%%t^<br^>^</p^>>>main.tmp
    echo ^<p^>%%t^<br^>^</p^>
    echo|set /p="."
)
exit /b 0
