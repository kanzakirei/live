@echo off
chcp 65001 > nul
cd %~dp0 > nul

call includeHTML.bat
if %errorlevel% neq 0 (
  echo インクルードに失敗しました。
  exit /b %errorlevel%
)

rem call convertAVIF.bat
if %errorlevel% neq 0 (
  echo AVIF変換に失敗しました。
  pause
  exit /b %errorlevel%
)

exit /b 0
