translating by Bestony
How to use pull requests to improve your code reviews
============================================================

Spend more time building and less time fixing with GitHub Pull Requests for proper code review.

 ![Measure](https://d3tdunqjn7n0wj.cloudfront.net/360x240/measure-106354_1920-a7f65d82a54323773f847cf572e640a4.jpg) 


>Take a look Brent and Peter’s book, [ _Introducing GitHub_ ][5], for more on creating projects, starting pull requests, and getting an overview of your team’s software development process.


If you don’t write code every day, you may not know some of the problems that software developers face on a daily basis:

*   Security vulnerabilities in the code
*   Code that causes your application to crash
*   Code that can be referred to as “technical debt” and needs to be re-written later
*   Code that has already been written somewhere that you didn’t know about


Code review helps improve the software we write by allowing other people and/or tools to look it over for us. This review can happen with automated code analysis or test coverage tools — two important pieces of the software development process that can save hours of manual work — or peer review. Peer review is a process where developers review each other's work. When it comes to developing software, speed and urgency are two components that often result in some of the previously mentioned problems. If you don’t release soon enough, your competitor may come out with a new feature first. If you don’t release often enough, your users may doubt whether or not you still care about improvements to your application.

### Weighing the time trade-off: code review vs. bug fixing

If someone is able to bring together multiple types of code review in a way that has minimal friction, then the quality of that software written over time will be improved. It would be naive to think that the introduction of new tools or processes would not at first introduce some amount of delay in time. But what is more expensive: time to fix bugs in production, or improving the software before it makes it into production? Even if new tools introduce some lag time in which a new feature can be released and appreciated by customers, that lag time will shorten as the software developers improve their own skills and the software release cycles will increase back to previous levels while bugs should decrease.

One of the keys for achieving this goal of proactively improving code quality with code review is using a platform that is flexible enough to allow software developers to quickly write code, plug in the tools they are familiar with, and do peer review of each others’ code. [GitHub][9] is a great example of such a platform. However, putting your code on GitHub doesn’t just magically make code review happen; you have to open a pull request to start down this journey.

### Pull requests: a living discussion about code

[Pull requests][10] are a tool on GitHub that allows software developers to discuss and propose changes to the main codebase of a project that later can be deployed for all users to see. They were created back in February of 2008 for the purpose of suggesting a change on to someone’s work before it would be accepted (merged) and later deployed to production for end-users to see that change.

Pull requests started out as a loose way to offer your change to someone’s project, but they have evolved into:

*   A living discussion about the code you want merged
*   Added functionality of increasing the visibility of what changed
*   Integration of your favorite tools
*   Explicit pull request reviews that can be required as part of a protected branch workflow

### Considering code: URLs are forever

Looking at the first two bullet points above, pull requests foster an ongoing code discussion that makes code changes very visible, as well as making it easy to pick up where you left off on your review. For both new and experienced developers, being able to refer back to these previous discussions about why a feature was developed the way it was or being linked to another conversation about a related feature should be priceless. Context can be so important when coordinating features across multiple projects and keeping everyone in the loop as close as possible to the code is great too. If those features are still being developed, it’s important to be able to just see what’s changed since you last reviewed. After all, it’s far easier to [review a small change than a large one][11], but that’s not always possible with large features. So, it’s important to be able to pick up where you last reviewed and only view the changes since then.

### Integrating tools: software developers are opinionated

Considering the third point above, GitHub’s pull requests have a lot of functionality but developers will always have a preference on additional tools. Code quality is a whole realm of code review that involves the other component to code reviews that aren’t necessarily human. Detecting code that’s “inefficient” or slow, a potential security vulnerability, or just not up to company standards is a task best left to automated tools. Tools like [SonarQube][12] and [Code Climate][13]can analyse your code, while tools like [Codecov][14] and [Coveralls][15] can tell you if the new code you just wrote is not well tested. The wonder of these tools is that they can plug into GitHub and report their findings right back into the pull request! This means the conversation not only has people reviewing the code, but the tools are reporting there too. Everyone can stay in the loop of exactly how a feature is developing.

Lastly, depending on the preference of your team, you can make the tools and the peer review required by leveraging the required status feature of the [protected branch workflow][16].

Though you may just be getting started on your software development journey, a business stakeholder who wants to know how a project is doing, or a project manager who wants to ensure the timeliness and quality of a project, getting involved in the pull request by setting up an approval workflow and thinking about integration with additional tools to ensure quality is important at any level of software development.

Whether it’s for your personal website, your company’s online store, or the latest combine to harvest this year’s corn with maximum yield, writing good software involves having good code review. Having good code review involves the right tools and platform. To learn more about GitHub and the software development process, take a look at the O’Reilly book, [ _Introducing GitHub_ ][17], where you can understand creating projects, starting pull requests, and getting an overview of your team's’ software development process.

--------------------------------------------------------------------------------

作者简介：

**Brent Beer**

Brent Beer has used Git and GitHub for over 5 years through university classes, contributions to open source projects, and professionally as a web developer. While working as a trainer for GitHub, he also became a published author of “Introducing GitHub” for O’Reilly. He now works as a solutions engineer for GitHub in Amsterdam to help bring Git and GitHub to developers across the world.

**Peter Bell**

Peter Bell is the founder and CTO of Ronin Labs. Training is broken - we're fixing it through technology enhanced training! He is an experienced entrepreneur, technologist, agile coach and CTO specializing in EdTech projects. He wrote "Introducing GitHub" for O'Reilly, created the "Mastering GitHub" course for code school and "Git and GitHub LiveLessons" for Pearson. He has presented regularly at national and international conferences on ruby, nodejs, NoSQL (especially MongoDB and neo4j), cloud computing, software craftsmanship, java, groovy, j...


-------------


via: https://www.oreilly.com/ideas/how-to-use-pull-requests-to-improve-your-code-reviews?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311

作者：[Brent Beer][a]，[Peter Bell][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/acf937de-cdf4-4b0e-85bd-b559404c580e
[b]:https://www.oreilly.com/people/2256f119-7ea0-440e-99e8-65281919e952
[1]:https://pixabay.com/en/measure-measures-rule-metro-106354/
[2]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[3]:https://www.oreilly.com/people/acf937de-cdf4-4b0e-85bd-b559404c580e
[4]:https://www.oreilly.com/people/2256f119-7ea0-440e-99e8-65281919e952
[5]:https://www.safaribooksonline.com/library/view/introducing-github/9781491949801/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=how-to-use-pull-requests-to-improve-your-code-reviews
[6]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[7]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[8]:https://www.oreilly.com/ideas/how-to-use-pull-requests-to-improve-your-code-reviews?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311
[9]:https://github.com/about
[10]:https://help.github.com/articles/about-pull-requests/
[11]:https://blog.skyliner.io/ship-small-diffs-741308bec0d1
[12]:https://github.com/integrations/sonarqube
[13]:https://github.com/integrations/code-climate
[14]:https://github.com/integrations/codecov
[15]:https://github.com/integrations/coveralls
[16]:https://help.github.com/articles/about-protected-branches/
[17]:https://www.safaribooksonline.com/library/view/introducing-github/9781491949801/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=how-to-use-pull-requests-to-improve-your-code-reviews-lower
