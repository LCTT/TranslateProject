[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OpenAssessIt Tooklit helps improve website accessibility)
[#]: via: (https://opensource.com/article/19/6/openassessit-toolkit)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas/users/petercheer)

OpenAssessIt Tooklit helps improve website accessibility
======
Open source application reports website accessibility problems in
human-readable format so it is easier to find and fix them.
![web development and design, desktop and browser][1]

People with disabilities often feel [excluded from society][2], despite laws like the Americans with Disabilities Act and the UK's Equality Act 2010 that were created to safeguard accessibility for people with different abilities. This is even true on the web. According to the [Web Accessibility Initiative][3]:

> _When websites and web tools are properly designed and coded, people with disabilities can use them. However, currently many sites and tools are developed with accessibility barriers that make them difficult or impossible for some people to use._

Unfortunately, because of poor website design decisions, a lot of content on the web (such as PDFs) is not accessible to people with hearing, sight, mobility, neurological, and other disabilities, and as the population rapidly ages, accessibility-related problems will increase.

Fortunately, many businesses, governments, and other organizations are taking strides to remedy inaccessible websites. There are two paths to achieving accessibility: fixing existing websites and doing the right things when sites are created. Fixing a website that has been in use for many years—with hundreds of pages, posts, images, and PDFs—can be a daunting task. Every element must be scrutinized for problems, and sometimes the fix is not obvious nor easy to accomplish.

There are many [tools][4] available to check and fix website accessibility issues, including [OpenAssessIt Toolkit][5], a new open source tool developed by [Joel Crawford-Smith][6], a self-described "relentless web accessibility fanatic" and "cat aficionado."

[OpenAssessIt][7] converts [Chrome Lighthouse][8] files into visual, human-readable web accessibility assessments. Lighthouse audits websites for accessibility issues and reports its findings as text that can be viewed in the browser or exported as a JSON file with valuable hidden data.

OpenAssessIt consumes Lighthouse's data-rich JSON files and outputs them in [Markdown][9], which is easy for people to read and edit. It also takes screenshots of each failing element and provides suggestions on how to fix each issue. Automated tools help detect accessibility issues, but a human must evaluate the validity and seriousness of each problem. "Seeing the issues visually [is] a good tool for training and development," Joel says.

The toolkit also includes [OpenDiffIt][10] to help prevent accidentally re-checking PDF files that have already been validated as accessible. It identifies new or modified PDF files by comparing user-generated CSV files from server logs or analytics, generating a unique hash for every file, and marking each one as New, Same, or Modified (based on the hash). By using OpenDiffIt, users can make sure all new or revised PDF files are validated without doing unnecessary work.

### OpenAssessIt development

Joel developed the OpenAssessIt Toolkit with Python, which he says "makes development fun."

OpenAssessIt is available as a native version that requires Python, headless Chrome, and Selenium, and as a simple Docker version, which doesn't require any Python knowledge to use. OpenDiffIt is only available as a Python version, but Joel says he hopes to make a Docker version available soon.

Joel concedes the OpenAssessIt Toolkit is still in a "primitive" stage and says it is a good option for people who don't have the money for big, enterprise-wide solutions. He hopes the software will be politely "roasted" by the open source community to help him improve it. He would also like help to give the tool a graphical user interface that is easier for less tech-savvy people to use.

Accessibility is an ongoing endeavor, and people like Joel Crawford-Smith are making the task less daunting by developing open source solutions.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/openassessit-toolkit

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas/users/petercheer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh (web development and design, desktop and browser)
[2]: https://rightsinfo.org/49-of-disabled-people-feel-excluded-from-society/
[3]: https://www.w3.org/WAI/
[4]: https://www.w3.org/WAI/ER/tools/
[5]: https://github.com/OpenAssessItToolkit
[6]: http://joelcrawfordsmith.com/
[7]: https://github.com/OpenAssessItToolkit/openassessit
[8]: https://developers.google.com/web/tools/lighthouse/
[9]: https://en.wikipedia.org/wiki/Markdown
[10]: https://github.com/OpenAssessItToolkit/opendiffit
