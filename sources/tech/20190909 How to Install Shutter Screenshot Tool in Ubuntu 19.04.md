[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Shutter Screenshot Tool in Ubuntu 19.04)
[#]: via: (https://itsfoss.com/install-shutter-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Shutter Screenshot Tool in Ubuntu 19.04
======

Shutter is my favorite tool for [taking screenshots in Linux][1]. You can take screenshots with it and you can also edit screenshots or other images with it. It’s a nifty tool for adding arrows and text on the images. You can also use it to [resize images in Ubuntu][2] or whichever Linux distribution you are using. Most of the screenshot tutorials on It’s FOSS have been edited on Shutter.

![][3]

Though [Shutter][4] has been a great tool so far, its development is stalled. There has been no new release of Shutter in several years. Even simple bugs like [editing mode being disabled in Shutter][5] hasn’t been fixed. There is no news from the developer at all.

Perhaps this is the reason why newer release of Ubuntu have dropped it. Until Ubuntu 18.04 LTS, you could install it from the software or [using apt-get command][6] by [enabling the universe repository][7]. But from Ubuntu 18.10 and later releases, you cannot do it anymore.

All the shortcomings aside, Shutter is till a great tool and I want to continue using it. Perhaps you too are a Shutter fan like me and want to use it. The good things is that you can still install Shutter in Ubuntu 19.04 thanks to an unofficial PPA.

### Installing Shutter on Ubuntu 19.04

![Install Shutter Ubuntu][8]

I hope you are familiar with concept of PPA. If not, I highly recommend reading my detailed guide to know more about [what is PPA and how to use it][9].

Now, open a terminal and use the following command to add the new repository:

```
sudo add-apt-repository -y ppa:linuxuprising/shutter
```

No need to use apt update anymore because starting Ubuntu 18.04, the repositories are automatically updated after adding a new entry.

Now use the apt command to install Shutter:

```
sudo apt install shutter
```

That’s it. You should have Shutter screenshot tool installed. You can search for it in the menu and start from there.

[][10]

Suggested read  Managing Linux Kernel Upgrades In Debian

### Removing Shutter installed via the unofficial PPA

I’ll complete this tutorial by adding the steps to uninstall Shutter and remove the repository you added.

First, remove Shutter from your system:

```
sudo apt remove shutter
```

Next, remove the PPA from your list of repositories:

```
sudo add-apt-repository --remove ppa:linuxuprising/shutter
```

You may also want to take a look at [Y PPA Manager][11], a tool for managing PPA graphically.

Shutter

Shutter is an excellent tool and I would prefer that it is actively developed. I hope that its developer is alright and he/she can find some time to work on it. Or perhaps it’s time for someone else to fork it and continue to make it more awesome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-shutter-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/take-screenshot-linux/
[2]: https://itsfoss.com/resize-images-with-right-click/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/08/shutter-screenshot.jpg?ssl=1
[4]: http://shutter-project.org/
[5]: https://itsfoss.com/shutter-edit-button-disabled/
[6]: https://itsfoss.com/apt-get-linux-guide/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/Install-Shutter-ubuntu.jpg?resize=800%2C450&ssl=1
[9]: https://itsfoss.com/ppa-guide/
[10]: https://itsfoss.com/kernel-upgrade-debian/
[11]: https://itsfoss.com/y-ppa-manager/
