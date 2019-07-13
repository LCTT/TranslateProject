5 open source alternatives to Skype
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open-source-chat.png?itok=YnNoA9Kk)

If you've been a working adult for more than a decade, you probably remember the high cost and complexity of doing audio- and video conferences. Conference calls were arranged through third-party vendors, and video conferences required dedicated rooms with expensive equipment at every endpoint.

That all started changing by the mid-2000s, as webcams became mainstream computer equipment and Skype and related services hit the market. The cost and complexity of video conferencing decreased rapidly, as nearly anyone with a webcam, a speedy internet connection, and inexpensive software could communicate with colleagues, friends, family members, even complete strangers, right from their home or office PC. Nowadays, your smartphone's video camera puts web conferencing in the palm of your hand anywhere you have a robust cellular or WiFi connection and the right software. But most of that software is proprietary.

Fortunately, there are a handful of powerful open source video-conferencing solutions that can replicate the features of Skype and similar applications. In this roundup, we've focused on applications that can accommodate multiple participants across various locations, although we do offer a couple of 1:1 communications solutions at the end that may meet your needs.

### Jitsi

[Jitsi][1]'s web conferencing solution stands out for its extreme ease of use: It runs directly in the browser with no download necessary. To set up a video-conferencing session, you just point your browser to [Jitsi Meet][2], enter a username (or select the random one that's offered), and click Go. Once you give Jitsi permission to use your webcam and microphone (sessions are [DTLS][3]/[SRTP][4]-encrypted), it generates a web link and a dial-in number others can use to join your session, and you can even add a conference password for an added layer of security.

While in a video-conferencing session, you can share your screen, a document, or a YouTube link and collaboratively edit documents with Etherpad. Android and iOS apps allow you to make and take Jitsi video conferences on the go, and you can host your own multi-user video-conference service by installing [Jitsi Videobridge][5] on your server.

Jitsi is written in Java and compatible with WebRTC standards, and the service touts its low-latency due to passing audio and video directly to participants (rather than mixing them, as other solutions do). Jitsi was acquired by Atlassian in 2015, but it remains an open source project under an [Apache 2.0][6] license. You can check out its source code on [GitHub][7], connect with its [community][8], or see some of the [other projects][9] built on the technology.

### Linphone

[Linphone][10] is a VoIP (voice over internet protocol) communications service that operates over the session initiation protocol (SIP). This means you need a SIP number to use the service and Linphone limits you to contacting only other SIP numbers—not cellphones or landlines. Fortunately, it's easy to get a SIP number—many internet service providers include them with regular service and Linphone also offers a free SIP service you can use.

With Linphone, you can make audio and HD video calls, do web conferencing, communicate with instant messenger, and share files and photos, but there are no other screen-sharing nor collaboration features. It's available for Windows, MacOS, and Linux desktops and Android, iOS, Windows Mobile, and BlackBerry 10 mobile devices.

Linphone is dual-licensed; there's an open source [GPLv2][11] version as well as a closed version which can be embedded in other proprietary projects. You can get its source code from its [downloads][12] page; other resources on Linphone's website include a [user guide][13] and [technical documentation][14].

### Ring

If freedom, privacy, and the open source way are your main motivators, you'll want to check out [Ring][15]. It's an official GNU package, licensed under [GPLv3][16], and takes its commitments to security and free and open source software very seriously. Communications are secured by end-to-end encryption with authentication using RSA/AES/DTLS/SRTP technologies and X.509 certificates.

