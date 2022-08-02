[#]: subject: "What Made Fedora Choose To Use CC0 Licensed Code As The Boot"
[#]: via: "https://www.opensourceforu.com/2022/08/what-made-fedora-choose-to-use-cc0-licensed-code-as-the-boot/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What Made Fedora Choose To Use CC0 Licensed Code As The Boot
======
![fedora-1024x614][1]

Open source is a challenging concept. Many people interpret this to mean that they can use a specific piece of software however they choose and that it is free to download. The actual rights you as a user are granted, however, depend largely on which licence the developers chose to share their code under. Open source software can be expensive, can restrict how you can use it, and in rare circumstances, can even land you in legal trouble.

The Fedora Project recently decided to reject all code that is licenced under the Creative Commons “Public Domain Dedication” CC0 licence in an effort to avoid precisely this situation. CC0 will soon be removed from the list of permissible code licences for all new submissions, however it will still be permitted for material like artwork and there might even be exceptions made for current packages on a case-by-case basis.

It wouldn’t ordinarily make the news if Fedora objected to a software licence. In fact, the project rejects a number of licences that are on a fairly extensive list. The unexpected aspect of this situation is that CC0 was originally regarded as a valid licence, and is only now being reclassified as a result of a shift in perspective within the greater free and open source (FOSS) community.

What exactly is wrong with CC0 that Fedora decided to stop supporting it, and does this indicate you shouldn’t use the licence for your own projects?

The part of this narrative that may surprise those who are familiar with Creative Commons and its family of licences the most is that the Fedora Project formerly approved CC0 for software in the first place. After all, the goal from the beginning was to develop a range of licences expressly for artistic works. The organization’s mission and licence requirements are stated in the name itself.

To “overcome legal hurdles to the sharing of information and creativity” by offering a free framework under which people and organisations might share things like music, artwork, or educational material, Creative Commons, the forerunner of the previous Open Content Project, was established in 2001. Software, however, was never a factor. Why might that be? At that time, important software licences like the MIT License and the GNU General Public License had already been around for more than ten years.

It seems obvious that you should probably believe a company if they go out of their way to warn you that something they have made is unsuitable for a particular use. The Creative Commons FAQ lists a number of compelling arguments against using their licences for software, but one in particular jumps out for users like the Fedora Project: patent rights.

This may seem contradictory given that the CC0 licence is meant for works in the public domain and that by using it, the creator expressly “waives all of his or her rights to the work globally under copyright law.” However, the issue is that copyright legislation does not apply to patents. In fact, a review of the license’s complete wording reveals that it directly tackles this in a worrying section that reads, “No trademark or patent rights held by Affirmer are waived, abandoned, relinquished, leased or otherwise modified by this document.”

In other words, even while the author of something that has been licenced under CC0 may be willing to give up the rights to it, they are still free to patent it. What’s even worse is that they still retain the ability to use that patent however they see fit. Theoretically, this means that the creator of a piece of source code that was first made available under CC0 may later assert that anyone who utilised the code violated their patent and could demand royalties.

It’s very obvious why something like this would worry the Fedora Project. Consider a scenario where CC0-licensed code is incorporated into a system’s core package and then made available to millions of users. Out of nowhere, the original creator appears, alleges patent violation, and wants payment. Could Red Hat’s or Fedora’s attorneys refute such a claim? Maybe. Is it worth it to use CC0 code in order to find out for sure? Zero chance.

It’s important to note that this is not at anyway a new issue. In fact, back in 2012, the patent clause prevented the Open Source Initiative’s (OSI) License Review Committee from conclusively determining if CC0 genuinely complied with their definition of an open source licence. The Committee was unable to come to an agreement because its members believed that included such terms in a software licence would create a risky precedent. Fedora’s decision to ever accept CC0 in the first place is even more puzzling given its turbulent history.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/what-made-fedora-choose-to-use-cc0-licensed-code-as-the-boot/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/08/fedora-1024x614-1-e1659346500461.jpg
