@echo off
chcp 65001 > nul
set Type=%1
shift
goto %Type%
exit /b 1

:Insert
set InportFile=%1
set InsertFile=%2
set KeyString=%3
set ExportFile=%4
set TempFile=temp
if not exist "%InportFile%" (
  echo Inport file ^(%%1^) not exist.
  exit /b 1
)
if not exist "%InsertFile%" (
  echo Insert file ^(%%2^) not exist.
  exit /b 1
)
if %KeyString%=="" (
  echo Search key ^(%%3^) is empty.
  exit /b 1
)
if "%ExportFile%"=="" (
  echo Export file ^(%%4^) not exist.
  echo Insert into import file.
  set ExportFile=%InportFile%
)
type nul>%TempFile%
for /f "tokens=1* delims=: eol=" %%x in ('findstr /n "^" %InportFile%') do (
  (echo.%%y) >> %TempFile%
  (echo "%%y") | find %KeyString% > nul
  if not ERRORLEVEL 1 (
    type %InsertFile%>>%TempFile%
    (echo.) >> %TempFile%
  )
)
type %TempFile%>%ExportFile%
del %TempFile%
exit /b 0
