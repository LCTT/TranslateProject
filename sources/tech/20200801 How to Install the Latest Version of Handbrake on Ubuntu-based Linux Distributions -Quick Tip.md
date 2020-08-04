[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install the Latest Version of Handbrake on Ubuntu-based Linux Distributions [Quick Tip])
[#]: via: (https://itsfoss.com/install-handbrake-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install the Latest Version of Handbrake on Ubuntu-based Linux Distributions [Quick Tip]
======

_**This quick tutorial shows how to install the latest version of HandBrake on Ubuntu-based distributions using its official PPA.**_

[HandBrake][1] is one of the most popular open source video converter for Linux, Windows and macOS.

This GUI application enables you to convert videos from one format to another in just a few clicks. You can also customize the output video as per your requirement.

[HandBrake][2] is available in the [universe repository of Ubuntu][3] but it might not always provide the latest version. Let me show you how you can get the latest HandBrake on Ubuntu and other Ubuntu-based distributions like Linux Mint, Linux Lite, elementray OS etc.

### Installing the latest HandBrake on Ubuntu based Linux distributions

The developers of HandBrake maintain an [official PPA][4]. [Using this PPA][5], you can easily install the latest version of HandBrake on your Ubuntu based distribution.

Open a terminal and use the following command to add the PPA repository. Press enter when asked for it:

```
sudo add-apt-repository ppa:stebbins/handbrake-releases
```

You may have to update the local package cache (not required in Ubuntu 18.04 and higher version):

```
sudo apt update
```

Now install the latest version of the HandBrake using this command:

```
sudo apt-get install handbrake-gtk
```

The best thing is that this method removes the older handbrake package on your system and thus avoiding installing two different instances of handbrake.

![][6]

Enjoy the latest and greatest HandBrake and convert videos on your Linux system.

### Uninstall HandBrake from your system

For some reasons, if you don’t like HandBrake and want to remove it, here’s what you need to do.

Open a terminal and use the following command to uninstall HandBrake:

```
sudo apt remove handbrake-gtk
```

Now that you have removed the application, it will be a good idea to [remove the PPA][7] that you added as you don’t need it anymore.

```
sudo add-apt-repository -r ppa:stebbins/handbrake-releases
```

Confirm when asked for it.

In this quick Ubuntu tutorial, you learned the steps for installing the latest HandBrake using PPA. You also learned the steps for removing it properly.

I hope you find this quick tip useful. If you have questions or suggestions, please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-handbrake-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://handbrake.fr/
[2]: https://itsfoss.com/handbrake/
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
[5]: https://itsfoss.com/ppa-guide/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/install-handbrake-ubuntu.png?resize=800%2C498&ssl=1
[7]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
