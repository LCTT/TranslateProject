[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Standalone web applications with GNOME Web)
[#]: via: (https://fedoramagazine.org/standalone-web-applications-gnome-web/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/introducing-flatpak/)
[#]: url: (https://linux.cn/article-10317-1.html)

使用 GNOME Web “安装”独立 Web 应用
======

![](https://fedoramagazine.org/wp-content/uploads/2018/11/gnome-web-816x345.jpg)

你是否经常使用单页 Web 应用（SPA），但失去了一些完整桌面应用的好处？ GNOME Web 浏览器，简称为 Web（又名 Epiphany）有一个非常棒的功能，它允许你“安装” 一个 Web 应用。安装完成后，Web 应用将显示在应用菜单、GNOME shell 搜索中，并且它在切换窗口时是一个单独的项目。这个简短的教程将引导你完成使用 GNOME Web “安装” Web 应用的步骤。

### 安装 GNOME Web

GNOME Web 未包含在默认的 Fedora 安装中。要安装它，请在软件中心搜索 “web”，然后安装。

![][1]

或者，在终端中使用以下命令：

```
sudo dnf install epiphany
```

### 安装为 Web 应用

接下来，启动 GNOME Web，然后去浏览要安装的 Web 应用。使用浏览器连接到应用，然后从菜单中选择“将站点安装为 Web 应用”：

![][2]

GNOME Web 接下来会出现一个用于编辑应用名称的对话框。将其保留为默认值 （URL） 或更改为更具描述性的内容：

![][3]

最后，按下“创建”以 “安装” 你的新 Web 应用。创建 Web 应用后，关闭 GNOME Web。

### 使用新的 Web 应用

像使用任何典型的桌面应用一样启动 Web 应用。在 GNOME Shell Overview 中搜索它：

![][4]

此外，Web 应用将在 `alt-tab` 应用切换器中显示为单独的应用：

![][5]

另一个额外的功能是来自“已安装”的 Web 应用的所有 Web 通知都显示为常规 GNOME 通知。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/standalone-web-applications-gnome-web/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/11/gnome-web-in-gnome-software.png
[2]: https://fedoramagazine.org/wp-content/uploads/2018/11/freenode-page-in-gnome-web.png
[3]: https://fedoramagazine.org/wp-content/uploads/2018/11/edit-web-application-in-GNOME-web.png
[4]: https://fedoramagazine.org/wp-content/uploads/2018/11/web-application-in-overview.jpg
[5]: https://fedoramagazine.org/wp-content/uploads/2018/11/web-app-in-app-switcher.jpg
