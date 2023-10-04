@echo off
chcp 65001 > nul

for %%f in (*.html) do (
  if not exist "html/%%f" (
    echo Delete %%f
    del %%f
  )
)
exit /b 0
