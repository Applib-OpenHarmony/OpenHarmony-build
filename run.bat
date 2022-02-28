echo %LANG%
IF "%LANG%"=="JAVA" gradlew assembleDebug checkstyle sonarqube --info
IF "%LANG%"=="JS" .\node_modules\.bin\eslint -c ${{ github.workspace }}\SDK\config\.eslintrc.js entry -o report.html; gradlew assembleDebug sonarqube --info
IF "%LANG%"=="C" REM do "%LANG%
