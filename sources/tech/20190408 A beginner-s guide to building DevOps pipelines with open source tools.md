[#]: collector: (lujun9972)
[#]: translator: (luming)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to building DevOps pipelines with open source tools)
[#]: via: (https://opensource.com/article/19/4/devops-pipeline)
[#]: author: (Bryant Son  https://opensource.com/users/brson/users/milindsingh/users/milindsingh/users/dscripter)

A beginner's guide to building DevOps pipelines with open source tools
======
If you're new to DevOps, check out this five-step process for building
your first pipeline.
![Shaking hands, networking][1]

DevOps has become the default answer to fixing software development processes that are slow, siloed, or otherwise dysfunctional. But that doesn't mean very much when you're new to DevOps and aren't sure where to begin. This article explores what a DevOps pipeline is and offers a five-step process to create one. While this tutorial is not comprehensive, it should give you a foundation to start on and expand later. But first, a story.

### My DevOps journey

I used to work for the cloud team at Citi Group, developing an Infrastructure-as-a-Service (IaaS) web application to manage Citi's cloud infrastructure, but I was always interested in figuring out ways to make the development pipeline more efficient and bring positive cultural change to the development team. I found my answer in a book recommended by Greg Lavender, who was the CTO of Citi's cloud architecture and infrastructure engineering, called _[The Phoenix Project][2]_. The book reads like a novel while it explains DevOps principles.

A table at the back of the book shows how often different companies deploy to the release environment:

Company | Deployment Frequency
---|---
Amazon | 23,000 per day
Google | 5,500 per day
Netflix | 500 per day
Facebook | 1 per day
Twitter | 3 per week
Typical enterprise | 1 every 9 months

How are the frequency rates of Amazon, Google, and Netflix even possible? It's because these companies have figured out how to make a nearly perfect DevOps pipeline.

This definitely wasn't the case before we implemented DevOps at Citi. Back then, my team had different staged environments, but deployments to the development server were very manual. All developers had access to just one development server based on IBM WebSphere Application Server Community Edition. The problem was the server went down whenever multiple users simultaneously tried to make deployments, so the developers had to let each other know whenever they were about to make a deployment, which was quite a pain. In addition, there were problems with low code test coverages, cumbersome manual deployment processes, and no way to track code deployments with a defined task or a user story.

I realized something had to be done, and I found a colleague who felt the same way. We decided to collaborate to build an initial DevOps pipeline—he set up a virtual machine and a Tomcat application server while I worked on Jenkins, integrating with Atlassian Jira and BitBucket, and code testing coverages. This side project was hugely successful: we almost fully automated the development pipeline, we achieved nearly 100% uptime on our development server, we could track and improve code testing coverage, and the Git branch could be associated with the deployment and Jira task. And most of the tools we used to construct our DevOps pipeline were open source.

I now realize how rudimentary our DevOps pipeline was, as we didn't take advantage of advanced configurations like Jenkins files or Ansible. However, this simple process worked well, maybe due to the [Pareto][3] principle (also known as the 80/20 rule).

### A brief introduction to DevOps and the CI/CD pipeline

If you ask several people, "What is DevOps? you'll probably get several different answers. DevOps, like agile, has evolved to encompass many different disciplines, but most people will agree on a few things: DevOps is a software development practice or a software development lifecycle (SDLC) and its central tenet is cultural change, where developers and non-developers all breathe in an environment where formerly manual things are automated; everyone does what they are best at; the number of deployments per period increases; throughput increases; and flexibility improves.

While having the right software tools is not the only thing you need to achieve a DevOps environment, some tools are necessary. A key one is continuous integration and continuous deployment (CI/CD). This pipeline is where the environments have different stages (e.g., DEV, INT, TST, QA, UAT, STG, PROD), manual things are automated, and developers can achieve high-quality code, flexibility, and numerous deployments.

This article describes a five-step approach to creating a DevOps pipeline, like the one in the following diagram, using open source tools.

![Complete DevOps pipeline][4]

Without further ado, let's get started.

### Step 1: CI/CD framework

The first thing you need is a CI/CD tool. Jenkins, an open source, Java-based CI/CD tool based on the MIT License, is the tool that popularized the DevOps movement and has become the de facto standard.

So, what is Jenkins? Imagine it as some sort of a magical universal remote control that can talk to many many different services and tools and orchestrate them. On its own, a CI/CD tool like Jenkins is useless, but it becomes more powerful as it plugs into different tools and services.

Jenkins is just one of many open source CI/CD tools that you can leverage to build a DevOps pipeline.

Name | License
---|---
[Jenkins][5] | Creative Commons and MIT
[Travis CI][6] | MIT
[CruiseControl][7] | BSD
[Buildbot][8] | GPL
[Apache Gump][9] | Apache 2.0
[Cabie][10] | GNU

Here's what a DevOps process looks like with a CI/CD tool.

![CI/CD tool][11]

You have a CI/CD tool running in your localhost, but there is not much you can do at the moment. Let's follow the next step of DevOps journey.

### Step 2: Source control management

The best (and probably the easiest) way to verify that your CI/CD tool can perform some magic is by integrating with a source control management (SCM) tool. Why do you need source control? Suppose you are developing an application. Whenever you build an application, you are programming—whether you are using Java, Python, C++, Go, Ruby, JavaScript, or any of the gazillion programming languages out there. The programming codes you write are called source codes. In the beginning, especially when you are working alone, it's probably OK to put everything in your local directory. But when the project gets bigger and you invite others to collaborate, you need a way to avoid merge conflicts while effectively sharing the code modifications. You also need a way to recover a previous version—and the process of making a backup and copying-and-pasting gets old. You (and your teammates) want something better.

This is where SCM becomes almost a necessity. A SCM tool helps by storing your code in repositories, versioning your code, and coordinating among project members.

Although there are many SCM tools out there, Git is the standard and rightly so. I highly recommend using Git, but there are other open source options if you prefer.

Name | License
---|---
[Git][12] | GPLv2 & LGPL v2.1
[Subversion][13] | Apache 2.0
[Concurrent Versions System][14] (CVS) | GNU
[Vesta][15] | LGPL
[Mercurial][16] | GNU GPL v2+

Here's what the DevOps pipeline looks like with the addition of SCM.

![Source control management][17]

The CI/CD tool can automate the tasks of checking in and checking out source code and collaborating across members. Not bad? But how can you make this into a working application so billions of people can use and appreciate it?

### Step 3: Build automation tool

Excellent! You can check out the code and commit your changes to the source control, and you can invite your friends to collaborate on the source control development. But you haven't yet built an application. To make it a web application, it has to be compiled and put into a deployable package format or run as an executable. (Note that an interpreted programming language like JavaScript or PHP doesn't need to be compiled.)

Enter the build automation tool. No matter which build tool you decide to use, all build automation tools have a shared goal: to build the source code into some desired format and to automate the task of cleaning, compiling, testing, and deploying to a certain location. The build tools will differ depending on your programming language, but here are some common open source options to consider.

Name | License | Programming Language
---|---|---
[Maven][18] | Apache 2.0 | Java
[Ant][19] | Apache 2.0 | Java
[Gradle][20] | Apache 2.0 | Java
[Bazel][21] | Apache 2.0 | Java
[Make][22] | GNU | N/A
[Grunt][23] | MIT | JavaScript
[Gulp][24] | MIT | JavaScript
[Buildr][25] | Apache | Ruby
[Rake][26] | MIT | Ruby
[A-A-P][27] | GNU | Python
[SCons][28] | MIT | Python
[BitBake][29] | GPLv2 | Python
[Cake][30] | MIT | C#
[ASDF][31] | Expat (MIT) | LISP
[Cabal][32] | BSD | Haskell

Awesome! You can put your build automation tool configuration files into your source control management and let your CI/CD tool build it.

![Build automation tool][33]

Everything is good, right? But where can you deploy it?

### Step 4: Web application server

So far, you have a packaged file that might be executable or deployable. For any application to be truly useful, it has to provide some kind of a service or an interface, but you need a vessel to host your application.

For a web application, a web application server is that vessel. An application server offers an environment where the programming logic inside the deployable package can be detected, render the interface, and offer the web services by opening sockets to the outside world. You need an HTTP server as well as some other environment (like a virtual machine) to install your application server. For now, let's assume you will learn about this along the way (although I will discuss containers below).

There are a number of open source web application servers available.

Name | License | Programming Language
---|---|---
[Tomcat][34] | Apache 2.0 | Java
[Jetty][35] | Apache 2.0 | Java
[WildFly][36] | GNU Lesser Public | Java
[GlassFish][37] | CDDL & GNU Less Public | Java
[Django][38] | 3-Clause BSD | Python
[Tornado][39] | Apache 2.0 | Python
[Gunicorn][40] | MIT | Python
[Python Paste][41] | MIT | Python
[Rails][42] | MIT | Ruby
[Node.js][43] | MIT | Javascript

Now the DevOps pipeline is almost usable. Good job!

![Web application server][44]

Although it's possible to stop here and integrate further on your own, code quality is an important thing for an application developer to be concerned about.

### Step 5: Code testing coverage

Implementing code test pieces can be another cumbersome requirement, but developers need to catch any errors in an application early on and improve the code quality to ensure end users are satisfied. Luckily, there are many open source tools available to test your code and suggest ways to improve its quality. Even better, most CI/CD tools can plug into these tools and automate the process.

There are two parts to code testing: _code testing frameworks_ that help write and run the tests, and _code quality suggestion tools_ that help improve code quality.

#### Code test frameworks

Name | License | Programming Language
---|---|---
[JUnit][45] | Eclipse Public License | Java
[EasyMock][46] | Apache | Java
[Mockito][47] | MIT | Java
[PowerMock][48] | Apache 2.0 | Java
[Pytest][49] | MIT | Python
[Hypothesis][50] | Mozilla | Python
[Tox][51] | MIT | Python

#### Code quality suggestion tools

Name | License | Programming Language
---|---|---
[Cobertura][52] | GNU | Java
[CodeCover][53] | Eclipse Public (EPL) | Java
[Coverage.py][54] | Apache 2.0 | Python
[Emma][55] | Common Public License | Java
[JaCoCo][56] | Eclipse Public License | Java
[Hypothesis][50] | Mozilla | Python
[Tox][51] | MIT | Python
[Jasmine][57] | MIT | JavaScript
[Karma][58] | MIT | JavaScript
[Mocha][59] | MIT | JavaScript
[Jest][60] | MIT | JavaScript

Note that most of the tools and frameworks mentioned above are written for Java, Python, and JavaScript, since C++ and C# are proprietary programming languages (although GCC is open source).

Now that you've implemented code testing coverage tools, your DevOps pipeline should resemble the DevOps pipeline diagram shown at the beginning of this tutorial.

### Optional steps

#### Containers

As I mentioned above, you can host your application server on a virtual machine or a server, but containers are a popular solution.

[What are][61] [containers][61]? The short explanation is that a VM needs the huge footprint of an operating system, which overwhelms the application size, while a container just needs a few libraries and configurations to run the application. There are clearly still important uses for a VM, but a container is a lightweight solution for hosting an application, including an application server.

Although there are other options for containers, Docker and Kubernetes are the most popular.

Name | License
---|---
[Docker][62] | Apache 2.0
[Kubernetes][63] | Apache 2.0

To learn more, check out these other [Opensource.com][64] articles about Docker and Kubernetes:

  * [What Is Docker?][65]
  * [An introduction to Docker][66]
  * [What is Kubernetes?][67]
  * [From 0 to Kubernetes][68]



#### Middleware automation tools

Our DevOps pipeline mostly focused on collaboratively building and deploying an application, but there are many other things you can do with DevOps tools. One of them is leveraging Infrastructure as Code (IaC) tools, which are also known as middleware automation tools. These tools help automate the installation, management, and other tasks for middleware software. For example, an automation tool can pull applications, like a web application server, database, and monitoring tool, with the right configurations and deploy them to the application server.

Here are several open source middleware automation tools to consider:

Name | License
---|---
[Ansible][69] | GNU Public
[SaltStack][70] | Apache 2.0
[Chef][71] | Apache 2.0
[Puppet][72] | Apache or GPL

For more on middleware automation tools, check out these other [Opensource.com][64] articles:

  * [A quickstart guide to Ansible][73]
  * [Automating deployment strategies with Ansible][74]
  * [Top 5 configuration management tools][75]



### Where can you go from here?

This is just the tip of the iceberg for what a complete DevOps pipeline can look like. Start with a CI/CD tool and explore what else you can automate to make your team's job easier. Also, look into [open source communication tools][76] that can help your team work better together.

For more insight, here are some very good introductory articles about DevOps:

  * [What is DevOps][77]
  * [5 things to master to be a DevOps engineer][78]
  * [DevOps is for everyone][79]
  * [Getting started with predictive analytics in DevOps][80]



Integrating DevOps with open source agile tools is also a good idea:

  * [What is agile?][81]
  * [4 steps to becoming an awesome agile developer][82]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/devops-pipeline

作者：[Bryant Son (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/milindsingh/users/milindsingh/users/dscripter
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/network_team_career_hand.png?itok=_ztl2lk_ (Shaking hands, networking)
[2]: https://www.amazon.com/dp/B078Y98RG8/
[3]: https://en.wikipedia.org/wiki/Pareto_principle
[4]: https://opensource.com/sites/default/files/uploads/1_finaldevopspipeline.jpg (Complete DevOps pipeline)
[5]: https://github.com/jenkinsci/jenkins
[6]: https://github.com/travis-ci/travis-ci
[7]: http://cruisecontrol.sourceforge.net
[8]: https://github.com/buildbot/buildbot
[9]: https://gump.apache.org
[10]: http://cabie.tigris.org
[11]: https://opensource.com/sites/default/files/uploads/2_runningjenkins.jpg (CI/CD tool)
[12]: https://git-scm.com
[13]: https://subversion.apache.org
[14]: http://savannah.nongnu.org/projects/cvs
[15]: http://www.vestasys.org
[16]: https://www.mercurial-scm.org
[17]: https://opensource.com/sites/default/files/uploads/3_sourcecontrolmanagement.jpg (Source control management)
[18]: https://maven.apache.org
[19]: https://ant.apache.org
[20]: https://gradle.org/
[21]: https://bazel.build
[22]: https://www.gnu.org/software/make
[23]: https://gruntjs.com
[24]: https://gulpjs.com
[25]: http://buildr.apache.org
[26]: https://github.com/ruby/rake
[27]: http://www.a-a-p.org
[28]: https://www.scons.org
[29]: https://www.yoctoproject.org/software-item/bitbake
[30]: https://github.com/cake-build/cake
[31]: https://common-lisp.net/project/asdf
[32]: https://www.haskell.org/cabal
[33]: https://opensource.com/sites/default/files/uploads/4_buildtools.jpg (Build automation tool)
[34]: https://tomcat.apache.org
[35]: https://www.eclipse.org/jetty/
[36]: http://wildfly.org
[37]: https://javaee.github.io/glassfish
[38]: https://www.djangoproject.com/
[39]: http://www.tornadoweb.org/en/stable
[40]: https://gunicorn.org
[41]: https://github.com/cdent/paste
[42]: https://rubyonrails.org
[43]: https://nodejs.org/en
[44]: https://opensource.com/sites/default/files/uploads/5_applicationserver.jpg (Web application server)
[45]: https://junit.org/junit5
[46]: http://easymock.org
[47]: https://site.mockito.org
[48]: https://github.com/powermock/powermock
[49]: https://docs.pytest.org
[50]: https://hypothesis.works
[51]: https://github.com/tox-dev/tox
[52]: http://cobertura.github.io/cobertura
[53]: http://codecover.org/
[54]: https://github.com/nedbat/coveragepy
[55]: http://emma.sourceforge.net
[56]: https://github.com/jacoco/jacoco
[57]: https://jasmine.github.io
[58]: https://github.com/karma-runner/karma
[59]: https://github.com/mochajs/mocha
[60]: https://jestjs.io
[61]: /resources/what-are-linux-containers
[62]: https://www.docker.com
[63]: https://kubernetes.io
[64]: http://Opensource.com
[65]: https://opensource.com/resources/what-docker
[66]: https://opensource.com/business/15/1/introduction-docker
[67]: https://opensource.com/resources/what-is-kubernetes
[68]: https://opensource.com/article/17/11/kubernetes-lightning-talk
[69]: https://www.ansible.com
[70]: https://www.saltstack.com
[71]: https://www.chef.io
[72]: https://puppet.com
[73]: https://opensource.com/article/19/2/quickstart-guide-ansible
[74]: https://opensource.com/article/19/1/automating-deployment-strategies-ansible
[75]: https://opensource.com/article/18/12/configuration-management-tools
[76]: https://opensource.com/alternatives/slack
[77]: https://opensource.com/resources/devops
[78]: https://opensource.com/article/19/2/master-devops-engineer
[79]: https://opensource.com/article/18/11/how-non-engineer-got-devops
[80]: https://opensource.com/article/19/1/getting-started-predictive-analytics-devops
[81]: https://opensource.com/article/18/10/what-agile
[82]: https://opensource.com/article/19/2/steps-agile-developer
