[#]: subject: "StackAid Helps Developers Fund Hundreds of Open-Source Project Dependencies in No Time"
[#]: via: "https://news.itsfoss.com/stackaid-beta/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

StackAid Helps Developers Fund Hundreds of Open-Source Project Dependencies in No Time
======
StackAid is an interesting initiative to help developers/contributors fund open-source project dependencies.

![StackAid Helps Developers Fund Hundreds of Open-Source Project Dependencies in No Time][1]

Free and open-source projects empower you with essential tools and services without spending a dime.

While that sounds exciting, these projects need funding to keep things running and potentially improve your experience with it.

Fortunately, we have several platforms to support and fund open-source projects:

[Easily Fund Open Source Projects With These Platforms - It’s FOSS][2]

But, how can the maintainers/contributors fund the **dependencies associated with their projects?**

There are potentially hundreds of dependencies in a single project. So, to start funding, some daunting tasks include:

* Responsibility of supporting open-source projects.
* Selecting a project to fund.
* Deciding on the donation subscription tier for funding for each project.
* Keep track of dependencies to fund.

Interestingly, there is a service that **solves the problem, i.e. StackAid.**

### StackAid: What Does it Do?

> ⚠️ StackAid is not an open-source service, and it's in beta phase, targeted for developers and project contributors who want to fund the dependencies linked to their projects.

StackAid aims to help you quickly fund the dependencies of your project in one go.

It finds your project's dependencies (**direct and indirect**) through its GitHub app (**invite-only access**) and allocate funds as per your subscription to distribute it among them.

![][4]

The subscription to StackAid starts at **$15**.

You require your project's **package.json**file or generate a **stackaid.json** file (using [GitHub action][5]) to automate listing the dependencies. Of course, you can edit the list manually and add more as well.

You also get the ability to select the dependencies you want to support.

![][6]

It then automates the funding allocation by evenly distributing your subscription fee among various dependencies.

Note that StackAid receives the same amount as a direct dependency out of the subscription fee to make money. However, the maximum it takes is **7.5%** of the total subscription fee.

### How Do Open-Source Projects Get the Money?

StackAid explains that the open-source projects can claim their repositories by installing the StackAid GitHub app.

We reached out to them to clarify how the repository owners will get notified/know about StackAid in the first place. And, this was the response:

StackAid mentions that if a project does not claim the amount allocated to them by subscribers, the amount gets re-allocated to other dependencies that are claimed. This is a good thing.

You can explore more on their website.

[StackAid][7]

The concept sounds nice. And, it will be interesting if this can be a platform for users in the near future (not just developers or maintainers).

*💬 What do you think about StackAid? Kindly let us know your thoughts in the comments.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/stackaid-beta/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/stackaid.jpg
[2]: https://itsfoss.com/open-source-funding-platforms/
[4]: https://news.itsfoss.com/content/images/2022/09/stackaid_dashboard-1.png
[5]: https://github.com/marketplace/actions/stackaid-dependency-generator
[6]: https://news.itsfoss.com/content/images/2022/09/stackaid_dashboard_manage.png
[7]: https://www.stackaid.us/
