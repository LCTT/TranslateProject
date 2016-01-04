Linux/Unix 桌面趣事：蒸汽火车
================================================================================
一个你[经常犯的错误][1]是把 ls 输入成了 sl。我已经设置了[一个别名][2]，也就是 `alias sl=ls`。但是这样你也许就错过了这辆带汽笛的蒸汽小火车了。

sl 是一个搞笑软件或，也是一个 Unix 游戏。它会在你错误地把“ls”输入成“sl”（Steam Locomotive）后出现一辆蒸汽火车穿过你的屏幕。

### 安装 sl ###

在 Debian/Ubuntu 下输入下面的命令：

    # apt-get install sl

它同样也在 Freebsd 和其他类Unix的操作系统上存在。

下面，让我们把 ls 输错成 sl：

    $ sl

![Fig.01: Run steam locomotive across the screen if you type "sl" instead of "ls"](http://files.cyberciti.biz/uploads/tips/2011/05/sl_command_steam_locomotive.png)

*图01: 如果你把 “ls” 输入成 “sl” ，蒸汽火车会穿过你的屏幕。*

它同样支持下面的选项：

- **-a** : 似乎发生了意外。你会为那些哭喊求助的人们感到难过。
- **-l** : 显示小一点的火车
- **-F** : 它居然飞走了
- **-e** : 允许被 Ctrl+C 中断

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/displays-animations-when-accidentally-you-type-sl-instead-of-ls.html

作者：Vivek Gite 
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html
[2]:http://bash.cyberciti.biz/guide/Create_and_use_aliases
