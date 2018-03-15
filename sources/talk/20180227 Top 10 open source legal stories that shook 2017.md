LightonXue翻译中

Top 10 open source legal stories that shook 2017
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/law_legal_gavel_court.jpg?itok=tc27pzjI)

Like every year, legal issues were a hot topic in the open source world in 2017. While we're deep into the first quarter of the year, it's still worthwhile to look back at the top legal news in open source last year.

### 1. GitHub revises ToS

In February 2017, GitHub [宣布][1] it was revising its terms of service and invited comments on the changes, several of which concerned rights in the user-uploaded content. The [earlier GitHub terms][2] included an agreement by the user to allow others to "view and fork" public repositories, as well as an indemnification provision protecting GitHub against third-party claims. The new terms added a license from the user to GitHub to allow it to store and serve content, a default ["inbound=outbound"][3] contributor license, and an agreement by the user to comply with third-party licenses covering uploaded content. While keeping the "view and fork" language, the new terms state that further rights can be granted by adopting an open source license. The terms also add a waiver of [moral rights][4] with a two-level fallback license, the second license granting GitHub permission to use content without attribution and to make reasonable adaptations "as necessary to render the website and provide the service."

In March, after the new terms became effective, concerns were raised by several developers, notably [Thorsten Glaser][5] and [Joey][6] [Hess][7], who said they would be removing their repositories from GitHub. As Glaser and Hess read the new terms, they seemed to require users to grant rights to GitHub and other users that were broader than third-party licenses would permit, particularly copyleft licenses like the GPL and licenses requiring attribution. Moreover, the license to GitHub could be read as giving it a more favorable license in users' own content than ordinary users would receive under the nominal license. Donald Robertson of the Free Software Foundation (FSF) [wrote][8] that, while GitHub's terms were confusing, they were not in conflict with copyleft: "Because it's highly unlikely that GitHub intended to destroy their business model and user base, we don't read the ambiguity in the terms as granting or requiring overly broad permissions outside those already granted by the GPL."

GitHub eventually added a sentence addressing the issue; it can be seen in the [current version][9] of the terms: "If you upload Content that already comes with a license granting GitHub the permissions we need to run our Service, no additional license is required."

### 2. Kernel enforcement statement

[Section 4][10] of GPLv2 speaks of automatic termination of rights for those who violate the terms of the license. By [2006][11] the FSF had come to see this provision as unduly harsh in the case of inadvertent violations. GPLv3 modifies the GPLv2 approach to termination by providing a 30-day cure opportunity for first-time violators as well as a 60-day period of repose. Many GPL projects like the Linux kernel continue to be licensed under GPLv2.

As I [wrote][12] last year, 2016 saw public condemnation of the GPL enforcement tactics of former Netfilter contributor Patrick McHardy. In a further reaction to McHardy's conduct, the Linux Foundation [Technical Advisory Board][13] (TAB), elected by the individual kernel developers, drafted a Linux Kernel Enforcement Statement, which was [announced by Greg Kroah-Hartman][14] on the Linux kernel mailing list (LKML) on October 16, 2017. The [statement][15], now part of the kernel's Documentation directory, incorporates the GPLv3 cure and repose language verbatim as a "commitment to users of the Linux kernel on behalf of ourselves and any successors to our copyright interests." The commitment, described as a grant of additional permission under GPLv2, applies to non-defensive assertions of GPLv2 rights. The kernel statement in effect adopts a recommendation in the [Principles of Community-Oriented GPL Enforcement][16]. To date, the statement has been signed by over 100 kernel developers. Kroah-Hartman published an [FAQ][17] on the statement and a detailed [explanation][18] authored by several TAB members.

### 3. Red Hat, Facebook, Google, and IBM announce GPLv2/LGPLv2.x cure commitment

A month after the announcement of the kernel enforcement statement on LKML, a coalition of companies led by Red Hat and including Facebook, Google, and IBM [announced][19] their own commitment to [extend the GPLv3 cure][20] and repose opportunities to all code covered by their copyrights and licensed under GPLv2, LGPLv2, and LGPLv2.1. (The termination provision in LGPLv2.x is essentially identical to that in GPLv2.) As with the kernel statement, the commitment does not apply to defensive proceedings or claims brought in response to some prior proceeding or claim (for example, a GPL violation counterclaim in a patent infringement lawsuit, as occurred in [Twin Peaks Software v. Red Hat][21]).

