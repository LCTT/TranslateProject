四个开源的 Android 邮件客户端
======

> Email 现在还没有绝迹，而且现在大部分邮件都来自于移动设备。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_mail_box_envelope_send_blue.jpg?itok=6Epj47H6)

现在一些年轻人正将邮件称之为“老年人的交流方式”，然而事实却是邮件绝对还没有消亡。虽然[协作工具][1]、社交媒体，和短信很常用，但是它们还没做好取代邮件这种必要的商业（和社交）通信工具的准备。

考虑到邮件还没有消失，并且（很多研究表明）人们都是在移动设备上阅读邮件，拥有一个好的移动邮件客户端就变得很关键。如果你是一个想使用开源的邮件客户端的 Android 用户，事情就变得有点棘手了。

我们提供了四个开源的 Andorid 邮件客户端供选择。其中两个可以通过 Andorid 官方应用商店 [Google Play][2] 下载。你也可以在 [Fossdroid][3] 或者 [F-Droid][4] 这些开源 Android 应用库中找到他们。（下方有每个应用的具体下载方式。）

### K-9 Mail

[K-9 Mail][5] 拥有几乎和 Android 一样长的历史——它起源于 Android 1.0 邮件客户端的一个补丁。它支持 IMAP 和 WebDAV、多用户、附件、emoji 和其它经典的邮件客户端功能。它的[用户文档][6]提供了关于安装、启动、安全、阅读和发送邮件等等的帮助。

K-9 基于 [Apache 2.0][7] 协议开源，[源码][8]可以从 GitHub 上获得. 应用可以从 [Google Play][9]、[Amazon][10] 和 [F-Droid][11] 上下载。

### p≡p

正如它的全称，”Pretty Easy Privacy”说的那样，[p≡p][12] 主要关注于隐私和安全通信。它提供自动的、端到端的邮件和附件加密（但要求你的收件人也要能够加密邮件——否则，p≡p 会警告你的邮件将不加密发出）。

你可以从 GitLab 获得[源码][13]（基于 [GPLv3][14] 协议），并且可以从应用的官网上找到相应的[文档][15]。应用可以在 [Fossdroid][16] 上免费下载或者在 [Google Play][17] 上支付一点儿象征性的费用下载。

### InboxPager

[InboxPager][18] 允许你通过 SSL/TLS 协议收发邮件信息，这也表明如果你的邮件提供商（比如 Gmail ）没有默认开启这个功能的话，你可能要做一些设置。（幸运的是， InboxPager 提供了 Gmail 的[设置教程][19]。）它同时也支持通过 OpenKeychain 应用进行 OpenPGP 加密。

InboxPager 基于 [GPLv3][20] 协议，其源码可从 GitHub 获得，并且应用可以从 [F-Droid][21] 下载。

### FairEmail

[FairEmail][22] 是一个极简的邮件客户端，它的功能集中于读写信息，没有任何多余的可能拖慢客户端的功能。它支持多个帐号和用户、消息线索、加密等等。

它基于 [GPLv3][23] 协议开源，[源码][24]可以从 GitHub 上获得。你可以在 [Fossdroid][25] 上下载 FairEamil；对 Google Play 版本感兴趣的人可以从 [testing the software][26] 获得应用。

肯定还有更多的开源 Android 客户端（或者上述软件的加强版本）——活跃的开发者们可以关注一下。如果你知道还有哪些优秀的应用，可以在评论里和我们分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/open-source-android-email-clients

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[zianglei][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com
[b]: https://github.com/lujun9972
[c]: https://github.com/zianglei
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
