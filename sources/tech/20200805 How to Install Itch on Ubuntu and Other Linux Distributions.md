[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Itch on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/install-itch-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Itch on Ubuntu and Other Linux Distributions
======

[Itch][1] is a platform for independent digital creators with main focus on indie games. It was actually started as website to host, sell and download indie video games but these days, Itch also provides books, comics, tools, board games, soundtracks and more digital content from indie creators.

As a user, you can download these digital content either for free or for a price set by the creator. All your downloads and purchases are synced to your account so that you can download them whenever you want.

Consider it like Steam but more focused on indie developers and creators.

You can browse Itch from its website but Itch also provides and [open source desktop client][2] that gives you some additional advantages. With the desktop client:

  * You can browse games and other content and download them on your system.
  * The desktop client is automatically updated with all the new features.
  * Your downloaded games are also automatically updated.
  * If you play browser-based game on Itch, you can play it offline using the Itch desktop client.



In this tutorial, I’ll show you the steps to install Itch on Ubuntu or any other Linux distribution.

### Installing Itch on Linux desktop

Itch provides an installer file named itch-setup. You can download this file from its download page.

[Download Itch for Linux][3]

This itch-setup file should work on any Linux distribution as long as it has GTK 3 (libgtk-3-0) installed. Most recent Linux distributions should have it.

Once you download the setup file, right click on it and give it execute permission.

![Right click and give the file execute permission][4]

Now run this setup file by double-clicking on it. It will start downloading the latest version of Itch.

![][5]

It will take some time depending upon your internet speed. In a few minutes, you should see the this screen asking you to log in to your Itch account.

![][6]

Once you are logged in, you can browse games and other contents and download/purchase them.

![][7]

The entire installation process is similar to [Steam installation on Ubuntu][8].

You can find the Itch files in ~/.itch folder. The content you download from Itch usually resides in ~/.config/itch. If you didn’t know, ~ means your home directory.

### Remove Itch desktop application from your system

For some reasons, if you do not want to use Itch anymore, you can remove it from your system. For that, unfortunately, you’ll have to use the terminal.

Open a terminal and use the following command:

```
~/.itch/itch-setup --uninstall
```

It won’t remove your content library. If you want to remove the downloaded games and stuff, you can delete the ~/.config/itch folder manually.

```
rm -r ~/.config/itch
```

**Do you use Itch?**

Itch is an ethical platform for indie creators and supporters of such models. Itch uses “pay what you want to pay” where the buyer can pay any amount equal or greater than the price set by the content creator.

Itch also has open revenue sharing model. The creators can share some or no part of their generated revenue with Itch.

Personally, I prefer such ethical businesses like Itch and Humble Bundle. Like Humble Bundle, Itch also runs sales and bundles from time to time. This helps you save money and support indie developers and creators.

Do you use Itch or Humble Bundle? Which other similar platform do you use?

_It’s FOSS is an affiliate partner with Itch. Please read our [affiliate policy][9] for more information._

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-itch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itch.io/?ac=ywUpyBMGXvG
[2]: https://github.com/itchio/itch
[3]: https://itch.io/app
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-installer-linux.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/installing-itch-linux.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-running-linux.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-game-page.png?resize=800%2C441&ssl=1
[8]: https://itsfoss.com/install-steam-ubuntu-linux/
[9]: https://itsfoss.com/affiliate-policy/
