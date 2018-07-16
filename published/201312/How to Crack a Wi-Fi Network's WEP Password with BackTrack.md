如何使用BackTrack破解WIFI无线网络的WEP密钥
================================================================================

![](http://img.gawkerassets.com/img/17idgc21242wbjpg/ku-xlarge.jpg)

你可能已经知道如果你想要加锁自己的WIFI无线网络，你最好选择[WPA加密][3]方式，因为WEP加密很容易被人破解。但是，你知道有多么的容易么？下面我们来看看吧。

*注意：此帖是验证如何破解很少使用而陈旧的WEP加密协议。如果你希望破解的网络采用了更受欢迎的WPA加密，请看这篇：[如何使用Reaver破解Wi-Fi网络的WPA密码][2]。*

今天我们来看看如何一步一步的破解采用WEP加密方法加密的WIFI网络。但是，有言在先：知识是一种力量，但是力量并不意味着你应该成为一个混球或者做任何违法的事。知道[如何挑选一把锁具][3]并不会让你成为一个贼。请将此帖用于教育性质或者概念验证性试验。

关于如何使用这个方案破解WEP加密的教程在互联网上有很多。认认真真的谷歌下，这个并不能被称作新闻。但是，让人惊讶的是如笔者一般的只有很少的网络经验的菜鸟，也可以使用一些免费的软件和廉价的WIFI适配器来完成这个做破解。下面就来看看吧！

### 你需要些什么 ###
![](http://img.gawkerassets.com/img/17ggkrsu8hf19png/original.png)

除非你是一个电脑网络安全的忍者，否则你不太可能具有完成实验的所有工具。以下是你需要的：

- **一个兼容的无线适配器**.这是最主要的需求。你需要一个无线适配器，能用来完成包注入，你的电脑很可能不具备这个功能。在和我的安全专家邻居讨论了以后，我从亚马逊上花了50美元购买了一个Alfa AWUS050NH适配器，图片如上。更新：别学我，其实应该买[Alfa AWUS036H][4]而不是US050NH。[视频][5]里的哥们儿用$12美金在Ebay上买了一个解调器（同时可以选择把[自己的路由器][6]卖掉）。网上有很多可以[兼容aircrack的适配器][7]。

- **[一个BackTrack Live CD][8]**. 我们已经提供了一个完整的[BackTrack 3的安装使用教程][9]，Linux Live CD可以让你完成所有的安全测试和测试工作。请自行下载一个CD镜像，然后刻录或者从VMware中启动它。

- **一个靠近的WEP加密的WIFI网络**. 信号需要足够的强，理想的情况下最好有用户正在使用、连接和断开设备。越多的人使用网络，你就可以的到更多的破解数据，这样你就更可能成功。

- **使用命令行的耐心**. 这里总共有10步，总共需要输入很长、很难懂的命令，然后等你的wifi网卡收集足够破解密码的数据。就像一个医生和一个急躁的病人说，要有点耐心。

### 破解WEP ###

为了破解WEP，你需要启动一个Konsole，它是BackTrack内置的命令行界面，它在任务栏的左下角，从左往右第二个图标。现在，输入命令吧。

第一步，运行下面的命令，获得你网卡列表：

	airmon-ng

笔者只看见了一个ra0的结果。你的可能不一样；记录下这些内容（找个纸或者截图）。现在开始，更改替换掉命令中每一个包括(interface)的地方。

现在，运行下面的四个命令。看看截图里的输入结果。


    airmon-ng stop (interface)
    ifconfig (interface) down
    macchanger —mac 00:11:22:33:44:55 (interface)
    airmon-ng start (interface)

![](http://img.gawkerassets.com/img/17ggkrsub9llbpng/ku-xlarge.png)

如果你没有获得像截图一样的结果，最可能的情况就是你的无线网卡不能在特殊破解模式下工作。如果你成功了，你应该已经成功的在你的无线网卡上伪造了一个新的MAC地址，00:11:22:33:44:55.

现在，开始使用的你网络接口，运行：（译者注：interface在范例中就是ra0）

    airodump-ng (interface)

就可以看见你周围的wifi网络列表了。当你认准了你的目标后，按Ctrl+C结束列表。高亮你感兴趣的网络，同时记录下两样数据：它的BSSID和它的Channel(讯道，标签为CH的那列)，就像下面的截图。很明显你想要破解的网络需要是WEP加密的，而不是WPA或者其他加密方式。

![](http://img.gawkerassets.com/img/17ggkrut97td8png/ku-xlarge.png)

就像我说的，按Ctrl+C来终止列表。（我需要重复一两次来找到我需要的网络）一旦你找到了你需要破解的网络，高亮BSSID然后复制它到你的剪切板来为将要输入的命令做准备。

现在我们需要观察你选中的目标网络，并捕捉信息存入一个文件里，运行如下命令：

    airodump-ng -c (channel) -w (file name) —bssid (bssid) (interface)

其中，(channel),(bssid)就是你之前获取的那些信息。你可以使用Shift+Insert来将剪切板中的bssid信息粘贴到命令行中。随便给你的文件取个名字。我用的是“YoYo”，我破解的网络的名字。

![](http://img.gawkerassets.com/img/17ggkrutbx04dpng/ku-xlarge.png)

你能够得到如截图中的窗口输出。就这么放着这个窗口。在前台新建一个konsole窗口，输入如下命令：

    aireplay-ng -1 0 -a (bssid) -h 00:11:22:33:44:55 -e (essid) (interface)

这里的ESSID是接入点SSID的名字，例如我的就是YoYo。你希望能在运行后得到“Association successful”的结果。

![](http://img.gawkerassets.com/img/17ggkrut9v67spng/ku-xlarge.png)

你如果到了这一步，现在是时候运行下面的命令了：

    aireplay-ng -3 -b (bssid) -h 00:11:22:33:44:55 (interface)

现在，我们创建了一个路由通路来更快的抓取数据，从而加快我们的破解过程。几分钟以后，前台的窗口会开始疯狂的读写数据包。（这时，我也不能用YoYo的网络在另一台机器上上网）这里，你可以喝杯Java牌儿咖啡，然后出去走走。一般来说，你需要收集到足够的数据后再运行你的破解程序。看着“#Data”列里的数据，你需要它在10，000以上。（图里的数据只有854）

这个过程可能需要一些时间，这取决于你的网络信号强度（截图中可以看到，我的信号强度低于-32DB，虽然YoYo的AP和我的适配器在同一间屋里）。等待直到包数据到达10K，因为在此之前破解过程不会成功。实际上，你可能需要超过10K，虽然他可能是大多数情况下都足够了。

![](http://img.gawkerassets.com/img/17ggkrwseb5uipng/ku-xlarge.png)

一旦你收集了足够多的数据，就是见证奇迹的时刻了。启动第三个终端窗口，同时输入下面的命令来破解你收集到的数据：

    aircrack-ng -b (bssid) (filename-01.cap)

这里的filename就是你在上面输入的文件名。你可以在自己的Home目录下看到。他应该是一个.cap后缀名的文件。

如果你没有足够的数据，破解可能失败，aircrack会告诉你获得更多的数据后重新尝试。如果成功了，你会看到如图结果：
![](http://img.gawkerassets.com/img/17ggkrws8f1gepng/ku-medium.png)

WEP密钥会接着显示“KEY FOUND”。去掉引号，然后输入他就可以登录到目标网络了。

### 这个过程中的问题 ###

通过这篇文章，我们可以证明想要破解WEP加密的网络对于任何一个具有硬件和软件人来说是如此简单的过程。我一直认为是这样的，但是不像下面视频里的伙计，这个过程中我遇到了很多的问题。实际上，你应该可以注意到最后一张截图和其他的不一样，因为它不是我的截图。虽然我破解的AP是我自己的AP，和我的Alfa在同一间屋子里，而且读取的信号强度一直在-30左右，但是数据的收集速度依然很缓慢，而在数据收集完成以前，BackTrack不能破解他。在尝试了各种方案（在我的MAC和PC上），我始终没能抓取到足够的数据量来破解密钥。

所以，这个过程在理论上是很简单的，实际上因为设备、到AP的距离却又因人而异.

可以去Youtube上看看视频，感受下这个伙计的实际操作。

[http://www.youtube.com/embed/kDD9PjiQ2_U?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1][10]

感受到一点使用BackTrack破解WEP加密的作用了么？你想说些什么呢？赶快换掉它吧。

--------------------------------------------------------------------------------

via: http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack

译者：[stduolc](https://github.com/stduolc) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lifehacker.com/386675/secure-your-home-wi+fi-network
[2]:http://linux.cn/article-2335-1.html
[3]:http://lifehacker.com/399735/how-to-pick-a-lock-with-a-bump-key
[4]:http://www.amazon.com/Alfa-AWUS036H-802-11b-Wireless-network/dp/B002WCEWU8?tag=lifehackeramzn-20&ascsubtag=[referrer|lifehacker.com[type|link[postId|5305094[asin|B002WCEWU8[authorId|5774310829120954491
[5]:http://www.youtube.com/watch?v=oHq-cKoYcr8
[6]:http://www.youtube.com/watch?v=bFlOHMj7Qoc
[7]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.aircrack-ng.org%2Fdoku.php%3Fid%3Dcompatible_cards&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5305094%2Fhow-to-crack-a-wi%2Bfi-networks-wep-password-with-backtrack&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[8]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.backtrack-linux.org%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5305094%2Fhow-to-crack-a-wi%2Bfi-networks-wep-password-with-backtrack&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[9]:http://lifehacker.com/5166530/backtrack-is-a-security+focused-live-cd-packed-with-system-tools
[10]:http://www.youtube.com/embed/kDD9PjiQ2_U?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1