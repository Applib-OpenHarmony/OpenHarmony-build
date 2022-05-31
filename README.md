# Github action for building Open-HarmonyOs Libraries 


```xml   
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  hello_world_job:
    runs-on: windows-latest
    name: Build and Analyse
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'
          distribution: 'adopt'
      - uses: actions/setup-node@v2
        with:
          node-version: '14'
      - id: main
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          LANG: JS
        uses: Applib-OpenHarmony/OpenHarmony-build@v2.11
      - name: Upload Artifact
        uses: actions/upload-artifact@v2
        with: 
          name: assets-for-download
          path: build\outputs\hap\debug\phone
  sonarcloud:
    name: SonarCloud
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0  # Shallow clones should be disabled for a better relevancy of analysis
      - name: SonarCloud Scan
        uses: SonarSource/sonarcloud-github-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}  # Needed to get PR information, if any
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
```
