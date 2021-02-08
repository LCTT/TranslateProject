[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Great Open Source Divide: ICE, Hippocratic License and the Controversy)
[#]: via: (https://itsfoss.com/hippocratic-license/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

The Great Open Source Divide: ICE, Hippocratic License and the Controversy
======

_**Coraline Ada Ehmke has created “Hippocratic License” that “add ethics to open source projects”. But this seems to be just the beginning of a controversy as the “Hippocratic License” may not be open source at all.**_

Coraline Ada Ehmke, better known for her [Contributor Covenant][1], has modified the MIT open source license into Hippocratic License that adds a couple of conditions to the existing MIT license. Before you learn what it is, let me give you the context on why it’s been created in the first place.

### No Tech for ICE

![No Tech For ICE | Image Credit Science for All][2]

Immigration and Customs Enforcement agency of the US government, [ICE][3], has been condemned by human rights groups and activists for inhumane practices of separating children from their parents at the US-Mexico border under the new strict immigration policy.

Some techies have been vocal against the actions of ICE and they don’t want ICE to use tech projects they work on as it helps ICE in one way or another.

The “[No Tech for ICE][4]” movement has been going on for some time but it got highlighted once again this week when an engineer named [Seth Vargo took down his open source project after finding ICE was using it][5] through Chef.

The project was called [Chef Sugar][6], a Ruby library for simplifying work with [Chef][7], a platform for configuration management. ICE is one of the clients for Chef. The project withdrawal momentarily impacted Chef and its clients. Chef swiftly fixed the problem by uploading the Chef Sugar project on its own GitHub repository.

Despite the trouble it caused for a number of companies using Chef worldwide, Vargo made a point. The pressure tactic worked and after [initial resistance][8], Chef caved in and [agreed to not renew its contract with ICE][9].

Now Chef Sugar is an open source project and its developer cannot stop people from forking it and continue using it. And that’s where [Coraline Ada Ehmke][10] came up with a new licensing model called Hippocratic License.

### What is Hippocratic License?

![][11]

To enable more developers to forbid unethical organizations like ICE from using their open source projects, Coraline Ada Ehmake introduced a new license called “Hippocratic License”.

The term Hippocratic relates to ancient Greek physician [Hippocrates][12]. The [Hippocratic oath][13] is an ethical oath (historically taken by physicians) and one of the crucial part of the oath is “I will abstain from all intentional wrong-doing and harm”. This part of the oath is known as “Primum non nocere” or “First do no harm”.

The entire terminology is significant. The license is called Hippocratic license and is hosted on a domain called [firstdonoharm.dev][14] and the idea is to enable the developers to be not part of ‘intentional wrong-doing’.

The [Hippocratic License][14] is based on the popular [MIT open source license][15]. It adds this additional and crucial condition:

> The software may not be used by individuals, corporations, governments, or other groups for systems or activities that actively and knowingly endanger, harm, or otherwise threaten the physical, mental, economic, or general well-being of underprivileged individuals or groups.

### Is Hippocratic license really an open source license?

No, it is not. That’s what [Open Source Initiative][16] (OSI) says. OSI is the community-recognized body for reviewing and approving licenses as Open Source Definition conformant.

> The intro to the Hippocratic Licence might lead some to believe
>  the license is an Open Source Software licence, and software distributed under the Hippocratic Licence is Open Source Software.
>
> As neither is true, we ask you to please modify the language to remove confusion.
>
> — OpenSourceInitiative (@OpenSourceOrg) [September 23, 2019][17]

Coraline first [thanked][18] OSI for pointing it out and then goes on to attack it as an “open source problem”.

> This is the problem: the current structure of open source specifically prohibits us from protecting our labor from use by organizations like ICE.
>
> That’s not a license problem. That’s an Open Source™ problem. <https://t.co/XEyu5VNUMJ>
>
> — Coraline Ada Ehmke (@CoralineAda) [September 23, 2019][19]

Coraline clearly doesn’t accept that OSI (open Source Initiative) and [FSF][20] (Free Software Foundation) has the authority on the matter of defining open source and free software.

> OSI and FSF are not the real arbiters of what is Open Source and what is Free Software.
>
> We are.
>
> — Coraline Ada Ehmke (@CoralineAda) [September 22, 2019][21]

So if OSI and FSF, the organizations created for the sole purpose of defining open source and free software, are not the authority on this subject then who is? The “we” in “we are” of Coraline’s statement is ambiguous. Does ‘we’ represents the people who agree to Coraline’s view or ‘we’ means the entire open source community? If it’s the latter, then Coraline doesn’t represent or speak for every person in the open source community.

### Does it solve the problem or does it create more problems? Can open source be neutral?

> Developers are (finally) becoming more aware of the impact that their work has on the world, and in particular on underprivileged people.
>
> It’s late to come to that realization, but not TOO LATE to do something about it.
>
> The lesson here is that TECH IS NOT NEUTRAL.
>
> — Coraline Ada Ehmke (@CoralineAda) [September 23, 2019][22]

Everything looks good from an idealistic point of view at the first glance. It seems like this new license will solve the problem of evil people using open source projects.

But I see a problem here and that problem is the perception of ‘evil’. What you consider evil depends on your point of view.

A number of “No Tech for ICE” supporting techies are also supporters of ANTIFA. [ANTIFA has been indulging in physical violence from time to time][23]. What if a bunch of ‘cis white men’, who found [far-left organizations like ANTIFA][24] evil, stop them from using their open source projects? What if [Richard Stallman comes back from his forced retirement][25] and starts selecting people who can use GNU projects based on whether or not they agree with his views?

The license condition also says “knowingly endanger, harm, or otherwise threaten the physical, mental, economic, or general well-being of underprivileged individuals or groups”.

So the entire stuff is only applicable to “underprivileged individuals or groups”, not others? So the others don’t get the same rights anymore? This should not come as surprise because Coraline is the same person who took extreme measure to ‘harm’ the ‘economic well being’ of a developer ([Coraline disagreed with his views][26]) by doing everything in capacity to get him fired from his job.

Until these concerns are addressed, the Hippocratic License will unfortunately remain hypocrite license.

Where will this end? How many open source projects will be forked between sparring groups of different ideologies? Why should the rest of the world suffer from the American domestic politics? Can we not leave open source undivided?

Your views are welcome. Please note that abusive comments won’t be published.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][27].

