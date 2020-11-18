[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Fedora 33 with Microsoft’s WSL2)
[#]: via: (https://fedoramagazine.org/wsl-fedora-33/)
[#]: author: (Jim Perrin https://fedoramagazine.org/author/jperrin/)

Using Fedora 33 with Microsoft’s WSL2
======

![][1]

Photo by [Matthias Heil][2] on [Unsplash][3]

If you’re like me, you may find yourself running Windows for a variety of reasons from work to gaming. Sure you could run Fedora in a virtual machine or as a container, but those don’t blend into a common windows experience as easily as the Windows Subsystem for Linux (WSL). Using Fedora via WSL will let you blend the two environments together for a fantastic development environment.

### Prerequisites

There are a few basics you’ll need in order to make this all work. You should be running Windows 10, and have WSL2 installed already. If not, check out the [Microsoft documentation for instructions][4], and come back here when you’re finished. Microsoft recommends setting wsl2 as the distro default for simplicity. This guide assumes you’ve done that.

Next, you’re going to need some means of unpacking xz compressed files. You can do this with another WSL-based distribution, or use [7zip][5].

### Download a Fedora 33 rootfs

Since Fedora doesn’t ship an actual rootfs archive, we’re going to abuse the one used to generate the container image for dockerhub. You will want to download the [tar.xz file][6] from the fedora-cloud GitHub repository. Once you have the tar.xz, uncompress it, but don’t unpack it. You want to end up with something like fedora-33-_datestamp_.tar. Once you have that, you’re ready to build the image.

### Composing the WSL Fedora build

I prefer to use _c:\distros_, but you can choose nearly whatever location you want. Whatever you choose, make sure the top level path exists before you import the build. Now open a cmd or powershell prompt, because it’s time to import:
```

```

wsl.exe --import Fedora-33 c:\distros\Fedora-33 $HOME\Downloads\fedora-33.tar
```

```

You will see Fedora-33 show up in wsl’s list
```

```

PS C:\Users\jperrin&gt; wsl.exe -l -v
  NAME                   STATE           VERSION
  Fedora-33                 Stopped         2
```

```

From here, you can start to play around with Fedora in wsl, but we have a few things we need to do to make it actually _useful_ as a wsl distro.
```

```

wsl -d Fedora-33
```

```

This will launch Fedora’s wsl instance as the root user. From here, you’re going to install a few core packages and set a new default user. You’re also going to need to configure sudo, otherwise you won’t be able to easily elevate privileges if you need to install something else later.
```

```

dnf update
dnf install wget curl sudo ncurses dnf-plugins-core dnf-utils passwd findutils
```

```

_wslutilites_ uses _curl_ and _wget_ for things like VS Code integration, so they’re useful to have around. Since you need to use a Copr repo for this, you want the added dnf functionality.

### Add your user

Now it’s time to add your user, and set it as the default.
```

```

useradd -G wheel yourusername
passwd yourusername
```

```

Now that you’ve created your username and added a password, make sure they work. Exit the wsl instance, and launch it again, this time specifying the username. You’re also going to test sudo, and check your uid.
```

```

wsl -d Fedora-33 -u yourusername
$id -u
1000
$ sudo cat /etc/shadow
```

```

Assuming everything worked fine, you’re now ready to set the default user for your Fedora setup in Windows. To do this, exit the wsl instance and get back into Powershell. This Powershell one-liner configures your user properly:
```

```

Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\\*\ DistributionName | Where-Object -Property DistributionName -eq Fedora-33  | Set-ItemProperty -Name DefaultUid -Value 1000
```

```

Now you should be able to launch WSL again without specifying a user, and be yourself instead of root.

### Customize!

From here, you’re done getting the basic Fedora 33 setup running in wsl, but it doesn’t have the Windows integration piece yet. If this is something you want, there’s a Copr repo to enable. If you choose to add this piece, you’ll be able to run Windows apps directly from inside your shell, as well as integrate your Linux environment easily with VS Code. Note that Copr is not officially supported by Fedora infrastructure. Use packages at your own risk
```

```

dnf copr enable trustywolf/wslu
```

```

Now you can go configure your terminal, setup a Python development environment, or however else you want to use Fedora 33. Enjoy!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/wsl-fedora-33/

作者：[Jim Perrin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jperrin/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/wsl-fedora33-816x345.jpg
[2]: https://unsplash.com/@matthias_heil?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/windows?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[5]: https://www.7-zip.org/download.html
[6]: https://github.com/fedora-cloud/docker-brew-fedora/tree/33/x86_64
