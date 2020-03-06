[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DevOps vs Agile: What's the difference?)
[#]: via: (https://opensource.com/article/20/2/devops-vs-agile)
[#]: author: (Taz Brown https://opensource.com/users/heronthecli)

DevOps vs Agile: What's the difference?
======
The difference between the two is what happens after development.
![Pair programming][1]

Early on, software development didn't really fit under a particular management umbrella. Then along came [waterfall][2], which spoke to the idea that software development could be defined by the length of time an application took to create or build.

Back then, it often took long periods of time to create, test, and deploy software because there were no checks and balances during the development process. The results were poor software quality with defects and bugs and unmet timelines. The focus was on long, drawn-out plans for software projects.

Waterfall projects have been associated with the [triple constraint][3] model, which is also called the project management triangle. Each side of the triangle represents a component of the triple constraints of project management: **scope**, **time**, and **cost**. As [Angelo Baretta writes][4], the triple constraint model "says that cost is a function of time and scope, that these three factors are related in a defined and predictable way… [I]f we want to shorten the schedule (time), we must increase cost. It says that if we want to increase scope, we must increase cost or schedule."

### Transitioning from waterfall to agile

Waterfall came from manufacturing and engineering, where a linear process makes sense; you build the wall before you build the roof. Similarly, software development problems were viewed as something that could be solved with planning. From beginning to end, the development process was clearly defined by a roadmap that would lead to the final delivery of a product.

Eventually, waterfall was recognized as detrimental and counterintuitive to software development because, often, the value could not be determined until the very end of the project cycle, and in many cases, the projects failed. Also, the customer didn't get to see any working software until the end of the project.

Agile takes a different approach that moves away from planning the entire project, committing to estimated dates, and being accountable to a plan. Rather, agile assumes and embraces uncertainty. It is built around the idea of responding to change instead of charging past it or ignoring the need for it. Instead, change is considered as a way to fulfill the needs of the customer.

### Agile values

Agile is governed by the Agile Manifesto, which defines [12 principles][5]:

  1. Satisfying the customer is the top priority
  2. Welcome changing requirements, even late in development
  3. Deliver working software frequently
  4. Development and business must work together
  5. Build projects around motivated people
  6. Face-to-face communication is the most efficient and effective method of conveying information
  7. The primary measure of success is working software
  8. Agile processes promote sustainable development
  9. Maintain continuous attention to technical excellence and good design
  10. Simplicity is essential
  11. The best architectures, requirements, and designs emerge from self-organizing teams
  12. Regularly reflect on work, then tune and adjust behavior



Agile's four [core values][6] are:

  * **Individuals and interactions** over processes and tools
  * **Working software** over comprehensive documentation
  * **Customer collaboration** over contract negotiation
  * **Responding to change** over following a plan



This contrasts with waterfall's rigid planning style. In agile, the customer is a member of the development team rather than engaging only at the beginning, when setting business requirements, and at the end, when reviewing the final product (as in waterfall). The customer helps the team write the [acceptance criteria][7] and remains engaged throughout the process. In addition, agile requires changes and continuous improvement throughout the organization. The development team works with other teams, including the project management office and the testers. What gets done and when are led by a designated role and agreed to by the team as a whole.

### Agile software development

Agile software development requires adaptive planning, evolutionary development, and delivery. Many software development methodologies, frameworks, and practices fall under the umbrella of being agile, including:

  * Scrum
  * Kanban (visual workflow)
  * XP (eXtreme Programming)
  * Lean
  * DevOps
  * Feature-driven development (FDD)
  * Test-driven development (TDD)
  * Crystal
  * Dynamic systems development method (DSDM)
  * Adaptive software development (ASD)



All of these have been used on their own or in combination for developing and deploying software. The most common are [scrum, kanban][8] (or the combination called scrumban), and DevOps.

[Scrum][9] is a framework under which a team, generally consisting of a scrum master, product owner, and developers, operates cross-functionally and in a self-directed manner to increase the speed of software delivery and

to bring greater business value to the customer. The focus is on faster iterations with smaller [increments][10].

[Kanban][11] is an agile framework, sometimes called a workflow management system, that helps teams visualize their work and maximize efficiency (thus being agile). Kanban is usually represented by a digital or physical board. A team's work moves across the board, for example, from not started, to in progress, testing, and finished, as it progresses. Kanban allows each team member to see the state of all work at any time.

### DevOps values

DevOps is a culture, a state of mind, a way that software development or infrastructure is, and a way that software and applications are built and deployed. There is no wall between development and operations; they work simultaneously and without silos.

DevOps is based on two other practice areas: lean and agile. DevOps is not a title or role within a company; it's really a commitment that an organization or team makes to continuous delivery, deployment, and integration. According to [Gene Kim][12], author of _The Phoenix Project_ and _The Unicorn Project_, there are three "ways" that define the principles of DevOps:

  * The First Way: Principles of flow
  * The Second Way: Principles of feedback
  * The Third Way: Principles of continuous learning



### DevOps software development

DevOps does not happen in a vacuum; it is a flexible practice that, in its truest form, is a shared culture and mindset around software development and IT or infrastructure implementation.

When you think of automation, cloud, microservices, you think of DevOps. In an [interview][13], _Accelerate: Building and Scaling High Performing Technology Organizations_ authors Nicole Forsgren, Jez Humble, and Gene Kim explained:

>   * Software delivery performance matters, and it has a significant impact on organizational outcomes such as profitability, market share, quality, customer satisfaction, and achieving organizational and mission goals.
>   * High performers achieve levels of throughput, stability, and quality; they're not trading off to achieve these attributes.
>   * You can improve your performance by implementing practices from the lean, agile, and DevOps playbooks.
>   * Implementing these practices and capabilities also has an impact on your organizational culture, which in turn has an impact on both your software delivery performance and organizational performance.
>   * There's still lots of work to do to understand how to improve performance.
>


### DevOps vs. agile

Despite their similarities, DevOps and agile are not the same, and some argue that DevOps is better than agile. To eliminate the confusion, it's important to get down to the nuts and bolts.

#### Similarities

  * Both are software development methodologies; there is no disputing this.
  * Agile has been around for over 20 years, and DevOps came into the picture fairly recently.
  * Both believe in fast software development, and their principles are based on how fast software can be developed without causing harm to the customer or operations.



#### Differences

  * **The difference between the two** is what happens after development.
    * Software development, testing, and deployment happen in both DevOps and agile. However, pure agile tends to stop after these three stages. In contrast, DevOps includes operations, which happen continually. Therefore, monitoring and software development are also continuous.
  * In agile, separate people are responsible for developing, testing, and deploying the software. In DevOps, the DevOps engineering role is are responsible for everything; development is operations, and operations is development.
  * DevOps is more associated with cost-cutting, and agile is more synonymous with lean and reducing waste, and concepts like agile project accounting and minimum viable product (MVP) are relevant.
  * Agile focuses on and embodies empiricism (**adaptation**, **transparency**, and **inspection**) instead of predictive measures.

Agile | DevOps
---|---
Feedback from customer | Feedback from self
Smaller release cycles | Smaller release cycles, immediate feedback
Focus on speed | Focus on speed and automation
Not the best for business | Best for business

### Wrapping up

Agile and DevOps are distinct, although their similarities lead people to think they are one and the same. This does both agile and DevOps a disservice.

In my experience as an agilist, I have found it valuable for organizations and teams to understand—from a high level—what agile and DevOps are and how they aid teams in working faster and more efficiently, delivering quality faster, and improving customer satisfaction.

Agile and DevOps are not adversarial in any way (or at least the intent is not there). They are more allies than enemies in the agile revolution. Agile and DevOps can operate exclusively and inclusively, which allows both to exist in the same space.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/devops-vs-agile

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: http://www.agilenutshell.com/agile_vs_waterfall
[3]: https://en.wikipedia.org/wiki/Project_management_triangle
[4]: https://www.pmi.org/learning/library/triple-constraint-erroneous-useless-value-8024
[5]: https://agilemanifesto.org/principles.html
[6]: https://agilemanifesto.org/
[7]: https://www.productplan.com/glossary/acceptance-criteria/
[8]: https://opensource.com/article/19/8/scrum-vs-kanban
[9]: https://www.scrum.org/
[10]: https://www.scrum.org/resources/what-is-an-increment
[11]: https://www.atlassian.com/agile/kanban
[12]: https://itrevolution.com/the-unicorn-project/
[13]: https://www.infoq.com/articles/book-review-accelerate/
