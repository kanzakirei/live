@echo off
for /f "usebackq delims=" %%A in (`find /c /v "" ^< %1`) do set MaxCount=%%A