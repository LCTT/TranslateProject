[#]: subject: "Replace smart quotes with the Linux sed command"
[#]: via: "https://opensource.com/article/21/9/sed-replace-smart-quotes"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13806-1.html"

用 Linux sed 命令替换智能引号
======

> 用你喜欢的 sed 版本去除“智能”引号。

![](https://img.linux.net.cn/data/attachment/album/202109/21/151406chun5nyumy8wyu5y.png)

在排版学中，一对引号传统上是朝向彼此的。它们看起来像这样：

“智能引号”

随着计算机在二十世纪中期的普及，这种朝向往往被放弃了。计算机的原始字符集没有太多的空间，所以在 ASCII 规范中，两个双引号和两个单引号被缩减为各一个是合理的。如今，通用的字符集是 Unicode，有足够的空间容纳许多花哨的引号和撇号，但许多人已经习惯了开头和结尾引号都只有一个字符的极简主义。此外，计算机实际上将不同种类的引号和撇号视为不同的字符。换句话说，对计算机来说，右双引号与左双引号或直引号是不同的。

### 用 sed 替换智能引号

计算机并不是打字机。当你按下键盘上的一个键时，你不是在按一个带有印章的控制杆。你只是按下一个按钮，向你的计算机发送一个信号，计算机将其解释为一个显示特定预定义字符的请求。这个请求取决于你的键盘映射。作为一个 Dvorak 打字员，我目睹了人们在发现我的键盘上的 “asdf” 在屏幕上产生 “aoeu” 时脸上的困惑。你也可能按了一些特殊的组合键来产生字符，如 ™ 或 ß 或 ≠，这甚至没有印在你的键盘上。

每个字母或字符，不管它是否印在你的键盘上，都有一个编码。字符编码可以用不同的方式表达，但对计算机来说，Unicode 序列 u2018 和 u2019 产生 `‘` 和 `’`，而代码 u201c 和 u201d 产生 `“` 和 `”` 字符。知道这些“秘密”代码意味着你可以使用 [sed][2] 这样的命令以编程方式替换它们。任何版本的 sed 都可以，所以你可以使用 GNU sed 或 BSD sed，甚至是 [Busybox][3] sed。

下面是我使用的简单的 shell 脚本：

```
#!/bin/sh
# GNU All-Permissive License

SDQUO=$(echo -ne '\u2018\u2019')
RDQUO=$(echo -ne '\u201C\u201D')
$SED -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"
```

将此脚本保存为 `fixquotes.sh`，然后创建一个包含智能引号的单独测试文件：

```
‘Single quote’
“Double quote”
```

运行该脚本，然后使用 [cat][4] 命令查看结果：

```
$ sh ./fixquotes.sh test.txt
$ cat test.txt
'Single quote'
"Double quote"
```

### 安装 sed

如果你使用的是 Linux、BSD 或 macOS，那么你已经安装了 GNU 或 BSD 的 `sed`。这是原始 `sed` 命令的两个独特的重新实现，对于本文中的脚本来说，它们在功能上是一样的(不过并不是所有的脚本都是这样)。

在 Windows 上，你可以用 [Chocolatey][6] [安装 GNU sed][5]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/sed-replace-smart-quotes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/20/12/sed
[3]: https://opensource.com/article/21/8/what-busybox
[4]: https://opensource.com/article/19/2/getting-started-cat-command
[5]: https://chocolatey.org/packages/sed
[6]: https://opensource.com/article/20/3/chocolatey
