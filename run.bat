echo %LANG%
echo "executing eslint"
.\node_modules\.bin\eslint -c SDK\config\.eslintrc.js entry -o report.html
echo "executing gradle"
gradlew assembleDebug sonarqube --info
