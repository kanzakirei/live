@echo off
chcp 65001 > nul

pushd "../" > nul
for %%f in (*.html) do (
  if not exist html/%%f (
    del %%f
  )
)
popd > nul
exit /b 0
