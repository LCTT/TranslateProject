Linux 环境下使用 GNOME 3 桌面的 11 个理由
============================================================

### 设计 GNOME 3 的目标是简单、易访问以及可靠性。GNOME 的普及已经证实了这些目标都已实现。


![11 reasons to use the GNOME desktop environment](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/custom_gnomes.png?itok=hcRSdpXM "11 reasons to use the GNOME desktop environment")
>图片来源 : [Gunnar Wortmann][8] 来自 [Pixabay][9]. Opensource.com 修改 [CC BY-SA 4.0][10].

去年年底，Fedora 25 的一次升级给 [KDE][11] Plasma 的新版本带来了许多问题，因而这使得我很难完成任何工作。所以，我决定尝试一下其他的 Linux 桌面环境，这里有两个原因。第一，我需要完成我的工作。第二，我使用 KDE 已经好多年了，所以我觉得要尝试其它的桌面的话可能需要一些时间。   

第一个替换它的桌面是 [Cinnamon][12] ，我在一月份编写完之后尝试性的用了几周，然后我又编写了 [LXDE][13]，这一次我用了八周，并且发现了许多有意思的事情，为了研究这篇文章，我已经使用了 [GNOME 3][14]           好几周了。

更多 Linux 资源

*   [什么是 Linux？][1]

*   [Linux containers 是什么？][2]

*   [即刻下载： Linux 命令速查表][3]

*   [高阶 Linux 命令速查表][4]

*   [我们最新的 Linux 文章][5]

几乎和网络世界的其它事物一样，GNOME 是一个缩写词;它代表的是 GNU Network Object Model Environment（GNU 网络对象模型环境）。当初设计 GNOME 3 的目的就是简单，易访问和可靠性。现在 GNOME 的普及已经证实了这些目标都已实现。

GNOME 3 在许多屏幕实际使用面积这样的环境中是非常有用的。这就意味着它是带有两个高分辨率的大屏幕，并且还减小了像运行程序时的桌面小工具、组件和图标所占用的空间。GNOME 工程有一套人机界面指南，它为人类应该如何和电脑进行交互定义了 GNOME 思想体系。

### 我使用 GNOME 3 的十一个理由

1.  **选择：** GNOME 在许多形式的系统中都可以使用，例如我最喜欢的 Fedora。桌面可供你选择的登录选项有 GNOME Classic、GNOME on Xorg 以及 GNOME(Wayland)。 从表面上来看，一旦他们运行起来看起来都一样，但是他们使用了不同的 Xsever，或者说他们他们是由不同的工具包所构成。Wayland 在桌面的一些小细节方面也提供了一些小功能，例如滚动操作、拖放以及用中键粘贴。

2.  **快速入门教程：** 第一次进入桌面时在用户日志里面有快速入门教程。它展示了怎么执行共同的任务并且还提供了一个帮助链接。这份教程被丢之后也很容易在第一启动项中找到，所以说它在任何时候都可以被找到。它非常简单和通俗易懂，并且它给使用 GNOME 的新用户提供了一个简单明了的起点。为了回到之后的教程，点击 **Activities**，然后在点击显示应用程序的九个点的四边形区域。然后就找到了救生圈图标 **Help**，再点击它就可以了。

3.  **清理桌面：** 以一种极简主义者的方式来接触桌面环境是为了减小杂乱，GNOME 的设计旨在仅以小需求来实现功能环境。你应该只能看到顶栏（是的，人们就是这么称呼它的），并且其他功能只有你需要的时候才会显示出来。它的意图就在于让用户关注手头的任务并且减少桌面上其它的暂时不需要的东西对用户造成的分心。

4.  **顶栏：** 不管你想做什么，顶栏总是处于开始的位置。你可以运行应用程序，注销系统，关闭电源，打开或者关闭网络以及其他的事情。这些事情会在当你想去做其他事情的时候让生活变得简单。在当前应用的一侧，顶栏通常是桌面的其它项目。

