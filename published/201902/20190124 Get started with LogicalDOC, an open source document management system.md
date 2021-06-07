[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10561-1.html)
[#]: subject: (Get started with LogicalDOC, an open source document management system)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-logicaldoc)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

开始使用 LogicalDOC 吧，一个开源文档管理系统
======

> 使用 LogicalDOC 更好地跟踪文档版本，这是我们开源工具系列中的第 12 个工具，它将使你在 2019 年更高效。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 12 个工具来帮助你在 2019 年更有效率。

### LogicalDOC

高效部分表现在能够在你需要时找到你所需的东西。我们都看到过塞满名称类似的文件的目录，这是每次更改文档时为了跟踪所有版本而重命名这些文件而导致的。例如，我的妻子是一名作家，她在将文档发送给审稿人之前，她经常使用新名称保存文档修订版。

![](https://opensource.com/sites/default/files/uploads/logicaldoc-1.png)

程序员对此一个自然的解决方案是 Git 或者其他版本控制器，但这个不适用于文档作者，因为用于代码的系统通常不能很好地兼容商业文本编辑器使用的格式。之前有人说，“改变格式就行”，[这不是适合每个人的选择][1]。同样，许多版本控制工具对于非技术人员来说并不是非常友好。在大型组织中，有一些工具可以解决此问题，但它们还需要大型组织的资源来运行、管理和支持它们。

![](https://opensource.com/sites/default/files/uploads/logicaldoc-2.png)

[LogicalDOC CE][2] 是为解决此问题而编写的开源文档管理系统。它允许用户签入、签出、查看版本、搜索和锁定文档，并保留版本历史记录，类似于程序员使用的版本控制工具。

LogicalDOC 可在 Linux、MacOS 和 Windows 上[安装][3]，使用基于 Java 的安装程序。在安装时，系统将提示你提供数据库存储位置，并提供只在本地文件存储的选项。你将获得访问服务器的 URL 和默认用户名和密码，以及保存用于自动安装脚本选项。

登录后，LogicalDOC 的默认页面会列出你已标记、签出的文档以及有关它们的最新说明。切换到“文档”选项卡将显示你有权访问的文件。你可以在界面中选择文件或使用拖放来上传文档。如果你上传 ZIP 文件，LogicalDOC 会解压它，并将其中的文件添加到仓库中。

![](https://opensource.com/sites/default/files/uploads/logicaldoc-3.png)

右键单击文件将显示一个菜单选项，包括检出文件、锁定文件以防止更改，以及执行大量其他操作。签出文件会将其下载到本地计算机以便编辑。在重新签入之前，其他任何人都无法修改签出的文件。当重新签入文件时（使用相同的菜单），用户可以向版本添加标签，并且需要备注对其执行的操作。

![](https://opensource.com/sites/default/files/uploads/logicaldoc-4.png)

查看早期版本只需在“版本”页面下载就行。对于某些第三方服务，它还有导入和导出选项，内置 [Dropbox][4] 支持。

文档管理不仅仅是能够负担得起昂贵解决方案的大公司才能有的。LogicalDOC 可帮助你追踪文档的版本历史，并为难以管理的文档提供了安全的仓库。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-logicaldoc

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: http://www.antipope.org/charlie/blog-static/2013/10/why-microsoft-word-must-die.html
[2]: https://www.logicaldoc.com/download-logicaldoc-community
[3]: https://docs.logicaldoc.com/en/installation
[4]: https://dropbox.com
