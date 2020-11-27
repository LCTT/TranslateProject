[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How open source legal teams can get to yes)
[#]: via: (https://opensource.com/article/20/9/advice-open-source-lawyer)
[#]: author: (Jeffrey Robert Kaufman https://opensource.com/users/jkaufman)

How open source legal teams can get to yes
======
Open source law has unusual requirements for success. Learn ways lawyers
can help their organizations find a path to open.
![whiteboard collaboration with the team][1]

As I shared in the [first part][2] of this two-part series, I am an open source lawyer for Red Hat. One important part of my job is to provide information to other companies, including their in-house counsel, about how Red Hat builds enterprise-class products with a completely open source development model and to answer their questions about open source licensing in general. After hearing about Red Hat's success, these conversations often turn to discussions about how their organization can evolve to be more open source-aware and capable, and lawyers at these meetings regularly ask how they can modify their practices to be more skilled in providing open source counsel to their employees. In these two articles, I'll share what I normally tell in-house counsel on these topics.

### Always find a path to open

My employer, Red Hat, is unique in its use of open source software in that our development model begins in the open source community with thousands of contributors and results in finished products that are tried, tested, and trusted. More specifically, through our unique development model, we start with community-created open source software and build upon each project to harden security, fix bugs, patch vulnerabilities, and add new features. We then contribute these improvements back to each project, so the entire open source community can benefit. The utilities to this approach are significant, including:

  1. Leveraging innovation from others outside your organization by collaborating outside your internal teams
  2. Avoiding the cost and inefficiency of developing and maintaining an open source solution by yourself when there are existing or potential communities working on the same problem with which you could collaborate
  3. Through productive collaboration with partners and upstream project communities, avoiding the costly consequences of maintaining a downstream fork of the main project
    1. Some companies find it tempting to create non-public forks of upstream code as a quick way to address a specific use case or because they are not inclined to collaborate in a community. However, the long-term maintenance burdens of such forks can be prohibitive because of increased development costs, loss of interoperability, and other reasons. By contrast, concentrating development in the original upstream community enables sharing development costs among all participants.



With few exceptions (such as Red Hat), most organizations that may use open source software have a proprietary licensing model (or the equivalent concept for software-as-a-service companies) and license proprietary software as part of their business. Such organizations feel that they have software components that provide some competitive advantage and do not wish to see those become available to others under open source terms. That is understandable. I would, however, encourage any open source lawyers counseling such companies to urge their clients towards an open source development model, especially for any software bits that are non-differentiating and common.

For example, if your company develops applications for mobile phones and you need a software module to read and write PNG image files, it would be much less expensive to use one of the popular open source PNG software modules available on GitHub. Encoding and decoding PNG images is likely a non-differentiating element to your business, so why spend precious engineering time to write your own version? Furthermore, writing your own module for this function may also lead to compatibility issues with other software that uses a commonly used open source module. Why? Although your module and the open source module may have been written to encode and decode to the published PNG specifications, oftentimes, there may be different interpretations of the specifications or errors in implementation. Everyone using the same module for this function ensures compatibility for most users and lowers the cost of development and maintenance.

It must also be appreciated that certain software may be required to remain proprietary and not subject to open source terms. Depending on the software architecture of your system and the open source software licenses in use, software bits that are intended to remain proprietary may become subject to open source license terms unless certain actions are taken (beyond the scope of this article). This is where some counseling to clients about license choice and architecture will become useful.

### Develop scalable solutions

For organizations that primarily license proprietary software grow and increase their use of open source software, review and approval requirements may grow (even exponentially in my experience). As such, such an organization may find itself in a difficult situation due to resource constraints. Scalable solutions that must be put into place are described below.

#### Empower and delegate to others

Lawyers cannot and should not be gatekeepers. It is inefficient and will most certainly cause bottlenecks in development and release times, producing frustration and lost revenue. Instead, explore delegating authority to capable individuals in product or project management and engineering. This allows an organization to scale efficiently and effectively. Educating your clients (see the next section) is vitally important for this to succeed.

One approach I have taken is to provide open source training to entire engineering organizations so that they can make basic licensing and architecture choices, while providing more specialized training to software leads to enable them to provide more complex guidance and decisions. Consider providing clear limits on authority at each level, including what types of issues and decisions must be escalated to you as their open source legal attorney. The specific levels of delegation for your organization will be a function of your team's experience with open source and sensitivities to certain open source concerns.

#### Educate clients

I have found that training is one of the most effective tools to migrate your organization to be more open source-aware. Training your software engineers and product managers is crucially important. Let me elaborate.

Although your software engineers are on the frontlines and may be quite knowledgeable about open source issues and licensing in general, it is still important to train them on your organization's particular requirements. For example, your company may permit only permissive open source licenses to be used and may have certain requirements for its copyright notices and source availability. To avoid problems in development that must be corrected later (a costly and time-consuming exercise), it is best to train engineers to minimize the likelihood of improper behavior, especially at the beginning of any development process (see the next section).

Product managers must also be trained. In many companies, a product manager is responsible for the classic four P's of marketing—Product, Price, Position, and Promotion—and is accountable for the full lifecycle of a product from cradle to death. All these aspects of a product manager's job may be impacted by the use of open source software. Understanding the requirements when using open source software is useful to them for the same reasons mentioned above. In addition and more importantly, product managers' significant influence in an organization means they are often able to effectuate any required change to process and policy. Product managers may become one of your strongest advocates for instituting process changes towards "open".

#### Early detection

It is very difficult and costly to resolve open source licensing issues near the end of the development process. As software approaches its release date, the architecture and the open source software modules have already been chosen. If an issue is detected, such as a copyleft software embedded in a proprietary software module (when that proprietary module is intended to not be subject to open source terms), modifying the architecture or modules at that development phase could be very difficult and expensive. Instead, work on developing processes that analyze architecture and choice of open source modules early in the process so that less costly and more effective course corrections may be made.

### Open source law's rewards

Practicing open source law is a rewarding profession due to the ability to influence an organization towards "open," which has significant benefits. Success depends on your ability to develop solutions for your organization that are workable and scalable as your organization grows and matures.

Find out what it takes to become an open source lawyer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/advice-open-source-lawyer

作者：[Jeffrey Robert Kaufman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkaufman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/whiteboard-collaboration-team.png?itok=0A3WcgxZ (whiteboard collaboration with the team)
[2]: https://opensource.com/article/20/7/transitioning-open-source-part-1
