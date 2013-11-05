系统信息工具I-Nex 0.5.4发布
================================================================================
[I-Nex][1] 是一个免费开源的系统信息工具，收集，分类并且在一个干净清晰的界面显示关于计算机相关信息。

从本质上说，I-Nex显示一个非常详细的系统组件信息，包括驱动，内核，RAM，网络，USB，CPU，GPU，主板，音频，允许用户很容易的掌握自己的计算机和操作系统信息。

启动I-Nex，它的主窗口和几个选项卡（tab）会出现，点击一个选项卡，窗口上就会显示相关信息，点击另一个选项卡，主视图会更具详情重新显示；例如，点击 `CPU` 选项卡了，显示关于CPU的名称，频率，系列，模式，扩展，高速缓存，等等，基本上，它就是一个方便的信息捆绑。

![](http://iloveubuntu.net/pictures_me/i-nex%20054%20cpu.png)

I-Nex 已经更新至 **0.5.4** ,在原本的基础上增加了新的功能，扩展支持还有under-the-hood增强。

新版本丰富了选项卡条目，比如 `GPU`；点击 `GPU` 选项卡，用户可以注意到新的 `Total Memory`, `Monitor name`, `Manufacturer`, `Serial number` 条目，增加了新的明细描述系统组件。

![](http://iloveubuntu.net/pictures_me/i-nex%20054%20gpu.png)

此外，0.5.4版本有多个修复，进一步朝着有用的能用的系统信息应用程序工具发展，自己作为一个Ubuntu替代全球使用的专有系统信息应用程序。

我们怎么 **安装** I-Nex 0.5.4呢？

Add the following **official** PPA (Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10, Ubuntu 13.04, Ubuntu 13.10)
增加 **official** PPA  (Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10, Ubuntu 13.04, Ubuntu 13.10)


    sudo add-apt-repository ppa:i-nex-development-team/stable && sudo add-apt-repository ppa:nemh/gambas3
    sudo apt-get update
    sudo apt-get install i-nex

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/system-information-tool-i-nex-054-released-improvements

译者：[flsf](https://github.com/flsf) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/i-nex
