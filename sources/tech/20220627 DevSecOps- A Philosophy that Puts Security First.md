[#]: subject: "DevSecOps: A Philosophy that Puts Security First"
[#]: via: "https://www.opensourceforu.com/2022/06/devsecops-a-philosophy-that-puts-security-first/"
[#]: author: "Jonathan Pereira https://www.opensourceforu.com/author/jonathan-pereira/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DevSecOps: A Philosophy that Puts Security First
======
DevOps has helped remove barriers between development and operations, to improve productivity as well as the reliability of software. However, it has fallen short on some aspects such as security, leading to the emergence of the DevSecOps philosophy. Find out more about it in this article.

![DevSecOps featured][1]

Though a lot of people understand the security concerns that are inherent in DevOps, most do not know how to overcome the problem. The new security-focused spin-off DevSecOps could solve these problems if implemented properly.

In order to understand and appreciate DevSecOps, we first need to understand the benefits and the shortcomings of DevOps.

#### Pros of DevOps

*Reduced time-to-market:* Not too long ago, it used to take anywhere close to a year or two for a simple software release, with big companies claiming that they would need to estimate time, resources, and the manpower required to complete a task, and so on. Today there are companies that are shipping out software on a daily basis. This has been possible because of the adoption of the DevOps philosophy.

*Global presence:* DevOps has without a doubt helped companies manage a global presence. Rewinding back a few years, only the major players in the field of software development were able to ship their software across the globe. Today, that has almost entirely changed as a company situated in India can assist a client from any corner of the world. Similarly, Indian customers can get the services of any company located anywhere in the world.

*Software democratisation:* One of the reasons why companies demanded a lot of time to build software was because they had to literally develop everything from scratch. Every library and all the necessary tools had to be built from the ground up, which was a huge task. But today that has changed completely, as all the required libraries that can perform basic tasks can be used by anyone, and a developer can just start to build on top of these like a matrix. This is a convenience, especially for those who rely heavily on these libraries. A good example of this is what React and Angular have been doing for Web development.

#### The con: Lagging security practices

However, software security still lags behind in spite of all the progress that is being made. We get to hear about major data breaches occurring around the world and often in large companies even to this day. One of the biggest data breaches happened at Equifax in 2017 on 13th May and was not discovered until 29th July! Once the breach was discovered, effective action was taken within 24 hours. However, a lot of sensitive data such as credit card details, social security numbers, and other important documents were accessed over the two-month period. According to some estimates, almost half of the American population was impacted.

#### Damages incurred due to poor security

In India, awareness about such security concerns is low, so the severity of this might be hard to grasp for us. These types of data breaches tend to occur from time to time in our country as well. Here are some of the major data breaches that have taken place in India just over the last year.

There was a data breach at Bigbasket in October 2021, which sacrificed the information of over 20 million people. Then there was a breach at Juspay, a payment gateway, in which over 35 million people’s primary information such as names and addresses, as well as financial details such as card numbers and banking credentials were revealed. In a security breach at Dominos, the data of over one million people was put at risk. Another major breach occurred very recently at Air India, where over 4.5 million people were affected.
According to research by IBM, it has been found that the average cost of a data breach is over 5 million US dollars. But what is interesting is that it is about 30 times cheaper to fix the defects during the development stage of software, compared to once it goes out into production. Though this is still a considerable amount of money, at least it saves companies from incurring a bigger loss.

So the people behind the development of DevOps are now fostering a new paradigm or a philosophy, which they term as ‘Dev + Sec + Ops’ (philosophy of integrated security practices within the DevOps process). This basically integrates security practices with the existing DevOps process and philosophy to make sure that security is the most important aspect in every stage of software development, and not an afterthought.

| Tools available at your disposal |
| :- |
| Some of the tools that are already being put to use in the DevOps toolchain can be used to manage DevSecOps too. No new tools are needed for DevSecOps. Tools such as Jira, Git, Gradle, and Selenium are a few that can be used for planning, coding, building and testing software. They are used in DevOps but are compliant with DevSecOps as well — it is just a matter of how they are implemented. Tools such as Puppet, Chef, and Sensu can be used for deployment, operation and monitoring (refer to Figure 2). |

#### What exactly is DevSecOps?

DevSecOps is still in its early phases and is continuing to mature. There are already a whole bunch of tools available, but there is still plenty of work to be done. The first important aspect that it covers is that it helps in identifying the security issues, unlike in DevOps where these are generally just an afterthought. The security team goes through a higher level of overview and makes sure that security is on point, before giving the final nod in the development process.

DevSecOps also gives speed and agility to the security team so they can figure out the issues right from the word go rather than finding them at the end. It allows them to respond to the changes rapidly when there are a lot of new laws that have to be abided by such as the General Data Protection Regulation (GDPR). When the security team is involved from the beginning, it helps them to deal with issues more swiftly. More importantly, it helps to create more automated builds, and more QA testing can be done.

Automating the entire process in DevOps is a very crucial aspect, and is one of the core pillars on which it stands today. The more things can be structured and automated the better the software is, as it tends to be more scalable that way. Automation helps in maintaining better communication between the security and development teams, which is something DevOps has always advocated.

![Figure 1: Detailed DevOps workflow][2]

Figure 1 depicts the workflow that DevOps usually advocates, on top of which the layers of security are supposed to be added at the planning stage. This is the stage at which the security team is already thinking about what kind of threat model policies they want to build in, and the issues that they could possibly encounter when deploying the final product.
Once the coding pipeline where code is being generated is reached, the static analysis and code reviews are to be done dynamically. When it gets into testing, the security team must make sure that the code is hardened against the known vulnerabilities. This will significantly lower the risk of attacks. Some kind of pen testing can be done while making sure that the security planning happens at the planning stage itself and not at the test stage.

Once the code is ready to be deployed, it is essential to continuously monitor and assess it for any kind of threats and vulnerabilities so that the application is not impacted. It must also meet all necessary compliances.

![Figure 2: Integration of various DevOps tools with DevSecOps tools][3]

#### The benefits of using security as code

As much as the automation of the entire workflow is important, there is an extent to which it can be done using tools. Managing a single server manually is not a big deal, but to manage tens of thousands of servers together every day can be super challenging. A code can be put in place in the form of an application, which can very easily manage these servers on its own. It can be instructed to do so according to the required security protocol. Let us look at some of the benefits of using security as code.

*Collaboration:* A code is an unambiguous common language that can be understood by literally everyone, even if a person doesn’t have any prior understanding of it. Anyone can learn to code and it will perform the same way wherever it is implemented. This makes it significantly easier to work with people from all walks of life.

*Scalability:* It is highly scalable. Irrespective of the number of servers or nodes being managed, a piece of code is going to perform the same way wherever it has been deployed. This leaves almost no room for error and minimises the risk of malfunctions.

*Visibility:* Since the code is always visible, it can be edited anytime it is necessary to do so. Whenever there is a bug that might cause any kind of hindrance, it can be rectified very easily without any significant damage. It can be altered at will at any given point of time.

It’s a no-brainer that security shall always be the utmost priority for anything that you do on the Web, and anything that comprises system hardware and software. Weak security can lead to irreversible losses. Hence, it becomes imperative for developers to implement foolproof security using evolving philosophies like DevSecOps.

*Transcribed and curated by Laveesh Kocher*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/devsecops-a-philosophy-that-puts-security-first/

作者：[Jonathan Pereira][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jonathan-pereira/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/DevSecOps-featured.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-1-Detailed-DevOps-workflow.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-2-Integration-of-various-DevOps-tools-with-DevSecOps-tools.jpg
