How To Get Flatpak Apps And Games Built With OpenGL To Work With Proprietary Nvidia Graphics Drivers
======
**Some applications and games built with OpenGL support and packaged as Flatpak fail to start with proprietary Nvidia drivers. This article explains how to get such Flatpak applications or games them to start, without installing the open source drivers (Nouveau).**

Here's an example. I'm using the proprietary Nvidia drivers on my Ubuntu 18.04 desktop (`nvidia-driver-390`) and when I try to launch the latest
```
$ /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=krita --file-forwarding org.kde.krita
Gtk-Message: Failed to load module "canberra-gtk-module"
Gtk-Message: Failed to load module "canberra-gtk-module"
libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
Could not initialize GLX

```

To fix Flatpak games and applications not starting when using OpenGL with proprietary Nvidia graphics drivers, you'll need to install a runtime for your currently installed proprietary Nvidia drivers. Here's how to do this.

**1\. Add the FlatHub repository if you haven't already. You can find exact instructions for your Linux distribution[here][1].**

**2. Now you'll need to figure out the exact version of the proprietary Nvidia drivers installed on your system. **

_This step is dependant of the Linux distribution you're using and I can't cover all cases. The instructions below are Ubuntu-oriented (and Ubuntu flavors) but hopefully you can figure out for yourself the Nvidia drivers version installed on your system._

To do this in Ubuntu, open `Software & Updates` , switch to the `Additional Drivers` tab and note the name of the Nvidia driver package.

As an example, this is `nvidia-driver-390` in my case, as you can see here:

![](https://1.bp.blogspot.com/-FAfjtGNeUJc/WzYXMYTFBcI/AAAAAAAAAx0/xUhIO83IAjMuK4Hn0jFUYKJhSKw8y559QCLcBGAs/s1600/additional-drivers-nvidia-ubuntu.png)

That's not all. We've only found out the Nvidia drivers major version but we'll also need to know the minor version. To get the exact Nvidia driver version, which we'll need for the next step, run this command (should work in any Debian-based Linux distribution, like Ubuntu, Linux Mint and so on):
```
apt-cache policy NVIDIA-PACKAGE-NAME

```

Where NVIDIA-PACKAGE-NAME is the Nvidia drivers package name listed in `Software & Updates` . For example, to see the exact installed version of the `nvidia-driver-390` package, run this command:
```
$ apt-cache policy nvidia-driver-390
nvidia-driver-390:
 Installed: 390.48-0ubuntu3
 Candidate: 390.48-0ubuntu3
 Version table:
 * 390.48-0ubuntu3 500
 500 http://ro.archive.ubuntu.com/ubuntu bionic/restricted amd64 Packages
 100 /var/lib/dpkg/status

```

In this command's output, look for the `Installed` section and note the version numbers (excluding `-0ubuntu3` and anything similar). Now we know the exact version of the installed Nvidia drivers (`390.48` in my example). Remember this because we'll need it for the next step.

**3\. And finally, you can install the Nvidia runtime for your installed proprietary Nvidia graphics drivers, from FlatHub**

To list all the available Nvidia runtime packages available on FlatHub, you can use this command:
```
flatpak remote-ls flathub | grep nvidia

```

Hopefully the runtime for your installed Nvidia drivers is available on FlatHub. You can now proceed to install the runtime by using this command:

  * For 64bit systems:


```
flatpak install flathub org.freedesktop.Platform.GL.nvidia-MAJORVERSION-MINORVERSION

```

Replace MAJORVERSION with the Nvidia driver major version installed on your computer (390 in my example above) and
MINORVERSION with the minor version (48 in my example from step 2).

For example, to install the runtime for Nvidia graphics driver version 390.48, you'd have to use this command:
```
flatpak install flathub org.freedesktop.Platform.GL.nvidia-390-48

```

  * For 32bit systems (or to be able to run 32bit applications or games on 64bit), install the 32bit runtime using:


```
flatpak install flathub org.freedesktop.Platform.GL32.nvidia-MAJORVERSION-MINORVERSION

```

Once again, replace MAJORVERSION with the Nvidia driver major version installed on your computer (390 in my example above) and MINORVERSION with the minor version (48 in my example from step 2).

For example, to install the 32bit runtime for Nvidia graphics driver version 390.48, you'd have to use this command:
```
flatpak install flathub org.freedesktop.Platform.GL32.nvidia-390-48

```

That is all you need to do to get applications or games packaged as Flatpak that are built with OpenGL to run.


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/06/how-to-get-flatpak-apps-and-games-built.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://flatpak.org/setup/
[2]:https://www.linuxuprising.com/2018/06/free-painting-software-krita-410.html
[3]:https://www.linuxuprising.com/2018/06/winepak-is-flatpak-repository-for.html
[4]:https://github.com/winepak/applications/issues/23
[5]:https://github.com/flatpak/flatpak/issues/138
