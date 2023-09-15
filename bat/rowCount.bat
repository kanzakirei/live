@echo off
for /f "usebackq delims=" %%A in (`type %1 | find /c /v ""`) do set MaxCount=%%A