@echo off
chcp 65001 > nul

pushd "../img" > nul
for /r %%f in (*.png,*.jpg) do (
  if not exist %%~dpnf.avif (
    call "../bat/cavif.exe" %%f
  )
)
popd > nul
exit /b 0
