[#]: subject: "Documentation Isn’t Just Another Aspect of Open Source Development"
[#]: via: "https://www.opensourceforu.com/2022/04/documentation-isnt-just-another-aspect-of-open-source-development/"
[#]: author: "Harsh Bardhan Mishra https://www.opensourceforu.com/author/harsh-bardhan-mishra/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Documentation Isn’t Just Another Aspect of Open Source Development
======
Some projects live on, while some die a premature death – and the difference between the two often lies in the documentation. Meticulous, smart documentation can give your project the boost it needs. Here is why you should consider documentation a primary effort, on par with development, and the right way to go about it!

![Importance of documentation][1]

Often, developers simply assume that code is self-documented enough and doesn’t need any extra documentation. This overconfidence can cost the project a lot. Insufficient or bad documentation can kill your project. Without proper documentation in place users won’t be able to understand the purpose as well as the proper workflow of the project. That could lead to some apprehensions about adopting your open source product.

**Work on it, right from day one**

Documentation should never be a secondary effort; it should be a primary task on par with code development and management. Documentation acts as the definitive source of truth with the wide redistribution of content in the form of community threads, stack overflows, and quora answers. It should fulfil the need of contributors who would like to refer to the actual resource, and provide the necessary references to support engineers. It should also communicate essential plans with the stakeholders. A good documentation ensures continuous improvement and development of a product.

When releasing a software product, we must not only ship the code but good documentation as well. This brings us to one of the most important concepts that most open source projects with well-maintained documentation follow – ‘documentation as code’.

**Documentation as code**

Today documentation is not being stored in Microsoft Word or PDF files. The new need is version control documentation, wherein all the docs are added over a version control system and released continuously. This concept was popularised by ‘Read the Docs’ and has now become an essential part of the content strategy for most documentation teams.

Tools like Bugzilla and GitHub Issues can be used to track the documentation work that is pending, and take feedback from maintainers and users to validate the release of the documents. External reviews can be used to validate the documentation piece, and to continuously publish it. This ensures that not only code, but the documentation as well, is continuously improved and released quickly.

Keep in mind that no two documentations will ever be the same if they don’t follow any standardised practice. This can lead to some mess, making it hard to fetch the right information.

How exactly do we classify something as messy? When most of the documentation pieces don’t follow standard practices, it leads to inconsistency and hence a big mess! So how do you declutter messy open source documents?

**Decluttering messy open source documentation**

It is important to follow a ‘documentation style guide’. A style guide is a collection of guidelines for creating and presenting content. Whether you’re a standalone writer or part of a large documents team, it helps to keep a consistent style, voice and tone throughout your documentation.

There are several popular style guides available, such as the Red Hat style guide, Google documentation style guide, and Apple style guide. To choose one, first start by defining your requirements. If your requirements do not differ much from other open source projects, you can follow a readily-available style guide, or adapt the same style guide for your own purpose with a few changes here and there. Most of the grammar-related guidelines and content rules may be the same, but overall terminology can vary.

You will also be required to automate the adoption of these style guides within your projects. For this, you can use Vale, which is integrated into the local machinery with a continuous integration (CI) service that will help you to ensure your documentation follows the style guide in a strict manner.

*Reference guides:* These might include some basic references to get started with or some docs to contribute to the project.

*User facing documentation:* This is the most essential part that documents the usability of the project. Without any user-facing documentation most people will be lost as to how to go about working with the project.

*Developers’ documentation:* This aims to support development teams as they continuously make new progress in the project. It should also provide a good pathway to internal development efforts and make sure that the features are communicated well to the stakeholders.

*Community content:* This includes essential blogs, videos and external content that aim to support community members who would like to refer to the same for a better understanding of the project.

By using the style guide, the overall premise of the documentation will be conveyed to the users in a single tone. But since these documents are prepared by a team of technical writers, there can be conflicting writing styles, as these vary from person to person. So how do you standardise the documentation?

**Standardising documentation**

There are many approaches that can be taken when it comes to standardising documentation. The first one is obviously to create predefined templates which can be used for a variety of roles. These can be used for documenting new features, identifying bugs and issues, and updating the change log to accommodate new stuff that is being added.

Try to develop a standard workflow for publishing your documentation if you are following a Git based workflow. The most standard workflow will be to fork the repo where the documentation is published, add your changes on a local branch, push these changes, make your request and ask for reviews on the same. A positive that comes out of standardising your documents is a better feedback and review process.

**Feedback and automated reviews**

Standardisation allows you to get users’ feedback and generate automated reviews, which can be taken into consideration for improving the project and the documentation. With this feedback, you can also evaluate whether the information being shared is making sense to users or not. Having a proper feedback service in place through documentation platforms like GitBook helps to verify if the documentation is useful or not.

Always try to seek out subject matter expert (SME) feedback on the documentation. These SMEs can be stakeholders, developers, engineers, or even external contributors. You can also use automated tests and CI to verify if your documentation is following a style guide or not.

**Crowdsourced documentation efforts**

If you are looking to open source your documentation, perhaps the best way to get started is to provide a quick start guide. The guide can be as simple as ‘CONTRIBUTING.md’; basically, a file showing how a person can set up the project and contribute to or use it.

Always try to develop user-centric documentation that signifies the purpose of each project and build learning courses to help new contributors.

* What is the goal of this documentation?
* What is the message that needs to be given?
* What action would you like the user to take up after this?
* What are the values that I share with the reader?
* Am I concise and consistent in my writing efforts?

Defining a consistent content strategyA consistent content strategy helps to ensure a long-term vision for the documentation efforts and the project infrastructure. This can revolve around two main things:

a.* Resources:* Project docs, case studies and whitepapers, project architecture

b. *Branded content:* Blogs and guest posts, news and community stories, learning courses

Every open source project should have proper documentation stating the functionality it can provide to users, so that they can opt for the most suitable solution. Proper documentation that communicates the right information also allows other developers to put in their efforts to further enhance and improve the project. Simple though it sounds, documentation can only succeed if done right. And your project, in turn, can only succeed if your documentation is right, so never underestimate its purpose or process!

Curated By: Laveesh Kocher

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/04/documentation-isnt-just-another-aspect-of-open-source-development/

作者：[Harsh Bardhan Mishra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/harsh-bardhan-mishra/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Importance-of-documentation-696x477.jpg
