#screenFetch: 命令行信息截图工具

[screenFetch](https://github.com/KittyKatt/screenFetch) 是一个“命令行信息截图工具”。它可以在终端上显示系统信息，并进行桌面截图。它能生成漂亮的文本的系统信息和ASCII艺术的发行版LOGO，然后显示在截屏图片中。

它会自动检测你的发行版并显示其ASCII版本的LOGO，在其右侧显示系统信息。可以通过选项来指定是否显示LOGO、指定颜色，进行截图，甚至可以自定义截图的命令。screenFectch非常容易添加和扩展。

screenFetch将显示以下系统信息：

- 当前登录用户
- 操作系统版本
- 内核版本
- 总计运行时间
- 已安装包数量
- 当前shell详情
- 当前屏幕分辨率
- 当前桌面环境
- 当前窗口管理器（文件管理器）
- 总计及空闲磁盘使用百分比
- CPU详情，如处理器速度、类型
- 总计及当前内存使用量

###在Linux上安装screenFectch

您可以通过直接从项目页下载源码包的方式安装，或者从screenFetch git库克隆。

源码安装：

下载 [最新版](http://git.silverirc.com/cgit.cgi/screenfetch.git/). 我下载并安装在/home/sk/Downloads目录.

用命令解压：

	$ unzip Downloads/screenfetch-3.1.0.zip

进入screenFectch目录，并设置执行权限.

	$ cd screenfetch-3.1.0/
	$ chmod +x screenfetch-dev

在命令行运行：

	$ ./screenfetch-dev

输出示例：

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/sk@sk-screenfetch-3.1.0_008.png)

###通过git库安装

首先确认你是否安装了git.

如果没有安装，基于RHEL系统的用户用以下命令安装：

	# yum install git

基于Debian系统的用户用以下命令安装:

	# apt-get install git

使用命令克隆screenFectch库:

	# git clone git://github.com/KittyKatt/screenFetch.git screenfetch

复制文件到/usr/bin/目录，并设置执行权限:

	# cp screenfetch/screenfetch-dev /usr/bin/screenfetch
	# chmod +x /usr/bin/screenfetch

运行screenFectch:

	# screenfetch

您将会看到如上面截图所示的结果.


via: http://www.unixmen.com/screenfetch-bash-screenshot-information-tool/
