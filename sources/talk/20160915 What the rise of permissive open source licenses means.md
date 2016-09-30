宽松开源许可证的崛起意味着什么
====

为什么像 GNU GPL 这样的限制性许可证越来越不受青睐。

“如果你使用了任何开源软件， 你必须把你软件的其他部分也开源。” 这是前微软 CEO Steve Ballmer 在 2001 年说的，尽管他说得不对，但还是给自由软件引起了恐惧，不确定性和怀疑。很可能他是故意的。

This FUD about open source software is mainly about open source licensing. There are many different licenses, some more restrictive (some people use the term "protective") than others. Restrictive licenses such as the GNU General Public License (GPL) use the concept of copyleft, which grants people the right to freely distribute copies and modified versions of a piece of software as long as the same rights are preserved in derivative works. The GPL (v3) is used by open source projects such as bash and GIMP. There's also the Affero GPL, which provides copyleft to software that is offered over a network (for example as a web service.)

What this means is that if you take code that is licensed in this way and you modify it by adding some of your own proprietary code, then in some circumstances the whole new body of code, including your code, becomes subject to the restrictive open source license. It was this type of license that Ballmer was probably referring to when he made his statement.

But permissive licenses are a different animal. The MIT License, for example, lets anyone take open source code and do what they want with it — including modifying and selling it — as long as they provide attribution and don't hold the developer liable. Another popular permissive open source license, the Apache License 2.0, also provides an express grant of patent rights from contributors to users. JQuery, the .NET Core and Rails are licensed using the MIT license, while the Apache 2.0 license is used by software including Android, Apache and Swift.

Ultimately both license types are intended to make software more useful. Restrictive licenses aim to foster the open source ideals of participation and sharing so everyone gets the maximum benefit from software. And permissive licenses aim to ensure that people can get the maximum benefit from software by allowing them to do what they want with it — even if that means they take the code, modify it and keep it for themselves or even sell the resulting work as proprietary software without contributing anything back.

Figures compiled by open source license management company Black Duck Software show that the restrictive GPL 2.0 was the most commonly used open source license last year with about 25 percent of the market. The permissive MIT and Apache 2.0 licenses were next with about 18 percent and 16 percent respectively, followed by the GPL 3.0 with about 10 percent. That's almost evenly split at 35 percent restrictive and 34 percent permissive.

But this snapshot misses the trend. Black Duck's data shows that in the six years from 2009 to 2015 the MIT license's share of the market has gone up 15.7 percent and Apache's share has gone up 12.4 percent. GPL v2 and v3's share during the same period has dropped by a staggering 21.4 percent. In other words there was a significant move away from restrictive licenses and towards permissive ones during that period.

And the trend is continuing. Black Duck's [latest figures][1] show that MIT is now at 26 percent, GPL v2 21 percent, Apache 2 16 percent, and GPL v3 9 percent. That's 30 percent restrictive, 42 percent permissive — a huge swing from last year’s 35 percent restrictive and 34 percent permissive. Separate [research][2] of the licenses used on GitHub appears to confirm this shift. It shows that MIT is overwhelmingly the most popular license with a 45 percent share, compared to GLP v2 with just 13 percent and Apache with 11 percent.

![](http://images.techhive.com/images/article/2016/09/open-source-licenses.jpg-100682571-large.idge.jpeg)

### Driving the trend

What’s behind this mass move from restrictive to permissive licenses? Do companies fear that if they let restrictive software into the house they will lose control of their proprietary software, as Ballmer warned? In fact, that may well be the case. Google, for example, has [banned Affero GPL software][3] from its operations.

Jim Farmer, chairman of [Instructional Media + Magic][4], a developer of open source technology for education, believes that many companies avoid restrictive licenses to avoid legal difficulties. "The problem is really about complexity. The more complexity in a license, the more chance there is that someone has a cause of action to bring you to court. Complexity makes litigation more likely," he says.

He adds that fear of restrictive licenses is being driven by lawyers, many of whom recommend that clients use software that is licensed with the MIT or Apache 2.0 licenses, and who specifically warn against the Affero license.

This has a knock-on effect with software developers, he says, because if companies avoid software with restrictive licenses then developers have more incentive to license their new software with permissive ones if they want it to get used.

But Greg Soper, CEO of SalesAgility, the company behind the open source SuiteCRM, believes that the move towards permissive licenses is also being driven by some developers. "Look at an application like Rocket.Chat. The developers could have licensed that with GPL 2.0 or Affero but they chose a permissive license," he says. "That gives the app the widest possible opportunity, because a proprietary vendor can take it and not harm their product or expose it to an open source license. So if a developer wants an application to be used inside a third-party application it makes sense to use a permissive license."

Soper points out that restrictive licenses are designed to help an open source project succeed by stopping developers from taking other people's code, working on it, and then not sharing the results back with the community. "The Affero license is critical to the health of our product because if people could make a fork that was better than ours and not give the code back that would kill our product," he says. "For Rocket.Chat it's different because if it used Affero then it would pollute companies' IP and so it wouldn't get used. Different licenses have different use cases."

Michael Meeks, an open source developer who has worked on Gnome, OpenOffice and now LibreOffice, agrees with Jim Farmer that many companies do choose to use software with permissive licenses for fear of legal action. "There are risks with copyleft licenses, but there are also huge benefits. Unfortunately people listen to lawyers, and lawyers talk about risk but they never tell you that something is safe."

Fifteen years after Ballmer made his inaccurate statement it seems that the FUD it generated it is still having an effect — even if the move from restrictive licenses to permissive ones is not quite the effect he intended.

--------------------------------------------------------------------------------

via: http://www.cio.com/article/3120235/open-source-tools/what-the-rise-of-permissive-open-source-licenses-means.html

作者：[Paul Rubens  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cio.com/author/Paul-Rubens/
[1]: https://www.blackducksoftware.com/top-open-source-licenses
[2]: https://github.com/blog/1964-open-source-license-usage-on-github-com
[3]: http://www.theregister.co.uk/2011/03/31/google_on_open_source_licenses/
[4]: http://immagic.com/

