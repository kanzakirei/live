set InportFile=%1
set InsertFile=%2
set KeyString=%3
set ExportFile=%4
set TempFile=temp.txt

if not exist %InportFile% (
  echo Not exist %InportFile%
  exit /b 1
)
if not exist %InsertFile% (
  echo Not exist %InsertFile%
  exit /b 1
)
if not exist %ExportFile% (
  set ExportFile=%InportFile%
)

type nul>%TempFile%
for /f "tokens=1* delims=: eol=" %%x in ('findstr /n "^" %InportFile%') do (
  (echo.%%y) >> %TempFile%
  (echo "%%y") | find "%KeyString%" > nul
  if not ERRORLEVEL 1 (
    type %InsertFile%>>%TempFile%
    (echo.) >> %TempFile%
  )
)
type %TempFile%>%ExportFile%
del %TempFile%
exit /b 0