[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to implement a DevOps toolchain)
[#]: via: (https://opensource.com/article/21/1/devops-tool-chain)
[#]: author: (Tereza Denkova https://opensource.com/users/tereza-denkova)

How to implement a DevOps toolchain
======
A fully enabled DevOps toolchain propels your innovation initiatives
with prompt deployment and cost savings.
![Wratchet set tools][1]

Organizations from all industries and of all sizes strive to deliver quality software solutions faster. This guarantees not only their survival but also success in the global marketplace. DevOps can help them chart an optimal course.

DevOps is a system where different processes are supported by tools that work in a connected chain to deliver projects on time and at a lower cost.

At the IT services company [Accedia][2], where I work, we support our clients in implementing a fully-enabled DevOps toolchain that enables them to meet and often surpass their business objectives. In this article, I share with you the key things I have learned from our DevOps projects so far. 

### What is a DevOps toolchain?

A good DevOps toolchain is a progression of different DevOps tools used to address a specific business challenge. Connected in a chain, they guarantee a profitable cycle between the front-end and back-end developers, quality analyzers, and customers. The goal is to automate development and deployment processes to ensure the rapid, reliable, and budget-friendly delivery of innovative solutions.

We found out that building a successful DevOps toolchain is not a simple undertaking. It takes experimentation and nonstop refinement to guarantee that essential processes are fully automated.

### Why you need a DevOps toolchain

A DevOps toolchain automates all of the technical elements in your workflow. It also gets different teams on the same page so that you can focus on a business strategy to drive your organization into the future.

We have come to identify five all the more valid benefits in support of the DevOps toolchain implementation. You can use them to convince your management that it is worth the time and resources which will be invested in developing it: 

  1. **Faster and more efficient product deployments:** DevOps tools automate most of the software development process. This results in the agile delivery of innovative products and solutions that leave the business far ahead of the competition.
  2. **Budget and time optimization:** Automating manual tasks ensures that your organization saves time and resources. Once there are no additional costs incurred from natural human errors or insufficient time management, the budget is naturally optimized.
  3. **Efficient development:** A DevOps toolchain makes the development process more efficient by removing unnecessary delays between the different aspects of development work. The work of front-end and back-end developers and quality testers is synchronized, so no one waits for the other team members to deliver their part so they can take over.
  4. **Faster deployment means higher quality:** A DevOps toolchain guarantees that defects are resolved quickly and skillfully to achieve the best quality with a faster deployment process. How? It enables the generation of targeted alerts that notify your team of major incidents. This allows you to proactively stop potential problems from escalating and damaging your customer service.
  5. **Timely incident management:** A DevOps toolchain helps refine your incident management record. It does this by identifying IT incidents and escalating them specifically towards the right team members, then following through until the issues are resolved. This means messages are received and acted upon quickly because they're correctly targeted.



### A DevOps toolchain in action

My team isn't new to DevOps. We've been agile for a long time, and we've always been keen to explore optimal workflows. In our experience, increasing application complexity increases the need for automation.

Here's a toolchain we set up for a client. The project included developing a mobile factoring solution that links all participants in a financial transaction—seller, buyer, and bank. The client wanted to make the whole experience user-friendly by dynamically responding to user feedback and reducing downtime to a minimum. My team designed a toolchain to automate app maintenance and deployment of new features.

![Accedia's DevOps toolchain][3]

(Accedia, [CC BY-NC-SA 4.0][4])

  1. First, the team wrote automated tests that immediately identified changes to the application's initial version (the **source control/version control DevOps** phase).
  2. Once the new version was ready, the code was committed to GitLab.
  3. Through GitLab, the commit automatically started a Jenkins build.
  4. In **continuous integration**, the new code version was tested with [Chai][5] and [Mocha][6] to check whether it operated correctly.
  5. When the tests passed successfully, the **continuous delivery phase** automatically started and created a ready-to-use Docker image in Sonatype's [Nexus][7]. (This is available both as a free and open source tool and as a paid service from Sonatype.)
  6. Finally, the new version of the application was downloaded from Nexus and deployed to a live environment, e.g., [Docker][8] containers (the **continuous deployment phase**).



In short, every time someone makes a new commit in the repository where the team uploads any new code versions, functions, upgrades, bug fixes, etc., the app package is automatically updated and delivered to clients.

This system has proficient incident control to ensure rapid deployment but not at the expense of quality. It's dynamic in responding to user feedback, meaning that new functions and updates of old ones are released in half the time, while downtime is reduced to a minimum.

### To wrap it up

A fully enabled and properly implemented DevOps toolchain propels your innovation initiatives from start to end and ensures prompt deployment.

Your toolchain will look different than this, depending on your requirements, but I hope seeing our workflow gives you a sense of how to approach automation as a solution.

* * *

_This was written in collaboration with Vladimir Vladimirov, senior software consultant at Accedia, who has extensive experience in CI/CD, DevOps processes, and automating software delivery. It is also based on [5 good reasons why you need a DevOps toolchain][9] from Accedia's blog and is reused under a [CC BY-NC-SA 4.0][4] license._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/devops-tool-chain

作者：[Tereza Denkova][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tereza-denkova
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://accedia.com/services/operations/devops/
[3]: https://opensource.com/sites/default/files/uploads/devopstoolchain.png (Accedia's DevOps toolchain)
[4]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[5]: https://www.chaijs.com/
[6]: https://mochajs.org/
[7]: https://www.sonatype.com/nexus/repository-oss
[8]: https://opensource.com/resources/what-docker
[9]: https://accedia.com/blog/5-good-reasons-why-you-need-a-devops-toolchain/
