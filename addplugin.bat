@ECHO off
powershell -Command "(get-content build.gradle) -replace """"apply plugin: 'com.huawei.ohos.app'"""", """"$&`napply plugin: 'org.sonarqube'"""" | set-content build.gradle"
powershell -Command "(get-content build.gradle) -replace """"classpath 'com.huawei.ohos:decctest:1.2.6.0'"""", """"$&`nclasspath 'org.sonarsource.scanner.gradle:sonarqube-gradle-plugin:3.3'"""" | set-content build.gradle"
powershell -Command "add-content build.gradle \" sonarqube {`r`n`tproperties {`r`n`t property `""sonar.projectKey"`"", "`""applibgroup_Pagination"`""`r`n`t property "`""sonar.organization"`"", "`""applibgroup"`""`r`n`t property "`""sonar.host.url"`"", "`""https://sonarcloud.io/"`""`r`n`t property "`""sonar.sources"`"", "`""entry/src"`""`r`n`t property "`""sonar.java.binaries"`"", "`""entry/build"`"" `r`n`t property `""sonar.eslint.reportPaths"`"", "`""D:/a/pagination/pagination/result.json"`"" `r`n`t}`r`n}\""


pause
