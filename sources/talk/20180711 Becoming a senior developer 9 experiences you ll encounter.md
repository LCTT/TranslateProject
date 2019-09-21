Becoming a senior developer: 9 experiences you'll encounter
============================================================

![](https://www.hpe.com/content/dam/hpe/insights/articles/2018/07/becoming-a-senior-developer-9-experiences-youll-encounter/featuredStory/do-You-Want-To-Be-a-Master-Programmer.jpg.transform/nxt-1043x496-crop/image.jpeg)

Plenty of career guides suggest appropriate steps to take if you want a management track. But what if you want to stay technical—and simply become the best possible programmer? These non-obvious markers let you know you’re on the right path.

Many programming career guidelines stress the skills a software developer is expected to acquire. Such general advice suggests that someone who wants to focus on a technical track—as opposed to, say, [taking a management path to CIO][5]—should go after the skills needed to mentor junior developers, design future application features, build out release engineering systems, and set company standards.

That isn’t this article.

Being a developer—a good one—isn't just about writing code. To be successful, you do a lot of planning, you deal with catastrophes, and you prevent catastrophes. Not to mention you spend plenty of time [working with other humans][6] about what your code should do.

Following are a number of markers you’ll likely encounter as your career progresses and you become a more accomplished developer. You’ll have highs that boost you up and remind you how awesome you are. You'll also encounter lows that keep you humble and give you wisdom—at least in retrospect, if you respond to them appropriately.

These experiences may feel good, they may be uncomfortable, or they may be downright scary. They're all learning experiences—at least for those developers who sincerely want to move forward, in both skills and professional ambition. These experiences often change the way developers look at their job or how they approach the next problem. It's why an experienced developer's value to a company is more than just a list of technology buzzwords.

Here, in no particular order, is a sampling of what you'll run into on your way to becoming a senior developer—not in terms of a specific job title but being confident about creating quality code that serves users.

### You write your first big bug into production

Probably your initial step into the big leagues is the first bug you write into production. It's a sickening feeling. You know that the software you're working on is now broken in some significant way because of something you did, code you wrote, or a test you didn't run.

No matter how good a programmer you are, you'll make mistakes. You're a human, and that's part of what we do.

Most developers learn from the “bug that went live” experience. You promise never to make the same bug again. You analyze what happened, and you think about how the bug could have been prevented. For me, one effect of discovering I let a bug into production code is that it reinforced my belief that compiler warnings and static analysis tools are a programmer's best friend.

You repeat the process when it happens again. It  _will_  happen again, but as your programming skill improves, it happens less frequently.

### You delete production data for the first time

It might be a `DROP TABLE` in production or [a mistaken `rm -rf`][7]. Maybe you clicked on the wrong volume to format. You get an uneasy feeling that "this is taking longer to run than I would expect. It's not running on... oh, no!" followed by a mad scramble to fix it.

Data loss has long-term effects on a growing-wiser developer much like the production bug. Afterward, you re-examine how you work. It teaches you to take more safeguards than you did previously. Maybe you decide to create a more rigorous rotation schedule for backups, or even start having a backup schedule at all.

As with the bug in production, you learn that you can survive making a mistake, and it's not the end of the world.

### You automate away part of your job

There's an old saying that you can't get promoted if you can't be replaced. Anything that ties you to a specific job or task is an anchor on your ability to move up in the company or be assigned newer and more interesting tasks.

When good programmers find themselves doing drudgework as part of their job, they find a way to let a machine do it. If they are stuck [scanning server logs][8] every Monday looking for problems, they'll install a tool like Logwatch to summarize the results. When there are many servers to be monitored, a good programmer will turn to a more capable tool that analyzes logs on multiple servers.

Unsure how to get started with containers? Yes, we have a guide for that. Get Containers for Dummies.

[Download now][4]

In each case, wise programmers provide more value to their company, because an automated system is much cheaper than a senior programmer’s salary. They also grow personally by eliminating drudgery, leaving them more time to work on more challenging tasks.

### You use existing code instead of writing your own

A senior programmer knows that code that doesn't get written doesn't have bugs, and that many problems, both common and uncommon, have already been solved—in many cases, multiple times.

Senior programmers know that the chances are very low that they can write, test, and debug their own code for a task faster or cheaper than existing code that does what they want. It doesn't have to be perfect to make it worth their while.

It might take a little bit of turning down your ego to make it happen, but that's an excellent skill for senior programmers to have, too.

### You are publicly recognized for achievements

Many people aren't comfortable with public recognition. It's embarrassing. We have these amazing skills, and we like the feeling of helping others, but we can be embarrassed when it's called out.

Praise comes in many forms and many sizes. Maybe it's winning an "employee of the quarter" award for a project you drove and being presented a plaque onstage. It could be as low-key as your team leader saying, "Thanks to Cheryl for implementing that new microservice."

Whatever it is, accept it graciously and appreciatively, even if you're embarrassed by the attention. Don't diminish the praise you receive with, "Oh, it was nothing" or anything similar. Accept credit for the things that users and co-workers appreciate. Thank the speaker and say you were glad you could be of service.

First, this is the polite thing to do. When people praise you, they want it to be acknowledged. In addition, that warm recognition helps you in the future. Remembering it gets you through those crappy days, such as when you uncover bugs in your code.

### You turn down a user request

As much as we love being superheroes who can do amazing things with computers, sometimes turning down a request is best for the organization. Part of being a senior programmer is knowing when not to write code. A senior programmer knows that every bit of code in a codebase is a chance for things to go wrong and a potential future cost for maintenance.

You might be uncomfortable the first time you tell a user that you won’t be incorporating his maybe-even-useful suggestion. But this is a notable occasion. It means you understand the application and its role in a larger context. It also means you “own” the software, in a positive, confident way.

The organization need not be an employer, either. Open source project managers deal with this all the time, when they have to tell a user, "Sorry, it doesn't fit with where the project is going.”

### You know when to fight for what's right and when it really doesn't matter

Rookie programmers are full of knowledge straight from school, having learned all the right ways to do things. They're eager to apply their knowledge and make amazing things happen for their employers. However, they're often surprised to find that out in the business world, things sometimes don't get done the "right" way.

There's an old military saying: No plan survives contact with the enemy. It's the same with new programmers and project plans. Sometimes in the heat of the battle of business, the purist computer science techniques learned in school fall by the wayside.

Maybe the database schema gets slapped together in a way that isn't perfect [fifth normal form][9]. Sometimes code gets cut and pasted rather than refactored out into a new function or library. Plenty of production systems run on shell scripts and prayers. The wise programmer knows when to push for the right way to do things and when to take the cheap way out.

The first time you do it, it feels like you're selling out your principles. It’s not. The balance between academic purism and the realities of getting work done can be a delicate one, and that knowledge of when to do things less than perfectly is part of the wisdom you’ll acquire.

### You are asked what to do

After a while, you'll have earned a reputation in your organization for getting things done. It won’t be just for having expertise in a certain area—it’ll be wisdom. Someone will come to you and ask for guidance with a project or a problem.

That person isn't just asking you for help with a problem. You are being asked to lead.

A common situation is when you are asked to help a team of less-experienced developers that's navigating difficult new terrain or needs shepherding on a project. That's when you'll be called on to help not just do things but show people how to improve their own skills.

It might also be leadership from a technical point of view. Your boss might say, "We need a new indexing solution. Find out what you can about FooIndex and BarSearch, and let me know what you propose." That's the sort of responsibility given only to someone who has demonstrated wisdom and experience.

### You are seriously headhunted for the first time

Recruiting professionals are always looking for talent. Most recruiters seem to do random emailing and LinkedIn harvesting. But every so often, they find out about talented performers and hunt them down.

When that happens, it's a feather in your cap. Maybe a former colleague spoke to a recruiter friend trying to place a developer at a company that needs the skills you have. If you get a personal recommendation for a position—even if you don’t want the job—it means you've really arrived. You're recognized as an expert, or someone who brings value to an organization, enough to recommend you to others.

### Onward

I hope that my little list helps prompt some thought about [where you are in your career][10] or [where you might be headed][11]. Markers and milestones can help you understand what’s around you and what to expect.

This list is far from complete, of course. Everyone has their own story. In fact, one of the ways to know you’ve hit a milestone is when you find yourself telling a story about it to others. When you do find yourself looking back at a tough situation, make sure to reflect on what it means to you and why. Experience is a great teacher—if you listen to it.

What are your markers? How did you know you had finally become a senior programmer? Tweet at [@enterprisenxt][12] and let me know.

This article/content was written by the individual writer identified and does not necessarily reflect the view of Hewlett Packard Enterprise Company.

 [![](https://www.hpe.com/content/dam/hpe/insights/contributors/andy-lester/AndyLester_headshot-400x400.jpg.transform/nxt-116x116/image.jpeg)][13] 

### 作者简介

Andy Lester has been a programmer and developer since the 1980s, when COBOL walked the earth. He is the author of the job-hunting guide [Land the Tech Job You Love][2] (2009, Pragmatic Bookshelf). Andy has been an active contributor to the open source community for decades, most notably as the creator of the grep-like code search tool [ack][3].

--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/becoming-a-senior-developer-9-experiences-youll-encounter-1807.html

作者：[Andy Lester ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/andy-lester.html
[1]:https://www.hpe.com/us/en/insights/contributors/andy-lester.html
[2]:https://pragprog.com/book/algh/land-the-tech-job-you-love
[3]:https://beyondgrep.com/
[4]:https://www.hpe.com/us/en/resources/storage/containers-for-dummies.html?jumpid=in_510384402_seniordev0718
[5]:https://www.hpe.com/us/en/insights/articles/7-career-milestones-youll-meet-on-the-cio-and-it-management-track-1805.html
[6]:https://www.hpe.com/us/en/insights/articles/how-to-succeed-in-it-without-social-skills-1705.html
[7]:https://www.hpe.com/us/en/insights/articles/the-linux-commands-you-should-never-use-1712.html
[8]:https://www.hpe.com/us/en/insights/articles/back-to-basics-what-sysadmins-must-know-about-logging-and-monitoring-1805.html
[9]:http://www.bkent.net/Doc/simple5.htm
[10]:https://www.hpe.com/us/en/insights/articles/career-interventions-when-your-it-career-needs-a-swift-kick-1806.html
[11]:https://www.hpe.com/us/en/insights/articles/how-to-avoid-an-it-career-dead-end-1806.html
[12]:https://twitter.com/enterprisenxt
[13]:https://www.hpe.com/us/en/insights/contributors/andy-lester.html
