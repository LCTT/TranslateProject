怎样在 Ubuntu 14.10 Server 上安装 Cacti
================================================================================

Cacti 是一个完善的网络监控的图形化解决方案，它被设计用来发挥 RRDTool （一个 Linux 数据存储和绘图工具）的数据存储和绘图的强大功能。Cacti 提供一个快速的轮询器，高级的绘图模版，多种数据获取方法和用户管理功能，并且可以开箱即用。所有的这些都被打包进一个直观，易用的界面，可用于监控简单的 LAN 网络，乃至包含成百上千设备的复杂网络。

### 功能 ###

#### 绘图 ####

没有数量限制的监控图条目（graph item），每个图形可以视情况使用 Cacti 中的 CDEFs （Calculation Define，可以对图形输出结果进行计算）或者数据源。

自动将 GPRINT 条目分组至 AREA，STACK 和 LINE[1-3] 中，来对监控图条目进行快速重排序。

自动填充功能支持整齐排列图形内的说明项。

可以使用 RRDTool 中内置的 CDEF 数学函数对图形数据进行处理。这些 CDEF 函数可以定义在 Cacti 中，并且每一个图形都可以使用它们。

支持所有的 RRDTool 图形类型，包括 AREA，STACK，LINE[1-3]，GPRINT，COMMENT，VRULE 和 HRULE。

#### 数据源 ####

数据源可以使用 RRDTool 的 "create" 和 "update" 功能创建。每一个数据源可以用来收集本地或者远程的数据，并将数据输出成图形。

支持包含多个数据源的 RRD 文件，并可以使用存储在本地文件系统中任何位置的 RRD 文件。

可以自定义轮询归档（RRA）设置，用户可以在存储数据时使用非标准的时间间隔（标准时间间隔是5分钟，30分钟，2小时和 1天）。

#### 数据收集 ####

Cacti 包含一个 "data input" 机制，可以让用户定义自定义的脚本用来收集数据。每个脚本可以包含调用参数，每次调用此脚本的创建数据源时必须输入相应的调用参数（如 IP 地址）。

支持 SNMP 功能，可以使用 php-snmp，ucd-snmp 或者 net-snmp。

可以基于索引来使用 SNMP 或者脚本收集数据。例如，可以列出一个服务器上所有网卡接口或者已挂载分区的索引列表。其集成的绘图模版可以用来为主机一键创建图形。

提供了一个基于 PHP 的轮询器执行脚本，可以收集 SNMP数据并更新数据至 RRD 文件中。

#### 模版 ####

绘图模版可以将相同图形分组到为一类。图形中的每一个条目都可以使用模版的默认值或者自定义。

数据源模版可以通过将相同数据源类型分组为一类。数据源中每一个条目都可以使用模版的默认值或者自定义。

主机模版是一组图形和数据源模版，可以用来定义某一类型的主机。创建主机时，它会自动使用相应模版的属性。

#### 图形展示 ####

图形树模式允许用户创建「图形层次结构」并将图形放至树中。这种方法可以方便的管理大量图形。

列表模式将所有图形的链接在一个大列表中展示出来，链接指向用户创建的图形。

预览模式将所有图形在一个大列表中展示出来。这有点类似于 RRDTool/MRTG 的默认视图。

#### 用户管理 ####

用户管理功能允许管理员创建用户并分配给用户访问 Cacti 接口的不同级别的权限。

权限可以为每个用户指定其对每个图形的权限，这适用于主机租用的场景。

每个用户可以保存他自己的图形显示模式。

### 安装 ###

#### 系统准备 ####

在安装 cacti 之前，确保你已经安装了 [Ubuntu 14.10 LAMP server][1]。

#### 在 Ubuntu 14.10 Server 上安装 Cacti ####

打开终端，运行下面的命令

    sudo apt-get install cacti-spine

上面的命令开始 Cacti 的安装，你会看到下图中 PHP 路径的更改，选择 ok 按回车

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/18.png)

选择你想使用的 Web 服务器 (我使用的是 apache2)

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/27.png)

Cacti 数据库配置，选 yes

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/35.png)

输入数据库管理员账户密码

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/42.png)

输入 Cacti 访问数据库的密码

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/5.png)

确认密码

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/6.png)

现在 Cacti 已经安装了，我们可以开始配置它了。

#### Cacti 配置 ####

在浏览器中访问  http://你的服务器IP/cacti/install/  来进行初始化设置，点击 next 下一步

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/7.png)

选择 New install，点击 next 下一步

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/8.png)

下一个界面中，你需要确保所有的路径都是正确的，点击 finish 完成

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/9.png)

现在以 admin/admin 登录 Cacti，修改管理员的默认密码

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/10.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2014/01/111.png)

登录 Cacti 之后你会看到类似于下面这样的界面

![](http://www.ubuntugeek.com/wp-content/uploads/2014/11/14.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/how-to-install-cacti-monitoring-tool-on-ubuntu-14-10-server.html

作者：[ruchi][a]
译者：[Liao](https://github.com/liaoishere)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.ubuntugeek.com/www.ubuntugeek.com/step-by-step-ubuntu-14-10-utopic-unicorn-lamp-server-setup.html
