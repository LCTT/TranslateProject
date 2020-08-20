[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Opera Browser on Ubuntu [Easy Way])
[#]: via: (https://itsfoss.com/install-opera-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Opera Browser on Ubuntu [Easy Way]
======

_**Learn how to install Opera browser easily and safely on Ubuntu and Debian based distributions.**_

[Opera browser][1] was among the first few browsers to have a speed dial feature for quickly accessing most visited websites from the new tab.

Opera still offers several interesting features such as a free VPN, ad-blocker, social media messengers in the sidebar, battery saver, grouping tabs in workspaces etc.

Personally, I do not use Opera. It is not open source. It’s [so-called free-VPN is not that good][2] (it’s hardly even a VPN). After [its acquisition by a Chinese group][3], transparency took another hit. It [collects a vast amount of data][4], same as Alibaba’s UC Browser.

Anyway, I am not here to make a case against Opera. If you want to install and use Opera on Ubuntu, let me show you how to do that easily and safely.

Non-FOSS alert!

Opera browser is not open source. It is covered here because it is available on Linux and the article’s focus is on Linux.

### Installing Opera browser on Ubuntu

Installing Opera Browser in Ubuntu and Debian-based distributions is as simple as installing the DEB file from its download page and double-clicking on it.

Go to [Opera’s download page][5] and click on Download button to download the .DEB installer file.

![Download Opera Browser][6]

Once you have downloaded it, double-click on it to [install the application from deb file][7]. In Ubuntu 20.04, you may have to [right click and select “Open With Software” option][8].

It will open Opera in Software Center and you can just lick on the install button to install Opera.

![][9]

The good thing about this method is that it automatically adds an entry in the repository list. This way, you’ll get all the future updates to the Opera browser with the regular system updates.

![Opera source added to repository list to provide you regular updates][10]

This is same as [installing Google Chrome on Ubuntu][11] as an entry is adding for Chrome to provide you regular updates.

See, how easy it was to install Opera?

#### How to remove Opera browser

You can look for the installed applications in the software center and uninstall Opera from there.

![Remove Opera from the Software Center][12]

You may also use terminal to remove it in this fashion:

```
sudo apt remove opera-stable
```

You may also choose to remove the additional Opera repository added in the sources list.

![Remove Opera Repository][13]

Installing Opera browser via command line (for intermediate to expert users)

Installing Opera browser graphically as described above is simplest and easiest method. If you want to take the command line route, you can do that as well.

First, make sure to [install Curl on Ubuntu][14]:

```
sudo apt install curl
```

Download and add the Opera repository key:

```
curl https://deb.opera.com/archive.key | sudo apt-key add -
```

Now add the Opera repository in your sources list directory (not file):

```
echo deb https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list
```

Update the package cache so that your system is aware of the packages available by the newly added repository:

```
sudo apt update
```

Finally, install the opera-stable package to install Opera.

```
sudo apt install opera-stable
```

During the installation, you’ll be prompted for adding Opera repository to sources list. Select NO because you already did that.

To remove Opera browser installed this way, you should use the following commands one by one:

```
sudo apt remove opera-stable
sudo rm -f /etc/apt/sources.list.d/opera.list
```

#### Opera as Snap

Opera browser is also available as a snap package officially. If you have [Snap support enabled in your Linux distribution][15], you may install Opera via Snap:

```
sudo snap install opera
```

**Conclusion**

One of It’s FOSS readers contacted me with a repository issue that was caused by the incorrect Opera browser installation.

I had to write this straightforward tutorial because some other websites on the internet are suggesting methods with unnecessarily complicated commands that might end up with a corrupt sources.list. I do hope it helps new Linux users.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-opera-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.opera.com/hi
[2]: https://www.tomsguide.com/us/opera-vpn,review-4496.html
[3]: https://www.nytimes.com/2016/02/11/business/dealbook/china-opera-kunlun-qihoo-golden-brick.html
[4]: https://restoreprivacy.com/secure-browser/
[5]: https://www.opera.com/hi/computer/opera
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/opera-browser-download.png?ssl=1
[7]: https://itsfoss.com/install-deb-files-ubuntu/
[8]: https://itsfoss.com/cant-install-deb-file-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/install-opera-ubuntu.png?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/opera-source-added.png?ssl=1
[11]: https://itsfoss.com/install-chrome-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/remove-opera-browser-ubuntu.png?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/remove-opera-repository.png?ssl=1
[14]: https://itsfoss.com/install-curl-ubuntu/
[15]: https://itsfoss.com/install-snap-linux/
