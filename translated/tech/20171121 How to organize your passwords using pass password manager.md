使用 pass 密码管理器管理你的密码
======

### 目标

学习在 Linux 上使用 "pass" 密码管理器来管理你的密码

### 条件

  * 需要 root 权限来安装需要的包

### 难度

简单

### 约定

  * **#** - 执行指定命令需要 root 权限，可以是直接使用 root 用户来执行或者使用 `sudo` 命令来执行
  * **$** - 使用普通的非特权用户执行指定命令

### 介绍

如果你有根据不同的意图设置不同密码的好习惯，你可能已经感受到需要一个密码管理器的必要性了。在 Linux 上有很多选择，可以是专利软件(如果你敢的话)也可以是开源软件。如果你跟我一样喜欢简洁的话，你可能会对 `pass` 感兴趣。

### First steps

Pass 作为一个密码管理器，其实际上是一些你可能早已每天使用的、可信赖且实用的工具的一种封装，比如 `gpg` 和 `git` 。虽然它也有图形界面，但它专门设计能成在命令行下工作的：因此它也可以在 headless machines 上工作 (LCTT 注：根据 wikipedia 的说法，所谓 headless machines 是指没有显示器、键盘和鼠标的机器，一般通过网络链接来控制)。

### 步骤 1 - 安装

Pass 在主流的 linux 发行版中都是可用的，你可以通过包管理器安装：

#### Fedora
```
# dnf install pass
```

#### RHEL and CentOS

Pass 不在官方仓库中，但你可以从 `epel` 中获取道它。要在 CentOS7 上启用后面这个源，只需要执行：
```
# yum install epel-release
```

然而在 Red Hat 企业版的 Linux 上，这个额外的源是不可用的;你需要从 EPEL 官方网站上下载它。

#### Debian and Ubuntu
```
# apt-get install pass
```

#### Arch Linux
```
# pacman -S pass
```

### 初始化密码仓库

安装好 `pass` 后，就可以开始使用和配置它了。首先，由于 pass 依赖 `gpg` 来对我们的密码进行加密并以安全的方式进行存储，我们必须准备好一个 `gpg 密钥对`。

首先我们要初始化 `密码仓库`：这就是一个用来存放 gpg 加密后的密码的目录。默认情况下它会在你的 `$HOME` 创建一个隐藏目录，不过你也可以通过使用 `PASSWORD_STORE_DIR` 这一环境变量来指定另一个路径。让我们运行：
```
$ pass init
```

然后`密码仓库`目录就创建好了。现在，让我们来存储我们第一个密码：
```
$ pass edit mysite
```

这会打开默认文本编辑器，我么只需要输入密码就可以了。输入的内容会用 gpg 加密并存储为密码仓库目录中的 `mysite.gpg` 文件。

Pass 以目录树的形式存储加密后的文件，也就是说我们可以在逻辑上将多个文件放在子目录中以实现更好的组织形式，我们只需要在创建文件时指定存在哪个目录下就行了，像这样：
```
$ pass edit foo/bar
```

跟上面的命令一样，它也会让你输入密码，但是创建的文件是放在密码仓库目录下的 `foo` 子目录中的。要查看文件组织结构，只需要不带任何参数运行 `pass` 命令即可：
```

$ pass
Password Store
├── foo
│   └── bar
└── mysite

```

若想修改密码，只需要重复创建密码的操作就行了。

### 获取密码

有两种方法可以获取密码：第一种会显示密码到终端上，方法是运行：
```
pass mysite
```

然而更好的方法是使用 `-c` 选项让 pass 将密码直接拷贝到剪切板上：
```
pass -c mysite
```

这种情况下剪切板中的内容会在 `45` 秒后自动清除。两种方法都会要求你输入 gpg 密码。

### 生成密码

Pass 也可以为我们自动生成(并自动存储)安全密码。假设我们想要生成一个由 15 个字符组成的密码：包含字母，数字和特殊符号，其命令如下：
```
pass generate mysite 15
```

若希望密码只包含字母和数字则可以是使用 `--no-symbols` 选项。生成的密码会显示在屏幕上。也可以通过 `--clip` 或 `-c` 选项让 pass 把密码直接拷贝到剪切板中。通过使用 `-q` 或 `--qrcode` 选项来生成二维码：

![qrcode][1]

从上面的截屏中尅看出，生成了一个二维码，不过由于 `mysite` 的密码已经存在了，pass 会提示我们确认是否要覆盖原密码。

Pass 使用 `/dev/urandom` 设备作为(伪)随机数据生成器来生成密码，同时它使用 `xclip` 工具来将密码拷贝到粘帖板中，同时使用 `qrencode` 来将密码以二维码的形式显示出来。在我看来，这种模块化的设计正是它最大的优势：它并不重复造轮子，而只是将常用的工具包装起来完成任务。

你也可以使用 `pass mv`，`pass cp`，和 `pass rm` 来重命名，拷贝和删除密码仓库中的文件。

### 将密码仓库变成 git 仓库

`pass` 另一个很棒的功能就是可以将密码仓库当成 git 仓库来用：通过版本管理系统能让我们管理密码更方便。
```
pass git init
```

这会创建 git 仓库，并自动提交所有已存在的文件。下一步就是指定跟踪的远程仓库了：
```
pass git remote add <name> <url>
```

我们可以把这个密码仓库当成普通仓库来用。唯一的不同点在于每次我们新增或修改一个密码，`pass` 都会自动将该文件加入索引并创建一个提交。

`pass` 有一个叫做 `qtpass` 的图形界面，而且也支持 Windows 和 MacOs。通过使用 `PassFF` 插件，它还能获取 firefox 中存储的密码。在它的项目网站上可以查看更多详细信息。试一下 `pass` 吧，你不会失望的！


--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-organize-your-passwords-using-pass-password-manager

作者：[Egidio Docile][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[Locez](https://github.com/locez)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:/https://linuxconfig.org/images/pass-manager-qrcode.png
