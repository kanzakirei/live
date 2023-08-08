pushd %~dp0
cd ..\
git add .
git commit -m "jenkins build"
pause
git push origin main
pause
popd