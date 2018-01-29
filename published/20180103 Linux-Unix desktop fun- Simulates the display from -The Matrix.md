Linux/Unix 桌面盛典：模仿 “黑客帝国” 界面！
======

《黑客帝国》是 1999 年，由 Wachowki 兄弟编导的科幻动作片。这部电影的荧屏里有无尽的绿色字符降落。数字雨模拟着《黑客帝国》中的虚拟现实活动。现在，Linux 和 Unix 终端上，你也可以通过  CMatrix 模仿出矩阵数字雨。

### 安装 cmatrix

根据你的 Linux/Unix 发行版或操作系统安装并且设置 CMatrix。

#### 如何在 Debian/Ubuntu Linux 发行版中安装 cmatrix

在 Debian/Ubuntu/Mint 系统中键入以下命令 [apt-get 命令][1]/[apt 命令][2]：

```
$ sudo apt install cmatrix
```

示例输出：

```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  cmatrix-xfont
The following NEW packages will be installed:
  cmatrix
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 15.8 kB of archives.
After this operation, 50.2 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 cmatrix amd64 1.2a-5build2 [15.8 kB]
Fetched 15.8 kB in 0s (19.7 kB/s)
Selecting previously unselected package cmatrix.
(Reading database ... 205388 files and directories currently installed.)
Preparing to unpack .../cmatrix_1.2a-5build2_amd64.deb ...
Unpacking cmatrix (1.2a-5build2) ...
Setting up cmatrix (1.2a-5build2) ...
Processing triggers for man-db (2.7.6.1-2) ...
```

#### 如何在 Arch Linux 发行版安装 cmatrix

键入 pacman 命令：

```
$ sudo pacman -S cmatrix
```

#### 如何在 FreeBCD 系统中安装 cmatrix

运行如下命令安装 port：

```
# cd /usr/ports/misc/cmatrix/ && make install clean
```

或者使用 pkg 命令添加二进制包：

```
# pkg install cmatrix
```

#### 如何在 macOS Unix 发行版中安装 cmatrix

键入下列命令：

```
$ brew install cmatrix
```

#### 如何在 OpenBSD 系统中安装 cmatrix

键入 pkg_add 命令：

```
# pkg_add cmatrix
```

### 使用 cmatrix

简单键入命令：

```
$ cmatrix
```

[![cmtarix 运转中][3]][3]

#### 使用键盘

在执行期间，下列按键有效（`-s` 模式下，按键无效）：

| 按键 | 说明 |
|---|---|
| `a` | 切换异步滚动 |
| `b` | 随机字符加粗 |
| `B` | 全部字符加粗 |
| `n` | 关闭字符加粗 |
| `0`-`9` | 调整更新时间 |
| `!` `@` `#` `$` `%` `^` `&` `)` | 改变对应的矩阵颜色: `!` – 红、`@` – 绿、`#` – 黄、`$` – 蓝、`%` – 洋红、`^` – 青、 `&` – 白、 `)` – 黑。 |
| `q` | 退出程序 |

你可以通过以下命令获取 cmatrix 选项：

```
$ cmatrix -h
```

- `-a`： 异步滚动
- `-b`： 开启字符加粗
- `-B`： 所有字符加粗（优先于 -b 选项）
- `-f`： 强制开启 Linux $TERM 模式
- `-l`： Linux 模式（使用 matrix 控制台字体）
- `-o`： 启用旧式滚动
- `-h`： 输出使用说明并退出
- `-n`： 关闭字符加粗 （优先于 -b and -B，默认）
- `-s`： “屏保”模式， 第一次按键时退出
- `-x`： X 窗口模式，如果你使用的时 mtx.pcf 终端
- `-V`： 输出版本信息并且退出
- `-u delay` （0 - 10，默认 4）： 屏幕更新延时
- `-C [color]`： 调整 matrix 颜色（默认绿色）

现在，你拥有了一款最炫酷的终端应用！

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/open-source/command-line-hacks/matrix-digital-rain-on-linux-macos-unix-terminal/

作者：[nixCraft][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[2]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[3]:https://www.cyberciti.biz/media/new/cms/2018/01/small-cmtarix-file.gif
