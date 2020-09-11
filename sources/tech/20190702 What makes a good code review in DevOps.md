[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What makes a good code review in DevOps?)
[#]: via: (https://opensource.com/article/19/7/code-reviews-devops)
[#]: author: (Patrick Housley https://opensource.com/users/patrickhousley/users/juliegund/users/ghaff)

What makes a good code review in DevOps?
======
Well-run code reviews balance the freedom to innovate rapidly with code
quality and security.
![Pair programming][1]

Improving the software development lifecycle, the speed we deliver software to customers, and the quality of that software are all great premises of [DevOps][2]. They are goals that the tools and techniques prescribed by the DevOps movement attempt to achieve. As a developer, I feel freer to make changes rapidly, not just to source code, but also to infrastructure and configuration code. As a DevOps practitioner, my goal is to balance that freedom with quality and security. How? One tool we can use is code reviews.

Code reviews are not a new concept. They are often used as a manual gate-check for code changes before merging them to the trunk branch. This helps ensure quality and security by preventing developers from working in vacuums. It can also help ensure the entire team is aware of what's going on in their project. Much like anything in technology, there are many different ways to implement code reviews, and there can be some confusion around how to operate code reviews and what the goals of a code review are. Let's start by looking at who on the team should be doing the reviewing in code reviews.

### Who should be reviewing code?

It is easy to assume that the more senior developers on the team should be the ones reviewing code before it makes it to the trunk branch. That is only partly true. Everyone on the team should feel empowered and obligated to take time out of their day to review the code going into the repositories they work in most often. Why? It's all about perspective, and the more people we have engaging in code review, the more perspectives we can take advantage of.

A developer's perspective when reviewing code is derived from a culmination of their years of experience as well as their _unique_ experiences. Unique experiences help diversify the team and can be a source of new, innovative solutions. Having more years of experience does not necessarily equate to having a diverse set of unique experiences. How does this fit into the junior-senior developer dynamic as applied to code reviews? Before we get too deep into the title war, let's first define what we mean by "code review."

### Code review is a conversation

Take a moment and think about what a code review means to you. Is it a manual gate to ensure the quality of the code making it to your trunk branch? Is it a chance to have the more senior developers, or maybe the developers more familiar with the area of the code base, review the code? These would all be good answers, but there is a better one.

_Code reviews are a chance for you, the committer, and your peers to have a conversation about the changes being made before they are merged to the trunk branch._

Our goal should be simply to talk about the changes being made. It sounds simple, but, like any digital conversation, we simple humans always try to imply tone to the words we read. I have seen junior developers take seemingly innocuous questioning in a code review as a call to action. Instead of engaging in conversation, they immediately change the code. I think we all can say we have seen more senior developers use poor wording that implies improper tone in their code reviews and conversations around code changes. Many open source communities are trying to address this through Code of Conduct declarations. I have been privy to a solution for this issue that I still use today and recommend to all developers of every level: comment tagging.

#### Comment tagging

My previous example of a junior developer taking a question as a call to action doesn't come from thin air. I noticed this behavior some years ago when I would make comments or ask questions on pull requests as part of a code review. It really upset me at the time, because I was trying to have an honest conversation, not trying to imply the developer did anything wrong or needed to change the code. Luckily, I had great leadership that was able to help find the problem and come up with a solution. That solution was to start tagging our comments in the pull requests using the tags: _comment_, _question_, _blocker_, and _recommended_. It would look something like:

> [comment] I think you meant to use the forEach prototype method here instead of map.
>  [blocker] This constructor is too large and should be broken up into individual, specialized methods.
>  [question] Is this method needed in this class with the merging of feature X? Feature x makes this a global utility method.
>  [recommended] You could add a test case here to check for negative outcomes. This would help ensure future code changes do not break our expectations.

It may seem simple, maybe even extreme, but it really helped spark conversations in our code reviews. Junior developers felt more empowered to have and stick to their opinions in the face of questioning from more senior developers. More importantly, they also felt empowered to question and comment in code reviews for changes made by more senior developers.

### Leave your title at the door

Through our discussion of who should be doing the reviewing in code reviews and what a code review is, one thing should be clear: the junior and senior titles mean very little. In fact, they can detract from the overall goal of code reviews, as was the case in the experience I described above. The concept is very simple: _No matter how senior you are, you can still make mistakes, and no matter how junior you are, you can still provide valuable and innovative solutions._

We will leave the comparison of what makes a junior and senior developer for another article. For now, let's get back to our code review conversation. We have covered the what and why of code reviews, but just as important is the when. When should you be doing code review? How often?

### Code-review continuously

I have seen code reviews performed in many ways over the past few years. Not long ago, I was on a team that did weekly, one-hour meetings for code review. Today, my team operates code reviews on an ongoing basis as part of our pull request process. In case you are not familiar with them, pull requests are a process commonly found in [Git][3] tooling like GitHub and GitLab where a developer makes a formal request to have the changes in their branch merged into another branch.

How you and your team operate may be different, and you should always strive to find what works best for your team and project. My team and those around me use code reviews for two purposes: to formalize the code review process and to block merges to trunk based on automated code-quality checks. While we are having our conversation about the code changes in the pull request, our continuous integration pipeline is operating in the background to perform a sanity build of the project, run tests, linting, and static code analysis. The results are provided back to the pull request and help influence our code review.

How often do we have these code reviews and pull requests? As often as possible. Complying with lean development practices indicates we make small commits and merges often. If that's the case, multiple pull requests happen daily, and many conversations happen continuously. This can become a little overwhelming but, if the changes being made are small, theoretically the conversations are also small, short, and sweet.

### Put it all together

Team dynamics will always play a substantial role in how practices like code reviews are performed. I typically like to start my day off by seeing what pull requests are open and what discussions are happening. It provides a nice, gradual start to my day, and I can catch up on what people are working on. I will typically go back throughout the day, as I take breaks from what I am working on, to check for more pull requests. This works great for me and might work well for you, so I encourage you to give it a try.

No matter how you decide to conduct your code reviews, I typically discourage the one hour a week meeting. First, it can work counter to the lean development practice of committing small and often. Developers may wait to do any merging or open pull requests until code review. By that time, the code is not fresh in their mind, and things in the project may have changed that affect the changes they are making. Second, if your team is more than two developers, an hour meeting will probably not be long enough to adequately review all the changes from all the team members that need to go in. This could lead to changes being merged without code review, and that could be detrimental to code quality and security.

Instead of using that one hour to dig through code changes, I find it better to talk higher-level. It's always good for a team to come together and discuss how they are architecting their code, how their features may affect or tie into each other, and what blockers they might be having. All in all, communication is key, and continuous code review should work to drive more communication.

Is DevOps fundamentally about changing culture in an IT organization? That seemingly simple...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/code-reviews-devops

作者：[Patrick Housley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patrickhousley/users/juliegund/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://opensource.com/resources/devops
[3]: https://opensource.com/resources/what-is-git
