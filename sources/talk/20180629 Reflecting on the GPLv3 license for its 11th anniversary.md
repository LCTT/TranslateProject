Reflecting on the GPLv3 license for its 11th anniversary
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_vaguepatent_520x292.png?itok=_zuxUwyt)

Last year, I missed the opportunity to write about the 10th anniversary of [GPLv3][1], the third version of the GNU General Public License. GPLv3 was officially released by the Free Software Foundation (FSF) on June 29, 2007—better known in technology history as the date Apple launched the iPhone. Now, one year later, I feel some retrospection on GPLv3 is due. For me, much of what is interesting about GPLv3 goes back somewhat further than 11 years, to the public drafting process in which I was an active participant.

In 2005, following nearly a decade of enthusiastic self-immersion in free software, yet having had little open source legal experience to speak of, I was hired by Eben Moglen to join the Software Freedom Law Center as counsel. SFLC was then outside counsel to the FSF, and my role was conceived as focusing on the incipient public phase of the GPLv3 drafting process. This opportunity rescued me from a previous career turn that I had found rather dissatisfying. Free and open source software (FOSS) legal matters would come to be my new specialty, one that I found fascinating, gratifying, and intellectually rewarding. My work at SFLC, and particularly the trial by fire that was my work on GPLv3, served as my on-the-job training.

GPLv3 must be understood as the product of an earlier era of FOSS, the contours of which may be difficult for some to imagine today. By the beginning of the public drafting process in 2006, Linux and open source were no longer practically synonymous, as they might have been for casual observers several years earlier, but the connection was much closer than it is now.

Reflecting the profound impact that Linux was already having on the technology industry, everyone assumed GPL version 2 was the dominant open source licensing model. We were seeing the final shakeout of a Cambrian explosion of open source (and pseudo-open source) business models. A frothy business-fueled hype surrounded open source (for me most memorably typified by the Open Source Business Conference) that bears little resemblance to the present-day embrace of open source development by the software engineering profession. Microsoft, with its expanding patent portfolio and its competitive opposition to Linux, was commonly seen in the FOSS community as an existential threat, and the [SCO litigation][2] had created a cloud of legal risk around Linux and the GPL that had not quite dissipated.

That environment necessarily made the drafting of GPLv3 a high-stakes affair, unprecedented in free software history. Lawyers at major technology companies and top law firms scrambled for influence over the license, convinced that GPLv3 was bound to take over and thoroughly reshape open source and all its massive associated business investment.

A similar mindset existed within the technical community; it can be detected in the fears expressed in the final paragraph of the Linux kernel developers' momentous September 2006 [denunciation][3] of GPLv3. Those of us close to the FSF knew a little better, but I think we assumed the new license would be either an overwhelming success or a resounding failure—where "success" meant something approximating an upgrade of the existing GPLv2 project ecosystem to GPLv3, though perhaps without the kernel. The actual outcome was something in the middle.

