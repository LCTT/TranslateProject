[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Measuring the business value of open source communities)
[#]: via: (https://opensource.com/article/19/10/measuring-business-value-open-source)
[#]: author: (Jon Lawrence https://opensource.com/users/the3rdlaw)

Measuring the business value of open source communities
======
Corporate constituencies are interested in finding out the business
value of open source communities. Find out how to answer key questions
with the right metrics.
![Lots of people in a crowd.][1]

In _[Measuring the health of open source communities][2]_, I covered some of the key questions and metrics that we’ve explored as part of the [CHAOSS project][3] as they relate to project founders, maintainers, and contributors. In this article, we focus on open source corporate constituents (such as open source program offices, business risk and legal teams, human resources, and others) and end users.

Where the bulk of the metrics for core project teams are quantitative, for the remaining constituents our metrics must reflect a much broader range of interests, and address many more qualitative measures. From the metrics collection standpoint, much of the data collection for qualitative measures is much more manual and subjective, but it is nonetheless within the scope CHAOSS hopes to be able to address as the project matures.

While people on the business side of things do sometimes care about the metrics in use by the project itself, there are only two fundamental questions that corporate constituencies have. The first is about _value_: "Will this choice help our business make more money sooner?" The second is about _risk_: "Will this choice hurt our business’s chances of making money?"

Those questions can come in many different iterations across disciplines, from human resources to legal counsel and executive offices. But, at the end of the day, having answers that are based on data can make open source engagement more efficient, effective, and less risky.

Once again, the information below is structured in a Goal-Question-Metric format:

  * Open source program offices (OSPOs)
    * As an OSPO leader, I care about prioritizing our resources toward healthy communities:
      * How [active][4] is the community?
**Metric:** [Code development][5] \- The number of commits and pull requests, review time for new code commits and pull requests, code reviews and merges, the number of accepted vs. rejected pull requests, and the frequency of new version releases.
**Metric:** [Issue resolution][6] \- The number of new issues, closed issues, the ratio of new vs. closed issues, and the average open time per issue.
**Metric:** Social - Social media mention counts, social media sentiment analysis, the activity of community blog, and news releases (_future release_).
      * What is the [value][7] of our contributions to the project? (This is an area in active development.)
**Metric:** Time value - Time saved for training developers on new technologies, and time saved maintaining custom development once the improvements are upstreamed.
**Metric:** Dollar value - How much would it have cost to maintain changes and custom solutions internally, versus contributing upstream and ensuring compatibility with future community releases
      * What is the value of contributions to the project by other contributors and organizations?
**Metric:** Time value - Time to market, new community-developed features released, and support for the project by the community versus the company.
**Metric:** Dollar value - How much would it cost to internally rebuild the features provided by the community, and what is the opportunity cost of lagging behind innovations in open source projects?
    * Downstream value: How many other projects list our project as a dependency?
**Metric:** The value of the ecosystem that is around a project.
    * How many forks of our project have there been?
**Metric:** Are core developers more active in the mainline or a fork?
**Metric:** Are the forks contributing back to the mainline, or developing in new directions?
  * Engineering leadership
    * As an approving architect, I care most about good design patterns that introduce a minimum of technical debt.
**Metric:** [Test Coverage][8] \- What percentage of the code is tested?
**Metric:** What is the percentage of code undergoing code reviews?
**Metric:** Does the project follow [Core][9] [Infrastructure][9] [Initiative (CII) Best Practices][9]?
    * As an engineering executive, I care most about minimizing time-to-market and bugs, and maximizing platform stability and reliability.
**Metric:** The defect resolution velocity.
**Metric:** The defect density.
**Metric:** The feature development velocity.
    * I also want social proofs that give me a level of comfort.
**Metric:** Sentiment analysis of social media related to the project.
**Metric:** Count of white papers.
**Metric:** Code Stability - Project version numbers and the frequency of new releases.



There is also the issue of legal counsel. This goal statement is: "As legal counsel, I care most about minimizing our company’s chances of getting sued." The question is: "What kind of license does the software have, and what obligations do we have under the license?"

The metrics involved here are:

  * **Metric:** [License Count][10] \- How many different licenses are declared in a given project?
  * **Metric:** [License Declaration][11] \- What kinds of licenses are declared in a given project?
  * **Metric:** [License Coverage][12] \- How much of a given codebase is covered by the declared license?



Lastly, there are further goals our project is considering to measure the impact of corporate open source policy as it relates to talent acquisition and retention. The goal for human resource managers is: "As an HR manager, I want to attract and retain the best talent I can." The questions and metrics are as follows:

  * What impact do our open source policies have on talent acquisition?
**Metric:** Talent acquisition - Measure over time how many candidates report that it’s important to them that they get to work with open source technologies.
  * What impact do our open source policies have on talent retention?
**Metric:** Talent retention - Measure how much employee churn can be reduced because of people being able to work with or use open source technologies.
  * What is the impact on training employees who can learn from engaging in open source projects?
**Metric:** Talent development - Measure over time the importance to employees of being able to use open source tech effectively.
  * How does allowing employees to work in a community outside of the company impact job satisfaction?
**Metric:** Talent satisfaction - Measure over time the importance to employees of being able to contribute to open source tech.
**Source:** Internal surveys.
**Source:** Exit interviews. Did our policies around open source technologies at all influence your decision to leave?



### Wrapping up

It is still the early days of building a platform for bringing together these disparate data sources. The CHAOSS core of [Augur][13] and [GrimoireLab][14] currently supports over two dozen sources, and I’m excited to see what lies ahead for this project.

As the CHAOSS frameworks mature, I’m optimistic that teams and projects that implement these types of measurement will be able to make better real-world decisions that result in healthier and more productive software development lifecycles.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/measuring-business-value-open-source

作者：[Jon Lawrence][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/the3rdlaw
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_community_1.png?itok=rT7EdN2m (Lots of people in a crowd.)
[2]: https://opensource.com/article/19/8/measure-project
[3]: https://github.com/chaoss/
[4]: https://github.com/chaoss/wg-evolution/blob/master/focus_areas/community_growth.md
[5]: https://github.com/chaoss/wg-evolution#metrics
[6]: https://github.com/chaoss/wg-evolution/blob/master/focus_areas/issue_resolution.md
[7]: https://github.com/chaoss/wg-value
[8]: https://chaoss.community/metric-test-coverage/
[9]: https://github.com/coreinfrastructure/best-practices-badge
[10]: https://github.com/chaoss/wg-risk/blob/master/metrics/License_Count.md
[11]: https://github.com/chaoss/wg-risk/blob/master/metrics/License_Declared.md
[12]: https://github.com/chaoss/wg-risk/blob/master/metrics/License_Coverage.md
[13]: https://github.com/chaoss/augur
[14]: https://github.com/chaoss/grimoirelab