5.  **The dash:** dash 默认的包含三个图标，正如下图所示。当你使用应用程序的时候他们就被附加到 dash 里面，以便你使用频率最高的应用程序会出现在这。你也可以自己将应用程序的图标从应用列表加到 dash 里面。
    ![gnome_fig_2.png](https://opensource.com/sites/default/files/images/life-uploads/gnome_fig_2.png)

6.  **应用列表：** 我真的很喜欢这个应用列表，它在 GNOME 桌面的左侧垂直栏就可以找到。GNOME 桌面通常情况下什么也没有，除非有一些正在运行的应用程序。所以你必须点击顶栏的 **Activities** 选项，然后再点击 dash 底部包含九个点的正方形区域，这就是应用列表的图标。

    ![gnome_fig_1.png](https://opensource.com/sites/default/files/images/life-uploads/gnome_fig_1.png)

    以上所示，这个应用列表本身是一个包含已安装应用图标的矩阵。矩阵的下方包含一对相互独显的按钮，**Frequent** 和 **All**。在默认状态下，应用列表会显示所有已安装应用。点击 **Frequent** 按钮，它只会显示你经常使用的应用程序。 通过向上或向下滚动可定位一个你想运行的应用程序。这些应用程序会按照名字的字母先后顺序被呈现出来。

    [GNOME][6] 网站和嵌入式帮助工具都显现了应用列表的很多细节。

7.  **应用就绪通知：** GNOME 还有一个简洁的通知栏，当窗口上刚刚运行的应用程序界面正要出现时，通知栏会出现在屏幕的顶部。只要点一下通知按钮就会跳回到窗口下。相比其它桌面还要搜索刚刚打开的应用程序，这已经省了我的好多时间。 

8.  **应用显示：** 为了能够访问你看不见但正在运行的应用，你需要点击 activity 菜单。然后在桌面上的一个矩阵里面你可以看到所有正在运行的应用。随意点击一个应用把他拖到前台进程里面。虽然 Top Bar 里面显示的是当前正在使用的应用，但是其它正在运行的应用并不会在这里面。 

9.  **最小的窗口装饰：** 桌面上的窗口打开之后你会发现也是相当的简约。唯一的一个显眼的按钮就是关闭窗口的 "**X**"。所有其它的一些功能都搬到了另一个桌面上，像最小化、最大化等等，在标题栏点击右键就可以看到其它功能。

10.  **自动创建新的桌面：** 当下面的空白桌面被使用时总会自动生成一个新的空白桌面。这就意味着总是会有一个空白桌面处于待用状态。虽然我所用过的其它桌面都会在桌面激活时让你设置序号，但是通过系统设置才能手动设置序号。

11.  **兼容性：** 与我所用过的所有其它桌面相比，为其它桌面创造的应用也可以在 GNOME 下使用。这个特别之处让我测试其他的所有桌面成为了可能，由此我才能够把他们写出来。

### 最后的感想

GNOME 不像我所用过的任何一款桌面。它的首要法则就是“简洁”。其它的所有事情都居于“简洁”和易用的次要地位。如果你有快速入门教程的话，你只需要很少的时间就可以学会怎么使用 GNOME。但是那并不意味着 GNOME
在任何方面都有不足之处。它是一款强劲并且很灵活的桌面。

--------------------------------------------------------------------------------

作者简介：

David Both - David Both 是一名 Linux 和开源爱好者，他居住在北卡罗来纳州的首府——罗利。他在 IT 行业已经待了四十年了，其中在 IBM 公司教授 OS/2 操作系统大约有 20 年了。在 1981 年的时候，那时候他还在 IBM 公司，那时他为最初的 IBM PC 写了第一篇训练课程。他还为 Red Hat 公司教授 RHCE （红帽认证工程师）课程，他还曾经在世通公司、思科以及北卡罗来纳州工作过。他从事 Linux 和开源软件已经接近 20 年了。

---------------

via: https://opensource.com/article/17/5/reasons-gnome

作者：[David Both ][a]
译者：[ChauncyD](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://www.gnome.org/gnome-3/
[7]:https://opensource.com/article/17/5/reasons-gnome?rate=MbGLV210A21ONuGAP8_Qa4REL7cKFvcllqUddib0qMs
[8]:https://pixabay.com/en/users/karpartenhund-3077375/
[9]:https://pixabay.com/en/garden-gnome-black-and-white-f%C3%B6hr-1584401/
[10]:https://creativecommons.org/licenses/by-sa/4.0/
[11]:https://opensource.com/life/15/4/9-reasons-to-use-kde
[12]:https://opensource.com/article/17/1/cinnamon-desktop-environment
[13]:https://opensource.com/article/17/3/8-reasons-use-lxde
[14]:https://www.gnome.org/gnome-3/
[15]:https://opensource.com/user/14106/feed
[16]:https://opensource.com/article/17/5/reasons-gnome#comments
[17]:https://opensource.com/users/dboth
