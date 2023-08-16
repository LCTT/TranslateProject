[#]: subject: "Google's New Web Environment Integrity Proposal Dismissed by Brave, Mozilla, and Vivaldi"
[#]: via: "https://news.itsfoss.com/google-controversial-tracker/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google's New Web Environment Integrity Proposal Dismissed by Brave, Mozilla, and Vivaldi
======
When it is Google, you expect controversy. Let us find out what it is
this time.
A potentially precarious situation might be brewing regarding the integrity of the open web as we know it. Recently, a very controversial API was discovered that has been in the works by a team of Google engineers for over a year.

Called the “[Web Environment Integrity][1]” (WEI), this is a **potential gatekeeping move** that has many concerned, including the three critical competitors to Google's Chrome web browser.

This situation has unfolded over the past two weeks, resulting in widespread criticism over the implementation of such a protocol.

Allow me to take you through it.

### When It's Google, It is Controversial 🤦‍♂️🤦‍♀️

According to the developers, WEI is meant to effectively create a secure environment where websites can request a token from the user that an attester would then attest.

📋

An attester refers to a third party capable of giving final verdicts in such a scenario.

This would be done to certify key facts about the user's web environment. Post that, the website would be able to decide if they want to trust the certification findings from the attester or not.

💡 In simpler terms, **this API would facilitate a way of detecting whether a connected user meets the website's criteria for a secure connection**.

But, to achieve this, the API would need access to far-reaching data from the user, opening the door for uniquely [fingerprinting][2] them. Even though the developers feel that the API shouldn't be used for such a thing, many doubt how it will pan out.

Google devs mention that this **API would primarily be used for anti-fraud use cases** , such as detecting social media manipulation, non-human traffic, phishing campaigns, and other online-based fraud.

🚧

Even though the Web Environment Integrity API seems to be in work for a year or so in** the prototyping stages**, there has been no official statement regarding this by Google.

But, others believe that this **could be used to further invade users' privacy** by forcing them to give over critical information about their systems. It could also be used to **restrict access to sites when using non-conforming web browsers**.

This has resulted in stern responses from Chrome's three major competitors: **Firefox, Brave, and Vivaldi**.

👉 **In the case of Firefox** , when a request for a position was opened in their [GitHub repo][3] regarding WEI, Brian Grinstead from Mozilla clarified that they entirely oppose this API.

He said:

> Mozilla opposes this proposal because it contradicts our principles and vision for the Web. Any browser, server, or publisher that implements common standards is automatically part of the Web.
>
> Mechanisms that attempt to restrict these choices are harmful to the openness of the Web ecosystem and are not good for users.

He even cast a shadow of doubt on the proposed “Holdback” safeguard in WEI that is supposed to allow users of non-conforming browsers to access such websites.

👉 Similarly, the CEO of **Brave** had a more aggressive stand when a Twitter user presumed that Brave was just a reskin of Chrome, and would follow suit. He made it pretty clear that Brave won't be providing support for WEI, like the various elements of Chromium; they choose not to ship.

> We are a fork, have been all along, the “reskinned” claim is complete nonsense. We won’t be shipping WEI support, just as we disable or otherwise nullify lots of other junk that Google puts into Chromium. [https://t.co/nr2EejxgyZ][4] [https://t.co/UXXGoNFMzs][5].
>
> — BrendanEich (@BrendanEich) [July 27, 2023][6]

👉 And finally, we have **Vivaldi** , who has been the most vocal. They published a [scathing article][7] against the implementation of WEI, where they corroborated their doubts on whether they can refuse to implement WEI or not.

They believe that **any browser that decides not to implement this would effectively not be trusted** , and any website using this API would then easily be able to reject users from such browsers 😲

These were just the most known criticisms of the WEI API; there has been a lot of conversation over this on [Hacker News][8], [Ars Technica][9], and even [Reddit][10].

There's no clarity whether this will be implemented more widely, or be scrapped/rebranded into a different thing altogether.

_💬 What do you think about Google's recent proposal and the criticism? Share your thoughts in the comments below._

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][11].
  * Join our [community forum][12].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][13].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/google-controversial-tracker/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://github.com/RupertBenWiser/Web-Environment-Integrity?ref=news.itsfoss.com
[2]: https://www.mozilla.org/en-US/firefox/features/block-fingerprinting/?ref=news.itsfoss.com
[3]: https://github.com/mozilla/standards-positions/issues/852?ref=news.itsfoss.com#issuecomment-1648820747
[4]: https://t.co/nr2EejxgyZ?ref=news.itsfoss.com
[5]: https://t.co/UXXGoNFMzs?ref=news.itsfoss.com
[6]: https://twitter.com/BrendanEich/status/1684561924191842304?ref_src=twsrc%5Etfw&ref=news.itsfoss.com
[7]: https://vivaldi.com/blog/googles-new-dangerous-web-environment-integrity-spec/?ref=news.itsfoss.com
[8]: https://news.ycombinator.com/item?id=36817305&ref=news.itsfoss.com
[9]: https://arstechnica.com/gadgets/2023/07/googles-web-integrity-api-sounds-like-drm-for-the-web/?ref=news.itsfoss.com
[10]: https://www.reddit.com/r/linux/comments/15decdb/googles_nightmare_web_integrity_api_wants_a_drm/?ref=news.itsfoss.com
[11]: https://linuxhandbook.com/tag/bash-beginner/
[12]: https://itsfoss.community/
[13]: https://itsfoss.com/newsletter/