Audio and video calls are made through the Ring app, which is available for GNU/Linux, Windows, and MacOS desktops and Android and iOS mobile devices. You can communicate using either a RingID (which the Ring app randomly generates the first time it's launched) or over SIP. You can run RingID and SIP in parallel, switching between protocols as needed, but you must register your RingID on the blockchain before it can be used to make or receive communications.

Ring's features include teleconferencing, media sharing, and text messaging. For more information about Ring, access its [source code][17] repository on GitLab, and its [FAQ][18] answers many questions about using the system.

### Riot

[Riot][19] is not just a video-conferencing solution—it's team-management software with integrated group video/voice chat communications. Communication (including voice and video conferencing, file sharing, notifications, and project reminders) happens in dedicated "rooms" that can be organized by topic, team, event, etc. Anything shared in a room is persistently stored with access governed by that room's confidentially settings. A cool feature is that you can use Riot to communicate with people using other collaboration tools—including IRC, Slack, Twitter, SMS, and Gitter.

You can use Riot in your browser (Chrome and Firefox) or via its apps for MacOS, Windows, and Linux desktops and iOS and Android devices. In terms of infrastructure, Riot can be installed on your server, or you can run it on Riot's servers. It is based on the [Matrix][20] React SDK, so all files and data transferred over Riot are secured with Matrix's end-to-end encryption.

Riot is available under an [Apache 2.0][21] license, its [source code][22] is available on GitHub, and you can find [documentation][23], including how-to videos and FAQs, on its website.

### Wire

Developed by the audio engineers who created Skype, [Wire][24] enables up to 10 people to participate in an end-to-end encrypted audio conference call. Video conferencing (also encrypted) is currently limited to 1:1 communications, with group video capabilities on the app's roadmap. Other features include secure screen sharing, file sharing, and group chat; administrator management; and the ability to switch between accounts and profiles (e.g., work and personal) at will from within the app.

Wire is open source under the [GPL 3.0][25] license and is free to use if you [compile it from source][26] on your own server. A paid option is available starting at $5 per user per month (with large enterprise plans also available).

### Other options

If you need 1:1 communications, here are two other services that might interest you: Pidgin and Signal.

[Pidgin][27] is like a one-stop-shop for the multitude of chat networks you and your friends, family, and colleagues use. You can use Pidgin to chat with people who use AIM, Google Talk, ICQ, IRC, XMPP, and multiple other networks, all from the same interface. Check out Ray Shimko's article "[Get started with Pidgin][28]" on [Opensource.com][29] for more information.

This probably isn't the first time you've heard of [Signal][30]. The app transmits end-to-end encrypted voice, video, text, and photos, and it's been endorsed by security and cryptography experts including Edward Snowden and Bruce Schneier and the Electronic Frontier Foundation.

The open source landscape is perpetually changing, so chances are some of you are using other open source video- and audio-conferencing solutions. If you have a favorite not listed here, please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/skype

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:https://jitsi.org/
[2]:https://meet.jit.si/
[3]:https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security
[4]:https://en.wikipedia.org/wiki/Secure_Real-time_Transport_Protocol
[5]:https://jitsi.org/jitsi-videobridge/
[6]:https://github.com/jitsi/jitsi/blob/master/LICENSE
[7]:https://github.com/jitsi
[8]:https://jitsi.org/the-community/
[9]:https://jitsi.org/projects/
[10]:http://www.linphone.org/
[11]:https://www.gnu.org/licenses/gpl-2.0.html
[12]:http://www.linphone.org/technical-corner/linphone/downloads
[13]:http://www.linphone.org/user-guide.html
[14]:http://www.linphone.org/technical-corner/linphone/documentation
[15]:https://ring.cx/
[16]:https://www.gnu.org/licenses/gpl-3.0.en.html
[17]:https://gitlab.savoirfairelinux.com/groups/ring
[18]:https://ring.cx/en/documentation/faq
[19]:https://about.riot.im/
[20]:https://matrix.org/#about
[21]:https://github.com/vector-im/riot-web/blob/master/LICENSE
[22]:https://github.com/vector-im
[23]:https://about.riot.im/need-help/
[24]:https://wire.com/en/
[25]:https://github.com/wireapp/wire/blob/master/LICENSE
[26]:https://github.com/wireapp/wire
[27]:https://pidgin.im/
[28]:https://opensource.com/article/18/4/pidgin-open-source-replacement-skype-business
[29]:https://opensource.com/
[30]:https://signal.org/
