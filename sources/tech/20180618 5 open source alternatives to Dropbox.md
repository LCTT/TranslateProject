5 open source alternatives to Dropbox
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dropbox.jpg?itok=qFwcqboT)

Dropbox is the 800-pound gorilla of filesharing applications. Even though it's a massively popular tool, you may choose to use an alternative.

Maybe that's because you're dedicated to the [open source way][1] for all the good reasons, including security and freedom, or possibly you've been spooked by data breaches. Or perhaps the pricing plan doesn't work out in your favor for the amount of storage you actually need.

Fortunately, there are a variety of open source filesharing applications out there that give you more storage, security, and control over your data at a far lower price than Dropbox charges. How much lower? Try free, if you're a bit tech savvy and have a Linux server to use.

Here are five of the best open source alternatives to Dropbox, plus a few others that you might want to consider.

### ownCloud

![](https://opensource.com/sites/default/files/uploads/owncloud.png)

[ownCloud][2], launched in 2010, is the oldest application on this list, but don't let that fool you: It's still very popular (with over 1.5 million users, according to the company) and actively maintained by a community of 1,100 contributors, with updates released regularly.

Its primary features—file and folding sharing, document collaboration—are similar to Dropbox's. Its primary difference (aside from its [open source license][3]) is that your files are hosted on your private Linux server or cloud, giving users complete control over your data. (Self-hosting is a common thread among the apps on this list.)

With ownCloud, you can sync and access files through clients for Linux, MacOS, or Windows computers or mobile apps for Android and iOS devices, and provide password-protected links to others for collaboration or file upload/download. Data transfers are secured by end-to-end encryption (E2EE) and SSL encryption. You can also expand its functionality with a wide variety of third-party apps available in its [marketplace][4], and there is also a paid, commercially licensed enterprise edition.

ownCloud offers comprehensive [documentation][5], including an installation guide and manuals for users, admins, and developers, and you can access its [source code][6] in its GitHub repository.

### NextCloud

![](https://opensource.com/sites/default/files/uploads/nextcloud.png)

[NextCloud][7] spun out of ownCloud in 2016 and shares much of the same functionality. Nextcloud [touts][8] its high security and regulatory compliance as a distinguishing feature. It has HIPAA (healthcare) and GDPR (privacy) compliance features and offers extensive data-policy enforcement, encryption, user management, and auditing capabilities. It also encrypts data during transfer and at rest and integrates with mobile device management and authentication mechanisms (including LDAP/AD, single-sign-on, two-factor authentication, etc.).

Like the other solutions on this list, NextCloud is self-hosted, but if you don't want to roll your own NextCloud server on Linux, the company partners with several [providers][9] for setup and hosting and sells servers, appliances, and support. A [marketplace][10] offers numerous apps to extend its features.

NextCloud's [documentation][11] page offers thorough information for users, admins, and developers as well as links to its forums, IRC channel, and social media pages for community-based support. If you'd like to contribute, access its source code, report a bug, check out its (AGPLv3) license, or just learn more, visit the project's [GitHub repository][12].

### Seafile

![](https://opensource.com/sites/default/files/uploads/seafile.png)

[Seafile][13] may not have the bells and whistles (or app ecosystem) of ownCloud or Nextcloud, but it gets the job done. Essentially, it acts as a virtual drive on your Linux server to extend your desktop storage and allow you to share files selectively with password protection and various levels of permission (i.e., read-only or read/write).

Its collaboration features include per-folder access control, password-protected download links, and Git-like version control and retention. Files are secured with two-factor authentication, file encryption, and AD/LDAP integration, and they're accessible from Windows, MacOS, Linux, iOS, or Android devices.

For more information, visit Seafile's [GitHub repository][14], [server manual][15], [wiki][16], and [forums][17]. Note that Seafile's community edition is licensed under [GPLv2][18], but its professional edition is not open source.

### OnionShare

![](https://opensource.com/sites/default/files/uploads/onionshare.png)

[OnionShare][19] is a cool app that does one thing: It allows you to share individual files or folders securely and, if you want, anonymously. There's no server to set up or maintain—all you need to do is [download and install][20] the app on MacOS, Windows, or Linux. Files are always hosted on your own computer; when you share a file, OnionShare creates a web server, makes it accessible as a Tor Onion service, and generates an unguessable .onion URL that allows the recipient to access the file via [Tor browser][21].

You can set limits on your fileshare, such as limiting the number of times it can be downloaded or using an auto-stop timer, which sets a strict expiration date/time after which the file is inaccessible (even if it hasn't been accessed yet).

OnionShare is licensed under [GPLv3][22]; for more information, check out its GitHub [repository][22], which also includes [documentation][23] that covers the features in this easy-to-use filesharing application.

### Pydio Cells

![](https://opensource.com/sites/default/files/uploads/pydiochat.png)

[Pydio Cells][24], which achieved stability in May 2018, is a complete overhaul of the Pydio filesharing application's core server code. Due to limitations with Pydio's PHP-based backend, the developers decided to rewrite the backend in the Go server language with a microservices architecture. (The frontend is still based on PHP.)

Pydio Cells includes the usual filesharing and version control features, as well as in-app messaging, mobile apps (Android and iOS), and a social network-style approach to collaboration. Security includes OpenID Connect-based authentication, encryption at rest, security policies, and more. Advanced features are included in the enterprise distribution, but there's plenty of power for most small and midsize businesses and home users in the community (or "Home") version.

You can [download][25] Pydio Cells for Linux and MacOS. For more information, check out the [documentation FAQ][26], [source code][27] repository, and [AGPLv3 license][28].

### Others to consider

If these choices don't meet your needs, you may want to consider these open source filesharing-type applications.

  * If your main goal is to sync files between devices, rather than to share files, check out [Syncthing][29]).
  * If you're a Git fan and don't need a mobile app, you might appreciate [SparkleShare][30].
  * If you primarily want a place to aggregate all your personal data, take a look at [Cozy][31].
  * And, if you're looking for a lightweight or dedicated filesharing tool, peruse [Scott Nesbitt's review][32] of some lesser-known options.



What is your favorite open source filesharing application? Let us know in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/dropbox

作者：[OPensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:https://opensource.com/open-source-way
[2]:https://owncloud.org/
[3]:https://www.gnu.org/licenses/agpl-3.0.html
[4]:https://marketplace.owncloud.com/
[5]:https://doc.owncloud.com/
[6]:https://github.com/owncloud
[7]:https://nextcloud.com/
[8]:https://nextcloud.com/secure/
[9]:https://nextcloud.com/providers/
[10]:https://apps.nextcloud.com/
[11]:https://nextcloud.com/support/
[12]:https://github.com/nextcloud
[13]:https://www.seafile.com/en/home/
[14]:https://github.com/haiwen/seafile
[15]:https://manual.seafile.com/
[16]:https://seacloud.cc/group/3/wiki/
[17]:https://forum.seafile.com/
[18]:https://github.com/haiwen/seafile/blob/master/LICENSE.txt
[19]:https://onionshare.org/
[20]:https://onionshare.org/#downloads
[21]:https://www.torproject.org/
[22]:https://github.com/micahflee/onionshare/blob/develop/LICENSE
[23]:https://github.com/micahflee/onionshare/wiki
[24]:https://pydio.com/en
[25]:https://pydio.com/download/
[26]:https://pydio.com/en/docs/faq
[27]:https://github.com/pydio/cells
[28]:https://github.com/pydio/pydio-core/blob/develop/LICENSE
[29]:https://syncthing.net/
[30]:http://www.sparkleshare.org/
[31]:https://cozy.io/en/
[32]:https://opensource.com/article/17/3/file-sharing-tools
