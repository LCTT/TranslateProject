[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The case for making the transition from sysadmin to DevOps engineer)
[#]: via: (https://opensource.com/article/19/7/devops-vs-sysadmin)
[#]: author: (Taz Brown https://opensource.com/users/heronthecli)

The case for making the transition from sysadmin to DevOps engineer
======
There's a learning curve, but there's no time like the present to get
started.
![Different color butterflies][1]

The year is 2019, and [DevOps][2] is the hot topic. The day of the system administrator (sysadmin) has gone the way of mainframes if you will—but really, has it? The landscape has shifted as it so often does in technology. There is now this thing called DevOps, which can’t exist without Ops.

I considered myself on the Ops side of the aisle prior to the evolution of DevOps as we know today. As a system administrator or engineer, it feels like you are stuck in a time warp, with a small tinge of fear because what you knew and must learn varies greatly, and is now much more time-sensitive than you might have anticipated.

![Sysadmin/DevOps workstation][3]

Why is this situation a problem? Well, it is not so much a problem as it is a bit of a barrier, at first. Web-scale products are built on Linux and other open source software, and the market for skilled professionals to maintain them is drying up. The demand has surpassed the available pool of talent. As a system administrator, you can no longer continue to operate at your current skill level. You need automation skills to manage large server/node environments, as well as to understand how everything works so you know what’s going wrong, and when and how to heal said environments.

The path you must follow to get to DevOps is paved with many twists and turns as you learn the new technologies and tools needed to support the ever-changing environments the new DevOps way. So what is it like, or how can one transition from the system administrator mentality and world to the way of DevOps? Not surprisingly, this process begins with your thinking. It is not easy to change the way you have been doing things the last 10 or 20 years, but it’s mandatory.

To start, embrace the idea that DevOps is not a position, but a set of practices. These practices lead to cohesion, breaking down silos, mitigating mistakes and bugs, more frequent and timely software life cycles, better communication between Dev and Ops, and constant testing and retesting for not only the code but the whole [continuous integration and delivery (CI/CD)][4] process.

Along with changing your mindset comes acquiring the necessary skills in order to sustain and support your infrastructure, and ensure its reliability and availability to continuously integrate and deliver applications, services, and software.

One area that you, as an Ops person, may be lacking is programming or coding skills. The way that sysadmins script as part of automating server patching, managing user accounts and files, and troubleshooting and documenting problems, is considered somewhat antiquated. Though scripting is still used on a smaller scale today, DevOps is about large-scale implementation, testing, building, and deploying.

When you address automation, you have to address your probable weaknesses, which can be intimidating with the evolution of DevOps and [infrastructure automation][5] requiring that you be programmatic when you are not a developer.

What’s the solution? You have to learn at least one programming language—such as Python—in order to stay relevant and competitive. It can be hard as an Ops professional, though, to shake the feeling that programming is for developers, and while you don’t have to acquire expert programming knowledge, it’s advantageous to know how to script, whether it be in Python, Bash, or even [Powershell][6].

Learning some programming so you aren’t in the weeds when working with the developers on the DevOps team, or with a client as a consultant, will demand your time and attention. Whether it’s 30 minutes or an hour a day, learning this skill has to become a priority.

While there are common tasks among sysadmins and DevOps, there are some vital differences. Some have argued that a _sysadmin_ is more focused on configuring, maintaining, and keeping servers computer systems up and that while a _DevOps_-principled engineer can do everything a _sysadmin_ does, a _sysadmin_ cannot do everything a _DevOps_-principled engineer does.

Does this opinion hold water?

### System administration: One is the loneliest number

While this article discusses the differences and similarities between system administration and DevOps, my belief is that there are really no major differences between them. System administrators have always performed the functions that DevOps have; they just didn’t call it DevOps back then. I think it’s important not to differentiate things for the sake of differentiating when it’s not entirely called for at all. You have to remember that DevOps is not a job title or position as a system administrator is, but a descriptor.

I have to mention this because it would do DevOps and system administration a disservice not to point this out: System administration, in its traditional sense, involves possessing a certain set of skills and a focus on differing infrastructures. Not a one glove fits all proposition, but there are many common functional tasks carried out by sysadmins.

Some of the traditional sysadmin tasks include being a handyman or woman of sorts, with no specialization. You might be the only sysadmin in your organization, so you are a Jack or Jill of all trades. You do everything from maintaining the printers and copy machines to performing network-related tasks like configuring and managing routers and switches, as well as setting firewall policies and rules.

You are also responsible for upgrading hardware, checking and analyzing logs, security auditing, patching servers, troubleshooting, performing root cause analysis, and automating—usually through PowerShell scripting, Python, or Bash scripting. One example of [scripting][7] is with user and group account management. Creating users and setting permissions can be a tedious task since users come and go almost every day. Scripting means freeing up more time for larger scale infrastructure projects like switch and server refreshes, and other revenue-generating projects, though IT is often perceived to be a cost center.

The goal of a sysadmin is not to waste time, and to save money any and every way possible. There are also sysadmins that work as part of a larger team with, say, Linux admins, Windows admins, database admins, storage admins, and so on. You might be on a traditional follow-the-sun schedule, or maybe a traditional 9 to 5 schedule, or maybe you work in a 24-hour datacenter.

Sysadmins have had to evolve their state of mind over the years and think more strategically, considering the business in unison with their day-to-day responsibilities. The teams and departments they work with are challenged by lack of resources while trying to constantly stay aligned with the day-to-day business parameters.

### DevOps: Development and operations are one

[DevOps][8] is considered to be a philosophy in which IT, operations (Ops), and development is done. This way of looking at things is arguably the biggest game-changer to IT. Under the umbrella of DevOps are a team of software developers on one side of the aisle, and a team of operations folks on the other. Huddled in the same area are likely a product management team, a QA team, and a UX design team. These teams combine strengths to streamline and stabilize operations for rolling out new apps, and update the code to support and improve the whole business.

At the core of DevOps is the software lifecycle development process. As operations is responsible for supporting developers, developers are tasked with knowing more than just the APIs that execute on the systems and their operating systems. They must also understand what’s under the hood and running their software—the hardware and operating system(s)—so they can better handle bug issues, solve problems, and communicate with operations.

Sysadmins have the ability to transition to a DevOps team, as long as they are willing to learn current and emerging technologies, and are open to innovative ideas and solutions. These sysadmins don’t have to be full-blown programmers if they come from a traditional operations background, but learning a programming language like Ruby, Python, or Go will help to galvanize their place on the DevOps team. While sysadmins have traditionally been more alone in their day-to-day work and often thought of as loners, this is the complete opposite experience needed for an agile team applying DevOps principles.

The topic of automation has become more and more important. Both sysadmins and DevOps are interested in scaling quickly, reducing errors, and finding and resolving existing errors fast. So automation is a similarity among these two fields. Sysadmins are responsible for cloud services like AWS, Azure, and Google Cloud Platform. They have to understand CI/CD pipelines and how to carry them out by using [Jenkins][9], for instance.

Also, sysadmins need to use configuration and orchestration tools like [Ansible][10], which is used to deploy ten or twenty servers in parallel. The premise is [Infrastructure as Code][11]. Everything is software, and software is everything. Essentially, some rethinking is necessary if the sysadmin of the future is to remain relevant. SysAdmins come from the Ops side and have to be able to effectively work with developers and vice versa. Two heads are definitely better than one.

One last important piece of the puzzle is [Git][12]. Git has not traditionally been a part of a sysadmin's day-to-day responsibilities. This version control management system is used heavily by software engineering teams, DevOps, development teams, agile teams, and more. If you are working within the software lifecycle development process, you will work with it.

Git is vast. You might never learn every Git command, but you will come to understand that this tool is the nucleus of collaboration, communication, and software production. Having a fundamental knowledge of Git will be important if you are on a DevOps team.

If you are a sysadmin, you will need to level up your Git knowledge, understand the psychology of version control, and learn those common commands like **git status**, **git commit -m**, **git add**, **git pull**, **git push**, **git rebase**, **git branch**, **git diff**, and beyond. There are plenty of online training courses and books on the subject so that you can go from a novice to a pro with some dedicated focus. There are also [Git cheat sheets][13] out there as well so you don’t have to remember every command, but the more you use Git the better for you.

### Conclusion

Ultimately, it's up to you whether you want to remain a sysadmin or transition to DevOps. As you can see, there's a learning curve, but there's no time like the present to get started. Pick a programming language to learn, and while you're learning it, take advantage of the chance to [learn Git][14], a CI/CD tool like [Jenkins][15], and a Configuration and IT Automation tool like [Ansible][16]. Whatever you decide, make sure to always be learning and labbing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/devops-vs-sysadmin

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug-insect-butterfly-diversity-inclusion.png?itok=msS3ceW4 (Different color butterflies)
[2]: https://opensource.com/resources/devops
[3]: https://opensource.com/sites/default/files/uploads/sysadmindevopsworkstation_600px.png (Sysadmin/DevOps workstation)
[4]: https://en.wikipedia.org/wiki/CI/CD
[5]: https://www.ibm.com/developerworks/library/a-devops2/index.html
[6]: https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-6
[7]: https://www.geeksforgeeks.org/introduction-to-scripting-languages/
[8]: https://devops.com/
[9]: https://jenkins.io/
[10]: https://en.wikipedia.org/wiki/Ansible_(software)
[11]: https://en.wikipedia.org/wiki/Infrastructure_as_code
[12]: https://git-scm.com/
[13]: https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
[14]: https://opensource.com/life/16/7/stumbling-git
[15]: https://opensource.com/article/18/11/getting-started-jenkins-x
[16]: https://opensource.com/article/19/2/quickstart-guide-ansible
