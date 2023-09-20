@echo off
chcp 65001 > nul

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
  exit /b 0
)

set InDir=%1
set OutDir=%2
set BaseHTML=../library/postBase.html
call :PostFile %InDir%

type nul>%OutDir%
for /f "delims=" %%t in (%BaseHTML%) do (
    set row=%%t
    setlocal enabledelayedexpansion
    set row=!row:../=../../!
    (echo.!row!) >> %OutDir%

    echo "!row!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%
    endlocal
)
echo CreatePost %~nx2
exit /b 0

:PostFile
type nul>main.tmp
echo ^<br^>^<br^>>>main.tmp
for /f "tokens=1* delims=: eol=" %%x in ('findstr /n "^" %1') do (
    (echo.   ^<p^>%%y^<br^>^</p^>) >> main.tmp
)
echo ^<br^>^<br^>>>main.tmp
exit /b 0
