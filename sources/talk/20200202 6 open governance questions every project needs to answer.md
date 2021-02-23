[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 open governance questions every project needs to answer)
[#]: via: (https://opensource.com/article/20/2/open-source-projects-governance)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)

6 open governance questions every project needs to answer
======
Open governance insights from Chris Aniszczyk, VP of Developer Relations
at the Linux Foundation.
![Two government buildings][1]

When we think about what needs to be in place for an open source project to function, one of the first things to come to mind is probably a license. For one thing, absent an approved [Open Source Initiative (OSI) license][2], a project isn’t truly open source in the minds of many. Furthermore, the choice to use a copyleft license like the GNU General Public License (GPL) or a permissive license like Massachusetts Institute of Technology (MIT) can affect the sort of community that grows up around and uses the project.

However, Chris Aniszczyk, VP of Developer Relations at the Linux Foundation, argues that it’s equally important to consider the **open governance of a project** because the license itself doesn’t actually tell you how the project is governed.

These are some of the questions that Aniszczyk argues need be answered. He adds that answering these questions before disputes arise, and answering them in a way that’s viewed as open and fair to all participants leads to projects that tend to be more successful long term, especially as they grow in size.

### 6 open governance questions for every project

  1. Who makes the decisions?
  2. How are maintainers added?
  3. Who owns the rights to the domain?
  4. Who owns the rights to the trademarks?
  5. How are those things governed?
  6. Who owns how the build system works?



However, while all of these questions should be considered, there isn’t one correct way of answering them. Different projects—and foundations hosting projects—take different approaches, whether to accommodate the requirements of a particular community or just for historical reasons.

The latter is often the case when a project uses something often called the Benevolent Dictator for Life (BDFL) model, in which one person—usually the project's founder—generally has the final say on major project decisions. Many projects end up here by default—perhaps most notably the Linux kernel. However, Red Hat’s Joe Brockmeier observed to me that it’s mostly considered an anti-pattern at this point. "While a few BDFL-driven projects have succeeded to do well, others have stumbled with that approach," he says.

Aniszczyk observes that "foundations have different sets of bylaws, charters, and how they’re structured, and there are fascinating differences between these organizations. Like Apache is very famous for the Apache Way, and that’s how they expect projects to operate. They very much have guardrails about how releases are done. [It’s] kind of an incubator process where every project starts way before it graduates to a top-level project. In terms of how projects are governed, it’s almost like an infinite amount of approaches," he concludes.

### Minimum requirements

That said, Aniszczyk lists some minimum requirements.

"Our pattern, at least, in many Linux Foundation and Cloud Native Computing Foundation (CNCF) projects, is a _governance.md_ file, which describes how decisions are made, how things are governed, how maintainers are added, removed, how are sub-projects added, removed, etc., how releases are done. That would be step one," he says.

#### Ownership

Secondly, he doesn’t "think you could do open governance without assets being neutrally owned. At the end of the day, someone owns the domain, the rights to the trademark, some of the copyright, potentially. There are many great organizations out there that are super lightweight. There are things like the Apache Foundation, Software in the Public Interest, and the Software Freedom Conservancy."

Aniszczyk also sees some common approaches as at least potential anti-patterns. A key example is contributor license agreements (CLA), which define the terms under which intellectual property, like code, is contributed to a project. He says that if a company wants "to build a product or use a dual license type model, that’s a very valid reason for a CLA. Otherwise, I view CLA as a high friction tool for developers."

#### Developer Certificate of Origin

Instead, he generally encourages people to "use what we call the 'Developer Certificate of Origin.' It’s how the Linux kernel works, where basically it takes all the basic things that most CLAs do, which would be like, ‘Did I write this code? Did I not copy it elsewhere? Do I have the rights to give this to you, and you sign off on?’ It’s been a very successful model played out in the kernel and many other ecosystems. I’m generally not really supportive of having CLAs unless there’s a real strict business need."

#### Naming a project

He also sees a lot of what he considers mistakes in naming. "Project branding is super important. There’s a common pattern where people will start a project, it could be within a company or yourself, or you have a startup, and you’ll call it, let’s say, 'Docker.' Then you have Docker the project, and you have Docker, the company. Then you also have Docker the product or Docker the enterprise product. All those things serve different audiences. It leads to confusion because I have an inherent belief that the name of something has a value proposition attached to it. Please name your company separate from your project, from your product," he argues.

#### Trust

Finally, Aniszczyk points to the role of open governance in building trust and confidence that a company can’t just take a project unilaterally for its own ends. "Trust is table stakes in order to build strong communities because, without openly governed institutions in projects, trust is very hard to come by," he concludes.

_List to the Innovate @Open podcast episode from which Chris Aniszczyk’s remarks were drawn can be heard [here][3]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/open-source-projects-governance

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_lawdotgov2.png?itok=n36__lZj (Two government buildings)
[2]: https://opensource.org/licenses
[3]: https://grhpodcasts.s3.amazonaws.com/cra1911.mp3
