[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to measure the health of an open source community)
[#]: via: (https://opensource.com/article/19/8/measure-project)
[#]: author: (Jon Lawrence https://opensource.com/users/the3rdlaw)

How to measure the health of an open source community
======
It's complicated.
![metrics and data shown on a computer screen][1]

As a person who normally manages software development teams, over the years I’ve come to care about metrics quite a bit. Time after time, I’ve found myself leading teams using one project platform or another (Jira, GitLab, and Rally, for example) generating an awful lot of measurable data. From there, I’ve promptly invested significant amounts of time to pull useful metrics out of the platform-of-record and into a format where we could make sense of them, and then use the metrics to make better choices about many aspects of development.

Earlier this year, I had the good fortune of coming across a project at the [Linux Foundation][2] called [Community Health Analytics for Open Source Software][3], or CHAOSS. This project focuses on collecting and enriching metrics from a wide range of sources so that stakeholders in open source communities can measure the health of their projects.

### What is CHAOSS?

As I grew familiar with the project’s underlying metrics and objectives, one question kept turning over in my head. What is a "healthy" open source project, and by whose definition?

What’s considered healthy by someone in a particular role may not be viewed that way by someone in another role. It seemed there was an opportunity to back out from the granular data that CHAOSS collects and do a market segmentation exercise, focusing on what might be the most meaningful contextual questions for a given role, and what metrics CHAOSS collects that might help answer those questions.

This exercise was made possible by the fact that the CHAOSS project creates and maintains a suite of open source applications and metric definitions, including:

  * A number of server-based applications for gathering, aggregating, and enriching metrics (such as Augur and GrimoireLab).
  * The open source versions of ElasticSearch, Kibana, and Logstash (ELK).
  * Identity services, data analysis services, and a wide range of integration libraries.



In one of my past programs, where half a dozen teams were working on projects of varying complexity, we found a neat tool which allowed us to create any kind of metric we wanted from a simple (or complex) JQL statement, and then develop calculations against and between those metrics. Before we knew it, we were pulling over 400 metrics from Jira alone, and more from manual sources.

By the end of the project, we decided that out of the 400-ish metrics, most of them didn’t really matter when it came to making decisions _in our roles_. At the end of the day, there were only three that really mattered to us: "Defect Removal Efficiency," "Points completed vs. Points committed," and "Work-in-Progress per Developer." Those three metrics mattered most because they were promises we made to ourselves, to our clients, and to our team members, and were, therefore, the most meaningful.

Drawing from the lessons learned through that experience and the question of what is a healthy open source project?, I jumped into the CHAOSS community and started building a set of personas to offer a constructive approach to answering that question from a role-based lens.

CHAOSS is an open source project and we try to operate using democratic consensus. So, I decided that instead of stakeholders, I’d use the word _constituent_, because it aligns better with the responsibility we have as open source contributors to create a more symbiotic value chain.

While the exercise of creating this constituent model takes a particular goal-question-metric approach, there are many ways to segment. CHAOSS contributors have developed great models that segment by vectors, like project profiles (for example, individual, corporate, or coalition) and "Tolerance to Failure." Every model provides constructive influence when developing metric definitions for CHAOSS.

Based on all of this, I set out to build a model of who might care about CHAOSS metrics, and what questions each constituent might care about most in each of CHAOSS’ four focus areas:

  * [Diversity and Inclusion][4]
  * [Evolution][5]
  * [Risk][6]
  * [Value][7]



Before we dive in, it’s important to note that the CHAOSS project expressly leaves contextual judgments to teams implementing the metrics. What’s "meaningful" and the answer to "What is healthy?" is expected to vary by team and by project. The CHAOSS software’s ready-made dashboards focus on objective metrics as much as possible. In this article, we focus on project founders, project maintainers, and contributors.

### Project constituents

While this is by no means an exhaustive list of questions these constituents might feel are important, these choices felt like a good place to start. Each of the Goal-Question-Metric segments below is directly tied to metrics that the CHAOSS project is collecting and aggregating.

Now, on to Part 1 of the analysis!

#### Project founders

As a **project founder**, I care **most** about:

  * Is my project **useful to others?** Measured as a function of:

    * How many forks over time?
**Metric:** Repository forks.

    * How many contributors over time?
**Metric:** Contributor count.

    * Net quality of contributions.
**Metric:** Bugs filed over time.
**Metric:** Regressions over time.

    * Financial health of my project.
**Metric:** Donations/Revenue over time.
**Metric:** Expenses over time.

  * How **visible** is my project to others?

    * Does anyone know about my project? Do others think it’s neat?
**Metric:** Social media mentions, shares, likes, and subscriptions.

    * Does anyone with influence know about my project?
**Metric:** Social reach of contributors.

    * What are people saying about the project in public spaces? Is it positive or negative?
**Metric:** Sentiment (keyword or NLP) analysis across social media channels.

  * How **viable** is my project?

    * Do we have enough maintainers? Is the number rising or falling over time?
**Metric:** Number of maintainers.

    * Do we have enough contributors? Is the number rising or falling over time?
**Metric:** Number of contributors.

    * How is velocity changing over time?
**Metric:** Percent change of code over time.
**Metric:** Time between pull request, code review, and merge.

  * How [**diverse &amp; inclusive**][4] is my project?

    * Do we have a valid, public, Code of Conduct (CoC)?
**Metric:** CoC repository file check.

    * Are events associated with my project actively inclusive?
**Metric:** Manual reporting on event ticketing policies and event inclusion activities.

    * Does our project do a good job of being accessible?
**Metric:** Validation of typed meeting minutes being posted.
**Metric:** Validation of closed captioning used during meetings.
**Metric:** Validation of color-blind-accessible materials in presentations and in project front-end designs.

  * How much [**value**][7] does my project represent?

    * How can I help organizations understand how much time and money using our project would save them (labor investment)
**Metric:** Repo count of issues, commits, pull requests, and the estimated labor rate.

    * How can I understand the amount of downstream value my project creates and how vital (or not) it is to the wider community to maintain my project?
**Metric:** Repo count of how many other projects rely on my project.

    * How much opportunity is there for those contributing to my project to use what they learn working on it to land good jobs and at what organizations (aka living wage)?
**Metric:** Count of organizations using or contributing to this library.
**Metric:** Averages of salaries for developers working with this kind of project.
**Metric:** Count of job postings with keywords that match this project.




### Project maintainers

As a **Project Maintainer,** I care **most** about:

  * Am I an **efficient** maintainer?
**Metric:** Time PR’s wait before a code review.
**Metric:** Time between code review and subsequent PR’s.
**Metric:** How many of my code reviews are approvals?
**Metric:** How many of my code reviews are rejections/rework requests?
**Metric:** Sentiment analysis of code review comments.

  * How do I get **more people** to help me maintain this thing?
**Metric:** Count of social reach of project contributors.

  * Is our **code quality** getting better or worse over time?
**Metric:** Count how many regressions are being introduced over time.
**Metric:** Count how many bugs are being introduced over time.
**Metric:** Time between bug filing, pull request, review, merge, and release.




### Project developers and contributors

As a **project developer or contributor**, I care most about:

  * What things of value can I gain from contributing to this project and how long might it take to realize that value?
**Metric:** Downstream value.
**Metric:** Time between commits, code reviews, and merges.

  * Are there good prospects for using what I learn by contributing to increase my job opportunities?
**Metric:** Living wage.

  * How popular is this project?
**Metric:** Counts of social media posts, shares, and favorites.

  * Do community influencers know about my project?
**Metric:** Social reach of founders, maintainers, and contributors.




By creating this list, we’ve just begun to put meat on the contextual bones of CHAOSS, and with the first release of metrics in the project this summer, I can’t wait to see what other great ideas the broader open source community may have to contribute and what else we can all learn (and measure!) from those contributions.

### Other roles

Next, you need to learn more about goal-question-metric sets for other roles (such as foundations, corporate open source program offices, business risk and legal teams, human resources, and others) as well as end users, who have a distinctly different set of things they care about when it comes to open source.

If you’re an open source contributor or constituent, we invite you to [come check out the project][8] and get engaged in the community!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/measure-project

作者：[Jon Lawrence][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/the3rdlaw
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://www.linuxfoundation.org/
[3]: https://chaoss.community/
[4]: https://github.com/chaoss/wg-diversity-inclusion
[5]: https://github.com/chaoss/wg-evolution
[6]: https://github.com/chaoss/wg-risk
[7]: https://github.com/chaoss/wg-value
[8]: https://github.com/chaoss/
