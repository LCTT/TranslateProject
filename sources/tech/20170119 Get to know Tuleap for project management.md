Get to know Tuleap for project management
============================================================

### Tuleap is being used by the Eclipse Foundation, replacing Bugzilla.

 ![Get to know Tuleap for project management](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=kOixOaEU "Get to know Tuleap for project management") 
Image by : 

opensource.com

Tuleap is a unique open source project management tool with great momentum right now, every month they have one major release. It's also been listed it in both the [Top 5 open source project management tools in 2015][1] and the [Top 11 project management tools for 2016][2].

"Tuleap is a complete GPLv2 platform to host software projects. It provides a central place where teams can find all the tools they need to track their software projects lifecycle successfully. They will find support for project management (scrum, kanban, waterfall, hybrid, etc.), source control (git and svn) and code review (pull requests and gerrit), continuous integration, issue tracking, wiki, and documentation," said Manuel Vacelet, co-founder and CTO of Enalean, the company behind the Tuleap project.

In this interview I talk with Manuel about how it all got started and how they manage Tuleap in an open source way.

**Nitish Tiwari (NT): Why does the Tuleap project matter? **

**Manuel Vacelet (MV):** Tuleap matters because we strongly believe that a successful (software) project must involve all the stakeholders: developers, project managers, QA, customers, and users.

A long time ago I was an intern on a fork of SourceForge (back when SourceForge was a free and open source project), and it would eventually become Tuleap years after. My first contribution was to integrate PhpWiki into the tool (don't tell anybody, the code is scary).

Now, I'm happy to work as CTO and product owner at Enalean, the main company contributing to the Tuleap project.

**NT: Tell us about the technical aspects.**

**MV:** Tuleap core system is LAMP-based and relies on CentOS. Today's development stack is done with AngularJS (v1) with a REST backend (PHP) and a NodeJS-based real-time server for push notification. But if you wish to be a fullstack Tuleap developer, you will also touch bash, Perl, Python, Docker, Make.

Speaking of technical aspects, it's important to underline that one of the distinctive features of Tuleap is its scalability. A single instance of Tuleap, on a single server, with no complicated IT, can handle over 10,000 people.

**NT: Tell us about the users and the community around the project. Who's involved? How do they use the tool?**

**MV:** The users are very varied. From small startups using Tuleap to keep track of their project advancement and manage their source code to very large companies, like the French telecom operator Orange, which deployed it to over 17,000 users and 5,000 projects hosted.

Many users rely on Tuleap to facilitate agile projects and track their progress. Developers and customers share the same workspace. There is no need for customers to learn how to use GitHub, nor for developers to have an additional layer of work to transcribe their work on a "customer accessible" platform.

This year, Tuleap is being used by the [Eclipse Foundation][3], replacing Bugzilla.

The Indian Ministry of Electronics & Information Technology has created the Government of India's platform for open collaborative development of e-governance applications using Tuleap.

Tuleap is used in a number of different ways and configurations. Some people use it as a backend for their Drupal customer facing websites; they plug via the REST API's into Tuleap to manage bugs and service requests.

Even some architects are using it to manage their work advancement and AutoCAD files.

**NT: Does Tuleap do anything special to make the community a safe and diverse place?**

**MV:** We haven't created a "Code of Conduct" yet; the community is really peaceful and welcoming, but we plan to do that. Tuleap developers and contributors come from different countries (i.e., Canada, Tunisia, France). And 35% of active developers and contributors are women.

**NT: What percentage of Tuleap features are suggested by the community?**

**MV:** Almost 100% of the features are community-driven.

It was one of Enalean's key challenges: to find a business model that allows us to do open source software the right way. To us, the "open core" model (where the core of the application is open, but the interesting and useful parts are closed source) is not the right way because you depend on closed source at the end of the day. So we invented the [OpenRoadmap][4], a way for us to gather needs from community and end users and find companies to pay for it.

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/nitish-crop.png?itok=h4PaLDQq)

Nitish is a software developer by profession & an open source enthusiast by heart. As a tech author for Linux based magazines, he covers new Open Source tools. He loves to read and explore anything open source. In his free time, he likes to read motivational books. He is currently building DevUp - a platform to let developers connect all their tools and embrace DevOps in a true manner. You can follow him on twitter 

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/interview-Tuleap-project

作者：[Nitish Tiwari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tiwarinitish86
[1]:https://opensource.com/business/15/1/top-project-management-tools-2015
[2]:https://opensource.com/business/16/3/top-project-management-tools-2016
[3]:http://www.eclipse.org/
[4]:https://blog.enalean.com/enalean-open-roadmap-how-it-works/
