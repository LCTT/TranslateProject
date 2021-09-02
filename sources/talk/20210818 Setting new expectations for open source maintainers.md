[#]: subject: "Setting new expectations for open source maintainers"
[#]: via: "https://opensource.com/article/21/8/open-source-maintainers"
[#]: author: "Luis Villa https://opensource.com/users/luis"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Setting new expectations for open source maintainers
======
The continued maturation of open source has regularly placed new burdens
on maintainers.
![Practicing empathy][1]

For a long time, there were two basic tests for releasing open source: "Does it do what I need it to do?" and "Does it compile?"

Sure, it was nice if it did things for others, but more than anything else, it at least needed to be fun for the developer and run at all for others. Then with the rise of package management, things leveled up a bit: "Is it packaged?" Shortly after that, the increasing popularity of [test-driven development][2] added another requirement: "Do the tests pass?"

Each of these new requirements made more work for open source maintainers, but (by and large) maintainers didn't grump too much about them. I think this happened for two reasons: First, the work was often aligned with skills developers needed to learn for their jobs, and second, they were broadly perceived as beneficial for all users of the software, not just corporate developers.

But that is changing—and in ways that may not work out so well for open source and enterprises.

### The new enterprise burdens

Here in 2021, it's clear that a new set of standards for open source is coalescing. These bring new labor to be done, either by open source developers or as part of a metadata overlay. These new standards include: 

  * **Security information and auditing**: Security assessments of open source packages have traditionally been carried out by third parties, either through in-house security teams or by the distributed process coordinated through the [MITRE Common Vulnerabilities and Exposures][3] database. With new security training like the Linux Foundation's CII badges and projects like OpenSSF and Google's SLSA, the new buzzword is "end to end"—meaning maintainers and projects must make themselves security experts and create security controls. While this is almost certainly a good idea for the industry overall, it's yet more work expectations with no immediate prospect of compensation.
  * **Legal metadata**: Traditionally, open source communities like GNU, Debian, and Fedora believed (with good reason) that the default level of mandatory licensing metadata was at the package level, with per-file licensing information often disfavored at best and unrepresentable at worst. SPDX, followed more recently by clearlydefined.io, has decided that license information must be complete, machine-readable, and accurate in every file. This is clearly correct for all users, but the vast majority of the benefit accrues the most deep-pocketed enterprises in practice. In the meantime, if we want accurate global coverage, the vast majority of the burden will fall on maintainers and require intricate legal assessment. (Adding these to the Linux kernel [took literally years][4].)
  * **Procurement information**: The newest ask from the industry is to provide Software Bills of Material (SBOM) throughout the software stack—which inevitably includes vast quantities of open source. Again, this is not entirely unreasonable, and indeed open source has long led the way here via the package management techniques that open source language communities pioneered. But the completeness of coverage and depth of information being demanded (including, in some proposals, [information about the identity of developers][5]) is a step-change in what is required—primarily to benefit the governments and massive enterprises that can afford to do the detailed, package-by-package analysis of software provenance.



This new work may be quite different from previous waves of new obligations for open source developers—and we should think about why that is and what we might do about it.

### Is this work going to work?

As I suggested in the opening to this piece, the continued maturation of open source has regularly placed new burdens on maintainers. (At Mozilla, we used to call these "table stakes"—a poker term, indicating the things you had to do to even sit at the poker table, or in tech terms, to be considered for enterprise use.) So in some sense, this new wave of obligations is nothing new. But I do want to suggest that in two significant ways, these new mandates are problematic.

First, this work is increasingly highly specialized and so less helpful for individual maintainers to learn. The strongest open source developers have always had diverse skills (not just coding, but also marketing, people management, etc.). That's been part of the draw of open source—you learn those things along the way, making you a better developer. But when we start adding more and more requirements that specialists (e.g., a legal team or a security team) would cover in a corporate setting, we reduce the additional value to developers of participating in open source.

To put it another way: Developers clearly serve their self-interest by learning basic programming and people skills. It is less clear that they serve their self-interests by becoming experts in issues that, in their day jobs, are likely delegated to experts, like procurement, legal, and security. This works out fine in open source projects big enough to have large, sophisticated teams, but those are rare (even though they gather the lion's share of press and attention).

Second, these new and increasingly specialized requirements primarily benefit a specific class of open source users—large enterprises. That isn't necessarily a bad thing—big enterprises are essential in many ways, and indeed, the risks to them deserve to be taken seriously.

But in a world where hundreds of billions of dollars in enterprise value have been created by open source, and where small educational/hobby projects (and even many small companies) don't really benefit from these new unfunded mandates, developers will likely focus on other things, since few of them got into open source primarily to benefit the Fortune 500. 

In other words, many open source developers enjoy building things that benefit themselves and their friends and are even willing to give up nights and weekends for that. If meeting these new requirements mostly benefits faceless corporations, we may need to find other carrots to encourage developers to create and maintain new open source projects.

![Tidelift 2021 maintainer survey results][6]

According to the Tidelift 2021 open source maintainer survey, open source maintenance work is often stressful, thankless, and financially unrewarding.
 ([Tidelift][7])

### Why "unfunded mandate?"

In U.S. politics, an "unfunded mandate" occurs when a government requires someone else (usually a lower-level government) to do new work while not funding the new work. Bradley M. Kuhn gave me the inspiration to use the term "unfunded mandate" in [a recent Twitter post][8].

Sometimes, unfunded mandates can be good—many times, they are used to create equity and justice programs, for example, that local governments really should be doing as a matter of course. Arguably, many security initiatives fall into this category—burdensome, yes, but necessary for all of us to use the internet effectively.

But other times, they just create work for small entities that are already overwhelmed juggling the responsibilities of modern governance. If that sounds familiar to open source developers, no surprise—[they're already burnt out][7], and this is creating more work without creating more time or money.

![Tidelift survey results showing half of maintainers quit because of burnout.][9]

According to the Tidelift 2021 managed open source survey, more than half of maintainers have quit or considered quitting because they were experiencing burnout.
([Tidelift][10])

### Aligning incentives—by paying the maintainers

We were pleased to see Google call this issue out in [a recent filing on SBOMs][11] with the National Telecommunications and Information Administration (NTIA).

> "Unfortunately, much of the burden of maintaining our digital infrastructure falls on the backs of unpaid, volunteer contributors. The NTIA should carefully evaluate ways to fund and assist these communities as they work with industry to comply with new regulations."

Tidelift's filling to the same NTIA call for comments made similar points about money, scale, and reliability. In response, in [its own summary][12], the NTIA acknowledged that "funding sources" are a challenge and also said: 

> "Further research is necessary to understand the optimal … incentives for sharing, protecting, and using SBOM data."

Given the dynamic of increasing professionalization—or to put it more bluntly, increasing work—that I've described above, it is refreshing to see an acknowledgment from significant industry players that developer incentives should be considered as we move into the next era of open source. We, as an industry, must figure out how to address this together, or we'll both fail to reach our goals and burn out developers—the worst of all worlds.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/open-source-maintainers

作者：[Luis Villa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/luis
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/practicing-empathy.jpg?itok=-A7fj6NF (Practicing empathy)
[2]: https://opensource.com/article/20/1/test-driven-development
[3]: https://cve.mitre.org/
[4]: https://lwn.net/Articles/739183/
[5]: https://security.googleblog.com/2021/02/know-prevent-fix-framework-for-shifting.html
[6]: https://opensource.com/sites/default/files/pictures/tidelift-survey-2021-1.png (Tidelift 2021 maintainer survey results)
[7]: https://blog.tidelift.com/finding-4-open-source-maintenance-work-is-often-stressful-thankless-and-financially-unrewarding
[8]: https://twitter.com/richardfontana/status/1408170067594985474
[9]: https://opensource.com/sites/default/files/pictures/tidelift-survey-2021-2.png (Tidelift 2021 maintainer survey results about burnout)
[10]: https://blog.tidelift.com/finding-5-more-than-half-of-maintainers-have-quit-or-considered-quitting-and-heres-why
[11]: https://www.ntia.doc.gov/files/ntia/publications/google_-_2021.06.17.pdf
[12]: https://www.ntia.gov/files/ntia/publications/sbom_minimum_elements_report.pdf
