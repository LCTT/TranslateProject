[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Supply Chain: A Matter of Trust)
[#]: via: (https://www.linux.com/articles/open-source-supply-chain-a-matter-of-trust/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Open Source Supply Chain: A Matter of Trust
======

[![][1]][2]

_**Co-authored by Curtis Franklin, Jr**_

Open source software is often considered safer and more secure than proprietary software because users can, if they want, compile the software from the source code. They know the source of the code running in their environment.  Every component that they are running in their environment can be audited and the developer held accountable.  

However, users and vendors are moving away from complexity that comes with total control and embracing convenience and ease of use.

“I am often taken aback when I see a talk around security and privacy and then the presenter runs the ‘docker run’ command to install and run some random binary downloaded from the internet,” said [Dirk Hohndel, Vice-President and Chief Open Source Officer at VMware.][3] “Those two things seem to be a little bit at odds with each other.”

The software supply chain — the process that takes an application from coding through packaging and distribution to its ultimate user — is complicated. If done wrong, it could be potentially risky, especially for open source software.  A malevolent player can get access to the backend and start inserting any random binary code onto a user’s system without that user’s knowledge or control.

It’s not a problem specific to the cloud-native world. It can be seen in modern app development environments, including JavaScript, npm, PyPI, RubyGems, and so on.  Even Homebrew on Mac used to be provided through source code that a user would compile themselves. 

“Today, you just download the binary and install it, hoping that it’s built from the same source code that you have access to,” said Hohndel. “As an industry, we need to pay more attention to our supply chain.  It’s something that is extremely important to me and that I’m trying to get more people interested in it.” 

It’s not simply a binary versus source code equation, though. There are huge advantages to just running a binary instead of having to build everything from sources.   It allows developers to be more flexible and more responsive in their turnaround. They can cycle very quickly through new development and product releases by reusing some binaries.

“It would be nice if there was a way to sign these binaries and have an ‘on-the-fly’ verification mechanism so users know they can trust these,” said Hohndel.

Linux distributions have solved this problem as the distributions act as gatekeepers who check the integrity of packages that go into supported repositories. 

“Packages offered through distributions like Debian are signed with a key. It takes a lot of work to ensure that this is really the software that should be in the distribution. They have solved the supply chain problem,” said Hohndel.

But even on Linux distribution, people want to simplify things and trade correctness and security for speed. There are now projects like AppImage, Snap and Flatpack that have adopted the binary route, bringing the trust issue to Linux distributions. It’s the same problem of docker containers all over again.

“The ideal solution would be to find a way for us as a community to devise a system of trust which ensures that if a binary was signed with a key that is in the network of trust, it can be trusted and provides us with the ability to reliably go back to the sources and do an audit,” suggested Hohndel.

However, all this additional steps incur costs that most projects are either unwilling or unable to afford. Some projects are trying to find ways around the problem. NPM, for example, has begun to encourage those submitting packages to properly authenticate and secure their accounts to improve trustworthiness on the platform. 

**Open Source Community Is Good At Solving Problems**

Hohndel is involved with many efforts to solve the open source supply chain problem and is spreading awareness about it. Last year, [VMware acquired Bitnami,][4] which is a great place for curating open source applications that are signed by VMware. 

“We are talking with upstream open source communities in various ecosystems to raise awareness about it. We are also discussing technical solutions that will make it easier for these communities to solve the underlying problems,” said Hohndel.

The open source community has historically been diligent at ensuring software quality, including the mechanisms for security and privacy. Still, Hohndel says, “The biggest concern that I have is that, in the excitement about the next new thing, we often ignore the underlying engineering discipline that we really need.”

Ultimately, Hohndel feels that answer will come from the open source community itself. “Open source is an engineering methodology and it’s a social experiment. Open source is all about people trusting each other, working with each other, collaborating across borders, between companies, amongst competitors in ways that we didn’t do before,” he explains.

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/open-source-supply-chain-a-matter-of-trust/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/01/hand-1137978_1920-1068x801.jpg (hand-1137978_1920)
[2]: https://www.linux.com/wp-content/uploads/2020/01/hand-1137978_1920.jpg
[3]: https://www.swapnilbhartiya.com/open-source-leaders-dirk-hohndel-brings-open-source-to-vmware/
[4]: https://techcrunch.com/2019/05/15/vmware-acquires-bitnami-to-deliver-packaged-applications-anywhere/
