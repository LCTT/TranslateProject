[#]: subject: "Fedora Linux 37 update"
[#]: via: "https://fedoramagazine.org/fedora-linux-37-update/"
[#]: author: "Ben Cotton https://fedoramagazine.org/author/bcotton/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux 37 update
======

![][1]

Fedora Linux 37 is going to be late; very late. Here’s why. As you may have heard, the [OpenSSL project announced a version][2] due to be released on Tuesday. It will include a fix for a critical-severity bug. We won’t know the specifics of the issue until Tuesday’s release, but it could be significant. As a result, we decided to delay the release of Fedora Linux 37. We are now [targeting a release day of 15 November][3].

### Imperfect information

Most decisions happen with imperfect information. This one is particularly imperfect. If you’re not familiar with the embargo process, you might not understand why. When a security issue is discovered, this information is often shared with the project confidentially. This allows the developers to fix the issue before more people know about it and can exploit it. Projects then share information with downstreams so they can be ready.

Ironically, Fedora’s openness means we can’t start preparing ahead of time. All of our build pipelines and artifacts are open. If we were to start building updates, this would disclose the vulnerability before the embargo lifts. As a result, we only know that OpenSSL considers this the highest level of severity and Red Hat’s Product Security team strongly recommended we wait for a fix before releasing Fedora Linux 37.

### Balancing time and quality

As the Fedora Program Manager, our release schedule is my responsibility. I take pride in the on-time release streak I inherited from my predecessor. We kept it going through Fedora Linux 34 in April 2021. In that time, we made big technical changes (like switching to Btrfs as the default for most variants) and kept each other going through a pandemic. I’m proud of what the community was able to accomplish under difficult circumstances.

But being on time isn’t the only factor. We know that you rely on Fedora Linux for work and for play, so quality is always a consideration. Knowing that we were going to delay for the OpenSSL vulnerability, the question became “how long”?

We make the “go/no-go” decision on Thursdays for a release the following Tuesday. This gives time for the images to update to the mirrors. The OpenSSL project team plans to publish the security fix about 48 hours before we’d make the go/no-go decision for an 8 November target. Factoring in time to build the updated openssl package and generate a release candidate, that gives us about a day and a half to do testing. That’s not enough time to be comfortable with a change to such an important package.

As a result, we’re giving ourselves an extra week so that we can be confident that Fedora Linux 37 has the same level of quality you’ve come to expect.

### Was it the right decision?

Time will tell if we made the right decision or not. Today’s Go/No-Go meeting was lively and not everyone agrees that we should delay the release because of this. Like I said, we have little information to go on. It’s important to note that the decision was made as a team, and not the dictate of a single person. Fedora values collaborative decision making, and this is a good example.

When the details are released Tuesday, it may turn out we go “wow, that was not worth delaying the release.” But I think we made the best decision we could with the information we have available.

In the meantime, please join us November 4–5 for the [Fedora Linux 37 Release Party][4]. It will be a lot of fun, even if the release isn’t quite out yet.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-37-update/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/f37-release-816x345.png
[2]: https://mta.openssl.org/pipermail/openssl-announce/2022-October/000238.html
[3]: https://fedorapeople.org/groups/schedule/f-37/f-37-key-tasks.html
[4]: https://fedoramagazine.org/youre-invited-to-the-fedora-linux-37-release-party/
