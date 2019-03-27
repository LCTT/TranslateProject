[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Setup Linux Media Server Using Jellyfin)
[#]: via: (https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Setup Linux Media Server Using Jellyfin
======

![Setup Linux Media Server Using Jellyfin][1]

We’ve already written about setting up your own streaming media server on Linux using [**Streama**][2]. Today, we will going to setup yet another media server using **Jellyfin**. Jellyfin is a free, cross-platform and open source alternative to propriety media streaming applications such as **Emby** and **Plex**. The main developer of Jellyfin forked it from Emby after the announcement of Emby transitioning to a proprietary model. Jellyfin doesn’t include any premium features, licenses or membership plans. It is completely free and open source project supported by hundreds of community members. Using jellyfin, we can instantly setup Linux media server in minutes and access it via LAN/WAN from any devices using multiple apps.

### Setup Linux Media Server Using Jellyfin

Jellyfin supports GNU/Linux, Mac OS and Microsoft Windows operating systems. You can install it on your Linux distribution as described below.

##### Install Jellyfin On Linux

As of writing this guide, Jellyfin packages are available for most popular Linux distributions, such as Arch Linux, Debian, CentOS, Fedora and Ubuntu.

On **Arch Linux** and its derivatives like **Antergos** , **Manjaro Linux** , you can install Jellyfin using any AUR helper tools, for example [**YaY**][3].

```
$ yay -S jellyfin-git
```

On **CentOS/RHEL** :

Download the latest Jellyfin rpm package from [**here**][4] and install it as shown below.

```
$ wget https://repo.jellyfin.org/releases/server/centos/jellyfin-10.2.2-1.el7.x86_64.rpm

$ sudo yum localinstall jellyfin-10.2.2-1.el7.x86_64.rpm
```

On **Fedora** :

Download Jellyfin for Fedora from [**here**][5].

```
$ wget https://repo.jellyfin.org/releases/server/fedora/jellyfin-10.2.2-1.fc29.x86_64.rpm

$ sudo dnf install jellyfin-10.2.2-1.fc29.x86_64.rpm
```

On **Debian** :

Install HTTPS transport for APT if it is not installed already:

```
$ sudo apt install apt-transport-https
```

Import Jellyfin GPG signing key:``

```
$ wget -O - https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo apt-key add -
```

Add Jellyfin repository:

```
$ sudo touch /etc/apt/sources.list.d/jellyfin.list

$ echo "deb [arch=amd64] https://repo.jellyfin.org/debian $( lsb_release -c -s ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
```

Finally, update Jellyfin repository and install Jellyfin using commands:``

```
$ sudo apt update

$ sudo apt install jellyfin
```

On **Ubuntu 18.04 LTS** :

Install HTTPS transport for APT if it is not installed already:

```
$ sudo apt install apt-transport-https
```

Import and add Jellyfin GPG signing key:``

```
$ wget -O - https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo apt-key add -
```

Add the Jellyfin repository:

```
$ sudo touch /etc/apt/sources.list.d/jellyfin.list

$ echo "deb https://repo.jellyfin.org/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
```

For Ubuntu 16.04, just replace **bionic** with **xenial** in the above URL.

Finally, update Jellyfin repository and install Jellyfin using commands:``

```
$ sudo apt update

$ sudo apt install jellyfin
```

##### Start Jellyfin service

Run the following commands to enable and start jellyfin service on every reboot:

```
$ sudo systemctl enable jellyfin

$ sudo systemctl start jellyfin
```

To check if the service has been started or not, run:

```
$ sudo systemctl status jellyfin
```

Sample output:

```
● jellyfin.service - Jellyfin Media Server
Loaded: loaded (/lib/systemd/system/jellyfin.service; enabled; vendor preset: enabled)
Drop-In: /etc/systemd/system/jellyfin.service.d
└─jellyfin.service.conf
Active: active (running) since Wed 2019-03-20 12:20:19 UTC; 1s ago
Main PID: 4556 (jellyfin)
Tasks: 11 (limit: 2320)
CGroup: /system.slice/jellyfin.service
└─4556 /usr/bin/jellyfin --datadir=/var/lib/jellyfin --configdir=/etc/jellyfin --logdir=/var/log/jellyfin --cachedir=/var/cache/jellyfin --r

Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading Emby.Photos, Version=10.2.2.0, Culture=neutral, PublicKeyToken=null
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading Emby.Server.Implementations, Version=10.2.2.0, Culture=neutral, PublicKeyToken=nu
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading MediaBrowser.MediaEncoding, Version=10.2.2.0, Culture=neutral, PublicKeyToken=nul
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading Emby.Dlna, Version=10.2.2.0, Culture=neutral, PublicKeyToken=null
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading MediaBrowser.LocalMetadata, Version=10.2.2.0, Culture=neutral, PublicKeyToken=nul
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading Emby.Notifications, Version=10.2.2.0, Culture=neutral, PublicKeyToken=null
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading MediaBrowser.XbmcMetadata, Version=10.2.2.0, Culture=neutral, PublicKeyToken=null
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Loading jellyfin, Version=10.2.2.0, Culture=neutral, PublicKeyToken=null
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Sqlite version: 3.26.0
Mar 20 12:20:21 ubuntuserver jellyfin[4556]: [12:20:21] [INF] Sqlite compiler options: COMPILER=gcc-5.4.0 20160609,DEFAULT_FOREIGN_KEYS,ENABLE_COLUMN_M
```

If you see an output something, congratulations! Jellyfin service has been started.

Next, we should do some initial configuration.

##### Configure Jellyfin

Once jellyfin is installed, open the browser and navigate to – **http:// <domain-name>:8096** or **http:// <IP-Address>:8096** URL.

You will see the following welcome screen. Select your preferred language and click Next.

![][6]

Enter your user details. You can add more users later from the Jellyfin Dashboard.

![][7]

The next step is to select media files which we want to stream. To do so, click “Add media Library” button:

![][8]

Choose the content type (i.e audio, video, movies etc.,), display name and click plus (+) sign next to the Folders icon to choose the location where you kept your media files. You can further choose other library settings such as the preferred download language, country etc. Click Ok after choosing the preferred options.

![][9]

Similarly, add all of the media files. Once you have chosen everything to stream, click Next.

![][10]

Choose the Metadata language and click Next:

![][11]

Next, you need to configure whether you want to allow remote connections to this media server. Make sure you have allowed the remote connections. Also, enable automatic port mapping and click Next:

![][12]

You’re all set! Click Finish to complete Jellyfin configuration.

![][13]

You will now be redirected to Jellyfin login page. Click on the username and enter it’s password which we setup earlier.

![][14]

This is how Jellyfin dashboard looks like.

![][15]

As you see in the screenshot, all of your media files are shown in the dashboard itself under My Media section. Just click on the any media file of your choice and start watching it!!

![][16]

You can access this Jellyfin media server from any systems on the network using URL – <http://ip-address:8096>. You need not to install any extra apps. All you need is a modern web browser.

If you want to change anything or reconfigure, click on the three horizontal bars from the Home screen. Here, you can add users, media files, change playback settings, add TV/DVR, install plugins, change default port no and a lot more settings.

![][17]

For more details, check out [**Jellyfin official documentation**][18] page.

And, that’s all for now. As you can see setting up a streaming media server on Linux is no big-deal. I tested it on my Ubuntu 18.04 LTS VM. It worked fine out of the box. I can be able to watch the movies from other systems in my LAN. If you’re looking for easy, quick and free solution for hosting a media server, Jellyfin is a good choice.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.ostechnix.com/streama-setup-your-own-streaming-media-server-in-minutes/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://repo.jellyfin.org/releases/server/centos/
[5]: https://repo.jellyfin.org/releases/server/fedora/
[6]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-1.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-2-1.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-3-1.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-4-1.png
[10]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-5-1.png
[11]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-6.png
[12]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-7.png
[13]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-8-1.png
[14]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-9.png
[15]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-10.png
[16]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-11.png
[17]: http://www.ostechnix.com/wp-content/uploads/2019/03/jellyfin-12.png
[18]: https://jellyfin.readthedocs.io/en/latest/
[19]: https://github.com/jellyfin/jellyfin
[20]: http://feedburner.google.com/fb/a/mailverify?uri=ostechnix (Subscribe to our Email newsletter)
[21]: https://www.paypal.me/ostechnix (Donate Via PayPal)
[22]: http://ostechnix.tradepub.com/category/information-technology/1207/
[23]: https://www.facebook.com/ostechnix/
[24]: https://twitter.com/ostechnix
[25]: https://plus.google.com/+SenthilkumarP/
[26]: https://www.linkedin.com/in/ostechnix
[27]: http://feeds.feedburner.com/Ostechnix
[28]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=reddit (Click to share on Reddit)
[29]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=twitter (Click to share on Twitter)
[30]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=facebook (Click to share on Facebook)
[31]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=linkedin (Click to share on LinkedIn)
[32]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=pocket (Click to share on Pocket)
[33]: https://api.whatsapp.com/send?text=How%20To%20Setup%20Linux%20Media%20Server%20Using%20Jellyfin%20https%3A%2F%2Fwww.ostechnix.com%2Fhow-to-setup-linux-media-server-using-jellyfin%2F (Click to share on WhatsApp)
[34]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=telegram (Click to share on Telegram)
[35]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/?share=email (Click to email this to a friend)
[36]: https://www.ostechnix.com/how-to-setup-linux-media-server-using-jellyfin/#print (Click to print)
