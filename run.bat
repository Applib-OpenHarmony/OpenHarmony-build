echo %LANG%
IF "%LANG%"=="JAVA" gradlew assembleDebug checkstyle sonarqube --info
IF "%LANG%"=="JS"  gradlew assembleDebug sonarqube --info
IF "%LANG%"=="C" REM do "%LANG%
