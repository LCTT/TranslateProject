[#]: subject: "Junction: An Application Switcher to Open Files and Links"
[#]: via: "https://itsfoss.com/junction/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Junction：打开文件和链接的应用切换器
======

**简介：** _一个有趣的工具，在访问文件或打开链接时使事情变得简单。让我们来看看它吧_。

对于那些涉足多个应用访问不同文件和使用各种浏览器打开链接的用户来说，其工作流程往往不是无缝的。

你可能已经习惯了，但这可能不是完成事情的最快方式。

认识一下 **Junction**，一个应用切换器，帮助你用你最喜欢的应用快速打开文件/链接。

### Junction: 开源的 Linux 应用或浏览器切换器

![][1]

虽然我们可以在打开文件时使用右键菜单中的 “**Open with**” 选项来选择某个应用，但这并不是最快的方法。

有了 [Junction][2]，你不必寻找你可以希望文件用什么程序打开（或不断改变默认值），而是要将 “**Junction**” 应用设置为你的默认值。

这样，每当你打开一个链接或访问一个文件，启动电子邮件编辑器等，Junction 应用就会启动，向你显示你可能想要访问的相关应用。

此外，它还支持键盘导航，使其成为键盘高级用户的一个有益补充。

![][3]

基本上，每次你想在不同的应用中访问文件/链接时，它都能为你节省一些点击次数。

### Junction 的特点

![][4]

它是一个适合于特定用户群的简单工具。你可能觉得它是多余的，也可能不觉得它是多余的，但在你想尝试的情况下，它的功能应该可以弥补它的不足：

* 通过启动器/切换器选择要打开的应用
* 在启动前显示位置
* 在打开 URL 之前能够编辑它
* 提示不安全的链接
* 键盘导航
* 能够在切换器/启动器中添加更多的应用（它也会记住添加的内容，以便下次使用）。



![][5]

### 使用 Junction 来访问文件和链接

要设置它，你需要启动应用并将 Junction 设置为 Web 的默认值，如下图所示。

![][6]

要在任何文件类型上使用它，你可以前往各自的文件属性，并为它改变默认的应用，如下图所示：

![][7]

对于链接，你可以通过点击 “**Test Junction**” 来测试它，如上面的截图所示。或者，你可以点击其他应用的任何链接，看看 Junction 应用的运行情况。

下面是你试图点击一个链接并让 Junction 帮助你选择时的情况：

![][8]

### 在 Linux 中安装 Junction

Junction 主要以 Flatpak 应用的形式提供。因此，你可以从 [Flathub][9] 安装软件包，或者在软件中心寻找它（如果 Flatpak 集成完毕）。

考虑到你已经设置了 [Flatpak][10]，你可以输入以下命令来安装它：

```

flatpak install flathub re.sonny.Junction

```

你也可以查看它的 [GitHub 页面][11]，了解更多的使用案例或利用它的技巧/窍门。

[Junction][9]

_你认为像 Junction 这样的应用切换器怎么样？它对你有用吗？请在下面的评论中告诉我你的想法。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/junction/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Junction-ft.png?resize=800%2C450&ssl=1
[2]: https://apps.gnome.org/app/re.sonny.Junction/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-action-screenshot.jpg?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app-screenshot.jpg?resize=800%2C455&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app-more.jpg?resize=800%2C540&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app.jpg?resize=800%2C586&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-properties.png?resize=800%2C511&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-link-click.jpg?resize=800%2C505&ssl=1
[9]: https://flathub.org/apps/details/re.sonny.Junction
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://github.com/sonnyp/Junction
