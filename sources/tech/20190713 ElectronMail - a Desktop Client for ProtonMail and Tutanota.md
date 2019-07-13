[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ElectronMail – a Desktop Client for ProtonMail and Tutanota)
[#]: via: (https://itsfoss.com/electronmail/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

ElectronMail – a Desktop Client for ProtonMail and Tutanota
======

The majority of people on the internet have email accounts from big companies, such as Google, that do not respect your privacy. Thankfully, there are privacy conscience alternatives like [Tutanota][1] and [ProtonMail][2]. The problems is that not all of them have a desktop client. Today, we will look at a project that seeks to solve that problem for you. Let’s take a look at ElectronMail.

‘Electron’-ic warning!

The following app is built with Electron (the name is ElectronMail for a reason). If the use of Electron upsets you, please consider this a trigger warning.

### ElectronMail: Desktop Client for Tutanota and ProtonMail

![Electron Mail About][3]

[ElectronMail][4] is simply put an email client for ProtonMail and Tutanota. It is built using three big technologies: [Electron][5], [TypeScript][6] and [Angular][7]. It includes the following features:

  * Multi accounts support per each email provider
  * Encrypted local storage
  * Available for Linux, Windows, macOS, and FreeBSD
  * Native notifications
  * System tray icon with a total number of unread messages
  * Master password to protect account information
  * Switchable view layouts
  * Offline access to the emails
  * Encrypted local storage for emails
  * Batch emails export to EML files
  * Full-text search
  * Built-in/prepackaged web clients
  * Configuring proxy per account
  * Spell Checking
  * Support for two-factor authentication for extra security



Currently, ElectronMail only supports Tutanota and ProtonMail. I get the feeling that they will be adding more in the future. According to the [GitHub page][4]: “Multi email providers support. ProtonMail and Tutanota at the moment.”

ElectronMail is licensed under the MIT license.

#### How to install ElectronMail

Currently, there are several options to install ElectronMail on Linux. for Arch and Arch-based distros, you can install it from the [Arch User Repository][8]. There is also a Snap available for ElectrionMail. To install it, just enter `sudo snap install electron-mail`.

For all other Linux distros, you can [download][9] a `.deb` or `.rpm` file.

![Electron Mail Inbox][10]

You can also [download][9] an `.exe` installer for Windows or a `.dmg` file for macOS. There is even a file for FreeBSD.

[][11]

Suggested read  Zettlr - Markdown Editor for Writers and Researchers

#### Removing ElectronMail

If you install ElectronMail and decide that it is not for you, there are a couple steps that the [developer][12] recommends. **Be sure to follow these steps before you uninstall the application.**

If you are using the “Keep Me Signed In” feature, click “Log out” on the menu. This will delete the locally stored master password. It is possible to delete the master password after uninstalling ElectronMail, but that would involve editing the system keychain.

You will also need to delete the settings folder manually. You can find it by clicking “Open setting folder” after selecting the application’s icon in the system tray.

![Electron Mail Setting][13]

### My Thoughts on ElectronMail

I don’t usually use email clients. In fact, I mostly depend on web clients. So, I don’t have much use for this application.

That being said, ElectronMail has a nice feel to it and is easy to set up. It has a good number of features activated out of the box and the advanced features aren’t that hard to activate.

The one question I have relates to search. According to the features list, ElectronMail supports full-text search. However, the free version of Tutanota only supports a limited search. I wonder how ElectronMail handles that.

At the end of the day, ElectronMail is just an Electron wrapper for a couple of web-based emails. I would rather just have them open in my browser than dedicate separate system resources to running Electron. If you only [use Tutanota email, they have their own official Electron-based desktop client][14]. You may try that.

My biggest issue is with security. This is an unofficial app for two very secure email apps. What if there is a way to capture your login info or read through your emails? Someone who is smarter than I would have to go through the source code to know for sure. That is always the issue with unofficial apps for a security project.

[][14]

Suggested read  Secure Email Service Tutanota Has a Desktop App Now

Have you every used ElectronMail? Do you think it would be worthwhile to install ElectronMail? What is your favorite email client? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][15].

--------------------------------------------------------------------------------

via: https://itsfoss.com/electronmail/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutanota-review/
[2]: https://itsfoss.com/protonmail/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/electron-mail-about.jpg?resize=800%2C500&ssl=1
[4]: https://github.com/vladimiry/ElectronMail
[5]: https://electronjs.org/
[6]: http://www.typescriptlang.org/
[7]: https://angular.io/
[8]: https://aur.archlinux.org/packages/electronmail-bin
[9]: https://github.com/vladimiry/ElectronMail/releases
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/electron-mail-inbox.jpg?ssl=1
[11]: https://itsfoss.com/zettlr-markdown-editor/
[12]: https://github.com/vladimiry
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/electron-mail-setting.jpg?ssl=1
[14]: https://itsfoss.com/tutanota-desktop/
[15]: http://reddit.com/r/linuxusersgroup
