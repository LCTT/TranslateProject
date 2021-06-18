[#]: subject: (Try this new open source tool for data analytics)
[#]: via: (https://opensource.com/article/21/6/cubejs)
[#]: author: (Ray Paik https://opensource.com/users/rpaik)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Try this new open source tool for data analytics
======
Cube.js is an open source analytical platform that acts as a layer
between data sources and applications.
![metrics and data shown on a computer screen][1]

Data analytics is a trendy field with many solutions available. One of them is [Cube.js][2], an open source analytical platform. You can think of Cube.js as a layer between your data sources and applications.

As the diagram below shows, Cube.js supports serverless data warehouses and most modern relational database management systems (RDBMS). You can work with any JavaScript front-end library for data visualization, and Cube.js will take care of the rest, including access control, performance, concurrency, and more.

![Cube.js architecture][3]

(©2021, [Cube Dev, Inc.][2])

### Key benefits

When I ask our community members about Cube.js's key benefits, they frequently mention:

  * **Its abstraction layer:** After configuring Cube.js, people say they no longer have to worry about performance optimization, resource management, SQL expertise, etc. Many refer to Cube.js as a "black box" because its abstraction layer helps them focus on understanding the data rather than the implementation details.
  * **Ease of customization:** Since Cube.js is visualization-agnostic, it's easy to integrate with front-end frameworks to build solutions that look like a user's own platform. Most commercial platforms (e.g., Looker, Tableau, etc.) require a lot more customization work to integrate with their infrastructure. Many users say that the ease of customization combined with the abstraction layer enables them to reduce development time for their data analytics platforms.
  * **Community support:** When getting started with Cube.js, people usually get help from fellow community members (especially on our [Slack][4]), and many mention community support as a key onboarding resource.



Visit the [user stories page][5] to read more about people's experience with Cube.js and how they use it.

### Get started

If you want to check out Cube.js:

  * Go to our [Documentation page][6], click on **Getting started**, and follow the instructions to get Cube.js up and running on your laptop or workstation.
  * Once you get to the [developer playground][7], you will be able to generate the data schema, execute queries, and build dashboards to see Cube.js in action.



After you get Cube.js up and running, here are some helpful resources:

  * [Documentation][6]: We put a lot of focus on our documentation because it is a critical resource for open source communities. We're also adding video clips to our documentation pages and the [getting started playlist][8] on our YouTube channel.
  * [Discourse][9]: The Cube.js forum is a recent addition where community members can share their use cases, tips &amp; tricks, etc. so that we can build a community knowledge base.
  * [GitHub][10]: You'll find the Cube.js code here, and community members file bugs or feature requests via [issues][11]. We also publish our [quarterly roadmaps][12] on GitHub so that everyone can see what we're working on.
  * [Monthly community calls][13]: We have calls on the second Wednesday of each month to discuss community updates, showcase feature demos, and invite community members to share their use cases. You will find call logistics on the [community calls page][13], and you can find recordings of past calls on the [community calls playlist][14] on our YouTube channel.



As with any good open source project, Cube.js has many contributors to the software. If you want to look at pull requests (PRs) from the community, search for PRs with the label `pr:community`. If you are eager to look for issues that you can work on, search for issues with the labels `good first issue` or `help wanted`.

I hope you will give Cube.js a try. If you have any questions, please feel free to leave comments below or find me on the [Cube.js Slack][4]!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/cubejs

作者：[Ray Paik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rpaik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://cube.dev/
[3]: https://opensource.com/sites/default/files/uploads/cubejs-architecture.png (Cube.js architecture)
[4]: https://slack.cube.dev/
[5]: https://cube.dev/blog/category/user-stories/
[6]: https://cube.dev/docs/
[7]: https://cube.dev/docs/dev-tools/dev-playground
[8]: https://www.youtube.com/playlist?list=PLtdXl_QTQjpaXhVEefh7JCIdtYURoyWo9
[9]: https://forum.cube.dev/
[10]: https://github.com/cube-js/cube.js
[11]: https://github.com/cube-js/cube.js/issues
[12]: https://github.com/cube-js/cube.js/projects
[13]: https://cube.dev/community-call/
[14]: https://www.youtube.com/playlist?list=PLtdXl_QTQjpb1dHZCM09qKTsgvgqjSvc9
