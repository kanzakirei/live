@echo off
pushd "../html/posts" > nu
for %%f in (*.html) do (
  del %%f
)
popd > nul
exit /b 0
