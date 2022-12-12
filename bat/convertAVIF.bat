@echo off
set tool=%~dp0/cavif
pushd "../img" > nul
for /r %%f in (*.png,*.jpg) do (
  if not exist %%~dpnf.avif %tool% %%f
)
popd > nul
exit /b %errorlevel%
