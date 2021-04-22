[#]: subject: (Here’s Why University of Minnesota is Getting Banned from Contributing to Linux Kernel Code)
[#]: via: (https://news.itsfoss.com/hypocrite-commits/)
[#]: author: (Abhishek https://news.itsfoss.com/author/root/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Here’s Why University of Minnesota is Getting Banned from Contributing to Linux Kernel Code
======

It all started with a seemingly innocent patch to the Linux kernel on the 6th April, 2021. A Ph.D. candidate at [University of Minnesota][1] submitted this really small patch:

![][2]

Since the patch was simple and seemed to improve the code quality, it got green light from a couple of members initially but then it got questioned by [Eric Dumazet on 9th April][3].

It was on the 19th April when veteran kernel contributor Al Viro rebuked the contributor for submitting a “fix that does not fix anything”. And at this point, he points out two possibilities for such a garbage code submission:

> Plainly put, the patch demonstrates either complete lack of understanding or somebody not acting in good faith. If it’s the latter[1], may I suggest the esteemed sociologists to fuck off and stop testing the reviewers with deliberately spewed excrements?

If you feel that he used too strong words, there is a reason and history behind that.

### Stealthily introducing vulnerabilities in open source software via hypocrite commits

Well, that’s the title of a [research paper][4] submitted by Qiushi Wu (Ph.D. student), Kangjie Lu (assistant professor) of University of Minnesota.

The researchers were [testing the feasibility of stealthily introducing vulnerabilities in OSS][5] via hypocrite commits, i.e., seemingly beneficial commits that in fact introduce other critical issues.

And they chose the Linux kernel project to carry out their experiments.

Al Viro found that the ‘useless patch’ from Aditya Pakki was likely to be part of this research. Greg Kroah-Hartman (GKH), the second-in-command of the Kernel project after Linus Torvalds, advised not to waste the kernel maintainer’s time such patches.

> Please stop submitting known-invalid patches. Your professor is playing around with the review process in order to achieve a paper in some strange and bizarre way.
>  This is not ok, it is wasting our time, and we will have to report this, AGAIN, to your university…

Apparently, that was not the only troublesome patch request. As [Leon Romanovsky noted,][6] there were 3 more such patches from the same researcher.

![][7]

Due to the public bashing, the university researcher tried to play victim and started to blame kernel maintainer’s attitude.

> I respectfully ask you to cease and desist from making wild accusations that are bordering on slander.
>
> These patches were sent as part of a new static analyzer that I wrote and it’s sensitivity is obviously not great. I sent patches on the hopes to get feedback. We are not experts in the linux kernel and repeatedly making these statements is disgusting to hear.
>
> Obviously, it is a wrong step but your preconceived biases are so strong that you make allegations without merit nor give us any benefit of doubt.
>
> I will not be sending any more patches due to the attitude that is not only unwelcome but also intimidating to newbies and non experts.

This [irked Greg][8] to the extent that he stated that he “will now have to ban all future contributions from your University and rip out your previous contributions, as they were obviously submitted in bad-faith with the intent to cause problems.”

![][9]

Research and stuff is fine but it should not be at the expense of trolling busy people. That’s what I think.

I wonder how Linux Torvalds would have reacted to this patch!

![][10]

![][11]

I'm not interested

#### _Related_

  * [Guess Who Contributed the Most to Linux Kernel 5.10 Development? It's Huawei (and Intel)][12]
  * ![][13] ![Huawei Linux Kernel Contribution][14]


  * [Linux Kernel 5.9 Reached End of Life. Here's What You Should Do Now!][15]
  * ![][13] ![Linux kernel 5.9 reached end of life][16]


  * [The LTS Linux Kernel 5.10 To Be Maintained For Only 2 Years If Companies Don't Help Support It][17]
  * ![][13] ![Linux Kernel 5.10][18]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/hypocrite-commits/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://twin-cities.umn.edu/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ1NScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[3]: https://lore.kernel.org/lkml/bd3c84bc-6ae0-63e9-61f2-5cf64a976531@gmail.com/
[4]: https://cse.umn.edu/cs/news/paper-accepted-ieee-symposium-security-and-privacy-2021
[5]: https://github.com/QiushiWu/QiushiWu.github.io/blob/main/papers/OpenSourceInsecurity.pdf
[6]: https://lore.kernel.org/linux-nfs/YH+zwQgBBGUJdiVK@unreal/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIyNicgd2lkdGg9Jzc0NCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[8]: https://lore.kernel.org/linux-nfs/YH%2FfM%2FTsbmcZzwnX@kroah.com/
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzYzMScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI3MCcgd2lkdGg9JzQ4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI1MCcgd2lkdGg9Jzc1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[12]: https://news.itsfoss.com/huawei-kernel-contribution/
[13]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[14]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/huawei-kernel-contribution.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[15]: https://news.itsfoss.com/kernel-5-9-end-of-life/
[16]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/linux-kerne-5-9-eol.png?fit=1200%2C675&ssl=1&resize=350%2C200
[17]: https://news.itsfoss.com/linux-kernel-5-10-support/
[18]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/linux-kernel-5-10-support.png?fit=1200%2C675&ssl=1&resize=350%2C200
