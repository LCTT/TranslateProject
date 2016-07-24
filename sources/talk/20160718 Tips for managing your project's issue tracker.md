Tips for managing your project's issue tracker
==============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_opennature_3.png?itok=30fRGfpv)

Issue-tracking systems are important for many open source projects, and there are many open source tools that provide this functionality but many projects opt to use GitHub's built-in issue tracker.

Its simple structure makes it easy for others to weigh in, but issues are really only as good as you make them.

Without a process, your repository can become unwieldy, overflowing with duplicate issues, vague feature requests, or confusing bug reports. Project maintainers can become burdened by the organizational load, and it can become difficult for new contributors to understand where priorities lie.

In this article, I'll discuss how to take your GitHub issues from good to great.

### The issue as user story

My team spoke with open source expert [Jono Bacon][1]—author of [The Art of Community][2], a strategy consultant, and former Director of Community at GitHub—who said that high-quality issues are at the core of helping a projects succeed. He says that while some see issues as merely a big list of problems you have to tend to, well-managed, triaged, and labeled issues can provide incredible insight into your code, your community, and where the problem spots are.

"At the point of submission of an issue, the user likely has little patience or interest in providing expansive detail. As such, you should make it as easy as possible to get the most useful information from them in the shortest time possible," Jono Bacon said.

A consistent structure can take a lot of burden off project maintainers, particularly for open source projects. We've found that encouraging a user story approach helps make clarity a constant. The common structure for a user story addresses the "who, what, and why" of a feature: As a [user type], I want to [task] so that [goal].

Here's what that looks like in practice:

>As a customer, I want to create an account so that I can make purchases.

We suggest sticking that user story in the issue's title. You can also set up [issue templates][3] to keep things consistent.

![](https://opensource.com/sites/default/files/resize/issuetemplate-new-520x293.png)
> Issue templates bring consistency to feature requests.

The point is to make the issue well-defined for everyone involved: it identifies the audience (or user), the action (or task), and the outcome (or goal) as simply as possible. There's no need to obsess over this structure, though; as long as the what and why of a story are easy to spot, you're good.

### Qualities of a good issue

Not all issues are created equal—as any OSS contributor or maintainer can attest. A well-formed issue meets these qualities outlined in [The Agile Samurai][4].

Ask yourself if it is...

- something of value to customers
- avoids jargon or mumbo jumbo; a non-expert should be able to understand it
- "slices the cake," which means it goes end-to-end to deliver something of value
- independent from other issues if possible; dependent issues reduce flexibility of scope
- negotiable, meaning there are usually several ways to get to the stated goal
- small and easily estimable in terms of time and resources required
- measurable; you can test for results

### What about everything else? Working with constraints

If an issue is difficult to measure or doesn't seem feasible to complete within a short time period, you can still work with it. Some people call these "constraints."

For example, "the product needs to be fast" doesn't fit the story template, but it is non-negotiable. But how fast is fast? Vague requirements don't meet the criteria of a "good issue", but if you further define these concepts—for example, "the product needs to be fast" can be "each page needs to load within 0.5 seconds"—you can work with it more easily. Constraints can be seen as internal metrics of success, or a landmark to shoot for. Your team should test for them periodically.

### What's inside your issue?

In agile, user stories typically include acceptance criteria or requirements. In GitHub, I suggest using markdown checklists to outline any tasks that make up an issue. Issues should get more detail as they move up in priority.

Say you're creating an issue around a new homepage for a website. The sub-tasks for that task might look something like this.

![](https://opensource.com/sites/default/files/resize/markdownchecklist-520x255.png)
>Use markdown checklists to split a complicated issue into several parts.

If necessary, link to other issues to further define a task. (GitHub makes this really easy.)

Defining features as granularly as possible makes it easier to track progress, test for success, and ultimately ship valuable code more frequently.

Once you've gathered some data points in the form of issues, you can use APIs to glean deeper insight into the health of your project.

"The GitHub API can be hugely helpful here in identifying patterns and trends in your issues," Bacon said. "With some creative data science, you can identify problem spots in your code, active members of your community, and other useful insights."

Some issue management tools provide APIs that add additional context, like time estimates or historical progress.

### Getting others on board

Once your team decides on an issue structure, how do you get others to buy in? Think of your repo's ReadMe.md file as your project's "how-to." It should clearly define what your project does (ideally using searchable language) and explain how others can contribute (by submitting requests, bug reports, suggestions, or by contributing code itself.)

![](https://opensource.com/sites/default/files/resize/readme-520x184.png)
>Edit your ReadMe file with clear instructions for new collaborators.

This is the perfect spot to share your GitHub issue guidelines. If you want feature requests to follow the user story format, share that here. If you use a tracking tool to organize your product backlog, share the badge so others can gain visibility.

"Issue templates, sensible labels, documentation for how to file issues, and ensuring your issues get triaged and responded to quickly are all important" for your open source project, Bacon said.

Remember: It's not about adding process for the process' sake. It's about setting up a structure that makes it easy for others to discover, understand, and feel confident contributing to your community.

"Focus your community growth efforts not just on growing the number of programmers, but also [on] people interested in helping issues be accurate, up to date, and a source of active conversation and productive problem solving," Bacon said.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/how-take-your-projects-github-issues-good-great

作者：[Matt Butler][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mattzenhub
[1]: http://www.jonobacon.org/
[2]: http://www.artofcommunityonline.org/
[3]: https://help.github.com/articles/creating-an-issue-template-for-your-repository/
[4]: https://www.amazon.ca/Agile-Samurai-Masters-Deliver-Software/dp/1934356581
