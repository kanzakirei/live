@echo off
pushd "../img" > nul
set tool=../bat/cavif.exe
for /r %%f in (*.png,*.jpg) do (
  if not exist %%~dpnf.avif %tool% %%f
)
popd > nul
exit /b %errorlevel%
