[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (lawyer The MIT License, Line by Line)
[#]: via: (https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html)
[#]: author: (Kyle E. Mitchell https://kemitchell.com/)

lawyer The MIT License, Line by Line
======

### The MIT License, Line by Line

[The MIT License][1] is the most popular open-source software license. Here’s one read of it, line by line.

#### Read the License

If you’re involved in open-source software and haven’t taken the time to read the license from top to bottom—it’s only 171 words—you need to do so now. Especially if licenses aren’t your day-to-day. Make a mental note of anything that seems off or unclear, and keep trucking. I’ll repeat every word again, in chunks and in order, with context and commentary. But it’s important to have the whole in mind.

> The MIT License (MIT)
>
> Copyright (c) <year> <copyright holders>
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the Software.

The license is arranged in five paragraphs, but breaks down logically like this:

  * **Header**
    * **License Title** : “The MIT License”
    * **Copyright Notice** : “Copyright (c) …”
  * **License Grant** : “Permission is hereby granted …”
    * **Grant Scope** : “… to deal in the Software …”
    * **Conditions** : “… subject to …”
      * **Attribution and Notice** : “The above … shall be included …”
      * **Warranty Disclaimer** : “The software is provided ‘as is’ …”
      * **Limitation of Liability** : “In no event …”



Here we go:

#### Header

##### License Title

> The MIT License (MIT)

“The MIT License” is a not a single license, but a family of license forms derived from language prepared for releases from the Massachusetts Institute of Technology. It has seen a lot of changes over the years, both for the original projects that used it, and also as a model for other projects. The Fedora Project maintains a [kind of cabinet of MIT license curiosities][2], with insipid variations preserved in plain text like anatomical specimens in formaldehyde, tracing a wayward kind of evolution.

Fortunately, the [Open Source Initiative][3] and [Software Package Data eXchange][4] groups have standardized a generic MIT-style license form as “The MIT License”. OSI in turn has adopted SPDX’ standardized [string identifiers][5] for common open-source licenses, with `MIT` pointing unambiguously to the standardized form “MIT License”. If you want MIT-style terms for a new project, use [the standardized form][1].

Even if you include “The MIT License” or “SPDX:MIT” in a `LICENSE` file, any responsible reviewer will still run a comparison of the text against the standard form, just to be sure. While various license forms calling themselves “MIT License” vary only in minor details, the looseness of what counts as an “MIT License” has tempted some authors into adding bothersome “customizations”. The canonical horrible, no good, very bad example of this is [the JSON license][6], an MIT-family license plus “The Software shall be used for Good, not Evil.”. This kind of thing might be “very Crockford”. It is definitely a pain in the ass. Maybe the joke was supposed to be on the lawyers. But they laughed all the way to the bank.

Moral of the story: “MIT License” alone is ambiguous. Folks probably have a good idea what you mean by it, but you’re only going to save everyone—yourself included—time by copying the text of the standard MIT License form into your project. If you use metadata, like the `license` property in package manager metadata files, to designate the `MIT` license, make sure your `LICENSE` file and any header comments use the standard form text. All of this can be [automated][7].

##### Copyright Notice

> Copyright (c) <year> <copyright holders>

Until the 1976 Copyright Act, United States copyright law required specific actions, called “formalities”, to secure copyright in creative works. If you didn’t follow those formalities, your rights to sue others for unauthorized use of your work were limited, often completely lost. One of those formalities was “notice”: Putting marks on your work and otherwise making it known to the market that you were claiming copyright. The © is a standard symbol for marking copyrighted works, to give notice of copyright. The ASCII character set doesn’t have the © symbol, but `Copyright (c)` gets the same point across.

The 1976 Copyright Act, which “implemented” many requirements of the international Berne Convention, eliminated formalities for securing copyright. At least in the United States, copyright holders still need to register their copyrighted works before suing for infringement, with potentially higher damages if they register before infringement begins. In practice, however, many register copyright right before bringing suit against someone in particular. You don’t lose your copyright just by failing to put notices on it, registering, sending a copy to the Library of Congress, and so on.

Even if copyright notices aren’t as absolutely necessary as they used to be, they are still plenty useful. Stating the year a work was authored and who the copyright belonged to give some sense of when copyright in the work might expire, bringing the work into the public domain. The identity of the author or authors is also useful: United States law calculates copyright terms differently for individual and “corporate” authors. Especially in business use, it may also behoove a company to think twice about using software from a known competitor, even if the license terms give very generous permission. If you’re hoping others will see your work and want to license it from you, copyright notices serve nicely for attribution.

As for “copyright holder”: Not all standard form licenses have a space to write this out. More recent license forms, like [Apache 2.0][8] and [GPL 3.0][9], publish `LICENSE` texts that are meant to be copied verbatim, with header comments and separate files elsewhere to indicate who owns copyright and is giving the license. Those approaches neatly discourage changes to the “standard” texts, accidental or intentional. They also make automated license identification more reliable.

The MIT License descends from language written for releases of code by institutions. For institutional releases, there was just one clear “copyright holder”, the institution releasing the code. Other institutions cribbed these licenses, replacing “MIT” with their own names, leading eventually to the generic forms we have now. This process repeated for other short-form institutional licenses of the era, notably the [original four-clause BSD License][10] for the University of California, Berkeley, now used in [three-clause][11] and [two-clause][12] variants, as well as [The ISC License][13] for the Internet Systems Consortium, an MIT variant.

In each case, the institution listed itself as the copyright holder in reliance on rules of copyright ownership, called “[works made for hire][14]” rules, that give employers and clients ownership of copyright in some work their employees and contractors do on their behalf. These rules don’t usually apply to distributed collaborators submitting code voluntarily. This poses a problem for project-steward foundations, like the Apache Foundation and Eclipse Foundation, that accept contributions from a more diverse group of contributors. The usual foundation approach thus far has been to use a house license that states a single copyright holder—[Apache 2.0][8] and [EPL 1.0][15]—backed up by contributor license agreements—[Apache CLAs][16] and [Eclipse CLAs][17]—to collect rights from contributors. Collecting copyright ownership in one place is even more important under “copyleft” licenses like the GPL, which rely on copyright owners to enforce license conditions to promote software-freedom values.

These days, loads of projects without any kind of institutional or business steward use MIT-style license terms. SPDX and OSI have helped these use cases by standardizing forms of licenses like MIT and ISC that don’t refer to a specific entity or institutional copyright holder. Armed with those forms, the prevailing practice of project authors is to fill their own name in the copyright notice of the form very early on … and maybe bump the year here and there. At least under United States copyright law, the resulting copyright notice doesn’t give a full picture.

The original owner of a piece of software retains ownership of their work. But while MIT-style license terms give others rights to build on and change the software, creating what the law calls “derivative works”, they don’t give the original author ownership of copyright in others’ contributions. Rather, each contributor has copyright in any [even marginally creative][18] work they make using the existing code as a starting point.

Most of these projects also balk at the idea of taking contributor license agreements, to say nothing of signed copyright assignments. That’s both naive and understandable. Despite the assumption of some newer open-source developers that sending a pull request on GitHub “automatically” licenses the contribution for distribution on the terms of the project’s existing license, United States law doesn’t recognize any such rule. Strong copyright protection, not permissive licensing, is the default.

Update: GitHub later changed its site-wide terms of service to include an attempt to flip this default, at least on GitHub.com. I’ve written up some thoughts on that development, not all of them positive, in [another post][19].

To fill the gap between legally effective, well-documented grants of rights in contributions and no paper trail at all, some projects have adopted the [Developer Certificate of Origin][20], a standard statement contributors allude to using `Signed-Off-By` metadata tags in their Git commits. The Developer Certificate of Origin was developed for Linux kernel development in the wake of the infamous SCO lawsuits, which alleged that chunks of Linux’ code derived from SCO-owned Unix source. As a means of creating a paper trail showing that each line of Linux came from a contributor, the Developer Certificate of Origin functions nicely. While the Developer Certificate of Origin isn’t a license, it does provide lots of good evidence that those submitting code expected the project to distribute their code, and for others to use it under the kernel’s existing license terms. The kernel also maintains a machine-readable `CREDITS` file listing contributors with name, affiliation, contribution area, and other metadata. I’ve done [some][21] [experiments][22] adapting that approach for projects that don’t use the kernel’s development flow.

#### License Grant

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),

The meat of The MIT License is, you guessed it, a license. In general terms, a license is permission that one person or legal entity—the “licensor”—gives another—the “licensee”—to do something the law would otherwise let them sue for. The MIT License is a promise not to sue.

The law sometimes distinguishes licenses from promises to give licenses. If someone breaks a promise to give a license, you may be able to sue them for breaking their promise, but you may not end up with a license. “Hereby” is one of those hokey, archaic-sounding words lawyers just can’t get rid of. It’s used here to show that the license text itself gives the license, and not just a promise of a license. It’s a legal [IIFE][23].

While many licenses give permission to a specific, named licensee, The MIT License is a “public license”. Public licenses give everybody—the public at large—permission. This is one of the three great ideas in open-source licensing. The MIT License captures this idea by giving a license “to any person obtaining a copy of … the Software”. As we’ll see later, there is also a condition to receiving this license that ensures others will learn about their permission, too.

The parenthetical with a capitalized term in quotation marks (a “Definition”), is the standard way to give terms specific meanings in American-style legal documents. Courts will reliably look back to the terms of the definition when they see a defined, capitalized term used elsewhere in the document.

##### Grant Scope

> to deal in the Software without restriction,

From the licensee’s point of view, these are the seven most important words in The MIT License. The key legal concerns are getting sued for copyright infringement and getting sued for patent infringement. Neither copyright law nor patent law uses “to deal in” as a term of art; it has no specific meaning in court. As a result, any court deciding a dispute between a licensor and a licensee would ask what the parties meant and understood by this language. What the court will see is that the language is intentionally broad and open-ended. It gives licensees a strong argument against any claim by a licensor that they didn’t give permission for the licensee to do that specific thing with the software, even if the thought clearly didn’t occur to either side when the license was given.

> including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,

No piece of legal writing is perfect, “fully settled in meaning”, or unmistakably clear. Beware anyone who pretends otherwise. This is the least perfect part of The MIT License. There are three main issues:

First, “including without limitation” is a legal antipattern. It crops up in any number of flavors:

  * “including, without limitation”
  * “including, without limiting the generality of the foregoing”
  * “including, but not limited to”
  * many, many pointless variations



All of these share a common purpose, and they all fail to achieve it reliably. Fundamentally, drafters who use them try to have their cake and eat it, too. In The MIT License, that means introducing specific examples of “dealing in the Software”—“use, copy, modify” and so on—without implying that licensee action has to be something like the examples given to count as “dealing in”. The trouble is that, if you end up needing a court to review and interpret the terms of a license, the court will see its job as finding out what those fighting meant by the language. If the court needs to decide what “deal in” means, it cannot “unsee” the examples, even if you tell it to. I’d argue that “deal in the Software without restriction” alone would be better for licensees. Also shorter.

Second, the verbs given as examples of “deal in” are a hodgepodge. Some have specific meanings under copyright or patent law, others almost do or just plain don’t:

  * use appears in [United States Code title 35, section 271(a)][24], the patent law’s list of what patent owners can sue others for doing without permission.

  * copy appears in [United States Code title 17, section 106][25], the copyright law’s list of what copyright owners can sue others for doing without permission.

  * modify doesn’t appear in either copyright or patent statute. It is probably closest to “prepare derivative works” under the copyright statute, but may also implicate improving or otherwise derivative inventions.

  * merge doesn’t appear in either copyright or patent statute. “Merger” has a specific meaning in copyright, but that’s clearly not what’s intended here. Rather, a court would probably read “merge” according to its meaning in industry, as in “to merge code”.

  * publish doesn’t appear in either copyright or patent statute. Since “the Software” is what’s being published, it probably hews closest to “distribute” under the [copyright statute][25]. That statute also covers rights to perform and display works “publicly”, but those rights apply only to specific kinds of copyrighted work, like plays, sound recordings, and motion pictures.

  * distribute appears in the [copyright statute][25].

  * sublicense is a general term of intellectual property law. The right to sublicense means the right to give others licenses of their own, to do some or all of what you have permission to do. The MIT License’s right to sublicense is actually somewhat unusual in open-source licenses generally. The norm is what Heather Meeker calls a “direct licensing” approach, where everyone who gets a copy of the software and its license terms gets a license direct from the owner. Anyone who might get a sublicense under the MIT License will probably end up with a copy of the license telling them they have a direct license, too.

  * sell copies of is a mongrel. It is close to “offer to sell” and “sell” in the [patent statute][24], but refers to “copies”, a copyright concept. On the copyright side, it seems close to “distribute”, but the [copyright statute][25] makes no mention of sales.

  * permit persons to whom the Software is furnished to do so seems redundant of “sublicense”. It’s also unnecessary to the extent folks who get copies also get a direct license.




Lastly, as a result of this mishmash of legal, industry, general-intellectual-property, and general-use terms, it isn’t clear whether The MIT License includes a patent license. The general language “deal in” and some of the example verbs, especially “use”, point toward a patent license, albeit a very unclear one. The fact that the license comes from the copyright holder, who may or may not have patent rights in inventions in the software, as well as most of the example verbs and the definition of “the Software” itself, all point strongly toward a copyright license. More recent permissive open-source licenses, like [Apache 2.0][8], address copyright, patent, and even trademark separately and specifically.

##### Three License Conditions

> subject to the following conditions:

There’s always a catch! MIT has three!

If you don’t follow The MIT License’s conditions, you don’t get the permission the license offers. So failing to do what the conditions say at least theoretically leaves you open to a lawsuit, probably a copyright lawsuit.

Using the value of the software to the licensee to motivate compliance with conditions, even though the licensee paid nothing for the license, is the second great idea of open-source licensing. The last, not found in The MIT License, builds off license conditions: “Copyleft” licenses like the [GNU General Public License][9] use license conditions to control how those making changes can license and distribute their changed versions.

##### Notice Condition

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

If you give someone a copy of the software, you need to include the license text and any copyright notice. This serves a few critical purposes:

  1. Gives others notice that they have permission for the software under the public license. This is a key part of the direct-licensing model, where each user gets a license direct from the copyright holder.

  2. Makes known who’s behind the software, so they can be showered in praises, glory, and cold, hard cash donations.

  3. Ensures the warranty disclaimer and limitation of liability (coming up next) follow the software around. Everyone who gets a copy should get a copy of those licensor protections, too.




There’s nothing to stop you charging for providing a copy, or even a copy in compiled form, without source code. But when you do, you can’t pretend that the MIT code is your own proprietary code, or provided under some other license. Those receiving get to know their rights under the “public license”.

Frankly, compliance with this condition is breaking down. Nearly every open-source license has such an “attribution” condition. Makers of system and installed software often understand they’ll need to compile a notices file or “license information” screen, with copies of license texts for libraries and components, for each release of their own. The project-steward foundations have been instrumental in teaching those practices. But web developers, as a whole, haven’t got the memo. It can’t be explained away by a lack of tooling—there is plenty—or the highly modular nature of packages from npm and other repositories—which uniformly standardize metadata formats for license information. All the good JavaScript minifiers have command-line flags for preserving license header comments. Other tools will concatenate `LICENSE` files from package trees. There’s really no excuse.

##### Warranty Disclaimer

> The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement.

Nearly every state in the United States has enacted a version of the Uniform Commercial Code, a model statute of laws governing commercial transactions. Article 2 of the UCC—“Division 2” in California—governs contracts for sales of goods, from used automobiles bought off the lot to large shipments of industrial chemicals to manufacturing plants.

Some of the UCC’s rules about sales contracts are mandatory. These rules always apply, whether those buying and selling like them or not. Others are just “defaults”. Unless buyers and sellers opt out in writing, the UCC implies that they want the baseline rule found in the UCC’s text for their deal. Among the default rules are implied “warranties”, or promises by sellers to buyers about the quality and usability of the goods being sold.

There is a big theoretical debate about whether public licenses like The MIT License are contracts—enforceable agreements between licensors and licensees—or just licenses, which go one way, but may come with strings attached, their conditions. There is less debate about whether software counts as “goods”, triggering the UCC’s rules. There is no debate among licensors on liability: They don’t want to get sued for lots of money if the software they give away for free breaks, causes problems, doesn’t work, or otherwise causes trouble. That’s exactly the opposite of what three default rules for “implied warranties” do:

  1. The implied warranty of “merchantability” under [UCC section 2-314][26] is a promise that “the goods”—the Software—are of at least average quality, properly packaged and labeled, and fit for the ordinary purposes they are intended to serve. This warranty applies only if the one giving the software is a “merchant” with respect to the software, meaning they deal in software and hold themselves out as skilled in software.

  2. The implied warranty of “fitness for a particular purpose” under [UCC section 2-315][27] kicks in when the seller knows the buyer is relying on them to provide goods for a particular purpose. The goods need to actually be “fit” for that purpose.

  3. The implied warranty of “noninfringement” is not part of the UCC, but is a common feature of general contract law. This implied promise protects the buyer if it turns out the goods they received infringe somebody else’s intellectual property rights. That would be the case if the software under The MIT License didn’t actually belong to the one trying to license it, or if it fell under a patent owned by someone else.




[Section 2-316(3)][28] of the UCC requires language opting out of, or “excluding”, implied warranties of merchantability and fitness for a particular purpose to be conspicuous. “Conspicuous” in turn means written or formatted to call attention to itself, the opposite of microscopic fine print meant to slip past unwary consumers. State law may impose a similar attention-grabbing requirement for disclaimers of noninfringement.

Lawyers have long suffered under the delusion that writing anything in `ALL-CAPS` meets the conspicuous requirement. That isn’t true. Courts have criticized the Bar for pretending as much, and most everyone agrees all-caps does more to discourage reading than compel it. All the same, most open-source-license forms set their warranty disclaimers in all-caps, in part because that’s the only obvious way to make it stand out in plain-text `LICENSE` files. I’d prefer to use asterisks or other ASCII art, but that ship sailed long, long ago.

##### Limitation of Liability

> In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.

The MIT License gives permission for software “free of charge”, but the law does not assume that folks receiving licenses free of charge give up their rights to sue when things go wrong and the licensor is to blame. “Limitations of liability”, often paired with “damages exclusions”, work a lot like licenses, as promises not to sue. But these are protections for the licensor against lawsuits by licensees.

In general, courts read limitations of liability and damages exclusions warily, since they can shift an incredible amount of risk from one side to another. To protect the community’s vital interest in giving folks a way to redress wrongs done in court, they “strictly construe” language limiting liability, reading it against the one protected by it where possible. Limitations of liability have to be specific to stand up. Especially in “consumer” contracts and other situations where those giving up the right to sue lack sophistication or bargaining power, courts have sometimes refused to honor language that seemed buried out of sight. Partly for that reason, partly by sheer force of habit, lawyers tend to give limits of liability the all-caps treatment, too.

Drilling down a bit, the “limitation of liability” part is a cap on the amount of money a licensee can sue for. In open-source licenses, that limit is always no money at all, $0, “not liable”. By contrast, in commercial licenses, it’s often a multiple of license fees paid in the last 12-month period, though it’s often negotiated.

The “exclusion” part lists, specifically, kinds of legal claims—reasons to sue for damages—the licensor cannot use. Like many, many legal forms, The MIT License mentions actions “of contract”—for breaching a contract—and “of tort”. Tort rules are general rules against carelessly or maliciously harming others. If you run someone down on the road while texting, you have committed a tort. If your company sells faulty headphones that burn peoples’ ears off, your company has committed a tort. If a contract doesn’t specifically exclude tort claims, courts sometimes read exclusion language in a contract to prevent only contract claims. For good measure, The MIT License throws in “or otherwise”, just to catch the odd admiralty law or other, exotic kind of legal claim.

The phrase “arising from, out of or in connection with” is a recurring tick symptomatic of the legal draftsman’s inherent, anxious insecurity. The point is that any lawsuit having anything to do with the software is covered by the limitation and exclusions. On the off chance something can “arise from”, but not “out of”, or “in connection with”, it feels better to have all three in the form, so pack ‘em in. Never mind that any court forced to split hairs in this part of the form will have to come up with different meanings for each, on the assumption that a professional drafter wouldn’t use different words in a row to mean the same thing. Never mind that in practice, where courts don’t feel good about a limitation that’s disfavored to begin with, they’ll be more than ready to read the scope trigger narrowly. But I digress. The same language appears in literally millions of contracts.

#### Overall

All these quibbles are a bit like spitting out gum on the way into church. The MIT License is a legal classic. The MIT License works. It is by no means a panacea for all software IP ills, in particular the software patent scourge, which it predates by decades. But MIT-style licenses have served admirably, fulfilling a narrow purpose—reversing troublesome default rules of copyright, sales, and contract law—with a minimal combination of discreet legal tools. In the greater context of computing, its longevity is astounding. The MIT License has outlasted and will outlast the vast majority of software licensed under it. We can only guess how many decades of faithful legal service it will have given when it finally loses favor. It’s been especially generous to those who couldn’t have afforded their own lawyer.

We’ve seen how the The MIT License we know today is a specific, standardized set of terms, bringing order at long last to a chaos of institution-specific, haphazard variations.

We’ve seen how its approach to attribution and copyright notice informed intellectual property management practices for academic, standards, commercial, and foundation institutions.

We’ve seen how The MIT Licenses grants permission for software to all, for free, subject to conditions that protect licensors from warranties and liability.

We’ve seen that despite some crusty verbiage and lawyerly affectation, one hundred and seventy one little words can get a hell of a lot of legal work done, clearing a path for open-source software through a dense underbrush of intellectual property and contract.

I’m so grateful for all who’ve taken the time to read this rather long post, to let me know they found it useful, and to help improve it. As always, I welcome your comments via [e-mail][29], [Twitter][30], and [GitHub][31].

A number of folks have asked where they can read more, or find run-downs of other licenses, like the GNU General Public License or the Apache 2.0 license. No matter what your particular continuing interest may be, I heartily recommend the following books:

  * Andrew M. St. Laurent’s [Understanding Open Source & Free Software Licensing][32], from O’Reilly.

I start with this one because, while it’s somewhat dated, its approach is also closest to the line-by-line approach used above. O’Reilly has made it [available online][33].

  * Heather Meeker’s [Open (Source) for Business][34]

In my opinion, by far the best writing on the GNU General Public License and copyleft more generally. This book covers the history, the licenses, their development, as well as compatibility and compliance. It’s the book I lend to clients considering or dealing with the GPL.

  * Larry Rosen’s [Open Source Licensing][35], from Prentice Hall.

A great first book, also available for free [online][36]. This is the best introduction to open-source licensing and related law for programmers starting from scratch. This one is also a bit dated in some specific details, but Larry’s taxonomy of licenses and succinct summary of open-source business models stand the test of time.




All of these were crucial to my own education as an open-source licensing lawyer. Their authors are professional heroes of mine. Have a read! — K.E.M

I license this article under a [Creative Commons Attribution-ShareAlike 4.0 license][37].


--------------------------------------------------------------------------------

via: https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html

作者：[Kyle E. Mitchell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kemitchell.com/
[b]: https://github.com/lujun9972
[1]: http://spdx.org/licenses/MIT
[2]: https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT
[3]: https://opensource.org
[4]: https://spdx.org
[5]: http://spdx.org/licenses/
[6]: https://spdx.org/licenses/JSON
[7]: https://www.npmjs.com/package/licensor
[8]: https://www.apache.org/licenses/LICENSE-2.0
[9]: https://www.gnu.org/licenses/gpl-3.0.en.html
[10]: http://spdx.org/licenses/BSD-4-Clause
[11]: https://spdx.org/licenses/BSD-3-Clause
[12]: https://spdx.org/licenses/BSD-2-Clause
[13]: http://www.isc.org/downloads/software-support-policy/isc-license/
[14]: http://worksmadeforhire.com/
[15]: https://www.eclipse.org/legal/epl-v10.html
[16]: https://www.apache.org/licenses/#clas
[17]: https://wiki.eclipse.org/ECA
[18]: https://en.wikipedia.org/wiki/Feist_Publications,_Inc.,_v._Rural_Telephone_Service_Co.
[19]: https://writing.kemitchell.com/2017/02/16/Against-Legislating-the-Nonobvious.html
[20]: http://developercertificate.org/
[21]: https://github.com/berneout/berneout-pledge
[22]: https://github.com/berneout/authors-certificate
[23]: https://en.wikipedia.org/wiki/Immediately-invoked_function_expression
[24]: https://www.govinfo.gov/app/details/USCODE-2017-title35/USCODE-2017-title35-partIII-chap28-sec271
[25]: https://www.govinfo.gov/app/details/USCODE-2017-title17/USCODE-2017-title17-chap1-sec106
[26]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2314.&lawCode=COM
[27]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2315.&lawCode=COM
[28]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2316.&lawCode=COM
[29]: mailto:kyle@kemitchell.com
[30]: https://twitter.com/kemitchell
[31]: https://github.com/kemitchell/writing/tree/master/_posts/2016-09-21-MIT-License-Line-by-Line.md
[32]: https://lccn.loc.gov/2006281092
[33]: http://www.oreilly.com/openbook/osfreesoft/book/
[34]: https://www.amazon.com/dp/1511617772
[35]: https://lccn.loc.gov/2004050558
[36]: http://www.rosenlaw.com/oslbook.htm
[37]: https://creativecommons.org/licenses/by-sa/4.0/legalcode
