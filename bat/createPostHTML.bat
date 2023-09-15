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
set html=%~n1.html
call :MainFile %1 %html% ../../%html%
exit /b 0

:MainFile

if "%~t3" GTR "%~t1" (
  rem exit /b 0
)

set InDir=%1
set OutDir=%2
call :PostFile %InDir%
echo %InDir% to %OutDir%
type nul>%OutDir%
call :RowCount ../library/postBase.html
for /f "delims=" %%t in (../library/postBase.html) do (
    set row=%%t
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    echo !row!>>%OutDir%
    echo "!row!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%

    set /a Count=Count+1
    echo !Count!/!MaxCount!
    endlocal
)
exit /b 0

:PostFile
echo %1
type nul>main.tmp
echo ^<br^>^<br^>>>main.tmp
for /f "delims=" %%t in (%1) do (
    set row=    ^<p^>%%t^<br^>^</p^>
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    echo !row!>>main.tmp
    endlocal
)
echo ^<br^>^<br^>>>main.tmp
echo;
exit /b 0

:RowCount
for /f "usebackq delims=" %%A in (`find /c /v "" ^< %1`) do set MaxCount=%%A