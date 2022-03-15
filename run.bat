set $ErrorActionPreference = 'SilentlyContinue'
echo %LANG%
echo "executing eslint"
.\node_modules\.bin\eslint -c ${{ github.workspace }}\SDK\config\.eslintrc.js --format json entry --output-file result.json
echo "executing gradle"
gradlew assembleDebug sonarqube --info
