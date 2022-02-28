echo %LANG%
$value=%LANG%
if ( $value -is JAVA )
{
gradlew assembleDebug checkstyle sonarqube --info
}
if ( $value -is JS )
{
echo "executing eslint"
.\node_modules\.bin\eslint -c ${{ github.workspace }}\SDK\config\.eslintrc.js entry -o report.html
echo "executing gradle"
gradlew assembleDebug sonarqube --info
}