--------------------------------------------------------------------------------

via: https://itsfoss.com/hippocratic-license/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.contributor-covenant.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/no-tech-for-ice.jpg?resize=800%2C340&ssl=1
[3]: https://en.wikipedia.org/wiki/U.S._Immigration_and_Customs_Enforcement
[4]: https://notechforice.com/
[5]: https://www.zdnet.com/article/developer-takes-down-ruby-library-after-he-finds-out-ice-was-using-it/
[6]: https://github.com/sethvargo/chef-sugar
[7]: https://www.chef.io/
[8]: https://blog.chef.io/2019/09/19/chefs-position-on-customer-engagement-in-the-public-and-private-sectors/
[9]: https://www.vice.com/en_us/article/qvg3q5/chef-not-renewing-ice-immigration-customs-enforcement-contract-after-code-deleting-protest
[10]: https://where.coraline.codes/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/hippocratic-license.png?ssl=1
[12]: https://en.wikipedia.org/wiki/Hippocrates
[13]: https://en.wikipedia.org/wiki/Hippocratic_Oath
[14]: https://firstdonoharm.dev/
[15]: https://opensource.org/licenses/MIT
[16]: https://opensource.org/
[17]: https://twitter.com/OpenSourceOrg/status/1176229398929977344?ref_src=twsrc%5Etfw
[18]: https://twitter.com/CoralineAda/status/1176246765676302336
[19]: https://twitter.com/CoralineAda/status/1176262778459496454?ref_src=twsrc%5Etfw
[20]: https://www.fsf.org/
[21]: https://twitter.com/CoralineAda/status/1175878569169432582?ref_src=twsrc%5Etfw
[22]: https://twitter.com/CoralineAda/status/1176207120133447680?ref_src=twsrc%5Etfw
[23]: https://www.aol.com/article/news/2017/05/04/what-is-antifa-controversial-far-left-group-defends-use-of-violence/22067671/?guccounter=1&guce_referrer=aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnLw&guce_referrer_sig=AQAAAHYUcIrnC8zD4UX-W4N2Vshf-QVSVDTwNXlTNmy4gbUJUb9smDm7W9Bf1IelnBGz5x0QAdI-O3Zhm9obQjZcORvHjvp3J8tUgEbdlpKNef-jk1rTH8BTZOP7YJule2n7wbIc4wDHPMFjrZUsMx-kypQYVCpkjtEDltAHHo-73ZD_
[24]: https://www.bbc.com/news/world-us-canada-40930831
[25]: https://itsfoss.com/richard-stallman-controversy/
[26]: https://itsfoss.com/linux-code-of-conduct/
[27]: https://reddit.com/r/linuxusersgroup
