[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11202-1.html)
[#]: subject: (What is a golden image?)
[#]: via: (https://opensource.com/article/19/7/what-golden-image)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

什么是黄金镜像？
======

> 正在开发一个将广泛分发的项目吗？了解一下黄金镜像吧，以便在出现问题时轻松恢复到“完美”状态。

![](https://img.linux.net.cn/data/attachment/album/201908/08/184231ivv745lukchbrhul.jpg)

如果你正在从事于质量保证、系统管理或媒体制作（没想到吧），你可能听说过<ruby>正式版<rt>gold master</rt></ruby>这一术语的某些变体，如<ruby>黄金镜像<rt>golden image</rt></ruby>或<ruby>母片<rt>master image</rt></ruby>等等。这个术语已经进入了每个参与创建**完美**模具的人的集体意识，然后从该模具中产生许多复制品。母片或黄金镜像就是：一种虚拟模具，你可以从中打造可分发的模型。

在媒体制作中，这就是所有人努力开发母片的过程。这个最终产品是独一无二的。它看起来和听起来像是可以看和听的最好的电影或专辑（或其他任何东西）。可以制作和压缩该母片的副本并发送给急切的公众。

在软件中，与该术语相关联的也是类似的意思。一旦软件经过编译和一再测试，完美的构建成果就会被声明为**黄金版本**，不允许对它进一步更改，并且所有可分发的副本都是从此母片生成的（当软件是用 CD 或 DVD 分发时，这实际上就是母盘）。

在系统管理中，你可能会遇到你的机构所选的操作系统的黄金镜像，其中的重要设置已经就绪，如安装好的虚拟专用网络（VPN）证书、设置好的电子邮件收件服务器的邮件客户端等等。同样，你可能也会在虚拟机（VM）的世界中听到这个术语，其中精心配置了虚拟驱动器的黄金镜像是所有克隆的新虚拟机的源头。

### GNOME Boxes

正式版的概念很简单，但往往忽视将其付诸实践。有时，你的团队很高兴能够达成他们的目标，但没有人停下来考虑将这些成就指定为权威版本。在其他时候，没有简单的机制来做到这一点。

黄金镜像等同于部分历史的保存和提前备份计划。一旦你制作了一个完美的模型，无论你正在努力做什么，你都应该为自己保留这项工作，因为它不仅标志着你的进步，而且如果你继续工作时遇到问题，它就会成为一个后备。

[GNOME Boxes][2]，是随 GNOME 桌面一起提供的虚拟化平台，可以用作简单的演示用途。如果你从未使用过 GNOME Boxes，你可以在 Alan Formy-Duval 的文章 [GNOME Boxes 入门][3]中学习它的基础知识。

想象一下，你使用 GNOME Boxes 创建虚拟机，然后将操作系统安装到该 VM 中。现在，你想要制作一个黄金镜像。GNOME Boxes 已经率先摄取了你的安装快照，可以作为更多的操作系统安装的黄金镜像。

打开 GNOME Boxes 并在仪表板视图中，右键单击任何虚拟机，然后选择**属性**。在**属性**窗口中，选择**快照**选项卡。由 GNOME Boxes 自动创建的第一个快照是“Just Installed”。顾名思义，这是你最初安装到虚拟机上的操作系统。

![The Just Installed snapshot, or initial golden image, in GNOME Boxes.][4]

如果你的虚拟机变成了你不想要的状态，你可以随时恢复为“Just Installed”镜像。

当然，如果你已经为自己调整了环境，那么在安装后恢复操作系统将是一个极大的工程。这就是为什么虚拟机的常见工作流程是：首先安装操作系统，然后根据你的要求或偏好修改它，然后拍摄快照，将该快照声明为配置好的黄金镜像。例如，如果你使用虚拟机进行 [Flatpak][5] 打包，那么在初始安装之后，你可以添加软件和 Flatpak 开发工具，构建工作环境，然后拍摄快照。创建快照后，你可以重命名该虚拟机以指示其真实用途。

要重命名虚拟机，请在仪表板视图中右键单击其缩略图，然后选择**属性**。在**属性**窗口中，输入新名称：

![Renaming your VM image in GNOME Boxes.][6]

要克隆你的黄金映像，请右键单击 GNOME Boxes 界面中的虚拟机，然后选择**克隆**。

![Cloning your golden image in GNOME Boxes.][7]

你现在可以从黄金映像的最新快照中克隆了。

### 黄金镜像

很少有学科无法从黄金镜像中受益。无论你是在 [Git][8] 中标记版本、在 Boxes 中拍摄快照、出版原型黑胶唱片、打印书籍以进行审核、设计用于批量生产的丝网印刷、还是制作文字模具，到处都是各种原型。这只是现代技术让我们人类更聪明而不是更努力的另一种方式，因此为你的项目制作一个黄金镜像，并根据需要随时生成克隆吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/what-golden-image

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/origami_star_gold_best_top.jpg?itok=aEc0eutt (Gold star)
[2]: https://wiki.gnome.org/Apps/Boxes
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://opensource.com/sites/default/files/uploads/snapshots.jpg (The Just Installed snapshot, or initial golden image.)
[5]: https://opensource.com/business/16/8/flatpak
[6]: https://opensource.com/sites/default/files/uploads/boxes-rename_0.jpg (Renaming your virtual machine in GNOME Boxes.)
[7]: https://opensource.com/sites/default/files/uploads/boxes-clone.jpg (Cloning your golden image in GNOME Boxes.)
[8]: https://git-scm.com
