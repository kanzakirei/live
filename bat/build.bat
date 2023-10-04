@echo off
chcp 65001 > nul

call bat/createPostHTML.bat
if %errorlevel% neq 0 (
  echo Failure: createPostHTML.bat
  exit /b %errorlevel%
)

call bat/includeHTML.bat
if %errorlevel% neq 0 (
  echo Failure: includeHTML.bat
  exit /b %errorlevel%
)

call bat/deleteHTML.bat
if %errorlevel% neq 0 (
  echo Failure: deleteHTML.bat
  exit /b %errorlevel%
)

call bat/deletePostHTML.bat
if %errorlevel% neq 0 (
  echo Failure: deletePostHTML.bat
  exit /b %errorlevel%
)

rem call bat/convertAVIF.bat
if %errorlevel% neq 0 (
  echo Failure: convertAVIF.bat
  exit /b %errorlevel%
)
exit /b %errorlevel%
