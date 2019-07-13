Perlbrew 入门
======

> 用 Perlbrew 在你系统上安装多个版本的 Perl。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

有比在系统上安装了 Perl 更好的事情吗？那就是在系统中安装了多个版本的 Perl。使用 [Perlbrew][1] 你可以做到这一点。但是为什么呢，除了让你包围在 Perl 下之外，有什么好处吗？

简短的回答是，不同版本的 Perl 是......不同的。程序 A 可能依赖于较新版本中不推荐使用的行为，而程序 B 需要去年无法使用的新功能。如果你安装了多个版本的 Perl，则每个脚本都可以使用最适合它的版本。如果您是开发人员，这也会派上用场，你可以针对多个版本的 Perl 测试你的程序，这样无论你的用户运行什么，你都知道它能否工作。

### 安装 Perlbrew

另一个好处是 Perlbrew 会安装 Perl 到用户的家目录。这意味着每个用户都可以管理他们的 Perl 版本（以及相关的 CPAN 包），而无需与系统管理员联系。自助服务意味着为用户提供更快的安装，并为系统管理员提供更多时间来解决难题。

第一步是在你的系统上安装 Perlbrew。许多 Linux 发行版已经在包仓库中拥有它，因此你只需要 `dnf install perlbrew`（或者适用于你的发行版的命令）。你还可以使用 `cpan App::perlbrew` 从 CPAN 安装 `App::perlbrew` 模块。或者你可以在 [install.perlbrew.pl][2] 下载并运行安装脚本。

要开始使用 Perlbrew，请运行 `perlbrew init`。

### 安装新的 Perl 版本

假设你想尝试最新的开发版本（撰写本文时为 5.27.11）。首先，你需要安装包：

```
perlbrew install 5.27.11
```

### 切换 Perl 版本

现在你已经安装了新版本，你可以将它用于该 shell：

```
perlbrew use 5.27.11
```

或者你可以将其设置为你帐户的默认 Perl 版本（假设你按照 `perlbrew init` 的输出设置了你的配置文件）：

```
perlbrew switch 5.27.11
```

### 运行单个脚本

你也可以用特定版本的 Perl 运行单个命令：

```
perlberew exec 5.27.11 myscript.pl
```

或者，你可以针对所有已安装的版本运行命令。如果你想针对各种版本运行测试，这尤其方便。在这种情况下，请指定版本为 `perl`：

```
plperlbrew exec perl myscriptpl
```

### 安装 CPAN 模块

如果你想安装 CPAN 模块，`cpanm` 包是一个易于使用的界面，可以很好地与 Perlbrew 一起使用。用下面命令安装它：

```
perlbrew install-cpanm
```

然后，你可以使用 `cpanm` 命令安装 CPAN 模块：

```
cpanm CGI::simple
```

### 但是等下，还有更多！

本文介绍了基本的 Perlbrew 用法。还有更多功能和选项可供选择。从查看 `perlbrew help` 的输出开始，或查看[App::perlbrew 文档][3]。你还喜欢 Perlbrew 的其他什么功能？让我们在评论中知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/perlbrew

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://perlbrew.pl/
[2]:https://raw.githubusercontent.com/gugod/App-perlbrew/master/perlbrew-install
[3]:https://metacpan.org/pod/App::perlbrew
