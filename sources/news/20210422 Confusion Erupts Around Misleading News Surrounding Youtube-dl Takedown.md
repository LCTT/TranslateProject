[#]: subject: (Confusion Erupts Around Misleading News Surrounding Youtube-dl Takedown)
[#]: via: (https://news.itsfoss.com/youtube-dl-repo-fork/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Confusion Erupts Around Misleading News Surrounding Youtube-dl Takedown
======

In November 2020, [GitHub took down the Youtube-dl repository][1] after a complaint from the [RIAA][2]. This action caused a huge backlash within the open-source community, with many developers boycotting GitHub altogether.

The RIAA claimed that [Youtube-dl][3] was using copyright-protection avoidance technologies, which resulted in immense criticism from multiple open-source organizations. In a surprise move, GitHub reinstated the repository several weeks later.

![][4]

To complement this reinstatement, they created a 1 million dollar takedown defense fund, designed to prevent situations like this in the future.

### False News Surrounding Youtube-dl’s Forks

![][5]

Among the confusion caused by this takedown, some recent reports have surfaced claiming that forks of the Youtube-dl repository are still disabled. **This is not true**. If we look at the [list of forks,][6] we can see a huge list of repositories, with each one working as normal.

Multiple sources reference [this repository][7], which has been taken down and has still not been reinstated by GitHub. However, it is not actually forked from the [official Youtube-dl repository][8]. Instead, this repository is based on an unofficial version of Youtube-dl and is not actually a Youtube-dl fork.

This isn’t to say that GitHub is without blame, as they have still ignored this developer’s counternotice. However, this warrants nowhere near the amount of criticism GitHub has received because of this.

### GitHub Working on Preventing a Situation Like This In The Future

GitHub reinstated the Youtube-dl repository back then (and its forks), many were pleased to hear that they had also started work on preventing a situation like this in the future. Some of these initiatives include:

  * A 1,000,000 USD fund aimed to help developers fight DMCA notices
  * Giving the option to developers to dispute the notice
  * Requiring additional proof for part 1201 takedown notices



#### New Fund to Fight DMCA Notices

As a result of the community backlash GitHub received, they have invested one million USD into a fund designed to help developers fight unfair DMCA notices. According to the official [GitHub post:][9]

> Developers who want to push back against unwarranted takedowns may face the risk of taking on personal liability and legal defense costs. To help them, GitHub will establish and donate $1M to a developer defense fund to help protect open source developers on GitHub from unwarranted DMCA Section 1201 takedown claims.

GitHub

Although providing legal support for open-source developers is not a new idea, GitHub providing this support directly is worth appreciating.

If you are interested in other ways to get support with legal disputes over open-source software, you may want to look at the [SFLC][10] and [EFF][11]. If possible, it would also be great if you could support them whether that’s through donations of time or money.

#### New Way For Developers To Dispute DMCA Notices

Another way GitHub is working to improve its relationship with developers is through a new way to dispute takedown notices. This will improve the transparency between developers and the notice issuers, reducing the likelihood of another situation like this.

> Every single credible 1201 takedown claim will be reviewed by technical experts, including (when appropriate) independent specialists retained by GitHub, to ensure that the project actually circumvents a technical protection measure as described in the claim.
>
> The claim will also be carefully scrutinized by legal experts to ensure that unwarranted claims or claims that extend beyond the boundaries of the DMCA are rejected.
>
> In the case where the claim is ambiguous, we will err on the side of the developer, and leave up the repository unless there is clear evidence of illegal circumvention.

Yet again, it seems that GitHub is putting in a lot of effort to improve its policies on DMCA takedown notices. These improvements will definitely help with the number of false claims that are currently being accepted.

#### More Proof Required for Future Part 1201 Notices

For those without a background in law, Part 1201 DMCA Takedown Notices are a special kind of takedown notice used in cases where the offending party is using code designed to circumvent technical measures to protect copyrighted content. According to GitHub:

> Section 1201 dates back to the late 1990s and did not anticipate the various implications it has for software use today. As a result, Section 1201 makes it illegal to use or distribute technology (including source code) that bypasses technical measures that control access or copying of copyrighted works, even if that technology can be used in a way that would not be copyright infringement.

GitHub has now changed its policies so that anyone issuing a part 1201 notice must include additional evidence. This is beneficial to all involved parties as it means that most of the illegitimate claims will be void anyway.

### Wrapping Up

With the huge mess, this situation has created, I believe GitHub handled this as well as they reasonably could have. Additionally, it brought to light many legal issues surrounding part 1201 notices, which are being remedied right now.

Overall, the outcome of this has actually been positive, with a huge step in the right direction in developer rights. Amidst the rumors and fake news that has been circling lately, I think it is important to recognize the changes that have been made, and what they mean for the future of open-source software.

_What are your thoughts on the removal of Youtube-dl and then reinstating it? Let me know in the comments below!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [PHP Repository Moves to GitHub After its Git Server Was Hacked][12]
  * ![][13] ![][14]


  * [10 Biggest Linux Stories of the Year 2020 [That Made the Biggest Impact]][15]
  * ![][13] ![Biggest Linux Stories][16]


  * [After Rocky Linux, We Have Another RHEL Fork in Works to Replace CentOS][17]
  * ![][13] ![CloudLinux][18]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/youtube-dl-repo-fork/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/youtube-dl-github-takedown/
[2]: https://www.riaa.com/
[3]: https://youtube-dl.org/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQzOCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM3NScgd2lkdGg9Jzc0MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[6]: https://github.com/ytdl-org/youtube-dl/network/members
[7]: https://github.com/spookyahell/youtube-dl
[8]: https://github.com/ytdl-org/youtube-dl
[9]: https://github.blog/2020-11-16-standing-up-for-developers-youtube-dl-is-back/
[10]: https://softwarefreedom.org/donate/
[11]: https://www.eff.org/
[12]: https://news.itsfoss.com/php-repository-github/
[13]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[14]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/php-github-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[15]: https://news.itsfoss.com/biggest-linux-stories-2020/
[16]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/biggest-linux-stories-2020.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[17]: https://news.itsfoss.com/rhel-fork-by-cloudlinux/
[18]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/Untitled-design-2.png?fit=800%2C450&ssl=1&resize=350%2C200
