Linux终端：speedtest_cli检测你的实时带宽速度
===

![](http://www.speedtest.net/result/3700218352.png)

你在家（或者办公室）的上传和下载速度如何？你能保证，你支付费用给ISP的同时得到了等价的回报？

要想测试我们因特网连接的速度，当下存在着一些因特网服务，比如说SpeedTest，这是一种可以通过Web浏览器和手机应用程序浏览的web服务。

现在，你可以很容易地检测你的网速，使用speedtest_cli同样很简单，它是一个使用[speedtest.net][2]来测试因特网[带宽][1]的命令行界面。通过这种方式，你也可以在没有浏览器或者图形化界面的服务器上做带宽测试。

### 安装 ###

speedtest_cli是一个python脚本，所以它真的很容易安装和使用，你可以通过许多方式安装它：

#### 1）pip / easy_install ####

打开一个终端，输入下面的命令：

	pip install speedtest_cli

或者

	easy_install speedtest_cli

#### 2）Github ####

想要直接从github安装，你得这么做：

	pip install git+https://github.com/sivel/speedtest-cli.git

或者
 
	git clone https://github.com/sivel/speedtest-cli.git
	python speedtest-cli/setup.py install

#### 3）作为Ubuntu/Debian或者Mint包 ####

getdeb仓库给我们提供了[安装包][3]，按照下面的步骤，就可以轻松安装：

- 安装[getdeb包][4]

或者

- 手动配置仓库：

进入系统管理软件源，第三方软件选项，加上：

	deb http://archive.getdeb.net/ubuntu trusty-getdeb apps

增加仓库GPG钥匙，打开终端窗口，然后输入：

	wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

现在，你就可以使用下面的命令安装speedtest_cli包了：

	sudo apt-get update
	sudo apt-get install python-speedtest-cli

#### 4）下载（和以前的方式一样） ####

最后一个选择，只需要下载python脚本，然后在你想运行的地方运行脚本：

	wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
	chmod +x speedtest-cli

或者

	curl -o speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
	chmod +x speedtest-cli

### 基本用法 ###

你可以不带任何选项地运行speedtest_cli.py，然后你会在终端获得关于你带宽速度的报告，这就是我那糟糕的意大利Adsl输出： 

	$ ./speedtest_cli.py
	Retrieving speedtest.net configuration...
	Retrieving speedtest.net server list...
	Testing from Telecom Italia (87.13.73.66)...
	Selecting best server based on latency...
	Hosted by LepidaSpA (Bologna) [12.20 km]: 104.347 ms
	Testing download speed........................................
	Download: 6.35 Mbits/s
	Testing upload speed...............................................
	Upload: 0.34 Mbits/s

这就是基本用法，这足以让你知道你因特网连接的好坏，但是可能你想要和朋友分享这条信息，那么，只需要-share选项就可以

	./speedtest_cli.py --share
	Retrieving speedtest.net configuration...
	Retrieving speedtest.net server list...
	Testing from Telecom Italia (87.13.73.66)...
	Selecting best server based on latency...
	Hosted by LepidaSpA (Bologna) [12.20 km]: 93.778 ms
	Testing download speed........................................
	Download: 6.20 Mbits/s 
	Testing upload speed...............................................
	Upload: 0.33 Mbits/s
	Share results: http://www.speedtest.net/result/3700218352.png

这将会产生一个类似于下面的图像（但是我希望你图像里面的值更好）：

	![](http://www.speedtest.net/result/3700218352.png)

另一个有趣的选项是-list，它会按照距离列出所有speedtest.net服务器，下面是我运行的结果：

	Retrieving speedtest.net configuration...
	Retrieving speedtest.net server list...
	2872) LepidaSpA (Bologna, Italy) [12.20 km]
	1561) MYNETWAY S.R.L. (Cesena, Italy) [80.97 km]
	2710) ReteIVO by D.t.s. Srl (Florence, Italy) [90.90 km]
	4826) Inteplanet Srl (Verona, Italy) [100.45 km]
	3998) Wolnext srl (Verona, Italy) [100.45 km]
	2957) Wifiweb s.r.l. (Altavilla Vicentina, Italy) [103.11 km]
	3103) E4A s.r.l. (Vicenza, Italy) [107.17 km]
	3804) Interplanet Srl (Vicenza, Italy) [107.17 km]
	1014) NTRnet (Vicenza, Italy) [107.17 km]
	3679) Hynet s r l (Vicenza, Italy) [107.17 km]
	3745) Comeser Srl (Fidenza, Italy) [114.00 km]
	5011) Welcomeitalia spa (Massarosa, Italy) [119.26 km]
	2864) ReteIVO by D.t.s. Srl (Massa, Italy) [120.92 km]
	2918) ReteIVO by D.t.s. Srl (Arezzo, Italy) [129.79 km]
	...

既然我知道了围绕在我周围的服务器的ID，我可以使用-server选项选择一个特定的服务器，所以，要想选择位于佛罗伦萨（ID 2710）的服务器，我使用下面的命令：

	./speedtest_cli.py --server 2710
	Retrieving speedtest.net configuration...
	Retrieving speedtest.net server list...
	Testing from Telecom Italia (87.13.73.66)...
	Hosted by ReteIVO by D.t.s. Srl (Florence) [90.90 km]: 106.505 ms
	Testing download speed........................................
	Download: 6.18 Mbits/s 
	Testing upload speed..............................................
	Upload: 0.35 Mbits/s

文章由[Asapy Programming Company][5]发表

---

via: http://linuxaria.com/howto/linux-terminal-speedtest_cli-checks-your-real-bandwidth-speed

译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxaria.com/article/tool-command-line-bandwidth-linux 
[2]:http://linuxaria.com/howto/speedtest.net
[3]:http://www.getdeb.net/
[4]:http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
[5]:http://www.asapy.com/

