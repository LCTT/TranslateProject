在Ubuntu下安装Jitsi Instant Messenger（Jisti即时信使）
=========================================

[Jitsi][1] 是Java编写的开源的、多平台的音频/视频网络电话和即时通信软件。它支持一些最流行的即时通信和电信协议，比如：SIP，Jabber/XMPP（这样就支持了Facebook和Google Talk），AIM，ICQ，MSN，Yahoo! Messenger。

Jitsi也被认为是Skype的一个很好的替代者。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/About-Jitsi.png)

###安装Jitsi

按下键盘上的Ctrl+Alt+T组合键打开终端。在打开的终端中输入如下命令下载Jitsi：

**32位系统：**

    $ wget https://download.jitsi.org/jitsi/debian/jitsi_2.2-latest_i386.deb

**64位系统：**

    $ wget https://download.jitsi.org/jitsi/debian/jitsi_2.2-latest_amd64.deb

对于32位和64位系统都运行如下命令：

    $ sudo dpkg -i jitsi_2.2-latest_*.deb

以上命令将在你的系统中安装Jitsi 2.2，并且在你的系统中添加Jitsi的源库，以便以后能够更加容易的升级。


![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/jitsi_main.png)

###Jitsi的部分功能：

**支持的协议/网络**

- SIP XMPP (Jabber)
- GoogleTalk (使用XMPP) Facebook (使用XMPP)
- .NET Messenger Service (通常叫做MSN或者是Windows Live Messenger)，Yahoo! Messenger，AIM ICQ

**通话**
<table border=1 width=90%>
<tr><td>支持的协议</td><td>SIP</td><td>XMPP</td><td>MSN</td></tr>

<tr><td>音频通话</td><td>支持</td><td>支持</td><td rowspan=17>由于项目终止而没有计划</td></tr>
<tr><td>视频通话</td><td>支持</td><td>支持</td></tr>
<tr><td>桌面流</td><td>支持</td><td>支持</td></tr>
<tr><td>桌面共享</td><td>支持</td><td>支持</td></tr>
<tr><td>音频电话会议</td><td>支持</td><td>支持</td></tr>
<tr><td>音频级别显示</td><td>支持</td><td>支持</td></tr>
<tr><td>通话录音</td><td>支持</td><td>支持</td></tr>
<tr><td>指定转接</td><td>支持</td><td>支持</td></tr>
<tr><td>电话盲转</td><td>支持</td><td>支持</td></tr>
<tr><td>通过SDES/SRTP和ZRTP实现通话加密</td><td>支持</td><td>支持</td></tr>
<tr><td>通话静音</td><td>支持</td><td>支持</td></tr>
<tr><td>通话保持</td><td>支持</td><td>支持</td></tr>
<tr><td>支持ICE</td><td>正在进行</td><td>支持</td></tr>
<tr><td>支持TURN</td><td>正在进行</td><td>支持</td></tr>
<tr><td>使用SILK，G.722和Speex的宽带音频</td><td>支持</td><td>支持</td></tr>
<tr><td>噪声抑制</td><td>支持</td><td>支持</td></tr>
<tr><td>回声消除</td><td>支持</td><td>支持</td></tr>
</table>


**即时通信**





<table border=1 width=90%>

<tr><td>支持的协议</td><td>XMPP</td><td>MSN</td><td>Yahoo!</td><td>ICQ/AIM</td><td>SIP</td></tr>
<tr><td>存在</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td></tr>
<tr><td>一对一聊天</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td></tr>
<tr><td>多用户聊天</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td><td>不支持</td></tr>
<tr><td>文件传输</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td><td>不支持</td></tr>
<tr><td>OTR加密</td><td>支持</td><td>支持</td><td>支持</td><td>支持</td><td>不支持</td></tr>
</table>

更多特性 [点击这里][2]

###使用Jitsi

Jitsi能够通过在终端中执行如下命令来运行

    $ jitsi

或者从dash中运行

**Dash > Jitsi**

添加账户

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/addnew.png)

点击 **select network（选择网络）**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Add-new-account_0051.png)

在这个教程中，使用Gtalk帐号进行登录

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/select_account.png)

按要求输入你的**username（用户名）** 和 **password（密码）**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/login.png)

然后你就在线了。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Jitsi_online.png)

聊天窗口。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/chat.png)

对于其他Linux发行版，请访问Jitsi[下载页面][3]

如有问题，请访问我们的 Q/A 论坛 : http://ask.unixmen.com/ - 更多信息请参见: http://www.unixmen.com/install-jitsi-instant-messenger-ubuntu/#sthash.TuH8ZN0b.dpuf

--------------------------------------------------------------------------------

来自: http://www.unixmen.com/install-jitsi-instant-messenger-ubuntu/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[SCUSJS](http://blog.csdn.net/scusjs) 校对：[jasminepeng](https://github.com/jasminepeng)


[1]:https://jitsi.org/Main/HomePage
[2]:https://jitsi.org/Main/Features
[3]:https://jitsi.org/Main/Download
