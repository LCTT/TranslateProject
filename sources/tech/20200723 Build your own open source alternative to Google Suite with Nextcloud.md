[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build your own open source alternative to Google Suite with Nextcloud)
[#]: via: (https://opensource.com/article/20/7/nextcloud)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Build your own open source alternative to Google Suite with Nextcloud
======
The open source cloud collaboration suite has made major gains in recent
years. Take a look at what you've missed.
![Digital images of a computer desktop][1]

A few years ago, I installed [Nextcloud][2] for a local theatre and museum that was looking for an on-premises cloud solution. As an advocate for open source, I always seek out open source options first, and Nextcloud was the most-common open source cloud solution among my peers. I've also used it for some personal projects, but I hadn't looked at it in a while.

I recently revisited Nextcloud and was amazed by all the changes I saw. The project has evolved into a complete solution that can replace big-name solutions like Google Drive and Microsoft 365. Nextcloud's new feature set, especially [Nextcloud Hub][3], is outstanding, offering collaborative documentation editing, file version control, integrated chat and video calling, and more.

### Getting started with Nextcloud

There are many options for [setting up a Nextcloud server on Linux][4], but I decided to run the official [container image][5]. I pulled it down to my laptop, and soon I was up and running.


```
$ docker pull nextcloud
$ docker run -d -p 8080:80 nextcloud
```

Installation was quick on my MacBook Pro with 8GB RAM. In no time at all, I was logging into Nextcloud for the first time at `http://locahost:8080` with the default credentials of _admin_ and _password_.

![Nextcloud login interface][6]

(Don Watkins, [CC BY-SA 4.0][7])

After I entered my login credentials, it began downloading some applications, which took some time. I appreciated that Nextcloud's interface looked much the same as it did years ago, even with all the changes in the platform, because I like to feel familiar with a technology.

![Nextcloud's UI][8]

(Don Watkins, [CC BY-SA 4.0][7])

Nextcloud's controls are located in the upper-right corner. You can control settings, add apps, create and modify users, learn about Nextcloud, get help, and log out.

Nextcloud Hub is a central collaboration platform where you can access and collaborate on files, launch, enable, and disable applications, manage your calendar, and more.

I decided to start by exploring the apps available in Nextcloud. Some app integrations are included by default, and you can download others with a single click. For example, here is the display when I clicked the top-right icon, then selected Apps and Multimedia.

![Nextcloud multimedia apps][9]

(Don Watkins, [CC BY-SA 4.0][7])

There are hundreds of apps that can be downloaded and added to Nextcloud, and, like Nextcloud, all are licensed under the [AGPLv3][10]. Clicking on an app shows information about it, including its creator and license. I decided to look at [Audio Player][11].

![Nextcloud Audio Player][12]

(Don Watkins, [CC BY-SA 4.0][7])

Nextcloud also comes with the [Nextcloud Talk][13] app for videoconferencing with complete end-to-end encryption to keep communication within your control. As of Nextcloud Hub 19, you can work on documents synchronously during video calls with [Collabora Online][14], which will feel familiar to Google Docs users.

Nextcloud also has a number of important security features, including optional automatic logout, which is useful when using public computers. You can also set up passwordless authentication, automatic account locking after failed login attempts, and two-factor authentication (2FA) through mobile, email, or one-time password devices to verify users' identity before they can log in.

### Nextcloud's advances

Eager to learn more about Nextcloud and its new directions, I reached out to CEO [Frank Karlitschek][15] to ask him some questions by email.

During this time of social distancing, I was curious about how the growth of remote work is fueling Nextcloud's development. Frank says the fact that the world is [working from home][16] is accelerating the adoption of content collaboration software, and Nextcloud is "in the lucky situation that we heavily invested in this fast-growing product category." He specifically cites Nextcloud's abilities to sync, share, and collaboratively view and edit files, as well as its shared calendars, contacts, email, chats, video calls, project management, notes, and many more things as features that help people work together.

Frank adds, "Nextcloud Talk is our solution for chat and audio and video calls. It has the same benefits as the rest of Nextcloud. All data and communication stay under your control. It is fully open source; you can migrate your data and don't need to trust a third-party company."

Open source is a key part of Nextcloud's model, Frank says. "Everything server-side is licensed AGPL, and the desktop and mobile clients are licensed GPL. We are happy to not have any proprietary pieces. Everything at Nextcloud is fully free software and open source."

When I asked him why someone should choose Nextcloud over a proprietary cloud solution, Frank emphasizes the freedom to run where you want with 100% open source software. "Being open source has many benefits for users. It means you can keep your data under your own control. You can run Nextcloud wherever you want. Vendor lock-in is eliminated, so you can move your data around to where you need it. The open source code in Nextcloud ensures that there are no backdoors because the code can be audited. The open source angle has also empowered developers to extend Nextcloud with hundreds of apps, extensions, and plugins."

I was also curious about Nextcloud's security, including its support for [Nitrokey][17], a feature for passwordless authentication. Frank says, "Nextcloud supports authentication from many different protocols, including LDAP, Active Directory, SAML, OAuth, OpenID connect, WebAuthn, and many more. You can use second-factor authentication methods, including Time-based One-time Password (TOTP), SMS, push notification, SecSign, and email. With the new support for [WebAuthn][18], we also support the new passwordless authentication. Nitrokey already supports this, so you can just authenticate with a Nitrokey without a password. We expect that a lot more devices and software will support this new open standard in the future."

As I thought about all the changes in Nextcloud, I wondered about its install base. Being open source makes it impossible to know how many Nextcloud installations there are in the world. One of its [container images][19] has over 100 million downloads, and it has a strong following in its source repository on [GitHub][20]. Nextcloud estimates there are over 400,000 Nextcloud servers on the internet, and that number is growing.

Nextcloud doesn't provide hosting options itself, but it does list service [providers][21] that offer hosted Nextcloud. There are also many options for self-hosting Nextcloud, Frank says. "A Nextcloud server can be very small or very big. Actually, Nextcloud runs fine on a Raspberry Pi for just a few users. This includes chatting and video calling. The Nextcloud server needs a decent network connection if you handle big files or video calls with a lot of users."

### Open source to its core

Frank was eager to thank the open source community that comes together and builds great software. He said, "open source is all about the community; no single person or company could do this alone." Therefore, Nextcloud welcomes [contributions][22] to its development. Nextcloud's code is available on [GitHub][23]. To keep up with the latest information, you can follow Nextcloud on [Twitter][24], [Instagram][25], [Facebook][26], [LinkedIn][27], [Mastodon][28], and [YouTube][29].

Sandstorm's Jade Wang shares some of her favorite open source web apps that are self-hosted...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/nextcloud

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://nextcloud.com/
[3]: https://nextcloud.com/hub/
[4]: https://docs.nextcloud.com/server/19/admin_manual/installation/index.html
[5]: https://hub.docker.com/_/nextcloud/
[6]: https://opensource.com/sites/default/files/uploads/nextcloud_login.png (Nextcloud login interface)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/nextcloud_interface.png (Nextcloud's UI)
[9]: https://opensource.com/sites/default/files/uploads/nextcloud_multimedia-apps.png (Nextcloud multimedia apps)
[10]: https://www.gnu.org/licenses/agpl-3.0.en.html
[11]: https://apps.nextcloud.com/apps/audioplayer
[12]: https://opensource.com/sites/default/files/uploads/nextcloud_audio-player_0.png (Nextcloud Audio Player)
[13]: https://nextcloud.com/talk/
[14]: https://nextcloud.com/collaboraonline/
[15]: https://en.wikipedia.org/wiki/Frank_Karlitschek
[16]: https://opensource.com/tags/wfh
[17]: https://www.nitrokey.com/
[18]: https://en.wikipedia.org/wiki/WebAuthn
[19]: https://hub.docker.com/r/linuxserver/nextcloud/
[20]: https://github.com/nextcloud/server
[21]: https://nextcloud.com/providers/
[22]: https://nextcloud.com/contribute/
[23]: https://github.com/nextcloud
[24]: https://twitter.com/nextclouders
[25]: https://instagram.com/nextclouders
[26]: https://www.facebook.com/Nextclouders/
[27]: https://www.linkedin.com/company/10827569/
[28]: https://mastodon.xyz/@nextcloud
[29]: https://youtube.com/nextcloud
