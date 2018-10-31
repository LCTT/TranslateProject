[zianglei翻译中]
4 open source Android email clients
======
Email is not on its deathbed, but most of it happens on mobile devices now.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_mail_box_envelope_send_blue.jpg?itok=6Epj47H6)

Even though members of the younger generations are trying to bury email as "communication for old people," the reality is email isn't anywhere near its deathbed. While [collaboration tools][1], social media, and texting are important, they aren't ready to replace email as an essential business (and social) communications tool.

Given that email isn't going away and most of it is now read on mobile devices (according to a host of studies), having a good mobile email client is critical. If you're an Android user who wants an open source email client, things get a little bit tricky.

We've uncovered four open source email clients for Android for you to consider. Two are available in the official Android app store, [Google Play][2] , and you can find them in one of the open source Android app repositories, [Fossdroid][3] or [F-Droid][4] . (See below for specific download details for each.)

### K-9 Mail

[K-9 Mail][5] has been around almost as long as Android has—it originated out of a patch to the Android 1.0 email client. It has support for IMAP and WebDAV, multiple identities, attachments, emojis, and other typical email client features. Its [user documentation][6] offers help on installation, setup, security, reading and sending email, and much more.

K-9 is open sourced under the [Apache 2.0][7] License with [source code][8] available on GitHub. It's available for download on [Google Play][9], [Amazon][10], and [F-Droid][11].

### p≡p

As its full name, "Pretty Easy Privacy" suggests, [p≡p][12] is focused on privacy and secure communications. It provides automatic, end-to-end encryption of emails and attachments (provided your recipient also has an encryption solution installed—if not, p≡p warns that your email will be sent without encryption).

You can access the [source code][13] (licensed under [GPLv3][14]) from GitLab and find [documentation][15] on the app's website. Download p≡p for free on [Fossdroid][16] or for a nominal fee on [Google Play][17].

### InboxPager

[InboxPager][18] allows you to send and read email messages over the SSL/TLS protocol, which means you may need to do some tweaking if your email provider (e.g., Gmail) doesn't turn that on by default. (Fortunately, InboxPager offers Gmail [instructions][19].) It also supports OpenPGP encryption through the OpenKeychain application.

InboxPager is licensed under [GPLv3][20] with [source code][18] available on GitHub, and it can be installed via [F-Droid][21].

### FairEmail

[FairEmail][22] takes a minimalistic approach to mobile email, focusing on reading and writing messages—without all the bells and whistles that risk slowing your email client. It supports multiple accounts and identities, message threading, encryption, and more.

It's licensed under [GPLv3][23] with [source code][24] available on GitHub. You can download FairEmail on [Fossdroid][25]; a Google Play version is available for people interested in [testing the software][26].

There's certainly room for other entries into the open source Android email client space (or for improving the ones above)—motivated developers, take notice. And, if you know of an application we missed, please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/open-source-android-email-clients

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com
[b]: https://github.com/lujun9972
[1]: https://opensource.com/alternatives/trello
[2]: https://play.google.com/store
[3]: https://fossdroid.com/
[4]: https://f-droid.org/
[5]: https://k9mail.github.io/
[6]: https://k9mail.github.io/documentation.html
[7]: http://www.apache.org/licenses/LICENSE-2.0
[8]: https://github.com/k9mail/k-9
[9]: https://play.google.com/store/apps/details?id=com.fsck.k9
[10]: https://www.amazon.com/K-9-Dog-Walkers-Mail/dp/B004JK61K0/
[11]: https://f-droid.org/packages/com.fsck.k9/
[12]: https://www.pep.security/android.html.en
[13]: https://pep-security.lu/gitlab/android/pep
[14]: https://pep-security.lu/gitlab/android/pep/blob/feature/material/LICENSE
[15]: https://www.pep.security/docs/
[16]: https://fossdroid.com/a/p%E2%89%A1p.html
[17]: https://play.google.com/store/apps/details?id=security.pEp
[18]: https://github.com/itprojects/InboxPager
[19]: https://github.com/itprojects/InboxPager/blob/HEAD/README.md#gmail-configuration
[20]: https://github.com/itprojects/InboxPager/blob/c5641a6d644d001bd4cec520b5a96d7e588cb6ad/LICENSE
[21]: https://f-droid.org/en/packages/net.inbox.pager/
[22]: https://email.faircode.eu/
[23]: https://github.com/M66B/open-source-email/blob/master/LICENSE
[24]: https://github.com/M66B/open-source-email
[25]: https://fossdroid.com/a/fairemail.html
[26]: https://play.google.com/apps/testing/eu.faircode.email
