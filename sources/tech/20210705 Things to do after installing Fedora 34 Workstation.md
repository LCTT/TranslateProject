[#]: subject: (Things to do after installing Fedora 34 Workstation)
[#]: via: (https://fedoramagazine.org/things-to-do-after-installing-fedora-34-workstation/)
[#]: author: (Arman Arisman https://fedoramagazine.org/author/armanwu/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Things to do after installing Fedora 34 Workstation
======

![][1]

Using a new operating system can be a lot of fun. But it often becomes confusing when we first use it, especially for new users who are not very familiar with computer systems. For those of you who are using Fedora for the first time and have successfully installed Fedora 34 Workstation, this article can be an initial guide. I’m sure that you want to feel more at home with your new fresh Fedora. These are several things to do after installing your Fedora 34 Workstation.

### System update

Maybe you think that you have installed the most recent version of Fedora 34 Workstation, so your Fedora should be up to date. But you still have to make sure that your Fedora Linux has all the updated packages. Because in every new release of an operating system, usually there are still many things that continue to be improved. You can use the terminal or GNOME software to run the update.

If you want to update via the terminal, then you just have to open a terminal and type the following command.

```
$ sudo dnf update
```

But if you want to do it with GNOME _Software_, open the application by selecting _Activities_ then locating and selecting the _Software_ item in the taskbar at the bottom of the screen. When it opens select the _Update_s tab at the top. After that you just click the _Download_ button. An update may require a restart afterwards and _Update_ will tell you that.

![GNOME Software location in the taskbar at the bottom of the screen][2]

_note: another way to select Activities is to press the super key on the keyboard. Super key is the button that has the Windows logo on most keyboards._

![Gnome Software showing Updates][3]

### System settings

You can view and configure your device’s system through _System Settings_. These include items like network, keyboard, mouse, sound, displays, etc. You can run it by pressing the _super_ key on your keyboard, clicking _Show Applications_ in the task bar at the bottom of the window, then selecting _Settings_. Configure it according to your needs.

![Settings menu showing Network selected][4]

### Additional repositories

Maybe some packages you need are not available to be installed from the official Fedora Repository. You can add software repositories with the _dnf config-manager_ command. Please be careful if you want to add other repositories besides the official Fedora repository.

The first thing you should do is define a new repository by adding a new file ending in _.repo_ to the _/etc/yum.repos.d/_ directory. Run the following command in the terminal.

```
$ sudo dnf config-manager --add-repo /etc/yum.repos.d/file_name.repo
```

_note: replace file_name with the repository file name._

Or you can use GNOME _Software_. Open it as described in the System Update section above. Now select the “hamburger” icon (three horizontal lines) on the top right and select _Software Repositories_. You can add the repository from there using the _Install_ option.

![GNOME Software showing location of Software Repositories menu][5]

Most people will enable RPM Fusion. It’s a third party repository. You can read about third party repositories in [Fedora Docs][6].

### Fastest mirror and Delta RPM

There are several things you can do to speed up your download times when using DNF to update your system. You can enable Fastest Mirror and Delta RPM. Edit _/etc/dnf/dnf.conf_ using a text editor, such as gedit or nano. Here’s the example to open _dnf.conf_ file with _nano_ in _terminal_.

```
$ sudo nano /etc/dnf/dnf.conf
```

Append the following line onto your _dnf.conf_ file.

```
fastestmirror=true
deltarpm=true
```

Press _ctrl+o_ to save the file then _ctrl+x_ to quit from _nano_.

### Multimedia plugins for audio and video

You may need some plugins for your multimedia needs. You can install multimedia plugins by running this command in a terminal.

```
$ sudo dnf group upgrade --with-optional Multimedia
```

Please pay attention to the regulations and standards in your country regarding multimedia codecs. You can read about this in [Fedora Docs][7].

### Tweaks and Extentions

Fedora 34 Workstation comes with GNOME as the default Desktop Environment. We can do various configurations of GNOME by using Tweaks and Extensions, like changing themes, changing buttons in the window dialog, and many more.

Open your terminal and run this command to install GNOME Tweaks.

```
$ sudo dnf install gnome-tweaks
```

And run this command to install GNOME Extensions.

```
$ sudo dnf install gnome-extensions-app
```

Do the same way as above when you search for _GNOME Software_. Select _Activities_ or press the _super_ key then select _Show Applications_ to see a list of installed applications. You can find both applications in the list. You can do the same thing every time you want to search for installed applications. Then do the configuration with your preferences with _Tweaks_ and _Extensions_.

![GNOME Tweaks][8]

![GNOME Extensions][9]

### Install applications

When you first install Fedora, you will find several installed apps. You can add other applications according to your needs with GNOME Software. Do the same way to open GNOME Software as described earlier. Then find the application you want, select the application, and then press the Install button.

![GNOME Software][10]

Or you can do it with terminal. Here are the commands to find and install the application.

Command to search for available applications:

```
$ sudo dnf search application_name
```

The command to install the application:

```
$ sudo dnf install application_name
```

Commands to remove installed applications:

```
$ sudo dnf remove application_name
```

_note: replace application_name with the name of the application._

You can search for installed applications by viewing them in _Show Applications_. Select _Activities_ or press the _super_ key and select _Show Applications_. Then you can select the application you want to run from the list.

![Installed application list][11]

### Conclusion

Fedora Workstation is an easy-to-use and customizable operating system. There are many things you can do after installing Fedora 34 Workstation according to your needs. This article is just a basic guide for your first steps before you have more fun with your Fedora Linux system. You can read [Fedora Docs][12] for more detailed information. I hope you enjoy using Fedora Linux.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/things-to-do-after-installing-fedora-34-workstation/

作者：[Arman Arisman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/armanwu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/FedoraMagz-Cover_ThingsToDo.png
[2]: https://fedoramagazine.org/wp-content/uploads/2021/07/GNOME_Software_location-1024x576.png
[3]: https://fedoramagazine.org/wp-content/uploads/2021/07/Software_Updates-1024x735.png
[4]: https://fedoramagazine.org/wp-content/uploads/2021/07/Settings-1024x764.png
[5]: https://fedoramagazine.org/wp-content/uploads/2021/07/Software_Hamburger_-1-1024x685.png
[6]: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
[7]: https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
[8]: https://fedoramagazine.org/wp-content/uploads/2021/07/Tweaks-1024x733.png
[9]: https://fedoramagazine.org/wp-content/uploads/2021/07/GNOME_Extensions.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/07/GNOME_Software-1-1024x687.png
[11]: https://fedoramagazine.org/wp-content/uploads/2021/07/Show_Application-1024x576.png
[12]: https://docs.fedoraproject.org/en-US/fedora/f34/
