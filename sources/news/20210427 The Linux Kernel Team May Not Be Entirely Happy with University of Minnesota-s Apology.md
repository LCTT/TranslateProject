[#]: subject: (The Linux Kernel Team May Not Be Entirely Happy with University of Minnesota’s Apology)
[#]: via: (https://news.itsfoss.com/hipocrite-commits-apology/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

The Linux Kernel Team May Not Be Entirely Happy with University of Minnesota’s Apology
======

Recently, [University of Minnesota was banned from contributing to Linux Kernel code][1].

If you have been following up with that news, you probably know that it was all supposedly a part of study (research) to review the process of submitting Linux kernel patches and assessing the security risks associated.

However, without consulting the Linux Kernel maintainers or taking any permission, it was a breach of trust, which is a big deal for the Linux developers.

Now, it looks like the University researchers posted an open letter in the mailing list to address the Linux community that involves a lot of explanation instead of a quick apology. And, it seems that Greg Kroah-Hartman isn’t too impressed with the open letter and responded with a reply as a formality.

### University Researchers Apologize with an Open Letter

Kangjie Lu, the assistant professor in Computer Science &amp; Engineering department sent an [**open letter**][2] on behalf of the University and its researchers to an open mailing list as an apology.

Here’s what it initially mentions:

> We sincerely apologize for any harm our research group did to the Linux kernel community. Our goal was to identify issues with the patching process and ways to address them, and we are very sorry that the method used in the “hypocrite commits” paper was inappropriate.
>
> As many observers have pointed out to us, we made a mistake by not finding a way to consult the community and obtain permission before running this study; we did that because we knew we could not ask the maintainers of Linux for permission, or they would be on the lookout for the hypocrite patches. While our goal was to improve the security of Linux, we now understand that it was hurtful to the community to make it a subject of our research, and to waste its effort reviewing these patches without its knowledge or permission

The letter also mentioned that they did not have any intention to harm the Linux kernel community but solely focused on finding and fixing vulnerabilities.

They continued with some potential justifications for their actions:

> The “hypocrite commits” work was carried out in August 2020; it aimed to improve the security of the patching process in Linux. As part of the project, we studied potential issues with the patching process of Linux, including causes of the issues and suggestions for addressing them.

Also, they to tend to clarify that the incorrect patches for that specific study were not actually included in the kernel code:

> All the other 190 patches being reverted and re-evaluated were submitted as part of other projects and as a service to the community; they are not related to the “hypocrite commits” paper.

Now, the open letter started to make more sense as an explanation instead of an apology.

Of course, all the patches being reverted was a reaction to the whole incident. No matter what, one can truly understand this action responding to the researchers by the stable kernel maintainer Greg K-H.

Hopefully, the majority of the previous patches that they claim to have made sincerely gets added back after the incident is resolved.

They also continue addressing the three incorrect patches which were rejected and mentioned to reveal more details about it after getting the consent from the Linux community members who responded to them.

In addition to that, they also mentioned that they will be trying their best to contribute in the near future to help the Linux kernel community as they originally intended.

In other words, the apology letter was not exactly saying “we are sorry for our actions” but more like “what we planned, how it was supposed to work, and what we want to do in the future”.

Personally, I like to keep things simple when communicating something. If they did that here, maybe they could have got a better response from the Linux kernel team (or Greg K-H).

### Response to the Apology Letter

Now that you probably understand that the apology letter did not clearly communicate what it was meant to – the [**response to it by Greg K-H**][3] did reflect the same as well.

He replied:

> Thank you for your response.
>
> As you know, the Linux Foundation and the Linux Foundation’s Technical Advisory Board submitted a letter on Friday to your University outlining the specific actions which need to happen in order for your group, and your University, to be able to work to regain the trust of the Linux kernel community.
>
> Until those actions are taken, we do not have anything further to discuss about this issue.

Here, no one knows what steps/actions the Linux Foundation asked them to follow to regain the trust of the community. But, I am guessing that must have been clearly communicated to the University which potentially does not need any further drama to continue in the mailing list.

### Closing Thoughts

At this point, we can just hope that the University coordinates with the Linux Foundation to regain the trust of the community.

After all, research studies are essential. Yes, they might have made a mistake, but it should act as an example for every university researcher to pursue every study keeping the community in mind, no matter how crazy the idea is (in good faith, of course).

What do you think about all the shambles between the University researchers and the Linux kernel maintainers? Let me know your thoughts in the comments down below.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [Here's Why University of Minnesota is Getting Banned From Contributing to Linux Kernel Code][1]
  * ![][4] ![Stop sign][5]


  * [It's Time for The Linux Foundation to Stop Ignoring Desktop Linux][6]
  * ![][4] ![Stop Ignoring Desktop Linux][7]


  * [10 Biggest Linux Stories of the Year 2020 [That Made the Biggest Impact]][8]
  * ![][4] ![Biggest Linux Stories][9]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/hipocrite-commits-apology/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/hypocrite-commits/
[2]: https://lore.kernel.org/lkml/CAK8KejpUVLxmqp026JY7x5GzHU2YJLPU8SzTZUNXU2OXC70ZQQ@mail.gmail.com/T/#u
[3]: https://lore.kernel.org/lkml/YIV+pLR0nt94q0xQ@kroah.com/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[5]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/stop.png?fit=1200%2C675&ssl=1&resize=350%2C200
[6]: https://news.itsfoss.com/linux-foundation-linux-desktop/
[7]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/stop-ignoring-desktop-linux.png?fit=1200%2C675&ssl=1&resize=350%2C200
[8]: https://news.itsfoss.com/biggest-linux-stories-2020/
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/biggest-linux-stories-2020.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
