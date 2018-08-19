Mixing software development roles produces great results
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

Most open source communities don’t have a lot of formal roles. There are certainly people who help with sysadmin tasks, testing, writing documentation, and translating or developing code. But people in open source communities typically move among different roles, often fulfilling several at once.

In contrast, team members at most traditional companies have defined roles, working on documentation, support, QA, and in other areas.

Why do open source communities take a shared-role approach, and more importantly, how does this way of collaborating affect products and customers?

[Nextcloud][1] has adopted this community-style practice of mixing roles, and we see large benefits for our customers and our users.

### 1\. Better product testing

Testing is a difficult job, as any tester can tell you. You need to understand the products engineers develop, and you need to devise test plans, execute them, and return the results to the developers. When that process is done, the developer makes changes, and you repeat the process, going back-and-forth as many times as necessary until the job is done.

In a community, contributors typically feel responsible for the projects they develop, so they test and document them extensively before handing them to users. Users close to the project often help test, translate, and write documentation in collaboration with developers. This creates a much tighter, faster feedback loop, speeding up development and improving quality.

When developers continuously confront the results of their work, it encourages them to write in a way that minimizes testing and debugging. Automated testing is an important element in development, and the feedback loop ensures that it is done right: Developers are organically motivated to automate what should be automated—no more and no less. Sure, they might _want_ others to do more testing or test automation, but when testing is the right thing to do, they do it. Moreover, they review each others' code because they know that issues tend to come back bite them later.

So, while I won't argue that it's better to forgo dedicated testers, certainly in a project without community volunteers who test, testers should be developers and closely embedded in the development team. The result? Customers get a product that was tested and developed by people who are 100% motivated to ensure that it is stable and reliable.

### 2\. Close alignment between development and customer needs

It is extraordinarily difficult to align product development with customer needs. Every customer has their own unique needs, there are long- and short-term factors to consider—and of course, as a company, you have ideas on where you want to go. How do you integrate all these ideas and visions?

Companies typically create roles like product management, support, QA, and others, which are separate from engineering and product development. The idea behind this is that people do best when they specialize, and engineers shouldn't be bothered with "simple" tasks like testing or support.

In effect, this role separation is a cost-cutting measure. It enables management to micromanage and feel more in control as they can simply order product management, for example, to prioritize items on the roadmap. (It also creates more meetings!)

In communities, on the other hand, "those who do the work decide." Developers are often also users (or are paid by users), so they align with users’ needs naturally. When users help with testing (as described above), developers work with them constantly, so both sides fully understand what is possible and what is needed.

This open way of working closely aligns users and projects. Without management interference and overhead, users' most pressing needs can be quickly met because engineers already intimately understand them.

At Nextcloud, customers never need to explain things twice or rely on a junior support team member to accurately communicate issues to an engineer. Our engineers continuously calibrate their priorities based on real customer needs. Meanwhile, long-term goals are set collaboratively, based on a deep knowledge of our customers.

### 3\. The best support

Unlike proprietary or [open core][2] vendors, open source vendors have a powerful incentive to offer the best possible support: It is a key differentiator from other companies in their ecosystem.

Why is the driving force behind a project—think [Collabora][3] behind [LibreOffice][4], [The Qt Company][5] behind [Qt][6], or [Red Hat][7] behind [RHEL][8]—the best source of customer support?

Direct access to engineers, of course. Rather than walling off support from engineering, many of these companies offer customers access to engineers' expertise. This helps ensure that customers always get the best answers as quickly as possible. While some engineers may spend more time than others on support, the entire engineering team plays a role in customer success. Proprietary vendors might provide customers a dedicated on-site engineer for a considerable cost, for example, but an open source company like [OpenNMS][9] offers that same level of service in your support contract—even if you’re not a Fortune 500 customer.

There's another benefit, which relates back to testing and customer alignment: Sharing roles ensures that engineers deal with customer issues and wishes daily, which motivates them to fix the most common problems quickly. They also tend to build extra tools and features to save customers from asking.

Put simply, folding QA, support, product management, and other engineering roles into one team ensures that the three famous virtues of great developers—[laziness, impatience, and hubris][10]—closely align with customers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/mixing-roles-engineering

作者：[Jos Poortvliet][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jospoortvliet
[1]:https://nextcloud.com/
[2]:https://en.wikipedia.org/wiki/Open_core
[3]:https://www.collaboraoffice.com/
[4]:https://www.libreoffice.org/
[5]:https://www.qt.io/
[6]:https://www.qt.io/developers/
[7]:https://www.redhat.com/en
[8]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[9]:https://www.opennms.org/en
[10]:http://threevirtues.com/
