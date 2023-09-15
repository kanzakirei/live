@echo off
pushd "../html/posts" > nul
for %%f in (*.html) do (
  del %%f
)
popd > nul
exit /b 0
