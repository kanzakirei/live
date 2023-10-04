@echo off
chcp 65001 > nul

pushd "html/posts" > nul
for %%f in (*.html) do (
  del %%f
)
popd > nul

pushd "posts" > nul
for %%f in (*.html) do (
  call :Delete ../html/posts/%%f
)
popd > nul
exit /b 0

:Delete
if not exist "%~pn1.txt" (
  echo Delete %~nx1
  del %~nx1
)
exit /b 0