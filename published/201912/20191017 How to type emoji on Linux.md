[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11702-1.html)
[#]: subject: (How to type emoji on Linux)
[#]: via: (https://opensource.com/article/19/10/how-type-emoji-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Linux 系统中输入 emoji
======

> 使用 GNOME 桌面可以让你在文字中轻松加入 emoji。

![](https://img.linux.net.cn/data/attachment/album/201912/22/003829tsuogoonoxunn33o.jpg)

emoji 是潜藏在 Unicode 字符空间里的有趣表情图，它们已经风靡于整个互联网。emoji 可以用来在社交媒体上表示自己的心情状态，也可以作为重要文件名的视觉标签，总之它们的各种用法层出不穷。在 Linux 系统中有很多种方式可以输入 Unicode 字符，但 GNOME 桌面能让你更轻松地查找和输入 emoji。

![Emoji in Emacs][2]

### 准备工作

首先，你需要一个运行 [GNOME][3] 桌面的 Linux 系统。

同时还需要安装一款支持 emoji 的字体。符合这个要求的字体有很多，使用你喜欢的软件包管理器直接搜索 `emoji` 并选择一款安装就可以了。

例如在 Fedora 上：

```
$ sudo dnf search emoji
emoji-picker.noarch : An emoji selection tool
unicode-emoji.noarch : Unicode Emoji Data Files
eosrei-emojione-fonts.noarch : A color emoji font
twitter-twemoji-fonts.noarch : Twitter Emoji for everyone
google-android-emoji-fonts.noarch : Android Emoji font released by Google
google-noto-emoji-fonts.noarch : Google “Noto Emoji” Black-and-White emoji font
google-noto-emoji-color-fonts.noarch : Google “Noto Color Emoji” colored emoji font
[...]
```

对于  Ubuntu 或者 Debian，需要使用 `apt search`。

在这篇文章中，我会使用 [Google Noto Color Emoji][4] 这款字体为例。

### 设置

要开始设置，首先打开 GNOME 的设置面板。

1、在左边侧栏中，选择“<ruby>地区与语言<rt>Region & Language</rt></ruby>”类别。

2、点击“<ruby>输入源<rt>Input Sources</rt></ruby>”选项下方的加号（+）打开“<ruby>添加输入源<rt>Add an Input Source</rt></ruby>”面板。

![Add a new input source][5]

3、在“<ruby>添加输入源<rt>Add an Input Source</rt></ruby>”面板中，点击底部的菜单按钮。

![Add an Input Source panel][6]

4、滑动到列表底部并选择“<ruby>其它<rt>Other</rt></ruby>”。

5、在“<ruby>其它<rt>Other</rt></ruby>”列表中，找到“<ruby>其它<rt>Other</rt></ruby>（<ruby>快速输入<rt>Typing Booster</rt></ruby>）”。

![Find Other \(Typing Booster\) in inputs][7]

6、点击右上角的“<ruby>添加<rt>Add</rt></ruby>”按钮，将输入源添加到 GNOME 桌面。

以上操作完成之后，就可以关闭设置面板了。

#### 切换到快速输入

现在 GNOME 桌面的右上角会出现一个新的图标，一般情况下是当前语言的双字母缩写（例如英语是 en，世界语是 eo，西班牙语是 es，等等）。如果你按下了<ruby>超级键<rt>Super key</rt></ruby>（也就是键盘上带有 Linux 企鹅/Windows 徽标/Mac Command 标志的键）+ 空格键的组合键，就会切换到输入列表中的下一个输入源。在这里，我们只有两个输入源，也就是默认语言和快速输入。

你可以尝试使用一下这个组合键，观察图标的变化。

#### 配置快速输入

在快速输入模式下，点击右上角的输入源图标，选择“<ruby>Unicode 符号和 emoji 联想<rt>Unicode symbols and emoji predictions</rt></ruby>”选项，设置为“<ruby>开<rt>On</rt></ruby>”。

![Set Unicode symbols and emoji predictions to On][8]

现在快速输入模式已经可以输入 emoji 了。这正是我们现在所需要的，当然快速输入模式的功能也并不止于此。

### 输入 emoji

在快速输入模式下，打开一个文本编辑器，或者网页浏览器，又或者是任意一种支持输入 Unicode 字符的软件，输入“thumbs up”，快速输入模式就会帮你迅速匹配的 emoji 了。

![Typing Booster searching for emojis][9]

要退出 emoji 模式，只需要再次使用超级键+空格键的组合键，输入源就会切换回你的默认输入语言。

### 使用其它切换方式

如果你觉得“超级键+空格键”这个组合用起来不顺手，你也可以换成其它键的组合。在 GNOME 设置面板中选择“<ruby>设备<rt>Device</rt></ruby>”→“<ruby>键盘<rt>Keyboard</rt></ruby>”。

在“<ruby>键盘<rt>Keyboard</rt></ruby>”页面中，将“<ruby>切换到下一个输入源<rt>Switch to next input source</rt></ruby>”更改为你喜欢的组合键。

![Changing keystroke combination in GNOME settings][10]

### 输入 Unicode

实际上，现代键盘的设计只是为了输入 26 个字母以及尽可能多的数字和符号。但 ASCII 字符的数量已经比键盘上能看到的字符多得多了，遑论上百万个 Unicode 字符。因此，如果你想要在 Linux 应用程序中输入 Unicode，但又不想使用快速输入，你可以尝试一下 Unicode 输入。

1. 打开任意一种支持输入 Unicode 字符的软件，但仍然使用你的默认输入语言
2. 使用 `Ctrl+Shift+U` 组合键进入 Unicode 输入模式
3. 在 Unicode 输入模式下，只需要输入某个 Unicode 字符的对应序号，就实现了对这个 Unicode 字符的输入。例如 `1F44D` 对应的是 👍，而 `2620` 则对应了 ☠。想要查看所有 Unicode 字符的对应序号，可以参考 [Unicode 规范][11]。

### emoji 的实用性

emoji 可以让你的文本变得与众不同，这就是它们有趣和富有表现力的体现。同时 emoji 也有很强的实用性，因为它们本质上是 Unicode 字符，在很多支持自定义字体的地方都可以用到它们，而且跟使用其它常规字符没有什么太大的差别。因此，你可以使用 emoji 来对不同的文件做标记，在搜索的时候就可以使用 emoji 把这些文件快速筛选出来。

![Labeling a file with emoji][12]

你可以在 Linux 中尽情地使用 emoji，因为 Linux 是一个对 Unicode 友好的环境，未来也会对 Unicode 有着越来越好的支持。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-type-emoji-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead_cat-keyboard.png?itok=fuNmiGV- "A cat under a keyboard."
[2]: https://opensource.com/sites/default/files/uploads/emacs-emoji.jpg "Emoji in Emacs"
[3]: https://www.gnome.org/
[4]: https://www.google.com/get/noto/help/emoji/
[5]: https://opensource.com/sites/default/files/uploads/gnome-setting-region-add.png "Add a new input source"
[6]: https://opensource.com/sites/default/files/uploads/gnome-setting-input-list.png "Add an Input Source panel"
[7]: https://opensource.com/sites/default/files/uploads/gnome-setting-input-other-typing-booster.png "Find Other (Typing Booster) in inputs"
[8]: https://opensource.com/sites/default/files/uploads/emoji-input-on.jpg "Set Unicode symbols and emoji predictions to On"
[9]: https://opensource.com/sites/default/files/uploads/emoji-input.jpg "Typing Booster searching for emojis"
[10]: https://opensource.com/sites/default/files/uploads/gnome-setting-keyboard-switch-input.jpg "Changing keystroke combination in GNOME settings"
[11]: http://unicode.org/emoji/charts/full-emoji-list.html
[12]: https://opensource.com/sites/default/files/uploads/file-label.png "Labeling a file with emoji"

