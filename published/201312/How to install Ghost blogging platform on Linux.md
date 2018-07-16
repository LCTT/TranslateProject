如何在Linux平台上安装Ghost博客平台
===
[Ghost][1]是一个相对较新的博客发布平台，它开始于众筹平台kickstarter上一个[£25,000英镑的众筹项目][2]。尽管WordPress依然是网上主流的博客工具，但它现在已然是一个拥有众多第三方开发功能的通用内容管理平台，发展到现在已经逐渐变得笨重、复杂以至于难以维护。但与此同时，仅仅诞生才几个月的Ghost坚持以用户为中心，打造精雕细琢的用户界面，承诺要做一个纯粹的博客平台。

在本教程中，我将描述**如何在Linux中设置Ghost博客平台**。

###在Linux上安装Ghost

Ghost是使用Node.js框架编写的。因此，首先你需要在你的Linux系统上[安装Node.js框架][3]。确保Node.js的版本为0.10或者更高。接下来，登录入[http://ghost.org][1](需要注册)，然后下载Ghost的源代码。记着按照下面的步骤安装：
	
	$ sudo mkdir -p /var/www/ghost
	$ sudo unzip ghost-0.3.3.zip -d /var/www/ghost
	$ cd /var/www/ghost
	$ sudo npm install --production

###启动前先配置Ghost
在你启动Ghost之前，按照下面的步骤在/var/www/ghost/config.js位置创建它的配置文件。使用你的主机IP地址替换掉“YOUR_IP”。

	$ cd /var/www/ghost
	$ sudo cp config.example.js config.js
	$ sudo sed -i 's/127.0.0.1/YOUR_IP/g' config.js

###以开发者模式尝试运行Ghost

搞到这一步，你就可以准备去启动Ghost咯。

要注意的是，Ghost可以以两种不同的模式运行：“开发者模式”和“用户模式”。为了安全起见，Ghost将两种模式的配置文件（/var/www/ghost/config.js）分开存放。例如，两种不同的模式使用不同的数据库文件（例如位于/var/www/content/data的ghostdev.db和ghost.db）。

使用以下命令就可以启动Ghost。Ghost默认以开发者模式运行。

	$ cd /var/www/ghost
	$ sudo npm start

Ghost成功运行后，终端中会有以下输出信息，告诉你Ghost正运行在<YOUR_IP>:2368（译者注：2368为端口号）。

[![](http://farm8.staticflickr.com/7317/10881189204_d714f11321_z.jpg)][4]

在你本机的浏览器中键入 http://<YOUR_IP>:2368，身份校验后你就会看到Ghost的初始页面。

[![](http://farm4.staticflickr.com/3750/10881348733_f77d220de6_z.jpg)][5]

###以用户身份启动Ghost

在你确认Ghost运行完好后，按下Ctrl+C停用开发者模式下的Ghost。现在你就可以在用户模式下启动Ghost咯。当你以用户模式运行Ghost时，你就可以使用Node.js呼叫forever模块了，forever模块允许你以守护进程运行Ghost，还可以让你以后台进程运行Ghost。

安装forever模块：

	$ sudo npm install forever -g

最后，你就可以以用户模式像下面这样运行Ghost：

	$ cd /var/www/ghost
	$ sudo NODE_ENV=production forever start index.js

检查一下Ghost的数据库文件是否成功以用户模式创建（/var/www/ghost/content/ghost.db）。

你也可以检查一下forever活动进程列表：

	$ sudo forever list
	
-

     info:    Forever processes running
     data:        uid  command         script   forever pid   logfile                     uptime
     data:    [0] cH0O /usr/bin/nodejs index.js 15355   15357 /home/dev/.forever/cH0O.log 0:0:0:37.741 

假如你看到以上信息，意味着Ghost已经成功以后台进程运行咯。

想停止Ghost守护进程，可以运行以下命令：
	
	$ cd /var/www/ghost
	$ sudo forever stop index.js

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/install-ghost-blogging-platform-linux.html

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://ghost.org/
[2]:http://www.kickstarter.com/projects/johnonolan/ghost-just-a-blogging-platform
[3]:http://ask.xmodulo.com/install-node-js-linux.html
[4]:http://www.flickr.com/photos/xmodulo/10881189204/
[5]:http://www.flickr.com/photos/xmodulo/10881348733/
