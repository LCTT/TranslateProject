如何在Linux命令行下访问SoundCloud
================================================================================
如果你喜欢流媒体音乐和原创音乐，你不能错过[SoundCloud][1]。这家云流媒体服务总部设在德国，这对任何音乐爱好者都非常有名，且功能完善。自然，作为一个Linux爱好者，你可能想知道如何在Linux中体现你对音乐的热情。作为一个解决方案，我建议你使用Soundcloud2000，这是一个脱胎于[Music Hack Day Stockholm '13][2]的**SoundCloud的命令行客户端**。

### 安装 ###

对于Debian或者Ubuntu用户，如下安装：

    $ sudo apt-get install portaudio19-dev libmpg123-dev libncurses-dev ruby1.9.1-dev
    $ sudo gem install soundcloud2000

对于Archlinux用户，在[AUR][3]仓库中可以获取到包

对于Fedora用户，如下安装：

    $ sudo yum install portaudio-devel libmpg123-devel ncurses-devel ruby-devel
    $ sudo gem install soundcloud2000

对于CentOS用户，安装或者升级到[最新 Ruby/RubyGems][4] (1.9或更高)，启用[Repoforge repo][5],如下安装：

    $ sudo yum install portaudio-devel mpg123-devel
    $ sudo gem install curses soundcloud2000 

最后，到官方的github页面获取源码

### 使用 ###

Soundcloud2000非常容易使用。有些人甚至会说简单。我喜欢它的庄重以及三位作者和贡献者的努力。如下启动它：

    $ soundcloud2000

这里，你将看到一个闪屏：

![](https://farm4.staticflickr.com/3919/14658085706_71c9094e4f_z.jpg)

接着是歌曲列表：

![](https://farm4.staticflickr.com/3888/14494626757_3e788482d5_z.jpg)

您可以通过上下键滚动列表，回车播放一首歌曲，空格键是暂停/恢复，左右箭头键是快进/快退。正如你所看到的，没有什么突破性的但绝对符合人体工程学。

如果随机列表太长无法滚动完，你有一个选项来查看所有曲目，用户通过点击'u'键接着输入自己的名字。

![](https://farm4.staticflickr.com/3861/14494436719_b5536f7b67_z.jpg)

这可能是Soundcloud2000的主要缺陷之一。虽然导航没有优化过，但是我对这个很年轻的软件的改善和支持还是寄予厚望的。

### 奖励 ###

另外一个额外的奖励：如果你喜欢在终端上使用SoundCloud的想法，但不想安装任何额外的软件（也许你不能），我劝你去[cmd.fm][6]。该网站是一个伪装的SoundCloud，它隐藏在一个shell界面后。

[![](https://farm6.staticflickr.com/5580/14494448218_a16b05e3ee_z.jpg)][7]

输入“help”可以得到命令列表，这比Soundcloud2000长很多。比如，我看到：

- _genres 列出所有流派
- _play random 随机播放
- _pause 暂停播放
- _playlist new 建立新的播放节目单
- _loop 循环播放
- _cinema 如同星球大战一样的字幕

它甚至支持通过tab键自动补完流派名称

最后，Soundcloud2000的确是一个整洁的程序。我们可以原谅其目前的缺陷，因为它还年轻。我真的希望它会成长，并包含更多的功能（并从潜在的cmd.fm得到的灵感）。

如果您喜欢这个主意，我邀请你支持程序员，如果你喜欢这类举措，请支持[Music Hack Day][8]，这其中混合了软件开发和音乐。

你认为在命令行下使用SoundCloud怎么样？让我们在评论中知道你的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/access-soundcloud-command-line-linux.html

原文作者：[Adrien Brochard][a]

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:https://soundcloud.com/
[2]:https://www.hackerleague.org/hackathons/music-hack-day-stockholm-13/
[3]:https://aur.archlinux.org/packages/ruby-soundcloud2000/
[4]:http://ask.xmodulo.com/upgrade-ruby-centos.html
[5]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[6]:https://cmd.fm/
[7]:https://www.flickr.com/photos/xmodulo/14494448218/
[8]:http://new.musichackday.org/