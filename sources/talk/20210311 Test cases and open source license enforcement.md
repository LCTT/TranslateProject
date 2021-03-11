[#]: subject: (Test cases and open source license enforcement)
[#]: via: (https://opensource.com/article/21/3/test-cases-open-source-licenses)
[#]: author: (Richard Fontana https://opensource.com/users/fontana)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Test cases and open source license enforcement
======
If you're trying to enforce open source licenses, test case litigation
is not the right way to do it.
![A gavel.][1]

A test case is a lawsuit brought primarily to achieve a policy outcome by securing a judicial ruling that reverses settled law or clarifies some disputed legal question. Bringing a test case typically involves carefully planning out where, when, and whom to sue and which legal arguments to advance in order to maximize the chances of winning the desired result. In the United States, we often see test case strategies used by public interest organizations to effect legal change that cannot practically be attained through other governmental means.

But a test case strategy can be used by either side of a policy dispute. Even if a test case is successful, the real policy goal may continue to be elusive, given the limitations of case-specific court judgments, which may be met with administrative obstruction or legislative nullification. Test case litigation can also fail, sometimes disastrously—in the worst case, from the test litigant's perspective, the court might issue a ruling that is the direct opposite of what was sought, as happened in [_Plessy v. Ferguson_][2].

It may be hard to imagine a test case centered around interpretation of a software license. While licenses are necessarily based on underlying legal rules, typical software licenses are private transactions with terms that are negotiated by the parties or are form agreements unique to the licensor. Normally, a dispute over interpretation of some term in a software license would not be expected to implicate the sort of broadly applicable policy issues that are the usual focus of test case litigation.

But open source is quite different in this respect. Most open source software is governed by a small set of de facto standard licenses, used without modification or customization across a wide range of projects. Relatedly, open source licenses have an importance to project communities that extends beyond mere licensing terms. They are "[constitutions of communities][3]," an expression of the collaborative and ethical norms of those communities. For these reasons, [open source licenses function as shared resources][4]. This characteristic makes a license-enforcement test case conceivable.

Whether there actually has ever been an open source license test case is unclear. Litigation over open source licenses has been quite uncommon (though it may be [increasing][5]). Most open source license compliance matters are resolved through voluntary efforts by the licensee, or through community discussion or amicable negotiation with licensors, without resort to the courts. Open source license-enforcement litigation has mostly involved the GPL or another copyleft license in the GNU license family. The fairly small number of litigated GPL enforcement cases brought by community-oriented organizations—Harald Welte's [GPL-violations.org][6] cases, the [Free Software Foundation's suit against Cisco][7], the [BusyBox cases][8]—largely involved factually straightforward "no source or offer" violations. The [copyright profiteering lawsuits][9] brought by Patrick McHardy are clearly not calculated to lead to judicial rulings on questions of GPL interpretation.

One notable GPL enforcement suit that arguably has some of the characteristics of a test case is Christoph Hellwig's [now-concluded case against VMware in Germany][10], which was funded by the Software Freedom Conservancy. The Hellwig case was apparently the first GPL enforcement lawsuit to raise as a central issue the scope of derivative works under GPLv2, a core copyleft and GPL interpretation policy issue and a policy topic that has been debated in technical and legal communities for decades. Hellwig and Conservancy may have hoped that a victory on the merits would have a far-reaching regulatory impact on activities long-criticized by many GPL supporters, particularly the practice of distributing proprietary Linux kernel modules using GPL-licensed "shim" layers. Then again, Conservancy itself was careful to downplay the notion that the Hellwig case was intended as "[the great test case of combined/derivative works.][11]" And the facts in the Hellwig case, involving a proprietary VMware kernel and GPL-licensed kernel modules, were fairly unusual in comparison to typical GPL-compliance scenarios involving Linux.

Some developers and lawyers may be predisposed to view open source test cases positively. But this ignores the downsides of test case litigation in the open source context, which are a direct consequence of open source licenses being shared resources. Litigation, whether based on test cases or otherwise, is a poor means of pursuing open source license compliance. You might assume that if open source licenses are shared resources, litigation resulting in judicial rulings would be beneficial by providing increased legal certainty over the limited set of licenses in wide use. But this rests on an unrealistically rosy view of litigation and its impact. Given that open source licenses are, for the most part, a small set of widely reused license texts, actions taken by a few individuals can adversely affect an entire community sharing the same license.

A court decision by a judge in a dispute between two parties arising out of a unique set of facts is one means by which that impact can occur. The judge, in all likelihood, will not be well informed about open source or technology in general. The judge's rulings will be shaped by the arguments of lawyers for the parties who have incentives to advance legal arguments that may be in conflict with the values and norms of communities relying on the license at issue. The litigants themselves, including the litigant seeking to enforce the license, may not share those values and norms. The capacity of the court to look beyond the arguments presented by the litigants is very limited, and authentic representatives of the project communities using the license will have no meaningful opportunity to give their perspective.

If, as is therefore likely, license-enforcement litigation produces a bad decision with a large community impact, the license-using community may then be stuck with that decision with few good options to remedy the situation. In many cases, there will be no easy path for a project to migrate to a different license, including a new version of the litigated license that attempts to correct against the court decision. There may be no license steward, or the license may not facilitate downstream upgradeability. Even if there is a license steward, there is generally strong social pressure in free and open source software (FOSS) to avoid license revision.

Test case litigation would not be immune to these kinds of problems; their drawbacks are amplified in the open source setting. For one thing, a test case might be brought by supporters of a license interpretation that is disfavored in the relevant license-using community—let's call this a "bad" test case litigant. Even if we suppose that the test case litigant's policy objectives reflect a real consensus in the license-using community—a "good" test case litigant—the test case strategy could backfire. The case might result in a ruling that is the opposite of what the test case litigant sought. Or the test case litigant might win on the facts, but in the process, the court might issue one or more rulings framed differently from what the test case litigant hoped for, perhaps having unexpected negative consequences for license interpretation or imposing undesirable new burdens on license compliance. The court might also dispose of the case in some procedural manner that could have a negative impact on the license-using community.

A more fundamental problem is that we really cannot know whether a given test case litigant is "good" or "bad" because of the complex and diverse nature of views on license interpretation across open source project communities. For example, an organization that is generally trusted in the community may be tempted to use test case litigation to promote highly restrictive or literalist interpretations of a license that are out of step with prevailing community views or practices.

Rather than pursuing open source license enforcement policy through test case litigation, we should first fully explore the use of community-based governance approaches to promote appropriate license interpretations and compliance expectations. This would be especially helpful in signaling that restrictive or illiberal license interpretations, advanced in litigation by parties motivated by private gain, have no basis of support in the larger community that shares that license text. For example, we can document and publicize license interpretations that are widely accepted in the community, expanding on work already done by some license stewards. We can also promote more liberal and modern interpretations of widely used licenses that were drafted in a different technological context, while still upholding their underlying policies, with the aim of making compliance clearer, fairer, and easier. Finally, we should consider adopting more frequent upgrade cycles for popular licenses using public and transparent license-revision processes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/test-cases-open-source-licenses

作者：[Richard Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/law_legal_gavel_court.jpg?itok=tc27pzjI (A gavel.)
[2]: https://www.oyez.org/cases/1850-1900/163us537
[3]: https://meshedinsights.com/2015/12/21/faq-license/
[4]: https://opensource.com/law/16/11/licenses-are-shared-resources
[5]: https://opensource.com/article/19/2/top-foss-legal-developments
[6]: http://gpl-violations.org/
[7]: https://en.wikipedia.org/wiki/Free_Software_Foundation,_Inc._v._Cisco_Systems,_Inc.
[8]: https://en.wikipedia.org/wiki/BusyBox#GPL_lawsuits
[9]: https://opensource.com/article/17/8/patrick-mchardy-and-copyright-profiteering
[10]: https://sfconservancy.org/news/2019/apr/02/vmware-no-appeal/
[11]: https://sfconservancy.org/copyleft-compliance/vmware-lawsuit-faq.html
