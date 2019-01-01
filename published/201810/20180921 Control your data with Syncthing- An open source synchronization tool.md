使用开源同步工具 Syncthing 控制你的数据
======
> 决定如何存储和共享您的个人信息。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg)

如今，我们的一些最重要的财产 —— 从家人和朋友的照片和视频到财务和医疗文件 —— 都是数据。即便是云存储服务的迅猛发展，我们仍有对隐私和个人数据缺乏控制的担忧。从棱镜监控计划到谷歌[让 APP 开发者扫描你的个人邮件][1]，这些新闻的报道应该会让我们对我们个人信息的安全性有所顾虑。

[Syncthing][2] 可以让你放下心来。它是一款开源的点对点文件同步工具，可以运行在 Linux、Windows、Mac、Android 和其他（抱歉，没有iOS）。Syncthing 使用自定的协议，叫[块交换协议](3)。简而言之，Syncting 能让你无需拥有服务器来跨设备同步数据。

在这篇文章中，我将解释如何在 Linux 电脑和安卓手机之间安装和同步文件。

### Linux

Syncting 在大多数流行的发行版都能下载。Fedora 28 包含其最新版本。

要在 Fedora 上安装 Syncthing，你能在软件中心搜索，或者执行以下命令：

```
sudo dnf install syncthing syncthing-gtk
```

一旦安装好后，打开它。你将会看到一个助手帮你配置 Syncthing。点击 “Next” 直到它要求配置 WebUI。最安全的选项是选择“Listen on localhost”。那将会禁止 Web 界面并且阻止未经授权的用户。

![Syncthing in Setup WebUI dialog box][5]

*Syncthing 安装时的 WebUI 对话框*

关闭对话框。现在 Syncthing 安装好了。现在可以分享文件夹，连接一台设备开始同步了。但是，让我们用你其它的客户端继续。

### Android

Syncthing 在 Google Play 和 F-Droid 应用商店都能下载。

![](https://opensource.com/sites/default/files/uploads/syncthing2.png)

安装应用程序后，会显示欢迎界面。给 Syncthing 授予你设备存储的权限。你可能会被要求为了此应用程序而禁用电池优化。这样做是安全的，因为我们将优化应用程序，使其仅在插入电源并连接到无线网络时同步。

点击主菜单图标来到“Settings”，然后是“Run Conditions”（运行条件）。点击“Always run in the background, Run only when charging”（总是在后台运行，仅在充电时运行）和“Run only on wifi”（仅在 WIFI 下运行）。现在你的安卓客户端已经准备好与你的设备交换文件。

Syncting 中有两个重要的概念需要记住：文件夹和设备。文件夹是你想要分享的，但是你必须有一台设备来分享。 Syncthing 允许你用不同的设备分享独立的文件夹。设备是通过交换设备的 ID 来添加的。设备 ID 是在 Syncting 首次启动时创建的一个唯一的密码安全标识符。

### 连接设备

现在让我们连接你的 Linux 机器和你的 Android 客户端。

在您的 Linux 计算机中，打开 Syncting，单击“Settings”图标，然后单击“Show ID”，就会显示一个二维码。

在你的安卓手机上，打开 Syncthing。在主界面上，点击“Devices”页后点击 “+” 。在第一个区域内点击二维码符号来启动二维码扫描。

将你手机的摄像头对准电脑上的二维码。设备 ID 字段将由您的桌面客户端设备 ID 填充。起一个适合的名字并保存。因为添加设备有两种方式，现在你需要在电脑客户端上确认你想要添加安卓手机。你的电脑客户端可能会花上好几分钟来请求确认。当提示确认时，点击“Add”。

![](https://opensource.com/sites/default/files/uploads/syncthing6.png)

在“New Device”窗口，你能确认并配置一些关于你设备的选项，像是“Device Name”和“Addresses”。如果你在地址那一栏选择 “dynamic” （动态），客户端将会自动探测设备的 IP 地址，但是你想要保持住某一个 IP 地址，你能将该地址填进这一栏里。如果你已经创建了文件夹（或者在这之后），你也能与新设备分享这个文件夹。

![](https://opensource.com/sites/default/files/uploads/syncthing7.png)

你的电脑和安卓设备已经配对，可以交换文件了。(如果你有多台电脑或手机，只需重复这些步骤。) 

### 分享文件夹

既然您想要同步的设备之间已经连接，现在是时候共享一个文件夹了。您可以在电脑上共享文件夹，添加了该文件夹中的设备将获得一份副本。

若要共享文件夹，请转至“Settings”并单击“Add Shared Folder”（添加共享文件夹）：

![](https://opensource.com/sites/default/files/uploads/syncthing8.png)

在下一个窗口中，输入要共享的文件夹的信息：

![](https://opensource.com/sites/default/files/uploads/syncthing9.png)

你可以使用任何你想要的标签。“Folder ID”将随机生成，用于识别客户端之间的文件夹。在“Path”里，点击“Browse”就能定位到你想要分享的文件夹。如果你想 Syncthing 监控文件夹的变化（例如删除、新建文件等），点击“Monitor filesystem for changes”（监控文件系统变化）。

记住，当你分享一个文件夹，在其他客户端的任何改动都将会反映到每一台设备上。这意味着如果你在其他电脑和手机设备之间分享了一个包含图片的文件夹，在这些客户端上的改动都会同步到每一台设备。如果这不是你想要的，你能让你的文件夹“Send Only”（只是发送）给其他客户端，但是其他客户端的改动都不会被同步。

完成后，转至“Share with Devices”（与设备共享）页并选择要与之同步文件夹的主机。

您选择的所有设备都需要接受共享请求；您将在设备上收到通知。

正如共享文件夹时一样，您必须配置新的共享文件夹：

![](https://opensource.com/sites/default/files/uploads/syncthing12.png)

同样，在这里您可以定义任何标签，但是 ID 必须匹配每个客户端。在文件夹选项中，选择文件夹及其文件的位置。请记住，此文件夹中所做的任何更改都将反映到文件夹所允许同步的每个设备上。

这些是连接设备和与 Syncting 共享文件夹的步骤。开始复制可能需要几分钟时间，这取决于您的网络设置或您是否不在同一网络上。

Syncting 提供了更多出色的功能和选项。试试看，并把握你数据的控制权。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/take-control-your-data-syncthing

作者：[Michael Zamot][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ypingcn](https://github.com/ypingcn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mzamot
[1]: https://gizmodo.com/google-says-it-doesnt-go-through-your-inbox-anymore-bu-1827299695
[2]: https://syncthing.net/
[3]: https://docs.syncthing.net/specs/bep-v1.html
[4]: /file/410191
[5]: https://opensource.com/sites/default/files/uploads/syncthing1.png
