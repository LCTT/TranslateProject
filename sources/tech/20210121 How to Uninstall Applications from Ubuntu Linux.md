[#]: collector: (lujun9972)
[#]: translator: (amagicbowboy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Uninstall Applications from Ubuntu Linux)
[#]: via: (https://itsfoss.com/uninstall-programs-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Uninstall Applications from Ubuntu Linux
======

Don’t use a certain application anymore? Remove it.

In fact, removing programs is one of the [easiest ways to free up disk space on Ubuntu][1] and keep your system clean.

In this beginner’s tutorial, I’ll show you various ways of uninstalling software from Ubuntu.

Did I say various ways? Yes, because there are [various ways of installing applications in Ubuntu][2] and hence various ways of removing them. You’ll learn to:

  * Remove applications from Ubuntu Software Center (for desktop users)
  * Remove applications using apt remove command
  * Remove snap applications in command line (intermediate to advanced users)



Let’s see these steps one by one.

### Method 1: Remove applications using Ubuntu Software Center

Start the Software Center application. You should find it in the dock on the left side or search for it in the menu.

![][3]

You can see the installed applications in the Installed tab.

![List installed applications][4]

If you don’t see a program here, try to use the search feature.

![Search for installed applications][5]

When you open an installed application, you should see the option to remove it. Click on it.

![Removing installed applications][6]

It will ask for your account password. Enter it and the applications will be removed in seconds.

This method works pretty well except in the case when Software Center is misbehaving (it does that a lot) or if the program is a software library or some other command line utility. You can always resort to the terminal in such cases.

### Method 2: Remove programs from Ubuntu using command line

You know that you can use `apt-get install` or `apt install` for installing applications. For uninstalling, you don’t use the apt-get uninstall command but `apt-get remove` or `apt remove`.

All you need to do is to use the command in the following fashion:

```
sudo apt remove program_name
```

You’ll be asked to enter your account password. When you enter it, nothing is visible on the screen. That’s normal. Just type it blindly and press enter.

The program won’t be removed immediately. You need to confirm it. When it asks for your conformation, press the enter key or Y key:

![][7]

Keep in mind that you’ll have to use the exact package name in the apt remove command otherwise it will throw ‘[unable to locate package error][8]‘.

Don’t worry if you don’t remember the exact program name. You can utilize the super useful tab completion. It’s one of the [most useful Linux command line tips][9] that you must know.

What you can do is to type the first few letters of the program you want to uninstall. And then hit the tab key. It will show all the installed packages that match those letters at the beginning of their names.

When you see the desired package, you can type its complete name and remove it.

![][10]

What if you do not know the exact package name or even the starting letters? Well, you can [list all the installed packages in Ubuntu][11] and grep with whatever your memory serves.

For example, the command below will show all the installed packages that have the string ‘my’ in its name anywhere, not just the beginning.

```
apt list --installed | grep -i my
```

![][12]

That’s cool, isn’t it? Just be careful with the package name when using the remove command in Ubuntu.

#### Tip: Using apt purge for removing package (advanced users)

When you remove a package in Ubuntu, the packaged data is removed, but it may leave small, modified user configuration files. This is intentional because if you install the same program again, it would use those configuration files.

If you want to remove it completely, you can use apt purge command. You can use it instead of apt remove command or after running the apt remove command.

```
sudo apt purge program_name
```

Keep in mind that the purge command won’t remove any data or configuration file stored in the home directory of a user.

### Method 3: Uninstall Snap applications in Ubuntu

The previous method works with the DEB packages that you installed using apt command, software center or directly from the deb file.

Ubuntu also has a new packaging system called [Snap][13]. Most of the software you find in the Ubuntu Software Center are in this Snap package format.

You can remove these applications from the Ubuntu Software Center easily but if you want to use the command line, here’s what you should do.

List all the snap applications installed to get the package name.

```
snap list
```

![][14]

Now use the package name to remove the application from Ubuntu. You won’t be asked for confirmation before removal.

```
sudo snap remove package_name
```

### Bonus Tip: Clean up your system with one magical command

Alright! You learned to remove the applications. Now let me tell you about a simple command that cleans up leftover package traces like dependencies that are no longer used, old Linux kernel headers that won’t be used anymore.

In the terminal, just run this command:

```
sudo apt autoremove
```

This is a safe command, and it will easily free up a few hundred MB’s of disk space.

### Conclusion

You learned three ways of removing applications from Ubuntu Linux. I covered both GUI and command line methods so that you are aware of all the options.

I hope you find this simple tutorial helpful as an Ubuntu beginner. Questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/uninstall-programs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/free-up-space-ubuntu-linux/
[2]: https://itsfoss.com/remove-install-software-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/ubuntu_software_applications_menu.jpg?resize=800%2C390&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/installed-apps-ubuntu.png?resize=800%2C455&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/search-installed-apps-ubuntu.png?resize=800%2C455&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-applications-ubuntu.png?resize=800%2C487&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/apt-remove-program-ubuntu.png?resize=768%2C424&ssl=1
[8]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[9]: https://itsfoss.com/linux-command-tricks/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-package-ubuntu-linux.png?resize=768%2C424&ssl=1
[11]: https://itsfoss.com/list-installed-packages-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/search-list-installed-apps-ubuntu.png?resize=768%2C424&ssl=1
[13]: https://itsfoss.com/install-snap-linux/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/list-snap-remove.png?resize=800%2C407&ssl=1
