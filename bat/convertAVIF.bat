@echo off
chcp 65001 > nul

pushd "../img" > nul
for /r %%f in (*.png,*.jpg) do (
  if not exist %%~dpnf.avif (
	pushd "../bat" > nul
    call cavif.exe ../img/%%f
	popd > nul
  )
)
popd > nul
exit /b 0
