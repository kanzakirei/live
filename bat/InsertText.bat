
set InportFile=%1
set ExportFile=%1
set InsertFile=%2
set KeyString=%3

if not exist %InsertFile% (
  echo Not exist %InsertFile%
  exit /b 1
)
if not exist %InportFile% (
  echo Not exist %InportFile%
  exit /b 1
)
if not exist %ExportFile% (
  echo Not exist %ExportFile%
  exit /b 1
)

type nul>temp.txt
for /f "tokens=1* delims=: eol=" %%x in ('findstr /n "^" %InportFile%') do (
  (echo.%%y) >> temp.txt
  (echo "%%y") | find "%KeyString%" > nul
  if not ERRORLEVEL 1 (
    type %InsertFile%>>temp.txt
    (echo.) >> temp.txt
  )
)
exit /b 0