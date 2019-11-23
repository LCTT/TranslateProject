[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11409-1.html)
[#]: subject: (How to use Terminator on Linux to run multiple terminals in one window)
[#]: via: (https://www.networkworld.com/article/3436784/how-to-use-terminator-on-linux-to-run-multiple-terminals-in-one-window.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 Terminator 在一个窗口中运行多个终端
======

![](https://img.linux.net.cn/data/attachment/album/201909/30/233732j9jjx3xxuujopiuu.jpg)

> Terminator 为在单窗口中运行多个 GNOME 终端提供了一个选择，让你可以灵活地调整工作空间来适应你的需求。

![](https://images.idgesg.net/images/article/2019/09/terminator-code-100810364-large.jpg)

如果你曾经希望可以排列多个终端并将它们组织在一个窗口中，那么我们可能会给你带来一个好消息。 Linux 的 Terminator 可以为你做到这一点。没有问题！

### 分割窗口

Terminator 最初打开像是一个单一窗口的终端窗口一样。但是，一旦在该窗口中单击鼠标，它将弹出一个选项，让你可以灵活地进行更改。你可以选择“水平分割”或“垂直分割”，将你当前所在的窗口分为两个较小的窗口。实际上，菜单旁会有小的分割结果图示（类似于 `=` and `||`），你可以根据需要重复拆分窗口。当然，你如果将整个窗口分为六个或九个以上，那么你可能会发现它们太小而无法有效使用。

使用 ASCII 艺术来说明分割窗口的过程，你可能会看到类似以下的样子：

```
+-------------------+     +-------------------+     +-------------------+
|                   |     |                   |     |                   |
|                   |     |                   |     |                   |
|                   | ==> |-------------------| ==> |-------------------|
|                   |     |                   |     |         |         |
|                   |     |                   |     |         |         |
+-------------------+     +-------------------+     +-------------------+
  原始终端                       水平分割                   垂直分割
```

另一种拆分窗口的方法是使用控制键组合，例如，使用 `Ctrl+Shift+e` 垂直分割窗口，使用 `Ctrl+Shift+o`（“o” 表示“打开”）水平分割窗口。

在 Terminator 分割完成后，你可以点击任意窗口使用，并根据工作需求在窗口间移动。

### 最大化窗口

如果你想暂时忽略除了一个窗口外的其他窗口而只关注一个，你可以单击该窗口，然后从菜单中选择“最大化”选项。接着该窗口会撑满所有空间。再次单击并选择“还原所有终端”可以返回到多窗口显示。使用 `Ctrl+Shift+x` 将在正常和最大化设置之间切换。

窗口标签上的窗口大小指示（例如 80x15）显示了每行的字符数以及每个窗口的行数。

### 关闭窗口

要关闭任何窗口，请打开 Terminator 菜单，然后选择“关闭”。其他窗口将自行调整占用空间，直到你关闭最后一个窗口。

### 保存你的自定义设置

将窗口分为多个部分后，将自定义的 Terminator 设置设置为默认非常容易。从弹出菜单中选择“首选项”，然后从打开的窗口顶部的选项卡中选择“布局”。接着你应该看到列出了“新布局”。只需单击底部的“保存”，然后单击右下角的“关闭”。Terminator 会将你的设置保存在 `~/.config/terminator/config` 中，然后每次使用到时都会使用该文件。

你也可以通过使用鼠标拉伸来扩大整个窗口。再说一次，如果要保留更改，请从菜单中选择“首选项”，“布局”，接着选择“保存”和“关闭”。

### 在保存的配置之间进行选择

如果愿意，你可以通过维护多个配置文件来设置多种 Terminator 窗口布局，重命名每个配置文件（如 `config-1`、`config-2`），接着在你想使用它时将它移动到 `~/.config/terminator/config`。这有一个类似执行此任务的脚本。它让你在 3 个预配置的窗口布局之间进行选择。

```
#!/bin/bash

PS3='Terminator options: '
options=("Split 1" "Split 2" "Split 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Split 1")
            config=config-1
            break
            ;;
        "Split 2")
            config=config-2
            break
            ;;
        "Split 3")
            config=config-3
            break
            ;;
        *)
            exit
            ;;
    esac
done

cd ~/.config/terminator
cp config config-
cp $config config
cd
terminator &
```

如果有用的话，你可以给选项一个比 `config-1` 更有意义的名称。

### 总结

Terminator 是设置多窗口处理相关任务的不错选择。如果你从未使用过它，那么可能需要先使用 `sudo apt install terminator` 或 `sudo yum install -y terminator` 之类的命令进行安装。

希望你喜欢使用 Terminator。还有，如另一个同名角色所说，“我会回来的！”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3436784/how-to-use-terminator-on-linux-to-run-multiple-terminals-in-one-window.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
