如何为Linux系统中的SSH添加双重认证
================================================================================
近来很多知名企业都出现了密码泄露，业内对多重认证的呼声也越来越高。在这种多重认证的系统中，用户需要通过两种不同的认证程序：提供他们知道的信息（如 用户名/密码），再借助其他工具提供用户所不知道的信息（如 用手机生成的一次性密码）。这种组合方式常叫做双因子认证或者两阶段验证。

为了鼓励广泛采用双因子认证的方式，Google公司发布了[Google Authenticator][1]，一款开源的，可基于开放规则（如 HMAP/基于时间）生成一次性密码的软件。这是一款跨平台软件，可运行在Linux, [Android][2], [iOS][3]。Google公司同时也支持插件式鉴别模块PAM(pluggable authentication module)，使其能和其他也适用PAM进行验证的工具（如OpenSSH）协同工作。

在本教程中，我们将叙述集成OpenSSH和Google提供的认证器实现**如何为SSH服务设置双因子认证**。我将使用一款[Android][4]设备来生成一次性密码，本教程中需要两样武器：(1)一台运行着OpenSSH服务的Linux终端，(2)一台安卓设备。

### 在Linux系统中安装Google Authenticator ###

第一步需要在运行着OpenSSH服务的Linux主机上安装Google认证器。按照如下步骤安装Google认证器及其PAM模块。

#### 用安装包安装 Google Authenticator ####

如果你不想自己构建  Google Authenticator，在几个 Linux 发行版上有已经编译好的安装包。安装包里面包含 Google Authenticator 二进制程序和 PAM 模块。

在 Ubuntu 上安装  Google Authenticator：

	$ sudo apt-get install libpam-google-authenticator

在 Fedora 上安装 Google Authenticator：

	$ sudo yum install google-authenticator

在 CentOS 上安装 Google Authenticator ，需要首先启用 EPEL 软件库，然后运行如下命令：

	$ sudo yum install google-authenticator

如果不想使用已经编译好的安装包，或者你的 Linux 发行版不在此列，可以自行编译：

#### 在 Linux 上 Google Authenticator ####

首先，安装构建 Google Authenticator 所需的软件包。

在 Debian、 Ubuntu 或 Linux Mint 上：

	$ sudo apt-get install wget make gcc libpam0g-dev

在 CentOS、 Fedora 或 RHEL上：

	$ sudo yum install wget make gcc pam-devel

然后下载 Google Authenticator 的源代码，并按如下命令编译。

	$ wget https://google-authenticator.googlecode.com/files/libpam-google-authenticator-1.0-source.tar.bz2
	$ tar xvfvj libpam-google-authenticator-1.0-source.tar.bz2
	$ cd libpam-google-authenticator-1.0
	$ make

如果构建成功，你会在目录中看到 pam_google_authenticator.so 和 google-authenticator 两个文件。

最后，将  Google Authenticator 安装到合适位置

	$ sudo make install


#### 排错 ####

当编译  Google Authenticator 时出现如下错误：

	fatal error: security/pam_appl.h: No such file or directory

要修复这个问题，请安装如下依赖包。

在 Debian、 Ubuntu 或 Linux Mint 上：

	$ sudo apt-get install libpam0g-dev

在 CentOS、 Fedora 或 RHEL 上：

	$ sudo yum install pam-devel


当Google认证器安装好后，你需要在Linux主机上创建验证密钥，并且在安卓设备上注册，注意这项配置操作是一次性的。我们将详细叙述如何完成这些操作：

### 生成验证密钥 ###

在Linux主机上运行Google认证器

    $ google-authenticator 

你将看到一个QR码，它使用如下图形表示我们数字形态的密钥。一会我们要用到它在安卓设备上完成配置。

![](https://farm4.staticflickr.com/3843/14573264401_d3f5a2f247_z.jpg)
![](https://farm4.staticflickr.com/3848/14390010599_18dfc23d76_z.jpg)

Google认证器会问一些问题，如果你不确定，就回答"Yes"。这个应急备用验证码(图中 emergency scratch codes）可以在你由于丢失了绑定的安卓设备的情况下（所以不能得到生成的一次性密码）恢复访问。最好将应急备用验证码妥善保存。

### 在安卓设备上运行Google认证器 ###

我们需要在安卓设备上安装[Google Authenticator app][6]才能完成双因子认证，到Google Play下载并安装一个。在安卓设备上运行Google认证器，找到下图所示中的配置菜单。

![](https://farm6.staticflickr.com/5574/14554094476_bfc070d242_z.jpg)

你可以选择"Scan a barcode" 或者"Enter provided key"选项。"Scan a barcode"允许你扫描QR码来完成密钥的输入，在此可能需要先安装扫描软件[Barcode Scanner app][7]。如果选择"Enter provided key"选项，你可以使用键盘输入验证密钥，如下图所示：

![](https://farm6.staticflickr.com/5535/14596723603_d510dbe48d_z.jpg)

无论采用上述两种选项的任何方式，一旦成功，你将看到注册成功提示和一次性密码，如下图所示：

![](https://farm6.staticflickr.com/5586/14390009579_5ba109bf5b_z.jpg)

### 为SSH服务器用Google认证器 ###

最终我们需要修改两个文件来完成集成Google认证器和OpenSSH服务这临门一脚。

首先，修改PAM配置文件，命令和需添加的内容如下：

    $ sudo vi /etc/pam.d/sshd 

----------

    auth required pam_google_authenticator.so

然后打开SSH配置文件，找到参数ChallengeResponseAuthentication，并启用它。

    $ sudo vi /etc/ssh/sshd_config 

----------

ChallengeResponseAuthentication yes


最后，重启SSH服务。

在 Ubuntu、 Debian 和 Linux Mint 上：

    $ sudo service ssh restart 

在Fedora （或 CentOS/RHEL 7）上：

    $ sudo systemctl restart sshd 

在CentOS 6.x或 RHEL 6.x上：

    $ sudo service sshd restart 

### 验证双因子认证 ###

在绑定的安卓设备上运行Google认证器，获得一个一次性验证码，该验证码30秒内有效，一旦过期，将重新生成一个新的验证码。

![](https://farm3.staticflickr.com/2937/14389989618_d9355dcbb2_z.jpg)

现在和往常一样，使用SSH登录终端

    $ ssh user@ssh_server 

当提示你输入验证码的时候，输入我们刚获得的验证码。验证成功后，再输入SSH的登录密码。

![](https://farm3.staticflickr.com/2938/14389952480_93351f12a4_z.jpg)

双因子认证通过在用户密码前新增一层来有效的保护我们脆弱的用户密码。你可以使用Google认证器来保护我们其他的密码，如Google账户, WordPress.com, Dropbox.com, Outlook.com等等。是否使用这项技术，取决于我们自己，但采用双因子认证已经是行业的大趋势了。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/two-factor-authentication-ssh-login-linux.html

译者：[nd0104](https://github.com/nd0104) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://code.google.com/p/google-authenticator/
[2]:https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2
[3]:https://itunes.apple.com/us/app/google-authenticator/id388497605
[4]:http://xmodulo.com/go/android_guide
[5]:http://ask.xmodulo.com/install-google-authenticator-linux.html
[6]:https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2
[7]:https://play.google.com/store/apps/details?id=com.google.zxing.client.android
