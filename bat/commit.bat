pushd %~dp0
cd ..\
git add .
git commit -m "jenkins build"
git push -u origin main
popd