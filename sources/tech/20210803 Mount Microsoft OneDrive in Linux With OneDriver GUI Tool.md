[#]: subject: (Mount Microsoft OneDrive in Linux With OneDriver GUI Tool)
[#]: via: (https://itsfoss.com/onedriver/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Mount Microsoft OneDrive in Linux With OneDriver GUI Tool
======

On Windows, Microsoft provides a [free cloud storage service][1] in the form of OneDrive. It comes integrated with Windows and you get 5 GB of free storage with your Microsoft account.

This works great on Windows but like Google, Microsoft also does not provide a native client for OneDrive on Linux desktop.

You can access your OneDrive data through browser, of course. In addition to that, there are some other ways to access OneDrive on Linux.

You can use a premium service like [Insync][2] or opt for a slightly more complicated command line approach with [rclone to use OneDrive on Linux][3].

Recently, I came across another tool that is slightly different and slightly easier to use. It’s unsurprisingly called OneDriver.

### OneDriver: Mount OneDrive on your Linux system

![OneDrive Linux illustration][4]

[OneDriver][5] is a free and open source tool that allows you to mount your OneDrive files on your Linux system.

Please keep in mind that it does not sync files in the same way OneDrive does on the Windows system. It mounts the OneDrive files on a local mount point instead. You access the files over the network.

However, it does provide a kind of hybrid approach here. The files you open in the mounted OneDrive also get downloaded on the system. Which means that you can access the opened files offline as well. The files become read-only if you are not connected to the internet.

If you make any changes to files locally, it gets reflected on the OneDrive if you are connected to the internet.

I did notice that in Nautilus file manager on GNOME, it downloads the images present in the current folder automatically. I was under the impression that they will only be downloaded when I open them.

Another thing is that Nautilus builds thumbnail cache initially. OneDriver may feel a little bit slower and resource consuming in the beginning, but it gets better eventually.

Oh! You can also mount multiple OneDrive accounts.

### Installing and using OneDriver

To install OneDriver on Ubuntu 20.04 (and Linux Mint 20 series), you can use this PPA by the developer of OneDriver:

```
sudo add-apt-repository ppa:jstaf/onedriver
sudo apt update
sudo apt install onedriver
```

For Ubuntu 21.04, you may use it by downloading the [DEB file from its PPA][6].

On Fedora, you can add this COPR:

```
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver
```

Arch users can find it in the AUR.

Once you install it, search for OneDriver in the menu and start it from here.

![Search for OneDriver][7]

On the first run, it gives a strange looking empty interface. Click on the + sign and choose a folder or create a new one where you’ll mount the OneDrive. In my case, I created a new folder named One_drive in my home directory.

![Click on + sign to add a mount point for OneDrive][8]

When you have selected the mount point, you will be asked to enter your Microsoft credential.

![one drive login][9]

![one drive permission][10]

Once you are successfully logged in, you can see your files from OneDrive in the mounted directory.

![OneDrive mounted in Linux][11]

Once you have done that, you can see your OneDrive account on the application interface. Click on the toggle button beside it to autostart OneDrive mounting after restart.

![Autostart OneDriver mounting][12]

Overall, OneDriver is a nice free utility for accessing OneDrive on Linux. It may not provide the complete sync facility like the [premium Insync service][13] but it works fine for limited needs.

If you use this nifty tool, do share your experience with it. If you like project, maybe give it a [star on GitHub][5].

--------------------------------------------------------------------------------

via: https://itsfoss.com/onedriver/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://itsfoss.com/use-onedrive-on-linux/
[3]: https://itsfoss.com/use-onedrive-linux-rclone/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-linux.png?resize=800%2C450&ssl=1
[5]: https://github.com/jstaf/onedriver
[6]: https://launchpad.net/~jstaf/+archive/ubuntu/onedriver/+packages
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/search-for-onedriver.png?resize=798%2C214&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/onedriver-interface.png?resize=745%2C456&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-login.png?resize=470%2C660&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-permission.png?resize=470%2C660&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-mounted-in-linux.png?resize=800%2C491&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/auto-start-onedriver.png?resize=602%2C499&ssl=1
[13]: https://itsfoss.com/recommends/insync/
