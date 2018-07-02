---
date: 2018-07-02 09:16
status: public
title: '20180627 Historical inventory of collaborative editors'
---

    【翻译中 by ZenMoore】 
协同编辑器的历史性发明
======
不妨按时间顺序快速列出在主要协同编辑器上付出的努力。

正如任何如此的清单一样，它必定会在一开始便提到受人尊敬的所有编辑器的先祖，道格·恩格尔巴特描述了在那期间什么基本是 1968 年来所写的所有可能软件的详尽清单。这不仅包括协同编辑器，还包括图形、编程和数学编辑器。

那个示范之后的所有编辑器仅仅是为了弥补硬件发展的加速度的更缓慢的实现。

> 软件加快的速度比硬件加快的速度慢。——沃斯定律

因此没有进一步的麻烦的话，这里是我找到的可圈可点的协同编辑器的清单。我说“可圈可点”的意思是他们具有可圈可点的特征或者实现细节。

| 项目 | 日期 | 平台 | 说明 |
| --- | --- | --- | --- |
| [SubEthaEdit][1] | 2003-2015? | 仅 Mac|首次协同, 实时的, 我能找到的多指针编辑器， [在 Emacs 上的逆向工程的尝试。][2] |
| [DocSynch][3] | 2004-2007 | ? | 在互联网交互式聊天程序之上构造! [(!)](https://anarc.at/smileys/idea.png)|
| [Gobby][4] | 2005 至今 | C, 多平台 | 首次开放,实现稳固可靠。 仍然存在！众所周知 ("[libinfinoted][5]") 协议很难移植到其他编辑器中 (例如： [Rudel][6] 不能在 Emacs 上实现此协议。 2017 年 1 月发行的 0.7 版本添加了也许可以改善这种状况的 Python 捆绑。 有趣的插件: 自动保存到磁盘。|
| [moonedit][7] | 2005-2008? | ? | 原网站已关闭。其他用户的光标可见并且会模仿击键的声音。 计算器和音乐定序器。 |
| [synchroedit][8] | 2006-2007 | ? |首款网络应用。|
| [Etherpad][9] | 2008 至今 | 网络 |首款稳定的网络应用。 最初在 2008 年被开发为一款大型 Java 应用，在 2009 年被谷歌获取并开源，然后在 2011 年被用 Node.JS 重写。广泛使用。|
| [CRDT][10] | 2011 | 特定平台| 对在不同电脑间可靠地复制一个文件的数据结构是标准的。 |
| [Operational transform][11] | 2013 | 特定平台| 与 CRDT 类似, 然而, 确切地说, 两者是不同的。 |
| [Floobits][12] | 2013 至今 | ? | 对不同编辑器是商业的但开源的插件。 |
| [HackMD][13] | 2015 至今| ? | 商业的但是[开源][14]。受 hackpad 的启发( hackpad 已被 Dropbox 收购)。 |
| [Cryptpad][15] | 2016 至今 | 网络? |Xwiki 的副产品。加密的, 在服务器"零知识"。|
| [Prosemirror][16] | 2016 至今 | 网络, Node.JS | "试图架起 Markdown 文本编辑和 传统 WYSIWYG 编辑器之间隔阂的桥梁。"不是完全意义上的编辑器，但是一种可以用来构建编辑器的工具。 |
| [Qill][17] | 2013 至今 | 网络, Node.JS | 富文本编辑器,同时支持 JavaScript.不确定是否是协同式的。 |
| [Nextcloud][18] | 2017 至今 | Web |一种类似谷歌文档的文档。 |
| [Teletype][19] | 2017 至今 | WebRTC, Node.JS | 为 GitHub 的[ Atom 编辑器][20] 引入了 "可移植"的想法，这种想法使访客可以跟踪主人在对多个文档做什么.访问介绍服务器后使用实时通讯的点对点技术( P2P ),基于 CRDT. |
| [Tandem][21] | 2018 至今 | Node.JS? | Atom, Vim, Neovim, Sublime 等的插件。 使用中继安装基于 CRDT 的 P2P 连接。多亏 Debian 开发者的参与,[可疑证书问题][22]已被解决，这使它成为很有希望在未来被遵循的标准。 |

### 其他清单

*   Emacs 维基
*   维基百科



--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-06-26-collaborative-editors-history/

作者：[Anacr][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ZenMoore](https://github.com/ZenMoore)
校对：[校对者ID](https://github.com/校对者ID)

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