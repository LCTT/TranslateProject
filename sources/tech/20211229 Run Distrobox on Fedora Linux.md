[#]: subject: "Run Distrobox on Fedora Linux"
[#]: via: "https://fedoramagazine.org/run-distrobox-on-fedora-linux/"
[#]: author: "Luca Di Maio https://fedoramagazine.org/author/89luca89/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Run Distrobox on Fedora Linux
======

![][1]

Fedora Linux, openSUSE Tumbleweed, Arch Linux and Debian containers with neofetch; Fedora logo; and Distrobox logo

Distrobox is a tool that allows you to create and manage container-based development environments without root privileges.

Distrobox can use either **podman** or **docker** to create containers using the Linux distribution of your choice.

The created container will be tightly integrated with the host, allowing sharing of the HOME directory of the user, external storage, external USB devices, graphical apps (X11/Wayland), and audio.

As a project, it is inspired by Container Toolbx (all the props to them!), but it aims to have broader compatibility with hosts and containers, without having to require a dedicated image to use in Distrobox.

It is divided into 4 parts:

  * **distrobox-create** – creates the container
  * **distrobox-enter** – to enter the container
  * **distrobox-init** – it’s the entrypoint of the container (not meant to be used manually)
  * **distrobox-export** – it is meant to be used inside the container, useful to export apps and services from the container to the host



Today we will take a look on how to use it in Fedora (Workstation and Silverblue/Kinoite) to have diverse environments based on multiple Linux distributions, right in your terminal.

### Why would you want to use Distrobox

Using containers for development environments in the terminal is already greatly tackled by the Container Toolbx project, but you may sometimes have the necessity of a specific Linux distribution, or to export an application or a service from inside to the container, back to the host.

Generally speaking, it is a tool that resolves some problems like:

  * Provide a mutable environment on an immutable OS, like Endless OS, Fedora Silverblue, OpenSUSE MicroOS or SteamOS3
  * Provide a locally privileged environment for sudoless setups (eg. company-provided laptops, security reasons, etc…)
  * To mix and match a stable base system (eg. Debian Stable, Ubuntu LTS, Red Hat) with a bleeding-edge environment for development or gaming (eg. Arch or OpenSUSE Tumbleweed or Fedora with latest Mesa)
  * Leverage high abundance of curated distro images for docker/podman to manage multiple environments



#### How does it differ from Toolbx?

Distrobox aims to maintain a broad compatibility with distributions both on the host side and on the container side by using the official distribution’s OCI images for the containers. It supports all the major distributions and it maintains a curated table of supported and tested container images.

### Installation

Installing Distrobox is quite straightforward, you can simply use the following command:

```

    curl https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

```

Or if you do not want (or cannot) use sudo, you can install it without root permissions:

```

    curl https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- -p ~/.local/bin/

```

It is also available from copr:

```

    sudo dnf copr enable alciregi/distrobox
    sudo dnf install distrobox

```

Distrobox depends on either _podman_ or _docker_ to work. We will today explore the **podman** route.
On Silverblue/Kinoite you’re already good to go, on Workstation or a Spin you need to install podman, so run:

```

    sudo dnf install podman

```

###  Getting started

To start using Distrobox, you can simply type:

```

    luca-linux@x250:~$ distrobox-create

```

to create your first container. By default, it uses _fedora-toolbox 35_ image.
You can specify a custom name and image by passing the flags:

```

    luca-linux@x250:~$ distrobox-create --name ubuntu-20 --image ubuntu:20.04

```

The above command will create a distrobox based on the plain OCI image of **Ubuntu 20**.
You can use a diverse ecosystem of distributions from various registries. For example, we may want to use even more bleeding edge software from **AUR**:

```

    luca-linux@x250:~$ distrobox-create --name arch-distrobox --image archlinux:latest

```

Or we want to use an old application  that only supports Debian 8:

```

    luca-linux@x250:~$ distrobox-create --name debian8-distrobox --image debian:8

```

In case the container image is not present on the host, you’ll be prompted to download it during the distrobox creation.
After the creation is done you can simply

```

    luca-linux@x250:~$ distrobox-enter --name arch-distrobox

```

To enter the container and start playing around.

![Arch Linux distrobox][2]

### Playing around in the container

Now that we’re inside our distrobox, we can proceed to customize it as much as we want, for example we can install that nice package that’s only in AUR:

![Installing the atom package inside the Arch Linux distrobox][3]

Now we can simply launch our application to use as a normal application:

![Running Atom from the Arch Linux distrobox][4]

### Exporting from the container to the host

In case we installed something that we use a lot from inside the distrobox, we can export it back to the host to use it more easily, without having to launch them every time from the terminal.

We can use **distrobox-export** to export our app back to the host, for example:

```

    luca-linux@x250:~$ distrobox-enter --name arch-distrobox
    luca-linux@arch-distrobox:~$ distrobox-export --app atom

```

Will result in:

![][5]

Now the application behaves and appear as a normally installed graphical application, with also icons, themes and fonts integration with the host.

But we can export also simple **binaries** and **systemd services**.

Say you want to install Syncthing from Ubuntu’s repositories on your Fedora Silverblue system. Simply run:

```

    luca-linux@x250:~$ distrobox-enter --name ubuntu-21
    luca-linux@ubuntu-21:~$ sudo apt install syncthing

```

Now export syncthing’s service from the container back to the host by running:

```

    luca-linux@ubuntu-21:~$ distrobox-export --service syncthing@ --extra-flags
     Service ubuntu-21-syncthing@.service successfully exported.
     OK
     ubuntu-21-syncthing@.service will appear in your services list in a few seconds.
     To check the status, run:
             systemctl --user status ubuntu-21-syncthing@.service
     To start it, run:
             systemctl --user start ubuntu-21-syncthing@.service
     To start it at login, run:
             systemctl --user enable ubuntu-21-syncthing@.service

```

Now back on the host you can run:

```

    luca-linux@x250:~$ systemctl --user enable --now ubuntu-21-syncthing@$USER

```

And you’re good to go:

```

    luca-linux@x250:~$ systemctl --user status ubuntu-21-syncthing@luca-linux
     ● ubuntu-21-syncthing@luca-linux.service - Syncthing - Open Source Continuous File Synchronization for luca.di.maio
          Loaded: loaded (/home/luca-linux/.config/systemd/user/ubuntu-21-syncthing@.service; enabled; vendor preset: enabled)
          Active: active (running) since Wed 2021-12-22 18:10:56 CET; 1 day 2h ago
            Docs: man:syncthing(1)
        Main PID: 1210423 (distrobox-enter)
        CGroup: /user.slice/user-1000.slice/user@1000.service/ubuntu\x2d22\x2dsyncthing.slice/ubuntu-21-syncthing@luca-linux.service
                  ├─1210423 /bin/sh /home/luca-linux/.local/bin/distrobox-enter -H -n ubuntu-21 --  /usr/bin/syncthing -no-browser -no-restart -logflags=0 -allow-newer-config
                  └─1210445 podman --remote exec --user=luca-linux --workdir=/home/luca-linux [...]
     [....]

```

#### Installing an old or unavailable application

What if you need specifically an old application on your new system? You really need that good old deb from 2014 and there is no Flatpak available? You can resort to Distrobox:

```

    luca-linux@x250:~$ distrobox-create --name old-ubuntu --image ubuntu:14.
    luca-linux@x250:~$ distrobox-enter --name old-
    luca-linux@old-ubuntu:~$ sudo dpkg -i ./that-old-program.
    luca-linux@old-ubuntu:~$ distrobox-export --app that-old-program
    luca-linux@old-ubuntu:~$ distrobox-export --bin /usr/bin/that-old-program --export-path ~/.local/bin

```

Now you have your vintage environment and install that old deb package you have found online without messing around with _alien_, old _glibc_, or littering your main operating system.

This is also handy for apps that are not rpm-packaged and do not offer a Flatpak.

#### Exiting a distrobox

At any time you can exit the distrobox by simply using _exit_, or pressing Ctrl+D:

```

    luca-linux@x250:~$ hostname
     x250
    luca-linux@x250:~$ distrobox-enter
    luca-linux@fedora-toolbox-35:~$ hostname
     fedora-toolbox-35
    luca-linux@fedora-toolbox-35:~$ exit
     logout
    luca-linux@x250:~$

```

### Executing commands directly into a distrobox

You can specify custom commands to execute in the distrobox instead of the shell.
For example:

```

    luca-linux@x250:~$ distrobox-enter --name fedora-toolbox-35 -- sudo dnf update -y
     Fedora 35 - x86_64                                                                 1.4 MB/s |  79 MB     00:56
     Fedora 35 openh264 (From Cisco) - x86_64                                           2.0 kB/s | 2.5 kB     00:01
     Fedora Modular 35 - x86_                                                           1.3 MB/s | 3.3 MB     00:02
     Fedora 35 - x86_64 - Updates                                                       2.3 MB/s |  17 MB     00:07
     Fedora Modular 35 - x86_64 - Updates                                               1.2 MB/s | 2.8 MB     00:02
     Dependencies resolved.
    [...]

```

This could be useful in scripts, and it’s used by the **distrobox-export** utility to integrate the container exports with the host.

### Tips and Tricks

As you may have noticed reading this article, different Linux distributions are supported by distrobox for its containers.
 You can find a complete list here in the project’s page: <https://github.com/89luca89/distrobox#containers-distros.>

 It supports all the major distributions from old to super-new versions like

  * Debian – from 8 to current unstable (and all the derivates)
  * Ubuntu – from 14.04 to 22.04
  * Centos/Red Hat/Alma Linux/Rocky Linux/Amazon Linux – from 7 to 8 and stream 8 and 9
  * Fedora (tested 30 to 35)
  * Archlinux
  * Alpine Linux
  * Slackware
  * Void
  * Kali Linux (if you want your pentesting stuff on Silverblue)



This gives you the flexibility to use any type of software inside any distribution of your choice.

##### Duplicating an existing distrobox

It comes handy to also have the ability to duplicate your existing distrobox. This is useful during for example distrobox updates, or to rename a distrobox, or simply snapshot it and save the image.

```

    luca-linux@x250:~$ distrobox-create --name cloned-arch --clone arch-distrobox
    luca-linux@x250:~$ distrobox-enter --name cloned-arch
    luca-linux@cloned-arch:~$

```

##### Backup and restore a distrobox

To save, export and reuse an already configured container, you can leverage _podman save_ together with _podman import_ to create snapshots of your environment.

To save a container to an image with podman:

```

    podman container commit -p distrobox_name image_name_you_choose
    podman save image_name_you_choose:latest | gzip >image_name_you_choose.tar.gz

```

This will create a tar.gz of the container of your choice at that exact moment.
Now you can backup that archive or transfer it to another host, and to restore it just run

```

    podman import image_name_you_choose.tar.gz

```

And create a new container based on that image:

```

    distrobox-create --image image_name_you_choose:latest --name distrobox_name
    distrobox-enter --name distrobox_name

```

And you’re good to go, now you can reproduce your personal environment everywhere in simple (and scriptable) steps.

##### Managing your distroboxes

To manage your running containers, you can simply use your container manager of choice:

```

    luca-linux@x250:~$ podman ps -a
     CONTAINER ID  IMAGE              COMMAND               CREATED      STATUS          PORTS       NAMES
     3bd26417ec22  /ubuntu:21.10      /usr/bin/entrypoi...  2 days ago   Up 2 days ago               ubuntu-21
     36101d9e2d17  archlinux:latest   /usr/bin/entrypoi...  3 hours ago  Up 3 hours ago              arch-distrobox

```

 You can delete an existing distrobox using

```

    podman stop your_distrobox_name
    podman rm your_distrobox_name

```

You can read more about Podman [in this Magazine Article][6].

### Conclusion

In conclusion, distrobox can be a handy tool both on Fedora Workstation and on Silverblue/Kinoite, allowing both backward and forward compatibility with software and freedom to use whatever distribution you’re more comfortable with.

The project is still in active development, so any type of contribution and [reporting bugs][7] is welcome.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/run-distrobox-on-fedora-linux/

作者：[Luca Di Maio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/89luca89/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/12/Run-Distrobox-on-Fedora-Linux-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2021/12/image-3.png
[3]: https://fedoramagazine.org/wp-content/uploads/2021/12/image-2.png
[4]: https://fedoramagazine.org/wp-content/uploads/2021/12/image-5.png
[5]: https://fedoramagazine.org/wp-content/uploads/2021/12/image-6.png
[6]: https://fedoramagazine.org/running-containers-with-podman/
[7]: https://github.com/89luca89/distrobox/issues
