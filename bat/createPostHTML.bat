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
set BaseHTML=../library/postBase.html
call :PostFile %InDir%

type nul>%OutDir%
setlocal enabledelayedexpansion
call :RowCount %BaseHTML%
set /a Count=0
for /f "delims=" %%t in (%BaseHTML%) do (
    set row=%%t
    set row=!row:../=../../!
    echo !row!>>%OutDir%
    echo "!row!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%

    set /a Count=!Count!+1
    echo %OutDir%^[!Count!/!MaxCount!^]
)
endlocal
exit /b 0

:PostFile
echo %1
type nul>main.tmp
echo ^<br^>^<br^>>>main.tmp
setlocal enabledelayedexpansion
call :RowCount %1
set /a Count=0
for /f "delims=" %%t in (%1) do (
    set row=    ^<p^>%%t^<br^>^</p^>
    set row=!row:../=../../!
    echo !row!>>main.tmp

    set /a Count=!Count!+1
    echo %1^[!Count!/!MaxCount!^]
)
endlocal
echo ^<br^>^<br^>>>main.tmp
echo;
exit /b 0

:RowCount
for /f "delims=" %%A in (`find /c /v "" ^< %1`) do set MaxCount=%%A
exit /b 0