### 4. EPL 2.0 released

The [Eclipse Public License version 1.0][22], a weak copyleft license that descends from the [Common Public License][23] and indirectly the [IBM Public License][24], has been the primary license of Eclipse Foundation projects. It sees significant use outside of Eclipse as well; for example, EPL is the license of the [Clojure][25] language implementation and the preferred open source license of the Clojure community, and it is the main license of [OpenDaylight][26].

Following a quiet two-year community review process, in August 2017 the Eclipse Foundation [announced][27] that a new version 2 of the EPL had been approved by the Eclipse Foundation board and by the OSI. The Eclipse Foundation intends EPL 2.0 to be the default license for Eclipse community projects.

EPL 2.0 is a fairly conservative license revision. Perhaps the most notable change concerns GPL compatibility. EPL 1.0 is regarded as GPL-incompatible by both the [FSF][28] and the [Eclipse Foundation][29]. The FSF has suggested that this is at least because of the conflicting copyleft requirements in the two licenses, and (rather more dubiously) the choice of law clause in EPL 1.0, which has been removed in EPL 2.0. As a weak copyleft license, EPL normally requires at least some subset of derivative works to be licensed under EPL if distributed in source code form. [FSF][30] and [Eclipse][31] published opinions about the use of GPL for Eclipse IDE plugins several years ago. Apart from the issue of license compatibility, the Eclipse Foundation generally prohibits projects from distributing third-party code under GPL and LGPL.

While EPL 2.0 remains GPL-incompatible by default, it enables the initial "Contributor" to authorize the licensing of EPL-covered source code under a "Secondary License"—GPLv2, GPLv3, or a later version of the GPL, which may include identified GPL exceptions or additional permissions like the [Classpath Exception][32]—if the EPL-covered code is combined with GPL-licensed code contained in a separate file. Some Eclipse projects have already relicensed to EPL 2.0 and are making use of this "Secondary License" feature, including [OMR][33] and [OpenJ9][34]. As the FSF [observes][35], invocation of the Secondary License feature is roughly equivalent to dual-licensing the code under EPL / GPL.

### 5. Java EE migration to Eclipse

The [Java Community Process][36] (JCP) facilitates development of Java technology specifications (Java Specification Requests, aka JSRs), including those defining the [Java Enterprise Edition][37] platform (Java EE). The JCP rests on a complex legal architecture centered around the Java Specification Participation Agreement (JSPA). While JCP governance is shared among multiple organizational and individual participants, the JCP is in no way vendor-neutral. Oracle owns the Java trademark and has special controls over the JCP. Some JCP [reforms][38] were adopted several years ago, including measures to mandate open source licensing and open source project development practices for JSR reference implementations (RIs), but efforts to modernize the JSPA stalled during the pendency of the Oracle v. Google litigation.

In August 2017, Oracle announced it would explore [moving Java EE][39] to an open source foundation. Following consultation with IBM and Red Hat, the two other major contributors to Java EE, Oracle announced in September that it had [selected the Eclipse Foundation][40] to house the successor to Java EE.

The migration to Eclipse has been underway since then. The Eclipse board approved a new top-level Eclipse project, [EE4J][41] (Eclipse Enterprise for Java), to serve as the umbrella project for development of RIs and technology compatibility kits (TCKs) for the successor platform. The [GlassFish][42] project, consisting of source code of the RIs for the majority of Java EE JSRs for which Oracle has served as specification lead, has mostly been under a dual license of CDDL and GPLv2 plus the Classpath Exception. Oracle is in the process of [relicensing this code][43] to EPL 2.0 with GPLv2 plus the Classpath Exception as the Secondary License (see EPL 2.0 topic). In addition, Oracle is expected to relicense proprietary Java EE TCKs so they can be developed as Eclipse open source projects. Still to be determined are the name of an Eclipse-owned certification mark to succeed Java EE and the development of a new specification process in place of the one defined in the JSPA.

### 6. React licensing controversy

