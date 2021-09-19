[#]: subject: "5 best practices for using open source community leaderboards"
[#]: via: "https://opensource.com/article/21/9/community-leaderboard"
[#]: author: "Georg Link https://opensource.com/users/georglink"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 best practices for using open source community leaderboards
======
If leaderboards are done right, they can increase participation,
motivate contributors with gamification, and enhance the community.
![Gold trophy on green background][1]

It takes a community of people with varying skill sets and expertise to build open source software. Leaderboards have become a way for open source communities to track progress and showcase and celebrate top-performing contributors. If leaderboards are done right, they can increase participation, motivate contributors with gamification, and enhance the community. But leaderboards can also have adverse outcomes—including discouraging participation.

The Community Health Analytics Open Source Software (CHAOSS) community, a Linux Foundation project, focuses on bringing standardization to open source project health and metrics. Leaderboards are a topic that keeps coming up during those conversations. Initially, this blog post was a presentation I made for [Upstream 2021][2], the [Tidelift][3] event that kicked off Maintainer Week, a weeklong celebration of open source maintainers. This article will explore five best practices to help communities use leaderboards successfully and improve their project health through metrics.

### What are leaderboards? 

Leaderboards display rankings among a group of people or companies. Leaderboards work very well in sports where athletes compete with the same goal of running the fastest, jumping the furthest, or lifting the most weight. There is no such competition in open source communities, and the context is much more complex, but leaderboards may still be helpful. For example, [GitHub Insights][4] shows contributors with the most commits to a repository, which shows at a glance whether a community has more than just one or two active contributors. Another example is the [Drupal Marketplace][5], a leaderboard of ranked companies based on a [community-created algorithm][6] to reward companies with better positioning for being active in the community.

![GitHub insights for CHAOSS community repository][7]

(Georg Link, [CC BY-SA 4.0][8])

The above graphic shows two examples of sites measuring community involvement:

  * On the left, GitHub Insights for the CHAOSS Community repository shows the most active commit authors.
  * On the right,  Drupal Marketplace shows the companies that score highest for their contributions to Drupal, but without revealing the exact score and only the ranking.



### Why use leaderboards in open source communities? 

Open source communities depend on voluntary contributions, whether from individuals or company employees (where a company expects an employee to devote a certain amount of time to supporting a specific open source project). Tracking top contributors helps people to easily see who is active, what they're achieving, and who is behind a project.

Leaderboards create a sense of community for contributors where some members get highlighted for their open source work. Contributors who enjoy competition and like to engage in activities counted for the leaderboard's scoring, the desire to be on the leaderboard can inspire increased participation. This narrative makes it tempting to use leaderboards in open source communities. However, contributors who participate in ways that don't get counted in the scoring would not have any chance of showing up in the leaderboard and might be discouraged by it. This shows the importance of understanding how leaderboards work before using one in an open source community.

### How leaderboards work

There are multiple theories behind the principles of how leaderboards work to incentivize people. Still, primarily, leaderboards serve to [satisfy a human need][9] for competence, autonomy, and social relatedness, as well as a human tendency to rank and compare each other to understand our abilities better. [Gamification][10] inspires competition with a continual goal-attainment-reward design.

The schematic below is an imperfect representation of how leaderboards in open source work because it ignores the social elements of community engagement. Community activity gets logged as trace data, which a scoring algorithm converts into a score that determines the ranking in the leaderboard. Community members respond to the ranking and may change their community activity, which, in turn, may influence their leaderboard ranking. 

![Open source leaderboard schematic][11]

(Georg Link, [CC BY-SA 4.0][8])

However, leaderboards must be designed well to be effective. Leaderboards score contributors based on specified algorithms and data. The score indicates progress towards a success measure, as determined by what a leaderboard is designed to measure. Open source communities can use trace data. This kind of data is transparent, but it is created "accidentally" and contains personally identifiable information (PII) such as names and emails. This means that the data used for leaderboards need to be carefully obtained and utilized in awareness of privacy laws, such as the European Union's GDPR.

For example, GitHub Insights uses commits as the data that gets added up. Contributors are scored by how many commits they contributed to an open source repository. This simple example demonstrates the limitation of leaderboards. Because leaderboards rely on a scoring algorithm, anything that cannot be reduced to a score is ignored. In the example, complexity and value for commits get ignored. Thus a vulnerability fix that eliminates a cybersecurity risk is counted with the same value as a typo fix in the documentation.

This brings us to the problem of gamification. Gamification principles state that if contributors are not of equal ability, less skilled competitors will become less motivated as a task seems unreachable. In contrast, highly skilled competitors will find activities too easy, eventually demotivating them as well. Gamification of leaderboards also drives contributors to focus on activities rewarded in the scoring, often to the detriment of other significant contributions.

Open source engagement is a social activity, and reducing it to a game of numbers can alienate many contributors who would otherwise have made the community whole. Further, many activities in open source cannot be counted or measured because they do not leave any trace data. For example, learning, marketing, socializing, or coordinating occurs from direct interactions rather than community platforms. Consequently, leaderboards can worsen the issues open source faces regarding creating a welcoming and inclusive environment—only a specific subset of contributors can be rewarded by leaderboards, regardless of how well they are designed.

### Best practices

I wish I could say we have best practices for leaderboards. The reality is that leaderboards are extremely challenging to do well in open source, and attempts to create leaderboards can result in community backlash.

However, the CHAOSS community has developed best practices around project health and measuring communities to guide our thoughts and decision-making.

  * **Use a goal-metric approach: **When measuring open source communities, through leaderboards or otherwise, focus on specific goals. Be sure to decide the goal you want people to obtain and be clear about what you're measuring. You get more of what you start to measure because it orients community members.
  * **Evaluate the metric strategy regularly**: Things change and evolve, and what initially works may no longer motivate members. Periodically changing the metric strategy or leaderboard scoring algorithm is also necessary to actively work against gamification. Also, consider resetting leaderboards regularly to accommodate new community members.
  * **Be transparent about your scoring algorithm**: Invite community feedback to learn about the consequences of the algorithm and revise the algorithm accordingly. To be clear, it is okay not to reveal the specific scoring algorithm to limit the gamification of community members. What should be made public are the kinds of activities considered for the scoring, who decided on the algorithm, and how to provide feedback.
  * **Use multiple leaderboards for different contexts**: Due to the limitations of leaderboards, they can only be helpful for a limited use case. For example, an open source community's internationalization efforts might want a leaderboard for each language, offering recognition and incentives for a clearly defined activity to the different language teams. The same leaderboard would be useless for other contexts of the open source community.
  * **Automate continuous updates**: Leaderboards should always show the latest activity. This requires tools that collect the data regularly and update the leaderboards.



### Open source metrics solutions

Lastly, there are several open source metric solutions available. They got developed to understand project health, not create leaderboards. However, they solve the problem of collecting data that we can use for a scoring algorithm for leaderboards.

  * [Cauldron.io][12]
  * [CHAOSS GrimoireLab][13]
  * [CHAOSS Augur][14]
  * [Apache Kibble][15]
  * [CNCF Dev Analytics][16]
  * [Stackalytics][17]



With thoughtful design and in limited contexts, leaderboards can be a great way to help open source communities thrive, inspire participation, and celebrate and reward contributors. However, we cannot solve the overarching goal of understanding and promoting project health with leaderboards. The Upstream 2021 talk and this blog post are only one argument and a forcing function to formalize ideas in the ongoing conversation around leaderboards. Join the [CHAOSS Community][18] to continue the conversation.

You can also join the conversation for the [Panel Discussion: Contributor Leaderboards to Incentivize Good Community Citizenship][19] at the Open Source Summit North America 2021 in Seattle, WA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/community-leaderboard

作者：[Georg Link][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/georglink
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/trophy_celebrate.png?itok=jGnRHBq2 (Gold trophy on green background)
[2]: https://www.youtube.com/watch?v=aY3fg9hPnZY
[3]: https://tidelift.com/
[4]: https://github.com/chaoss/governance/graphs/contributors
[5]: https://www.drupal.org/drupal-services
[6]: https://www.drupal.org/project/drupalorg/issues/3086885
[7]: https://opensource.com/sites/default/files/uploads/github-insights-for-chaoss.png (GitHub insights for CHAOSS community repository)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://www.digits.co.uk/lms/the-psychology-of-leaderboards-why-they-do-in-fact-work/
[10]: https://medium.com/practical-motivation-science/how-to-motivate-with-leaderboards-da5a461fb2f6
[11]: https://opensource.com/sites/default/files/uploads/schematic-of-open-source-leaderboards.png (Open source leaderboard schematic)
[12]: https://cauldron.io/
[13]: https://chaoss.github.io/grimoirelab/
[14]: https://github.com/chaoss/augur/
[15]: https://kibble.apache.org/
[16]: https://github.com/cncf/devstats#readme
[17]: https://www.stackalytics.io/
[18]: https://chaoss.community/participate/
[19]: https://sched.co/lARk
