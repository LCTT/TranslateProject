[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Should API-restricting licenses qualify as open source?)
[#]: via: (https://opensource.com/article/20/6/api-copyright)
[#]: author: (Richard Fontana https://opensource.com/users/fontana)

Should API-restricting licenses qualify as open source?
======
A look at how a closely-watched legal case about copyright and APIs
might affect open source licensing
![Two government buildings][1]

In its 2014 _[Oracle v. Google][2]_ decision, the United States Court of Appeals for the Federal Circuit held that the method declarations and "structure, sequence, and organization" (SSO) of the Java SE API were protected by copyright. This much-criticized result contradicted a decades-old industry and professional consensus assumption that APIs were in the public domain, reflected in an ongoing common practice of successive reimplementation of APIs, and persisting even after the general copyrightability of software was settled by statute. Unsurprisingly, that consensus shaped the view of APIs from within open source. Open source licenses, in particular, do not address APIs, and their conditions have not customarily been understood to apply to APIs.

If the copyrightability ruling survives its current [review][3] by the United States Supreme Court, there is reason to worry that _Oracle v. Google_ will eventually have some detrimental impact on open source licensing. License authors might draft new licenses that would explicitly extend familiar kinds of open source license conditions to activities merely involving APIs. There could also be comparable efforts to advance _Oracle v. Google_-influenced reinterpretations of existing open source licenses.

We've already seen an example of a new open source-like license that restricts APIs. Last year, Holochain, through its lawyer [Van Lindberg][4], submitted the [Cryptographic Autonomy License][5] (CAL) for approval by the Open Source Initiative (OSI). The [1.0-Beta][6] draft included source availability and licensing requirements placed on works merely containing or derivative of interfaces included in or derived from the licensed work. (CAL 1.0-Beta was [rejected][7] by the OSI for reasons other than the interface copyleft feature. Subsequent revisions of CAL removed explicit references to interfaces, and the OSI approved CAL 1.0 earlier this year.) Licenses like CAL 1.0-Beta would extend copyleft to reimplementations of APIs having no code in common with the original. Though less likely, new permissive licenses might similarly extend notice preservation requirements to mere copies of APIs.

In my view, API-restricting licenses, though otherwise FOSS-like, would not qualify for the open source label. To simplify what is actually a complicated and contentious issue, let's accept the view that the license approval decisions of the OSI, interpreting the [Open Source Definition][8] (OSD), are the authoritative basis for determining whether a license is open source. The OSD makes no mention of software interfaces. Some advocates of a relaxation of standards for approving open source licenses have argued that if a type of restriction is not explicitly prohibited by the OSD, it should be considered acceptable in an open source license. To guard against this tactic, which amounts to ["gaming" the OSD][9], the OSI [clarified][10] in 2019 that the purpose of the approval process is to ensure that approved licenses not only conform to the OSD but also provide software freedom.

Though [Luis Villa has raised concerns][11] that it gives rise to a "[no true Scotsman][12]" problem, I believe the emphasis on software freedom as a grounding principle will enable the OSI to deal effectively and in a well-reasoned, predictable way with cases where license submissions expose unforeseen gaps or vagueness in the OSD, which is politically difficult for the OSI to revise. (Disclosure: I was on the OSI board when this change to the license review process was made.) It is also an honest acknowledgment that the OSD, like the [Free Software Definition][13] maintained by the Free Software Foundation, is an unavoidably imperfect and incomplete attempt to distill the underlying community norms and expectations surrounding what FOSS is.

Software freedom is the outgrowth of a long-lived culture. Judging whether a license that extends FOSS-normative conditions to APIs provides software freedom should begin with an examination of tradition. This leads to a straightforward conclusion. As noted above, from nearly the earliest days of programming and continuing without interruption through the rise of the modern open source commons, software developers have shared and acted on a belief in an unconditional right to reimplement software interfaces. From a historical perspective, it is difficult to think of anything as core to software freedom as this right to reimplement.

The inquiry cannot be entirely backward-looking, however, since the understanding of software freedom necessarily changes in response to new societal or technological developments. It is worth asking whether a departure from the traditional expectation of unrestricted APIs would advance the broader goals of open source licensing. At first glance, this might seem to be true for copyleft licensing, since, in theory, compliant adoption of API copyleft licenses could expand the open source software commons. But expanding the scope of copyleft to API reimplementations—software traditionally seen as unrelated to the original work—would violate another open source norm, the limited reach of open source licenses, which is partially captured in [OSD 9][14].

Another observation is that software freedom is endangered by licensing arrangements that are excessively complex and unpredictable and that make compliance too difficult. This would likely be true of API-restricting FOSS-like licenses, especially on the copyleft side. For example, copyleft licenses typically place conditions on the grant of permission to prepare derivative works. Trying to figure out what is a derivative work of a Java method declaration, or the SSO of a set of APIs, could become a compliance nightmare. Would it include reimplementations of APIs? Code merely invoking APIs? The fundamental vagueness of _Oracle v. Google_-style API copyright bears some resemblance to certain kinds of software patent claims. It is not difficult to imagine acquirers of copyrights covered by API-restrictive licenses adopting the litigation strategies of patent trolls. In addition to this risk, accepting API-restrictive licenses as open source would further legitimize API copyrightability in jurisdictions like the United States, where the legal issue is currently unsettled.

_Oracle v. Google_-influenced interpretations of existing open source licenses would similarly extend familiar open source license conditions to activities merely involving APIs. Such reinterpretations would transform these licenses into ones that fail to provide software freedom and advance the goals of open source, for the same reasons that apply to the new license case. In addition, they would upend the intentions and expectations of the authors of those licenses, as well as nearly all of their licensors and licensees.

It might be argued that because open source licenses are principally ([though not exclusively][15]) copyright licenses, it is necessary, if not beneficial, for their conditions to closely track the expansion of copyright to APIs. This is not so for new open source licenses, which can be drafted explicitly to nullify the impact of _Oracle v. Google_. As for reinterpretations of existing open source licenses, while the issue of API copyrightability remains unsettled, it would not be appropriate to abandon traditional interpretations in favor of anticipating what an _Oracle v. Google_-influenced court, unfamiliar with open source culture, would decide. Litigation over open source licenses continues to be uncommon, and influential open source license interpretations have emerged in the technical community with little regard to how courts might act. In any event, courts engaged in interpreting commonly-used open source licenses may well be persuaded to treat APIs as unconstrained.

Some have suggested that interpretation of the GPL should take full advantage of the scope of underlying copyright rights. This is related to a view of copyleft as a "[hack on copyright][16]" or a "[judo move][17]" that "[return[s] the violent force of the oppressor against the oppressor itself][18]." It can be detected in the [copyleft tutorial][19] sponsored by the Software Freedom Conservancy and the FSF, which [says][20]: "The strongest copylefts strive to [use] the exclusive rights that copyright grants to authors as extensively as possible to maximize software freedom." It might seem logical for someone with this perspective to specifically promote an API copyright interpretation of the GPL. But I know of no advocate of strong copyleft who has done so, and the text and interpretive history of the GPL do not support such a reading.

A somewhat different view of API copyright and GPL interpretation, occasionally voiced, is that _Oracle v. Google_ may put the doctrine of strong copyleft on a surer legal foundation. Similarly, it has sometimes been asserted that strong copyleft rested on some notion of API copyrightability all along, which suggests that _Oracle v. Google_ provides some retroactive legal legitimacy. The latter view is not held by the FSF, which in an earlier era had [opposed the expansion of copyright][21] to user interfaces. This stance made its way into GPLv2, which has a [largely overlooked provision][22] authorizing the original licensor to exclude countries that would restrict "distribution and/or use … either by patents or by copyrighted interfaces." The FSF also [severely criticized][23] Oracle's claim of copyright ownership of Java APIs. And the FSF has never questioned the right to reimplement APIs of GPL-licensed software under non-GPL licenses (as has happened, for example, with the FSF-copyrighted [GNU Readline][24] and the BSD-licensed [libedit][25]). If there were shown to be some legal deficiency in strong copyleft theory that API copyrightability could somehow fix, I believe it would be better either to live with a weaker understanding of GPL copyleft or to pursue revisions to the GPL that would reformulate strong copyleft without relying on API copyright.

If API copyrightability survives Supreme Court review, it would then be appropriate for license stewards, licensors of existing open source licenses, and drafters of new open source licenses to take constructive steps to minimize the impact on open source. Stewards of widely used open source licenses, where they exist, could publish interpretive guidance clarifying that APIs are not restricted by the license. Updates to existing open source licenses and entirely new licenses could make unrestricted APIs an explicit policy. Licensors of existing open source licenses could make clear, in standardized license notices or through external commitments, that they will not treat open source license conditions as imposing any restriction on activities merely involving APIs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/api-copyright

作者：[Richard Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_lawdotgov2.png?itok=n36__lZj (Two government buildings)
[2]: http://www.cafc.uscourts.gov/sites/default/files/opinions-orders/13-1021.Opinion.5-7-2014.1.PDF
[3]: https://www.scotusblog.com/case-files/cases/google-llc-v-oracle-america-inc/
[4]: https://twitter.com/vanl?lang=en
[5]: https://github.com/holochain/cryptographic-autonomy-license
[6]: http://lists.opensource.org/pipermail/license-review_lists.opensource.org/2019-April/004028.html
[7]: http://lists.opensource.org/pipermail/license-review_lists.opensource.org/2019-June/004248.html
[8]: https://opensource.org/osd
[9]: https://twitter.com/webmink/status/1121873263125118977?s=20
[10]: https://opensource.org/approval
[11]: https://twitter.com/luis_in_brief/status/1143884765654687744
[12]: https://en.wikipedia.org/wiki/No_true_Scotsman
[13]: https://www.gnu.org/philosophy/free-sw.en.html
[14]: https://opensource.org/osd#not-restrict-other-software
[15]: https://opensource.com/article/18/3/patent-grant-mit-license
[16]: https://sfconservancy.org/blog/2012/feb/01/gpl-enforcement/
[17]: https://gondwanaland.com/mlog/2014/12/01/copyleft-org/#gpl-and-cc-by-sa-differences
[18]: https://dustycloud.org/blog/field-guide-to-copyleft/#sec-2-2
[19]: https://copyleft.org/guide/
[20]: https://copyleft.org/guide/comprehensive-gpl-guidech2.html#x5-120001.2.2
[21]: https://www.gnu.org/bulletins/bull21.html
[22]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section8
[23]: https://www.fsf.org/blogs/licensing/fsf-statement-on-court-of-appeals-ruling-in-oracle-v-google
[24]: https://tiswww.case.edu/php/chet/readline/rltop.html
[25]: http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit/
