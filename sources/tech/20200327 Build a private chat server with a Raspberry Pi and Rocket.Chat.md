[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a private chat server with a Raspberry Pi and Rocket.Chat)
[#]: via: (https://opensource.com/article/20/3/raspberry-pi-rocketchat)
[#]: author: (Giuseppe Cassibba https://opensource.com/users/peppe8o)

Build a private chat server with a Raspberry Pi and Rocket.Chat
======
Create your own truly private chat and messaging solution with these
simple, cost-effective open source tools.
![Chat via email][1]

The internet offers plenty of free messaging services. Applications like WhatsApp and Viber are part of our daily life and are the most common way we communicate with relatives and friends. But security awareness is increasing the demand for a truly private chat solution. Furthermore, messaging apps take up a lot of space in our devices, so an alternative chat channel could be useful to share media, info, and contacts with our friends.

Today we are going to see how to install a private chat and messaging server with a [Raspberry Pi][2] and Rocket.Chat.

### What is Rocket.Chat?

[Rocket.Chat][3] is an open source solution that provides an enhanced chat service. It includes collaboration tools like media sharing, screen sharing, and video/audio calling support.

It can be used both via browser or from apps available in all the main app stores (Google Play, App Store, etc.).

In addition to the community version, Rocket.Chat also offers Enterprise and Professional versions, including support and additional features.

### What we need

For this project, I’m going to use a cheaper Raspberry Pi 3 model A+. RPI 3 models B and B+, and RPI 4 model B should also work in the same way.

I also suggest a performing SD card, because Rocket.Chat can put a heavy workload on our Raspberry Pi. As discussed in other articles, a performing SD card strongly improves Raspbian OS performance.

We’ll use a lite version of Raspbian with pre-configured WiFi access and SSH service, so ![][4] there will no need for keyboards or HDMI cables.

### Step-by-step procedure

Start by [installing the last version of Raspbian Buster Lite][5].

We’ll simplify Rocket.Chat installation by using [Snap][6]. Login via SSH and type from the terminal:


```
sudo apt-get update
sudo apt-get upgrade
```

Install Snap:


```
`sudo apt-get install snapd`
```

For Snap installation, we need a system reboot to make it work:


```
`sudo reboot`
```

Login again via SSH and install the Rocket.Chat server with the simple command:


```
`sudo snap install rocketchat-server`
```

After installing from the terminal, please wait a while for Rocket.Chat to initialize its database and services. Have a cup of tea, and after a few minutes you should be able to reach with your browser the address http://&lt;&lt;YOUR_RPI_IP_ADDRESS&gt;&gt;:3000 and you should see the following:

![Rocket Chat setup wizard][7]

Complete the required forms, and everything should go fine. After four simple setup windows, you should reach the Rocket.Chat home page:

![Rocket Chat home page][8]

Enjoy!

_This article originally posted on [peppe8o.com][9], reposted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/raspberry-pi-rocketchat

作者：[Giuseppe Cassibba][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peppe8o
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://rocket.chat/
[4]: https://ir-na.amazon-adsystem.com/e/ir?t=peppe8o0b-20&l=am2&o=1&a=B07KKBCXLY
[5]: https://peppe8o.com/2019/07/install-raspbian-buster-lite-in-your-raspberry-pi/
[6]: https://snapcraft.io/
[7]: https://opensource.com/sites/default/files/uploads/rocket-chat-setup-wizard.jpg (Rocket Chat setup wizard)
[8]: https://opensource.com/sites/default/files/uploads/rocket-chat-home.jpg (Rocket Chat home page)
[9]: https://peppe8o.com/private-chat-and-messaging-server-with-raspberry-pi-and-rocket-chat/
