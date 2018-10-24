如何创建和维护你自己的 man 手册
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Um-pages-1-720x340.png)

我们已经讨论了一些 [man 手册的替代方案][1]。 这些替代方案主要用于学习简洁的 Linux 命令示例，而无需通过全面而过于详细的手册页。 如果你正在寻找一种快速而简单的方法来轻松快速地学习 Linux 命令，那么这些替代方案值得尝试。 现在，你可能正在考虑 —— 如何为 Linux 命令创建自己的 man 式的帮助页面？ 这时 “Um” 就派上用场了。 Um 是一个命令行实用程序，可以用于轻松创建和维护包含你到目前为止所了解的所有命令的 man 页面。

通过创建自己的手册页，你可以在手册页中避免大量不必要的细节，并且只包含你需要记住的内容。 如果你想创建自己的一套 man 式的页面，“Um” 也能为你提供帮助。 在这个简短的教程中，我们将学习如何安装 “Um” 命令以及如何创建自己的 man 手册页。

### 安装 Um

Um 适用于 Linux 和Mac OS。 目前，它只能在 Linux 系统中使用 Linuxbrew 软件包管理器来进行安装。 如果你尚未安装 Linuxbrew，请参考以下链接：

- [Linuxbrew：一个用于 Linux 和 MacOS 的通用包管理器][3]

安装 Linuxbrew 后，运行以下命令安装 Um 实用程序。

```
$ brew install sinclairtarget/wst/um
```

如果你会看到类似下面的输出，恭喜你！ Um 已经安装好并且可以使用了。

```
[...]
==> Installing sinclairtarget/wst/um
==> Downloading https://github.com/sinclairtarget/um/archive/4.0.0.tar.gz
==> Downloading from https://codeload.github.com/sinclairtarget/um/tar.gz/4.0.0
-=#=# # #
==> Downloading https://rubygems.org/gems/kramdown-1.17.0.gem
######################################################################## 100.0%
==> gem install /home/sk/.cache/Homebrew/downloads/d0a5d978120a791d9c5965fc103866815189a4e3939
==> Caveats
Bash completion has been installed to:
/home/linuxbrew/.linuxbrew/etc/bash_completion.d
==> Summary
[] /home/linuxbrew/.linuxbrew/Cellar/um/4.0.0: 714 files, 1.3MB, built in 35 seconds
==> Caveats
==> openssl
A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
/home/linuxbrew/.linuxbrew/etc/openssl/certs

and run
/home/linuxbrew/.linuxbrew/opt/openssl/bin/c_rehash
==> ruby
Emacs Lisp files have been installed to:
/home/linuxbrew/.linuxbrew/share/emacs/site-lisp/ruby
==> um
Bash completion has been installed to:
/home/linuxbrew/.linuxbrew/etc/bash_completion.d
```

在制作你的 man 手册页之前，你需要为 Um 启用 bash 补全。

要开启 bash 补全，首先你需要打开 `~/.bash_profile` 文件:

```
$ nano ~/.bash_profile
```

并在其中添加以下内容：

```
if [ -f $(brew --prefix)/etc/bash_completion.d/um-completion.sh ]; then
 . $(brew --prefix)/etc/bash_completion.d/um-completion.sh
fi
```

保存并关闭文件。运行以下命令以更新更改。

```
$ source ~/.bash_profile
```

准备工作全部完成。让我们继续创建我们的第一个 man 手册页。

### 创建并维护自己的man手册

如果你想为 `dpkg` 命令创建自己的 man 手册。请运行:

```
$ um edit dpkg
```

上面的命令将在默认编辑器中打开 markdown 模板：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Create-dpkg-man-page.png)

我的默认编辑器是 Vi，因此上面的命令会在 Vi 编辑器中打开它。现在，开始在此模板中添加有关 `dpkg` 命令的所有内容。

下面是一个示例：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Edit-dpkg-man-page.png)

正如你在上图的输出中看到的，我为 `dpkg` 命令添加了概要，描述和两个参数选项。 你可以在 man 手册中添加你所需要的所有部分。不过你也要确保为每个部分提供了适当且易于理解的标题。 完成后，保存并退出文件（如果使用 Vi 编辑器，请按 `ESC` 键并键入`:wq`）。

最后，使用以下命令查看新创建的 man 手册页：

```
$ um dpkg
```

![](http://www.ostechnix.com/wp-content/uploads/2018/10/View-dpkg-man-page.png)

如你所见，`dpkg` 的 man 手册页看起来与官方手册页完全相同。 如果要在手册页中编辑和/或添加更多详细信息，请再次运行相同的命令并添加更多详细信息。

```
$ um edit dpkg
```

要使用 Um 查看新创建的 man 手册页列表，请运行：

```
$ um list
```

所有手册页将保存在主目录中名为 `.um` 的目录下

以防万一，如果你不想要某个特定页面，只需删除它，如下所示。

```
$ um rm dpkg
```

要查看帮助部分和所有可用的常规选项，请运行：

```
$ um --help
usage: um <page name>
 um <sub-command> [ARGS...]

The first form is equivalent to `um read <page name>`.

Subcommands:
 um (l)ist List the available pages for the current topic.
 um (r)ead <page name> Read the given page under the current topic.
 um (e)dit <page name> Create or edit the given page under the current topic.
 um rm <page name> Remove the given page.
 um (t)opic [topic] Get or set the current topic.
 um topics List all topics.
 um (c)onfig [config key] Display configuration environment.
 um (h)elp [sub-command] Display this help message, or the help message for a sub-command.
```

### 配置 Um

要查看当前配置，请运行：

```
$ um config
Options prefixed by '*' are set in /home/sk/.um/umconfig.
editor = vi
pager = less
pages_directory = /home/sk/.um/pages
default_topic = shell
pages_ext = .md
```

在此文件中，你可以根据需要编辑和更改 `pager`、`editor`、`default_topic`、`pages_directory` 和 `pages_ext` 选项的值。 比如说，如果你想在 [Dropbox][2] 文件夹中保存新创建的 Um 页面，只需更改 `~/.um/umconfig` 文件中 `pages_directory` 的值并将其更改为 Dropbox 文件夹即可。

```
pages_directory = /Users/myusername/Dropbox/um
```

这就是全部内容，希望这些能对你有用，更多好的内容敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-create-and-maintain-your-own-man-pages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
[2]: https://www.ostechnix.com/install-dropbox-in-ubuntu-18-04-lts-desktop/
[3]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
