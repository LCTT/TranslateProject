[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to keep your messages private with an open source app)
[#]: via: (https://opensource.com/article/19/10/secure-private-messaging)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How to keep your messages private with an open source app
======
Even encrypted messaging apps are leveraging your private data to sell
you things.
![Chat via email][1]

Messaging apps have changed how we communicate. Where would we be today without [SMS][2]? Can you imagine returning to a world where near-instant communication is not pervasive?

We have lots of messaging options in addition to SMS and [MMS][3]. There are [Skype][4], [iMessage][5], [Facebook Messenger][6], [Twitter][7] (with and without direct messages), [WeChat][8], [WhatsApp][9], [SnapChat][10], and more. Many of them are encrypted, and many people presume that their communications on these apps are private and secure. But are they really? Cloud-hosted applications that are harvesting metadata from your conversations, then using it to sell you products that support their services, may not be your friends after all.

### Risks of using messaging systems

Fellow Opensource.com Community Moderator [Chris Hermansen][11] shares my concern about the growing invasion of our privacy by online communication tools. Chris says, "in my household, it's safe to say that we're not comfortable with commercial interests recording our every online move and using every possible gap to promote goods, services, points of view, and so on, or to promote themselves to others based on using our data."

[Employers are using social media account information][12] within their hiring and firing decision-making process, he says. And it's not just to check whether the candidate's or employee's online personality conflicts with company values; in many cases, candidates who don't have a social media presence are unlikely to get an interview.

He is also concerned about certain apps that allow message senders to see when recipients open their messages. He says, "I did not opt into that kind of sharing, and it seems the only way to opt out is to use software that is specifically designed to block this kind of unauthorized abuse, which may, in turn, block me from other, legitimate web content."

### Hide those prying eyes

Chris recently told me about [Signal][13], which ticks all the right boxes for those of us who have had enough of these prying eyes. The organization behind Signal is open, so we can know what it's doing with our data. (The answer? [Not very much at all][14].) Moreover, the organization is dedicated to broadening the use of Signal without harvesting user data, and all communications are encrypted end-to-end with the keys stored on users' devices.

In addition, the mobile app is robust and reliable and enables users to make video and voice calls over the internet. [Chris' family has been using Signal for the past 18 months][15] or so to communicate around the world, and he says that "the call quality is far, far better than with the competition." I also find that Signal provides extremely high voice and video call quality, even over long-distance connections that often bamboozle other communications applications.

"I prefer to have Signal also manage my SMS traffic," says Chris, "and I'll often open my Signal app to make a call to a fellow Signal user rather than telephoning."

Chris and I aren't the only ones who like using Signal. In 2017, the U.S. Senate Sergeant-at-Arms [approved][16] the app for lawmakers and their staffs to use.

Chris has only a couple of complaints about Signal. The first is that the desktop application (in Linux, anyway) isn't as full-featured as the mobile application. For instance, the desktop app can't make video or voice calls nor send or receive SMS. This isn't a show-stopper, but it would surely be nice when your cellphone battery is low or when it's easier to use your big screen and headset than a small mobile device.

### Using Signal

It is easy to [install Signal][17] on [Android][18], [iOS][19], Windows, MacOS, and Debian-based Linux distributions, and it offers excellent support [documentation][20] with detailed installation instructions for each operating system. You can also link devices, like laptops and desktops, that run one of the supported operating systems.

Signal uses your existing mobile number, provided it can send and receive SMS and phone calls. The first time you set Signal up on your mobile phone, the application can search your address book for any of your contacts who use it.

Signal is openly licensed with the [GNU Public License 3.0][21], and you can inspect the source code on [GitHub][22].

### Signal's future

In early 2018, Signal received $50 million in funding from WhatsApp co-founder [Brian Acton][23]. With that cash infusion, Signal founder [Moxie Marlinspike][24] and Acton founded a new non-profit, 501(c)(3) organization named the [Signal Foundation][25].

Marlinspike says Signal plans to use Acton's investment to "increase the size of our team, our capacity, and our ambitions. This means reduced uncertainty on the path to sustainability, and the strengthening of our long-term goals and values. Perhaps most significantly, the addition of Brian brings an incredibly talented engineer and visionary with decades of experience building successful products to our team."

Signal is currently looking for [developers][26] who have skills with iOS, Rust, Android, and more, as well as people interested in supporting it with financial [donations][27].

To learn more, you can follow Signal on [Twitter][28], [Instagram][29], and its [blog][30].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/secure-private-messaging

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://en.wikipedia.org/wiki/SMS
[3]: https://en.wikipedia.org/wiki/Multimedia_Messaging_Service
[4]: https://www.skype.com/en/
[5]: https://en.wikipedia.org/wiki/IMessage
[6]: https://www.messenger.com/
[7]: https://twitter.com/?lang=en
[8]: https://play.google.com/store/apps/details?id=com.tencent.mm&hl=en
[9]: https://www.whatsapp.com/
[10]: https://www.snapchat.com/
[11]: https://opensource.com/users/clhermansen
[12]: https://www.businessnewsdaily.com/2377-social-media-hiring.html
[13]: https://signal.org/
[14]: https://en.wikipedia.org/wiki/Signal_(software)
[15]: https://opensource.com/article/19/3/open-messenger-client
[16]: https://thehill.com/policy/cybersecurity/333802-sen-staff-can-use-signal-for-encrypted-chat
[17]: https://signal.org/download/
[18]: https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms&referrer=utm_source%3DOWS%26utm_medium%3DWeb%26utm_campaign%3DNav
[19]: https://apps.apple.com/us/app/signal-private-messenger/id874139669
[20]: https://support.signal.org
[21]: https://github.com/signalapp/Signal-iOS/blob/master/LICENSE
[22]: https://github.com/signalapp
[23]: https://en.wikipedia.org/wiki/Brian_Acton
[24]: https://moxie.org/
[25]: https://signal.org/blog/signal-foundation/
[26]: https://signal.org/workworkwork/
[27]: https://signal.org/donate/
[28]: https://twitter.com/signalapp
[29]: https://www.instagram.com/signal_app/
[30]: https://signal.org/blog/
