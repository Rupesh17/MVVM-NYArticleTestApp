# NYArticleTestApp


A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 
* Show Cached articles if network not available


We'll are using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

This is configurable in Constants.Swift file in Project. 
We used MVVM Design pattern and swift generic approach to develop this application.
For CI/CD App using XcodeServer + Fastlane combination.

We are generating TestCase and Coverage report using three tools, you can opt out any one as per your connivance:
* **XcodeServer TestCase and Coverage report.**
* **Fastlane+scan+slather TestCase and Coverage reports.**
* **SonarQube TestCase and Coverage reports.**

&nbsp; 

**App Flow:**

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42991237-9fabac38-8c22-11e8-920f-faa03d0d5572.gif">
</kbd>

&nbsp; 
&nbsp;  

## Tools And Resources Used

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [fastlane](https://docs.fastlane.tools/) - The easiest way to automate building and releasing your iOS and Android apps.
- [SonarQube](https://github.com/Jintin/Swimat) - SonarQube provides the capability to not only show health of an application but also to highlight issues newly introduced. With a Quality Gate in place, you can fix the leak and therefore improve code quality systematically.
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [Scan](https://docs.fastlane.tools/actions/scan/) - Scan makes it easy to run tests of your iOS and Mac app on a simulator or connected device.
- [Sonar-swift](https://github.com/Backelite/sonar-swift) - This is an open source initiative for Apple Swift language support in SonarQube.
- [Slather](https://github.com/SlatherOrg/slather) - Generate test coverage reports for Xcode projects & hook it into CI.


## Library Used
- [SDWebImage](https://github.com/rs/SDWebImage) - This library provides an async image downloader with cache support.
Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
- [ReachabilitySwift ](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.

## TODO
* Sorting option for user to sort article based popularity, Date, Alphabetically 
* Refresh articles using pull to refresh or refresh button.
* Configure fastlane lanes/XcodeServerBot for build creation and provising and certificate managment.
* Configure Fastlane  lanes for build upload on iTunesConnect.

&nbsp; 

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency SDWebImageView, install SDWebImageView using CocoaPods.
* Incase of build fail due to dependency ReachabilitySwift, install ReachabilitySwift using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator

&nbsp; 

# CI/CD 
Xcode Server + Fastlane combination is used for CI/CD. Xcode server bots post script will be used to trigger fastlane lanes. We canrun them using terminal also.

## XcodeServer And XcodeServer Bot

* Xcode server is setup on local development machine with a new user. Steps for Xcode Server Setup: 
https://developer.apple.com/library/content/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/index.html

* Xcode Bot is setup on development machine with git configuration using master branch. Bot run periodically once per-day and configured for the following jobs:
- Pull changes from remote repository if there any .
- Configure to test parallel on specific simulator.
- Run unit test cases.
- Run UI Test cases.
- Run the Static analyser for leaks and warnings.
- Generate the report for UnitTest,UITest,Static analyser on project codebase.
- We did not setup for exporting the build or code-singing for now as iTunes credential required. Once credential is there we can
setup these activity by re-edit the XcodeServer Bot .
- Post script for trigger fastlane lanes for screen shot and fastlane+scan code coverage.

To run fastlane lanes configure PATH in XcodeServer Bot configuration under environment tab

```
PATH="/usr/local/bin:$PATH"

```
&nbsp; 
&nbsp; 

### # XcodeServer Bot Report:

* Error : 0
* Warnings : 0
* Static Analyser issue : 0
* Total TestCase: 13
* Passed : 13
* Failed: 0

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42930280-2dc89450-8b5a-11e8-82c3-fb8129384b62.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 

### # XcodeServer Bot TestCase Code Coverage Report:   _89.72%_

* Total TestCase: 13
* Passed : 13
* Failed: 0
* TestCase Code Coverage: **89.72%**

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42930279-2d7ae232-8b5a-11e8-9461-99e10d745060.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42930281-2e16e466-8b5a-11e8-9a95-b5e573076066.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 


## Fastlane

Fastlane is setup on Xcode server and integrated in development project also for following activity (Lane):

* Generating TestCase success and code coverage reports using scan and slather.
* Generating screen shot.
* We did not setup code-singing for now as iTunesConnect credential required. Once credential is there we can setup these activity by creating new lane.


#### Installation

* Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install

```

* Install fastlane using  *gem install fastlane*

* For fastlane test coverage report install scan and slather 
* Install scan using  `gem install scan`
* Install slather  using  `gem install slather`

&nbsp; 

### # Fastlane ScreenShot Report:

* Run using Terminal
* Goto project directory $ cd project_directory_path
* Run command  `fastlane screenshots` to capture screen shots.

* Run using Xcode Server trigger with post script
* Add post script for screen shot in XcodeServer Bot.  Bot will trigger post script and screen shot will be generated in Server
XCBuildUser.
```
cd ProjectDir/NYTestApp
fastlane screenshots

```

* Captured screen shots will be found under path `projectDir/NYTestApp/fastlane/screenshots/en-US`
* Screen shots report will be found at path `projectDir/NYTestApp/fastlane/screenshots/screenshots.html`

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42933613-cbed24ea-8b62-11e8-8af1-db7c84ba1d1c.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp;

### # Fastlane + Scan + Slather Test Code Coverage Report : 88.92% 
* Run using Terminal
* Goto project directory $ cd project_directory_path
* Run command  `fastlane tests` to capture screen shots.

* Run using Xcode Server trigger with post script
* Add post script for screen shot in XcodeServer Bot.  Bot will trigger post script and screen shot will be generated in Server
XCBuildUser.
```
cd ProjectDir/NYTestApp
fastlane tests

```
* Coverage report will be found under path `projectDir/NYTestApp/fastlane/test_output/coverage/index.html`
* TestCase success report will be found under path `projectDir/NYTestApp/fastlane/test_output/report.html`

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42934536-184a6b52-8b65-11e8-862d-e86402d780d5.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 


<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42934478-f1da3484-8b64-11e8-8b9c-ed6ff1972d76.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 

##  SonarQube Integration

This is also another tool integrated for check project code health reports.

* Install and setup your SonaQube server and other dependency for sonarQube integration  with the help of https://github.com/Backelite/sonar-swift or another source.
* Project already contains  `run-sonar-swift.sh` and `sonar-project.properties` in project root folder.
* Once your server up, goto project directory and run the *sonar-scanner* command from terminal.
* After successful scan - 
* Use XcodeServer post script to analyses project and test coverage OR
* Run the command from project directory using terminal `$ sh run-sonar-swift.sh`
* On successful results, open browser and hit `http://localhost:9000/`, 
* You will see the project analyses, Tap on project analyses it will show detail reports 

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/42976598-08ba7a44-8be0-11e8-83bf-46563eb224b3.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 

# Architecture

We used MVVM :

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/41942613-a4008032-79bd-11e8-98b5-a40e7d871203.png" width="80%" height="80%">
</kbd>

</br>
</br>

# MIT License

Copyright 2018

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
