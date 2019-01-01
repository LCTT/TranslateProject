用 GNOME Boxes 下载一个操作系统镜像
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/boxes-install-os-816x345.jpg)

Boxes 是 GNOME 上的虚拟机应用。最近 Boxes 添加了一个新的特性，使得它在运行不同的 Linux 发行版时更加容易。你现在可以在 Boxes 中自动安装那些发行版以及像 FreeBSD 和 FreeDOS 这样的操作系统，甚至还包括红帽企业 Linux。红帽开发者计划包括了一个[红帽企业版 Linux 的免费订阅][1]。 使用[红帽开发者][2]帐户，Boxes 可以自动设置一个名为 Developer Suite 订阅的 RHEL 虚拟机。 下面是它的工作原理。

### 红帽企业版 Linux

要创建一个红帽企业版 Linux 的虚拟机，启动 Boxes，点击“新建”。从源选择列表中选择“下载一个镜像”。在顶部，点击“红帽企业版 Linux”。这将会打开网址为 [developers.redhat.com][2] 的一个 Web 表单。使用已有的红帽开发者账号登录，或是新建一个。  

![][3]

如果这是一个新帐号，Boxes 在继续之前需要一些额外的信息。这一步需要在账户中开启开发者订阅。还要确保 [接受条款和条件][4]，这样可以在之后的注册中节省一步。  

![][5]

点击“提交”，然后就会开始下载安装磁盘镜像。下载需要的时间取决于你的网络状况。在这期间你可以去喝杯茶或者咖啡歇息一下。  

![][6]

等介质下载完成（一般位于 `~/Downloads` ），Boxes 会有一个“快速安装”的显示。填入账号和密码然后点击“继续”，当你确认了虚拟机的信息之后点击“创建”。“快速安装”会自动完成接下来的整个安装！（现在你可以去享受你的第二杯茶或者咖啡了）

![][7]

![][8]

![][9]

等到安装结束，虚拟机会直接重启并登录到桌面。在虚拟机里，在应用菜单的“系统工具”一栏启动“红帽订阅管理”。这一步需要输入 root 密码。  

![][10]

单击“注册”按钮，然后按照注册助手中的步骤操作。 出现提示时，使用你的红帽开发者帐户登录。 

![][11]

![][12]

现在你可以通过任何一种更新方法，像是 `yum` 或是 GNOME Software 进行下载和更新了。  

![][13]

### FreeDOS 或是其他

Boxes 可以安装很多操作系统，而不仅仅只是红帽企业版。 作为 KVM 和 qemu 的前端，Boxes 支持各种操作系统。使用 [libosinfo][14]，Boxes 可以自动下载（在某些情况下安装）相当多不同操作系统。

![][15]

要从列表中安装一个操作系统，只需选择并完成创建一个新的虚拟机。一些操作系统，比如 FreeDOS，并不支持快速安装。这些操作系统需要虚拟机从安装介质中引导。之后你可以手动安装。  

![][16]

![][17]

### Boxes 上流行的操作系统  

这里仅仅是一些目前在它上面比较受欢迎的选择。  

![][18]

![][19]

![][20]

![][21]

![][22]

![][23]

Fedora 会定期更新它的操作系统信息数据库（osinfo-db）。确保你会经常检查是否有新的操作系统选项。  


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/download-os-gnome-boxes/

作者：[Link Dupont][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/linkdupont/
[1]:https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available/
[2]:http://developers.redhat.com
[3]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-33-13.png
[4]:https://www.redhat.com/wapps/tnc/termsack?event%5B%5D=signIn
[5]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-34-37.png
[6]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-37-27.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-09-11.png
[8]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-15-19-1024x815.png
[9]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-21-53-1024x815.png
[10]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-26-29-1024x815.png
[11]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-30-48-1024x815.png
[12]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-31-17-1024x815.png
[13]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-32-29-1024x815.png
[14]:https://libosinfo.org
[15]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-20-02-56.png
[16]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-40-25.png
[17]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-43-02-1024x815.png
[18]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-55-20-1024x815.png
[19]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-28-28-1024x815.png
[20]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-11-43-1024x815.png
[21]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-58-09-1024x815.png
[22]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-17-46-38-1024x815.png
[23]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-18-34-11-1024x815.png
