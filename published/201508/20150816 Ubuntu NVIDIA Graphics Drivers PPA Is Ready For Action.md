Ubuntu NVIDIA 显卡驱动 PPA 已经做好准备
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/08/Screen-Shot-2015-08-12-at-14.19.42.png)

加速你的帧率！

**嘿，各位，稍安勿躁，很快就好。**

就在提议开发一个[新的 PPA][1] 来给 Ubuntu 用户们提供最新的 NVIDIA 显卡驱动后不久，ubuntu 社区的人们又集结起来了，就是为了这件事。

顾名思义，‘**Graphics Drivers PPA**’ 包含了最新的 NVIDIA Linux 显卡驱动发布，已经打包好可供用户升级使用，没有让人头疼的二进制运行时文件！

这个 PPA 被设计用来让玩家们尽可能方便地在 Ubuntu 上运行最新款的游戏。

#### 万事俱备，只欠东风 ####

Jorge Castro 开发一个包含 NVIDIA 最新显卡驱动的 PPA 神器的想法得到了 Ubuntu 用户和广大游戏开发者的热烈响应。

就连那些致力于将“Steam平台”上的知名大作移植到 Linux 上的人们，也给了不少建议。

Edwin Smith，Feral Interactive 公司(‘Shadow of Mordor’) 的产品总监，对于“让用户更方便地更新驱动”的倡议表示非常欣慰。

### 如何使用最新的 Nvidia Drivers PPA###

虽然新的“显卡PPA”已经开发出来，但是现在还远远达不到成熟。开发者们提醒到：

> “这个 PPA 还处于测试阶段，在你使用它之前最好有一些打包的经验。请大家稍安勿躁，再等几天。”

将 PPA 试发布给 Ubuntu desktop 邮件列表的 Jorge，也强调说，使用现行的一些 PPA（比如 xorg-edgers)的玩家可能发现不了什么区别（因为现在的驱动只不过是把内容从其他那些现存驱动拷贝过来了）

“新驱动发布的时候，好戏才会上演呢，”他说。

截至写作本文时为止，这个 PPA 囊括了从 Ubuntu 12.04.1 到 15.10 各个版本的 Nvidia 驱动。注意这些驱动对所有的发行版都适用。

> **毫无疑问，除非你清楚自己在干些什么，并且知道如果出了问题应该怎么撤销，否则就不要进行下面的操作。**

新打开一个终端窗口，运行下面的命令加入 PPA：

    sudo add-apt-repository ppa:graphics-drivers/ppa

安装或更新到最新的 Nvidia 显卡驱动：

    sudo apt-get update && sudo apt-get install nvidia-355

记住：如果PPA把你的系统弄崩了，你可得自己去想办法，我们提醒过了哦。（译者注：切记！）

如果想要撤销对PPA的改变，使用 `ppa-purge` 命令。

有什么意见，想法，或者指正，就在下面的评论栏里写下来吧。（我没有 NVIDIA 的硬件来为我自己验证上面的这些东西，如果你可以验证的话，那就太感谢了。）

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/08/ubuntu-nvidia-graphics-drivers-ppa-is-ready-for-action

作者：[Joey-Elijah Sneddon][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://linux.cn/article-6030-1.html




