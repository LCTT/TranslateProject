#screenFetch: BASH 截图信息工具

[screenFetch](https://github.com/KittyKatt/screenFetch) 是一个“bash截图信息工具”。在linux桌面终端上抓取系统/主题信息。它可以被用来生成漂亮的终端主题+在每个人截图中看到当前的ASCII分部徽标.

它将自动检测你的布局并且在右边显示其ASCII版本的logo和一些有价值的信息。有选项来指定没有字符插图，颜色，在显示信息之上捕获截图，甚至可以自定义截图命令。screenFectch非常容易添加且可以轻易的扩展.

screenFetch 将显示以下详情：

- 当前登录用户
- 系统版本
- 内核版本
- 总计运行时间
- 没有安装的软件包
- 当前shell详情
- 当前屏幕分辨率
- 当前桌面环境
- 当前窗口管理器（文件管理器）
- 合计和空闲磁盘使用百分比
- CPU详情，例如，处理器速度，类型
- 当前内存使用量

###在linux上安装screenFectch

你可以从项目页直接下载或从git仓库复制任一方式安装.

源码安装：

下载 [最新版](http://git.silverirc.com/cgit.cgi/screenfetch.git/). 我下载和安装在/home/sk/Downloads目录.

用命令解压：

	$ unzip Downloads/screenfetch-3.1.0.zip

进入screenFectch目录，并设置执行权限.

	$ cd screenfetch-3.1.0/
	$ chmod +x screenfetch-dev

运行：

	$ ./screenfetch-dev

输出示例：

	sk@sk: ~-screenfetch-3.1.0_008

###通过git仓库安装

首先确认你安装了git.

如果没有安装，基于RHEL系统的用以下命令安装.

	# yum install git

基于Debian系统的用以下命令安装:

	# apt-get install git

使用命令复制screenFectch仓库:

	# git clone git://github.com/KittyKatt/screenFetch.git screenfetch

复制文件到/usr/bin/目录 并设置执行权限:

	# cp screenfetch/screenfetch-dev /usr/bin/screenfetch
	# chmod +x /usr/bin/screenfetch

运行screenFectch:

	# screenfetch

你看到的结果像上面截图所示的.
有问题请查阅我们的Q/A论坛：http://ask.unixmen.com/

via: http://www.unixmen.com/screenfetch-bash-screenshot-information-tool/
