[#]: subject: "Systemd is Now Available in WSL"
[#]: via: "https://news.itsfoss.com/systemd-wsl/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Systemd is Now Available in WSL
======
Microsoft's WSL now supports systemd making the experience better for users.
Learn more about it here.

![Systemd is Now Available in WSL][1]

WSL (Windows Subsystem for Linux) has finally received support for Systemd, this comes in a few months after its creator joined Microsoft.

[More Linux Developers Joining Microsoft, Systemd Creator Adds to the List][2]

And this has been made possible with a partnership between Microsoft and Canonical.

**In case you're curious**:

It acts as an init system that starts up and keeps user space services in running order.

Let's see how it has been introduced to WSL.

### Systemd Enhancing the WSL Experience

![WSL: Partnering with Canonical to support systemd][4]

The main focus of introducing systemd to WSL is to improve the Linux workflow on Windows machines.

The likes of Debian, Ubuntu, Fedora, and more run systemd by default. So, this integration will now make it even more straightforward for users of those distros to conveniently do more with WSL.

Even though we have systemd-free distros available, it is not meant for everyone. So, the support for systemd on WSL makes sense.

A lot of critical Linux applications also rely on systemd to be functional. For instance, '**snap**', '**microk8s**' and '**LXD**' are dependent on it.

The presence of systemd also makes it possible to use more tools to test and run from within Windows, resulting in a better WSL experience.

#### Suggested Read 📖

[14 Best Systemd-Free Linux Distributions][5]

### Here's How It Was Made Possible

The team behind WSL had to make changes to the architecture, they made the WSL init process start within the Linux distro as a child process under systemd.

Doing so enabled the WSL init process to provide the necessary foundation for communication between the Windows and Linux sub-systems, as explained in their [official announcement][7].

They also did additional modifications to ensure a clean system shutdown by preventing systemd from keeping the WSL instance active.

You can also visit their official [documentation][8] website for more information.

### Get Started With Systemd on WSL

> Existing WSL users will have to opt in to enable systemd on their systems, this step was taken to avoid any booting issues that might occur due to the introduction of systemd.

First and foremost, you have to ensure that your system is running WSL: **Version 0.67.6** or above.

You can check your WSL version by running the following command

```
wsl --version
```

If you are running the older version, you can update it via the **Microsoft Store** or by running this command.

```
wsl --update
```

Furthermore, if you are not a part of Windows Insiders, you can go to the [WSL release page][9] and download it to test it out.

For systemd to work on your system, you will have to edit the '[wsl.conf][10]' file to ensure that systemd starts up on boot.

Add the following lines to make WSL run systemd on boot.

```
[boot]
systemd=true
```

Finally, restart your WSL instance to see the changes.

Microsoft has taken a big step forward in the development of WSL with the implementation of systemd, this should result in more users being attracted to WSL.

*💬 Excited to run WSL with systemd? Or do you prefer systemd-free distros?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/systemd-wsl/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/systemd-now-available-on-wsl.png
[2]: https://news.itsfoss.com/systemd-creator-microsoft/
[3]: https://news.itsfoss.com/systemd-creator-microsoft/
[4]: https://youtu.be/Ja3qikzd-as
[5]: https://itsfoss.com/systemd-free-distros/
[6]: https://itsfoss.com/systemd-free-distros/
[7]: https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
[8]: https://learn.microsoft.com/en-in/windows/wsl/
[9]: https://github.com/microsoft/WSL/releases
[10]: https://learn.microsoft.com/en-in/windows/wsl/wsl-config#wslconf
