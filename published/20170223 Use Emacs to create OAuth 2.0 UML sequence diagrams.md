[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10582-1.html)
[#]: subject: (Use Emacs to create OAuth 2.0 UML sequence diagrams)
[#]: via: (https://www.onwebsecurity.com/configuration/use-emacs-to-create-oauth-2-0-uml-sequence-diagrams.html)
[#]: author: (Peter Mosmans https://www.onwebsecurity.com)

使用 Emacs 创建 OAuth 2.0 的 UML 序列图
======

![OAuth 2.0 abstract protocol flow][6]

看起来 [OAuth 2.0 框架][7] 已经越来越广泛地应用于 web (和 移动) 应用。太棒了！

虽然协议本身并不复杂，但有很多的使用场景、流程和实现可供选择。正如生活中的大多数事物一样，魔鬼在于细节之中。

在审查 OAuth 2.0 实现或编写渗透测试报告时我习惯画出 UML 图。这方便让人理解发生了什么事情，并发现潜在的问题。毕竟，一图抵千言。

使用基于 GPL 开源协议 [Emacs][8] 编辑器来实现，再加上基于 GPL 开源协议的工具 [PlantUML][9] (也可以选择基于 Eclipse Public 协议的 [Graphviz][10]) 很容易做到这一点。

Emacs 是世界上最万能的编辑器。在这种场景中，我们用它来编辑文本，并自动将文本转换成图片。PlantUML 是一个允许你用人类可读的文本来写 UML 并完成该转换的工具。Graphviz 是一个可视化的软件，这里我们可以用它来显示图片。

下载 [预先编译好了的 PlantUML jar 文件 ][11]，[Emacs][12] 还可以选择下载并安装 [Graphviz][13]。

安装并启动 Emacs，然后将下面 Lisp 代码（实际上是配置）写入你的启动文件中（`~/.emacs.d/init.d`），这段代码将会：

  * 配置 org 模式（一种用来组织并编辑文本文件的模式）来使用 PlantUML
  * 将 `plantuml` 添加到可识别的 “org-babel” 语言中（这让你可以在文本文件中执行源代码）
  * 将 PlantUML 代码标注为安全的，从而允许执行
  * 自动显示生成的结果图片

```elisp
;; tell org-mode where to find the plantuml JAR file (specify the JAR file)
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))

;; use plantuml as org-babel language
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; helper function
(defun my-org-confirm-babel-evaluate (lang body)
"Do not ask for confirmation to evaluate code for specified languages."
(member lang '("plantuml")))

;; trust certain code as being safe
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; automatically show the resulting image
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
```

如果你还没有启动文件，那么将该代码加入到 `~/.emacs.d/init.el` 文件中然后重启 Emacs。

提示：`Control-c Control-f` 可以让你创建/打开（新）文件。`Control-x Control-s` 保存文件，而 `Control-x Control-c` 退出 Emacs。

这就结了！

要测试该配置，可以创建/打开（`Control-c Control-f`）后缀为 `.org` 的文件，例如 `test.org`。这会让 Emacs 切换到 org 模式并识别 “org-babel” 语法。

输入下面代码，然后在代码中输入 `Control-c Control-c` 来测试是否安装正常：

```
#+BEGIN_SRC plantuml :file test.png
@startuml
version
@enduml
#+END_SRC
```

一切顺利的话，你会在 Emacs 中看到文本下面显示了一张图片。

> **注意：**

> 要快速插入类似 `#+BEGIN_SRC` 和 `#+END_SRC` 这样的代码片段，你可以使用内置的 Easy Templates 系统：输入 `<s` 然后按下 `TAB`，它就会自动为你插入模板。

还有更复杂的例子，下面是生成上面图片的 UML 源代码：

```
#+BEGIN_SRC plantuml :file t:/oauth2-abstract-protocol-flow.png
@startuml
hide footbox
title Oauth 2.0 Abstract protocol flow
autonumber
actor user as "resource owner (user)"
box "token stays secure" #FAFAFA
participant client as "client (application)"
participant authorization as "authorization server"
database resource as "resource server"
end box

group user authorizes client
client -> user : request authorization
note left
**grant types**:
# authorization code
# implicit
# password
# client_credentials
end note
user --> client : authorization grant
end

group token is generated
client -> authorization : request token\npresent authorization grant
authorization --> client :var: access token
note left
**response types**:
# code
# token
end note
end group

group resource can be accessed
client -> resource : request resource\npresent token
resource --> client : resource
end group
@enduml
#+END_SRC
```

你难道会不喜欢 Emacs 和开源工具的多功能性吗？

--------------------------------------------------------------------------------

via: https://www.onwebsecurity.com/configuration/use-emacs-to-create-oauth-2-0-uml-sequence-diagrams.html

作者：[Peter Mosmans][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.onwebsecurity.com
[b]: https://github.com/lujun9972
[1]: https://www.onwebsecurity.com/category/configuration.html
[2]: https://www.onwebsecurity.com/tag/emacs.html
[3]: https://www.onwebsecurity.com/tag/oauth2.html
[4]: https://www.onwebsecurity.com/tag/pentesting.html
[5]: https://www.onwebsecurity.com/tag/security.html
[6]: https://www.onwebsecurity.com/images/oauth2-abstract-protocol-flow.png
[7]: https://tools.ietf.org/html/rfc6749
[8]: https://www.gnu.org/software/emacs/
[9]: https://plantuml.com
[10]: http://www.graphviz.org/
[11]: http://plantuml.com/download
[12]: https://www.gnu.org/software/emacs/download.html
[13]: http://www.graphviz.org/Download.php
