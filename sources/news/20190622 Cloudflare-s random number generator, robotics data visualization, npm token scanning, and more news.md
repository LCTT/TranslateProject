[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cloudflare's random number generator, robotics data visualization, npm token scanning, and more news)
[#]: via: (https://opensource.com/article/19/6/news-june-22)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Cloudflare's random number generator, robotics data visualization, npm token scanning, and more news
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, we take a look Cloudflare's open source random number generator, more open source robotics data, new npm functionality, and more!

### Cloudflare announces open source random number generator project

Is there such a thing as a truly random number? Internet security and services provider Cloudflare things so. To prove it, the company has formed [The League of Entropy][2], an open source project to create a generator for random numbers.

The League consists of Cloudflare and "five other organisations — predominantly universities and security companies." They share random numbers, using an open source tool called [Drand][3] (short for Distributed Randomness Beacon Daemon). The numbers are then "composited into one random number" on the basis that "several random numbers are more random than one random number." While the League's random number generator isn't intended "for any kind of password or cryptographic seed generation," Cloudflare's CEO Matthew Prince points out that if "you need a way of having a known random source, this is a really valuable tool."

### Cruise open sources robotics data analysis tool

Projects involved in creating self-driving vehicles generate petabytes of data. And with amounts of data that large comes the challenge of quickly and effectively analyzing it. To make the task easier, General Motors subsidiary Cruise has made its Webviz data visualization tool "[freely available to developers][4] in need of a modular robotics analysis solution."

Webviz "takes as input any bag file (the message format used by the popular Robot Operating System) and outputs charts and graphs." It "contains a collection of general panels (which visualize data) applicable to most robotics developers," said Esther Weon, a software engineer at Cruise. The company also plans to "release a public API that’ll allow developers to build custom panels themselves."

The code for Webviz is [available on GitHub][5], where you can download or contribute to the project.

### npm provides more security

The team behind npm, the site providing JavaScript package hosting, has a new collaboration with GitHub to automatically scan for exposed tokens that could give hackers access that doesn't belong to them. The project includes a handy automatic revoke of leaked credentials them if are still valid. This could drastically reduce vulnerabilities in the JavaScript community. For instructions on how to participate, see the [original article][6].

Note that this news was found via the [Changelog news][7].

### Better end of life tracking via open source

A new project, [endoflife.date][8], aims to overcome the complexity of end of life (EOL) announcements for software. It's part tracker, part public announcement on what good documentation looks like for software. As the README states: "The reason this site exists is because this information is very often hidden away. If you're releasing something on a regular basis:

  1. List only supported releases.
  2. Give EoL dates/policy if possible.
  3. Hide unsupported releases behind a few extra clicks.
  4. Mention security/active release difference if needed."



Check out the [source code][9] for more information.

### In other news

  * [Medicine needs to embrace open source][10]
  * [Using geospatial data to create safer roads][11]
  * [Embracing open source could be a big competitive advantage for businesses][12]



_Thanks, as always, to Opensource.com staff members and moderators for their help this week._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/news-june-22

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://thenextweb.com/dd/2019/06/17/cloudflares-new-open-source-project-helps-anyone-obtain-truly-random-numbers/
[3]: https://github.com/dedis/drand
[4]: https://venturebeat.com/2019/06/18/cruise-open-sources-webview-a-tool-for-robotics-data-analysis/
[5]: https://github.com/cruise-automation/webviz
[6]: https://blog.npmjs.org/post/185680936500/protecting-package-publishers-npm-token-security
[7]: https://changelog.com/news/npm-token-scanning-extending-to-github-NAoe
[8]: https://endoflife.date/
[9]: https://github.com/captn3m0/endoflife.date
[10]: https://www.zdnet.com/article/medicine-needs-to-embrace-open-source/
[11]: https://itbrief.co.nz/story/using-geospatial-data-to-create-safer-roads
[12]: https://www.fastcompany.com/90364152/embracing-open-source-could-be-a-big-competitive-advantage-for-businesses
