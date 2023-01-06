[#]: subject: "Install Gedit on Ubuntu 22.10 and Make it Default Text Editor"
[#]: via: "https://itsfoss.com/install-gedit-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15194-1.html"

在 Ubuntu 22.10 上安装 Gedit 并将其设为默认文本编辑器
======

![](https://img.linux.net.cn/data/attachment/album/202210/30/124029bf0qjklphcpzpclh.jpg)

[GNOME 有了一个全新的文本编辑器][1]，以取代旧的 Gedit 编辑器。

虽然 GNOME 42 已经可以使用了它，但 Ubuntu 22.04 还依赖于 Gedit。

这在 Ubuntu 22.10 中发生了变化。 GNOME <ruby>文本编辑器<rt>Text Editor</rt></ruby> 现在是默认程序，甚至没有安装 Gedit。

![搜索文本编辑器只出现 GNOME 文本编辑器][2]

虽然新编辑器足够好，但并不是每个人都喜欢它。如果你将 Gedit 与其他插件一起频繁使用，则尤其如此。

如果你属于这类人，让我向你展示如何在 Ubuntu 上安装 Gedit。我还将分享如何将其设为默认文本编辑器。

### 在 Ubuntu 上安装 Gedit

这实际上是不费吹灰之力的。虽然默认未安装 Gedit，但它仍然可以在 Ubuntu 仓库中找到。

所以，你所要做的就是使用 `apt` 命令来安装它：

```
sudo apt install gedit
```

Gedit 也可以在软件中心中找到，但它是 Snap 包。如果你愿意，你可以安装它。

![Gedit 也可以在 Ubuntu 的 Snap 商店中找到][3]

#### 安装 Gedit 插件（可选）

默认情况下，Gedit 为你提供访问一些插件的选项。你可以从 “汉堡菜单-><ruby>偏好<rt>Preference</rt></ruby>-><ruby>插件<rt>Plugins</rt></ruby>” 启用或禁用插件。

![在 Gedit 中访问插件][4]

你可以在这里看到可用的插件。检查已安装或正在使用的插件。

![查看 Gedit 中可用和已安装的插件][5]

但是，你可以通过安装 gedit-plugins 元数据包将插件选择提升到一个新的水平。

```
sudo apt install gedit-plugins
```

这将使你可以访问其他插件，如书签、括号补全、Python 控制台等。

![其他 Gedit 插件][6]

**提示**：如果你发现 Gedit 因缺少底角而显得有些格格不入，你可以安装一个名为 [Round Bottom Corner][7] 的 GNOME 扩展。这将为包括 Gedit 在内的所有应用强制添加圆底角。

### 使 Gedit 成为默认文本编辑器

好了！你已经安装了 Gedit，但文本文件仍然在双击操作后使用 GNOME 文本编辑器打开。要使用 Gedit 打开文件，你需要右键单击，然后选择“<ruby>打开方式<rt>open with</rt></ruby>”选项。

如果你希望一直使用 Gedit 打开文本文件，你可以将其设置为默认程序。

右键单击文本文件并选择“<ruby>打开方式<rt>open with</rt></ruby>”选项。在此处选择 Gedit 并从底部启用“<ruby>始终用于此文件类型<rt>Always use for this file type</rt></ruby>”选项。

![设置 Gedit 为默认文本编辑器][8]

### 删除 Gedit

觉得 Gedit 没达到预期么？这很少见，但我不会评判你。要从 Ubuntu 中删除 Gedit，请使用以下命令：

```
sudo apt remove gedit
```

你也可以尝试从软件中心卸载它。

### 总结

GNOME 文本编辑器是下一代从头开始创建的编辑器，它与新的 GNOME 完美融合。

对于简单的文本编辑来说已经足够了。然而，Gedit 有一个插件生态系统，赋予它更多功能。

对于那些将它广泛用于编码和其他事情的人来说，安装 Gedit 仍然是 Ubuntu 中的一个选项。

那你呢？你会坚持使用默认的新文本编辑器还是回到旧的 Gedit？

---

via: https://itsfoss.com/install-gedit-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-text-editor/
[2]: https://itsfoss.com/wp-content/uploads/2022/10/text-editor-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/10/install-gedit-from-ubuntu-software-center.png
[4]: https://itsfoss.com/wp-content/uploads/2022/10/access-plugins-in-gedit.png
[5]: https://itsfoss.com/wp-content/uploads/2022/10/plugins-in-gedit.png
[6]: https://itsfoss.com/wp-content/uploads/2022/10/additional-plugins-gedit.png
[7]: https://extensions.gnome.org/extension/5237/rounded-window-corners/
[8]: https://itsfoss.com/wp-content/uploads/2022/10/set-gedit-default.png
