set $ErrorActionPreference = 'SilentlyContinue'
echo %LANG%
echo "executing eslint"
.\node_modules\.bin\eslint --no-eslintrc --ext .js,.jsx,.ts,.tsx entry -o report.html --debug 
echo "executing gradle"
gradlew assembleDebug sonarqube --info
