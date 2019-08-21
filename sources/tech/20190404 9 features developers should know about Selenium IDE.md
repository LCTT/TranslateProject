[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 features developers should know about Selenium IDE)
[#]: via: (https://opensource.com/article/19/4/features-selenium-ide)
[#]: author: (Al Sargent https://opensource.com/users/alsargent)

9 features developers should know about Selenium IDE
======
The new Selenium IDE brings the benefits of functional test automation
to many IT professionals—and to frontend developers specifically.
![magnifying glass on computer screen][1]

There has long been a stigma associated with using record-and-playback tools for testing rather than scripted QA automation tools like [Selenium Webdriver][2], [Cypress][3], and [WebdriverIO][4].

Record-and-playbook tools are perceived to suffer from many issues, including a lack of cross-browser support, no way to run scripts in parallel or from CI build scripts, poor support for responsive web apps, and no way to quickly diagnose frontend bugs.

Needless to say, it's been somewhat of a rough road for these tools, and after Selenium IDE [went end-of-life][5] in 2017, many thought the road for record and playback would end altogether.

Well, it turns out this perception was wrong. Not long after the Selenium IDE project was discontinued, my colleagues at [Applitools approached the Selenium open source community][6] to see how they could help.

Since then, much of Selenium IDE's code has been revamped. The code is now freely available on GitHub under an Apache 2.0 license, managed by the Selenium community, and supported by [two full-time engineers][7], one of whom literally wrote the book on [Selenium testing][8].

![Selenium IDE's GitHub repository][9]

The new Selenium IDE brings the benefits of functional test automation to many IT professionals—and to frontend developers specifically. Here are nine things developers should know about the new Selenium IDE.

### 1\. Selenium IDE is now cross-browser

When the record-and-playback tool first came out in 2006, Firefox was the shiny new browser it hitched its wagon to, and it remained that way for a decade. No more! Selenium IDE is now available as a [Google Chrome Extension][10] and [Firefox Add-on][11].

Even better, Selenium IDE can run its tests on Selenium WebDriver servers by using Selenium IDE's new command-line test runner, [SIDE Runner][12]. SIDE Runner blends elements of Selenium IDE and Selenium Webdriver. It takes a Selenium IDE script, saved as a [**.side** file][13], and runs it using browser drivers such as [ChromeDriver][14], [EdgeDriver][15], Firefox's [Geckodriver][16], [IEDriver][17], and [SafariDriver][18].

SIDE Runner and the other drivers above are available as [straightforward npm installs][12]. Here's what it looks like in action.

![SIDE Runner][19]

### 2\. No more brittle functional tests

For years, brittle tests have been an issue for functional tests—whether you record them or code them by hand. Now that developers are releasing new features more frequently, their user interface (UI) code is constantly changing as well. When a UI changes, object locators often change, too.

Selenium IDE fixes that by capturing multiple object locators when you record your script. During playback, if Selenium IDE can't find one locator, it tries each of the other locators until it finds one that works. Your test will fail only if none of the locators work. This doesn't guarantee scripts will always play back, but it does insulate scripts against numerous changes. As you can see below, Selenium IDE captures linkText, an xPath expression, and CSS-based locators.

![Selenium IDE captures linkText, an xPath expression, and CSS-based locators][20]

### 3\. Conditional logic to handle UI features

When testing web apps, scripts have to handle intermittent UI elements that can randomly appear in your app. These come in the form of cookie notices, popups for special offers, quote requests, newsletter subscriptions, paywall notifications, adblocker requests, and more.

Conditional logic is a great way to handle these intermittent UI features. Developers can easily insert conditional logic—also called control flow—into Selenium IDE scripts. [Here are details][21] and how it looks.

![Selenium IDE's Conditional logic][22]

### 4\. Support for embedded code

As broad as the new [Selenium IDE API][23] is, it doesn't do everything. For this reason, Selenium IDE has **[**execute** **script**][24]** and **[execute async script][25]** commands that let your script call a JavaScript snippet.

This provides developers with a tremendous amount of flexibility to take advantage of JavaScript's flexibility and wide range of libraries. To use it, click on the test step where you want JavaScript to run, choose **Insert New Command** , and enter **execute script** or **execute async script** in the command field, as shown below.

![Selenium IDE's command line][26]

### 5\. Selenium IDE runs from CI build scripts

Because SIDE Runner is called from the command line, you can easily fit it into CI build scripts, so long as the CI server can call **selenium-ide-runner** and upload the **.side** file (the test script) as a build artifact. For example, here's how to upload an input file in [Jenkins][27], [Travis][28], and [CircleCI][29].

This means Selenium IDE can be better integrated into the software development technology stack. In addition, the scripts created by less-technical QA team members—including business analysts—can run with every build. This helps better align QA with the developer so fewer bugs escape into production.

### 6\. Support for third-party plugins

Imagine companies building plugins to have Selenium IDE do all kinds of things, like uploading scripts to a functional testing cloud, a load testing cloud, or a production application monitoring service.

Plenty of companies have integrated Selenium Webdriver into their offerings, and I bet the same will happen with Selenium IDE. You can also [build your own Selenium IDE plugin][30].

### 7\. Visual UI testing

Speaking of new plugins, Applitools introduced a new Selenium IDE plugin to add artificial intelligence-powered visual validations to the equation. Available through the [Chrome][31] and [Firefox][32] stores via a three-second install, just plug in the Applitools API key and go.

Visual checkpoints are a great way to ensure a UI renders correctly. Rather than a bunch of assert statements on all the UI elements—which would be a pain to maintain—one visual checkpoint checks all your page elements.

Best of all, visual AI looks at a web app the same way a human does, ignoring minor differences. This means fewer fake bugs to frustrate a development team.

### 8\. Visually test responsive web apps

When testing the visual layout of [responsive web apps][33], it's best to do it on a wide range of screen sizes (also called viewports) to ensure nothing appears out of whack. It's all too easy for responsive web bugs to creep in, and when they do, the problems can range from merely cosmetic to business stopping.

When you use visual UI testing for Selenium IDE, you can visually test your webpages on the Applitools [Visual Grid][34], which has more than 100 combinations of browsers, emulated devices, and viewport sizes.

Once tests run on the Visual Grid, developers can easily check the test results on all the various combinations.

![Selenium IDE's Visual Grid][35]

### 9\. Responsive web bugs have nowhere to hide

Selenium IDE can help pinpoint the cause of frontend bugs. Every Selenium IDE script that's run with the Visual Grid can be analyzed with Applitools' [Root Cause Analysis][36]. It's no longer enough to find a bug—developers also need to fix it.

When a visual bug is discovered, it can be clicked on and just the relevant (not all) Document Object Model (DOM) and CSS differences will be displayed.

![Finding visual bugs][37]

In summary, much like many emerging technologies in software development, Selenium IDE is part of a larger trend of making life easier and simpler for technical professionals and enabling them to spend more time and effort on creating code for even faster feedback.

* * *

_This article is based on[16 reasons why to use Selenium IDE in 2019 (and 2 why not)][38] originally published on the Applitools blog._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/features-selenium-ide

作者：[Al Sargent][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alsargent
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://www.seleniumhq.org/projects/webdriver/
[3]: https://www.cypress.io/
[4]: https://webdriver.io/
[5]: https://seleniumhq.wordpress.com/2017/08/09/firefox-55-and-selenium-ide/
[6]: https://seleniumhq.wordpress.com/2018/08/06/selenium-ide-tng/
[7]: https://github.com/SeleniumHQ/selenium-ide/graphs/contributors
[8]: http://davehaeffner.com/
[9]: https://opensource.com/sites/default/files/uploads/selenium_ide_github_graphic_1.png (Selenium IDE's GitHub repository)
[10]: https://chrome.google.com/webstore/detail/selenium-ide/mooikfkahbdckldjjndioackbalphokd
[11]: https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/
[12]: https://www.seleniumhq.org/selenium-ide/docs/en/introduction/command-line-runner/
[13]: https://www.seleniumhq.org/selenium-ide/docs/en/introduction/command-line-runner/#launching-the-runner
[14]: http://chromedriver.chromium.org/
[15]: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
[16]: https://github.com/mozilla/geckodriver
[17]: https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver
[18]: https://developer.apple.com/documentation/webkit/testing_with_webdriver_in_safari
[19]: https://opensource.com/sites/default/files/uploads/selenium_ide_side_runner_2.png (SIDE Runner)
[20]: https://opensource.com/sites/default/files/uploads/selenium_ide_linktext_3.png (Selenium IDE captures linkText, an xPath expression, and CSS-based locators)
[21]: https://www.seleniumhq.org/selenium-ide/docs/en/introduction/control-flow/
[22]: https://opensource.com/sites/default/files/uploads/selenium_ide_conditional_logic_4.png (Selenium IDE's Conditional logic)
[23]: https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/
[24]: https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#execute-script
[25]: https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#execute-async-script
[26]: https://opensource.com/sites/default/files/uploads/selenium_ide_command_line_5.png (Selenium IDE's command line)
[27]: https://stackoverflow.com/questions/27491789/how-to-upload-a-generic-file-into-a-jenkins-job
[28]: https://docs.travis-ci.com/user/uploading-artifacts/
[29]: https://circleci.com/docs/2.0/artifacts/
[30]: https://www.seleniumhq.org/selenium-ide/docs/en/plugins/plugins-getting-started/
[31]: https://chrome.google.com/webstore/detail/applitools-for-selenium-i/fbnkflkahhlmhdgkddaafgnnokifobik
[32]: https://addons.mozilla.org/en-GB/firefox/addon/applitools-for-selenium-ide/
[33]: https://en.wikipedia.org/wiki/Responsive_web_design
[34]: https://applitools.com/visualgrid
[35]: https://opensource.com/sites/default/files/uploads/selenium_ide_visual_grid_6.png (Selenium IDE's Visual Grid)
[36]: https://applitools.com/root-cause-analysis
[37]: https://opensource.com/sites/default/files/uploads/seleniumice_rootcauseanalysis_7.png (Finding visual bugs)
[38]: https://applitools.com/blog/why-selenium-ide-2019
