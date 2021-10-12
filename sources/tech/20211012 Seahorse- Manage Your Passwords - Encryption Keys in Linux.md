[#]: subject: "Seahorse: Manage Your Passwords & Encryption Keys in Linux"
[#]: via: "https://itsfoss.com/seahorse/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Seahorse: Manage Your Passwords & Encryption Keys in Linux
======

_**Brief:**_ _A simple open-source password and encryption key manager app, let’s explore what it has to offer and how you can get it installed._

We often tend to ignore many default/pre-installed applications, especially when numerous tools and utilities are baked in.

One such helpful tool that you can use on various Linux distributions is **GNOME’s Seahorse**.

### Seahorse: GNOME’s Password &amp; Encryption Key Manager

![][1]

Primarily, Seahorse is an application that comes pre-installed with GNOME desktop and tailored for the same.

However, you can use it on just about any Linux distribution of your choice. It is a simple and effective utility to manage your passwords and encryption keys / keyring locally.

You might want to read about the [concept of keyring in Linux][2] if it’s a first for you.

If you are not a fan of cloud-based password managers, Seahorse can be a great solution to your requirements. Even though it looks straightforward, there are a few essential features that you may find useful.

Of course, you should also explore some of the [best password managers available for Linux][3] if your priority doesn’t involve managing encryption keys (or local storage).

### Features of Seahorse

While you can easily use it as a local (offline) password manager, there are a couple of things that you can do with Seahorse to step up your security management when dealing with encryption keys as well.

![][4]

Some key highlights are:

  * Ability to store Secure Shell key (used to access remote computers/servers)
  * Store GPG keys used to secure emails and files
  * Supports adding password keyring for application and networks
  * Securely store private key of a certificate
  * Store a password / secret phrase
  * Ability to import files and quickly store them
  * Find remote keys
  * Sync and publish keys
  * Ability to find/copy VPN password



![][5]

### Installing Seahorse in Linux

If you are using a GNOME-based distribution, you should already have it installed. You need to look for “Seahorse” or “Passwords” to find it.

In other cases, you can search for it in the software center. It should work fine with KDE, LXQt, and different desktop environments as per my quick tests.

![][6]

Moreover, you can find its [Flatpak package][7] available. So, no matter the Linux distribution you are using, Seahorse can be installed.

If you are using Arch Linux, you should also find it in [AUR][8].

[Seahorse][9]

What do you think about using Seahorse to replace other password managers? Were you already using it to manage encryption keys? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/seahorse/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-password-keys.png?resize=800%2C613&ssl=1
[2]: https://itsfoss.com/ubuntu-keyring/
[3]: https://itsfoss.com/password-managers-linux/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-login.png?resize=800%2C583&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-keys.png?resize=800%2C579&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-software.png?resize=800%2C508&ssl=1
[7]: https://www.flathub.org/apps/details/org.gnome.seahorse.Application
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://wiki.gnome.org/Apps/Seahorse/
