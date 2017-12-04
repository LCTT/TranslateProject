translating---geekpi

GitHub welcomes all CI tools
====================


[![GitHub and all CI tools](https://user-images.githubusercontent.com/29592817/32509084-2d52c56c-c3a1-11e7-8c49-901f0f601faf.png)][11] 

Continuous Integration ([CI][12]) tools help you stick to your team's quality standards by running tests every time you push a new commit and [reporting the results][13] to a pull request. Combined with continuous delivery ([CD][14]) tools, you can also test your code on multiple configurations, run additional performance tests, and automate every step [until production][15].

There are several CI and CD tools that [integrate with GitHub][16], some of which you can install in a few clicks from [GitHub Marketplace][17]. With so many options, you can pick the best tool for the job—even if it's not the one that comes pre-integrated with your system.

The tools that will work best for you depends on many factors, including:

*   Programming language and application architecture

*   Operating system and browsers you plan to support

*   Your team's experience and skills

*   Scaling capabilities and plans for growth

*   Geographic distribution of dependent systems and the people who use them

*   Packaging and delivery goals

Of course, it isn't possible to optimize your CI tool for all of these scenarios. The people who build them have to choose which use cases to serve best—and when to prioritize complexity over simplicity. For example, if you like to test small applications written in a particular programming language for one platform, you won't need the complexity of a tool that tests embedded software controllers on dozens of platforms with a broad mix of programming languages and frameworks.

If you need a little inspiration for which CI tool might work best, take a look at [popular GitHub projects][18]. Many show the status of their integrated CI/CD tools as badges in their README.md. We've also analyzed the use of CI tools across more than 50 million repositories in the GitHub community, and found a lot of variety. The following diagram shows the relative percentage of the top 10 CI tools used with GitHub.com, based on the most used [commit status contexts][19] used within our pull requests.

 _Our analysis also showed that many teams use more than one CI tool in their projects, allowing them to emphasize what each tool does best._ 

 [![Top 10 CI systems used with GitHub.com based on most used commit status contexts](https://user-images.githubusercontent.com/7321362/32575895-ea563032-c49a-11e7-9581-e05ec882658b.png)][20] 

If you'd like to check them out, here are the top 10 tools teams use:

*   [Travis CI][1]

*   [Circle CI][2]

*   [Jenkins][3]

*   [AppVeyor][4]

*   [CodeShip][5]

*   [Drone][6]

*   [Semaphore CI][7]

*   [Buildkite][8]

*   [Wercker][9]

*   [TeamCity][10]

It's tempting to just pick the default, pre-integrated tool without taking the time to research and choose the best one for the job, but there are plenty of [excellent choices][21] built for your specific use cases. And if you change your mind later, no problem. When you choose the best tool for a specific situation, you're guaranteeing tailored performance and the freedom of interchangability when it no longer fits.

Ready to see how CI tools can fit into your workflow?

[Browse GitHub Marketplace][22]

--------------------------------------------------------------------------------

via: https://github.com/blog/2463-github-welcomes-all-ci-tools

作者：[jonico  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/jonico
[1]:https://travis-ci.org/
[2]:https://circleci.com/
[3]:https://jenkins.io/
[4]:https://www.appveyor.com/
[5]:https://codeship.com/
[6]:http://try.drone.io/
[7]:https://semaphoreci.com/
[8]:https://buildkite.com/
[9]:http://www.wercker.com/
[10]:https://www.jetbrains.com/teamcity/
[11]:https://user-images.githubusercontent.com/29592817/32509084-2d52c56c-c3a1-11e7-8c49-901f0f601faf.png
[12]:https://en.wikipedia.org/wiki/Continuous_integration
[13]:https://github.com/blog/2051-protected-branches-and-required-status-checks
[14]:https://en.wikipedia.org/wiki/Continuous_delivery
[15]:https://developer.github.com/changes/2014-01-09-preview-the-new-deployments-api/
[16]:https://github.com/works-with/category/continuous-integration
[17]:https://github.com/marketplace/category/continuous-integration
[18]:https://github.com/explore?trending=repositories#trending
[19]:https://developer.github.com/v3/repos/statuses/
[20]:https://user-images.githubusercontent.com/7321362/32575895-ea563032-c49a-11e7-9581-e05ec882658b.png
[21]:https://github.com/works-with/category/continuous-integration
[22]:https://github.com/marketplace/category/continuous-integration
