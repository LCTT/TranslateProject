XLCYun 翻译中
How to get into DevOps
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_resume_rh1x.png?itok=S3HGxi6E)

I've observed a sharp uptick of developers and systems administrators interested in "getting into DevOps" within the past year or so. This pattern makes sense: In an age in which a single developer can spin up a globally distributed infrastructure for an application with a few dollars and a few API calls, the gap between development and systems administration is closer than ever. Although I've seen plenty of blog posts and articles about cool DevOps tools and thoughts to think about, I've seen fewer content on pointers and suggestions for people looking to get into this work.

My goal with this article is to draw what that path looks like. My thoughts are based upon several interviews, chats, late-night discussions on [reddit.com/r/devops][1], and random conversations, likely over beer and delicious food. I'm also interested in hearing feedback from those who have made the jump; if you have, please reach out through [my blog][2], [Twitter][3], or in the comments below. I'd love to hear your thoughts and stories.

### Olde world IT

Understanding history is key to understanding the future, and DevOps is no exception. To understand the pervasiveness and popularity of the DevOps movement, understanding what IT was like in the late '90s and most of the '00s is helpful. This was my experience.

I started my career in late 2006 as a Windows systems administrator in a large, multi-national financial services firm. In those days, adding new compute involved calling Dell (or, in our case, CDW) and placing a multi-hundred-thousand-dollar order of servers, networking equipment, cables, and software, all destined for your on- and offsite datacenters. Although VMware was still convincing companies that using virtual machines was, indeed, a cost-effective way of hosting its "performance-sensitive" application, many companies, including mine, pledged allegiance to running applications on their physical hardware.

Our technology department had an entire group dedicated to datacenter engineering and operations, and its job was to negotiate our leasing rates down to some slightly less absurd monthly rate and ensure that our systems were being cooled properly (an exponentially difficult problem if you have enough equipment). If the group was lucky/wealthy enough, the offshore datacenter crew knew enough about all of our server models to not accidentally pull the wrong thing during after-hours trading. Amazon Web Services and Rackspace were slowly beginning to pick up steam, but were far from critical mass.

In those days, we also had teams dedicated to ensuring that the operating systems and software running on top of that hardware worked when they were supposed to. The engineers were responsible for designing reliable architectures for patching, monitoring, and alerting these systems as well as defining what the "gold image" looked like. Most of this work was done with a lot of manual experimentation, and the extent of most tests was writing a runbook describing what you did, and ensuring that what you did actually did what you expected it to do after following said runbook. This was important in a large organization like ours, since most of the level 1 and 2 support was offshore, and the extent of their training ended with those runbooks.

(This is the world that your author lived in for the first three years of his career. My dream back then was to be the one who made the gold standard!)

Software releases were another beast altogether. Admittedly, I didn't gain a lot of experience working on this side of the fence. However, from stories that I've gathered (and recent experience), much of the daily grind for software development during this time went something like this:

  * Developers wrote code as specified by the technical and functional requirements laid out by business analysts from meetings they weren't invited to.
  * Optionally, developers wrote unit tests for their code to ensure that it didn't do anything obviously crazy, like try to divide over zero without throwing an exception.
  * When done, developers would mark their code as "Ready for QA." A quality assurance person would pick up the code and run it in their own environment, which might or might not be like production or even the environment the developer used to test their own code against.
  * Failures would get sent back to the developers within "a few days or weeks" depending on other business activities and where priorities fell.



Although sysadmins and developers didn't often see eye to eye, the one thing they shared a common hatred for was "change management." This was a composition of highly regulated (and in the case of my employer at the time), highly necessary rules and procedures governing when and how technical changes happened in a company. Most companies followed [ITIL][4] practices, which, in a nutshell, asked a lot of questions around why, when, where, and how things happened and provided a process for establishing an audit trail of the decisions that led up to those answers.

As you could probably gather from my short history lesson, many, many things were done manually in IT. This led to a lot of mistakes. Lots of mistakes led up to lots of lost revenue. Change management's job was to minimize those lost revenues; this usually came in the form of releases only every two weeks and changes to servers, regardless of their impact or size, queued up to occur between Friday at 4 p.m. and Monday at 5:59 a.m. (Ironically, this batching of work led to even more mistakes, usually more serious ones.)

### DevOps isn't a Tiger Team

You might be thinking "What is Carlos going on about, and when is he going to talk about Ansible playbooks?" I love Ansible tons, but hang on; this is important.

Have you ever been assigned to a project where you had to interact with the "DevOps" team? Or did you have to rely on a "configuration management" or "CI/CD" team to ensure your pipeline was set up properly? Have you had to attend meetings about your release and what it pertains to--weeks after the work was marked "code complete"?

If so, then you're reliving history. All of that comes from all of the above.