Open source licenses that specifically address patent licensing often couple the patent license grant with a "patent defense" clause, terminating the patent license upon certain acts of litigation brought by the licensee, an approach borrowed from standards agreements. The early period of corporate experimentation with open source licensing was characterized by enthusiasm for patent defense clauses that were broad (in the sense that a relatively wide range of conduct would trigger termination). The arrival of the Apache License 2.0 and Eclipse Public License 1.0 in 2004 marked an end to that era; their patent termination criteria are basically limited to patent lawsuits in which the user accuses the licensed software itself of infringement.

In May 2013 Facebook released the [React][44] JavaScript library under the Apache License 2.0, but the 0.12.0 release (October 2014) switched to the 3-clause BSD license along with a patent license grant in a separate `PATENTS` file. The idea of using a simple, standard permissive open source license with a bespoke patent license in a separate file has some precedent in projects maintained by [Google][45] and [Microsoft][46]. However, the patent defense clauses in those cases take the narrow Apache/EPL approach. The React `PATENTS` language terminated the patent license in cases where the licensee brought a patent infringement action against Facebook, or against any party "arising from" any Facebook product, even where the claim was unrelated to React, as well as where the licensee alleged that a Facebook patent was invalid or unenforceable. In response to criticism from the community, Facebook [revised][47] the patent license language in April 2015, but the revised version continued to include as termination criteria patent litigation against Facebook and patent litigation "arising from" Facebook products.

Facebook came to apply the React license to many of its community projects. In April 2017 an [issue][48] was opened in the Apache Software Foundation (ASF) "Legal Discuss" issue tracker concerning whether Apache Cassandra could use [RocksDB][49], another Facebook project using the React license, as a dependency. In addition to the several other ASF projects that were apparently already using RocksDB, a large number of ASF projects used React itself. In June, Chris Mattmann, VP of legal affairs for the ASF, [ruled][50] that the React license was relegated to the forbidden Category X (see my discussion of the [JSON license][12] last year)—despite the fact that the ASF has long placed open source licenses with similarly broad patent defense clauses (MPL 1.1, IBM-PL, CPL) in its semi-favored Category B. In response, Facebook relicensed RocksDB under [GPLv2][51] and the [Apache License][52] 2.0, and a few months later announced it was [relicensing React][53] and three other identically licensed projects under the MIT license. More recent Facebook project license changes from the React approach to conventional open source licenses include [osquery][54] (GPLv2 / Apache License 2.0) and [React Native][55] (MIT).

