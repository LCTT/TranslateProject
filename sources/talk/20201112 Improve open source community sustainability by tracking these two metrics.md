[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Improve open source community sustainability by tracking these two metrics)
[#]: via: (https://opensource.com/article/20/11/open-source-community-sustainability)
[#]: author: (Kevin Xu https://opensource.com/users/kevin-xu)

Improve open source community sustainability by tracking these two metrics
======
Focusing on metrics around community ownership and incentives can
increase your odds of building a sustainable open source project.
![Person using a laptop][1]

In early 2020, I wrote an article on [three metrics][2] for tracking and measuring offline, in-person community-building activities. Little did I (or the world) know then that offline, in-person activities of any kind would soon become unfeasible for the foreseeable future.

So, I started thinking: With open source projects being online by default, and with everything else moving online and virtual, what should creators of open source technologies measure as we continue in this COVID and (hopefully soon) post-COVID world?

There are plenty of metrics you _can_ track—stars, forks, pull requests (PRs), merge requests (MRs), contributor counts, etc.—_but more data doesn't necessarily mean clearer insights_. I've previously shared my skepticism about the value of these [surface-level metrics][3], especially when assessing an open source project's health and sustainability.

In this article, I propose two second-order metrics to track, measure, and continually optimize to build a strong, self-sustaining open source community:

  * Breakdowns of PR or MR reviewers
  * Leaderboards of different community interactions



### Why these metrics?

The long-term goal of any open source community-building effort is to reach a tipping point where the project can live beyond the initial creators' or maintainers' day-to-day involvement. It's an especially important goal if you also are building a commericial open source software (COSS) company around that open source technology, whether it's bootstrapped or venture capital-backed. Your company will eventually have to divert resources and people power to build commercial services or paid features.

It's a lofty goal that few projects achieve. Meanwhile, maintainer burnout is a real problem. The latest and most high-profile example is Redis creator Salvatore Sanfilippo, who shared his [struggles as an open source maintainer][4] last year and [bowed out as CEO][5] of Redis Labs earlier this year. Maintainers of various projects, big or small, struggle through similar challenges every day.

Focusing on the two metrics above, especially early in your open source journey, can increase your odds of building something sustainable because they illuminate two important elements that drive sustainability: **ownership** and **incentive**.

#### Breaking down PR/MR reviewers = Ownership

Tracking who in your community is actively reviewing contributions is a good indicator of ownership. In the beginning, you, the creator, do the bulk of reviewing, but this will be unsustainable over time. Being intentional about building your community so that more people have the _contextual knowledge, confidence, and welcoming attitude_ to review incoming PRs/MRs (which should increase in frequency as your project gains traction) is crucial to long-term sustainability.

There's a customer service-like element to reviewing contributions, which can deteriorate if not enough people feel ownership to do it. And one of the worst signals you can give to an otherwise enthusiastic newcomer is a PR or MR left unattended for two or more weeks.

#### Community interaction leaderboards = Incentive

Tracking a few community-facing interactions and possibly gamifying them within your community with rewards can help drive the right incentives and behaviors among community members with all levels of experience. Some of the interactions you can track are the number of PRs/MRs filed, comments, reactions, and reviews (which has some overlap with reactions). These interactions may have different values and quality, but the bigger goal here is _to understand who's doing what, who's good at doing what_, and intentionally _foster more behaviors based on people's strengths and interests_.

Perhaps some people are great at providing helpful comments but don't have enough context (yet) to review a PR/MR. It would be good to identify who they are and provide them with more info so that they can become a reviewer one day. Perhaps some people are super-engaged with monitoring the project, as shown by their frequent reactions, but don't feel comfortable chiming in with comments and suggestions. It would be good to know who they are and help them gain more context into the project's inner workings, so they can add more value to a community they clearly care about. 

### How to use the metrics

So how can you track and read into these metrics? I'll illustrate with an example comparing two open source projects: [Kong][6], an API gateway, and [Apache Pulsar][7], a pub-sub messaging system.

In May 2020, I used [Apache Superset][8], an open source data visualization tool, along with a tutorial written by [Max Beauchemin][9], one of the project's creators, to crawl and visualize some data from Kong, Apache Pulsar, and [a few other projects][10]. Using [the tutorial][11], I crawled two years' worth of data (from May 2018 to May 2020) to see changes over time. (Note: The tutorial is an example of Superset's own data with some hard-coded linkage to its history inside Airbnb and Lyft, so to use it, you will need to do some customization of the dashboard JSON to make it work more generally.)

Two caveats: First, the data was last gathered in May, so it will surely look different today. Second, the projects were open sourced at different times, and this comparison is not a judgment on the current state or potential of either project. (Kong's first commit was in November 2014, and Pulsar's was in September 2016. Of course, both were worked on in private before being open sourced.) Some of the differences you see may simply be due to the passage of time and community effort paying off at different times; _community building is a long, persistent slog_.

#### PR reviewer metrics

The following two charts show Kong and Pulsar's PR reviews by GitHub handle:

![Kong PR reviews by GitHub handle][12]

Kong's PR reviews by GitHub handle (COSS Media, ©2020)

![Pulsar's PR reviews by GitHub handle][13]

Pulsar's PR reviews by GitHub handle (COSS Media, ©2020)

Based on this data, I observe that Kong has a better balance of people reviewing PRs than Pulsar has. That balance was achieved over time as the Kong project grew in maturity. The most important thing to note is that neither of Kong's creators, [Aghi][14] nor [Marco][15], is anywhere close to being the top reviewers. _That's a good thing!_ They certainly were during the early days, but their involvement became less visible as the project matured, as it should.

As a younger project, Pulsar isn't at the same level yet but is on its way to achieving that balance. [Sijie][16], [Jia][17], and [Penghui][18] are doing the bulk of the reviewing for now; all three are project management committee members and lead SteamNative, Pulsar's COSS company. Other major players, including Splunk (especially after it [acquired][19] Streamlio), also contribute to the project, which is a good leading indicator of eventually achieving balance.

One factor I'm intentionally glossing over is the difference in the governance process of an Apache Software Foundation project and a non-ASF project, which would impact the speed and procedure for a contributor to become a reviewer or maintainer. In that regard, this comparison is not 100% apples-to-apples.

#### Community interaction metrics

Following are two leaderboard charts showing Kong and Pulsar's community interactions by GitHub handle in the 90 days since the most recent data gathered (roughly from March to May 2020):

![Kong's 90-day leaderboard chart][20]

Kong's 90-day leaderboard chart (COSS Media, ©2020)

![Pulsar's 90-day leaderboard chart][21]

Pulsar's 90-day leaderboard chart (COSS Media, ©2020)

These leaderboards reflect the same "level of balance" shown in the previous chart, which makes sense. The more interesting takeaway is who is doing what kind of interaction, how much _interacting_ is happening, and who seems to be doing it all (Sijie!).

As far as building the right incentive structure, this leaderboard-type view can help you get a sense of where interactions are coming from and what sort of reward or motivational system you want to design to accelerate positive behaviors.

This data is also useful for internal management _and_ external community building. As close watchers can tell, many of the leaders on these charts are employees of the projects' COSS companies, Kong Inc. and StreamNative. It's quite common for active community contributors (or enthusiasts) to become employees of the company commercializing the project. Regardless of where these folks are employed, to foster a sustainable project beyond its initial creators (which in turn would influence the sustainability of the COSS company), you would need to measure, track, and incentivize the same behaviors.

Also, I'm aware that the Pulsar chart does not have a "reactions" column, which could either be because there wasn't much reaction data to merit a top-10 entry or due to my own faulty configuration of the chart. I apologize for this inconsistency.

### Tips on driving balanced sustainability

No matter how pretty the charts are, data doesn't tell the whole story. And no matter how successful a particular project is, its experience should not be templatized and applied directly to a different project. That said, I'd like to share a few actionable tips I've seen work in the wild that can help you improve these two metrics over time:

  * **Provide high-quality documentation:** In a previous article, I focused on [documentation][22], and I encourage you to give it a read. The most important point is: a project's documentation gets the most amount of traffic. It's the place where people decide whether to continue learning about your project or move on. _You never want to give people a reason to move on_. Generally, I recommend spending 10% to 20% of your time writing documentation. Putting it in context: if you are working on your project full-time, it's about half a day to one full day per week.
  * **Make your contributor guide a living document:** Every project has a CONTRIBUTING.MD document (or a variation of it). But projects that grow and mature make that document the best it can be and continually refresh, update, and refine it. Why? Because that's where people who are enthusiastic about participating in the project go. If the guide is clear, succinct, and actionable, you'll get contributions in no time. If it's outdated, convoluted, and lacks an easy onramp (e.g., beginner issues, simple bugs, etc.), then that enthusiasm will go somewhere else. _Make your CONTRIBUTING.MD a killer feature_.
  * **Set clear quality guidelines:** There _is_ such a thing as a "noisy contribution"—low-quality PRs/MRs that require more energy than it's worth to review (and oftentimes reject). However, the responsibility of communicating to the public what is and is not a "quality contribution" is on you, the creator or maintainer, because you have the most context and institutional knowledge about the project, by far. _Make your expectations clear, and don't compromise on quality._ Make it a prominent section of your CONTRIBUTING.MD or a separate document to give it more visibility. Combine it with your project's roadmap, which should be part of your public documentation anyway, so your new contributors know what's expected of them and why.



I hope this provides some useful insight into the two second-order metrics that matter when building a sustainable open source community and some actionable items you can use to track and improve them.

* * *

_This article originally appeared on_ _[COSS Media][23]_ _and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/open-source-community-sustainability

作者：[Kevin Xu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kevin-xu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/3/community-metrics
[3]: https://softwareengineeringdaily.com/2019/04/04/project-health-assessing-open-source-projects-with-more-context/
[4]: http://antirez.com/news/129
[5]: http://antirez.com/news/133
[6]: https://github.com/Kong/kong
[7]: https://github.com/apache/pulsar
[8]: https://superset.apache.org/
[9]: https://github.com/mistercrunch
[10]: https://twitter.com/kevinsxu/status/1275072801511059456
[11]: https://preset.io/blog/2020-04-15-github-community-dashboard/
[12]: https://opensource.com/sites/default/files/uploads/kongpr-reviews.jpg (Kong PR reviews by GitHub handle)
[13]: https://opensource.com/sites/default/files/uploads/pulsarpr-reviews.jpg (Pulsar's PR reviews by GitHub handle)
[14]: https://github.com/sonicaghi
[15]: https://github.com/subnetmarco
[16]: https://github.com/sijie
[17]: https://github.com/jiazhai
[18]: https://github.com/codelipenghui
[19]: https://www.splunk.com/en_us/blog/leadership/splunk-to-expand-streaming-expertise-announces-intent-to-acquire-streamlio-open-source-distributed-messaging-leader.html
[20]: https://opensource.com/sites/default/files/uploads/kong_leaderboard.jpg (Kong's 90-day leaderboard chart)
[21]: https://opensource.com/sites/default/files/uploads/pulsarleaderboard.jpg (Pulsar's 90-day leaderboard chart)
[22]: https://opensource.com/article/20/3/documentation
[23]: https://coss.media/2-things-to-measure-and-improve-open-source-community-sustainability/
