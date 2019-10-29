[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Netflix builds a Jupyter Lab alternative, a bug bounty to fight election hacking, Raspberry Pi goes microscopic, and more open source news)
[#]: via: (https://opensource.com/article/19/10/news-october-26)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Netflix builds a Jupyter Lab alternative, a bug bounty to fight election hacking, Raspberry Pi goes microscopic, and more open source news
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, we take a look at a machine learning tool from Netflix, Microsoft's election software bug bounty, a cost-effective microscope built with Raspberry Pi, and more!

### Netflix release Polynote machine learning tool

While there have been numerous advances in machine learning over the last decade, it's still a difficult, laborious, and sometimes frustrating task. To help make that task easier, Netflix has [released a machine learning notebook environment][2] called Polynote as open source.

Polynote enables "data scientists and AI researchers to integrate Netflix’s JVM-based machine learning framework with Python machine learning and visualization libraries". What make Polynote unique is its reproducibility feature, which "takes cells’ positions in the notebook into account before executing them, helping prevent bad practices that make notebooks difficult to rerun from the top." It's also quite flexible—Polynote works with Apache Spark and supports languages like Python, Scala, and SQL.

You can grab Polynote [off GitHub][3] or learn more about it at the Polynote website.

### Microsoft announces bug bounty program for its election software

Hoping that more eyeballs on its code will make bugs shallow, Microsoft announced a [a bug bounty][4] for its open source ElectionGuard software development kit for voting machines. The goal of the program is to "uncover vulnerabilities and help bolster election security."

The bounty is open to "security professionals, part-time hobbyists, and students." Successful submissions, which must include proofs of concept demonstrating how bugs could compromise the security of voters, are worth up to $15,000 (USD).

If you're interested in participating, you can find ElectionGuard's code on [GitHub][5], and read more about the [bug bounty][6].

### microscoPI: a microscope built on Raspberry Pi

It's not a stretch to say that the Raspberry Pi is one of the most flexible platforms for hardware and software hackers. Micropalaeontologist Martin Tetard saw the potential of the tiny computers in his field of study and [create the microscoPI][7].

The microscoPI is a Raspberry Pi-assisted microscope that can "capture, process, and store images and image analysis results." Using an old adjustable microscope with a movable stage as a base, Tetard added a Raspberry Pi B, a Raspberry Pi camera module, and a small touchscreen to the device. The result is a compact rig that's "completely portable and measuring less than 30 cm (12 inches) in height." The entire setup cost him €159 (about $177 USD).

Tetard has set up [a website][8] for the microscoPI, where you can learn more about it.

#### In other news

  * [Happy 15th birthday, Ubuntu][9]
  * [Open-Source Arm Puts Robotics Within Reach][10]
  * [Apache Rya matures open source triple store database][11]
  * [UNICEF Launches Cryptocurrency Fund to Back Open Source Technology][12]
  * [Open-source Delta Lake project moves to the Linux Foundation][13]



_Thanks, as always, to Opensource.com staff members and moderators for their help this week._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/news-october-26

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://venturebeat.com/2019/10/23/netflix-open-sources-polynote-to-simplify-data-science-and-machine-learning-workflows/
[3]: https://github.com/polynote/polynote
[4]: https://thenextweb.com/security/2019/10/21/microsofts-open-source-election-software-now-has-a-bug-bounty-program/
[5]: https://github.com/microsoft/ElectionGuard-SDK
[6]: https://www.microsoft.com/en-us/msrc/bounty
[7]: https://www.geeky-gadgets.com/raspberry-pi-microscope-07-10-2019/
[8]: https://microscopiproject.wordpress.com/
[9]: https://www.omgubuntu.co.uk/2019/10/happy-birthday-ubuntu-2019
[10]: https://hackaday.com/2019/10/17/open-source-arm-puts-robotics-within-reach/
[11]: https://searchdatamanagement.techtarget.com/news/252472464/Apache-Rya-matures-open-source-triple-store-database
[12]: https://www.coindesk.com/unicef-launches-cryptocurrency-fund-to-back-open-source-technology
[13]: https://siliconangle.com/2019/10/16/open-source-delta-lake-project-moves-linux-foundation/
