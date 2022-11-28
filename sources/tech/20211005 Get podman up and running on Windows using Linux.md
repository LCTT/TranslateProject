[#]: subject: "Get podman up and running on Windows using Linux"
[#]: via: "https://opensource.com/article/21/10/podman-windows-wsl"
[#]: author: "Stephen Cuppett https://opensource.com/users/cuppett"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get podman up and running on Windows using Linux
======
Enable WSL 2 guests to run the podman, skopeo, or buildah commands from
within Windows using the Linux distribution of your choice.
![Penguin driving a car with a yellow background][1]

WSL 2, the second iteration of the Windows Subsystem for Linux, allows you to run a Linux environment natively on Windows, without the overhead of a virtual machine (VM). It integrates nicely with Windows, too, and provides you access to most of the command-line tools, utilities, and applications you're used to on Linux.

This guide shows you how to enable WSL 2 guests to run the `podman`, `skopeo`, or `buildah` commands from within Windows using the Linux distribution of your choice (available from the Microsoft store). Coming from a Fedora Linux host OS starting point, I was curious how to enable and use tools I'm most familiar with from within Windows.

### Prerequisite: WSL 2

To install WSL 2, go to the [WSL installation][2] page.

Use Powershell to ensure that WSL 2 is enabled by default:

`PS> wsl –set-default-version 2`

For information on key differences between WSL 1 and WSL 2, see the [WSL documentation][3].

The Windows Subsystem for Linux has come a long way. Microsoft has worked hard to make the separation between the host Windows OS and the guest Linux operating system virtually invisible. Special drivers in the kernels of each system make it easy to run commands between various shells and command windows and enable mutual filesystem access.

You can confirm you are correctly using the WSL 2 kernel with the following command and output in any of the guests:


```
$ uname -a
Linux BLD 5.10.16.3-microsoft.standard-WSL2 #1 SMP Fri Apr 2 22:23:49
UTC 2021 x86_64 x86_64 GNU/Linux
```

WSL 1 guests report a kernel version as 4.14 or similar.

Small touches in your guests can make the integration even more seamless, including symlinking of various home directory files (.aws, .sh, .config, and so on). There is a hint of how this can be achieved right from the $HOME directory:

![$HOME directory][4]

(Stephen Cuppett, [CC BY-SA 4.0][5])

### Install a Linux distribution

To install a Linux distribution, find your favorite in the Microsoft Store.

![screenshot of Fedora Remix purchase in the Microsoft store][6]

(Stephen Cuppett, [CC BY-SA 4.0][5])

For this article, I'm using Fedora, but other distributions are available to try. Podman works well across distributions, so you can use whatever distribution you're most familiar with. There may be some minor configuration adjustments required, but those are generally documented by the distribution and podman documentation. I chose Fedora because it was the distribution that required no extra setup to get the latest podman working.

On the first launch, the VM and related technologies are installed. You'll be prompted to select a password for the first user (which gets sudo access).

### Install podman

Once your Linux distribution has been installed and configured with a user, you can install podman as usual:

`$ sudo dnf install podman`

After a few moments, podman is installed and ready to go. You can check that everything is working as expected:


```
$ podman info
host:
  arch: amd64
  buildahVersion: 1.22.3
  cgroupControllers: []
  cgroupManager: cgroupfs
  cgroupVersion: v1
[...]
version:
  APIVersion: 3.3.1
  OsArch: linux/amd64
  Version: 3.3.1
```

From there, you can build images and use podman as you usually would.

Thanks to WSL integration, podman is even accessible and usable from PowerShell or the command prompt:

![screenshot example of Windows PowerShell][7]

(Stephen Cuppett, [CC BY-SA 4.0][5])

Installing and using the `buildah` and `skopeo` commands is exactly the same process.

### Busybox test

As a simple test to see `podman` at work, you can pull and run a Busybox container. [BusyBox][8] is an open source (GPL) project providing simple implementations of nearly 400 common commands, including `ls, mv, ln, mkdir, more, ps, gzip, bzip2, tar`, and `grep`, which makes it a fittingly minimal environment for containers and for simple tests like this one.

First, search the default image repository for a Busybox container. You can do this in either your Linux terminal or in Powershell.


```
$ podman search busybox
INDEX       NAME                             DESCRIPTION                    
docker.io   docker.io/library/busybox        Busybox base image                  
docker.io   docker.io/radial/busyboxplus     Full-chain...
docker.io   docker.io/yauritux/busybox-curl  Busybox with CURL
```

Run the one you want to try:


```
$ podman run -it docker.io/library/busybox
/ #
```

You can use the container, run a few commands to verify that everything works as expected, then leave it with the exit command.

### Get started

I'll admit I was surprised how readily the current Linux distributions out there, podman, and the Windows subsystem worked together here. It's obvious a lot of great work has gone into Windows' container tooling and integration with Linux. I'm hopeful this guide helps others get to this same launching point easily and start being productive.

There are many good candidates for deep follow-up, including working with volumes, exposing networked services between the guest and the host, and exposing Linux capabilities in those containers. With so many tools available, I have great confidence that the community will make short work of digging through them!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/podman-windows-wsl

作者：[Stephen Cuppett][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cuppett
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://docs.microsoft.com/en-us/windows/wsl/install
[3]: https://docs.microsoft.com/en-us/windows/wsl/about
[4]: https://opensource.com/sites/default/files/uploads/home_directory_0.png (directory)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/fedora_remix_0.png (Fedora Remix)
[7]: https://opensource.com/sites/default/files/uploads/power_shell.png (Windows PowerShell)
[8]: https://opensource.com/article/21/8/what-busybox
