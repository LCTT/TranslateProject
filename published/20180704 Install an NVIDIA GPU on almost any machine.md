如何在绝大部分类型的机器上安装 NVIDIA 显卡驱动
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/nvidia-816x345.jpg)

无论是研究还是娱乐，安装一个最新的显卡驱动都能提升你的计算机性能，并且使你能全方位地实现新功能。本安装指南使用 Fedora 28  的新的第三方仓库来安装 NVIDIA 驱动。它将引导您完成硬件和软件两方面的安装，并且涵盖需要让你的 NVIDIA 显卡启动和运行起来的一切知识。这个流程适用于任何支持 UEFI 的计算机和任意新的 NVIDIA  显卡。

### 准备

本指南依赖于下面这些材料：

  * 一台使用 [UEFI][1] 的计算机，如果你不确定你的电脑是否有这种固件，请运行 `sudo dmidecode -t 0`。如果输出中出现了 “UEFI is supported”，你的安装过程就可以继续了。不然的话，虽然可以在技术上更新某些电脑来支持 UEFI，但是这个过程的要求很苛刻，我们通常不建议你这么使用。
  * 一个现代的、支持 UEFI 的 NVIDIA 的显卡
  * 一个满足你的 NVIDIA 显卡的功率和接线要求的电源（有关详细信息，请参考“硬件和修改”的章节）
  * 网络连接
  * Fedora 28 系统

### 安装实例

这个安装示例使用的是：

  * 一台 Optiplex 9010 的主机（一台相当老的机器）
  * [NVIDIA GeForce GTX 1050 Ti XLR8 游戏超频版 4 GB GDDR5 PCI Express 3.0 显卡][2]
  * 为了满足新显卡的电源要求，电源升级为 [EVGA – 80 PLUS 600 W ATX 12V/EPS 12V][3]，这个最新的电源（PSU）比推荐的最低要求高了 300 W，但在大部分情况下，满足推荐的最低要求就足够了。
  * 然后，当然的，Fedora 28 也别忘了.

### 硬件和修改

#### 电源（PSU）

打开你的台式机的机箱，检查印刷在电源上的最大输出功率。然后，查看你的 NVIDIA 显卡的文档，确定推荐的最小电源功率要求（以瓦特为单位）。除此之外，检查你的显卡，看它是否需要额外的接线，例如 6 针连接器，大多数的入门级显卡只从主板获取电力，但是有一些显卡需要额外的电力，如果出现以下情况，你需要升级你的电源：

  1. 你的电源的最大输出功率低于显卡建议的最小电源功率。注意：根据一些显卡厂家的说法，比起推荐的功率，预先构建的系统可能会需要更多或更少的功率，而这取决于系统的配置。如果你使用的是一个特别耗电或者特别节能的配置，请灵活决定你的电源需求。
  2. 你的电源没有提供必须的接线口来为你的显卡供电。

电源的更换很容易，但是在你拆除你当前正在使用的电源之前，请务必注意你的接线布局。除此之外，请确保你选择的电源适合你的机箱。

#### CPU

虽然在大多数老机器上安装高性能的 NVIDIA 显卡是可能的，但是一个缓慢或受损的 CPU 会阻碍显卡性能的发挥，如果要计算在你的机器上瓶颈效果的影响，请点击[这里][4]。了解你的 CPU 性能来避免高性能的显卡和 CPU 无法保持匹配是很重要的。升级你的 CPU 是一个潜在的考虑因素。

#### 主板

在继续进行之前，请确认你的主板和你选择的显卡是兼容的。你的显卡应该插在最靠近散热器的 PCI-E x16 插槽中。确保你的设置为显卡预留了足够的空间。此外，请注意，现在大部分的显卡使用的都是 PCI-E 3.0 技术。虽然这些显卡如果插在 PCI-E 3.0 插槽上会运行地最好，但如果插在一个旧版的插槽上的话，性能也不会受到太大的影响。

### 安装

1、 首先，打开终端更新你的包管理器（如果没有更新的话）：

```
sudo dnf update
```

2、 然后，使用这条简单的命令进行重启：

```
reboot
```

3、 在重启之后，安装 Fedora 28 的工作站的仓库：

```
sudo dnf install fedora-workstation-repositories
```

4、 接着，设置 NVIDIA 驱动的仓库：

```
sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
```

5、 然后，再次重启。

6、 在这次重启之后，通过下面这条命令验证是否添加了仓库：

```
sudo dnf repository-packages rpmfusion-nonfree-nvidia-driver info
```

