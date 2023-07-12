[#]: subject: "Build an open source project using this essential advice"
[#]: via: "https://opensource.com/article/22/9/build-open-source-project"
[#]: author: "Bolaji Ayodeji https://opensource.com/users/bolajiayodeji"
[#]: collector: "lkxed"
[#]: translator: "wcjjdlhws"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build an open source project using this essential advice
使用这些必要的建议来构建开源项目
======
Use these steps for a solid foundation for your first—or next—project.
使用这些步骤来为你的第一个或接下来的项目打下坚实的基础。

[Open source][2] is a flourishing and beneficial ecosystem that publicly solves problems in communities and industries using software developed through a decentralized model and community contributions. Over the years, this ecosystem has grown in number and strength among hobbyists and professionals alike. It's mainstream now—even proprietary companies use open source to build software.
[开源][2]是一个蓬勃发展且有益的生态系统，它通过分散模式和社区贡献开发的软件公开解决社区和行业问题。

With the ecosystem booming, many developers want to get in and build new open source projects. The question is: How do you achieve that successfully?
随着这个生态系统的爆炸式发展，许多开发者想要参与并且构建新的开源项目。问题是：你如何成功地完成它？

This article will demystify the lifecycle and structure of open source projects. I want to give you an overview of what goes on inside an open source project and show you how to build a successful and sustainable project based on my personal experience.
这篇文章将会揭秘开源项目的生命周期与结构。基于我的个人经历，我想要向您概述一下开源项目的内部情况，向您展示一下怎样构建一个成功稳定的项目。

### A quick introduction to open source
### 对开源的快速介绍

The [Open Source Initiative][3] (OSI) provides a formal, detailed definition of open source, but Wikipedia provides a nice summary:
[开放源代码促进会][3]（OSI）提供了开源的正式、详细的定义，但是维基百科提供了一个很好的总结：

> Open source software is computer software that is released under a license in which the copyright holder grants users the rights to use, study, change, and distribute the software and its source code to anyone and for any purpose.
> 开源软件是根据许可证发布的计算机软件，在许可证中，版权所有者授予使用者使用、研究、更改和向任何人、为了任何目的分发软件和它的源代码的权利。

Open source software is public code, usually on the internet, developed either collaboratively by multiple people or by one person. It's about collaborating with people from different regions, cultures, and technical backgrounds, often working remotely. This is why creating a project that welcomes everyone and enables different people to work together is essential.
开源软件通常在网络上有公开的代码，它由多人合作或一人开发。这就需要与来自不同地区、不同文化和不同技术背景的人合作，而且往往是远程合作。

### The anatomy of an open source project
### 开源项目的剖析

Like the human body, an open source project is made up of several structures that form the entire system. I think of them as two branches: the people (microscopic) and the documents (macroscopic).
就像人类的身体，一个开源项目由多个结构组成，这些结构构成了整个系统。我认为它们是两个分支：人（微观）和文件（宏观）。

#### Branch one: people
#### 分支一：人

Generally, an open source project includes the following sets of people:
通常，一个开源项目包括以下人群：

* Creators: Those who created the project
* 创始人： 创建项目的人
* Maintainers: Those who actively manage the entire project
* 维护者： 积极管理整个项目的人
* Contributors: Those who contribute to the project (someone like you!)
* 贡献者： 为项目做贡献的人（像你一样的人！）
* User: Those who use the project, including developers and nontechnical customers
* 用户： 使用这个项目的人，包括开发者和非技术客户
* Working group: A collection of contributors split into domain-specific groups to focus on a discussion or activity around a specific subject area (such as documentation, onboarding, testing, DevOps, code reviews, performance, research, and so on)
* 工作组： 将贡献者分成特定领域的小组，专注于围绕特定主题领域（如文档、入职、测试、DevOps、代码审查、性能、研究等）的集合。
* Sponsor: Those who contribute financial support to the project
* 赞助人： 为项目提供资金支持的人

You need to consider each group in the list above as you prepare to build a new project. What plan do you have for each of them?
当你准备构建一个新项目时，你需要考虑以上列表中的每一个群组。你对他们每个人有什么计划？

* For maintainers, decide on the criteria you want to use to appoint them. Usually, an active contributor makes the best maintainer.
* 对于维护者，请确定任用维护者的标准。通常，积极的贡献者就是最爱好的维护者。
* For users and contributors, you want to prepare solid documentation, an onboarding process, and everything else they need to succeed when working with your project.
* 对于用户和贡献者，你需要准备可靠的文档、入职流程和他们使用你的项目取得成功所需的一切。
* For working groups, decide whether you need them and how your project may be logically split in the future.
* 对于工作组，请确定你是否需要它们，以及你的项目将来如何有逻辑地拆分。
* Finally, for sponsors, you must provide enough data and information about your project to enable them to choose to sponsor you.
* 最后，对于赞助人，你必须提供足够的数据和有关你项目的信息来使他们会选择赞助你。

You don't need to have all of these figured out at the start of your project. However, it's wise to think about them at the early stages so you can build the right foundations to ensure that future additions stand firm and lead to a successful project.
你不必在你项目的起始阶段解决上面所有问题。然而，在早期阶段思考它们是很明智的，这样你就能打下正确的基础，确保未来的扩建项目能够站稳脚跟并取得成功。

#### Branch two: documents
#### 分支二：文件

Open source projects usually include the following documents, usually in plain text or markdown format:
开源项目通常包括下列文件，通常为纯文本或 markdown 格式

* License: This legal document explains how and to what extent the project can be freely used, modified, and shared. A list of OSI-approved licenses is available on the OSI website. Without an explicit license, your project is not legally open source!
* 许可证： 本法律文件解释了如何以及在何种程度上可以自由使用、修改和共享本项目。OSI网站上有OSI认可的许可证列表。如果没有明确的许可证，您的项目在法律上就不是开源的！
* Code of conduct: This document outlines the rules, norms, acceptable practices, and responsibilities of anyone who decides to participate in the project in any way (including what happens when someone violates any of the rules). The [Contributor Covenant][4] is a good example and is open source (licensed under a Creative Commons license).
* 行为准则： 本文件概述了规则、规范、可接受的做法以及决定以任何方式参与项目的任何人的责任（包括当某人违反任何规则时会发生什么）。
* README: This file introduces your project to newcomers. On many Git hosting websites, such as GitLab, GitHub, and Codeberg, the README file is displayed under the initial file listing of a repository. It's common to feature documentation here, with links to other necessary documents.
* Documentation: This is a file or directory containing all documentation resources for the project, including guides, API references, tutorials, and so on.
* Contributing: Include a document explaining how to contribute to the project, including installation guides, configuration, and so on.
* Security: Include a file explaining how to submit vulnerability reports or security issues.

Additionally, a project usually has web pages for issues, support, and collaboration.

Broadly, these include:

* Issues or bug reports: A place where users can report bugs. This page also provides a place developers can go to assign themselves the task of fixing one or more of them.
* Pull or merge requests: A place with proposed feature enhancements and solutions to bugs. These patches may be created by anyone, reviewed by the maintainers, then merged into the project's code.
* Discussions: A place where maintainers, contributors, and users discuss an open source project. This may be a dedicated website or a forum within a collaborative coding site.

Most projects also have a communication channel in the form of an online chat for conversations and interactions between community members.

### Licensing

[Licensing][5] is perhaps the easiest but most important criterion to consider before creating an open source project. A license defines the terms and conditions that allow the source code and other components of your project to be used, modified, and shared.

Licenses contain tons of legal jargon that many people don't fully understand. I use [choosealicense.com][6], which helps you choose a license based on your intended community, your desire to get patches back from those using your code, or your willingness to allow people to use your code without sharing improvements they make to it.

![This provides guidance on when to use an MIT license or a GNU GPLv3 license. It also recommends that people contributing to a community use the license preferred by that community. The graphic also notes that there are many more licenses available. The website choosealicense.com has a text-based version of this image that links to more detailed information.][7]

Image by: (Bolaji Ayodeji, CC BY-SA 4.0)

### 13 phases of creating an open source project

Now for the essential question: How do you start an open source software project?

Here is a list of what I consider the phases of an open source project.

1. Brainstorm your idea, write a synopsis, and document it properly.
2. Begin developing your idea. This usually involves figuring out the right tools and stacks to use, writing some code, version controlling the code, debugging, drinking some coffee, hanging around StackOverflow, using other open source projects, sleeping, and building something to solve a defined problem—or just for fun!
3. Test the project locally, write some unit and integration tests as required, set up [CI/CD pipelines][8] as needed, create a staging branch (a test branch where you test the code live before merging into the main branch), and do anything else you need to deploy the project.
4. Write [good and effective documentation][9]. This should cover what your project does, why it is useful, how to get started with it (usage, installation, configuration, contributing), and where people can get support.
5. Ensure to document all code conventions you want to use. Enforce them with tools like linters, code formatters, Git hooks, and the commitizen command line utility.
6. Choose the right license and create a README.
7. Publish the project on the internet (you might have a private repository initially, and make it public at this step).
8. Set up the processes for making releases and documenting changelogs (you can use tools like Changesets).
9. Market the project to the world! You can make a post on social media, start a newsletter, share it with your friends privately, do a product hunt launch, live stream, or any other traditional marketing strategy you know.
10. Seek funding support by using any of the available funding platforms, like Open Collective, GitHub Sponsors, Patreon, Buy me a Coffee, LiberaPay, and so on. When you create accounts with these platforms, add a link to it in your project's documentation and website.
11. Build a community around your project.
12. Consider introducing working groups to break your project's management into logical parts when required.
13. Continuously implement new ideas that sustain the resources and people behind your project.

It's important to measure different parts of your project as you progress. This provides you with data you can use for evaluation and future growth strategies.

### Now start a project!

I hope this article helps you move forward with that project you've been thinking about.

Feel free to use it as a guide and fill any gaps I missed as you build your awesome open source software project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/build-open-source-project

作者：[Bolaji Ayodeji][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bolajiayodeji
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/BUSINESS_buildtogether.png
[2]: https://opensource.com/resources/what-open-source
[3]: https://opensource.org
[4]: https://www.contributor-covenant.org/version/2/1/code_of_conduct
[5]: https://opensource.com/tags/licensing
[6]: https://choosealicense.com
[7]: https://opensource.com/sites/default/files/2022-09/choosealicense.png
[8]: https://opensource.com/article/19/9/intro-building-cicd-pipelines-jenkins
[9]: https://slides.com/bolajiayodeji/effective-oss-docs