[Silos form][5] out of an instinctual draw to working with people like ourselves. Naturally, it's no surprise that this human trait also manifests in the workplace. I even saw this play out at a 250-person startup where I used to work. When I started, developers all worked in common pods and collaborated heavily with each other. As the codebase grew in complexity, developers who worked on common features naturally aligned with each other to try and tackle the complexity within their own feature. Soon afterwards, feature teams were officially formed.

Sysadmins and developers at many of the companies I worked at not only formed natural silos like this, but also fiercely competed with each other. Developers were mad at sysadmins when their environments were broken. Developers were mad at sysadmins when their environments were too locked down. Sysadmins were mad that developers were breaking their environments in arbitrary ways all of the time. Sysadmins were mad at developers for asking for way more computing power than they needed. Neither side understood each other, and worse yet, neither side wanted to.

Most developers were uninterested in the basics of operating systems, kernels, or, in some cases, computer hardware. As well, most sysadmins, even Linux sysadmins, took a 10-foot pole approach to learning how to code. They tried a bit of C in college, hated it and never wanted to touch an IDE again. Consequently, developers threw their environment problems over the wall to sysadmins, sysadmins prioritized them with the hundreds of other things that were thrown over the wall to them, and everyone busy-waited angrily while hating each other. The purpose of DevOps was to put an end to this.

DevOps isn't a team. CI/CD isn't a group in Jira. DevOps is a way of thinking. According to the movement, in an ideal world, developers, sysadmins, and business stakeholders would be working as one team. While they might not know everything about each other's worlds, not only do they all know enough to understand each other and their backlogs, but they can, for the most part, speak the same language.

This is the basis behind having all infrastructure and business logic be in code and subject to the same deployment pipelines as the software that sits on top of it. Everybody is winning because everyone understands each other. This is also the basis behind the rise of other tools like chatbots and easily accessible monitoring and graphing.

[Adam Jacob said][6] it best: "DevOps is the word we will use to describe the operational side of the transition to enterprises being software led."

### What do I need to know to get into DevOps?

I'm commonly asked this question, and the answer, like most open-ended questions like this, is: It depends.

At the moment, the "DevOps engineer" varies from company to company. Smaller companies that have plenty of software developers but fewer folks that understand infrastructure will likely look for people with more experience administrating systems. Other, usually larger and/or older companies that have a solid sysadmin organization will likely optimize for something closer to a [Google site reliability engineer][7], i.e. "a software engineer to design an operations function." This isn't written in stone, however, as, like any technology job, the decision largely depends on the hiring manager sponsoring it.

That said, we typically look for engineers who are interested in learning more about:

  * How to administrate and architect secure and scalable cloud platforms (usually on AWS, but Azure, Google Cloud Platform, and PaaS providers like DigitalOcean and Heroku are popular too);
  * How to build and optimize deployment pipelines and deployment strategies on popular [CI/CD][8] tools like Jenkins, Go continuous delivery, and cloud-based ones like Travis CI or CircleCI;
  * How to monitor, log, and alert on changes in your system with timeseries-based tools like Kibana, Grafana, Splunk, Loggly, or Logstash; and
  * How to maintain infrastructure as code with configuration management tools like Chef, Puppet, or Ansible, as well as deploy said infrastructure with tools like Terraform or CloudFormation.



