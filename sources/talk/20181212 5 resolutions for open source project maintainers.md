[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 resolutions for open source project maintainers)
[#]: via: (https://opensource.com/article/18/12/resolutions-open-source-project-maintainers)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

5 resolutions for open source project maintainers
======
No matter how you say it, good communication is essential to strong open source communities.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/spark_sparkler_fire_new_year_idea.png?itok=rnyMpVP8)

I'm generally not big on New Year's resolutions. I have no problem with self-improvement, of course, but I tend to anchor around other parts of the calendar. Even so, there's something about taking down this year's free calendar and replacing it with next year's that inspires some introspection.

In 2017, I resolved to not share articles on social media until I'd read them. I've kept to that pretty well, and I'd like to think it has made me a better citizen of the internet. For 2019, I'm thinking about resolutions to make me a better open source software maintainer.

Here are some resolutions I'll try to stick to on the projects where I'm a maintainer or co-maintainer.

### 1\. Include a code of conduct

Jono Bacon included "not enforcing the code of conduct" in his article "[7 mistakes you're probably making][1]." Of course, to enforce a code of conduct, you must first have a code of conduct. I plan on defaulting to the [Contributor Covenant][2], but you can use whatever you like. As with licenses, it's probably best to use one that's already written instead of writing your own. But the important thing is to find something that defines how you want your community to behave, whatever that looks like. Once it's written down and enforced, people can decide for themselves if it looks like the kind of community they want to be a part of.

### 2\. Make the license clear and specific

You know what really stinks? Unclear licenses. "This software is licensed under the GPL" with no further text doesn't tell me much. Which version of the [GPL][3]? Do I get to pick? For non-code portions of a project, "licensed under a Creative Commons license" is even worse. I love the [Creative Commons licenses][4], but there are several different licenses with significantly different rights and obligations. So, I will make it very clear which variant and version of a license applies to my projects. I will include the full text of the license in the repo and a concise note in the other files.

Sort of related to this is using an [OSI][5]-approved license. It's tempting to come up with a new license that says exactly what you want it to say, but good luck if you ever need to enforce it. Will it hold up? Will the people using your project understand it?

### 3\. Triage bug reports and questions quickly

Few things in technology scale as poorly as open source maintainers. Even on small projects, it can be hard to find the time to answer every question and fix every bug. But that doesn't mean I can't at least acknowledge the person. It doesn't have to be a multi-paragraph reply. Even just labeling the GitHub issue shows that I saw it. Maybe I'll get to it right away. Maybe I'll get to it a year later. But it's important for the community to see that, yes, there is still someone here.

### 4\. Don't push features or bug fixes without accompanying documentation

For as much as my open source contributions over the years have revolved around documentation, my projects don't reflect the importance I put on it. There aren't many commits I can push that don't require some form of documentation. New features should obviously be documented at (or before!) the time they're committed. But even bug fixes should get an entry in the release notes. If nothing else, a push is a good opportunity to also make a commit to improving the docs.

### 5\. Make it clear when I'm abandoning a project

I'm really bad at saying "no" to things. I told the editors I'd write one or two articles for [Opensource.com][6] and here I am almost 60 articles later. Oops. But at some point, the things that once held my interests no longer do. Maybe the project is unnecessary because its functionality got absorbed into a larger project. Maybe I'm just tired of it. But it's unfair to the community (and potentially dangerous, as the recent [event-stream malware injection][7] showed) to leave a project in limbo. Maintainers have the right to walk away whenever and for whatever reason, but it should be clear that they have.

Whether you're an open source maintainer or contributor, if you know other resolutions project maintainers should make, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/resolutions-open-source-project-maintainers

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/8/mistakes-open-source-avoid
[2]: https://www.contributor-covenant.org/
[3]: https://opensource.org/licenses/gpl-license
[4]: https://creativecommons.org/share-your-work/licensing-types-examples/
[5]: https://opensource.org/
[6]: http://Opensource.com
[7]: https://arstechnica.com/information-technology/2018/11/hacker-backdoors-widely-used-open-source-software-to-steal-bitcoin/
