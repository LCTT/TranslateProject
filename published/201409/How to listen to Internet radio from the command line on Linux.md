如何在Linux命令行下收听网络电台
========================================================================

对于花大量时间在Linux屏幕前的系统管理员和Linux爱好者来说，网络/本地电台上的音乐可以极大提高生产力，你们知道吗？不管你们相信与否，，在工作环境中有适当的声音，如音乐或者闲聊声包围，都可以提高我们的创造力。如果你喜欢在音乐环境中工作，这个教程也许会对你有用。我将会向你展示**如何在命令行中收听潘多拉（Pandora）在线电台**（LCTT译注：Pandora Internet Radio是一个仅为美国、澳大利亚和新西兰提供自动音乐推荐的系统。详细介绍[Prandoea电台][1]）

正如你已经知道的，Pandora是最有名的在线电台服务之一，它包含无数的不同种类的免费音乐流，同时它还有一个强大的音乐推荐引擎。Pandora可以通过不同的方式访问，如：浏览器，桌面客户端或者手机Apps，开源社区还给出了另一种访问Pandora音乐服务的方法：Linux命令行。

[pianobar][2]是一个播放Pandora在线电台音乐的开源命令行音乐播放器。它有一个简单的终端接口，用于播放和管理音乐电台。同时还有其他包括歌曲评价，即将上线音乐列表，播放历史，自定义快捷键绑定，远程控制等功能。对于那些居住在不可访问Pandora音乐服务区域的用户（即美国、澳大利亚和新西兰以外的用户），Pianobar还配置了代理服务的支持。

###在Linux中安装Pianobar###

在Debian或者其他Debian的衍生品中，如Ubuntu或LinuxMint，Pianobar是一个已经编译好的软件包，因此安装Pianobar只是简单的输入如下命令：
        $ sudo apt-get install pianobar

在Fedora中，Pianobar并不包含在基础的软件库中。因此，你需要通过源代码编译安装Pianobar。整个安装过程会有点麻烦，但是下面的教程将会实现Pianobar在Frdora系统中编译安装。该教程在Fedora20版本中测试通过。

首先，根据[FFmpeg安装教程][3]编译并安装FFmpeg。

然后，[启用RPM Fusion源][4]，并安装其他依赖软件：

	 $ sudo yum install wget gcc-c++ pkgconfig gnutls-devel json-c-devel libgcrypt-devel make libao-devel faad2-devel libmad-devel libao faad2-libs 

编译并安装Pianobar

	$ wget http://6xq.net/projects/pianobar/pianobar-2014.06.08.tar.bz2
    $ tar xvfvj pianobar-2014.06.08.tar.bz2
    $ cd pianobar-2014.06.08
    $ PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH make
    $ sudo make install 

最后允许Paniobar加载安装在/usr/local/lib目录下的FFmpeg共享库，在/etc/ld.so.conf配置文件中添加下面一行：

>/usr/local/lib

重载所有的共享库 

就这样，Pianobar已经在Fedora系统中安装完成。

###在命令行中收听Pandora音乐###

paniobar的基本用法是输入如下命令：

>	$ pianobar

该命令将会要求你登录到Pandora并从你的个性化电台列表中选择要收听的电台。在你选择电台后，音乐就开始自动播放。

![](https://farm6.staticflickr.com/5552/14993320301_58e58b5810_z.jpg)

按‘？’按键pianobar会列出一系列可用个命令，其中一些如下：

>- s: 更换电台
- u: 查看即将上线音乐列表
- h: 查看播放历史
- n: 播放下一首
- b: 收藏歌曲或艺术家
- ( 或者 ): 减少或增加播放音量
- S: 暂停播放
- P: 恢复播放
- V：为当前收听的歌曲或者艺术家创建一个电台
- +或者-：查看上一首或者下一首歌曲
- a：添加音乐到电台
- q：退出pianobar

![](https://farm6.staticflickr.com/5559/14993326991_ccdffd0fa6_z.jpg)

###将Pianobar配置为自动安装###

你可以在一个单独的配置文件中配置Pianobar的各项默认配置。例如：你可以将你的登录信息放到配置文件中，这样你就不用每次都要手动输入。下面是如何创建一个配置文件的示例：

>  $ mkdir -p ~/.config/pianobar

----------

>    $ vi ~/.config/pianobar/config 

----------

>    # Example pianobar configuration file
>     
>    # Pandora login info
    user = your@email_address
    password = plaintext_password
>     
>    # Users who cannot access Pandora in their region can set a proxy.
    control_proxy = http://user:password@host:port/
>     
>    # Initial volume in dB: between -30 and +5
    volume = 0
>     
>    # Audio quality: high, medium or low
    audio_quality = high

如需了解完整的配置选项，请参阅其man手册页。

	$ man pianobar

###远程控制Pianobar###

Pianobar的另一个优秀特性是支持远程控制，你可以通过命令管道（FIFO）为Pianobar的一个运行实例发送命令。下面是远程控制Pianobar的示例：

首先在目录~/.config/pianobar下创建一个FIFO命令管道

>	$ mkfifo ~/.config/pianobar/ctl

然后运行Pianobar

现在，你可以通过使用echo命令发送任何的单字符命令键到Pianobar中，例如：播放下一首歌曲：

>	 $ echo -n 'n' > ~/.config/pianobar/ctl 

你可以很容易的将此配置扩展到远程计算机中，当Pianobar在主机X上运行，你可以从远程主机Y中通过SSH控制Pianobar,如下所示：

在主机Y中，运行：

>	$ ssh user@host_X "echo -n 'n' > ~/.config/pianobar/ctl" 

当然，你希望为登录到主机X的SSH登录认证[启用秘钥认证][5]，这样你就不用每次都输入SSH密码。

当你想在[树莓Pi][6]上设置一个可以远程控制的在线电台播放器时，Pianobar的远程控制特性将会让你非常方便地实现该需求。

希望你和我一样喜欢Pianobar，若有什么想法，请在评论中告诉我。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/listen-to-internet-radio-command-line-linux.html

作者：[Dan Nanni][a]
译者：[cvsher](https://github.com/cvsher)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://zh.wikipedia.org/wiki/Pandora%E7%94%B5%E5%8F%B0
[2]:http://6xq.net/projects/pianobar/
[3]:http://ask.xmodulo.com/compile-ffmpeg-centos-fedora-rhel.html
[4]:http://xmodulo.com/2013/06/how-to-install-rpm-fusion-on-fedora.html
[5]:http://xmodulo.com/2012/04/how-to-enable-ssh-login-without.html
[6]:http://xmodulo.com/go/raspberrypi
