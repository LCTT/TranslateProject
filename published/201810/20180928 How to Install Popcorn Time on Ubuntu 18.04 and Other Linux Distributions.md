如何在 Ubuntu 18.04 上安装 Popcorn Time  
======

> 简要：这篇教程展示给你如何在 Ubuntu 和其他 Linux 发行版上安装 Popcorn Time，也会讨论一些 Popcorn Time 的便捷操作。

[Popcorn Time][1] 是一个受 [Netflix][2] 启发的开源的 [torrent][3] 流媒体应用，可以在 Linux、Mac、Windows 上运行。  

传统的 torrent，在你看影片之前必须等待它下载完成。  

[Popcorn Time][4] 有所不同。它的使用基于 torrent，但是允许你（几乎）立即开始观看影片。它跟你在 Youtube 或者 Netflix 等流媒体网页上看影片一样，无需等待它下载完成。  

![Popcorn Time in Ubuntu Linux][5]  

*Popcorn Time*

如果你不想在看在线电影时被突如其来的广告吓倒的话，Popcorn Time 是一个不错的选择。不过要记得，它的播放质量依赖于当前网络中可用的<ruby>种子<rt>seed</rt></ruby>数。  

Popcorn Time 还提供了一个不错的用户界面，让你能够浏览可用的电影、电视剧和其他视频内容。如果你曾经[在 Linux 上使用过 Netflix][6]，你会发现两者有一些相似之处。  

有些国家严格打击盗版，所以使用 torrent 下载电影是违法行为。在类似美国、英国和西欧等一些国家，你或许曾经收到过法律声明。也就是说，是否使用取决于你。已经警告过你了。  

Popcorn Time 一些主要的特点：  

  * 使用 Torrent 在线观看电影和电视剧
  * 有一个时尚的用户界面让你浏览可用的电影和电视剧资源
  * 调整流媒体的质量  
  * 标记为稍后观看
  * 下载为离线观看
  * 可以默认开启字幕，改变字母尺寸等  
  * 使用键盘快捷键浏览  


### 如何在 Ubuntu 和其它 Linux 发行版上安装 Popcorn Time  

这篇教程以 Ubuntu 18.04 为例，但是你可以使用类似的说明，在例如 Linux Mint、Debian、Manjaro、Deepin 等 Linux 发行版上安装。  

Popcorn Time 在 Deepin Linux 的软件中心中也可用。Manjaro 和 Arch 用户也可以轻松地使用 AUR 来安装 Popcorn Time。

接下来我们看该如何在 Linux 上安装 Popcorn Time。事实上，这个过程非常简单。只需要按照说明操作复制粘贴我提到的这些命令即可。  

#### 第一步：下载 Popcorn Time  

你可以从它的官网上安装 Popcorn Time。下载链接在它的主页上。
  
- [下载 Popcorn Time](https://popcorntime.sh/)  

#### 第二步：安装 Popcorn Time  

下载完成之后，就该使用它了。下载下来的是一个 tar 文件，在这些文件里面包含有一个可执行文件。你可以把 tar 文件提取在任何位置，[Linux 常把附加软件安装在][8] [/opt 目录][8]。  

在 `/opt` 下创建一个新的目录：

```
sudo mkdir /opt/popcorntime
```

现在进入你下载文件的文件夹中，比如我把 Popcorn Time 下载到了主目录的 Downloads 目录下。  

```
cd ~/Downloads
```

提取下载好的 Popcorn Time 文件到新创建的 `/opt/popcorntime` 目录下：

```
sudo tar Jxf Popcorn-Time-* -C /opt/popcorntime  
```  

#### 第三步：让所有用户可以使用 Popcorn Time  

如果你想要系统中所有的用户无需经过 `sudo` 就可以运行 Popcorn Time。你需要在 `/usr/bin` 目录下创建一个[符号链接（软链接）][9]指向这个可执行文件。  

```  
ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time  
```

#### 第四步：为 Popcorn Time 创建桌面启动器  

到目前为止，一切顺利，但是你也许想要在应用菜单里看到 Popcorn Time，又或是想把它添加到最喜欢的应用列表里等。  

为此，你需要创建一个桌面入口。  

打开一个终端窗口，在 `/usr/share/applications` 目录下创建一个名为 `popcorntime.desktop` 的文件。  

你可以使用任何[基于命令行的文本编辑器][10]。Ubuntu 默认安装了 [Nano][11]，所以你可以直接使用这个。  

```
sudo nano /usr/share/applications/popcorntime.desktop
```

在里面插入以下内容：  

```  
[Desktop Entry]  
Version = 1.0  
Type = Application  
Terminal = false  
Name = Popcorn-Time  
Exec = /usr/bin/Popcorn-Time  
Icon = /opt/popcorntime/popcorn.png  
Categories = Application;  
```

如果你使用的是 Nano 编辑器，使用 `Ctrl+X` 保存输入的内容，当询问是否保存时，输入 `Y`，然后按回车保存并退出。  

就快要完成了。最后一件事就是为 Popcorn Time 设置一个正确的图标。你可以下载一个 Popcorn Time 图标到 `/opt/popcorntime` 目录下，并命名为 `popcorn.png`。  

你可以使用以下命令：  

```
sudo wget -O /opt/popcorntime/popcorn.png https://upload.wikimedia.org/wikipedia/commons/d/df/Pctlogo.png
```  

这样就 OK 了。现在你可以搜索 Popcorn Time 然后点击启动它了。  

![Popcorn Time installed on Ubuntu][12]
 
*在菜单里搜索 Popcorn Time*  

第一次启动时，你必须接受这些条款和条件。  

![Popcorn Time in Ubuntu][13]  

*接受这些服务条款*  

一旦你完成这些，你就可以享受你的电影和电视节目了。  

![Watch movies on Popcorn Time][14]  

好了，这就是所有你在 Ubuntu 或者其他 Linux 发行版上安装 Popcorn Time 所需要的了。你可以直接开始看你最喜欢的影视节目了。  

### 高效使用 Popcorn Time 的七个小贴士  

现在你已经安装好了 Popcorn Time 了，我接下来将要告诉你一些有用的 Popcorn Time 技巧。我保证它会增强你使用 Popcorn Time 的体验。  

#### 1、 使用高级设置  

始终启用高级设置。它给了你更多的选项去调整 Popcorn Time 点击右上角的齿轮标记。查看其中的高级设置。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Popcorn_Time_Tricks.jpeg)  

