[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10586-1.html)
[#]: subject: (Firefox and org-protocol URL Capture)
[#]: via: (http://www.mediaonfire.com/blog/2017_07_21_org_protocol_firefox.html)
[#]: author: (Andreas Viklund http://andreasviklund.com/)

在 Firefox 上使用 Org 协议捕获 URL
======

### 介绍

作为一名 Emacs 人，我尽可能让所有的工作流都在 <ruby>[Org 模式][1]<rt>Org-mode</rt></ruby> 上进行 —— 我比较喜欢文本。

我倾向于将书签记录在 [Org 模式][1] 代办列表中，而 <ruby>[Org 协议][2]<rt>Org-protocol</rt></ruby> 则允许外部进程利用 [Org 模式][1] 的某些功能。然而，要做到这一点配置起来很麻烦。（[搜索引擎上][3]）有很多教程，Firefox 也有这类 [扩展][4]，然而我对它们都不太满意。

因此我决定将我现在的配置记录在这篇博客中，方便其他有需要的人使用。

### 配置 Emacs Org 模式

启用 Org 协议：

```
(require 'org-protocol)
```

添加一个<ruby>捕获模板<rt>capture template</rt></ruby> —— 我的配置是这样的：

```
(setq org-capture-templates
      (quote (...
              ("w" "org-protocol" entry (file "~/org/refile.org")
               "* TODO Review %a\n%U\n%:initial\n" :immediate-finish)
               ...)))
```

你可以从 [Org 模式][1] 手册中 [捕获模板][5] 章节中获取帮助。

设置默认使用的模板：

```
(setq org-protocol-default-template-key "w")
```

执行这些新增配置让它们在当前 Emacs 会话中生效。

### 快速测试

在下一步开始前，最好测试一下配置：

```
emacsclient -n "org-protocol:///capture?url=http%3a%2f%2fduckduckgo%2ecom&title=DuckDuckGo"
```

基于的配置的模板，可能会弹出一个捕获窗口。请确保正常工作，否则后面的操作没有任何意义。如果工作不正常，检查刚才的配置并且确保你执行了这些代码块。

如果你的 [Org 模式][1] 版本比较老(老于 7 版本)，测试的格式会有点不同：这种 URL 编码后的格式需要改成用斜杠来分割 url 和标题。在网上搜一下很容易找出这两者的不同。

### Firefox 协议

现在开始设置 Firefox。浏览 `about:config`。右击配置项列表，选择 “New -> Boolean”，然后输入 `network.protocol-handler.expose.org-protocol` 作为名字并且将值设置为 `true`。

有些教程说这一步是可以省略的 —— 配不配因人而异。

### 添加 Desktop 文件

大多数的教程都有这一步：

增加一个文件 `~/.local/share/applications/org-protocol.desktop`：

```
[Desktop Entry]
Name=org-protocol
Exec=/path/to/emacsclient -n %u
Type=Application
Terminal=false
Categories=System;
MimeType=x-scheme-handler/org-protocol;
```

然后运行更新器。对于 i3 窗口管理器我使用下面命令(跟 gnome 一样)：

```
update-desktop-database ~/.local/share/applications/
```

KDE 的方法不太一样……你可以查询其他相关教程。

### 在 FireFox 中设置捕获按钮

创建一个书签（我是在工具栏上创建这个书签的），地址栏输入下面内容：

```
javascript:location.href="org-protocol:///capture?url="+encodeURIComponent(location.href)+"&title="+encodeURIComponent(document.title||"[untitled page]")
```

保存该书签后，再次编辑该书签，你应该会看到其中的所有空格都被替换成了 `%20` —— 也就是空格的 URL 编码形式。

现在当你点击该书签，你就会在某个 Emacs 框架中，可能是一个任意的框架中，打开一个窗口，显示你预定的模板。


--------------------------------------------------------------------------------

via: http://www.mediaonfire.com/blog/2017_07_21_org_protocol_firefox.html

作者：[Andreas Viklund][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://andreasviklund.com/
[b]: https://github.com/lujun9972
[1]: http://orgmode.org/
[2]: http://orgmode.org/worg/org-contrib/org-protocol.html
[3]: https://duckduckgo.com/?q=org-protocol+firefox&t=ffab&ia=qa
[4]: https://addons.mozilla.org/en-US/firefox/search/?q=org-protocol&cat=1,0&appver=53.0&platform=linux
[5]: http://orgmode.org/manual/Capture-templates.html
