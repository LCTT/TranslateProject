Install Jitsi Instant Messenger in Ubuntu
================================================================================
[Jitsi][1] is an open source and multi platform audio/video Internet phone and instant messenger written in Java. It supports some of the most popular instant messaging and telephony protocols such as SIP, Jabber/XMPP (and hence Facebook and Google Talk), AIM, ICQ, MSN, Yahoo! Messenger.

Jitsi is also considered a good alternative to Skype.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/About-Jitsi.png)

**Installing Jitsi**

Press Ctrl+Alt+T on your keyboard to open terminal. When it opens, run below command to download it:

**32 Bit:**

    $ wget https://download.jitsi.org/jitsi/debian/jitsi_2.2-latest_i386.deb

**64 Bit:**

    $ wget https://download.jitsi.org/jitsi/debian/jitsi_2.2-latest_amd64.deb

Run the command below for both 32 and 64 bit systems:

    $ sudo dpkg -i jitsi_2.2-latest_*.deb

The above command installs Jitsi 2.2 on your system and add its repository to your system, making it easy for updates.

The above command installs Jitsi 2.2 on your system and add its repository to your system, making it easy for updates. - See more at: http://www.unixmen.com/install-jitsi-instant-messenger-ubuntu/#sthash.Ax75AebB.dpuf

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/jitsi_main.png)

**Some Features of Jitsi are:**

**Supported Protocols/Networks**

- SIP XMPP (Jabber)
- GoogleTalk (via XMPP) Facebook (via XMPP)
- .NET Messenger Service (commonly known as MSN or Windows Live Messenger), Yahoo! Messenger,
AIM ICQ

**Calls**

- SIP XMPP MSN
- Audio calls not planned due to EOL
- Video Calls not planned due to EOL
- Desktop streaming not planned due to EOL
- Desktop sharing not planned due to EOL
- Audio conference calls not planned due to EOL
- Audio level display not planned due to EOL
- Call recording not planned due to EOL
- Attended transfer not planned due to EOL
- Blind transfer not planned due to EOL
- Call encryption with SDES/SRTP and ZRTP not planned due to EOL
- Mute not planned due to EOL
- Hold not planned due to EOL
- Support for ICE work in progress not planned due to EOL
- Support for TURN work in progress not planned due to EOL
- Wideband audio with SILK, G.722 and Speex not planned due to EOL
- Noise suppression not planned due to EOL
- Echo cancellation not planned due to EOL

**Instant Messaging**

- XMPP MSN Yahoo! ICQ/AIM SIP
- Presence
- One-to-one chats
- Multi-user chats
- File transfer
- OTR encryption

More features [here][2]

**Using Jitsi**

Jitsi can be launched from the terminal by typing:

    $ jitsi

Or from the dash

**Dash > Jitsi**

Adding an account:

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/addnew.png)

For this tutorial, am going to login with Gtalk.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Add-new-account_0051.png)

Click **select network**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/select_account.png)

Enter your **username** and **password** as required.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/login.png)

And you are online.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Jitsi_online.png)

Chat window.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/chat.png)

For other Linux distros, visit Jitsi [download page][3]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-jitsi-instant-messenger-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:https://jitsi.org/Main/HomePage
[2]:https://jitsi.org/Main/Features
[3]:https://jitsi.org/Main/Download