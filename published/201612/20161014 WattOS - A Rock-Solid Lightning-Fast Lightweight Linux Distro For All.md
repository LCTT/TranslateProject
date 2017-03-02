WattOS：一个稳如磐石、快如闪电、面向所有人的轻量级 Linux 发行版
=============================

![WattOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wattos-main.png?itok=b7-Z7GK1)

*Jack Wallen 将介绍一下是什么让 WattOS 这么特别。 [使用许可][81]*

Linux 领域里的每个人不是听说过就是使用过某个轻量级的 Linux 发行版。大家都知道我们不断追求的是：占用内存少，配置资源要求低，包含一个轻量级的桌面环境（或者窗口管理器），并且提供和其他发行版相似的桌面布局，把赌注押在相同的需求之上。

这种发行版大多用来工作。有一个可以击垮很多轻量级 Linux 发行版的问题，它们没有真正含有一般用户完成工作需要的工具。结果就是，它们沦落为用来完成特殊任务（像数据恢复、做信息亭等）。

在某种程度上，WattOS 陷入了同样的困境（它唯一含有的生产力工具是 PDF 阅读器，而且它使用标准的“任务栏/开始菜单”象征桌面）。然而幸运的是，WattOS 通过难以置信的运行速度、稳定性以及内置新立得包管理器弥补了这些缺点；所以，WattOS 可以很容易的成为一个适合所有人的轻量级 Linux 发行版。

到底是什么让 WattOS 如此特别，让我们一起一探究竟。

### 内核

事实上当我发现 WattOS 基于 kernel 4.4 内核时我非常吃惊。升级系统之后，执行 `uname -r` 命令可以看到是 4.4.0-38-generic。鉴于这个发行版的目的是让老旧和运行卡顿的机器重获新生，它和我的 Elementary OS Loki 发行版内置相同版本的内核真是一个可爱的惊喜。这意味着 WattOS 在新旧硬件上都会有良好的工作表现。

真正的惊喜不止于此，当你去 WattOS 的网站，你会同时发现 32 位和 64 位版本的下载地址（现在大多数新的发行版都倾向于放弃 32 位发行版本）。所以，不仅系统内核对新式硬件提供支持，而且系统发行版本的多种架构也能让那些老式的 32 位机器重获新生。

### 运行速度

当安装上 WattOS 的时候，有那么一刻我对它有纯粹的羡慕。WattOS 的运行速度快的令人难以置信。甚至当它的桌面版作为客户机在 VirtualBox 虚拟机平台工作时，运行速度依然远远超过了我的 Elementary OS Loki 桌面发行版。后来我才了解到当时运行的宿主机是 [System76 Leopard][80]，配置有水冷装置的 i7 处理器和 16GB 的运行内存。分配给 WattOS 大约 2G 的内存，让它看起来没有什么任务可以拖慢它。WattOS 的运行速度壮观的令人难以诉说，它越来越成熟了。我从没见过火狐浏览器能打开的这么快。

接下来说说 LibreOffice 应用的启动。由于想测试 LibreOffice 的启动速度，所以我打开了新立得软件包管理器，计划安装这一开源办公软件套件的佼佼者。

无果。

安装 LibreOffice 的主要问题是缺少一个依赖软件包 python3-uno，而且无论怎么尝试都无法安装成功。然而，最后我在 [LibreOffice 官方网站][79] 上下载了 deb 格式的软件包。把下载的文件解压之后，`cd` 到 LibreOffice_5.2.2.2_Linux_x86-64_deb/DEBS/ 目录下，最后通过执行 `sudo dpkg -i *.deb` 命令成功的安装好了 LibreOffice。

LibreOffice 运行的怎么样呢？速度快到要疯了。值得再提的是，我从没见过这个应用能像在 WattOS 上运行的这么快。点击 LibreOffice Writer 的图标，它花费的时间是在 Elementary OS Loki （已经很快了）主机上花费的一半。

### 桌面

我个人偏爱于桌面向更加现代化的趋势进行迭代。我是 Ubuntu 的 Unity 桌面，GNOME 3 桌面，以及（特别是） [Elementary OS][78] 的粉丝。所以使用古老风格桌面的主意意味着对我几乎没有吸引力。即便如此，WattOS 在把现代设计风格融入老式设计时做的非常好。举例来说，默认的桌面主题（图 1）。WattOS 的 UI 设计者巧妙设计了桌面主题，所以它没有完全偏离 Windows XP 或者老式 Linux CDE 风格的窗口管理器的设计理念。

![WattOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wattos_a.png?itok=eavmkVgL)

*图 1：WattOS 的文件管理器展示了有些现代化的主题  [使用许可][76]*

关于 WattOS 的桌面（基于 [LXDE][75]）的确有一些要说的但以前从来没说过，就是每个拥有像简洁、直接，有足够灵活度和自定义度这些特点的 Linux 桌面版，对每个使用过 Windows 95 的电脑使用者来说都会很熟悉。

### 惊喜之处，优点和缺点

正像每个新的 Linux 桌面版的体验那样，WattOS 有让人惊喜的地方，同时也有优点和缺点。首先，说说优点。

WattOS 除了绝对的速度（用一个简单的 “WOW” 来评论），还在桌面上固定了一些特别的惊喜（大多数都是预置的应用）。额外的软件中最好的是 [KeePassX][74]（一个极少被默认包含在桌面版的应用）。我认为密码管理器应该默认安装在每一个电脑桌面上，值得骄傲的是 WattOS 预装了这个杰出的工具。

