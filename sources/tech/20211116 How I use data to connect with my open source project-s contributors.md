[#]: subject: "How I use data to connect with my open source project's contributors"
[#]: via: "https://opensource.com/article/21/11/data-open-source-contributors"
[#]: author: "Jun Zhong https://opensource.com/users/zhongjun"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use data to connect with my open source project's contributors
======
Data can help identify a project's stakeholders, enabling the project to
make connections with the people behind the numbers.
![people in different locations who are part of the same team][1]

Open source projects need developers to survive, and one of the primary sources of developers is a project's user base. I'm involved with the openEuler project, where understanding the conversion rate of contributors from user to developer is a key metric. This article takes a look at the open source community from a hierarchical perspective, hoping to provide a new dimension to observe a community's health through data.

### Funnel model

To gain an operational perspective of how a community works, you often can look to the code hosting platform a project uses, such as Gitlab, Github, or in the case of openEuler gitee.com. This is where your developers work, and probably where many of your users visit to check in with the project's progress. These platforms leave a digital footprint based on contribution, and it helps you understand the different type of interactions your contributors have with the project's codebase. For openEuler, the different developer types include those with permission to make commits to the the official openEuler website, those who've downloaded and installed the distribution, and those who update software packages daily.

Of course, not everyone needs an account just to use our OS, which means that some interactions cannot be classified. The inability to confirm the identity of contributors means it's hard to understand their interactions, so "developers" in the openEuler community are currently limited to developers who have interacted with the openEuler code repository on the code hosting platform. In other words, we have developers who we don't "know," because we only have data on developers who have entered the code repository.

The openEuler community divides known developers into three levels:

  1. **Code contributors (D2)**: Narrow contributors who have create a PR (Pull Request) and successfully merged code
  2. **Contributor (D1)**: A contributor in a broad sense, a developer who has merged a PR, submitted an Issue, or commented on an issue or PR
  3. **Developer (D0)**: Reach contributors are those who have submitted a PR, or commented on an issue or PR, or who have given the project a star, or are watching or have forked the repository



According to the above classification, the three levels of developers form an inclusive relationship from D0 to D2, which forms a funnel model.

![Funnel chart 1][2]

(Jun Zhong, [CC BY-SA 4.0][3])

This data can be viewed differently so that it creates the shape of a funnel, with D0 being the broadest classification, narrowing down to D2:

 

![Funnel chart 2][4]

(Jun Zhong, [CC BY-SA 4.0][3])

  * **Funnel chart**: Shows the conversion rate of each layer 
  * **Active**: Displays the number of active developers at each level of the time series according to the time distribution 
  * **By organization**: Displays the number of people invested by each organization according to the distribution of the organization



### Developers are people

Every developer participating in the community is a living individual rather than a cold KPI in a graphing platform. It's easy to become obsessed with the charts and graphs of digital operations, and ignore the developer's personality. But every developer is a customer, and you need to treat each developer's demands with a service mentality, and direct your project's operations toward developers rather than KPI.

Interestingly, though, the focus shifts depending on the type of contributor:

  * **Code contributors (D2)**: Focus on the community growth path and career path of the developer, cultivate long-term maintenance, or evangelize for the project. Cultivate developer's **loyalty** to the community.
  * **Contributor (D1)**: Pay attention to the developer's demands for the project's functions, assist the developer in using the project in actual production. Help the developer communicate with the rest of the community to help explain how and why the project works the way it does. Use process to enhance the developer's trust in the community, and the community's trust in the development team.
  * **Developer (D0)**: These are followers of the project, so focus on relaying the technical characteristics of the project, use cases. These contributors can help by participating in trials of the project, demonstrating what the project can do for them. This is your opportunity to get people's attention, and to bring them closer to the project as users.



Contributors of open source projects are not stable. They aren't fixed points in time that never change. Development is, appropriately, a developing role. As a contributor, it's easy to get started with a project as "just a user" and then progress into a contributor, and later to being a core contributor, and each step of that journey is important, and none of them should lead to a dead end.

### Summary

Your project needs to understand who its contributors are. Yours may be different than openEuler's, but you must identify the path, the milestones, the different roles, the different stages of a contributor's life. Data can help you identify who your stakeholders are, but from that data you must make connections with the people behind the numbers. Get to know your contributors, understand what they need from your project, and make sure their journey alongside your project is mutually beneficial.

* * *

_This article is adapted from the [author's post][5] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/data-open-source-contributors

作者：[Jun Zhong][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zhongjun
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://opensource.com/sites/default/files/uploads/2021-09-15-developer-level-01.png (Funnel chart 1)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/2021-09-15-developer-level-02.png (Funnel chart 2)
[5]: https://gitee.com/openeuler/website-v2/blob/master/web-ui/docs/en/blog/zhongjun/2021-09-15-developer-level.md
