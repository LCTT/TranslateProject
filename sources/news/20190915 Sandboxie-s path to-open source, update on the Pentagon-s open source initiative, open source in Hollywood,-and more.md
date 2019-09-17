[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sandboxie's path to open source, update on the Pentagon's open source initiative, open source in Hollywood, and more)
[#]: via: (https://opensource.com/article/19/9/news-september-15)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

Sandboxie's path to open source, update on the Pentagon's open source initiative, open source in Hollywood, and more
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, Sandboxie's path to open source, update on the Pentagon's adoption of open source, open source in Hollywood, and more!

### Sandboxie becomes freeware on its way to open source

Sophos Group plc, a British security company, released a [free version of its popular Sandboxie tool][2], used as an isolated operating environment for Windows ([downloadable here][2]).

Sophos said that since Sandboxie isn't a core aspect of its business, the easier decision would've been to shut it down. But Sandboxie has [earned a reputation][3] for letting users run unknown software in a safe environment without risking their systems, so the team is putting in the additional work to release it as open source software. This intermediate phase of free-but-not-open-source appears to be related to the current system design, which requires an activation key:

> Sandboxie currently uses a license key to activate and grant access to premium features only available to paid customers (as opposed to those using a free version). We have modified the code and have released an updated free version that does not restrict any features. In other words, the new free license will have access to all the features previously only available to paid customers.

Citing this tool's community impact, senior leaders at Sophos announced the release of Sandboxie version 5.31.4–an unrestricted version of the program–will remain free until the tool is fully open sourced.

"The Sandboxie user base represents some of the most passionate, forward thinking, and knowledgeable members of the security community and we didn’t want to let you down," [Sophos' blog post read][4]. "After thoughtful consideration we decided that the best way to keep Sandboxie going was to give it back to its users -- transitioning it to an open source tool."

### The Pentagon doesn't meet White House mandate for more open source software

In 2016, the White House mandated that each government agency had to open source at least 20 percent of its custom software within three years. There is an [interesting article][5] about this initiative from 2017 that laid out some of the excitement and challenges.

According to the Government Accountability Office, [the Pentagon's not even halfway there][6].

In an article for Nextgov, Jack Corrigan wrote that as of July 2019, the Pentagon had released just 10 percent of its code as open source. They've also not yet implemented other aspects of the White House mandate, including the directive to build an open source software policy and inventories of custom code.

According to the report, some government officials told the GAO that they worry about security risks of sharing code across government departments. They also admitted to not creating metrics that could measure their open source efforts' successes. The Pentagon's Chief Technology Officer cited the Pentagon's size as the reason for not implementing the White House's open source mandate. In a report published Tuesday, the GAO said, “Until [the Defense Department] fully implements its pilot program and establishes milestones for completing the OMB requirements, the department will not be positioned to take advantage of significant cost savings and efficiencies."

### A team of volunteers works to find and digitize copyright-free books

All books published in the U.S. before 1924 are [publicly owned and can be freely used/copied][7]. Books published in and after 1964 will stay under copyright for 95 years after their publication dates. But thanks to a copyright loophole, up to 75 percent of books published between 1923 and 1964 are free to read and copy. The time-consuming trick is confirming which books those are.

So, a group of libraries, volunteers, and archivists have united to learn which books are copyright-free, then digitize and upload them to the Internet. Since renewal records were already digitized, it's been easy to tell if books published between 1923 and 1964 had their copyrights renewed. But looking for a lack of copyright renewal is much harder since you're trying to prove a negative.

Participants include the New York Public Library, [which recently explained][8] why the time-consuming project is worthwhile. To help find more books faster, the NYPL converted many records to XML format. This makes it easier to automate the process of finding which books can be added to the public domain. 

### Hollywood's Academy Software Foundation gains new members

Microsoft and Apple announced plans to contribute at the premier membership level of the ASF. They'll join [founding board members][9] including Netflix, Google Cloud, Disney Studios, and Sony Pictures.

The Academy Software Foundation launched in 2018 as a joint project of the [Academy of Motion Picture Arts and Sciences][10] and the [Linux Foundation][11].

> The mission of the Academy Software Foundation (ASWF) is to increase the quality and quantity of contributions to the content creation industry’s open source software base; to provide a neutral forum to coordinate cross-project efforts; to provide a common build and test infrastructure; and to provide individuals and organizations a clear path to participation in advancing our open source ecosystem.

Within its first year, the Foundation built [OpenTimelineIO][12], an open source API and interchange format that helps studio teams collaborate across departments. OpenTImelineIO was formally accepted by [the Foundation's Technical Advisory Council][13] as its fifth hosted project last July. They now maintain it alongside [OpenColorIO][14], [OpenCue][15], [OpenEXR][16], and [OpenVDB][17].

#### In other news

  * [Comcast puts open source networking software into production][18]
  * [SD Times open source project of the week: Ballerina][19]
  * [DOD struggles to implement open source pilots][20]
  * [Kong open sources universal service mesh Kuma][21]
  * [Eclipse unveils Jakarta EE 8][22]



_Thanks, as always, to Opensource.com staff members and moderators for their help this week._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/news-september-15

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://www.sandboxie.com/DownloadSandboxie
[3]: https://betanews.com/2019/09/13/sandboxie-free-open-source/
[4]: https://community.sophos.com/products/sandboxie/f/forum/115109/major-sandboxie-news-sandboxie-is-now-a-free-tool-with-plans-to-transition-it-to-an-open-source-tool/414522
[5]: https://medium.com/@DefenseDigitalService/code-mil-an-open-source-initiative-at-the-pentagon-5ae4986b79bc
[6]: https://www.nextgov.com/analytics-data/2019/09/pentagon-needs-make-more-software-open-source-watchdog-says/159832/
[7]: https://www.vice.com/en_us/article/a3534j/libraries-and-archivists-are-scanning-and-uploading-books-that-are-secretly-in-the-public-domain
[8]: https://www.nypl.org/blog/2019/09/01/historical-copyright-records-transparency
[9]: https://variety.com/2019/digital/news/microsoft-apple-academy-software-foundation-1203334675/
[10]: https://www.oscars.org/
[11]: http://www.linuxfoundation.org/
[12]: https://github.com/PixarAnimationStudios/OpenTimelineIO
[13]: https://www.linuxfoundation.org/press-release/2019/07/opentimelineio-joins-aswf/
[14]: https://opencolorio.org/
[15]: https://www.opencue.io/
[16]: https://www.openexr.com/
[17]: https://www.openvdb.org/
[18]: https://www.fiercetelecom.com/operators/comcast-puts-open-source-networking-software-into-production
[19]: https://sdtimes.com/os/sd-times-open-source-project-of-the-week-ballerina/
[20]: https://www.fedscoop.com/open-source-software-dod-struggles/
[21]: https://sdtimes.com/micro/kong-open-sources-universal-service-mesh-kuma/
[22]: https://devclass.com/2019/09/11/hey-were-open-source-again-eclipse-unveils-jakarta-ee-8/