Much of the community criticism of the React license was rather misinformed and often seemed to be little more than ad hominem attack against Facebook. One of the few examples of sober, well-reasoned analysis of the topic is [Heather Meeker's article][56] on Opensource.com. Whatever actual merits the React license may have, Facebook's decision to use it without making it licensor-neutral and without seeking OSI approval were tactical mistakes, as [Simon Phipps points out][57].

### 7. OpenSSL relicensing effort

The [license][58] covering most of OpenSSL is a conjunction of two 1990s-vintage BSD-derivative licenses. The first closely resembles an early license of the Apache web server. The second is the bespoke license of OpenSSL's predecessor project SSLeay. Both licenses contain an advertising clause like that in the 4-clause BSD license. The closing sentence of the SSLeay license, a gratuitous snipe at the GPL, supports an interpretation, endorsed by the FSF but no doubt unintended, that the license is copyleft. If only because of the advertising clauses, the OpenSSL license has long been understood to be GPL-incompatible, as Mark McLoughlin explained in a now-classic [essay][59].

In 2015, a year after the disclosure of the Heartbleed vulnerability and the Linux Foundation's subsequent formation of the [Core Infrastructure Initiative][60], Rich Salz said in a [blog post][61] that OpenSSL planned to relicense to the Apache License 2.0. The OpenSSL team followed up in March 2017 with a [press release][62] announcing the relicensing initiative and set up a website to collect agreements to the license change from the project's several hundred past contributors.

A form email sent to identified individual contributors, asking for permission to relicense, soon drew criticism, mainly because of its closing sentence: "If we do not hear from you, we will assume that you have no objection." Some raised policy and legal concerns over what Theo de Raadt called a "[manufacturing consent in volume][63]" approach. De Raadt mocked the effort by [posting][64] a facetious attempt to relicense GCC to the [ISC license][65].

Salz posted an [update][66] on the relicensing effort in June. At that point, 40% of contacted contributors had responded, with the vast majority in favor of the license change and fewer than a dozen objections, amounting to 86 commits, with half of them surviving in the master branch. Salz described in detail the reasonable steps the project had taken to review those objections, resulting in a determination that at most 10 commits required removal and rewriting.

### 8. Open Source Security v. Perens

Open Source Security, Inc. (OSS) is the commercial vehicle through which Brad Spengler maintains the out-of-tree [grsecurity][67] patchset to the Linux kernel. In 2015, citing concerns about GPL noncompliance by users and misuse of the grsecurity trademark, OSS began [limiting access][68] to the stable patchset to paying customers. In 2017 OSS [ceased][69] releasing any public branches of grsecurity. The [Grsecurity Stable Patch Access Agreement][70] affirms that grsecurity is licensed under GPLv2 and that the user has all GPLv2 "rights and obligations," but states a policy of terminating access to future updates if a user redistributes patchsets or changelogs "outside of the explicit obligations under the GPL to User's customers."

In June 2017, Bruce Perens published a [blog post][71] contending that the grsecurity agreement violated the GPL. OSS sued Perens in the Northern District of California, with claims for defamation, false light, and tortious interference with prospective advantage. In December the court [granted][72] Perens' motion to dismiss, denied without prejudice Perens' motion to strike under the California [anti-SLAPP][73] statute, and denied OSS's motion for partial summary judgment. In essence, the court said that as statements of opinion by a non-lawyer, Perens' blog posts were not defamatory. OSS has said it intends to appeal.

### 9. Artifex Software v. Hancom

Artifex Software licenses [Ghostscript][74] gratis under the [GPL][75] (more recently AGPL) and for revenue under proprietary licenses. In December 2016 Artifex sued Hancom, a South Korean vendor of office suite software, in the Northern District of California. Artifex alleged that Hancom had incorporated Ghostscript into its Hangul word processing program and Hancom Office product without obtaining a proprietary license or complying with the GPL. The [complaint][76] includes claims for breach of contract as well as copyright infringement. In addition to monetary damages, Artifex requested injunctive relief, including an order compelling Hancom to distribute the source code of Hangul and Hancom Office to Hancom's customers.

In April 2017 the court [denied][77] Hancom's motion to dismiss. One of Hancom's arguments was that Artifex did not plead the existence of a contract because there was no demonstration of mutual assent. The court disagreed, stating that the allegations of Hancom's use of Ghostscript, failure to obtain a proprietary license, and public representation that its use of Ghostscript was licensed under the GPL were sufficient to plead the existence of a contract. In addition, Artifex's allegations regarding its dual-licensing scheme were deemed sufficient to plead damages for breach of contract. The denial of the motion to dismiss was widely misreported and sensationalized as a ruling that the GPL itself was "an enforceable contract."

In September the court [denied][78] Hancom's motion for summary judgment on the breach of contract claim. Hancom first argued that as a matter of law Artifex was not entitled to money damages, essentially because GPL compliance required no payment to Artifex. The court rejected this argument, as the value of a royalty-bearing license and an unjust enrichment theory could serve as the measure of Artifex's damages. Second, Hancom argued in essence that any damages for contract breach could not be based on continuing GPL-noncompliant activity after Hancom first began shipping Ghostscript in violation of the GPL, because at that moment Hancom's GPL license was automatically terminated. In rejecting this argument, the court noted that GPLv3's language suggested Hancom's GPL obligations persisted beyond the termination of its GPL rights. The parties reached a settlement in December.

Special thanks to Chris Gillespie for his research and analysis of the Artifex case.

### 10. SFLC/Conservancy trademark dispute

In 2006 the Software Freedom Law Center formed a [separate nonprofit organization][79], which it named the Software Freedom Conservancy. By July 2011, the two organizations no longer had any board members, officers, or employees in common, and SFLC ceased providing legal services to Conservancy. SFLC obtained a registration from the USPTO for the service mark SOFTWARE FREEDOM LAW CENTER in early 2011. In November 2011 Conservancy applied to register the mark SOFTWARE FREEDOM CONSERVANCY; the registration issued in September 2012. SFLC continues to be run by its founder Eben Moglen, while Conservancy is managed by former SFLC employees Karen Sandler and Bradley Kuhn. The two organizations are known to have opposing positions on a number of significant legal and policy matters (see, for example, my discussion of the [ZFS-on-Linux][12] issue last year).

In September 2017, SFLC filed a [petition][80] with the [Trademark Trial and Appeal Board][81] to cancel Conservancy's trademark registration under Section 14 of the Lanham Trademark Act of 1946, [15 U.S.C.][82][§][82][1064][82], claiming that Conservancy's mark is confusingly similar to SFLC's. In November, Conservancy submitted its [answer][83] listing its affirmative defenses, and in December Conservancy filed a [summary judgment motion][84] on those defenses. The TTAB in effect [denied the summary judgment motion][85] on the basis that the affirmative defenses in Conservancy's answer were insufficiently pleaded.

Moglen publicly [proposed a mutual release][86] of all claims "in return for an iron-clad agreement for mutual non-disparagement," including "a perpetual, royalty-free trademark license for Conservancy to keep and use its current name." [Conservancy responded][87] in a blog post that it could not "accept any settlement offer that includes a trademark license we don't need. Furthermore, any trademark license necessarily gives SFLC perpetual control over how we pursue our charitable mission."

SFLC [moved][88] for leave to amend its petition to add a second ground for cancellation, that Conservancy's trademark registration was obtained by fraud. Conservancy's [response][89] argues that the proposed amendment does not state a claim for fraud. Meanwhile, Conservancy has submitted [applications for trademarks][90] for "THE SOFTWARE CONSERVANCY."

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/top-10-open-source-legal-stories-shook-2017

作者：[Richard Fontana][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/fontana
[1]:https://github.com/blog/2314-new-github-terms-of-service
[2]:https://web.archive.org/web/20170131092801/https:/help.github.com/articles/github-terms-of-service/
[3]:https://opensource.com/law/11/7/trouble-harmony-part-1
[4]:https://en.wikipedia.org/wiki/Moral_rights
[5]:https://www.mirbsd.org/permalinks/wlog-10_e20170301-tg.htm#e20170301-tg_wlog-10
[6]:https://joeyh.name/blog/entry/removing_everything_from_github/
[7]:https://joeyh.name/blog/entry/what_I_would_ask_my_lawyers_about_the_new_Github_TOS/
[8]:https://www.fsf.org/blogs/licensing/do-githubs-updated-terms-of-service-conflict-with-copyleft
[9]:https://help.github.com/articles/github-terms-of-service/
[10]:https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section4
[11]:http://gplv3.fsf.org/gpl-rationale-2006-01-16.html#SECTION00390000000000000000
[12]:https://opensource.com/article/17/1/yearbook-7-notable-legal-developments-2016
[13]:https://www.linuxfoundation.org/about/technical-advisory-board/
[14]:https://lkml.org/lkml/2017/10/16/122
[15]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/kernel-enforcement-statement.rst?h=v4.15
[16]:https://sfconservancy.org/copyleft-compliance/principles.html
[17]:http://kroah.com/log/blog/2017/10/16/linux-kernel-community-enforcement-statement-faq/
[18]:http://kroah.com/log/blog/2017/10/16/linux-kernel-community-enforcement-statement/
[19]:https://www.redhat.com/en/about/press-releases/technology-industry-leaders-join-forces-increase-predictability-open-source-licensing
[20]:https://www.redhat.com/en/about/gplv3-enforcement-statement
[21]:https://lwn.net/Articles/516735/
[22]:https://www.eclipse.org/legal/epl-v10.html
[23]:https://opensource.org/licenses/cpl1.0.php
[24]:https://opensource.org/licenses/IPL-1.0
[25]:https://clojure.org/
[26]:https://www.opendaylight.org/
[27]:https://www.eclipse.org/org/press-release/20170829eplv2.php
[28]:https://www.gnu.org/licenses/license-list.en.html#EPL
[29]:http://www.eclipse.org/legal/eplfaq.php#GPLCOMPATIBLE
[30]:https://www.fsf.org/blogs/licensing/using-the-gpl-for-eclipse-plug-ins
[31]:https://mmilinkov.wordpress.com/2010/04/06/epl-gpl-commentary/
[32]:https://www.gnu.org/software/classpath/license.html
[33]:https://github.com/eclipse/omr/blob/master/LICENSE
[34]:https://github.com/eclipse/openj9/blob/master/LICENSE
[35]:https://www.gnu.org/licenses/license-list.en.html#EPL2
[36]:https://jcp.org/en/home/index
[37]:http://www.oracle.com/technetwork/java/javaee/overview/index.html
[38]:https://jcp.org/en/jsr/detail?id=348
[39]:https://blogs.oracle.com/theaquarium/opening-up-java-ee
[40]:https://blogs.oracle.com/theaquarium/opening-up-ee-update
[41]:https://projects.eclipse.org/projects/ee4j/charter
[42]:https://javaee.github.io/glassfish/
[43]:https://mmilinkov.wordpress.com/2018/01/23/ee4j-current-status-and-whats-next/
[44]:https://reactjs.org/
[45]:https://www.webmproject.org/license/additional/
[46]:https://github.com/dotnet/coreclr/blob/master/PATENTS.TXT
[47]:https://github.com/facebook/react/blob/v0.13.3/PATENTS
[48]:https://issues.apache.org/jira/browse/LEGAL-303
[49]:http://rocksdb.org/
[50]:https://issues.apache.org/jira/browse/LEGAL-303?focusedCommentId=16052957&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-16052957
[51]:https://github.com/facebook/rocksdb/pull/2226
[52]:https://github.com/facebook/rocksdb/pull/2589
[53]:https://code.facebook.com/posts/300798627056246/relicensing-react-jest-flow-and-immutable-js/
[54]:https://github.com/facebook/osquery/pull/4007
[55]:https://github.com/facebook/react-native/commit/26684cf3adf4094eb6c405d345a75bf8c7c0bf88
[56]:https://opensource.com/article/17/9/facebook-patents-license
[57]:https://opensource.com/article/17/9/5-reasons-facebooks-react-license-was-mistake
[58]:https://www.openssl.org/source/license.html
[59]:https://people.gnome.org/~markmc/openssl-and-the-gpl.html
[60]:https://www.coreinfrastructure.org/
[61]:https://www.openssl.org/blog/blog/2015/08/01/cla/
[62]:https://www.coreinfrastructure.org/news/announcements/2017/03/openssl-re-licensing-apache-license-v-20-encourage-broader-use-other-foss
[63]:https://marc.info/?l=openbsd-tech&m=149028829020600&w=2
[64]:https://marc.info/?l=openbsd-tech&m=149032069130072&w=2
[65]:https://opensource.org/licenses/ISC
[66]:https://www.openssl.org/blog/blog/2017/06/17/code-removal/
[67]:https://grsecurity.net/
[68]:https://grsecurity.net/announce.php
[69]:https://grsecurity.net/passing_the_baton.php
[70]:https://web.archive.org/web/20170805231029/https:/grsecurity.net/agree/agreement.php
[71]:https://perens.com/2017/06/28/warning-grsecurity-potential-contributory-infringement-risk-for-customers/
[72]:https://www.courtlistener.com/docket/6132658/53/open-source-security-inc-v-perens/
[73]:https://en.wikipedia.org/wiki/Strategic_lawsuit_against_public_participation
[74]:https://www.ghostscript.com/
[75]:https://www.gnu.org/licenses/licenses.en.html
[76]:https://www.courtlistener.com/recap/gov.uscourts.cand.305835.1.0.pdf
[77]:https://ia801909.us.archive.org/13/items/gov.uscourts.cand.305835/gov.uscourts.cand.305835.32.0.pdf
[78]:https://ia801909.us.archive.org/13/items/gov.uscourts.cand.305835/gov.uscourts.cand.305835.54.0.pdf
[79]:https://www.softwarefreedom.org/news/2006/apr/03/conservancy-launch/
[80]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=1
[81]:https://www.uspto.gov/trademarks-application-process/trademark-trial-and-appeal-board
[82]:https://www.law.cornell.edu/uscode/text/15/1064
[83]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=5
[84]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=6
[85]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=8
[86]:https://www.softwarefreedom.org/blog/2017/dec/22/conservancy/
[87]:https://sfconservancy.org/blog/2017/dec/22/sflc-escalation/
[88]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=7
[89]:http://ttabvue.uspto.gov/ttabvue/v?pno=92066968&pty=CAN&eno=9
[90]:http://tsdr.uspto.gov/documentviewer?caseId=sn87670034&docId=FTK20171106083425#docIndex=0&page=1
