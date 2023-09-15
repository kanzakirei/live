@echo off
pushd "../html/posts" > nul
for %%f in (*.txt) do (
  call :Path %%f
)
for %%f in (*.tmp) do (
  del %%f
)
popd > nul
exit /b 0

:Path
call :MainFile %1 %~n1.html
exit /b 0

:MainFile
if "%~t2" GTR "%~t1" (
  exit /b 0
)
set InDir=%1
set OutDir=%2
call :PostFile %InDir%

echo %InDir% to %OutDir%
type nul>%OutDir%
for /f "delims=" %%t in (../library/postBase.html) do (
    set row=%%t
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    echo !row!>>%OutDir%
    echo !row!
    echo "!row!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%
    endlocal
)
echo;
exit /b 0

:PostFile
echo %1
type nul>main.tmp
echo ^<br^>^<br^>>>main.tmp
for /f "delims=" %%t in (%1) do (
    set row=    ^<p^>%%t^<br^>^</p^>
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    echo !row!
    echo !row!>>main.tmp
    endlocal
)
echo ^<br^>^<br^>>>main.tmp
echo;
exit /b 0
