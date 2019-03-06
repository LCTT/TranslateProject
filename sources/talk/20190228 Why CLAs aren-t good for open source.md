[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why CLAs aren't good for open source)
[#]: via: (https://opensource.com/article/19/2/cla-problems)
[#]: author: (Richard Fontana https://opensource.com/users/fontana)

Why CLAs aren't good for open source
======
Few legal topics in open source are as controversial as contributor license agreements.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/write-hand_0.jpg?itok=Uw5RJD03)

Few legal topics in open source are as controversial as [contributor license agreements][1] (CLAs). Unless you count the special historical case of the [Fedora Project Contributor Agreement][2] (which I've always seen as an un-CLA), or, like [Karl Fogel][3], you classify the [DCO][4] as a [type of CLA][5], today Red Hat makes no use of CLAs for the projects it maintains.

It wasn't always so. Red Hat's earliest projects followed the traditional practice I've called "inbound=outbound," in which contributions to a project are simply provided under the project's open source license with no execution of an external, non-FOSS contract required. But in the early 2000s, Red Hat began experimenting with the use of contributor agreements. Fedora started requiring contributors to sign a CLA based on the widely adapted [Apache ICLA][6], while a Free Software Foundation-derived copyright assignment agreement and a pair of bespoke CLAs were inherited from the Cygnus and JBoss acquisitions, respectively. We even took [a few steps][7] towards adopting an Apache-style CLA across the rapidly growing set of Red Hat-led projects.

This came to an end, in large part because those of us on the Red Hat legal team heard and understood the concerns and objections raised by Red Hat engineers and the wider technical community. We went on to become de facto leaders of what some have called the anti-CLA movement, marked notably by our [opposition to Project Harmony][8] and our [efforts][9] to get OpenStack to replace its CLA with the DCO. (We [reluctantly][10] sign tolerable upstream project CLAs out of practical necessity.)

### Why CLAs are problematic

Our choice not to use CLAs is a reflection of our values as an authentic open source company with deep roots in the free software movement. Over the years, many in the open source community have explained why CLAs, and the very similar mechanism of copyright assignment, are a bad policy for open source.

One reason is the red tape problem. Normally, open source development is characterized by frictionless contribution, which is enabled by inbound=outbound without imposition of further legal ceremony or process. This makes it relatively easy for new contributors to get involved in a project, allowing more effective growth of contributor communities and driving technical innovation upstream. Frictionless contribution is a key part of the advantage open source development holds over proprietary alternatives. But frictionless contribution is negated by CLAs. Having to sign an unusual legal agreement before a contribution can be accepted creates a bureaucratic hurdle that slows down development and discourages participation. This cost persists despite the growing use of automation by CLA-using projects.

CLAs also give rise to an asymmetry of legal power among a project's participants, which also discourages the growth of strong contributor and user communities around a project. With Apache-style CLAs, the company or organization leading the project gets special rights that other contributors do not receive, while those other contributors must shoulder certain legal obligations (in addition to the red tape burden) from which the project leader is exempt. The problem of asymmetry is most severe in copyleft projects, but it is present even when the outbound license is permissive.

When assessing the arguments for and against CLAs, bear in mind that today, as in the past, the vast majority of the open source code in any product originates in projects that follow the inbound=outbound practice. The use of CLAs by a relatively small number of projects causes collateral harm to all the others by signaling that, for some reason, open source licensing is insufficient to handle contributions flowing into a project.

### The case for CLAs

Since CLAs continue to be a minority practice and originate from outside open source community culture, I believe that CLA proponents should bear the burden of explaining why they are necessary or beneficial relative to their costs. I suspect that most companies using CLAs are merely emulating peer company behavior without critical examination. CLAs have an understandable, if superficial, appeal to risk-averse lawyers who are predisposed to favor greater formality, paper, and process regardless of the business costs. Still, some arguments in favor of CLAs are often advanced and deserve consideration.

**Easy relicensing:** If administered appropriately, Apache-style CLAs give the project steward effectively unlimited power to sublicense contributions under terms of the steward's choice. This is sometimes seen as desirable because of the potential need to relicense a project under some other open source license. But the value of easy relicensing has been greatly exaggerated by pointing to a few historical cases involving major relicensing campaigns undertaken by projects with an unusually large number of past contributors (all of which were successful without the use of a CLA). There are benefits in relicensing being hard because it results in stable legal expectations around a project and encourages projects to consult their contributor communities before undertaking significant legal policy changes. In any case, most inbound=outbound open source projects never attempt to relicense during their lifetime, and for the small number that do, relicensing will be relatively painless because typically the number of past contributors to contact will not be large.

**Provenance tracking:** It is sometimes claimed that CLAs enable a project to rigorously track the provenance of contributions, which purportedly has some legal benefit. It is unclear what is achieved by the use of CLAs in this regard that is not better handled through such non-CLA means as preserving Git commit history. And the DCO would seem to be much better suited to tracking contributions, given that it is normally used on a per-commit basis, while CLAs are signed once per contributor and are administratively separate from code contributions. Moreover, provenance tracking is often described as though it were a benefit for the public, yet I know of no case where a project provides transparent, ready public access to CLA acceptance records.

**License revocation:** Some CLA advocates warn of the prospect that a contributor may someday attempt to revoke a past license grant. To the extent that the concern is about largely judgment-proof individual contributors with no corporate affiliation, it is not clear why an Apache-style CLA provides more meaningful protection against this outcome compared to the use of an open source license. And, as with so many of the legal risks raised in discussions of open source legal policy, this appears to be a phantom risk. I have heard of only a few purported attempts at license revocation over the years, all of which were resolved quickly when the contributor backed down in the face of community pressure.

**Unauthorized employee contribution:** This is a special case of the license revocation issue and has recently become a point commonly raised by CLA advocates. When an employee contributes to an upstream project, normally the employer owns the copyrights and patents for which the project needs licenses, and only certain executives are authorized to grant such licenses. Suppose an employee contributed proprietary code to a project without approval from the employer, and the employer later discovers this and demands removal of the contribution or sues the project's users. This risk of unauthorized contributions is thought to be minimized by use of something like the [Apache CCLA][11] with its representations and signature requirement, coupled with some adequate review process to ascertain that the CCLA signer likely was authorized to sign (a step which I suspect is not meaningfully undertaken by most CLA-using companies).

Based on common sense and common experience, I contend that in nearly all cases today, employee contributions are done with the actual or constructive knowledge and consent of the employer. If there were an atmosphere of high litigation risk surrounding open source software, perhaps this risk should be taken more seriously, but litigation arising out of open source projects remains remarkably uncommon.

More to the point, I know of no case where an allegation of copyright or patent infringement against an inbound=outbound project, not stemming from an alleged open source license violation, would have been prevented by use of a CLA. Patent risk, in particular, is often cited by CLA proponents when pointing to the risk of unauthorized contributions, but the patent license grants in Apache-style CLAs are, by design, quite narrow in scope. Moreover, corporate contributions to an open source project will typically be few in number, small in size (and thus easily replaceable), and likely to be discarded as time goes on.

### Alternatives

If your company does not buy into the anti-CLA case and cannot get comfortable with the simple use of inbound=outbound, there are alternatives to resorting to an asymmetric and administratively burdensome Apache-style CLA requirement. The use of the DCO as a complement to inbound=outbound addresses at least some of the concerns of risk-averse CLA advocates. If you must use a true CLA, there is no need to use the Apache model (let alone a [monstrous derivative][10] of it). Consider the non-specification core of the [Eclipse Contributor Agreement][12]—essentially the DCO wrapped inside a CLA—or the Software Freedom Conservancy's [Selenium CLA][13], which merely ceremonializes an inbound=outbound contribution policy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/cla-problems

作者：[Richard Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/3/cla-vs-dco-whats-difference
[2]: https://opensource.com/law/10/6/new-contributor-agreement-fedora
[3]: https://www.red-bean.com/kfogel/
[4]: https://developercertificate.org
[5]: https://producingoss.com/en/contributor-agreements.html#developer-certificate-of-origin
[6]: https://www.apache.org/licenses/icla.pdf
[7]: https://www.freeipa.org/page/Why_CLA%3F
[8]: https://opensource.com/law/11/7/trouble-harmony-part-1
[9]: https://wiki.openstack.org/wiki/OpenStackAndItsCLA
[10]: https://opensource.com/article/19/1/cla-proliferation
[11]: https://www.apache.org/licenses/cla-corporate.txt
[12]: https://www.eclipse.org/legal/ECA.php
[13]: https://docs.google.com/forms/d/e/1FAIpQLSd2FsN12NzjCs450ZmJzkJNulmRC8r8l8NYwVW5KWNX7XDiUw/viewform?hl=en_US&formkey=dFFjXzBzM1VwekFlOWFWMjFFRjJMRFE6MQ#gid=0