下一个讨论的是预装火狐浏览器。许多轻量级的发行版会预装像 [Surf][73] 或者 [Midori][72] 这样的浏览器。这两个浏览器都不错，但是它们的兼容性经常达不到像谷歌文档这样网站的要求。因为 WattOS 含有成熟的火狐浏览器，你会发现该系统的功能在火狐浏览器兼容的网站上表现的很完美。

最后，算不上好的意外。正如我已经提到的，在安装 LibreOffice 时马上就有了故障。然而安装像 GIMP 这样的软件就很顺利（所以我认为这是偶然问题）。除了这一个问题，我觉得默认桌面菜单有些混乱。例如，新立得软件包管理器放在个性化菜单里。我更愿在主菜单中突出显示项中看到它，并且加上类似“软件安装”（或任何其他新用户容易理解）的标签。从我的视角来说，个性化菜单项应该用于放置配置该平台各种风格的工具，而不是安装软件的工具。

除此之外，若想在 WattOS 主攻方向上的找茬的话，特别是你要找一个面对老旧硬件 Linux 发行版时，你会发现这非常困难。

### 结论

尽管 WattOS 主要为老旧硬件设计，但你完全可以把它运行在现代桌面电脑上，并且会运行的很好。根据零学习曲线，你很快就会熟悉 WattOS，并发现它运行极快而且稳定。试试这个小排量的 Linux 发行版吧，相信它会给你同样深刻的印象。如果你发现 WattOS 运行的不够快（发生了一些我没有预料到的事），你完全可以去使用 [Microwatt][71]（一个更轻的轻量级发行版）。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/wattos-rock-solid-lightning-fast-lightweight-linux-distro-all

作者：[JACK WALLEN][a]
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[1]:https://www.youtube.com/channel/UCOfXyFkINXf_e9XNosTJZDw
[2]:https://www.youtube.com/user/desainew
[3]:https://www.youtube.com/channel/UCEQXp_fcqwPcqrzNtWJ1w9w
[4]:http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[5]:http://twitter.com/intent/tweet/?text=Is+Open+Source+Design+a+Thing%3F&url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[6]:https://plus.google.com/share?url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[7]:https://atom.io/
[8]:http://froont.com/
[9]:https://webflow.com/
[10]:https://gravit.io/
[11]:http://getbootstrap.com/
[12]:https://inkscape.org/en/
[13]:https://www.gimp.org/
[14]:https://en.wikipedia.org/wiki/Free_and_open-source_software
[15]:https://medium.com/dawn-capital/why-leverage-the-power-of-open-source-to-build-a-successful-software-business-8aba6f665bc4#.ggmn2ojxp
[16]:https://github.com/majutsushi/tagbar
[17]:http://ctags.sourceforge.net/
[18]:https://github.com/majutsushi/tagbar/zipball/70fix
[19]:https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
[20]:http://www.vim.org/scripts/script.php?script_id=2332
[21]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/
[22]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-delimitmate-help.png
[23]:https://github.com/Raimondi/delimitMate
[24]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-visibility.png
[25]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-ex2.png
[26]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-example.png
[27]:http://www.tldp.org/LDP/intro-linux/html/sect_06_02.html
[28]:http://majutsushi.github.io/tagbar/
[29]:http://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers
[30]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-vimrc.png
[31]:http://www.vim.org/
[32]:https://github.com/scrooloose/syntastic
[33]:https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
[34]:https://www.howtoforge.com/images/3337/big/syntastic-error-all-descr.png
[35]:https://www.howtoforge.com/images/3337/big/syntastic-error-descr.png
[36]:https://www.howtoforge.com/images/3337/big/syntastic-error-highlight.png
[37]:https://github.com/scrooloose/syntastic
[38]:http://www.vim.org/
[39]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers/
[40]:https://en.wikipedia.org/wiki/Trim_%28computing%29
[41]:https://en.wikipedia.org/wiki/Sudo
[42]:http://snapcraft.io/
[43]:http://flatpak.org/
[44]:https://en.wikipedia.org/wiki/Wine_%28software%29
[45]:https://en.wikipedia.org/wiki/Live_CD
[46]:http://distrowatch.com/
[47]:http://www.internetnews.com/skerner/2009/10/white-house-goes-open-source-w.html
[48]:https://www.whitehouse.gov/blog/2016/10/13/removing-barriers-constituent-conversations
[49]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[50]:http://midori-browser.org/
[51]:http://surf.suckless.org/
[52]:https://www.keepassx.org/
[53]:http://lxde.org/
[54]:https://www.linux.com/licenses/category/used-permission
[55]:https://www.linux.com/files/images/wattosapng
[56]:https://elementary.io/
[57]:https://www.libreoffice.org/
[58]:https://system76.com/desktops/leopard
[59]:https://www.linux.com/licenses/category/used-permission
[60]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[61]:http://midori-browser.org/
[62]:http://surf.suckless.org/
[63]:https://www.keepassx.org/
[64]:http://lxde.org/
[65]:https://www.linux.com/licenses/category/used-permission
[66]:https://www.linux.com/files/images/wattosapng
[67]:https://elementary.io/
[68]:https://www.libreoffice.org/
[69]:https://system76.com/desktops/leopard
[70]:https://www.linux.com/licenses/category/used-permission
[71]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[72]:http://midori-browser.org/
[73]:http://surf.suckless.org/
[74]:https://www.keepassx.org/
[75]:http://lxde.org/
[76]:https://www.linux.com/licenses/category/used-permission
[77]:https://www.linux.com/files/images/wattosapng
[78]:https://elementary.io/
[79]:https://www.libreoffice.org/
[80]:https://system76.com/desktops/leopard
[81]:https://www.linux.com/licenses/category/used-permission
