The difference between development and deployment
============================================================
 ![The difference between development and deployment](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUS_OpenSourceExperience_520x292_cm.png?itok=APna2N9Y "The difference between development and deployment") 
Image by : 

opensource.com

For many years, I was a Smalltalk programmer, and that experience gives me a different viewpoint from which to observe ideas in the programming world. For example, the idea that source code should be stored in text files took some getting used to.

We as programmers often make a distinction between "development" and "deployment," specifically the idea that we develop software in one place using tools that are different from the place and tools that we use after we deploy the software. In the Smalltalk world, there is no such difference.

Smalltalk was built on the idea of a virtual machine that contained your development environment (IDE, debugger, text editor, version control, and more), and you if you had to modify any code, you would modify the in-memory running copy. If you wanted to snapshot your running machine you could do so, and if you wanted to distribute your code, you would send a copy of your running machine image (including the IDE, debugger, text editor, version control, and more) to the user. That's how software development worked (for some of us) in the '90s.

Today, the deployment environment is vastly different from the development environment. For starters, you have no expectation that any of your development tools are there. Once deployed, there is no version control, no debugging, no development environment. There is logging and monitoring, which we didn't have in our development environment, and there is a "build pipeline," which transforms our software from the form in which we develop into the form which we deploy. For example, Docker containers are an attempt to recapture some of the simplicity of the 1990's Smalltalk programmer's deployment experience without aspiring to do the same for the development experience.

I suppose that if the Smalltalk world had been my only programming metaphor experience that failed to differentiate between development and deployment environments, I might have looked back on it as a fluke. But before I was a Smalltalk programmer I was an APL programmer, and that was also a world of hackable virtual machine images in which development and deployment were indistinguishable. Therefore, I'm rather convinced that the current world in which people edit separate source code files and then run build pipelines to create deployment artifacts that didn't exist while editing code, and then deploy those artifacts to users, is the fluke. We have somehow institutionalized this software development anti-pattern, and the demands of the evolving software landscape are pressuring us to find a way back to the more effective techniques of the 1990's. Hence the success of Docker. Hence the need for what I am about to propose.

I have two suggestions: that we implement (and use) version control in runtime systems, and that we develop software by making changes to running systems, instead of replacing them with a new running system. These two ideas are related. In order to make changes safely to a running system, we need some versioning capability to support an "undo" capability. Perhaps it would be fair to say that I make only one suggestion. Let me illustrate by way of example.

Let's start by imagining a static website. You want to change some HTML files. How should that work? If you're like most developers, you'll have two, maybe three, sites—one for development, one for QA (or staging), and one for production. You'll directly edit the files in the development instance. When you're ready, you'll "deploy" your changes to the staging instance. After user acceptance testing, you'll deploy again, this time to production.

Using Occam's Razor, let's avoid creating entities needlessly. How many machines do we need? We could use a single computer. How many web servers do we need? We could use a single web server with multiple virtual hosts. Instead of multiple virtual hosts, could we use a single virtual host? Then we would need multiple directories and need to use the top-level path of the URL to differentiate the different versions instead of the virtual host name. But why do we need multiple directories? Because the web server will serve static assets from the file system. The problem we have is that there are three different versions of a directory, and our solution is to make three different copies of the directory. Is this not the very problem that version control systems like Subversion and Git are meant to solve? The strategy of making multiple copies of a directory to store multiple versions hearkens back to the days before CVS. Why not use, say, a bare Git repository to store the files? Because in order to do so, the web server would need to be able to read files from a git repository (see [mod_git][3]).

And that would be a run time system supporting versioning.

With such a web server, the version being served would be identified by, for example, a cookie identifying it. In this way, anybody could push to the one repository, and users would continue to see the version that they were assigned when they initiated their session. Version control systems have immutable commits; once a session begins, developers could cheerfully push changes whenever they felt like it without affecting running users. Developers could reset their sessions to track their new commits, so a developer or tester could be looking at a version in development or under test at the same URL and from the same server as the regular users. As a fortuitous side effect, A/B tests are simply a case of assigning different users to different commits. All of the git facilities for managing multiple versions are brought to bear in running environments. And, of course, a git reset offers us that "undo" capability we mentioned earlier.

Why doesn't everyone do this?

One possibility is that tools like version control systems were not designed to be used in production environments. For example, giving someone permission to push to the testing branch but not the production branch is not possible. The most common objection to this scheme is that if a vulnerability were discovered, you would want to mark certain commits as inaccessible. This would be another case of finer grained permissions; developers would have read access to all commits, but external users would not. We might need some additional engineering for existing tools to support this paradigm, but the features are easily understood and have been engineered into other software artifacts. For example, Linux (or PostgreSQL) implements the idea of fine grained permissions for different users.

As cloud environments become more common, these ideas become more relevant: the cloud is always running. We can see, for example, that the AWS equivalent of a "file system" (S3) implements versioning, so you might have a variation of this idea that involves a web server serving assets from S3, and using session information to select different versions of those assets. The important idea is not which implementation is the best, but the aspiration to support runtime versioning.

The principle that deployed software environments should be "version aware" extends to other tools besides web servers serving static assets. In future articles, I will reflect upon approaches for versioning libraries, databases, and application servers.

_Learn more in Robert Lefkowitz's talk at linux.conf.au 2017 ([#lca2017][1]) in Hobart: [Keeping Linux Great][2]._

--------------------------------------------------------------------------------

作者简介： 

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/robert_lefkowitz.jpg?itok=CFoX-OUI)

Robert M. Lefkowitz - Robert (a/k/a r0ml) is a programming language enthusiast who enjoys obscure programming languages. He is a collector of programming techniques for improving clarity, increasing reliability, and maximizing brevity. He has a lifelong interest in democratizing computing by making it more accessible. He is a frequent speaker on the effects of the late Middle Ages and early Renaissance on the art of programming.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/difference-between-development-deployment

作者：[Robert M. Lefkowitz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/r0ml
[1]:https://twitter.com/search?q=%23lca2017&src=typd
[2]:https://www.linux.conf.au/schedule/presentation/107/
[3]:https://github.com/r0ml/mod_git
