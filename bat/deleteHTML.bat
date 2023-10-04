@echo off
chcp 65001 > nul
cd %~dp0 > nul

pushd "../" > nul
for %%f in (*.html) do (
  if not exist "html/%%f" (
    echo Delete %%f
    del %%f
  )
)
popd > nul
exit /b 0
