[#]: subject: (Install and remove software packages on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/freedos-package-manager)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Install and remove software packages on FreeDOS
======
Get familiar with FDIMPLES, the FreeDOS package manager.
![Package wrapped with brown paper and red bow][1]

On Linux, you may have used a _package manager_ to install or remove packages. For example, the default package manager on Debian Linux is the `deb` command, and the default package manager on Fedora Linux is the `dnf` command. But did you know that FreeDOS has a package manager, too?

### Installing packages

The FreeDOS 1.3 RC4 distribution includes lots of great programs and applications you can use. However, we don't install all of them by default—we don't want to fill your hard drive space unnecessarily, especially on older systems that may have hard drive capacities of only a few hundred megabytes. And if you selected the "Plain DOS system" option when you installed FreeDOS, you will find your FreeDOS system is quite small (about 20 megabytes).

However, it's easy to install new packages. From the command line, run the `FDIMPLES` program. Because DOS is _case insensitive_, you can type this command using uppercase or lowercase letters: `fdimples` is the same as `FDIMPLES` or `FDImples`.

![fdimples][2]

The FDIMPLES package manager on FreeDOS 1.3 RC4 (running in QEMU)
(Jim Hall, [CC-BY SA 4.0][3])

FDIMPLES is an acronym for "**F**ree**D**OS **I**nstaller - **M**y **P**ackage **L**ist **E**ditor **S**oftware," and is an interactive package manager. FDIMPLES reads the installation media to identify packages that it can install or remove. If you see a different menu that says "Installed" but does not let you install other software, check that the FreeDOS install CD-ROM is loaded on your system. On a physical machine, you'll need to insert the CD-ROM into the CD-ROM drive; on a virtual machine like QEMU or VirtualBox, you'll need to associate the install CD-ROM image with the virtal machine.

![fdimples installed][4]

If you only see an "Installed" message, check that the CD-ROM is loaded
(Jim Hall, [CC-BY SA 4.0][3])

Let's say you wanted to install software that lets you play music and other sound files. Use the Up and Down arrow keys to navigate to the **Sound Tools** entry in the menu. This is called a _package group_ for the sound and music programs.

![fdimples sound][5]

Highlighting the Sound package group in FDIMPLES
(Jim Hall, [CC-BY SA 4.0][3])

To select all of the packages in this group, press the spacebar on your keyboard. Should you decide to install individual packages in this group, press the Tab key to move into the _package list_ pane, then select each package with the spacebar.

![fdimples sound select][6]

Select all the packages in a group by pressing the spacebar
(Jim Hall, [CC-BY SA 4.0][3])

You can continue to select other packages or package groups that you want to install. When you have selected everything, use the Tab key to highlight the **OK** button, and press the spacebar.

![fdimples sound select ok][7]

Highlight the "Ok" button when you're ready to install
(Jim Hall, [CC-BY SA 4.0][3])

FDIMPLES then installs all of the packages you selected. This may only take a few moments if you selected only a couple of small packages, or it could take minutes if you asked to install many larger packages. As it installs each package, FDIMPLES prints the status. Afterward, FDIMPLES exits to the command line, so you can get back to work.

![fdimples sound install done][8]

FDIMPLES shows the progress as its installs packages, and automatically exits when done
(Jim Hall, [CC-BY SA 4.0][3])

### Removing packages

What if you install a package, only to discover afterward that you don't want it? Removing packages is just as easy in FDIMPLES.

Just as when installing packages, start FDIMPLES, and use the arrow keys to navigate to the group that contains the packages you want to remove. For example, if I wanted to uninstall a few of the music-player packages I installed earlier, I would navigate to the **Sound Tools** package group.

![fdimples sound select][9]

Navigate to the group with the packages you want to remove
(Jim Hall, [CC-BY SA 4.0][3])

To remove the entire package group at once, you can press the spacebar on the group you want to remove to unselect it. But let's say I only wanted to remove a few packages that I didn't need, like the **CDP** audio CD player. (I don't have any physical music CDs.) To remove CDP, hit the Tab key to move into the package list pane, then use the spacebar to unselect the CDP package. This removes the **X** on that package.

![fdimples unselect cdp][10]

Unselect a package to remove it
(Jim Hall, [CC-BY SA 4.0][3])

You can continue to unselect other packages or package groups that you want to remove. When you have selected everything, use the Tab key to highlight the **OK** button, and press the spacebar. FDIMPLES will remove the packages you unselected, then automatically returns you to the command line.

![fdimples cdp removed][11]

FDIMPLES removes the package, then returns to the command line
(Jim Hall, [CC-BY SA 4.0][3])

We include many packages in FreeDOS, across a variety of package groups. Use FDIMPLES to install the software you need. Feel free to experiment! If you decide you don't want to keep a package, you can remove it and free up your disk space for other things.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-package-manager

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://opensource.com/sites/default/files/uploads/fdimples.png (The FDIMPLES package manager on FreeDOS 1.3 RC4 (running in QEMU))
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/fdimples-installed.png (If you only see an "Installed" message, check that the CD-ROM is loaded)
[5]: https://opensource.com/sites/default/files/uploads/fdimples-sound.png (Highlighting the Sound package group in FDIMPLES)
[6]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select.png (Select all the packages in a group by pressing the spacebar)
[7]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select-ok.png (Highlight the "Ok" button when you're ready to install)
[8]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select-ok-install4.png (FDIMPLES shows the progress as its installs packages, and automatically exits when done)
[9]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select_0.png (Navigate to the group with the packages you want to remove)
[10]: https://opensource.com/sites/default/files/uploads/fdimples-unselect-cdp.png (Unselect a package to remove it)
[11]: https://opensource.com/sites/default/files/uploads/fdimples-unselect-cdp-removed.png (FDIMPLES removes the package, then returns to the command line)
