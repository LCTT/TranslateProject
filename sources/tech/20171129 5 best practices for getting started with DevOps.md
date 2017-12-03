5 best practices for getting started with DevOps
============================================================

### Are you ready to implement DevOps, but don't know where to begin? Try these five best practices.

 
![5 best practices for getting started with DevOps](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops-gears.png?itok=rUejbLQX "5 best practices for getting started with DevOps")
Image by : 

[Andrew Magill][8]. Modified by Opensource.com. [CC BY 4.0][9]

DevOps often stymies early adopters with its ambiguity, not to mention its depth and breadth. By the time someone buys into the idea of DevOps, their first questions usually are: "How do I get started?" and "How do I measure success?" These five best practices are a great road map to starting your DevOps journey.

### 1\. Measure all the things

You don't know for sure that your efforts are even making things better unless you can quantify the outcomes. Are my features getting out to customers more rapidly? Are fewer defects escaping to them? Are we responding to and recovering more quickly from failure?

Before you change anything, think about what kinds of outcomes you expect from your DevOps transformation. When you're further into your DevOps journey, you'll enjoy a rich array of near-real-time reports on everything about your service. But consider starting with these two metrics:

*   **Time to market** measures the end-to-end, often customer-facing, business experience. It usually begins when a feature is formally conceived and ends when the customer can consume the feature in production. Time to market is not mainly an engineering team metric; more importantly it shows your business' complete end-to-end efficiency in bringing valuable new features to market and isolates opportunities for system-wide improvement.

*   **Cycle time** measures the engineering team process. Once work on a new feature starts, when does it become available in production? This metric is very useful for understanding the efficiency of the engineering team and isolating opportunities for team-level improvement.

### 2\. Get your process off the ground

DevOps success requires an organization to put a regular (and hopefully effective) process in place and relentlessly improve upon it. It doesn't have to start out being effective, but it must be a regular process. Usually that it's some flavor of agile methodology like Scrum or Scrumban; sometimes it's a Lean derivative. Whichever way you go, pick a formal process, start using it, and get the basics right.

Regular inspect-and-adapt behaviors are key to your DevOps success. Make good use of opportunities like the stakeholder demo, team retrospectives, and daily standups to find opportunities to improve your process.

A lot of your DevOps success hinges on people working effectively together. People on a team need to work from a common process that they are empowered to improve upon. They also need regular opportunities to share what they are learning with other stakeholders, both upstream and downstream, in the process.

Good process discipline will help your organization consume the other benefits of DevOps at the great speed that comes as your success builds.

Although it's common for more development-oriented teams to successfully adopt processes like Scrum, operations-focused teams (or others that are more interrupt-driven) may opt for a process with a more near-term commitment horizon, such as Kanban.

### 3\. Visualize your end-to-end workflow

There is tremendous power in being able to see who's working on what part of your service at any given time. Visualizing your workflow will help people know what they need to work on next, how much work is in progress, and where the bottlenecks are in the process.

You can't effectively limit work in process until you can see it and quantify it. Likewise, you can't effectively eliminate bottlenecks until you can clearly see them.

Visualizing the entire workflow will help people in all parts of the organization understand how their work contributes to the success of the whole. It can catalyze relationship-building across organizational boundaries to help your teams collaborate more effectively towards a shared sense of success.

### 4\. Continuous all the things

DevOps promises a dizzying array of compelling automation. But Rome wasn't built in a day. One of the first areas you can focus your efforts on is [continuous integration][10] (CI). But don't stop there; you'll want to follow quickly with [continuous delivery][11] (CD) and eventually continuous deployment.

Your CD pipeline is your opportunity to inject all manner of automated quality testing into your process. The moment new code is committed, your CD pipeline should run a battery of tests against the code and the successfully built artifact. The artifact that comes out at the end of this gauntlet is what progresses along your process until eventually it's seen by customers in production.

Another "continuous" that doesn't get enough attention is continuous improvement. That's as simple as setting some time aside each day to ask your colleagues: "What small thing can we do today to get better at how we do our work?" These small, daily changes compound over time into more profound results. You'll be pleasantly surprised! But it also gets people thinking all the time about how to improve things.

### 5\. Gherkinize

Fostering more effective communication across your organization is crucial to fostering the sort of systems thinking prevalent in successful DevOps journeys. One way to help that along is to use a shared language between the business and the engineers to express the desired acceptance criteria for new features. A good product manager can learn [Gherkin][12] in a day and begin using it to express acceptance criteria in an unambiguous, structured form of plain English. Engineers can use this Gherkinized acceptance criteria to write acceptance tests against the criteria, and then develop their feature code until the tests pass. This is a simplification of [acceptance test-driven development][13](ATDD) that can also help kick start your DevOps culture and engineering practice.

### Start on your journey

Don't be discouraged by getting started with your DevOps practice. It's a journey. And hopefully these five ideas give you solid ways to get started.


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/headshot_4.jpg?itok=jntfDCfX)][14] 
 
 Magnus Hedemark - Magnus has been in the IT industry for over 20 years, and a technology enthusiast for most of his life. He's presently Manager of DevOps Engineering at UnitedHealth Group. In his spare time, Magnus enjoys photography and paddling canoes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/5-keys-get-started-devops

作者：[Magnus Hedemark  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/magnus919
[1]:https://opensource.com/tags/devops?src=devops_resource_menu1
[2]:https://opensource.com/resources/devops?src=devops_resource_menu2
[3]:https://www.openshift.com/promotions/devops-with-openshift.html?intcmp=7016000000127cYAAQ&src=devops_resource_menu3
[4]:https://enterprisersproject.com/article/2017/5/9-key-phrases-devops?intcmp=7016000000127cYAAQ&src=devops_resource_menu4
[5]:https://www.redhat.com/en/insights/devops?intcmp=7016000000127cYAAQ&src=devops_resource_menu5
[6]:https://opensource.com/article/17/11/5-keys-get-started-devops?rate=oEOzMXx1ghbkfl2a5ae6AnvO88iZ3wzkk53K2CzbDWI
[7]:https://opensource.com/user/25739/feed
[8]:https://ccsearch.creativecommons.org/image/detail/7qRx_yrcN5isTMS0u9iKMA==
[9]:https://creativecommons.org/licenses/by-sa/4.0/
[10]:https://martinfowler.com/articles/continuousIntegration.html
[11]:https://martinfowler.com/bliki/ContinuousDelivery.html
[12]:https://cucumber.io/docs/reference
[13]:https://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development
[14]:https://opensource.com/users/magnus919
[15]:https://opensource.com/users/magnus919
[16]:https://opensource.com/users/magnus919
[17]:https://opensource.com/tags/devops
