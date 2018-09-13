How To Configure Mouse Support For Linux Virtual Consoles
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/GPM-1-720x340.png)

I use Oracle VirtualBox to test various Unix-like operating systems. Most of my VMs are headless servers that does not have graphical desktop environment. For a long time, I have been wondering how can we use the mouse in the text-based terminals in headless Linux servers. Thanks to **GPM** , today I learned that we can use Mouse in virtual consoles for copy and paste operations. **GPM** , acronym for **G** eneral **P** urpose **M** ouse, is a daemon that helps you to configure mouse support for Linux virtual consoles. Please do not confuse GPM with **GDM** (GNOME Display manager). Both serves entirely different purpose.

GPM is especially useful in the following scenarios:

  * New Linux server installations or for systems that cannot or do not use an X windows system by default, like Arch Linux and Gentoo.
  * Use copy/paste operations around in the virtual terminals/consoles.
  * Use copy/paste in text-based editors and browsers (Eg. emacs, lynx).
  * Use copy/paste in text file managers (Eg. Ranger, Midnight commander).



In this brief tutorial, we are going to see how to use Mouse in Text-based terminals in Unix-like operating systems.

### Installing GPM

To enable mouse support in Text-only Linux systems, install GPM package. It is available in the default repositories of most Linux distributions.

On Arch Linux and its variants like Antergos, Manjaro Linux, run the following command to install GPM:

```
$ sudo pacman -S gpm
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt install gpm
```

On Fedora:

```
$ sudo dnf install gpm
```

On openSUSE:

```
$ sudo zypper install gpm
```

Once installed, enable and start GPM service using the following commands:

```
$ sudo systemctl enable gpm
$ sudo systemctl start gpm
```

In Debian-based systems, gpm service will be automatically started after you installed it, so you need not to manually start the service as shown above.

### Configure Mouse Support For Linux Virtual Consoles

There is no special configuration required. GPM will start working as soon as you installed it and started gpm service.

Have a look at the following screenshot of my Ubuntu 18.04 LTS server before installing GPM:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Ubuntu-18.04-CLI.png)

As you see in the above screenshot, there is no visible Mouse pointer in my Ubuntu 18.04 LTS headless server. Only a blinking cursor and it won’t let me to select a text, copy/paste text using mouse. In CLI-only Linux servers, the mouse is literally not useful at all.

Now check the following screenshot of Ubuntu 18.04 LTS server after installing GPM:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/GPM.png)

See? I can now be able to select the text.

To select, copy and paste text, do the following:

  * To select text, press the left mouse button and drag the mouse.
  * Once you selected the text, release the left mouse button and paste text in the same or another console by pressing the middle mouse button.
  * The right button is used to extend the selection, like in `xterm’.
  * If you’re using two-button mouse, use the right button to paste text.



It’s that simple!

Like I already said, GPM works just fine and there is no extra configuration needed. Here is the sample contents of GPM configuration file **/etc/gpm.conf** (or `/etc/conf.d/gpm` in some distributions):

```
# protected from evaluation (i.e. by quoting them).
#
# This file is used by /etc/init.d/gpm and can be modified by
# "dpkg-reconfigure gpm" or by hand at your option.
#
device=/dev/input/mice
responsiveness=
repeat_type=none
type=exps2
append=''
sample_rate=
```

In my example, I use USB mouse. If you’re using different mouse, you might have to change the values of **device=/dev/input/mice** and **type=exps2** parameters.

For more details, refer man pages.

```
$ man gpm
```

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-configure-mouse-support-for-linux-virtual-consoles/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
