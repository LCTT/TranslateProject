[#]: collector: "lujun9972"
[#]: translator: "hom"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Manage your SSH connections with this open source tool"
[#]: via: "https://opensource.com/article/20/9/ssh-connection-manager"
[#]: author: "Kenneth Aaron https://opensource.com/users/flyingrhino"

使用开源工具 `nccm` 管理 `SSH` 连接
======
使用 `nccm` 让你的终端连接更快，更稳定 
![Penguins][1]

`OpenSSH`很常用，但是仍然有其他的连接工具，因此我开发了 `nccm`来使运行进程更高效。 `nccm` 是一个使用标准终端接口（就像项目所命名的`ncurses`）的建议终端连接工具

### 安装 nccm

最简单的方式是从这个 [仓库][2]下载


```
`$ git clone https://github.com/flyingrhinonz/nccm nccm.git`
```

在`nccm.git/nccm`的文件夹中有两个文件：`nccm`执行文件和`nccm.yml`配置文件

首先将执行文件`nccm`拷贝到系统目录`/usr/local/bin/`中并添加执行权限，也可以通过使用`install`命令来完成操作


```
$ sudo install -m755 nccm
–target-directory /usr/local/bin
```

配置文件`nccm.yml`可以拷贝到以下任意一个文件夹中，终端会默认从第一个顺序获取配置。

  * `~/.config/nccm/nccm.yml`
  * `~/.nccm.yml`
  * `~/nccm.yml`
  * `/etc/nccm.yml`



`nccm`需要在`Python 3`的环境中运行，因此你的电脑需要事先安装`Python 3`，大部分的环境依赖在`Python 3`中默认安装了。以下是必须要安装的`YAML`依赖

如果为暗中`pip`，你需要使用包管理器来安装，然后安装`yamlinit`包来验证安装`nccm.yml`

在`Debian`或相似系统使用`apt`命令：


```
`$ sudo apt install python3-pip yamllint`
```

在`Fedora`或者相似系统使用`dnf`：


```
`$ sudo dnf install python3-pip yamllint`
```

`PyYAML`也是必须安装的，可以通过使用`pip`来安装


```
`$ pip3 install --user PyYAML`
```

### 使用`nccm`

开始之前需要修改`nccm.yml`文件来添加终端连接配置，可以参照示例文件格式化`YAML`文件。仿照示例文件再开始行添加连接名称，文件使用两个空格缩进。不要忘了`YAML`的语言类型

不要担心你的终端登录信息以何顺序排列，`nccm`会提示用户如何排序

如果修改完成，可以使用`yamllint`来校验配置


```
`$ yamllint ~/.config/nccm/nccm.yml`
```

如果没有错误信息返回，说明文件的内容格式是正确的，可以进行下面的步骤

如果`nccm`可以从 [环境变量][3] 中找到并且可以执行，由于`nccm`会加载 TUI 来执行界面操作，因此需要查看`Python3`的执行环境，依赖包是否正确安装，缺少任一依赖都会在命令行中展示出来

只要你没有在配置文件中更改`ncm_config_control mode`，你可以使用以下的键盘按键来控制

  * 上/下方向键 - 移动光标
  * Home/End -跳转到文件开始和结尾
  * PgUp/PgDn - 以页为单位查看
  * 左/右 方向键 - 水平滚动
  * TAB - 在字块中移动
  * 回车 - 连接选中的终端
  * Ctrl-h -显示帮助菜单
  * Ctrl-q or Ctrl-c - 退出
  * F1-F5 or !@#$% - 在列（1-5）之间切换



使用`F1`到`F5`来切换列，如果你的设备`Fn`键冲突你可以使用`!@#$%`来替代。默认界面显示 4 列内容，但是可以通过将用户名和服务地址分隔开来显示 5 列。你也可以通过再次使用和第一次过滤相同的按键来切换显示，选中的行会高亮显示

![nccm screenshot terminal view][4]

在过滤条件中输入过滤内容，会将包含的内容过滤显示，过滤的关键词是大小写敏感的，字符中间的空格不是必须的。在`Conn`部分也是同样的输入限制，然后按回车键就可以选中所输入的序号配置

这个工具还有许多功能需要你去发掘，比如专注模式，这些部分留下等待你去探索，也可以查看项目主页或者内置的帮助文档查看更多细节内容

项目的`YAML`配置文件的文档是完善的，所以你可以查阅修改使你的终端工具使用起来更加顺手。`nccm`项目是非常希望得到你的反馈的，所以你可以 fork 该项目然后添加更多新功能，我们欢迎你的合并请求。

### 轻松使用 nccm来连接 SSH

我希望这个工具可以对您有用，感谢能够为开源工作增加自己的贡献，请接收`nccm`作为我对开源项目自由、高效工作所做的贡献

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ssh-connection-manager

作者：[Kenneth Aaron][a]
选题：[lujun9972][b]
译者：[hom](https://github.com/hom)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ "Penguins"
[2]: https://github.com/flyingrhinonz/nccm
[3]: https://opensource.com/article/17/6/set-path-linux
[4]: https://opensource.com/sites/default/files/uploads/nccm_screenshot.png "nccm screenshot terminal view"
