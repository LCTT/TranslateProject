在 Ubuntu 和 Linux Mint 上安装 Terminator 0.98
================================================================================
[Terminator][1]，它可以在一个窗口内打开多个终端。该项目的目标之一是为摆放终端提供一个有用的工具。它的灵感来自于类似 gnome-multi-term，quankonsole 等程序，这些程序关注于按网格摆放终端。 Terminator 0.98 带来了更完美的标签功能，更好的布局保存/恢复，改进了偏好用户界面和多处 bug 修复。

![](http://www.ewikitech.com/wp-content/uploads/2015/09/Screenshot-from-2015-09-17-094828.png)

###TERMINATOR 0.98 的更改和新特性

- 添加了一个布局启动器，允许在不用布局之间简单切换（用 Alt + L 打开一个新的布局切换器）；
- 添加了一个新的手册（使用 F1 打开）；
- 保存的时候，布局现在会记住：
    - 最大化和全屏状态
    - 窗口标题
    - 激活的标签
    - 激活的终端
    - 每个终端的工作目录
- 添加选项用于启用/停用非同类（non-homogenous）标签和滚动箭头；
- 添加快捷键用于按行/半页/一页向上/下滚动;
- 添加使用 Ctrl+鼠标滚轮来放大/缩小，Shift+鼠标滚轮向上/下滚动页面；
- 为下一个/上一个配置文件（profile）添加快捷键
- 改进自定义命令菜单的一致性
- 新增快捷方式/代码来切换所有/标签分组;
- 改进监视插件
- 增加搜索栏切换；
- 清理和重新组织偏好（preferences）窗口，包括一个完整的全局便签更新
- 添加选项用于设置 ActivityWatcher 插件静默时间
- 其它一些改进和 bug 修复
- [点击此处查看完整更新日志][2]

### 安装 Terminator 0.98：

Terminator 0.98 有可用的 PPA，首先我们需要在 Ubuntu/Linux Mint 上添加库。在终端里运行下面的命令来安装 Terminator 0.98。

    $ sudo add-apt-repository ppa:gnome-terminator/nightly
    $ sudo apt-get update
    $ sudo apt-get install terminator
    
如果你想要移除 Terminator，只需要在终端中运行下面的命令（可选）

    $ sudo apt-get remove terminator

--------------------------------------------------------------------------------

via: http://www.ewikitech.com/articles/linux/terminator-install-ubuntu-linux-mint/

作者：[admin][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ewikitech.com/author/admin/
[1]:https://launchpad.net/terminator
[2]:http://bazaar.launchpad.net/~gnome-terminator/terminator/trunk/view/head:/ChangeLog



