[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Secure Email Service Tutanota Has a Desktop App Now)
[#]: via: (https://itsfoss.com/tutanota-desktop)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Secure Email Service Tutanota Has a Desktop App Now
======

[Tutanota][1] recently [announced][2] the release of a desktop app for their email service. The beta is available for Linux, Windows, and macOS.

### What is Tutanota?

There are plenty of free, ad-supported email services available online. However, the majority of those email services are not exactly secure or privacy-minded. In this post-[Snowden][3] world, [Tutanota][4] offers a free, secure email service with a focus on privacy.

Tutanota has a number of eye-catching features, such as:

  * End-to-end encrypted mailbox
  * End-to-end encrypted address book
  * Automatic end-to-end encrypted emails between users
  * End-to-end encrypted emails to any email address with a shared password
  * Secure password reset that gives Tutanota absolutely no access
  * Strips IP addresses from emails sent and received
  * The code that runs Tutanota is [open source][5]
  * Two-factor authentication
  * Focus on privacy
  * Passwords are salted and hashed locally with Bcrypt
  * Secure servers located in Germany
  * TLS with support for PFS, DMARC, DKIM, DNSSEC, and DANE
  * Full-text search of encrypted data executed locally



![][6]
Tutanota on the web

You can [sign up for an account for free][7]. You can also upgrade your account to get extra features, such as custom domains, custom domain login, domain rules, extra storage, and aliases. They also have accounts available for businesses.

Tutanota is also available on mobile devices. In fact, it’s [Android app is open source as well][8].

This German company is planning to expand beyond email. They hope to offer an encrypted calendar and cloud storage. You can help them reach their goals by [donating][9] via PayPal and cryptocurrency.

### The New Desktop App from Tutanota

Tutanota announced the [beta release][2] of the desktop app right before Christmas. They based this app on [Electron][10].

![][11]
Tutanota desktop app

They went the Electron route:

  * to support all three major operating systems with minimum effort.
  * to quickly adapt the new desktop clients so that they match new features added to the webmail client.
  * to allocate development time to particular desktop features, e.g. offline availability, email import, that will simultaneously be available in all three desktop clients.



Because this is a beta, there are several features missing from the app. The development team at Tutanota is working to add the following features:

  * Email import and synchronization with external mailboxes. This will “enable Tutanota to import emails from external mailboxes and encrypt the data locally on your device before storing it on the Tutanota servers.”
  * Offline availability of emails
  * Two-factor authentication



### How to Install the Tutanota desktop client?

![][12]Composing email in Tutanota

You can [download][2] the beta app directly from Tutanota’s website. They have an [AppImage file for Linux][13], a .exe file for Windows, and a .app file for macOS. You can post any bugs that you encounter to the Tutanota [GitHub account][14].

To prove the security of the app, Tutanota signed each version. “The signatures make sure that the desktop clients as well as any updates come directly from us and have not been tampered with.” You can verify the signature using from Tutanota’s [GitHub page][15].

Remember, you will need to create a Tutanota account before you can use it. This is email client is designed to work solely with Tutanota.

### Wrapping up

I tested out the Tutanota email app on Linux Mint MATE. As to be expected, it was a mirror image of the web app. At this point in time, I don’t see any difference between the desktop app and the web app. The only use case that I can see to use the app now is to have Tutanota in its own window.

Have you ever used [Tutanota][16]? If not, what is your favorite privacy conscience email service? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][17].

![][18]

--------------------------------------------------------------------------------

via: https://itsfoss.com/tutanota-desktop

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutanota-review/
[2]: https://tutanota.com/blog/posts/desktop-clients/
[3]: https://en.wikipedia.org/wiki/Edward_Snowden
[4]: https://tutanota.com/
[5]: https://tutanota.com/blog/posts/open-source-email
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/tutanota2.jpg?resize=800%2C490&ssl=1
[7]: https://tutanota.com/pricing
[8]: https://itsfoss.com/tutanota-fdroid-release/
[9]: https://tutanota.com/community
[10]: https://electronjs.org/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/tutanota-app1.png?fit=800%2C486&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/tutanota1.jpg?resize=800%2C405&ssl=1
[13]: https://itsfoss.com/use-appimage-linux/
[14]: https://github.com/tutao/tutanota
[15]: https://github.com/tutao/tutanota/blob/master/buildSrc/installerSigner.js
[16]: https://tutanota.com/polo/
[17]: http://reddit.com/r/linuxusersgroup
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/02/tutanota-featured.png?fit=800%2C450&ssl=1
