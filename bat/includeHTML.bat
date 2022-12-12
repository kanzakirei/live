@echo off
pushd "../html" > nul
for %%f in (*.html) do call :MainFile %%f
for %%f in (*.tmp) do del %%f
popd > nul
exit /b 0

:MainFile
echo %1
type nul>head.tmp
type nul>body.tmp
type nul>main.tmp
type nul>footer.tmp
type nul>../%1
for /f "delims=" %%t in (%1) do (
  echo "%%t" | find "include" > nul
  if not ERRORLEVEL 1 (
    set key=%%t
    setlocal enabledelayedexpansion
    set key=!key:^<^!--include =!
    set key=!key:--^>=!
    call :IncludeFile !key!
    endlocal
  ) else (
    set dirFix=%%t
    setlocal enabledelayedexpansion
    set dirFix=!dirFix:../=!
    echo !dirFix!>>../%1
    echo "!dirFix!" | find "<head>" > nul
    if not ERRORLEVEL 1 type head.tmp>>../%1
    echo "!dirFix!" | find "<body>" > nul
    if not ERRORLEVEL 1 type body.tmp>>../%1
    echo "!dirFix!" | find "<main>" > nul
    if not ERRORLEVEL 1 type main.tmp>>../%1
    echo "!dirFix!" | find "<footer>" > nul
    if not ERRORLEVEL 1 type footer.tmp>>../%1
    endlocal
    echo|set /p="."
  )
)
echo;
exit /b 0

:IncludeFile
echo #include %1
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
                  if !tag! == head echo %%i>>head.tmp
                  if !tag! == body echo %%i>>body.tmp
                  if !tag! == main echo %%i>>main.tmp
                  if !tag! == footer echo %%i>>footer.tmp
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