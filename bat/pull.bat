@echo off
chcp 65001 > nul

pushd %~dp0
cd ..\
git pull
popd