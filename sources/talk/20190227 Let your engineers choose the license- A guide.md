[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Let your engineers choose the license: A guide)
[#]: via: (https://opensource.com/article/19/2/choose-open-source-license-engineers)
[#]: author: (Jeffrey Robert Kaufman https://opensource.com/users/jkaufman)

Let your engineers choose the license: A guide
======
Enabling engineers to make licensing decisions is wise and efficient.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

Imagine you are working for a company that will be starting a new open source community project. Great! You have taken a positive first step to give back and enable a virtuous cycle of innovation that the open source community-based development model provides.

But what about choosing an open source license for your project? You ask your manager for guidance, and she provides some perspective but quickly realizes that there is no formal company policy or guidelines. As any wise manager would do, she asks you to develop formal corporate guidelines for choosing an open source license for such projects.

Simple, right? You may be surprised to learn some unexpected challenges. This article will describe some of the complexities you may encounter and some perspective based on my recent experience with a similar project at Red Hat.

It may be useful to quickly review some of the more common forms of open source licensing. Open source licenses may be generally placed into two main buckets, copyleft and permissive.

> Copyleft licenses, such as the GPL, allow access to source code, modifications to the source, and distribution of the source or binary versions in their original or modified forms. Copyleft additionally provides that essential software freedoms (run, study, change, and distribution) will be allowed and ensured for any recipients of that code. A copyleft license prohibits restrictions or limitations on these essential software freedoms.
>
> Permissive licenses, similar to copyleft, also generally allow access to source code, modifications to the source, and distribution of the source or binary versions in their original or modified forms. However, unlike copyleft licenses, additional restrictions may be included with these forms of licenses, including proprietary limitations such as prohibiting the creation of modified works or further distribution.

Red Hat is one of the leading open source development companies, with thousands of open source developers continuously working upstream and contributing to an assortment of open source projects. When I joined Red Hat, I was very familiar with its flagship Red Hat Enterprise Linux offering, often referred to as RHEL. Although I fully expected that the company contributes under a wide assortment of licenses based on project requirements, I thought our preference and top recommendation for our engineers would be GPLv2 due to our significant involvement with Linux. In addition, GPL is a copyleft license, and copyleft ensures that the essential software freedoms (run, study, change, distribute) will be extended to any recipients of that code. What could be better for sustaining the open source ecosystem than a copyleft license?

Fast forwarding on my journey to craft internal license choice guidelines for Red Hat, the end result was to not have any license preference at all. Instead, we delegate that responsibility, to the maximum extent possible, to our engineers. Why? Because each open source project and community is unique and there are social aspects to these communities that may have preferences towards various licensing philosophies (e.g., copyleft or permissive). Engineers working in those communities understand all these issues and are best equipped to choose the proper license on this knowledge. Mandating certain licenses for code contributions often will conflict with these community norms and result in reduction or prohibition in contributed content.

For example, perhaps your organization believes that the latest GPL license (GPLv3) is the best for your company due to its updated provisions. If you mandated GPLv3 for all future contributions vs. GPLv2, you would be prohibited from contributing code to the Linux kernel, since that is a GPLv2 project and will likely remain that way for a very long time. Your engineers, being part of that open source community project, would know that and would automatically choose GPLv2 in the absence of such a mandate.

Bottom line: Enabling engineers to make these decisions is wise and efficient.

To the extent your organization may have to restrict the use of certain licenses (e.g., due to certain intellectual property concerns), this should naturally be part of your guidelines or policy. I believe it is much better to delegate to the maximum extent possible to those that understand all the nuances, politics, and licensing philosophies of these varied communities and restrict license choice only when absolutely necessary. Even having a preference for a certain license over another can be problematic. Open source engineers may have deeply rooted feelings about copyleft (either for or against), and forcing one license over the other (unless absolutely necessary for business reasons) may result in creating ill-will and ostracizing an engineer or engineering department within your organization

In summary, Red Hat's guidelines are very simple and are summarized below:

  1. We suggest choosing an open source license from a set of 10 different licenses that are very common and meet the needs of most new open source projects.

  2. We allow the use of other licenses but we ask that a reason is provided to the open source legal team so we can collect and better understand some of the new and perhaps evolving needs of the open source communities that we serve. (As stated above, our engineers are on the front lines and are best equipped to deliver this type of information.)

  3. The open source legal team always has the right to override a decision, but this would be very rare and only would occur if we were aware of some community or legal concern regarding a specific license or project.

  4. Publishing source code without a license is never permitted.

In summary, the advantages of these guidelines are enormous. They are very efficient and lead to a very low-friction development and approval system within our organization.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/choose-open-source-license-engineers

作者：[Jeffrey Robert Kaufman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkaufman
[b]: https://github.com/lujun9972
