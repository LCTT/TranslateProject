[#]: subject: (GNOME’s Very Own “GNOME OS” is Not a Linux Distro for Everyone [Review])
[#]: via: (https://itsfoss.com/gnome-os/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

GNOME’s Very Own “GNOME OS” is Not a Linux Distro for Everyone [Review]
======

Whenever a major release for GNOME arrives, it is always tempting to try it out as soon as possible. But, to get your hands on it first to test it, you had to mostly rely on [Fedora Rawhide][1] (development branch).

However, a development branch isn’t always hassle-free. So, it wasn’t the most convenient solution to try the latest GNOME. Now, by testing, I don’t mean just for users but also being able to test design changes for the developers as well.

So, GNOME OS recently came to the rescue to ease the process of testing. But, what exactly is it and how to get it installed? Let us take a look.

### What is GNOME OS?

GNOME OS is not a separate full-fledged Linux distribution. In fact, it isn’t based on anything at all. It’s an incomplete reference system just to make GNOME desktop work. **It is just a bootable VM (Virtual Machine) image tailored for debugging and testing features before it hits any distribution’s repository.**

One of the GNOME blogs mention it as:

> GNOME OS aims to better facilitate development of GNOME by providing a working system for development, design, and user testing purposes.

If you’re curious, you may want to check out a [blog post][2] on Planet GNOME to know more about GNOME OS.

### If it’s not a full-fledged Linux distribution then what is it used for?

![][3]

It is interesting to note that a new GNOME OS image can be created for every new commit made, so it should make the testing process efficient and help you test/find issues early in the development cycle.

Not to forget, designers no longer have to build the software themselves to test the GNOME Shell or any other core modules. It saves them time and the whole GNOME development cycle.

Of course, not just limited to developers and technical testers, it also lets journalists to get their hands on the latest and greatest to cover a story about GNOME’s next release or how it’s being shaped.

The media and the GNOME team also gets a good opportunity to prepare visual materials to promote the release in both video/picture format thanks to GNOME OS.

### How to install GNOME OS?

To easily install GNOME OS, you will need to install GNOME Boxes application first.

#### Installing GNOME Boxes

‘**Boxes**‘ is a simple virtualization software that does not offer any advanced options but lets you easily install an operating system image to test quickly. It is targeted specially for desktop end-users, so it is easy to use as well.

To install it on any Linux distribution, you can utilize the [Flatpak][4] package from [Flathub][5]. In case you don’t know about a Flatpak, you might want to read our guide on [installing and using Flatpak in Linux][6].

You may also directly install it from the terminal on any Ubuntu-based distro by typing this:

```
sudo apt install gnome-boxes
```

Once you get Boxes installed, it is fairly easy to install GNOME OS from here.

#### Install GNOME OS

After you have Boxes installed, you need to launch the program. Next, click on the “**+**” sign that you see in the upper-left corner of the window and then click on “**Operating System Download**” as shown in the image below.

![][7]

This option lets you directly download the image file and then you can proceed to install it.

All you need to do is search for “GNOME” and you should find the Nightly build available. This will ensure that you are trying the latest and greatest GNOME version in development.

Alternatively, you can head to the [GNOME OS Nightly website][8] and download the system image and choose the “**Operating System Image File**” in the Boxes app to select the ISO as shown in the screenshot above to proceed installing it.

![][9]

Considering you didn’t download the image separately. When you click on it, the download should start and a progress bar will appear:

![][10]

Once it is done, it will ask you to customize the configuration if needed and let you create the VM as shown below:

![][11]

You can customize the resource allocation depending on your available system resources, but you should be good to go with the default settings.

Click on “**Create**” and it will directly start GNOME OS installation:

![][12]

Select the existing version and proceed. Next, you will have to select the disk (keep it as is) and then agree to erasing all your files and apps (it won’t delete anything from your local computer).

![][13]

Now, it will simply reformat and install it. And, you’re done. It will prompt you to restart it and when you do, you will find GNOME OS installed.

It will simply boot up as any Linux distro would and will ask you to set up a few things, including the username and a password. And, you’re good to explore!

If you are curious what it looks like, it’s basically the latest GNOME desktop environment. I used GNOME OS to make an overview video of GNOME 40 before the official release.

### Closing Thoughts

GNOME OS is definitely something useful for developers, designers, and the media. It makes it easy to test the latest development version of GNOME without investing a lot of time.

I could test [GNOME 40][14] quickly just because of this. Of course, you will have to keep in mind that this isn’t a fully functional OS that you should install on a physical device. There are plans to make one available to run on a physical machine, but as it stands now, it is only tailored for virtual machines, especially using GNOME Boxes.

GNOME Boxes does not offer any advanced options, so it becomes quite easy to set it up and use it. You might want to tweak the resources if the experience is too slow, but it was a good experience overall in my case.

Have you tried GNOME OS yet? Feel free to let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-os/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://fedoraproject.org/wiki/Releases/Rawhide
[2]: https://blogs.gnome.org/alatiera/2020/10/07/what-is-gnome-os/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/GNOME-OS-distro-review.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-flatpak/
[5]: https://flathub.org/apps/details/org.gnome.Boxes
[6]: https://itsfoss.com/flatpak-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-search.jpg?resize=800%2C729&ssl=1
[8]: https://os.gnome.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-boxes.jpg?resize=800%2C694&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-download.jpg?resize=798%2C360&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-boxes-vm-setup.png?resize=800%2C301&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-nightly-install.jpg?resize=800%2C636&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-installation.jpg?resize=800%2C619&ssl=1
[14]: https://news.itsfoss.com/gnome-40-release/
