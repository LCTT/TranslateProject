[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sharing vs. free vs. public: The real definition of open source)
[#]: via: (https://opensource.com/article/19/10/shareware-vs-open-source)
[#]: author: (Jeffrey Robert Kaufman https://opensource.com/users/jkaufman)

Sharing vs. free vs. public: The real definition of open source
======
If you think open source is synonymous with shareware, freeware, and
public domain, you are not alone.
![Person in a field of dandelions][1]

When you hear the term open source, do you think this is synonymous with terms such as shareware, freeware, or public domain? If so, you are not alone. Many people, both within and without the technology industry, think of these terms as one and the same. This article illustrates how these terms are different and how open source is a transformative licensing and development model. Perhaps the best way to explore the differences will be to share my experience with software provided under one of the above models.

### Shareware and freeware

My early years as a computer programmer started when I began to code in BASIC on my Apple II Plus in 1982. I recall going to the local computer store in my hometown and finding floppy diskettes in plastic bags containing software games and utilities for what seemed to be extraordinarily high prices. Keep in mind, this was from the perspective of a middle-schooler.

There was, however, some software that was available for free or at a minimal price; this was referred to as shareware or freeware, depending on the exact licensing model. Under the shareware model, you could use the software for only a certain amount of time, and/or if you found it useful, then there was a request that you send in a check to the author of that software.

Some shareware software, however, actually encouraged you to also make a copy and give it to your friends. This model is often referred to as freeware. That said, the exact definitions and differences between shareware and freeware are a bit soft, so it's collectively easiest to refer to both simply as "shareware." I cannot say for certain, but I doubt I ever provided money to any of the software authors for using their shareware, mainly because I had no money as an early teenager, but I sure enjoyed using these software programs and learned a lot about computers along the way.

In retrospect, I realize now that I could have learned and accomplished so much more in my growth as a budding programmer if the software had been provided under open source license terms instead of shareware terms. This is because the source code (i.e., the human-readable form of software) is almost never provided with shareware. Shareware also contains licensing restrictions that prohibit the recipient from attempting to reveal the source code. Without access to the source code, it is extraordinarily difficult to learn how the software actually works, making it very difficult to expand or change its functionality. This leaves the end user completely dependent on the original shareware author for any changes or improvements.

With the shareware model, it is practically impossible to enable any community of developers to leverage and further innovate around the code. There can also be further restrictions on redistribution and commercial usage. Although the shareware may be free in terms of price (at least initially), _it is not free in terms of freedom_ and does not allow you to learn and innovate by exploring the inner workings of the code.

Which leads me to the big question: _How is this different from open source software?_

### The basics of open source licensing

First, we need to understand that "open source" refers to a _licensing_ and a _software development model_ that are both significantly different than shareware. Under one form of open source called non-copyleft open source licensing, the user is provided key freedoms such as no restrictions on accessing source code; selling, using, or giving away the software for any purpose; or modifying the software.

This form of license also does not require payment of any fee or royalty for use. One amazing outcome of this licensing model is its unique ability to enable countless software developers to collaborate on new and useful changes and innovations to the code because the license is highly permissive, requiring no negotiations for use. Although the source code is technically not required to be provided under such a license, it is almost always available for everyone to view, learn from, modify, and distribute to others.

Another aspect of non-copyleft open source licensing is that any recipient of such software may add additional license restrictions. This means that the initial author that licensed the code under this form of license has no assurances that the recipient may not further license to others under more restrictive terms. For example:

> _Let us assume an author, Noah, wrote some software and distributed it under a non-copyleft open source license to a recipient, Aviva. Aviva then modifies and improves Noah's software, which she is entitled to do under the non-copyleft open source license terms. Aviva could then decide to add further restrictions to any recipients of her software that could limit its use, such as where or how it may be used (e.g., Aviva could add in a restriction that the software may only be used within the geographical boundaries of California and never in any nuclear power plant). Aviva could also opt to never release the modified source code to others even though she had access to the source code._

Sadly, there are countless proprietary software companies that use non-copyleft open source licensed software in the way described immediately above. In fact, a shareware program could use non-copyleft open source licensed software by adding shareware-type restrictions (e.g., no access to source code or excluding commercial use) thereby converting non-copyleft open source licensed code to a shareware licensing model.

Fortunately, many proprietary companies using non-copyleft open source licensed software see the benefits of releasing source code. These organizations often continue to perpetuate the open source model by providing their modified source code to their recipients or the broader open source community via software repositories like GitHub to enable a virtuous cycle of innovation. This isn't entirely out of benevolence (or at least it normally isn't): These companies want to encourage community innovation and further enhancements, which can benefit them further.

At the same time, many proprietary companies do not opt to do this, which is well within the terms of non-copyleft open source licenses.

### Copyleft-licensed open source software

In 1989, a new open source license named the GNU General Public License, also known commonly as the GPL license, was developed with the objective to ensure that software should be inherently free (as in free speech) and that that these freedoms must always persist, unlike what sometimes happens with non-copyleft open source licensed software. In a unique application of copyright law, the GPL uses copyright law to ensure perpetual software freedoms, so long as the rules are followed (more on that later). This unique use of copyright is called copy**left**.

Like non-copyleft open source software, this license allows recipients to use the software without restriction, examine the source code, change the software, and make further distributions of the original or modified software to other recipients. _Unlike_ a non-copyleft open source license, the copyleft open source license absolutely requires that any recipients are also provided these same freedoms. They can never be taken away unless the rules are not followed.

What makes the copyleft open source license enforceable and an incentive for compliance is the application of copyright law. If one of the recipients of copyleft code does not comply with the license terms (e.g., by adding any additional restrictions on the use of the software or not providing the source code), then their license terminates, and they become a copyright infringer because they no longer have legal permission to use the software. In this way, the software freedoms are ensured for any downstream recipients of that copyleft software.

### Beyond the basics: Other software license models

I mentioned public domain earlier—while it's commonly conflated with open source, this model is a bit different. Public domain means that steps have been taken to see that there are no applicable copyright rights associated with the software, which most often happens when the software copyright expires or is disclaimed by the author. (In many countries, the mechanism to disclaim copyright is unclear, which is why some public domain software may provide an option to obtain an open source-type license as a fallback.) No license is required to use public domain software; whether this makes it "open source" or not is the subject of much debate, though many would consider public domain a form of open source if the source code were made available.

Interestingly, there are a significant number of open source projects that make use of small modules of public domain software for certain functions. There are even entire programs that claim to be in the public domain, such as SQLite, which implements a SQL database engine and is used in many applications and devices. It is also common to see software with no license terms.

Many people incorrectly assume that such unlicensed software is open source, in the public domain, or otherwise free to use without restriction. In most countries, including the United States, copyright in software exists when it is created. This means that it cannot be used without permission in the form of a license, unless the copyright is somehow disclaimed, rendering it in the public domain. Some exceptions exist to this general rule, like the laws of implied licenses or fair use, but these are quite complex in how they may apply to a specific situation. I do not recommend providing software with no license terms when the intention is for it to be under open source license terms as this leads to confusion and potential misuse.

### Benefits of open source software

As I said previously, open source enables an efficient software development model with enormous ability to drive innovation. But what does this really mean?

One of the benefits of the open source licensing model is a significant reduction in the friction around innovation, especially innovation done by other users beyond the original creator. This friction is limited because using open source code generally does not require the negotiation of license terms, thereby greatly simplifying and lowering any cost burden for use. In turn, this creates a type of open source ecosystem that encourages rapid modification and combination of existing technologies to form something new. These changes are often provided back into this open source ecosystem, creating a cycle of innovation.

There is an innumerable number of software programs that run everything from your toaster to Mars-going spacecraft that are the direct result of this effortless ability to combine various programs together… all enabled by the open source development model.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/shareware-vs-open-source

作者：[Jeffrey Robert Kaufman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkaufman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_dandelion_520x292.png?itok=-xhFQvUj (Person in a field of dandelions)
