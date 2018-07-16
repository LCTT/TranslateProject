在绝大部分类型的机器上安装 NVIDIA 显卡驱动
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/nvidia-816x345.jpg)

无论是研究还是娱乐，安装一个最新的显卡驱动都能提升你的计算机性能，并且使你能全方位地实现新功能。本安装指南使用 Fedora 28  的新的第三方仓库来安装 NVIDIA 驱动。它将引导您完成硬件和软件两方面的安装，并且涵盖你需要得到的 NVIDIA 显卡启动和运行的一切。这个流程适用于任何支持 UEFI 的计算机和任意新的 NVIDIA  显卡。

### 准备

本指南依赖于下面这些材料：

  * 一台使用 UEFI 的计算机，如果你不确定你的电脑是否有这个这个固件，请运行 sudo dmidecode -t 0。如果输出中出现了“UEFI is supported”，你的安装过程就可以继续了。不然的话，虽然可以在技术上更新部分电脑来支持 UEFI，但是这个过程的要求很苛刻，我们通常不建议你这么使用。
  * 一个现代的，支持 UEFI 的 NVIDIA 的显卡
  * 一个满足你的 NVIDIA 显卡的功率和接线要求的电源（有关详细信息，请参考硬件和修改的章节）
  * 网络连接
  * Fedora 28 系统



### 安装实例

这个安装示例使用的是：

  * 一台 Optiplex 9010 的主机（一台相当老的机器）
  * NVIDIA GeForce GTX 1050 Ti XLR8 游戏超频版 4 GB GDDR5 PCI Express 3.0 显卡
  * 为了满足新显卡的电源要求，电源升级为 EVGA – 80 PLUS 600 W ATX 12V/EPS 12V，这个最新的 PSU 比推荐的最低要求高了 300 W，但在大部分情况下，满足推荐的最低要求就足够了。
  * 然后，当然的，Fedora 28 也别忘了.



### 硬件和修改

#### PSU

打开你的台式机的机箱，检查印刷在电源上的最大输出功率。然后，查看你的 NVIDIA 显卡的文档，确定推荐的最小电源功率要求（以瓦特为单位）。除此之外，检查你的显卡，看它是否需要额外的接线，例如 6 针口连接器，大多数的入门级显卡只从主板获取电力，但是有一些显卡需要额外的电力，如果出现以下情况，你需要升级的 PSU：

  1. 你的电源的最大输出功率低于显卡建议的最小电源功率。注意：根据一些显卡厂家的说法，比起推荐的功率，预先构建的系统可能会需要更多或更少的功率，而这取决于系统的配置。如果你使用的是一个特别耗电或者特别节能的配置，请灵活决定你的电源需求。
  2. 你的电源没有提供必须的接线口来为你的显卡供电。



PSU 的更换很容易，但是在你拆除你当前正在使用的电源之前，请务必注意你的接线布局。除此之外，请确保你选择的 PSU 适合你的机箱。

#### CPU

虽然在大多数老机器上安装高性能的 NVIDIA 显卡是可能的，但是一个缓慢或受损的 CPU 会阻碍显卡性能的发挥，如果要计算在你的机器上瓶颈效果的影响，请点击这里。知道你的 CPU 性能来避免高性能的显卡和 CPU 无法保持匹配是很重要的。升级你的 CPU 是一个潜在的考虑因素。

#### 主板

在继续进行之前，请确认你的主板和你选择的显卡是兼容的。你的显卡应该插在最靠近散热器的 PCI-E x16 插槽中。确保你的设置为显卡预留了足够的空间。此外，请注意，现在大部分的显卡使用的都是 PCI-E 3.0 技术。虽然这些显卡如果插在 PCI-E 3.0 插槽上会运行地最好，但如果插在一个旧版的插槽上的话，性能也不会受到太大的影响。

### 安装
```
sudo dnf update

```

2\. 然后，使用这条简单的命令进行重启：
```
reboot

```

3\. 在重启之后，安装 Fedora 28 的工作站仓库：
```
sudo dnf install fedora-workstation-repositories

```

4\. 接着，设置 NVIDIA 驱动仓库：
```
sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver

```

5\. 然后，再次重启。

6\. 在这次重启之后，通过下面这条命令验证是否添加了仓库：
```
sudo dnf repository-packages rpmfusion-nonfree-nvidia-driver info

```

如果加载了多个 NVIDIA 工具和它们各自的参数，请继续进行下一步。如果没有，你可能在添加新仓库的时候遇到了一个错误。你应该再试一次。

