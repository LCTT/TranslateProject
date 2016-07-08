Translating by GitFuture

Monitor Linux With Netdata
===

Netdata is a real-time resource monitoring tool with a friendly web front-end developed and maintained by [FireHOL][1]. With this tool, you can read charts representing resource utilization of things like CPUs, RAM, disks, network, Apache, Postfix and more. It is similar to other monitoring software like Nagios; however, Netdata is only for real-time monitoring via a web interface.


### Understanding Netdata

There’s currently no authentication, so if you’re concerned about someone getting information about the applications you’re running on your system, you should restrict who has access via a firewall policy. The UI is simplified in a way anyone could look at the graphs and understand what they’re seeing, or at least be impressed by your flashy setup.

The web front-end is very responsive and requires no Flash plugin. The UI doesn’t clutter things up with unneeded features, but sticks to what it does. At first glance, it may seem a bit much with the hundreds of charts you have access to, but luckily the most commonly needed charts (i.e. CPU, RAM, network, and disk) are at the top. If you wish to drill deeper into the graphical data, all you have to do is scroll down or click on the item in the menu to the right. Netdata even allows you to control the chart with play, reset, zoom and resize with the controls on the bottom right of each chart.

![](https://fedoramagazine.org/wp-content/uploads/2016/06/Capture-1.png)
>Netdata chart control

When it comes down to system resources, the software doesn’t need too much either. The creators choose to write the software in C. Netdata doesn’t use much more than ~40MB of RAM.

![](https://fedoramagazine.org/wp-content/uploads/2016/06/Capture.png)
>Netdata memory usage

### Download Netdata

To download this software, you can head over to [Netdata GitHub page][2]. Then click the “Clone or download” green button on the left of the page. You should then be presented with two options.

#### Via the ZIP file

One option is to download the ZIP file. This will include everything in the repository; however, if the repository is updated then you will need to download the ZIP file again. Once you download the ZIP file, you can use the `unzip` tool in the command line to extract the contents. Running the following command will extract the contents of the ZIP file into a “`netdata`” folder.

```
$ cd ~/Downloads
$ unzip netdata-master.zip
```

![](https://fedoramagazine.org/wp-content/uploads/2016/06/Capture-2.png)
>Netdata unzipped

ou don’t need to add the `-d` option in unzip because their content is inside a folder at the root of the ZIP file. If they didn’t have that folder at the root, unzip would have extracted the contents in the current directory (which can be messy).

#### Via git

The next option is to download the repository via git. You will, of course, need git installed on your system. This is usually installed by default on Fedora. If not, you can install git from the command line with the following command.

```
$ sudo dnf install git
```

After installing git, you will need to “clone” the repository to your system. To do this, run the following command.

```
$ git clone https://github.com/firehol/netdata.git
```

This will then clone (or make a copy of) the repository in the current working directory.

### Install Netdata

There are some packages you will need to build Netdata successfully. Luckily, it’s a single line to install the things you need ([as stated in their installation guide][3]). Running the following command in the terminal will install all of the dependencies you need to use Netdata.

```
$ dnf install zlib-devel libuuid-devel libmnl-devel gcc make git autoconf autogen automake pkgconfig
```

Once the required packages are installed, you will need to cd into the netdata/ directory and run the netdata-installer.sh script.

```
$ sudo ./netdata-installer.sh
```

You will then be prompted to press enter to build and install the program. If you wish to continue, press enter to be on your way!

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Capture-3-600x341.png)
>Netdata install.

If all goes well, you will have Netdata built, installed, and running on your system. The installer will also add an uninstall script in the same folder as the installer called `netdata-uninstaller.sh`. If you change your mind later, running this script will remove it from your system.

You can see it running by checking its status via systemctl.

```
$ sudo systemctl status netdata
```

### Accessing Netdata

Now that we have Netdata installed and running, you can access the web interface via port 19999. I have it running on a test machine, as shown in the screenshot below.

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Capture-4-768x458.png)
>An overview of what Netdata running on your system looks like

Congratulations! You now have successfully installed and have access to beautiful displays, graphs, and advanced statistics on the performance of your machine. Whether it’s for a personal machine so you can show it off to your friends or for getting deeper insight into the performance of your server, Netdata delivers on performance reporting for any system you choose.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/monitor-linux-netdata/

作者：[Martino Jones][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/monitor-linux-netdata/
[1]: https://firehol.org/
[2]: https://github.com/firehol/netdata
[3]: https://github.com/firehol/netdata/wiki/Installation








