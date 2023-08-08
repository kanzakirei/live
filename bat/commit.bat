pushd %~dp0
cd ..\
git add .
git commit -m "jenkins build"
git push origin main
popd