7\. 登陆，连接到互联网，然后打开软件应用程序。点击加载项>硬件驱动> NVIDIA Linux 图形驱动>安装。

接着，再一次重启。

8\. 在重新启动后，转到侧栏上的‘显示应用程序’，然后打开新添加的 NVIDIA X 服务器设置应用程序。一个图形界面会被打开，然后出现一个对话框并包含以下信息：

![NVIDIA X Server Prompt][5]

请参考应用程序的建议，但是在这样做之前，请确保你的 NVIDIA 显卡就在手里，并且已准备好去安装。请注意在以 root 身份运行 nvidia xconfig 的时候，如果在没有立刻安装显卡的情况下关闭电源，这可能会造成严重损坏。这样做可能会导致你的电脑无法启动，并强制你通过重启屏幕来修复系统。重新安装 Fedora 会修复这些问题，但是效果会更加糟糕。

如果你已准备好继续，请输入下面这条命令：
```
sudo nvidia-xconfig

```

如果系统提示你完成任何地下载，请选择接收然后继续。

9\. 一旦这个过程完成，关闭所有的应用程序并关闭电脑，拔掉机器的电源。然后，按一下电源按钮来释放掉多有的剩余电量，以此来保护你自己不会被点击。如果你的 PSU 有电源开关，请将其关闭。

10\. 最后，安装显卡，拔掉老的显卡并将新的显卡插入到正确的 PCI-E x16 插槽中，风扇朝着下方。如果这个位置已经没有空间让风扇通风。那作为代替，如果可以的话就把显卡面朝上放置。成功安装新的显卡之后，关闭你的机箱，插入 PSU ，然后打开计算机，它应该会成功启动。

**注意:** 要禁用此安装中使用的 NVIDIA 驱动仓库，或者要禁用所有的 Fedora 工作站仓库，请参考这个 Fedora Wiki 页面。

### 验证

1\. 如果你新安装的显卡已连接到你的显示器并显示正确，则表明你的 NVIDIA 驱动程序已成功和显卡建立连接。

如果你想去查看你的设置，或者验证驱动是否在正常工作（如果机箱的主板里安装了两块显卡），再次打开 NVIDIA X 服务器设置应用程序。这次，你应该不会被提示一个错误信息，并且系统会给出有关 X 的设置文件和你的 NVIDIA 显卡的信息。（请参考下面的屏幕截图）

![NVIDIA X Server Settings][7]

通过这个应用程序，你可以根据你的需要需改 X 配置文件，并可以监控显卡的性能，时钟速度和温度信息。

2\. 为确保新显卡以满功率运行，一次显卡性能测试是非常必要的。GL Mark 2，是一个提供后台处理、构建、照明、纹理等等有关信息的标准工具。它提供了一个优秀的解决方案。GL Mark 2 记录了各种各样的图形测试的帧速率，然后输出一个总体的性能评分（这被称为 glmark2 分数）。

**注意:** glxgears 只会测试你的屏幕或显示器的性能，不会测试显卡本身，请使用 GL Mark 2。

要运行 GLMark2:

  1. 打开终端并关闭其他所有的应用程序
  2. 运行 sudo dnf install glmark2 命令
  3. 运行 glmark2 命令
  4. 允许运行完整的测试来得到最好的结果。检查帧速率是否符合你对这块显卡的预期。如果你想要额外的验证，你可以查阅网站来确认是否已有你这块显卡的 glmark2 测试评分被公布到网上，你可以比较这个分数来评估你这块显卡的性能。
  5. 如果你的帧速率或者 glmark2 评分低于预期，请思考潜在的因素。CPU 造成的瓶颈？其他问题导致？


如果诊断的结果很好，就开始享受你的新显卡吧。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-nvidia-gpu/

作者：[Justice del Castillo][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/justice/
[1]:https://whatis.techtarget.com/definition/Unified-Extensible-Firmware-Interface-UEFI
[2]:https://www.cnet.com/products/pny-geforce-gtx-xlr8-gaming-1050-ti-overclocked-edition-graphics-card-gf-gtx-1050-ti-4-gb/specs/
[3]:https://www.evga.com/products/product.aspx?pn=100-B1-0600-KR
[4]:http://thebottlenecker.com (Home: The Bottle Necker)
[5]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/nvidia_xserver_error.jpg?token=c6a7effe35f1c592a155a4a46a068a19fd060a91 (NVIDIA X Sever Prompt)
[6]:https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
[7]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/NVIDIA_XCONFIG.png?token=64e1a7be21e5e9ba157f029b65e24e4eef54d88f (NVIDIA X Server Settings)
