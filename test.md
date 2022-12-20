[#]: subject: "8 ideas for measuring your open source software usage"
[#]: via: "https://opensource.com/article/22/12/open-source-usage-metrics"
[#]: author: "Georg Link https://opensource.com/users/georglink"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

8 ideas for measuring your open source software usage
======

Those of us who support open source project communities are often asked about usage metrics — a lot. The goal of these metrics is usually to demonstrate the software's importance as measured by its user base and awareness. We typically want to know: how many people use the software, how many installations are there, and how many lives are being touched.

To make a long story short: We cannot answer these questions directly.

Sorry to disappoint you if you were hoping for a definitive solution. No one has the perfect answers to questions about usage metrics. At least, no precise answers.

The good news is that there are approximations and alternative metrics that can satisfy your thirst for knowledge about the software's usage, at least partially. This article explores these alternatives including their benefits and shortcomings.

### Downloads

When you visit websites that offer software, you can often see how many times the software has been downloaded. An example that comes to mind is Firefox, which used to have a download counter. It was an impressive number and gave the impression that Firefox was a popular browser—which it was for a while.

However, individual behavior can directly impact the accuracy of this number. For example, when a person wipes their machine regularly, each rebuild incurs a separate download. To account for this reality, there needs to be a way to subtract a few dozen (maybe hundreds) downloads from the number because of that one person.

Not only can downloads overestimate usage, but they can also underestimate usage. For instance, a system administrator may download a new version of Firefox once to a flash drive and then install it on hundreds of devices.

Download metrics are easy to collect because you can log each download request on the server. The problem is that you don't know what happens to the software after it is downloaded. Was the person able to use the software as anticipated? Or did the person run into issues and abandon the software?

For open source projects, you can consider a variety of download metrics, such as the number of binaries downloaded from:

- the project website
- package managers such as npm, PyPi, and Maven
- code repositories like GitHub, GitLab, and Gitee

You may also be interested in downloads of the source code because downstream projects are most likely to use this format (also read [How to measure the impact of your open source project][1]). Relevant download metrics include:

- The number of clones (source code downloads) from code repositories like GitHub, GitLab, and Gitee
- The number of archives (tar, zip) downloaded from the website
- The number of source code downloads through package managers like npm, PyPi, and Maven

Download metrics for source code are an even less reliable measure than binary downloads (although there is no research to demonstrate this). Just imagine that a developer wants to use the most recent version of your source code and has configured their build pipeline to always clone your repository for every build. Now imagine that an automated build process was failing and retrying to build, constantly cloning your repository. You can also imagine a scenario where the metric is lower than expected—say the repository is cached somewhere, and downloads are served by the cache.

**[ Related read [5 metrics to track in your open source community][2] ]**

In conclusion, download metrics are good proxies for detecting trends and providing context around current usage. We cannot define specifically how a download translates to usage. But we can say that an increase in downloads is an indicator of more potential users. For example, if you advertise your software and see that download numbers are higher during the campaign, it would be fair to assume that the advertisement prompted more people to download the software. The source and metadata of the download can also provide additional context for usage patterns. What versions of your software are still in use? What operating system or language-specific versions are more popular? This helps the community prioritize which platforms to support and test.

### Issues

As an open source project, you probably have an issue tracker. When someone opens an issue, two common goals are to report a bug or request a feature. The issue author has likely used your software. As a user, they would have found a bug or identified the need for a new feature.

Obviously, most users don't take the extra step to file an issue. Issue authors are dedicated users and we are thankful for them. Also, by opening an issue, they have become a non-code contributor. They may become a code contributor. A rule of thumb is that for every 10,000 users, you may get 100 who open an issue and one who contributes code. Depending on the type of user, these ratios may differ.

With regard to metrics, you can count the number of issue authors as a lower-bound estimation for usage. Related metrics can include:

- The number of issue authors
- The number of active issue authors (opened an issue in the last 6 months)
- The number of issue authors who also contribute code
- The number of issues opened
- The number of issue comments written

### User mailing lists, forums, and Q&A sites

Many open source projects have mailing lists for users, a forum, and presence on a Q&A site, such as Stack Overflow. Similar to issue authors, people who post there can be considered the tip of the iceberg of users. Metrics around how active a community is in these mailing lists, forums, and Q&A sites can also be used as a proxy for increasing or decreasing the user base. Related metrics can focus on the activity in these places, including:

- The number of user mailing list subscribers
- The number of forum users
- The number of questions asked
- The number of answers provided
- The number of messages created

### Call-home feature

To get accurate counts of users, one idea is to have your software report back when it is in use.

This can be creepy. Imagine a system administrator whose firewall reports an unexpected connection to your server. Not only could the report never reach you (it was blocked), but your software may be banned from future use.

Responsible ways to have a call-home feature is an optional service to look for updates and let the user know to use the latest version. Another optional feature can focus on usage telemetry where you ask the user whether your software may, anonymously, report back how the software is used. When implemented thoughtfully, this approach can allow users to help improve the software by their style of using it. A user may have the opinion: "I often don't allow this usage information sharing but for some software I do because I hope the developers will make it better for me in the long term."

### Stars and forks

Stars and forks are features on social coding platforms like GitHub, GitLab, and Gitee. Users on these platforms can star a project. Why do they star projects? GitHub's documentation explains, "You can star repositories and topics to keep track of projects you find interesting and discover related content in your news feed." Starring is the equivalent of bookmarking and also provides a way to show appreciation to a repository maintainer. Stars have been used as an indicator of the popularity of a project. When a project has a big announcement that attracts considerable attention, the star count tends to increase. The star metric does not indicate the usage of the software.

Forks on these social coding platforms are clones of a repository. Non-maintainers can make changes in their fork and submit them for review through a pull request. Forks are more a reflection of community size than stars. Developers may also fork a project to save a copy they can access even after the original repository has disappeared. Due to the use of forks in the contribution workflow, the metric is a good indicator for the developer community. Forks do not typically indicate usage by non-developers because non-developers usually do not create forks.

### Social media

Social media platforms provide gathering places for people with shared interests, including Facebook, Instagram, LinkedIn, Reddit, Twitter, and more. Using a social media strategy, open source projects can attract people with interest and affinity for their projects by setting up respective gathering spaces on these platforms. Through these social media channels, open source projects can share news and updates and highlight contributors and users. They can also be used to meet people who would not otherwise interact with your project.

We are hesitant to suggest the following metrics because they have no clear connection to actual usage of your software and often require analysis for positive, negative, and neutral sentiment. People may be excited about your project for many different reasons and want to follow it without actually using it. However, like other metrics already discussed, showing that you are able to draw a crowd in social media spaces is an indicator of the interest in your project overall. Metrics for different social media platforms may include:

- The number of followers or subscribers
- The number of messages
- The number of active message authors
- The number of likes, shares, reactions, and other interactions

### Web analytics and documentation

Website traffic is a useful metric as well. This metric is influenced more by your outreach and marketing activities than your number of users. However, we have an ace up our sleeve: our user documentation, tutorials, handbooks, and API documentation. We can see what topics on our website draw attention, including documentation. The number of visitors to the documentation would arguably increase with an increase in the number of discrete users of the software. We can therefore detect general interest in the project with visitors to the website and more specifically observe user trends by observing visitors to the documentation. Metrics may include:

- The number of website visitors
- The number of documentation visitors
- The duration visitors spend on your website or in documentation

### Events

Event metrics are available if you are hosting events around your project. This is a great way to build community. How many people submit abstracts to speak at your events? How many people show up to your events? This can be interesting for both in-person and virtual events. Of course, how you advertise your event strongly influences how many people show up. Also, you may co-locate your event with a larger event where people travel anyway, and thus, are in town and can easily attend your event. As long as you use a consistent event strategy, you can make a case that a rise in speaker submissions and attendee registrations are indicative of increasing popularity and user base.

You don't need to host your own event to collect insightful metrics. If you host talks about your project at open source events, you can measure how many people show up to your session focused on your project. At events like FOSDEM, some talks are specifically focused on updates or announcements of open source projects and the rooms are filled to the brim (like almost all sessions at FOSDEM).

Metrics you might consider:

- The number of attendees at your project-centric event
- The number of talks submitted to your project-centric event
- The number of attendees at your project-centric talks

### Conclusion about approximating usage of open source software

As we've illustrated, there are many metrics that can indicate trends around the usage of your software, and all are imperfect. In most cases, these metrics can be heavily influenced by individual behavior, system design, and noise. As such, we suggest that you never use any of these metrics in isolation, given the relative uncertainty of each one. But if you collect a set of metrics from a variety of sources, you should be able to detect trends in behavior and usage. If you have the means to compare the same set of metrics across multiple open source projects with commonalities—such as similar functionality, strong interdependencies, hosted under the same foundation, and other characteristics—you can improve your sense of behavioral baselines.

Note that in this overview, we've also chosen to highlight metrics that evaluate direct usage. As most software depends on a variety of other software packages, we would be remiss if we did not mention that usage and behavior can also be heavily impacted by indirect usage as part of a dependency chain. As such, we recommend incorporating the count of upstream and downstream dependencies as another layer of context in your analysis.

In closing, as the wielder of data and metrics, we encourage you to recognize the power and responsibility that you have for your stakeholders. Any metric that you publish has the potential to influence behavior. It is a best practice to always share your context—bases, sources, estimations, and other critical contextual information—as this will help others to interpret your results.

We thank the CHAOSS Community for the insightful conversation at CHAOSScon EU 2022 in Dublin, Ireland that sparked the idea for this blog post and to the CHAOSS Community members who reviewed and helped improve this article.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/12/open-source-usage-metrics

作者：[Georg Link][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/georglink
[b]: https://github.com/lkxed
[1]: https://opensource.com/article/18/5/metrics-project-success
[2]: https://opensource.com/article/22/11/community-metrics
