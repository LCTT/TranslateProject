[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 6 open source desktop email clients)
[#]: via: (https://opensource.com/business/18/1/desktop-email-clients)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Top 6 open source desktop email clients
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_mail.png?itok=XTkwePLK)

This article was originally published on October 8, 2015, and has been updated to reflect new information and project changes.

Mobile and web technologies still haven't made the desktop obsolete, and despite some regular claims to the contrary, desktop clients don't seem to be going away anytime soon.

And with good reason. For many, the preference for a native application (and corresponding native performance), easy offline use, a vast array of plugins, and meeting security needs will long outweigh pressures to switch to a webmail email client. Whether you're sticking with a desktop email client because of a corporate mandate or just personal preference, there are still many great options to choose from. And just because you may be stuck on Windows doesn't mean Outlook is your only option; many open source clients are cross-platform.

In this roundup, we take a quick look at six open source options for desktop email, share a little bit about each, and provide you with some options you may want to try yourself.

### Thunderbird

For many years, Mozilla [Thunderbird][1] was the king of the open source email clients. It was available on all major platforms, and it had great success alongside Mozilla's now-flagship project, Firefox. Thunderbird has been around for over a decade and was immediately popular from the start, receiving over a million downloads in its first 10 days of public release.

In recent years, the thunder behind Thunderbird got a little quieter, and in mid-2017 the project announced it would move off Mozilla's infrastructure, but keep the Mozilla Foundation as its legal and fiscal home. Several [new hires][2] were made to advance the project, with plans to bring in new developers to fix lingering issues and transform the codebase to be based on web technologies.

Thunderbird is full-featured, with a number of well-supported plugins adding everything from calendar support to advanced address book integration, and many specialized features including theming and large file management. Out of the box, it supports POP and IMAP email syncing, spam filtering, and many other features you would expect, and it works flawlessly across Windows, macOS, and Linux.

Thunderbird is made available under the [Mozilla Public License][3].

![Thunderbird][4]

### Claws Mail

[Claws Mail][5], a fork of [Sylpheed][6], is a fast and flexible alternative that might be appealing to anyone concerned about performance and minimal resource usage. It's a good option, for example, if you're working within the limited processing and memory capacity of a [Raspberry Pi][7], for example.

But even for those with virtually unlimited computing resources to throw at a mail client, Claws Mail might be a good option. It's flexible, probably more so than Thunderbird or some of the other options in this list, and it has a number of plugins available for those who want to extend it. And it prides itself on being fast and reliable, too, in addition to sporting a simple interface that's perhaps ideal for new users.

Claws Mail is based on the GTK+ framework and made available under the [GPL][8].

![](https://opensource.com/sites/default/files/images/business-uploads/desktop-email-claws.png)

### Evolution

If you're a user of the popular Fedora or Debian distributions, you're probably already familiar with the next option on our list, [Evolution][9]. Evolution is an official part of the GNOME project, but it didn't start out that way. Originally developed at Ximian, and later Novell, Evolution was designed from the ground up to be an enterprise-ready email application.

To this end, Evolution supports Exchange Server and a number of other email setups you might find in a corporate environment. It's also a full personal information manager (PIM), sporting a calendar, task list, contact manager, and note taking application, in addition to handling your email. Even if it's not the default mail application in your distribution, you might want to take a look if you're interested in these features or the included spam filtering, GNU Privacy Guard (GPG) support, integration with LibreOffice, or a slew of other features.

Evolution is made available as open source under the [LGPL][10].

![](https://opensource.com/sites/default/files/images/business-uploads/desktop-email-evolution.png)

### Geary

[Geary][11] is a project originally developed by Yorba Foundation, which made a number of different GNOME software tools. Geary supports a number of popular webmail services as the mail backend through IMAP.

Geary doesn't have a lot of features compared to some other clients on this list, but its simple interface might be appealing to users frustrated with unnecessary complexity in other email programs. Geary is available under the [LGPL][10].

![](https://opensource.com/sites/default/files/images/business-uploads/desktop-email-geary.png)

### KMail

[KMail][12] is the mail component of [Kontact][13], the personal information manager included with KDE. KMail supports a variety of email protocols, including IMAP, SMTP, and POP3, and through its integration with the other Kontact components, it could be considered a complete groupware suite. Despite its Linux routes, a Windows build is also available.

With its long history, KMail has developed most of the features you would expect to find in a modern mail program. While it fits nicely into the KDE group of applications, some may find its interface clunky compared to others. But give it a try and see what you think.

KMail is made available under the [GPL][14].

![](https://opensource.com/sites/default/files/images/business-uploads/desktop-email-kmail.png)

### Mailspring

[Mailspring][15], the new kid on the block, is a relaunch of the now-defunct Nylas Mail by one of the original authors. It replaces Nylas' JavaScript sync engine with a C++ core, which is said to minimize the application's RAM and power demands, and removes heavy dependencies to add speed. Its features include a unified inbox, support for IMAP (but not ActiveSync), Gmail-style search, themes, and message translation.

Mailspring is available for macOS, Windows, and Linux, and it's licensed under [GPLv3][16].

![Mailspring][17]

Of course, there are many more options above and beyond these, including the full-featured PIM [Zimbra Desktop][18] or one of the [lightweight alternatives][19] like [GNUMail][20] that might be the best choice for your situation. What's your favorite open source desktop email client? And with webmail as the first choice of many users, what do you see as the role of the desktop email client in the years to come? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/business/18/1/desktop-email-clients

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://www.mozilla.org/en-US/thunderbird/
[2]: https://blog.mozilla.org/thunderbird/2017/12/new-thunderbird-releases-and-new-thunderbird-staff/
[3]: https://www.mozilla.org/en-US/MPL/
[4]: https://opensource.com/sites/default/files/u128651/desktop-email-thunderbird57.png (Thunderbird)
[5]: http://www.claws-mail.org/
[6]: http://sylpheed.sraoss.jp/en/
[7]: https://opensource.com/resources/what-raspberry-pi
[8]: http://www.claws-mail.org/COPYING
[9]: https://wiki.gnome.org/Apps/Evolution
[10]: http://www.gnu.org/licenses/lgpl-3.0.en.html
[11]: https://wiki.gnome.org/Apps/Geary
[12]: https://userbase.kde.org/KMail
[13]: https://userbase.kde.org/Kontact
[14]: http://www.gnu.org/licenses/gpl-3.0.en.html
[15]: https://getmailspring.com/
[16]: https://github.com/Foundry376/Mailspring/blob/master/LICENSE.md
[17]: https://opensource.com/sites/default/files/u128651/desktop-email-mailspring.png (Mailspring)
[18]: https://www.zimbra.com/open-source-email-overview/
[19]: https://opensource.com/article/17/7/email-alternatives-thunderbird
[20]: http://wiki.gnustep.org/index.php/GNUMail
