[#]: subject: "FSF Does Not Accept Debian as a Free Distribution. Here’s Why!"
[#]: via: "https://news.itsfoss.com/fsf-does-not-consider-debian-a-free-distribution/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

FSF Does Not Accept Debian as a Free Distribution. Here’s Why!
======
![Why FSF doesn't consider Debian a free distribution][1]

The Debian Project develops a free GNU/Linux distribution that respects the freedom of its users. It’s not uncommon for software, the source code of which is distributed under this or that free license, to contain non-free components. In this case, the software is cleaned before being released into Debian. The Free Software Foundation (FSF), in turn, maintains a [list of free GNU/Linux distributions][2], but oddly enough, Debian is not there. The fact is that Debian does not meet some criteria for getting on this list and we have to figure out which ones. But first, you need to understand how all this intellectual work is justified. In other words, why bother trying to get on some lists and this one in particular?

Stefano Zacchiroli, who used to be the leader of the Debian Project from 2010 to 2013, once voiced several reasons why Debian should have got the FSF to obtain the status of free distribution. One of these reasons, which Stefano called “external review”, I especially liked. The fact is that Debian has criteria and quality standards that software must meet to become part of the distribution, but no one except the Debian developers themselves controls this process. If the distribution had been included in that cherished list, the FSF would have been keeping a close eye on the fate of Debian with moderate criticism. Excellent motivation, I believe. If you also think so, then let’s now have a look at the reasons why the FSF considers Debian as not free enough.

### Debian Social Contract

Along with the list of free GNU/Linux distributions, the FSF maintains a list of GNU/Linux distributions that have been rejected a free status for one reason or another. For each distribution in this list, there is a comment with a brief argument for refusal. From the comment on Debian, it becomes clear that the main source of disagreement between the FSF and the Debian Project in the interpretation of the phrase “free distribution” is a document known as the Debian Social Contract.

The Debian Social Contract has five points. To answer the main question, we need only two of them – the first and the fifth, so they will be given below, and the others are omitted. Check out the full version of the contract [here][3].

The first point says: «**Debian will remain 100% free**. We provide the guidelines that we use to determine if a work is “free” in the document entitled “The Debian Free Software Guidelines”. We promise that the Debian system and all its components will be free according to these guidelines. We will support people who create or use both free and non-free works on Debian. We will never make the system require the use of a non-free component.»

At the same time, the fifth point reads: «**Works that do not meet our free software standards**. We acknowledge that some of our users require the use of works that do not conform to the Debian Free Software Guidelines. We have created “contrib” and “non-free” areas in our archive for these works. The packages in these areas are not part of the Debian system, although they have been configured for use with Debian. We encourage CD manufacturers to read the licenses of the packages in these areas and determine if they can distribute the packages on their CDs. Thus, although non-free works are not a part of Debian, we support their use and provide infrastructure for non-free packages (such as our bug tracking system and mailing lists).»

Although the contract states that the distribution will remain 100% free, it allows sections of the official archive that may contain non-free software or free software that depends on some non-free components. Formally, the software in these sections, according to the same contract, is not part of Debian, but the FSF is haunted by this since these sections make it much easier to install non-free software on a system.

Until 2011, the FSF had reasonable grounds not to consider Debian free – the distribution was shipped with a Linux kernel uncleaned from binary blobs. But since the February 2011 release of Squeeze to this day, Debian has included the free Linux kernel. Thus, simplifying the installation of non-free software is the main reason why the FSF cannot recognize Debian as free distribution, and until 2016 this was the only reason I knew, but in early 2016 something went wrong…

### Wait… what’s Firefox doing here?

For a long time, Debian included a browser called Iceweasel, which was nothing more than a rebrand of the Firefox browser. The rebranding was carried out for two reasons. First, the browser logo and name are trademarks of the Mozilla Foundation, and the provision of non-free software contradicts the DFSG. Second, by including the browser in the distribution, the Debian developers had to comply with the requirements of the Mozilla Foundation, which prohibits the delivery of a modified version of the browser under the name Firefox. Thus, the developers had to change the name, because they constantly make changes to the browser code to fix bugs and eliminate vulnerabilities. But at the beginning of 2016 Debian was lucky to have a modified browser that does not fall under the above restrictions and can retain the original name and logo. On the one hand, this is a recognition of merit and a demonstration of trust in Debian. On the other hand, the software, obviously uncleaned from non-free components, is now a part of the distribution. If by this time Debian had been included in the list of free GNU/Linux distributions, the Free Software Foundation wouldn’t have hesitated to point this out.

### Conclusion

Freedom in the digital world is as important as freedom in the real world. In this article, I tried to reveal one of the most important features of Debian – developing distribution with regard to the freedom of its users. Developers spend extra time cleaning up non-free components from software, and dozens of distributions for which Debian is the technology base inherit its work, and with it, a piece of freedom.

Also, I wanted to share a simple observation that freedom is not as straightforward as it might seem at first glance, and it is quite natural to enquire what is really free and what is not. Debian cannot be called a free GNU/Linux distribution now because of the presence of Firefox in it. But from 2011, when Debian finally began cleaning the kernel along with other components of the distribution, and until 2016, when Firefox became part of the distribution, the Free Software Foundation did not consider the distribution to be free for purely ideological reasons: Debian greatly simplifies the installation of non-free software… Now it’s your turn to weigh up all the arguments and decide whether to consider the GNU/Linux distribution as free or not.

Good luck! And stay as free as possible.

Written by Evgeny Golyshev for [Cusdeb.com][4]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fsf-does-not-consider-debian-a-free-distribution/

作者：[Abhishek][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/why-fsf-doesnt-consider-debian-a-free-software-1200-%C3%97-675px.png
[2]: https://gnu.org/distros/free-distros.en.html
[3]: https://debian.org/social_contract
[4]: https://wiki.cusdeb.com/Essays:Why_the_FSF_does_not_consider_Debian_as_a_free_distribution/en
