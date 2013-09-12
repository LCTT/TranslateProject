#screenFetch: BASH 截图信息工具

[screenFetch](https://github.com/KittyKatt/screenFetch) 是一个“Bash截图信息工具”。在linux桌面截图终端提取系统/主题信息。它可以被用来生成漂亮的终端主题信息，在每个人截图中看到当前的ASCII分部徽标.

它将自动检测你的布局并且在右边显示其ASCII版本的logo和一些有价值的信息。有选项来指定没有字符插图、颜色，在显示信息之上捕获截图，甚至可以自定义截图命令。screenFectch非常容易添加和扩展.

screenFetch将显示以下详情：

- 当前登录用户
- 操作系统版本
- 内核版本
- 总计运行时间
- 未安装的软件包
- 当前shell详情
- 当前屏幕分辨率
- 当前桌面环境
- 当前窗口管理器（文件管理器）
- 合计及空闲磁盘使用百分比
- CPU详情，如处理器速度、类型
- 总计及当前内存使用量

###在linux上安装screenFectch

您可以通过直接从项目页下载源码包的方式安装，或者从screenFetch git库复制。

源码安装：

下载 [最新版](http://git.silverirc.com/cgit.cgi/screenfetch.git/). 我下载和安装在/home/sk/Downloads目录.

用命令解压：

	$ unzip Downloads/screenfetch-3.1.0.zip

进入screenFectch目录，并设置执行权限.

	$ cd screenfetch-3.1.0/
	$ chmod +x screenfetch-dev

用命令运行：

	$ ./screenfetch-dev

输出示例：

	sk@sk: ~-screenfetch-3.1.0_008

###通过git仓库安装

首先确认你安装了git.

如果没有安装，基于RHEL系统的用户用以下命令安装：

	# yum install git

基于Debian系统的用户用以下命令安装:

	# apt-get install git

使用命令复制screenFectch库:

	# git clone git://github.com/KittyKatt/screenFetch.git screenfetch

复制文件到/usr/bin/目录 并设置执行权限:

	# cp screenfetch/screenfetch-dev /usr/bin/screenfetch
	# chmod +x /usr/bin/screenfetch

运行screenFectch:

	# screenfetch

您将会看到如上面截图所示的结果.
有问题请查阅我们的Q/A论坛：http://ask.unixmen.com/

via: http://www.unixmen.com/screenfetch-bash-screenshot-information-tool/
