[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10636-1.html)
[#]: subject: (Get started with CryptPad, an open source collaborative document editor)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-cryptpad)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 CryptPad 吧，一个开源的协作文档编辑器
======

> 使用 CryptPad 安全地共享你的笔记、文档、看板等，这是我们在开源工具系列中的第 5 个工具，它将使你在 2019 年更高效。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 5 个工具来帮助你在 2019 年更有效率。

### CryptPad

我们已经介绍过 [Joplin][1]，它能很好地保存自己的笔记，但是，你可能已经注意到，它没有任何共享或协作功能。

[CryptPad][2] 是一个安全、可共享的笔记应用和文档编辑器，它能够安全地协作编辑。与 Joplin 不同，它是一个 NodeJS 应用，这意味着你可以在桌面或其他服务器上运行它，并使用任何现代 Web 浏览器访问。它开箱即用，它支持富文本、Markdown、投票、白板，看板和 PPT。

![](https://opensource.com/sites/default/files/uploads/cryptpad-1.png)

它支持不同的文档类型且功能齐全。它的富文本编辑器涵盖了你所期望的所有基础功能，并允许你将文件导出为 HTML。它的 Markdown 的编辑能与 Joplin 相提并论，它的看板虽然不像 [Wekan][3] 那样功能齐全，但也做得不错。其他支持的文档类型和编辑器也很不错，并且有你希望在类似应用中看到的功能，尽管投票功能显得有些粗糙。

![](https://opensource.com/sites/default/files/uploads/cryptpad-2.png)

然而，CryptPad 的真正强大之处在于它的共享和协作功能。共享文档只需在“共享”选项中获取可共享 URL，CryptPad 支持使用 `<iframe>` 标签嵌入其他网站的文档。可以在“编辑”或“查看”模式下使用密码和会过期的链接共享文档。内置聊天能够让编辑者相互交谈（请注意，具有浏览权限的人也可以看到聊天但无法发表评论）。

![](https://opensource.com/sites/default/files/pictures/cryptpad-3.png)

所有文件都使用用户密码加密存储。服务器管理员无法读取文档，这也意味着如果你忘记或丢失了密码，文件将无法恢复。因此，请确保将密码保存在安全的地方，例如放在[密码保险箱][4]中。

![](https://opensource.com/sites/default/files/uploads/cryptpad-4.png)

当它在本地运行时，CryptPad 是一个用于创建和编辑文档的强大应用。当在服务器上运行时，它成为了用于多用户文档创建和编辑的出色协作平台。在我的笔记本电脑上安装它不到五分钟，并且开箱即用。开发者还加入了在 Docker 中运行 CryptPad 的说明，并且还有一个社区维护用于方便部署的 Ansible 角色。CryptPad 不支持任何第三方身份验证，因此用户必须创建自己的帐户。如果你不想运行自己的服务器，CryptPad 还有一个社区支持的托管版本。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-cryptpad

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/1/productivity-tool-joplin
[2]: https://cryptpad.fr/index.html
[3]: https://opensource.com/article/19/1/productivity-tool-wekan
[4]: https://opensource.com/article/18/4/3-password-managers-linux-command-line
