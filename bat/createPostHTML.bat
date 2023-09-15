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
set html=%~n1.html
call :MainFile %1 %html% ../../%html%
exit /b 0

:MainFile
if "%~t3" GTR "%~t1" (
  rem exit /b 0
)

set InDir=%1
set OutDir=%2
set BaseHTML=../library/postBase.html
call :PostFile %InDir%

set Count=0
type nul>%OutDir%
for /f "delims=" %%t in (%BaseHTML%) do (
    set row=%%t
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    echo !row!>>%OutDir%
    echo "!row!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%
    endlocal

    if exist %%t (set /a Count=Count+1)
    call ../../bat/rowCount.bat %Count% %BaseHTML%
)
exit /b 0

:PostFile
set Count=0
type nul>main.tmp
echo ^<br^>^<br^>>>main.tmp
for /f "delims=" %%t in (%1) do (
    setlocal enabledelayedexpansion
    set row=    ^<p^>%%t^<br^>^</p^>
    set row=!row:../=../../!
    echo !row!>>main.tmp
    endlocal

    if exist %%t (set /a Count=Count+1)
    call ../../bat/rowCount.bat !Count! %1
)
echo ^<br^>^<br^>>>main.tmp
exit /b 0