#### 2、 在 VLC 或者其他播放器里观看影片  

你知道你可以选择自己喜欢的播放器而不是 Popcorn Time 默认的播放器观看一个视频吗？当然，这个播放器必须已经安装在你的系统上了。  

现在你可能会问为什么要使用其他的播放器。我的回答是：其他播放器可以弥补 Popcorn Time 默认播放器上的一些不足。  

例如，如果一个文件的声音非常小，你可以使用 VLC 将音频声音增强 400%，你还可以[使用 VLC 同步不连贯的字幕][18]。你可以在播放文件之前在不同的媒体播放器之间进行切换。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks_1.png)  

#### 3、 将影片标记为稍后观看  

只是浏览电影和电视节目，但是却没有时间和精力去看？这不是问题。你可以添加这些影片到书签里面，稍后可以在 Faveriate 标签里面访问这些影片。这可以让你创建一个你想要稍后观看的列表。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks2.png)  

#### 4、 检查 torrent 的信息和种子信息  

像我之前提到的，你在 Popcorn Time 的观看体验依赖于 torrent 的速度。好消息是 Popcorn Time 显示了 torrent 的信息，因此你可以知道流媒体的速度。  

你可以在文件上看到一个绿色/黄色/红色的点。绿色意味着有足够的种子，文件很容易播放。黄色意味着有中等数量的种子，应该可以播放。红色意味着只有非常少可用的种子，播放的速度会很慢甚至无法观看。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks3.jpg)  

#### 5、 添加自定义字幕  

如果你需要字幕而且它没有你想要的语言，你可以从外部网站下载自定义字幕。得到 .src 文件，然后就可以在 Popcorn Time 中使用它：  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocporn_Time_Tricks5.png)  

你可以[用 VLC 自动下载字幕][19]。

#### 6、 保存文件离线观看  

用 Popcorn Time 播放内容时，它会下载并暂时存储这些内容。当你关闭 APP 时，缓存会被清理干净。你可以更改这个操作，使得下载的文件可以保存下来供你未来使用。  

在高级设置里面，向下滚动一点。找到缓存目录，你可以把它更改到其他像是 Downloads 目录，这下你即便关闭了 Popcorn Time，这些文件依旧可以观看。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Popcorn_Time_Tips.jpg)  

#### 7、 拖放外部 torrent 文件立即播放  

我猜你不知道这个操作。如果你没有在 Popcorn Time 发现某些影片，从你最喜欢的 torrent 网站下载 torrent 文件，打开 Popcorn Time，然后拖放这个 torrent 文件到 Popcorn Time 里面。它将会立即播放文件，当然这个取决于种子。这次你不需要在观看前下载整个文件了。  

当你拖放文件到 Popcorn Time 后，它将会给你对应的选项，选择它应该播放的。如果里面有字幕，它会自动播放，否则你需要添加外部字幕。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks4.png)  

在 Popcorn Time 里面有很多的功能，但是我决定就此打住，剩下的就由你自己来探索吧。我希望你能发现更多 Popcorn Time 有用的功能和技巧。  

我再提醒一遍，使用 Torrents 在很多国家是违法的。

-----------------------------------

via: https://itsfoss.com/popcorn-time-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://popcorntime.sh/
[2]: https://netflix.com/
[3]: https://en.wikipedia.org/wiki/Torrent_file
[4]: https://en.wikipedia.org/wiki/Popcorn_Time
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-linux.jpeg
[6]: https://itsfoss.com/netflix-firefox-linux/
[7]: https://billing.ivacy.com/page/23628
[8]: http://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[9]: https://en.wikipedia.org/wiki/Symbolic_link
[10]: https://itsfoss.com/command-line-text-editors-linux/
[11]: https://itsfoss.com/nano-3-release/
[12]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-ubuntu-menu.jpg
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-ubuntu-license.jpeg
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-watch-movies.jpeg
[15]: https://ivacy.postaffiliatepro.com/accounts/default1/vdegzkxbw/7f82d531.png
[16]: https://billing.ivacy.com/page/23628/7f82d531
[17]: http://ivacy.postaffiliatepro.com/scripts/vdegzkxiw?aff=23628&a_bid=7f82d531
[18]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[19]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[20]: https://protonvpn.net/?aid=chmod777
[21]: https://itsfoss.com/protonmail/
[22]: https://shop.itsfoss.com/search?utf8=%E2%9C%93&query=vpn
[23]: https://itsfoss.com/affiliate-policy/
