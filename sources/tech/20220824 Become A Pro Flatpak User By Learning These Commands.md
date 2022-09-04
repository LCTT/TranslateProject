[#]: subject: "Become A Pro Flatpak User By Learning These Commands"
[#]: via: "https://www.debugpoint.com/flatpak-commands/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Become A Pro Flatpak User By Learning These Commands
======
In this article, I will show you various Flatpak commands that make you a pro Flatpak user.

![][1]

Flatpak sandboxed technology is the future of Linux app distribution. Almost all significant distributions come with Flatpak pre-installed today since the adoption is easy and maintaining it more straightforward.

If you use Flatpak every day, you probably know these commands. But if you are still considering moving to Flatpak for every app, then you should go through this list to understand how easy to manage Flatpak apps.

Hence, to help you do that, I have listed some easy-to-use Flatpak commands for your reference, filtered from the huge set of command-set from documentation.

### Flatpak Commands Reference

First, let’s talk about some basic commands.

#### 1. Installing Flatpak

Since last time I checked, all the significant distros come with pre-installed Flatpak packages today. Hence, you may not require to install it.

However, installing Flatpak is as easy as running the following command for two major distro lineups.

```
sudo apt install flatpak     // for Ubuntu and related distros
```

```
sudo dnf install flatpak    // for Fedora and RPM based distros
```

You may check out our [detailed guide][2] on Flatpak installation, if you are running any other distro.

#### 2. Set up Flatpak Remote

Next, you need to set up a connection to remotes after installation. The remotes are like repositories (think about PPA) which distribute Flatpak apps.

The primary repo is Flathub, and you can set it up using the following command. This command is same for all distros. And after you finish, reboot your system and you are ready to install Flatpak apps.

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

**Tip**: If you have a different remote, you may use the same command to add that remote. Its normal to have multiple remotes set up in a single system.

**Tip**: Also, you can specify `--user` or `--system` switch to install the Flatpak remotes specific to your user id or the entire system!

```
flatpak remote-add --if-not-exists --user https://flathub.org/repo/flathub.flatpakrepo
```

```
flatpak remote-add --if-not-exists --system https://flathub.org/repo/flathub.flatpakrepo
```

#### 3. Installing a Flatpak app from Flathub

Most of the significant GUI-based Software stores in Linux allow Flatpak installation by default. For example, if you are using Software (for Ubuntu or Fedora – GNOME), you can find and click on the install button to install.

Or, in KDE Plasma’s discover:

![KDE Discover can pull up Flatpak apps from Flathub][3]

But, the easiest way is to copy the install command from the [Flathub store][4] (available at the bottom of each app info page) and paste it into the terminal. This is the fastest way to install any Flatpak app.

```
flatpak install org.kde.kdenlive
```

#### 4. Running an application

There are two ways to run a Flatpak app which you installed. You can either find it in the application menu in the graphical desktop environment. Or, you can use the simple run command to launch.

You can find the run command from the Flathub app page.

```
flatpak run org.kde.kdenlive
```

Now, you have learned how to set up, install and run the Flatpak app. It’s time to go a little deeper.

#### 5. Find out list of Flatpak apps you have installed

Over the years, you may have installed and removed many Flatpak apps. But, how can you find out how many Flatpak apps I have installed at any given time? Or you might be wondering what the Flatpak apps that are installed by the system.

Here are some Flatpak commands (to run via terminal) that can help you in this regard as FAQ.

* Simple Flatpak commands to list all installed app. This includes both system apps and your apps.

```
flatpak list
```

* Command to display only your apps.

```
flatpak --user list
```

* A little more detail you can filter using additional columns (such as name, size etc) in both the above commands.

```
flatpak --columns=app,name,size,installation list
```

```
flatpak --columns=name,size --user list
```

![flatpak list command with additional columns][5]

#### 6. Find out more information about an installed app

Now, you have installed an app via above Flatpak commands. But what if you want to find out the architecture, version, branch, licence and other information. You can do that using the `info` switch. This command requires the Flatpak `Application ID` which you can get it via above `flatpak list` command.

Example:

```
flatpak info org.kde.kdenlive
```

![flatpak info command][6]

#### 7. Find out entire history of flatpak command in your system

The histroy switch in flatpak command gives you a list of activities happened in your system that includes install, update, uninstall with date time stamp. It’s very useful if you want to trying to investigate something.

```
flatpak history
```

#### 8. Updating Flatpak apps

The update switch in flatpak command updates all applications and runtimes. When you run this command, it will show you the available updates and asks for your confirmation to proceed.

```
flatpak update
```

If you want to update a specific application and not the entire system use the `--app` or `--runtime` switch for applications and runtimes respectively.

For example, if I want to update only kdenlive in my system, I would run the following.

```
flatpak update --app org.kde.kdenlive
```

**Tip**: The update command usually updates to the top of the branch of any program. However, using the `--commit` switch in update parameter, you can update to a specific branch (upgrade or downgrade) in flatpak. For example:

```
flatpak update --app org.kde.kdenlive --commit 37103f4ee56361a73d20cf6957d88f3c3cab802909a5966c27a6e81d69795a15
```

This commit switch is very helpful if you want to play around several version of same app.

![Example of flatpak commands update with commit][7]

#### 9. Managing permission of flatpak apps

Different application require variety of permissions such as webcam, microphone, screen and so on. Managing these individual permissions are a little overwhelming via commands. Hence, the best way to manage Flatpak permission is using another flatpak app called Flatseal. It gives you a nice GUI with toggle buttons to enable/disable/review permissions of the installed Flatpak apps.

You can read more about [Flatseal here][8].

#### 10. Commands to uninstall Flatpak applications

There are different use cases for uninstall a flatpak app. So, here’s quick guide.

To uninstall a single application, use the `uninstall` switch with application ID. For example:

```
flatpak uninstall org.kde.kdenlive
```

To uninstall all apps, use the `--all` switch.

```
flatpak uninstall --all
```

To uninstall unused apps, use the following.

```
flatpak uninstall --unused
```

#### 11. Delete and remove every trace of Flatpak apps

**Use the following commands with extreme caution, since it will delete everything.**

Even if you uninstall a Flatpak app, some app data remains in your system unless you run the uninstall with some additional switch. Its necessary for cases where you might want to delete everything and start afresh with Flatpak.

To uninstall and delete data for a specific app, use the following command. For example:

```
flatpak uninstall -y --delete-data org.kde.kdenlive
```

To uninstall and delete everything related to Flatpak, use below.

```
flatpak uninstall --all --delete-data
```

#### 12. Cleanup and disk space usage

By default Flatpak gets installed in `/var/lib/flatpak`. This directory contains all flatpak related data and metadata plus runtime files. And the user specific installation directory is `~/.local/share/flatpak`.

You can find out the disk space used by Flatpak apps using the following command.

```
du -h /var/lib/flatpak
```

To clean up, you can use the unused or uninstall commands mentioned above. For details, visit our [flatpak cleanup guide][9].

### Summary

For your ready reference, here’s a summary of the Flatpak commands explained above. And bookmark this page for easy reference.

```
# install and run
flatpak install org.kde.kdenlive
flatpak run org.kde.kdenlive

#various ways of list installed apps
flatpak list
flatpak --user list
flatpak --columns=app,name,size,installation list
flatpak --columns=name,size --user list

# find out app id and history
flatpak info org.kde.kdenlive
flatpak history

# updating flatpak
flatpak update
flatpak update --app org.kde.kdenlive

# uninstalling flatpak apps
flatpak uninstall org.kde.kdenlive
flatpak uninstall --unused

# uninstall everything (use with caution)
flatpak uninstall --all
flatpak uninstall -y --delete-data org.kde.kdenlive
flatpak uninstall --all --delete-data
```

Finally, do let me know in the comment box which Flatpak commands you think should also be included in this list.

*[Some examples via the official reference.][10]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/flatpak-commands/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/fpref-1024x576.jpg
[2]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[3]: https://www.debugpoint.com/?attachment_id=10760
[4]: https://flathub.org/apps
[5]: https://www.debugpoint.com/?attachment_id=10758
[6]: https://www.debugpoint.com/?attachment_id=10757
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/Example-of-flatpak-commands-update-with-commit-1024x576.jpg
[8]: https://www.debugpoint.com/manage-flatpak-permission-flatseal/
[9]: https://www.debugpoint.com/clean-up-flatpak/
[10]: https://docs.flatpak.org/en/latest/flatpak-command-reference.html
