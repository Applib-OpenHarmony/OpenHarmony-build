@ECHO off

:main
echo Enter an option:
echo.
echo JAVA
echo JS
echo.
:C1
set /p LANG="enter an option:"

if %LANG%==JAVA (
    goto JAVA
) else if %LANG%==JS (
    goto JS    
) else (
    cls 
	echo you got errorlevel
	echo.
	echo.
	echo you didn'nt enter right option
)	

:JAVA
cls
powershell -Command "(get-content build.gradle) -replace """"apply plugin: 'com.huawei.ohos.app'"""", """"$&`napply plugin: 'checkstyle'"""" | set-content build.gradle"
powershell -Command "add-content build.gradle \"task checkstyle(type: Checkstyle){`r`n`tshowViolations = true`r`n`tconfigFile file(`""config/checkstyle.xml"`"")`r`n`tsource 'entry/src/main/java'`r`n`tsource 'instalike/src/main/java'`r`n`tinclude '**/*.java'`r`n`tclasspath = files()`r`n`t}`r`n`t} `r`n`t checkstyle {`r`n`t toolversion '8.43' `n}\" "

pause >nul

:JS
cls
echo js is this
pause >nul 


echo %github.repository%
echo %GITHUB_REPOSITORY%
powershell -Command "(get-content build.gradle) -replace """"apply plugin: 'com.huawei.ohos.app'"""", """"$&`napply plugin: 'org.sonarqube'"""" | set-content build.gradle"
powershell -Command "(get-content build.gradle) -replace """"classpath 'com.huawei.ohos:decctest:1.2.6.0'"""", """"$&`nclasspath 'org.sonarsource.scanner.gradle:sonarqube-gradle-plugin:3.3'"""" | set-content build.gradle"
powershell -Command "add-content build.gradle \" sonarqube {`r`n`tproperties {`r`n`t property `""sonar.projectKey"`"", "`""applibgroup_"`"%GITHUB_REPOSITORY%"`""`"" `r`n`t property "`""sonar.organization"`"", "`""applibgroup"`""`r`n`t property "`""sonar.host.url"`"", "`""https://sonarcloud.io/"`""`r`n`t property "`""sonar.sources"`"", "`""entry/src"`""`r`n`t property "`""sonar.java.binaries"`"", "`""entry/build"`"" `r`n`t property `""sonar.eslint.reportPaths"`"", "`""D:/a/"%GITHUB_REPOSITORY%"/"%GITHUB_REPOSITORY%"/result.json"`"" `r`n`t}`r`n}\""


Type build.gradle


pause
