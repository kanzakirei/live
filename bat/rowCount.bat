@echo off
for /f "usebackq delims=" %%A in (`find /c /v "" ^< %2`) do (
  echo %2 ^[%1/%%A^]
)