Containers are becoming increasingly popular as well. Despite the [beef against the status quo][9] surrounding Docker at scale, containers are quickly becoming a great way of achieving an extremely high density of services and applications running on fewer systems while increasing their reliability. (Orchestration tools like Kubernetes or Mesos can spin up new containers in seconds if the host they're being served by fails.) Given this, having knowledge of Docker or rkt and an orchestration platform will go a long way.

If you're a systems administrator that's looking to get into DevOps, you will also need to know how to write code. Python and Ruby are popular languages for this purpose, as they are portable (i.e., can be used on any operating system), fast, and easy to read and learn. They also form the underpinnings of the industry's most popular configuration management tools (Python for Ansible, Ruby for Chef and Puppet) and cloud API clients (Python and Ruby are commonly used for AWS, Azure, and Google Cloud Platform clients).

If you're a developer looking to make this change, I highly recommend learning more about Unix, Windows, and networking fundamentals. Even though the cloud abstracts away many of the complications of administrating a system, debugging slow application performance is aided greatly by knowing how these things work. I've included a few books on this topic in the next section.

If this sounds overwhelming, you aren't alone. Fortunately, there are plenty of small projects to dip your feet into. One such toy project is Gary Stafford's Voter Service, a simple Java-based voting platform. We ask our candidates to take the service from GitHub to production infrastructure through a pipeline. One can combine that with Rob Mile's awesome DevOps Tutorial repository to learn about ways of doing this.

Another great way of becoming familiar with these tools is taking popular services and setting up an infrastructure for them using nothing but AWS and configuration management. Set it up manually first to get a good idea of what to do, then replicate what you just did using nothing but CloudFormation (or Terraform) and Ansible. Surprisingly, this is a large part of the work that we infrastructure devs do for our clients on a daily basis. Our clients find this work to be highly valuable!

### Books to read

If you're looking for other resources on DevOps, here are some theory and technical books that are worth a read.

#### Theory books

  * [The Phoenix Project][10] by Gene Kim. This is a great book that covers much of the history I explained earlier (with much more color) and describes the journey to a lean company running on agile and DevOps.
  * [Driving Technical Change][11] by Terrance Ryan. Awesome little book on common personalities within most technology organizations and how to deal with them. This helped me out more than I expected.
  * [Peopleware][12] by Tom DeMarco and Tim Lister. A classic on managing engineering organizations. A bit dated, but still relevant.
  * [Time Management for System Administrators][13] by Tom Limoncelli. While this is heavily geared towards sysadmins, it provides great insight into the life of a systems administrator at most large organizations. If you want to learn more about the war between sysadmins and developers, this book might explain more.
  * [The Lean Startup][14] by Eric Ries. Describes how Eric's 3D avatar company, IMVU, discovered how to work lean, fail fast, and find profit faster.
  * [Lean Enterprise][15] by Jez Humble and friends. This book is an adaption of The Lean Startup for the enterprise. Both are great reads and do a good job of explaining the business motivation behind DevOps.
  * [Infrastructure As Code][16] by Kief Morris. Awesome primer on, well, infrastructure as code! It does a great job of describing why it's essential for any business to adopt this for their infrastructure.
  * [Site Reliability Engineering][17] by Betsy Beyer, Chris Jones, Jennifer Petoff, and Niall Richard Murphy. A book explaining how Google does SRE, or also known as "DevOps before DevOps was a thing." Provides interesting opinions on how to handle uptime, latency, and keeping engineers happy.



#### Technical books

If you're looking for books that'll take you straight to code, you've come to the right section.

  * [TCP/IP Illustrated][18] by the late W. Richard Stevens. This is the classic (and, arguably, complete) tome on the fundamental networking protocols, with special emphasis on TCP/IP. If you've heard of Layers 1, 2, 3, and 4 and are interested in learning more, you'll need this book.
  * [UNIX and Linux System Administration Handbook][19] by Evi Nemeth, Trent Hein, and Ben Whaley. A great primer into how Linux and Unix work and how to navigate around them.
  * [Learn Windows Powershell In A Month of Lunches][20] by Don Jones and Jeffrey Hicks. If you're doing anything automated with Windows, you will need to learn how to use Powershell. This is the book that will help you do that. Don Jones is a well-known MVP in this space.
  * Practically anything by [James Turnbull][21]. He puts out great technical primers on popular DevOps-related tools.



From companies deploying everything to bare metal (there are plenty that still do, for good reasons) to trailblazers doing everything serverless, DevOps is likely here to stay for a while. The work is interesting, the results are impactful, and, most important, it helps bridge the gap between technology and business. It's a wonderful thing to see.

Originally published at [Neurons Firing on a Keyboard][22], CC-BY-SA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/getting-devops

作者：[Carlos Nunez][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/carlosonunez
[1]:https://www.reddit.com/r/devops/
[2]:https://carlosonunez.wordpress.com/
[3]:https://twitter.com/easiestnameever
[4]:https://en.wikipedia.org/wiki/ITIL
[5]:https://www.psychologytoday.com/blog/time-out/201401/getting-out-your-silo
[6]:https://twitter.com/adamhjk/status/572832185461428224
[7]:https://landing.google.com/sre/interview/ben-treynor.html
[8]:https://en.wikipedia.org/wiki/CI/CD
[9]:https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/
[10]:https://itrevolution.com/book/the-phoenix-project/
[11]:https://pragprog.com/book/trevan/driving-technical-change
[12]:https://en.wikipedia.org/wiki/Peopleware:_Productive_Projects_and_Teams
[13]:http://shop.oreilly.com/product/9780596007836.do
[14]:http://theleanstartup.com/
[15]:https://info.thoughtworks.com/lean-enterprise-book.html
[16]:http://infrastructure-as-code.com/book/
[17]:https://landing.google.com/sre/book.html
[18]:https://en.wikipedia.org/wiki/TCP/IP_Illustrated
[19]:http://www.admin.com/
[20]:https://www.manning.com/books/learn-windows-powershell-in-a-month-of-lunches-third-edition
[21]:https://jamesturnbull.net/
[22]:https://carlosonunez.wordpress.com/2017/03/02/getting-into-devops/
