[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Zorin OS Responds to the Privacy Concerns)
[#]: via: (https://itsfoss.com/zorin-os-privacy-concerns/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Zorin OS Responds to the Privacy Concerns
======

_**There were some privacy concerns around ‘data collection’ in Zorin OS. It’s FOSS spoke to Zorin OS CEO and here is his response to the controversy.**_

After a few days of [Zorin OS 15 Lite][1] release, a Reddit thread surfaced which flagged a privacy concern regarding the Linux distribution.

The [Reddit thread][2] focuses on the [privacy policy][3] of Zorin OS and warns users that Zorin OS is sending anonymous pings every 60 minutes without users’ consent, which is potentially a privacy issue.

![][4]

The policy in question can be quoted here as:

> _**Anonymous pings**: When using Zorin OS, your computer may occasionally send us a ping which includes an anonymous unique identifier for your computer. We use this information to count the number of active users of Zorin OS. The unique identifier does not identify you unless you (or someone acting on your behalf) discloses it separately. You may choose to disable these pings by uninstalling the “Zorin-os-census” package from your computer_

Now, there’s a lot of [discussions][5] surrounding the concern. There’s also a [YouTube video][6] talking about it.

In a nutshell, it’s a mess. Some insist that they collect our IP addresses and some users complain that they should ask about it while installing Zorin OS.

While I agree that they could add an opt-out option in the installation process – so I reached out to **Artyom Zorin** (_CEO, Zorin Group_) to clarify the situation.

### Zorin’s Clarification On What They Collect With Every Anonymous Ping

When I asked for an elaborate explanation of what the “**anonymous unique identifier**” includes, Artyom mentioned – “_It appears that there are some inaccuracies and misconceptions about the census in the comments sections_“.

To continue the explanation about the unique identifier, he assured that **their servers do not log IP addresses** when a ping arrives.

The zorin-os-census script **simply counts the number of unique computers using Zorin OS** and no personal data is being collected along with it.

Artyom explained in detail:

> The anonymous identifier is a series of letters and numbers which is randomly generated (not based on any external data) and only used for the Zorin OS Census. Its single purpose is to make sure that the computer isn’t double-counted when a ping is sent from a computer to the server. On a fully-installed Zorin OS system, the anonymous identifier can be found in /var/lib/zorin-os-census/uuid and should look like this:_68f2d95b-f51f-4a5d-9b48-a99c28691b89_
>  *
>  *We would like to clarify that no personal or personally-identifiable data is being collected by us and the server does not log IP addresses when pings arrive. The zorin-os-census script is only used to count the number of computers and users running Zorin OS after installation. Even I wouldn’t be able to tell which computer is my own from looking at the server-side database. I have attached a screenshot of a snippet of the database table displaying the information we store.

He also stressed his ‘commitment on privacy’:

> Privacy is an essential human right. It’s a core tenet of our mission to give you back control of your technology, and not the other way around. We make privacy a priority with every decision we make, and we’re committed to protecting it in every level of the software we build.

As you can observe in the response above, he shared a screenshot of how their database of unique identifiers looks like:

![][7]

If you’re still curious, you can also check out the [source code][8] for the zorin-os-census script.

### Can We Opt-Out Of It?

While the data collected may be ‘harmless’, it is important to give the option to the user whether or not they want Zorin OS to collect the data, right?

So, when I inquired about the same, he mentioned that i**t was already something planned for Zorin OS 15 Lite release**.

However, they did not want to rush to add it before properly testing it. Hence, they decided to keep it for the upcoming release (**Zorin OS 15.1**) which is planned to arrive in **early-to-mid December this year.**

> We have in fact been working on implementing an opt-out option for this into the Zorin OS installer (Ubiquity). To ensure the stability and accessibility of this new functionality we’re adding to Ubiquity, we have scheduled a period of time to translate the text strings and rigorously test the software (in order to avoid regressions), as the installer is a critical component of the operating system. Unfortunately, the testing period for the opt-out option didn’t complete before our planned release of Zorin OS 15 Lite, and we, therefore, decided not to risk adding it before we could guarantee its stability. However, we are on track to include the opt-out option in the upcoming Zorin OS 15.1 release, which we plan to release in early-to-mid December.

### Will It Be Something Similar To What Ubuntu Does?

Ubuntu does let you opt-out from collecting information about your computer.

So, when I asked if Zorin OS will add something similar to that, he responded with some details about how Ubuntu collects data and how Zorin OS is different from that.

He mentioned the fact that Ubuntu comes pre-installed with a **popularity-contest** package that **occasionally sends data of what packages the user has installed** to the Ubuntu Developers.

And, further clarified that **Zorin OS does not include that**.

> While Ubuntu’s telemetry tool gives users the option to not send extensive information about the computers to the Ubuntu developers, selecting the “No” option still sends a ping to Ubuntu’s servers .
>
> From our research, it is not clear whether Ubuntu’s servers store logs of users’ IP addresses when they receive telemetry data. In addition, Zorin OS does not include the “popularity-contest” package that is pre-installed in Ubuntu. This package is designed to occasionally send a list of all packages a user has installed on their computer to the Ubuntu developers.

**In the end…**

While the concern regarding the anonymous pings may not seem to a privacy threat, an opt-out option should be presented to the user while installing Zorin OS. Let’s wait and watch if it should arrive in the upcoming Zorin OS 15.1 release.

What do you think about the privacy concern mentioned above? Let us know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/zorin-os-privacy-concerns/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/zorin-os-lite/
[2]: https://www.reddit.com/r/FreeAsInFreedom/comments/e0yhw4/beware_zorin_os_sends_anonymous_pings_every_60/
[3]: https://zorinos.com/legal/privacy/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/zorin-os-privacy-reddit.jpg?ssl=1
[5]: https://www.reddit.com/r/linux/comments/e0zd5n/beware_zorin_os_sends_anonymous_pings_every_60/
[6]: https://www.youtube.com/watch?v=bcgk9LvC36Y&feature=youtu.be&t=860
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/zorin-census-database.png?ssl=1
[8]: https://launchpad.net/~zorinos/+archive/ubuntu/stable/+sourcepub/10183568/+listing-archive-extra
