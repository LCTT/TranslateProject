How To Check Ubuntu Version and Other System Information Easily
======
**Brief: Wondering which Ubuntu version are you using? Here’s how to check Ubuntu version, desktop environment and other relevant system information.**

You can easily find the Ubuntu version you are using in the command line or via the graphical interface. Knowing the exact Ubuntu version, desktop environment and other system information helps a lot when you are trying to follow a tutorial from the web or seeking help in various forums.

In this quick tip, I’ll show you various ways to check [Ubuntu][1] version and other common system information.

### How to check Ubuntu version in terminal

This is the best way to find Ubuntu version. I could have mentioned the graphical way first but then I chose this method because this one doesn’t depend on the [desktop environment][2] you are using. You can use it on any Ubuntu variant.

Open a terminal (Ctrl+Alt+T) and type the following command:
```
lsb_release -a

```

The output of the above command should be like this:
```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.4 LTS
Release:    16.04
Codename:   xenial

```

![How to check Ubuntu version in command line][3]

As you can see, the current Ubuntu installed in my system is Ubuntu 16.04 and its code name is Xenial.

Wait! Why does it say Ubuntu 16.04.4 in Description and 16.04 in the Release? Which one is it, 16.04 or 16.04.4? What’s the difference between the two?

The short answer is that you are using Ubuntu 16.04. That’s the base image. 16.04.4 signifies the fourth point release of 16.04. A point release can be thought of as a service pack in Windows era. Both 16.04 and 16.04.4 will be the correct answer here.

What’s Xenial in the output? That’s the codename of the Ubuntu 16.04 release. You can read this [article to know about Ubuntu naming convention][4].

#### Some alternate ways to find Ubuntu version

Alternatively, you can use either of the following commands to find Ubuntu version:
```
cat /etc/lsb-release

```

The output of the above command would look like this:
```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.4 LTS"

```

![How to check Ubuntu version in command line][5]

You can also use this command to know Ubuntu version
```
cat /etc/issue

```

The output of this command will be like this:
```
Ubuntu 16.04.4 LTS \n \l

```

Forget the \n \l. The Ubuntu version is 16.04.4 in this case or simply Ubuntu 16.04.

### How to check Ubuntu version graphically

Checking Ubuntu version graphically is no big deal either. I am going to use screenshots from Ubuntu 18.04 GNOME here. Things may look different if you are using Unity or some other desktop environment. This is why I recommend the command line version discussed in the previous sections because that doesn’t depend on the desktop environment.

I’ll show you how to find the desktop environment in the next section.

For now, go to System Settings and look under the Details segment.

![Finding Ubuntu version graphically][6]

You should see the Ubuntu version here along with the information about the desktop environment you are using, [GNOME][7] being the case here.

![Finding Ubuntu version graphically][8]

### How to know the desktop environment and other system information in Ubuntu

So you just learned how to find Ubuntu version. What about the desktop environment in use? Which Linux kernel version is being used?

Of course, there are various commands you can use to get all those information but I’ll recommend a command line utility called [Neofetch][9]. This will show you essential system information in the terminal beautifully with the logo of Ubuntu or any other Linux distribution you are using.

Install Neofetch using the command below:
```
sudo apt install neofetch

```

Once installed, simply run the command `neofetch` in the terminal and see a beautiful display of system information.

![System information in Linux terminal][10]

As you can see, Neofetch shows you the Linux kernel version, Ubuntu version, desktop environment in use along with its version, themes and icons in use etc.

I hope it helps you to find Ubuntu version and other system information. If you have suggestions to improve this article, feel free to drop it in the comment section. Ciao :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/how-to-know-ubuntu-unity-version/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://www.ubuntu.com/
[2]:https://en.wikipedia.org/wiki/Desktop_environment
[3]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/check-ubuntu-version-command-line-1-800x216.jpeg
[4]:https://itsfoss.com/linux-code-names/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/check-ubuntu-version-command-line-2-800x185.jpeg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/ubuntu-version-system-settings.jpeg
[7]:https://www.gnome.org/
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/checking-ubuntu-version-gui.jpeg
[9]:https://itsfoss.com/display-linux-logo-in-ascii/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/ubuntu-system-information-terminal-800x400.jpeg
