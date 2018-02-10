UQDS: A software-development process that puts quality first
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag)

The Ultimate Quality Development System (UQDS) is a software development process that provides clear guidelines for how to use branches, tickets, and code reviews. It was invented more than a decade ago by Divmod and adopted by [Twisted][1], an event-driven framework for Python that underlies popular commercial platforms like HipChat as well as open source projects like Scrapy (a web scraper).

Divmod, sadly, is no longer around—it has gone the way of many startups. Luckily, since many of its products were open source, its legacy lives on.

When Twisted was a young project, there was no clear process for when code was "good enough" to go in. As a result, while some parts were highly polished and reliable, others were alpha quality software—with no way to tell which was which. UQDS was designed as a process to help an existing project with definite quality challenges ramp up its quality while continuing to add features and become more useful.

UQDS has helped the Twisted project evolve from having frequent regressions and needing multiple release candidates to get a working version, to achieving its current reputation of stability and reliability.

### UQDS's building blocks

UQDS was invented by Divmod back in 2006. At that time, Continuous Integration (CI) was in its infancy and modern version control systems, which allow easy branch merging, were barely proofs of concept. Although Divmod did not have today's modern tooling, it put together CI, some ad-hoc tooling to make [Subversion branches][2] work, and a lot of thought into a working process. Thus the UQDS methodology was born.

UQDS is based upon fundamental building blocks, each with their own carefully considered best practices:

  1. Tickets
  2. Branches
  3. Tests
  4. Reviews
  5. No exceptions



Let's go into each of those in a little more detail.

#### Tickets

In a project using the UQDS methodology, no change is allowed to happen if it's not accompanied by a ticket. This creates a written record of what change is needed and—more importantly—why.

  * Tickets should define clear, measurable goals.
  * Work on a ticket does not begin until the ticket contains goals that are clearly defined.



#### Branches

Branches in UQDS are tightly coupled with tickets. Each branch must solve one complete ticket, no more and no less. If a branch addresses either more or less than a single ticket, it means there was a problem with the ticket definition—or with the branch. Tickets might be split or merged, or a branch split and merged, until congruence is achieved.

Enforcing that each branch addresses no more nor less than a single ticket—which corresponds to one logical, measurable change—allows a project using UQDS to have fine-grained control over the commits: A single change can be reverted or changes may even be applied in a different order than they were committed. This helps the project maintain a stable and clean codebase.

#### Tests

UQDS relies upon automated testing of all sorts, including unit, integration, regression, and static tests. In order for this to work, all relevant tests must pass at all times. Tests that don't pass must either be fixed or, if no longer relevant, be removed entirely.

Tests are also coupled with tickets. All new work must include tests that demonstrate that the ticket goals are fully met. Without this, the work won't be merged no matter how good it may seem to be.

A side effect of the focus on tests is that the only platforms that a UQDS-using project can say it supports are those on which the tests run with a CI framework—and where passing the test on the platform is a condition for merging a branch. Without this restriction on supported platforms, the quality of the project is not Ultimate.

#### Reviews

While automated tests are important to the quality ensured by UQDS, the methodology never loses sight of the human factor. Every branch commit requires code review, and each review must follow very strict rules:

  1. Each commit must be reviewed by a different person than the author.
  2. Start with a comment thanking the contributor for their work.
  3. Make a note of something that the contributor did especially well (e.g., "that's the perfect name for that variable!").
  4. Make a note of something that could be done better (e.g., "this line could use a comment explaining the choices.").
  5. Finish with directions for an explicit next step, typically either merge as-is, fix and merge, or fix and submit for re-review.



These rules respect the time and effort of the contributor while also increasing the sharing of knowledge and ideas. The explicit next step allows the contributor to have a clear idea on how to make progress.

#### No exceptions

In any process, it's easy to come up with reasons why you might need to flex the rules just a little bit to let this thing or that thing slide through the system. The most important fundamental building block of UQDS is that there are no exceptions. The entire community works together to make sure that the rules do not flex, not for any reason whatsoever.

Knowing that all code has been approved by a different person than the author, that the code has complete test coverage, that each branch corresponds to a single ticket, and that this ticket is well considered and complete brings a piece of mind that is too valuable to risk losing, even for a single small exception. The goal is quality, and quality does not come from compromise.

### A downside to UQDS

While UQDS has helped Twisted become a highly stable and reliable project, this reliability hasn't come without cost. We quickly found that the review requirements caused a slowdown and backlog of commits to review, leading to slower development. The answer to this wasn't to compromise on quality by getting rid of UQDS; it was to refocus the community priorities such that reviewing commits became one of the most important ways to contribute to the project.

To help with this, the community developed a bot in the [Twisted IRC channel][3] that will reply to the command `review tickets` with a list of tickets that still need review. The [Twisted review queue][4] website returns a prioritized list of tickets for review. Finally, the entire community keeps close tabs on the number of tickets that need review. It's become an important metric the community uses to gauge the health of the project.

### Learn more

The best way to learn about UQDS is to [join the Twisted Community][5] and see it in action. If you'd like more information about the methodology and how it might help your project reach a high level of reliability and stability, have a look at the [UQDS documentation][6] in the Twisted wiki.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/uqds

作者：[Moshe Zadka][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/moshez
[1]:https://twistedmatrix.com/trac/
[2]:http://structure.usc.edu/svn/svn.branchmerge.html
[3]:http://webchat.freenode.net/?channels=%23twisted
[4]:https://twisted.reviews
[5]:https://twistedmatrix.com/trac/wiki/TwistedCommunity
[6]:https://twistedmatrix.com/trac/wiki/UltimateQualityDevelopmentSystem
