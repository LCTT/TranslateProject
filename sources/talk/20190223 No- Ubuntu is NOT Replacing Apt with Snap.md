[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (No! Ubuntu is NOT Replacing Apt with Snap)
[#]: via: (https://itsfoss.com/ubuntu-snap-replaces-apt-blueprint/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

No! Ubuntu is NOT Replacing Apt with Snap
======

Stop believing the rumors that Ubuntu is planning to replace Apt with Snap in the [Ubuntu 19.04 release][1]. These are only rumors.

![Snap replacing apt rumors][2]

Don’t get what I am talking about? Let me give you some context.

There is a ‘blueprint’ on Ubuntu’s launchpad website, titled ‘Replace APT with snap as default package manager’. It talks about replacing Apt (package manager at the heart of Debian) with Snap ( a new packaging system by Ubuntu).

> Thanks to Snap, the need for APT is disappearing, fast… why don’t we use snap at the system level?

The post further says “Imagine, for example, being able to run “sudo snap install cosmic” to upgrade to the current release, “sudo snap install –beta disco” (in March) to upgrade to a beta release, or, for that matter, “sudo snap install –edge disco” to upgrade to a pre-beta release. It would make the whole process much easier, and updates could simply be delivered as updates to the corresponding snap, which could then just be pushed to the repositories and there it is. This way, instead of having a separate release updater, it would be possible to A, run all system updates completely and silently in the background to avoid nagging the user (a la Chrome OS), and B, offer release upgrades in the GNOME software store, Mac-style, as banners, so the user can install them easily. It would make the user experience both more consistent and even more user-friendly than it currently is.”

It might sound good and promising and if you take a look at [this link][3], even you might start believing the rumor. Why? Because at the bottom of the blueprint information, it lists Ubuntu-founder Mark Shuttleworth as the approver.

![Apt being replaced with Snap blueprint rumor][4]Mark Shuttleworth’s name adds to the confusion

The rumor got fanned when the Switch to Linux YouTube channel covered it. You can watch the video from around 11:30.

<https://youtu.be/Xy7v5tdfSZM>

When this ‘news’ was brought to my attention, I reached out to Alan Pope of Canonical and asked him if he or his colleagues at Canonical (Ubuntu’s parent company) could confirm it.

Alan clarified that the so called blueprint was not associated with official Ubuntu team. It was created as a proposal by some community member not affiliated with Ubuntu.

> That’s not anything official. Some random community person made it. Anyone can write a blueprint.
>
> Alan Pope, Canonical

Alan further elaborated that anyone can create such blueprints and tag Mark Shuttleworth or other Ubuntu members in it. Just because Mark’s name was listed as the approver, it doesn’t mean he already approved the idea.

Canonical has no such plans to replace Apt with Snap. It’s not as simple as the blueprint in question suggests.

After talking with Alan, I decided to not write about this topic because I don’t want to fan baseless rumors and confuse people.

Unfortunately, the ‘replace Apt with Snap’ blueprint is still being shared on various Ubuntu and Linux related groups and forums. Alan had to publicly dismiss these rumors in a series of tweets:

> Seen this [#Ubuntu][5] blueprint being shared around the internet. It's not official, not a thing we're doing. Just because someone made a blueprint, doesn't make it fact. <https://t.co/5aUYlT2no5>
>
> — Alan Pope 🇪🇺🇬🇧 (@popey) [February 23, 2019][6]

I don’t want you, the It’s FOSS reader, to fell for such silly rumors so I quickly penned this article.

If you come across ‘apt being replaced with snap’ discussion, you may tell people that it’s not true and provide them this link as a reference.


--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-snap-replaces-apt-blueprint/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-19-04-release-features/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/snap-replacing-apt.png?resize=800%2C450&ssl=1
[3]: https://blueprints.launchpad.net/ubuntu/+spec/package-management-default-snap
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/apt-snap-blueprint.jpg?ssl=1
[5]: https://twitter.com/hashtag/Ubuntu?src=hash&ref_src=twsrc%5Etfw
[6]: https://twitter.com/popey/status/1099238146393468931?ref_src=twsrc%5Etfw
