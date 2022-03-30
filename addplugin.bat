@ECHO off
echo %github.repository%
echo %GITHUB_REPOSITORY%
powershell -Command "(get-content build.gradle) -replace """"apply plugin: 'com.huawei.ohos.app'"""", """"$&`napply plugin: 'org.sonarqube'"""" | set-content build.gradle"
powershell -Command "(get-content build.gradle) -replace """"classpath 'com.huawei.ohos:decctest:1.2.6.0'"""", """"$&`nclasspath 'org.sonarsource.scanner.gradle:sonarqube-gradle-plugin:3.3'"""" | set-content build.gradle"
powershell -Command "add-content build.gradle \" sonarqube {`r`n`tproperties {`r`n`t property `""sonar.projectKey"`"", "`""applibgroup_"`"%GITHUB_REPOSITORY%"`""`"" `r`n`t property "`""sonar.organization"`"", "`""applibgroup"`""`r`n`t property "`""sonar.host.url"`"", "`""https://sonarcloud.io/"`""`r`n`t property "`""sonar.sources"`"", "`""entry/src"`""`r`n`t property "`""sonar.java.binaries"`"", "`""entry/build"`""`r`n`t property `""sonar.eslint.reportPaths"`"", "`""D:/a/"%GITHUB_REPOSITORY%"/"%GITHUB_REPOSITORY%"/result.json"`"" `r`n`t}`r`n}\""
set findstr /m "%Lang%"=="java" build.gradle
IF "%Lang%"=="java" (
powershell -Command "(get-content build.gradle) -replace """"apply plugin: 'com.huawei.ohos.app'"""", """"$&`napply plugin: 'checkstyle'"""" | set-content build.gradle"
powershell -Command "add-content build.gradle \" task checkstyle(type: Checkstyle) {`r`n`t showViolations = true `r`n`t configFile file ("`""config/checkstyle.xml"`"") `r`n`t source 'entry/src/main/java' `r`n`t source 'instalike/src/main/java' `r`n`t include '**/*.java' `r`n`t   // empty classpath `r`n`t classpath = files() `r`n`t}`r`n`t}   `r`n`t checkstyle {    `r`n`t toolVersion "`""8.43"`"" `r`n`t}\""

)

Type build.gradle


pause
