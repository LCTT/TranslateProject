[#]: subject: (Meet SysMonTask: A Windows Task Manager Lookalike for Linux)
[#]: via: (https://itsfoss.com/sysmontask/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Meet SysMonTask: A Windows Task Manager Lookalike for Linux
======

Thanks to the desktop environments, almost all [Linux distributions come with a task manager application][1]. In addition to that, there are [several other system monitoring applications for Linux][2] that have additional features.

But recently I came across a task manager created for Linux that looks like … wait for it … the task manager of Windows.

You take a look at it and decide for yourself.

![][3]

Personally, I am not sure if the likeness in the user interface is such a big deal but the developer and probably some other Linux users might disagree with me.

### SysMonTask: A system monitor with the looks of Windows task manager

![][4]

The open source software, [SysMonTask][5], describes itself as a “Linux system monitor with the compactness and usefulness of windows task manager to allow higher control and monitoring”.

Coded in Python, SysMonTask boasts of the following features:

  * System monitoring graphs.
  * Shows stats for CPU, Memory, Disks, Network adapters, single Nvidia GPU.
  * Support for listing mounted disks was added in recent version.
  * User Processess tab can do process filtering, show recursive-CPU, recursive-Memery and aggregate values on coloumn headers.
  * You can, of course, kill a process from the processes tab.
  * Also supports system themes (dark and light).



### Experience with SysMonTask

SysMonTask needs elevated privileges. You’ll be asked for your admin password when you launch it. I don’t like a task manager running with sudo all the time but that’s just my preference.

I played with a little to explore its features. The disk usage was pretty constant so I copied a 10 GB file from external SSD to my laptop’s disk a couple of times. You can see the spikes corresponding to the file transfer.

![][6]

The process tab is also handy. It shows the accumulated resource utilization on the top of the columns.

The kill button is added at the bottom so all you have to do is to select a process and hit the ‘Killer’ button. It asks for your conformation before [killing the process][7].

![][8]

### Installing SysMonTask on Linux distributions

For a simple application, it downloads 50 MB of archive files and takes around 200 MB on the disk. I think it is because of the Python dependencies.

One more thing is that since it reads the env

At the moment of writing this article, SysMonTask is available for Ubuntu-based distributions via [PPA][9].

On an Ubuntu-based distribution, open a terminal and use the following command to add the PPA repository:

```
sudo add-apt-repository ppa:camel-neeraj/sysmontask
```

You’ll be asked to enter your password, of course. On newer versions, the repository list is automatically updated. So, you can install the application straightaway:

```
sudo apt install sysmontask
```

Debian-based distributions may also try to install it from the deb file. It can be found at the release page.

There is no ready-to-use package for other distributions. Whayt surprises me is that it is basically a Python application so a PIP installer could have been added for other distributions. Perhaps the developers will add it in the future version.

Since it is open source software, you can always get the source code.

[SysMonTask Deb files and Source Code][10]

Once installed, look for SysMonTask in the menu and start it from there.

#### Remove SysMonTask

If you want to remove it, use the following command:

```
sudo apt remove sysmontask
```

It will be a good idea to [delete the PPA][11] as well:

```
sudo add-apt-repository -r ppa:camel-neeraj/sysmontask
```

You may also [use PPA Purge][12] tool here which is a handy utility for dealing with PPA application removal.

### Would you try it?

For me, the features are more important than the looks. SysMonTask does have the additional feature of monitoring disk performance and checking GPU stats which is something other system monitors usually do not include.

If you try and like it, perhaps you’ll like to add Ctrl+Alt+Del shortcut to launch SysMonTask to get the complete feel :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/sysmontask/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/task-manager-linux/
[2]: https://itsfoss.com/linux-system-monitoring-tools/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/sysmontask-1.png?resize=800%2C559&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/SysMonTask-CPU.png?resize=800%2C537&ssl=1
[5]: https://github.com/KrispyCamel4u/SysMonTask
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/sysmontask-disk-usage.png?resize=800%2C498&ssl=1
[7]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/kill-process-sysmontask.png?resize=800%2C500&ssl=1
[9]: https://itsfoss.com/ppa-guide/
[10]: https://github.com/KrispyCamel4u/SysMonTask/releases
[11]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[12]: https://itsfoss.com/ppa-purge/