I have no confidence in attempts to measure open source license adoption, which have in recent years typically been used to demonstrate a loss of competitive advantage for copyleft licensing. My own experience, which is admittedly distorted by proximity to Linux and my work at Red Hat, suggests that GPLv3 has enjoyed moderate popularity as a license choice for projects launched since 2007, though most GPLv2 projects that existed before 2007, along with their post-2007 offshoots, remained on the old license. (GPLv3's sibling licenses LGPLv3 and AGPLv3 never gained comparable popularity.) Most of the existing GPLv2 projects (with a few notable exceptions like the kernel and Busybox) were licensed as "GPLv2 or any later version." The technical community decided early on that "GPLv2 or later" was a politically neutral license choice that embraced both GPLv2 and GPLv3; this goes some way to explain why adoption of GPLv3 was somewhat gradual and limited, especially within the Linux community.

During the GPLv3 drafting process, some expressed concerns about a "balkanized" Linux ecosystem, whether because of the overhead of users having to understand two different, strong copyleft licenses or because of GPLv2/GPLv3 incompatibility. These fears turned out to be entirely unfounded. Within mainstream server and workstation Linux stacks, the two licenses have peacefully coexisted for a decade now. This is partly because such stacks are made up of separate units of strong copyleft scope (see my discussion of [related issues in the container setting][4]). As for incompatibility inside units of strong copyleft scope, here, too, the prevalence of "GPLv2 or later" was seen by the technical community as neatly resolving the theoretical problem, despite the fact that nominal license upgrading of GPLv2-or-later to GPLv3 hardly ever occurred.

I have alluded to the handwringing that some of us FOSS license geeks have brought to the topic of supposed copyleft decline. GPLv3 has taken its share of abuse from critics as far back as the beginning of the public drafting process, and some, predictably, have drawn a link between GPLv3 in particular and GPL or copyleft disfavor in general.

I have viewed it somewhat differently: Largely because of its complexity and baroqueness, GPLv3 was a lost opportunity to create a strong copyleft license that would appeal very broadly to modern individual software authors and corporate licensors. I believe individual developers today tend to prefer short, simple, easy to understand, minimalist licenses, the most obvious example of which is the [MIT License][5].

Some corporate decisionmakers around open source license selection may naturally share that view, while others may associate some parts of GPLv3, such as the patent provisions or the anti-lockdown requirements, as too risky or incompatible with their business models. The great irony is that the characteristics of GPLv3 that fail to attract these groups are there in part because of conscious attempts to make the license appeal to these same sorts of interests.

How did GPLv3 come to be so baroque? As I have said, GPLv3 was the product of an earlier time, in which FOSS licenses were viewed as the primary instruments of project governance. (Today, we tend to associate governance with other kinds of legal or quasi-legal tools, such as structuring of nonprofit organizations, rules around project decision making, codes of conduct, and contributor agreements.)

GPLv3, in its drafting, was the high point of an optimistic view of FOSS licenses as ambitious means of private regulation. This was already true of GPLv2, but GPLv3 took things further by addressing in detail a number of new policy problems—software patents, anti-circumvention laws, device lockdown. That was bound to make the license longer and more complex than GPLv2, as the FSF and SFLC noted apologetically in the first GPLv3 [rationale document][6].

But a number of other factors at play in the drafting of GPLv3 unintentionally caused the complexity of the license to grow. Lawyers representing vendors' and commercial users' interests provided useful suggestions for improvements from a legal and commercial perspective, but these often took the form of making simply worded provisions more verbose, arguably without net increases in clarity. Responses to feedback from the technical community, typically identifying loopholes in license provisions, had a similar effect.

The GPLv3 drafters also famously got entangled in a short-term political crisis—the controversial [Microsoft/Novell deal][7] of 2006—resulting in the permanent addition of new and unusual conditions in the patent section of the license, which arguably served little purpose after 2007 other than to make license compliance harder for conscientious patent-holding vendors. Of course, some of the complexity in GPLv3 was simply the product of well-intended attempts to make compliance easier, especially for community project developers, or to codify FSF interpretive practice. Finally, one can take issue with the style of language used in GPLv3, much of which had a quality of playful parody or mockery of conventional software license legalese; a simpler, straightforward form of phrasing would in many cases have been an improvement.

The complexity of GPLv3 and the movement towards preferring brevity and simplicity in license drafting and unambitious license policy objectives meant that the substantive text of GPLv3 would have little direct influence on later FOSS legal drafting. But, as I noted with surprise and [delight][8] back in 2012, MPL 2.0 adapted two parts of GPLv3: the 30-day cure and 60-day repose language from the GPLv3 termination provision, and the assurance that downstream upgrading to a later license version adds no new obligations on upstream licensors.

The GPLv3 cure language has come to have a major impact, particularly over the past year. Following the Software Freedom Conservancy's promulgation, with the FSF's support, of the [Principles of Community-Oriented GPL Enforcement][9], which calls for extending GPLv3 cure opportunities to GPLv2 violations, the Linux Foundation Technical Advisory Board published a [statement][10], endorsed by over a hundred Linux kernel developers, which incorporates verbatim the cure language of GPLv3. This in turn was followed by a Red Hat-led series of [corporate commitments][11] to extend the GPLv3 cure provisions to GPLv2 and LGPLv2.x noncompliance, a campaign to get individual open source developers to extend the same commitment, and an announcement by Red Hat that henceforth GPLv2 and LGPLv2.x projects it leads will use the commitment language directly in project repositories. I discussed these developments in a recent [blog post][12].

One lasting contribution of GPLv3 concerns changed expectations for how revisions of widely-used FOSS licenses are done. It is no longer acceptable for such licenses to be revised entirely in private, without opportunity for comment from the community and without efforts to consult key stakeholders. The drafting of MPL 2.0 and, more recently, EPL 2.0 reflects this new norm.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/gplv3-anniversary

作者：[Richard Fontana][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/fontana
[1]:https://www.gnu.org/licenses/gpl-3.0.en.html
[2]:https://en.wikipedia.org/wiki/SCO%E2%80%93Linux_disputes
[3]:https://lwn.net/Articles/200422/
[4]:https://opensource.com/article/18/1/containers-gpl-and-copyleft
[5]:https://opensource.org/licenses/MIT
[6]:http://gplv3.fsf.org/gpl-rationale-2006-01-16.html
[7]:https://en.wikipedia.org/wiki/Novell#Agreement_with_Microsoft
[8]:https://opensource.com/law/12/1/the-new-mpl
[9]:https://sfconservancy.org/copyleft-compliance/principles.html
[10]:https://www.kernel.org/doc/html/v4.16/process/kernel-enforcement-statement.html
[11]:https://www.redhat.com/en/about/press-releases/technology-industry-leaders-join-forces-increase-predictability-open-source-licensing
[12]:https://www.redhat.com/en/blog/gpl-cooperation-commitment-and-red-hat-projects?source=author&term=26851
