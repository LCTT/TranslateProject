autorandr：自动调整屏幕布局
======

像许多笔记本用户一样，我经常将笔记本插入到不同的显示器上（桌面上有多台显示器，演示时有投影机等）。运行 `xrandr` 命令或点击界面非常繁琐，编写脚本也不是很好。

最近，我遇到了 [autorandr][1]，它使用 EDID（和其他设置）检测连接的显示器，保存 `xrandr` 配置并恢复它们。它也可以在加载特定配置时运行任意脚本。我已经打包了它，目前仍在 NEW 状态。如果你不能等待，[这是 deb][2]，[这是 git 仓库][3]。

要使用它，只需安装软件包，并创建你的初始配置（我这里用的名字是 `undocked`）：

```
autorandr --save undocked
```

然后，连接你的笔记本（或者插入你的外部显示器），使用 `xrandr`（或其他任何）更改配置，然后保存你的新配置（我这里用的名字是 workstation）：

```
autorandr --save workstation
```

对你额外的配置（或当你有新的配置）进行重复操作。

`autorandr` 有 `udev`、`systemd` 和 `pm-utils` 钩子，当新的显示器出现时 `autorandr --change` 应该会立即运行。如果需要，也可以手动运行 `autorandr --change` 或 `autorandr - load workstation`。你也可以在加载配置后在 `~/.config/autorandr/$PROFILE/postswitch`  添加自己的脚本来运行。由于我运行 i3，我的工作站配置如下所示：

```
#!/bin/bash

xrandr --dpi 92
xrandr --output DP2-2 --primary
i3-msg '[workspace="^(1|4|6)"] move workspace to output DP2-2;'
i3-msg '[workspace="^(2|5|9)"] move workspace to output DP2-3;'
i3-msg '[workspace="^(3|8)"] move workspace to output DP2-1;'
```

它适当地修正了 dpi，设置主屏幕（可能不需要？），并移动 i3 工作区。你可以通过在配置文件目录中添加一个 `block` 钩子来安排配置永远不会运行。

如果你定期更换显示器，请看一下！

--------------------------------------------------------------------------------

via: https://www.donarmstrong.com/posts/autorandr/

作者：[Don Armstrong][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.donarmstrong.com
[1]:https://github.com/phillipberndt/autorandr
[2]:https://www.donarmstrong.com/autorandr_1.2-1_all.deb
[3]:https://git.donarmstrong.com/deb_pkgs/autorandr.git
