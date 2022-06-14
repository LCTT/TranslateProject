[#]: subject: "Distrobox: Try Multiple Linux Distributions via the Terminal"
[#]: via: "https://itsfoss.com/distrobox/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Distrobox: Try Multiple Linux Distributions via the Terminal
======
Distrobox is a software tool that allows you to run any Linux distribution inside the terminal.

It aims to let you run a variety of software on top of host distribution without any hassle.

For instance, — is there anything that is available only in the AUR and you want to access it from your Ubuntu system? Distrobox can give you that comfort.

### So, what exactly is Distrobox?

![distrobox][1]

Distrobox is a wrapper for `podman` or `docker` (whatever you prefer). The reason Distrobox exists is to integrate the containers within your system, as if it were native software.

A few things that it integrates into are removable devices (USB storage devices), D-Bus, user’s $HOME directory, Wayland and X11 sockets, and much more!

**Long story short**:

Distrobox is a way to make containerized software integrate like native apps, even if that containerized software belongs to a different distribution altogether.

The best thing about it, you get to build a development environment without requiring root privileges.

You do not have to change your host distribution just because of software compatibility issues. You can keep using what you’re comfortable with and use Distrobox to fill the gap for backward/forward software compatibility using any other Linux distribution.

### Features of Distrobox

![distrobox 1][2]

Now that you have an idea about Distrobox, what does it let you do overall? Are the functionalities useful to your use-case?

Let me mention the key highlights for Distrobox:

* Ability to make a test environment for making changes without affecting your host distribution.
* A development environment that does not need sudo privileges can be flexible for your work. For instance, if you have a work laptop, a sudoless setup can help you.
* Easy way to manage multiple environments.
* Supports a variety of distributions.

### How to install Distrobox?

There is a prerequisite for installing Distrobox. That is, you must have either `podman` or `docker` installed. If you have a relatively modern Linux distribution, I recommend installing `podman` from your software repositories. Otherwise, install `docker` and follow the steps mentioned below.

At the time of writing this article, Distrobox is available in the following repositories:

* Arch Linux (AUR)
* EPEL 8 and later
* Fedora 34 and later
* Ubuntu 22.10 and later

As you might have noticed, the latest version of Ubuntu available to the wider public is Ubuntu 22.04. Not many distributions have Distrobox packaged yet…

If you do not find it in the repositories, you can run the following command to install Distrobox:

```
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
```

The above command will download a shell script and run it with superuser privileges. In case you cannot verify the source yourself, below is the command you can use without feeling anxious about granting superuser privilege to an unknown script.

```
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
```

Now that you have Distrobox installed, let us proceed to a few examples of using it.

### Getting started with Distrobox

Having a screwdriver in your toolbox but never using is not going to improve your craftsmanship. So let’s go over a few basic commands to use [Distrobox][3], what they do and more.

Moreover, if you are curious, you can take a look at this video from a fellow YouTuber who tried Distrobox on Fedora Silverblue:

![A Video from YouTube][4]

#### 1. Create a new container

A ‘container’ in this context refers not to a containerized software like nextcloud, syncthing, etc but rather an operating system itself.

The syntax to create a new container is as follows:

```
distrobox-create --name CONTAINER-NAME --image OS-NAME:VERSION
```

In here, you can specify what name you wish to address your container by (CONTAINER-NAME), the name of OS you want to use (OS-NAME) and it’s version (VERSION).

Let us take a look at how to create a new container for Fedora 36 with the name ‘**fedoraonfoss**‘. I will do so with the following command:

```
distrobox-create --name fedoraonfoss --image fedora:36
```

You may also substitute ’36’ with ‘latest’ in case you want the latest version of any operating system.

This command will take only a moment to download the container image for Fedora 36.

Once the process finishes, you will get a message letting you know that the container was created.

![Distrobox 'fedoraonfoss' successfully created][5]

#### 2. Start and enter the container

An OS container is of no use if we do not start it and access its shell.

To do so, use the ‘**distrobox-enter**‘ command. The syntax is as following:

```
distrobox-enter CONTAINER-NAME
```

When you start the container for the first time, Distrobox will do an automatic initial setup of installing a few containers, setting up the mounts, themes, icons, fonts, groups, users and more.

Based on your computer’s processing power, this may take quite a long time. Please be patient for ~15 minutes during the first power-on.

When that is completed, you will be dropped in the shell of the container automatically.

![Entering the 'fedoraonfoss' Distrobox container][6]

If you look carefully, previously, when I ran the command ‘distrobox-enter’, the hostname shown on my prompt was ‘itsfoss’. Once the initial setup was done, now I am in a shell with a different hostname, that is ‘fedoraonfoss’.

Let us also check the VERSION from ‘/etc/os-release’ file.

![Comparing VERSION string from '/etc/os-release' between Ubuntu and Fedora][7]

#### 3. Install software

If you have reached this stage, this is the equivalent of freshly installing Fedora on your computer and the OS just booted.

Just like a virtual machine, the OS on our host machine does not matter. We have to use the package manager provided by the guest OS. Hence, I will be using the DNF package manager on Fedora 36.

My host operating system, Ubuntu 22.04 LTS, does not [yet] have [Foliate][8] in the first party repositories. But Fedora 36 has Foliate in the first party repositories. This way, I can easily install Foliate as a native software without making use of heavy virtualization.

So, let us install Foliate, since it is available in Fedora’s repositories but not in Ubuntu’s repositories.

I will run the following command (inside the container shell) to install Foliate:

```
sudo dnf install foliate.noarch
```

After dnf finishes installing Foliate, I will run the following command (inside the container shell) as well:

```
distrobox-export --app foliate
```

When you run the ‘**distrobox-export**‘ command from the container, it will make the specified software available to the host operating system as well. This means, even though Foliate is installed inside the Fedora container, I will be able to see it in Ubuntu’s Application Menu.

![Getting Foliate (installed in Fedora) visible in Ubuntu's Application Menu][9]

As you can see, I have Foliate visible in Ubuntu’s Application Menu, even though that was installed in a Fedora 36 container.

Isn’t that amazing?

#### 4. Integration of Distrobox applications

For the purposes of this demonstration, I have downloaded [The Linux Command Line][10]PDF book, written by William Shotts. It saved it in my Documents directory.

Let us see if a containerized software—that is packaged for a entirely different operating system—reacts to changes like switch from light mode to dark mode. Can it see my ‘~/Documents’ directory?

![Testing Foliate if it can pick up theme changes and also my $HOME directory][11]

As you can see, the theme changes are detected correctly, even the top bar has the correct icons for close button and hamburger menu.

On top of that, I do not need to copy my epub file to anywhere else. My ‘~/Documents’ directory was also correctly picked up.

Just like a native application!

#### 5. Manage Distrobox images

Distobox provides a few commands that can be used to manage Distrobox images.

The first command is ‘**distrobox list**‘. As evident from the name, it lists all the containers that are installed.

![Listing all Distrobox containers][12]

Since I have only one container, only ‘fedoraonfoss’ showed up, even though it exited a few moments ago.

The second command is ‘**distrobox stop**‘. This command is used to stop a running container.

Below is the syntax:

```
distrobox stop CONTAINER-NAME
```

Finally, to delete any Distrobox container, use the ‘distrobox rm’ command. The syntax is given below:

```
distrobox rm CONTAINER-NAME
```

To explore more technical details, head to its [GitHub page][13].

### Conclusion

Distrobox is a wonderful tool that allows you to install operating systems as a simple podman/docker container and use them as a full-fledged operating system.

Using Distrobox you can install virtually any software, even if it is not available in your distribution’s repositories, or even if it is not packaged for your Linux distribution. How useful is that?

There can be various use-cases for Distrobox. What do you think you will be using it for? Share your thoughts in the comments section down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/distrobox/

作者：[Pratham Patel][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/distrobox.jpg
[2]: https://itsfoss.com/wp-content/uploads/2022/06/distrobox-1.jpg
[3]: https://github.com/89luca89/distrobox
[4]: https://youtu.be/Q2PrISAOtbY
[5]: https://itsfoss.com/wp-content/uploads/2022/05/01_distrobox_create-800x579.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/05/02_distrobox_enter-800x579.webp
[7]: https://itsfoss.com/wp-content/uploads/2022/05/03_distrobox_os_release-800x579.webp
[8]: https://itsfoss.com/foliate-ebook-viewer/
[9]: https://itsfoss.com/wp-content/uploads/2022/05/04_distrobox_export-800x600.webp
[10]: https://www.linuxcommand.org/tlcl.php
[11]: https://itsfoss.com/wp-content/uploads/2022/05/distrobox_app_test.gif
[12]: https://itsfoss.com/wp-content/uploads/2022/05/05_distrobox_list-800x226.webp
[13]: https://github.com/89luca89/distrobox
