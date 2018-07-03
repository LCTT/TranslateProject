协同编辑器的历史性清单
======

按时间顺序快速列出主要协同编辑器的演变。

正如任何这样的清单一样，它必定会在一开始便提到被誉为“<ruby>[所有演示之母][25]<rt>the mother of all demos</rt></ruby>”，在这个演示里<ruby>[道格·恩格尔巴特][26]<rt>Doug Engelbart</rt></ruby>早在 1968 年就描述了几乎所有软件的详尽清单。这不仅包括协同编辑器，还包括图形、编程和数学编辑器。

一切都始于那个演示，只不过软件的实现跟不上硬件的发展罢了。

> 软件发展的速度比硬件提升的速度慢。——沃斯定律

闲话少说，这里是我找到的可圈可点的协同编辑器的清单。我说“可圈可点”的意思是它们具有可圈可点的特征或实现细节。

| 项目 | 日期 | 平台 | 说明 |
| --- | --- | --- | --- |
| [SubEthaEdit][1] | 2003-2015？ | 仅 Mac|我能找到的首个协同的、实时的、多光标的编辑器， [有个在 Emacs 上的逆向工程的尝试][2]却没有什么结果。 |
| [DocSynch][3] | 2004-2007 | ？ | 建立于 IRC 之上！ |
| [Gobby][4] | 2005 至今 | C，多平台 | 首个开源、稳固可靠的实现。 仍然存在！众所周知 [libinfinoted][5] 协议很难移植到其他编辑器中（例如： [Rudel][6] 不能在 Emacs 上实现此协议）。 2017 年 1 月发行的 0.7 版本添加了也许可以改善这种状况的 Python 绑定。 值得注意的插件: 自动保存到磁盘。|
| [Ethercalc][27] | 2005 至今 | Web，JavaScript | 首个电子表格，随同 [Google Docs][28]。 |
| [moonedit][7] | 2005-2008？ | ？ | 原网站已关闭。其他用户的光标可见并且会模仿击键的声音。 包括一个计算器和音乐定序器。 |
| [synchroedit][8] | 2006-2007 | ？ | 首个 Web 应用。|
| [Inkscape][29] |	2007-2011 | C++	| 首个具备协同功能的图形编辑器，其背后的“whiteboard” 插件构建于 Jabber 之上，现已停摆。|
| [Abiword][30] | 2008 至今|C++| 首个文字处理器。|
| [Etherpad][9] | 2008 至今 | Web |首款稳定的 Web 应用。 最初在 2008 年被开发时是一款大型 Java 应用，在 2009 年被谷歌收购并开源，然后在 2011 年被用 Node.JS 重写。使用广泛。|
| [Wave][31]|2009-2010|Web， Java|	在大一统协议的尝试上失败。|
| [CRDT][10] | 2011 | 特定平台| 在不同电脑间可靠地复制一个文件的数据结构的标准。 |
| [Operational transform][11] | 2013 | 特定平台| 与 CRDT 类似，然而确切地说，两者是不同的。 |
| [Floobits][12] | 2013 至今 | ？ | 商业软件，但有对各种编辑器的开源插件。 |
| [LibreOffice Online][32]|	2015至今| Web|	免费的 Google docs 替代品，现已集成到 [Nextcloud][33] |
| [HackMD][13] | 2015 至今| ？ | 商业软件，[开源][14]。灵感来自于（已被 Dropbox 收购的) hackpad。 |
| [Cryptpad][15] | 2016 至今 | Web ? | Xwiki 的副产品。服务器端的加密的、“零知识” 产品。|
| [Prosemirror][16] | 2016 至今 | Web， Node.JS | “试图架起消除 Markdown 文本编辑和传统的所见即所得编辑器之间隔阂的桥梁。”不是完全意义上的编辑器，而是一种可以用来构建编辑器的工具。 |
| [Qill][17] | 2013 至今 | Web， Node.JS | 富文本编辑器，同时也是 JavaScript 编辑器。不确定是否是协同式的。 |
| [Teletype][19] | 2017 至今 | WebRTC， Node.JS | 为 GitHub 的 [Atom 编辑器][20] 引入了“门户”的思路 ，使得访客可以夸多个文档跟踪主人的操作。访问介绍服务器后使用实时通讯的点对点技术（P2P），基于 CRDT。 |
| [Tandem][21] | 2018 至今 | Node.JS？ | Atom、 Vim、Neovim、 Sublime 等的插件。 使用中继来设置基于 CRDT 的 P2P 连接。多亏 Debian 开发者的参与，[可疑证书问题][22]已被解决，这使它成为很有希望在未来被遵循的标准。 |

### 其他清单

*   [Emacs 维基][23]
*   [维基百科][24]

--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-06-26-collaborative-editors-history/

作者：[Anacr][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ZenMoore](https://github.com/ZenMoore)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://anarc.at
[1]:https://www.codingmonkeys.de/subethaedit/
[2]:https://www.emacswiki.org/emacs/SubEthaEmacs
[3]:http://docsynch.sourceforge.net/
[4]:https://gobby.github.io/
[5]:http://infinote.0x539.de/libinfinity/API/libinfinity/
[6]:https://www.emacswiki.org/emacs/Rudel
[7]:https://web.archive.org/web/20060423192346/http://www.moonedit.com:80/
[8]:http://www.synchroedit.com/
[9]:http://etherpad.org/
[10]:https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type
[11]:http://operational-transformation.github.io/
[12]:https://floobits.com/
[13]:https://hackmd.io/
[14]:https://github.com/hackmdio/hackmd
[15]:https://cryptpad.fr/
[16]:https://prosemirror.net/
[17]:https://quilljs.com/
[18]:https://nextcloud.com/collaboraonline/
[19]:https://teletype.atom.io/
[20]:https://atom.io
[21]:http://typeintandem.com/
[22]:https://github.com/typeintandem/tandem/issues/131
[23]:https://www.emacswiki.org/emacs/CollaborativeEditing
[24]:https://en.wikipedia.org/wiki/Collaborative_real-time_editor
[25]:https://en.wikipedia.org/wiki/The_Mother_of_All_Demos
[26]:https://en.wikipedia.org/wiki/Douglas_Engelbart
[27]:https://ethercalc.net/
[28]:https://en.wikipedia.org/wiki/Google_docs
[29]:http://wiki.inkscape.org/wiki/index.php/WhiteBoard
[30]:https://en.wikipedia.org/wiki/AbiWord
[31]:https://en.wikipedia.org/wiki/Apache_Wave
[32]:https://wiki.documentfoundation.org/Development/LibreOffice_Online
[33]:https://nextcloud.com/collaboraonline/