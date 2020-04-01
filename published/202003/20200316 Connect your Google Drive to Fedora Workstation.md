[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12037-1.html)
[#]: subject: (Connect your Google Drive to Fedora Workstation)
[#]: via: (https://fedoramagazine.org/connect-your-google-drive-to-fedora-workstation/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

将你的 Google Drive 连接到 Fedora 工作站
======

![][1]

有大量的云服务可用于存储重要文档。Google Drive 无疑是最受欢迎的之一。它提供了一组相应的应用程序，例如文档，表格和幻灯片来创建内容。但是，你也可以在 Google Drive 中存储任意内容。本文向你展示如何将其连接到 [Fedora 工作站][2]。

### 添加帐户

Fedora 工作站可在安装后首次启动或者之后的任何时候添加一个帐户。要在首次启动期间添加帐户，请按照提示进行操作。其中包括选择添加一个帐户：

![][3]

选择 Google，然后会出现一个登录提示，请使用你的 Google 帐户信息登录。

![][4]

请注意，此信息仅传输给 Google，而不传输给 GNOME 项目。下一个页面要求你授予访问权限，这是必需的，以便系统桌面可以与 Google 进行交互。向下滚动查看访问请求，然后选择“允许”继续。

你会在移动设备和 Gmail 中收到有关新设备（系统）访问 Google 帐户的通知。这是正常现象。

![][5]

如果你在初次启动时没有执行此操作，或者需要重新添加帐户，请打开“设置”，然后选择“在线账户”来添加帐户。可以通过顶部栏右侧的下拉菜单（“齿轮”图标）或打开“概览”并输入“settings”来使用它。接着和上面一样。

### 在 Google Drive 中使用“文件”应用

打开“文件”应用（以前称为 “nautilus”）。“文件”应用可以通过左侧栏访问。在列表中找到你的 Google 帐户。

当你选择帐户后，“文件”应用会显示你的 Google Drive 的内容。你可以使用 Fedora 工作站的本地应用打开某些文件，例如声音文件或 [LibreOffice][6] 兼容文件（包括 Microsoft Office 文档）。其他文件（例如 Google 文档、表格和幻灯片等 Google 应用文件）将使用浏览器和相应的应用打开。

请记住，如果文件很大，将需要一些时间才能通过网络接收文件，你才可以打开它。

你还可以复制粘贴 Google Drive 中的文件到连接到 Fedora 工作站的其他存储，或者反之。你还可以使用内置功能来重命名文件、创建文件夹并组织它们。对于共享和其他高级选项，请和平常一样在浏览器中使用 Google Drive。

请注意，“文件”应用程序不会实时刷新内容。如果你从其他连接 Google 的设备（例如手机或平板电脑）添加或删除文件，那么可能需要按 `Ctrl+R` 刷新“文件”应用。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/connect-your-google-drive-to-fedora-workstation/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/gdrive-workstation-816x345.jpg
[2]: https://getfedora.org/workstation
[3]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-choices.jpg
[4]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-signin.jpg
[5]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-grantaccess.jpg
[6]: https://fedoramagazine.org/discover-hidden-gems-libreoffice/
[7]: https://unsplash.com/@beatriz_perez?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/office-files?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