如果加载了多个 NVIDIA 工具和它们各自的 spec 文件，请继续进行下一步。如果没有，你可能在添加新仓库的时候遇到了一个错误。你应该再试一次。

7、 登录，连接到互联网，然后打开“软件”应用程序。点击“加载项>硬件驱动> NVIDIA Linux 图形驱动>安装”。

如果你使用更老的显卡或者想使用多个显卡，请进一步查看 [RPMFusion 指南][8]。最后，要确保启动成功，设置 `/etc/gdm/custom.conf` 中的  `WaylandEnable=false`，确认避免使用安全启动。
接着，再一次重启。

8、这个过程完成后，关闭所有的应用并**关机**。拔下电源插头，然后按下电源按钮以释放余电，避免你被电击。如果你对电源有开关，关闭它。

9、 最后，安装显卡，拔掉老的显卡并将新的显卡插入到正确的 PCI-E x16 插槽中。成功安装新的显卡之后，关闭你的机箱，插入电源 ，然后打开计算机，它应该会成功启动。

**注意：** 要禁用此安装中使用的 NVIDIA 驱动仓库，或者要禁用所有的 Fedora 工作站仓库，请参考这个 [Fedora Wiki 页面][6]。

### 验证

1、 如果你新安装的 NVIDIA 显卡已连接到你的显示器并显示正确，则表明你的 NVIDIA 驱动程序已成功和显卡建立连接。

如果你想去查看你的设置，或者验证驱动是否在正常工作（这里，主板上安装了两块显卡），再次打开 “NVIDIA X 服务器设置应用程序”。这次，你应该不会得到错误信息提示，并且系统会给出有关 X 的设置文件和你的 NVIDIA 显卡的信息。（请参考下面的屏幕截图）

![NVIDIA X Server Settings][7]

通过这个应用程序，你可以根据你的需要需改 X 配置文件，并可以监控显卡的性能，时钟速度和温度信息。

2、 为确保新显卡以满功率运行，显卡性能测试是非常必要的。GL Mark 2，是一个提供后台处理、构建、照明、纹理等等有关信息的标准工具。它提供了一个优秀的解决方案。GL Mark 2 记录了各种各样的图形测试的帧速率，然后输出一个总体的性能评分（这被称为 glmark2 分数）。

**注意:** glxgears 只会测试你的屏幕或显示器的性能，不会测试显卡本身，请使用 GL Mark 2。

要运行 GLMark2：

  1. 打开终端并关闭其他所有的应用程序
  2. 运行 `sudo dnf install glmark2` 命令
  3. 运行 `glmark2` 命令
  4. 允许运行完整的测试来得到最好的结果。检查帧速率是否符合你对这块显卡的预期。如果你想要额外的验证，你可以查阅网站来确认是否已有你这块显卡的 glmark2 测试评分被公布到网上，你可以比较这个分数来评估你这块显卡的性能。
  5. 如果你的帧速率或者 glmark2 评分低于预期，请思考潜在的因素。CPU 造成的瓶颈？其他问题导致？


如果诊断的结果很好，就开始享受你的新显卡吧。

### 参考链接

- [How to benchmark your GPU on Linux][9]
- [How to install a graphics card][10]
- [The Fedora Wiki Page][6]
- [The Bottlenecker][4]
- [What Is Unified Extensible Firmware Interface (UEFI)][1]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-nvidia-gpu/

作者：[Justice del Castillo][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/justice/
[1]:https://whatis.techtarget.com/definition/Unified-Extensible-Firmware-Interface-UEFI
[2]:https://www.cnet.com/products/pny-geforce-gtx-xlr8-gaming-1050-ti-overclocked-edition-graphics-card-gf-gtx-1050-ti-4-gb/specs/
[3]:https://www.evga.com/products/product.aspx?pn=100-B1-0600-KR
[4]:http://thebottlenecker.com (Home: The Bottle Necker)
[5]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/nvidia_xserver_error.jpg?token=c6a7effe35f1c592a155a4a46a068a19fd060a91 (NVIDIA X Sever Prompt)
[6]:https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
[7]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/NVIDIA_XCONFIG.png?token=64e1a7be21e5e9ba157f029b65e24e4eef54d88f (NVIDIA X Server Settings)
[8]:https://rpmfusion.org/Howto/NVIDIA?highlight=%28CategoryHowto%29
[9]: https://www.howtoforge.com/tutorial/linux-gpu-benchmark/
[10]: https://www.pcworld.com/article/2913370/components-graphics/how-to-install-a-graphics-card.html