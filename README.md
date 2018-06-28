# NYArticleTestApp
A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 

We'll be using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

This is configurable in Constants.Swift file in Project. 
We used MVVM Design pattern and swift genric approach to develop this application.


App Screen Shots:

 ![alt text](https://user-images.githubusercontent.com/15336778/42052619-db489406-7b2c-11e8-8235-f70d52de66af.png)
 
 ![alt text](https://user-images.githubusercontent.com/15336778/42052611-d8fd002e-7b2c-11e8-83f8-fded1945c085.png)
 
 ![alt text](https://user-images.githubusercontent.com/15336778/42052620-db949446-7b2c-11e8-8c70-36acb8cdab6a.png)


## Installing

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependcy SDWebImageView, install SDWebImageView using Cocopods
* Press run icon in Xcode or command + R to run the project on Simulator


## Running the tests

Follow the steps to get test case reports:
* Enable coverge Data:


![alt text](https://user-images.githubusercontent.com/15336778/42052639-ecb7c888-7b2c-11e8-8931-637b49a0d0d2.png)



![alt text](https://user-images.githubusercontent.com/15336778/42052638-ec70c69a-7b2c-11e8-983c-527378e3da27.png)


* Tap on covergae tab to view test case coverge.


## Design pattern used
MVVM:
![alt text](https://user-images.githubusercontent.com/15336778/41942613-a4008032-79bd-11e8-98b5-a40e7d871203.png)


## MIT License

Copyright 2018

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
