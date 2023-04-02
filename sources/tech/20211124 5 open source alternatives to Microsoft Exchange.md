[#]: subject: "5 open source alternatives to Microsoft Exchange"
[#]: via: "https://opensource.com/article/21/11/open-source-alternatives-microsoft-exchange"
[#]: author: "Heike Jurzik https://opensource.com/users/hej"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 open source alternatives to Microsoft Exchange
======
There is no need to settle for a proprietary solution. Try one of these
Linux-based email and groupware services.
![Working on a team, busy worklife][1]

For decades, Microsoft Exchange has ruled the market for email and groupware services. This top dog dominates the corporate world, and the omnipresent Outlook mail client has become the de facto standard for groupware. Since Exchange is closely integrated with Microsoft's Office products, users have access to a wide variety of productivity software and features, whether they're using a desktop or a mobile client.

However, many companies have concerns about storing their data in the Microsoft cloud. In this article, I look at some open source alternatives and their advantages. It's not just about becoming vendor-independent and reducing costs; it's about using software with open standards and a different level of security—for the groupware server itself and the operating system behind it.

All five alternatives in this article are Linux-based. While grommunio, Kopano, Nextcloud, ownCloud, and the OX App Suite vary widely in functionality and are therefore attractive to different types of enterprises, they all provide free editions with the option to purchase paid support and add-ons. All candidates can either run on-prem or in the cloud. On top of that, all vendors offer a SaaS solution for their software.

### grommunio

[grommunio][2], formerly known as grammm, is published under the AGPLv3 license. It is developed and supported by the Austrian company of the same name. Unlike Exchange, grommunio offers a mail server that's standards-compliant as well as a fully functional groupware solution with features like email, contacts, calendar, tasks, file sharing, and more. grommunio works with various open source and proprietary mail clients, like Windows Mail, Outlook, Android, Apple Mail/iOS, Thunderbird, etc., and supports both the older RPC over HTTP protocol and the Outlook standard protocol MAPI over HTTP. Also included: Exchange ActiveSync for mobile devices and various standard protocols like CalDAV (calendar), CardDAV (address book), IMAP, POP3, SMTP, and LDAP, as well as Active Directory (for syncing of user accounts).

External open source applications provide some features not supported by Microsoft's API or protocols. For example, the developers have integrated [Jitsi][3] (video and audio telephony), [Mattermost][4] (chat), and file sharing and syncing ([ownCloud][5]). grommunio is also equipped with basic mobile device management (MDM).

grommunio is designed for a very large number of users and—just like Exchange—supports database sharding (horizontal distribution of databases across multiple hosts). The flexible storage backend allows administrators to extend their setup by adding other servers or cloud accounts. grommunio uses a MySQL database for metadata only, while all "content" such as mail and groupware objects are stored in a per-user SQLite database. For more information on the underlying architecture, please have a look at the [manufacturer's website][6].

The Community edition is free of charge and includes all grommunio features for up to five user accounts. 

### Kopano

[Kopano][7], from the German-Dutch software manufacturer Kopano, is also AGPLv3-licensed and based on the Zarafa software stack. Unlike its predecessor, Kopano doesn't aim to be a mere replacement for Exchange. Instead, it's a complete groupware solution and includes real-time communication in addition to the standard features of email, contacts, calendar, tasks, notes, and document editing. Kopano interacts with [many other platforms][8], applications, and services. Some of them can easily be integrated by plugins. For video conferencing, the Kopano team has developed its own open source solution based on WebRTC: Kopano Meet offers end-to-end encryption and is available for Windows, macOS, Linux, Android, and iOS.

Outlook clients are supported via ActiveSync (Z-Push library) or the [Kopano OL Extension][9] (KOE), which serves as an enhancement to the already included ActiveSync. Kopano offers a native web client (WebApp), a client for mobile devices (Mobility), and a desktop version (DeskApp) with support for Windows, Linux, and macOS. Connecting other clients is possible via IMAP, CalDAV, and CardDAV. All applications directly connecting to the Kopano Server use MAPI in SOAP (Simple Object Access Protocol).

Free community versions are available for Kopano Groupware and Kopano ONE (a special edition of the Kopano Groupware). Kopano Meet can be downloaded as an application or container.

### Nextcloud

[Nextcloud][10], with offices in Stuttgart and Berlin (Germany), is licensed under the AGPLv3. Like in ownCloud or Dropbox, users can access the software suite via their desktops (Windows, Linux, and macOS), web browsers, or native apps (Android and iOS). Since version 18, Nextcloud includes Nextcloud Talk (calls, chats, and web meetings) and Nextcloud Groupware (calendar, contacts, and mail) in addition to Nextcloud Files (file sync and share), and changed its name to Nextcloud Hub.

User and group administration happens via OpenID or LDAP. Various storage backends are supported, such as FTP, S3, and Dropbox. Nextcloud works with several database management systems, including PostgreSQL, MariaDB, SQLite, and Oracle Database. Admins can extend the functionality with more than 200 apps from the [Nextcloud app store][11]. Offerings include real-time communication, audio and video chat, task management, mail, and many more.

Nextcloud is completely free of charge. On top of that, the company offers a Nextcloud Enterprise build (pre-configured, optimized, and hardened for enterprise deployments). 

### ownCloud

[ownCloud][12] is a file sync, share, and content collaboration software developed and maintained by ownCloud GmbH in Nuremberg, Germany. The core of the client-server software and many community apps are published under the AGPLv3. Several enterprise apps which extend the functionality are licensed under the ownCloud Commercial License (OCL).

ownCloud is mainly a content collaboration software, including online office document editing, calendar, contact synchronization, etc. Mobile clients are available for Android and iOS, and the desktop app integrates into the native file managers in Windows, macOS, and Linux. The Web interface allows access without installing dedicated client software. ownCloud supports WebDAV, CalDAV, and CardDAV. LDAP is included, but ownCloud also connects to other Identity Providers supporting the OpenID Connect authentication standard.

ownCloud offers integrations for Microsoft Office Online Server, Office 365, and Microsoft Teams. Plugins for Microsoft Outlook and eM Client are available. If necessary, the External Storage Feature connects to different storage providers, like Amazon S3, Dropbox, Microsoft SharePoint, Google Drive, Windows network drives (SMB), and FTP. The vendor also offers additional features for enterprise customers, like end-to-end encryption, ransomware and antivirus protection, etc. (see the [full list of features][13]).

The Community edition is free of charge and 100% open source.  

### OX App Suite

[Open-Xchange][14] was founded in 2005 with headquarters in Olpe and Nuremberg, Germany. Today, OX has offices in various European countries, the USA, and Japan. The [OX App Suite][15] is a modular email, communication, and collaboration platform, mainly designed for telcos, hosting companies, and other providers delivering cloud-based services.

The backend is released under the GPLv2, the frontend (UI) under the AGPLv3. Users can access the app suite via their preferred browser (fully customizable portal) or a mobile app (Android and iOS). Alternatively, native clients (mobile devices and desktops) are available for OX Mail and OX Drive. Thanks to CardDAV and CalDAV extensions, Exchange Active Sync, and the OX Sync App for Android, synchronization of contacts, calendars, and tasks is possible.

OX App Suite contains apps for email, contacts, calendars, and tasks. Additional tools and extensions—some open source, some paid features—are available, including OX Documents (text documents, spreadsheets, presentations), OX Drive (manage, share, and synchronize files), OX Guard (encryption of emails and files), and more. For a complete list, please visit the OX website for [general terms and conditions][16].

A community edition with limited features is available at no charge.  

### Open source email and groupware

Email and groupware services don't have to cost (lots of) money, and there is certainly no need to settle for a proprietary solution hosted on someone else's server. If you're not too keen on the administrative responsibilities, though, all five open source Exchange alternatives are available as SaaS solutions. Alternatively, all vendors offer professional tech support, and you can run the software on-premise—always in control, but never alone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/open-source-alternatives-microsoft-exchange

作者：[Heike Jurzik][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hej
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://grommunio.com/
[3]: https://opensource.com/article/20/5/open-source-video-conferencing
[4]: https://opensource.com/article/20/7/mattermost
[5]: https://opensource.com/article/21/7/owncloud-windows-files
[6]: https://grommunio.com/features/architecture/
[7]: https://kopano.com/
[8]: https://kopano.com/products/interoperability/
[9]: https://kb.kopano.io/display/WIKI/Setting+up+the+Kopano+OL+Extension
[10]: https://nextcloud.com/
[11]: https://apps.nextcloud.com/
[12]: https://owncloud.com/
[13]: https://owncloud.com/features/
[14]: https://www.open-xchange.com/
[15]: https://www.open-xchange.com/products/ox-app-suite/
[16]: https://www.open-xchange.com/terms-and-conditions/
