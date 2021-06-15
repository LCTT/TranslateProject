[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How we develop success metrics for open source events)
[#]: via: (https://opensource.com/article/20/11/chaoss-open-source-events)
[#]: author: (Neofytos Kolokotronis https://opensource.com/users/neofytosk)

How we develop success metrics for open source events
======
The CHAOSS App Ecosystem Working Group is establishing ways to measure
how well virtual and in-person events meet their goals.
![Metrics and a graph illustration][1]

As many open source communities grow larger and older, they may face problems managing members' engagement. People turn towards metrics to understand large systems and prioritize resources, but there has not been a consensus set of metrics for understanding open source communities.

The Community Health Analytics Open Source Software ([CHAOSS][2]) project, a Linux Foundation-sponsored community of industry professionals and academics, is working to solve this problem by defining metrics for open source projects. The CHAOSS project focused first on developing metrics for open source event organizers because open source communities often depend on events like hackathons, meetups, conferences, and user group meetings to grow their communities and work on important project updates.

The [CHAOSS App Ecosystem Working Group][3], which developed the metrics for events and worked together on this article, is comprised of [members][4] who have organized and participated in many open source events. While we developed these metrics to help the GNOME and KDE communities, we believe they can help other open source event organizers create their own metrics strategy. We also hope that more people will be inspired by this work and join us to improve it.

### How we began

The CHAOSS App Ecosystem Working Group emerged from the [SCALE 18x][5] conference in March 2020, when CHAOSS and GNOME members began talking about how to measure the [Linux App Summit][6] (LAS) community, an event co-hosted by GNOME and KDE. 

We realized that we did not have sufficient data to measure our progress towards LAS's goals, and that hindered our ability to make important decisions to support those goals. For LAS (and the whole Linux app ecosystem) to thrive, we recognized the need to be more data-driven in our approach. We also realized the importance of extending this mindset to other similarly organized communities.

From our experience at [CHAOSScon][7], we found opportunities to partner with the CHAOSS community around open source metrics. Therefore, we organized ourselves under the CHAOSS project, which provides a platform for working on metrics.

We chose the name App Ecosystem Working Group because one of the GNOME and KDE communities' primary goals is to grow the Linux app ecosystem. Although we had the GNOME and KDE communities in mind at the start, we are creating the metrics to help everyone involved in the effort to grow the Linux app ecosystem.

We chose to begin with the event organizer use case because of the nature of events: Events tend to have clearly defined boundaries, with a set start and end date, a list of registered attendees, and activities like talks, presentations, and workshops. This clarity does not generally exist in open source projects and communities, where the various projects, contributors, and users are less often strictly defined.

The GNOME and KDE communities both had events coming up in 2020, so we believed we could iterate faster using feedback gathered from the events we organized, separately and together.

### Approach to data gathering

The CHAOSS project uses the [goal-question-metric][8] (GQM) approach to gathering data. One problem with metrics is that often we try to measure everything without understanding how the data will be helpful. But data should help inform decisions. Therefore, the GQM approach starts with a list of high-level goals that are important to a particular persona.

The goals are the community's strategic objectives. For each goal, we look at questions that help determine whether we are achieving the goal. Metrics then provide quantitative information that helps answer those questions.

Before diving into metrics, the App Ecosystem Working Group brainstormed goals and the personas that those goals affect. We collected [17 different goals][9], spread across seven stakeholder personas, that a community or project ecosystem might have.

We collected and curated these goals from community members' experience in major open source projects like GNOME and KDE. Although each community is different, we think most of these goals are relevant to and will help a wide variety of open source projects.

### Metrics for event organizers

The [full list of metrics for event organizers][10] focus on three goals that event organizers care about:

  * Attracting and retaining contributors
  * Understanding company contributions to an event
  * Ensuring events contribute towards diversity goals and closing skill gaps in the community



We came up with 19 questions that event organizers have about how well they are doing in reaching these goals. The metrics are directly linked to these questions to give the event organizers actionable insights.

### Privacy implications

While this work was developed by and for the GNOME and KDE communities, we hope that the metrics will help other open source communities.

While GNOME and KDE have not implemented the metrics yet (and do not yet have a timeline to do so), one known limitation is privacy concerns around data collection. Every geographic location has laws that may limit data collection, which open source and free software projects must take into account.

Once GNOME and KDE implement these metrics in their communities, they plan to share the legal considerations they took into account.

### Join us

We are hopeful that these metrics will be useful to open source event organizers interested in integrating virtual and in-person events into their community-building and engagement strategies.

If you'd like to participate in developing these metrics, we welcome your experience, insight, and voice! The CHAOSS App Ecosystem Working Group [meets biweekly][11]; please join us.

You can also communicate with us asynchronously through our [GitHub repository][3]. For more information on other ways to contribute or connect with us, we encourage you to visit the [CHAOSS community participation page][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/chaoss-open-source-events

作者：[Neofytos Kolokotronis][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/neofytosk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D (Metrics and a graph illustration)
[2]: https://chaoss.community/
[3]: https://github.com/chaoss/wg-app-ecosystem
[4]: https://github.com/chaoss/wg-app-ecosystem#contributors
[5]: https://www.socallinuxexpo.org/scale/18x
[6]: https://linuxappsummit.org/
[7]: https://chaoss.community/chaosscon-2020-eu/
[8]: https://en.wikipedia.org/wiki/GQM
[9]: https://docs.google.com/document/d/1ghREXIO5C9PLiwXMtouOR4AjPLGz9pD34LIxO8N2-xo/edit
[10]: https://github.com/chaoss/wg-app-ecosystem/blob/master/event-organizers.md
[11]: https://github.com/chaoss/wg-app-ecosystem#workflow
[12]: https://chaoss.community/participate
