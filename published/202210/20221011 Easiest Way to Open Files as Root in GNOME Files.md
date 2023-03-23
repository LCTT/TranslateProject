[#]: subject: "Easiest Way to Open Files as Root in GNOME Files"
[#]: via: "https://www.debugpoint.com/gnome-files-root-access/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15168-1.html"

在 GNOME 文件应用中以 Root 身份打开文件的最简单方法
======

> 这是在 GNOME 文件应用中以 root 身份访问文件或目录的最简单方法。

![][1]

在 Windows 中，你通常可以在右键单击上下文菜单中以“以管理员身份打开”的方式打开文件或文件夹。

该功能是文件管理器的一部分，对于 Windows，它是 Windows 资源管理器的一部分。但是，它是由操作系统及其权限控制模块执行的。

在 Linux 发行版及其文件管理器中，情况略有不同。不同的桌面有自己的处理方式。

由于以管理员（root）身份修改文件和文件夹是有风险的，并且可能导致系统损坏，因此用户无法通过文件管理器的 GUI 轻松使用该功能。

例如，KDE Plasma 的默认文件管理器（Dolphin）最近 [添加了此功能][2]，因此当需要 root 权限时，它会通过 PolicyKit KDE Agent（polkit）窗口询问你，如下所示。

![使用 Polkit 实现 KIO 后的 Dolphin root 访问权限][3]

而不是相反的方式。比如，你想在文件管理器中通过 root 打开/执行一些东西时，你不能使用 `sudo dolphin` 以 root 权限运行文件管理器本身。

在某种程度上，它挽救了许多不可预见的情况。但是高级用户总是可以通过终端使用 `sudo` 来完成他们的工作。

### GNOME 文件应用（Nautilus）和对文件、目录的 root 访问权限 

话虽如此，[GNOME 文件应用][4]（又名 Nautilus）有一种方法可以通过 root 打开文件和文件夹。

以下是方法：

* 打开 GNOME 文件应用（Nautilus）。
* 然后单击左侧窗格中的“<ruby>其他位置<rt>Other Locations</rt></ruby>”。
* 按 `CTRL+L` 调出地址栏。
* 在地址栏中，输入下面的内容并回车。
    ```
    admin:///
    ```
* 它会要求输入管理员密码。当你成功验证，你就会以管理员身份打开系统。
* 现在，从这里开始，无论你做什么，它都是管理员或 root。

![以管理员身份输入位置地址][5]

![输入管理员密码][6]

![以 root 身份打开 GNOME 文件应用][7]

但是，与往常一样，请小心你作为管理员所做的事情。在你以 root 身份验证自己之后，通常很容易忘记。

这些选项不容易看到总是有原因的，以防止你和许多新的 Linux 用户破坏他们的系统。

祝好。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-files-root-access/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/nauroot-1024x576.jpg
[2]: https://www.debugpoint.com/dolphin-root-access/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/02/Dolphin-root-access-after-KIO-with-Polkit-implementation.jpg
[4]: https://wiki.gnome.org/Apps/Files
[5]: https://www.debugpoint.com/wp-content/uploads/2022/10/Enter-the-location-address-as-admin.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/10/Give-admin-password.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/10/Opening-GNOME-Files-as-root.jpg
