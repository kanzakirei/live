@echo off
chcp 65001 > nul

pushd "../html" > nul
for %%f in (*.html) do (
  call :MainFile %%f ../%%f
)
for %%f in (posts/*.html) do (
  call :MainFile posts/%%f ../posts/%%f
)
for %%f in (*.tmp) do (
  del %%f
)
popd > nul
exit /b 0

:MainFile
rem if "%~t2" GTR "%~t1" (
rem   exit /b 0
rem )
set InDir=%1
set OutDir=%2
type nul>head.tmp
type nul>body.tmp
type nul>main.tmp
type nul>footer.tmp
type nul>%OutDir%
for /f "delims=" %%t in (%InDir%) do (
  echo "%%t" | find "include" > nul
  if not ERRORLEVEL 1 (
    set key=%%t
    setlocal enabledelayedexpansion
    set key=!key:^<^!--include =!
    set key=!key:--^>=!
    call :IncludeFile !key!
    endlocal
  ) else (
    (echo.%%t) >> %OutDir%
    echo "%%t" | find "<head>" > nul
    if not ERRORLEVEL 1 type head.tmp>>%OutDir%
    echo "%%t" | find "<body>" > nul
    if not ERRORLEVEL 1 type body.tmp>>%OutDir%
    echo "%%t" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>%OutDir%
    echo "%%t" | find "<footer>" > nul
    if not ERRORLEVEL 1 type footer.tmp>>%OutDir%
  )
)
echo Include %~nx2
exit /b 0

:IncludeFile
for /f "delims=" %%i in (%1) do (
  echo "%%i" | find "<head>" > nul
  if not ERRORLEVEL 1 (set tag=head) else (
    echo "%%i" | find "</head>" > nul
    if not ERRORLEVEL 1 (set tag=0) else (
      echo "%%i" | find "<body>" > nul
      if not ERRORLEVEL 1 (set tag=body) else (
        echo "%%i" | find "</body>" > nul
        if not ERRORLEVEL 1 (set tag=0) else (
          echo "%%i" | find "<main>" > nul
          if not ERRORLEVEL 1 (set tag=main) else (
            echo "%%i" | find "</main>" > nul
            if not ERRORLEVEL 1 (set tag=0) else (
              echo "%%i" | find "<footer>" > nul
              if not ERRORLEVEL 1 (set tag=footer) else (
                echo "%%i" | find "</footer>" > nul
                if not ERRORLEVEL 1 (set tag=0) else (
                  setlocal enabledelayedexpansion
                  if !tag! == head (echo.%%i) >> head.tmp
                  if !tag! == body (echo.%%i) >> body.tmp
                  if !tag! == main (echo.%%i) >> main.tmp
                  if !tag! == footer (echo.%%i) >> footer.tmp
                  endlocal
                )
              )
            )
          )
        )
      )
    )
  )
)
exit /b 0
