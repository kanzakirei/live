@echo off
chcp 65001 > nul

pushd "../html/posts" > nul
for %%f in (*.html) do (
  del %%f
)
popd > nul
pushd "../posts" > nul
for %%f in (*.html) do (
  call :DeleteHTML ../html/posts/%%f
)
popd > nul
exit /b 0

:DeleteHTML
if not exist %~pn1.txt (
  del %~nx1
)
exit /b 0