[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Take to the virtual skies with FlightGear)
[#]: via: (https://opensource.com/article/19/1/flightgear)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

使用 FlightGear 进入虚拟天空
======
你梦想驾驶飞机么？试试开源飞行模拟器 FlightGear 吧。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/flightgear_cockpit_plane_sky.jpg?itok=LRy0lpOS)

如果你曾梦想驾驶飞机，你会喜欢 [FlightGear][1] 的。它是一个功能齐全的[开源][2]飞行模拟器，可在 Linux、MacOS 和 Windows 中运行。

FlightGear 项目始于 1996 年，原因是对商业飞行模拟程序的不满，因为这些程序无法扩展。它的目标是创建一个复杂、强大、可扩展、开放的飞行模拟器框架，来用于学术界和飞行员培训，或者任何想要玩飞行模拟场景的人。

### 入门

FlightGear 的硬件要求适中，包括支持 OpenGL 以实现平滑帧速的加速 3D 显卡。它在我的配备 i5 处理器和仅 4GB 的内存的 Linux 笔记本上运行良好。它的文档包括[在线手册][3]、一个包含[用户][5]和[开发者][6]门户的 [wiki][4]，还有大量的教程（例如它的默认飞机 [Cessna 172p][7]）教你如何操作它。

在 [Fedora][8]和 [Ubuntu][9] Linux 中很容易安装。Fedora 用户可以参考 [Fedora 安装页面][10]来运行 FlightGear。

在 Ubuntu 18.04 中，我需要安装一个仓库：

```
$ sudo add-apt-repository ppa:saiarcot895/flightgear
$ sudo apt-get update
$ sudo apt-get install flightgear
```

安装完成后，我从 GUI 启动它，但你也可以通过输入以下命令从终端启动应用：

```
$ fgfs
```

### 配置 FlightGear

应用窗口左侧的菜单提供配置选项。

![](https://opensource.com/sites/default/files/uploads/flightgear_menu.png)

**Summary** 返回应用的主页面。

**Aircraft** 显示你已安装的飞机，并提供了 FlightGear 的默认“机库”中安装多达 539 种其他飞机的选项。我安装了 Cessna 150L、Piper J-3 Cub 和 Bombardier CRJ-700。一些飞机（包括 CRJ-700）有教你如何驾驶商用喷气式飞机的教程。我发现这些教程内容翔实且准确。

![](https://opensource.com/sites/default/files/uploads/flightgear_aircraft.png)

要选择驾驶的飞机，请将其高亮显示，然后单击菜单底部的 **Fly!**。我选择了默认的 Cessna 172p 并发现驾驶舱的刻画非常准确。

![](https://opensource.com/sites/default/files/uploads/flightgear_cockpit-view.png)

默认机场是檀香山，但你在 **Location** 菜单中提供你最喜欢机场的 [ICAO 机场代码] [11]进行修改。我找到了一些小型的本地无塔机场，如 Olean 和 Dunkirk，纽约，以及包括 Buffalo，O'Hare 和 Raleigh 在内的大型机场，甚至可以选择特定的跑道。

在 **Environment** 下，你可以调整一天中的时间、季节和天气。模拟包括高级天气建模和从 [NOAA][12] 下载当前天气的能力。

**Settings** 提供在暂停模式中开始模拟的选项。同样在设置中，你可以选择多人模式，这样你就可以与 FlightGear 支持者的全球服务器网络上的其他玩家一起“飞行”。你必须有比较快速的互联网连接来支持此功能。

**Add-ons** 菜单允许你下载飞机和其他场景。

### 开始飞行

为了“起飞”我的 Cessna，我使用了罗技操纵杆，它用起来不错。你可以使用顶部 **File** 菜单中的选项校准操纵杆。

总的来说，我发现模拟非常准确，图形界面也很棒。你自己试下 FlightGear  - 我认为你会发现它是一个非常有趣和完整的模拟软件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/flightgear

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: http://home.flightgear.org/
[2]: http://wiki.flightgear.org/GNU_General_Public_License
[3]: http://flightgear.sourceforge.net/getstart-en/getstart-en.html
[4]: http://wiki.flightgear.org/FlightGear_Wiki
[5]: http://wiki.flightgear.org/Portal:User
[6]: http://wiki.flightgear.org/Portal:Developer
[7]: http://wiki.flightgear.org/Cessna_172P
[8]: http://rpmfind.net/linux/rpm2html/search.php?query=flightgear
[9]: https://launchpad.net/~saiarcot895/+archive/ubuntu/flightgear
[10]: https://apps.fedoraproject.org/packages/FlightGear/
[11]: https://en.wikipedia.org/wiki/ICAO_airport_code
[12]: https://www.noaa.gov/
