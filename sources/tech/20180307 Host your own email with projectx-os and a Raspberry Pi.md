Host your own email with projectx/os and a Raspberry Pi
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

There are plenty of reasons not to want to hand off the tasks of storing your data and running your services to third-party companies; privacy, ownership, and avoiding abusive "monetization" are some of the top ones. But for most people, the task of running a server is just too time-consuming and requires too much-specialized knowledge. Instead, we compromise. We put aside our worries and just use cloud-hosted corporate services, with all the advertising, data mining and selling, and everything else that comes with them.

This project aims to eliminate that compromise: [projectx/os][1] makes hosting services at home cheap and nearly as easy as creating a Gmail account. All you need is a $35 Raspberry Pi 3 and a Debian-derived OS image—and very little technical knowledge. There are only four steps:

  1. Unzip a ZIP file onto a Secure Digital memory card.
  2. Edit a text file on the SD card with your WiFi password (if you're not using wired Ethernet).
  3. Place the SD card into the slot on the Raspberry Pi 3.
  4. Use your smartphone to choose a subdomain and install the "email server" app on the Raspberry Pi 3.



Server applications (such as email servers) are broken into multiple containers, which can only communicate with the outside world and each other in declaratively specified ways, using fine-grained isolation to improve security. For example, incoming SMTP, [SpamAssassin][2] (anti-spam platform), [Dovecot][3] (secure IMAP server), and webmail are all separate containers that can't see each other's data, so compromising an individual daemon does not compromise the others.

In addition, stateless containers, such as SpamAssassin and incoming SMTP, can be torn down and recreated after each incoming email, so even if someone finds a bug and exploits it, they can't access previous emails or subsequent emails; they can only access their own exploit email. Fortunately, the services that are most exposed to attack are the easiest to run isolated and stateless.

All storage is encrypted using [dm-crypt][4]. Non-public services, such as Dovecot (IMAP) or webmail, listen on a private, encrypted overlay network provided by [ZeroTier One][5], so only your devices (phones, laptops, tablets, etc.) can access them.

While emails aren't encrypted end-to-end (unless you use [PGP][6]), the unencrypted email never crosses a network and is never stored on disk. It is present in plaintext only on the two parties' private mail servers, which are secured in their homes and on their clients (phones, laptops, etc.).

One other advantage is that personal devices secured with a passcode (not a fingerprint or other biometrics) and devices in your home receive far stronger [Fourth Amendment][7] legal protections in the United States than data on a server in a third-party data center owned by a company that wants to avoid downtime or be seen as uncooperative. Of course, if you email with a Gmail user, for example, Google still gets a copy.

### Going forward

Email is the first application I've packaged with projectx/os. Imagine an app store full of server software, packaged up for ease of installation and use. Want a blog? Add a WordPress app! Secure Dropbox replacement? Add a [Seafile][8] app or a [Syncthing][9] backend app. [IPFS][10] node? [Mastodon][11] instance? GitLab server? Various home automation/IoT backend services? There are tons of great open source server software that is as easy to install and use as the proprietary cloud services they replace.

Nolan Leake will be presenting [A cloud in every home: Host servers at home with 0 sysadmin skills][12] at the [Southern California Linux Expo][12] in Pasadena, March 8-11. To attend and get 50% of your ticket, [register][13] using promo code **OSDC**.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/host-your-own-email

作者：[Nolan Leake][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nolan
[1]:https://git.sigbus.net/projectx/os
[2]:http://spamassassin.apache.org/
[3]:https://www.dovecot.org/
[4]:https://gitlab.com/cryptsetup/cryptsetup/wikis/DMCrypt
[5]:https://www.zerotier.com/download.shtml
[6]:https://en.wikipedia.org/wiki/Pretty_Good_Privacy
[7]:https://simple.wikipedia.org/wiki/Fourth_Amendment_to_the_United_States_Constitution
[8]:https://www.seafile.com/en/home/
[9]:https://syncthing.net/
[10]:https://ipfs.io/
[11]:https://github.com/tootsuite/mastodon
[12]:https://www.socallinuxexpo.org/scale/16x/presentations/cloud-every-home-host-servers-home-0-sysadmin-skills
[13]:https://register.socallinuxexpo.org/reg6/
