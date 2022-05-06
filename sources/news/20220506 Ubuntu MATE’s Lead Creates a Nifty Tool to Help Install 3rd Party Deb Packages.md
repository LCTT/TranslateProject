[#]: subject: "Ubuntu MATE’s Lead Creates a Nifty Tool to Help Install 3rd Party Deb Packages"
[#]: via: "https://news.itsfoss.com/deb-get-ubuntu/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu MATE’s Lead Creates a Nifty Tool to Help Install 3rd Party Deb Packages
======
An interesting tool to replace apt-get for 3rd party .deb packages on Ubuntu. It should help you save time!

![deb get][1]

Ubuntu MATE’s lead,**Martin Wimpress,** has another fun project for Linux users.

In case you did not know, Martin regularly develops something interesting. Last year, we covered [Quickemu][2], which helps create virtual machines in Linux through a QEMU-based GUI tool making the process easy.

Now, he is back with an interesting “**deb-get**” tool that aims to imitate the functionality of “**apt-get**” for 3rd party .deb packages.

Let us take a closer look at it.

### Deb Get: Seamlessly Install 3rd Party Deb Packages Using the CLI

When it comes to software packages that aren’t available in the official repositories (like Google Chrome, Vivaldi), you will have to [add a PPA (unofficial/official)][3] or download the .deb file and [get it installed][4] manually.

What if you can simply install it using the terminal as if it is available in the official repositories?

That’s where the deb-get tool comes in.

Usually, when installing a package through the terminal, you utilize either of the following commands:

```
sudo apt install packagename
```

or

```
sudo apt-get install packagename
```

You get to keep the same format and simply replace apt-get with this tool, which should look like this:

```
sudo deb-get install packagename
```

As an example, usually, we needed to add the PPA or download the deb file when [installing Vivaldi on Linux][5].

Now, if you set up the deb-get tool on your system**(setup instructions at the end of this article**), you can easily install Vivaldi using the following command:

```
sudo deb-get install vivaldi-stable
```

![][6]

And, just like the apt-get upgrade process, you can upgrade packages using the following command:

```
sudo deb-get upgrade
```

**Note:** While it makes it easy to install third-party .deb packages, you will be limited to a verified list supported by the tool. You can expect the list of supported packages to expand soon, but it already supports many [essential applications.][7]

You can also check the list of available packages that you can install with deb-get using the following command:

```
sudo deb-get list
```

![deb-get][8]

### Setting Up Deb-Get on Ubuntu-based Distributions

The deb-get tool works with Ubuntu 22.04 LTS (I tested it) and should work with other Ubuntu-based distributions.

You can install it on your system using the command below:

```
sudo apt install curl && curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
```

Or, you can download the deb package for it manually from its [GitHub releases section][9].

To explore more about it, and the available commands/functionalities, you can head to its [GitHub page][10].

*What do you think of deb-get attempting to mimic apt-get functionality for third-party packages? Do you think it is useful? Let me know your thoughts in the comments.*

**Via: OMG!Ubuntu!**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/deb-get-ubuntu/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get.jpg
[2]: https://itsfoss.com/quickgui/
[3]: https://itsfoss.com/ppa-guide/
[4]: https://itsfoss.com/install-deb-files-ubuntu/
[5]: https://itsfoss.com/install-vivaldi-ubuntu-linux/
[6]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get-vivaldi.jpg
[7]: https://itsfoss.com/essential-linux-applications/
[8]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get-list.jpg
[9]: https://github.com/wimpysworld/deb-get/releases
[10]: https://github.com/wimpysworld/deb-get
