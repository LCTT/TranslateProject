[#]: subject: "How we track the community health of our open source project"
[#]: via: "https://opensource.com/article/22/8/open-source-community-health-metrics-savannah"
[#]: author: "Ruth Cheesley https://opensource.com/users/rcheesley"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How we track the community health of our open source project
======
Mautic chose Savannah CRM to support community building and recognition efforts.

To be an effective leader in an open source community, you need a lot of information. How do I know who the most active members in my community are? Which companies are making the most contributions? Which contributors are drifting away and becoming inactive? Who in the community is knowledgeable about a specific topic?

These were just a few of the questions I had when I started leading the Mautic community at Acquia. But the problem was not a shortage of information. On the contrary, there were so many places our community interacted and so many things to track that I was drowning in data. I could access plenty of data sources, but they were not helping me manage the community effectively or answering my questions.

### Tracking all the places

I needed to find a tool to bring all of this together and give the community leadership team a centralized place to see activity everywhere we have people discussing Mautic. More importantly, we needed a tool that could accurately track who was contributing in every way that we defined contributions.

I tried several tools, but the most promising was the open source Community Relationship Manager Savannah CRM, a relative newcomer to the market. What stood out to me in Savannah was its focus on contribution as well as community health. Other tools I reviewed either did not have a clear concept of contributions or did not cover all the places we wanted to track.

I started working locally by checking out the [GitHub repository][2] for the Django-based application and quickly began to see the power of bringing all of my metrics into one place. Straight away, I could see a list of new contributors, most active community members, organizations, and even an interactive display allowing me to see how contributors were connected with each other and across the different channels we use.

![Savannah community dashboard][3]

Image by: (Michael Hall, CC BY-SA 4.0)

In the early days of using Savannah, this function helped identify potential leaders for teams and initiatives. The tagging feature also meant I could quickly find out who was talking about a specific topic and where those conversations were happening in the community.

As the community matured, notifications alerting me to contributors becoming inactive started to be really helpful in prompting a personal check-in with them. Using projects to track activity and contributor funnels in specific areas of our community has helped us spot where contributions are dropping off. Having the ability to "watch" community members who previously breached the code of conduct made it much easier to keep track of their future conduct and act swiftly if there were more incidents.

Over time we have moved to a hosted plan (mainly because we don't have the contributors to manage our own infrastructure at this time) and have continued to extend how we are using this tool.

It's really at the heart of everything we do in our community, and it helps me proactively manage our community. It supports everything from my monthly recognition shout-outs to determining whether an organization has a sustained history of contributing that would entitle them to become—and remain—a Community Partner.

### Tracking all the open source contributions

Over the last two years, we have expanded what we track as a contribution in Mautic. Currently, the list includes:

* Authoring a blog post on mautic.org
* Creating a community-focused podcast episode
* Making a pull request (PR) on any of our GitHub repositories
* Reviewing a PR on any of our GitHub repositories
* Completing a Jira issue on any of our Jira projects
* Providing help or feedback on Slack
* Having an answer accepted as a solution on the Discourse forums
* Giving help on a Reddit thread
* Organizing or speaking at an official Mautic event
* Organizing or speaking at a Meetup
* Having an answer to a question accepted on Stack Exchange

Most of these are available out of the box with Savannah, but some, such as reviewing a PR or completing a Jira issue, we implemented with the application programming interface (API) and integrations with automation tools.

We also track and highlight the folks who support and engage with others before they contribute, since this often helps the individual make that contribution in the future.

### Tracking progress over time

We have several publicly shared reports, including:

* [Activity over the last 90 days][4]
* [Annual report][5] (2021)
* [All contributions over time][6]
* Monthly reports ([July 2022][7], [June 2022][8], [May 2022][9])

Any report in Savannah and any screen can be shared publicly, making it a really easy way to share things with others.

![A pie chart reflects the amount of conversations among eight different sources. The top sources on the chart are Slack, GitHub, and Discourse. Other sources included Reddit, Stack Exchange, and RSS][10]

Image by: (Ruth Cheesley, CC BY-SA 4.0)

For us, it allows folks to see what is happening within the community and also offers a public way to recognize the organizations and individuals who are consistently contributing or engaging in the community.

### New features in Savannah

We have experimented with some of the newer features in Savannah, such as tracking when we send swag to contributors and whether it affects future contributions. Another feature I am excited to look into allows us to flag a potential contributor opportunity—for example, if we come across someone we would like to support with writing for the blog, creating a meetup group, or submitting a new feature. Savannah then allows us to track the nurturing of that contributor.

There are often new features being added, which is great to see. Because it is an open source project, you can, of course, make your own PR to implement new features or fix bugs you come across.

So far, Savannah has been an excellent tool for tracking our community health in the Mautic community, and it has really helped us both track and recognize contributions across our far-reaching community. I hope that you find it useful in your communities too!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/open-source-community-health-metrics-savannah

作者：[Ruth Cheesley][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rcheesley
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/Open%20Pharma.png
[2]: https://github.com/savannahhq/savannah
[3]: https://opensource.com/sites/default/files/2022-08/savannah.png
[4]: https://savannahcrm.com/public/overview/2b4590bf-cad0-4c71-870a-6f942a25f8fe/
[5]: https://savannahcrm.com/public/report/be33f366-f98e-4f21-915b-cdecadd3dc0e/
[6]: https://savannahcrm.com/public/contributions/d26d705d-c5e5-40f5-bd6a-ba1ffda474c3/
[7]: https://savannahcrm.com/public/report/ecba71f9-a28a-48f4-a268-a499e063b000/
[8]: https://savannahcrm.com/public/report/5b0329df-dad0-4091-85ce-373a0e7e4cf3/
[9]: https://savannahcrm.com/public/report/c7227c78-1053-4652-b4a2-0d9a53f0f413/
[10]: https://opensource.com/sites/default/files/2022-08/source%20of%20contributions_0.png
