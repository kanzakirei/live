@echo off
chcp 65001 > nul

for /r %%f in (../img/*.png,../img/*.jpg) do (
  if not exist %%~dpnf.avif (
    call cavif.exe %%f
  )
)
exit /b 0
