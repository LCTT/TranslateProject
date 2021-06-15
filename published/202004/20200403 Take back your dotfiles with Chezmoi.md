[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12109-1.html)
[#]: subject: (Take back your dotfiles with Chezmoi)
[#]: via: (https://fedoramagazine.org/take-back-your-dotfiles-with-chezmoi/)
[#]: author: (Ryan Walter https://fedoramagazine.org/author/rwaltr/)

用 Chezmoi 取回你的点文件
======

![](https://img.linux.net.cn/data/attachment/album/202004/14/183618dwkhe4ehx1kthxvw.jpg)

在 Linux 中，点文件是隐藏的文本文件，从 Bash、Git 到 i3 或 VSCode 等更复杂的许多应用程序，都用它存储配置设置。

这些文件大多数都放在 `~/.config` 目录中或用户主目录中。编辑这些文件使你可以自定义也许没有提供设置菜单的应用程序，并且它们可以跨设备甚至是跨其它 Linux 发行版移植。但是，整个 Linux 发烧友社区的讨论焦点是如何管理这些点文件以及如何共享它们。

我们将展示一个名为 [Chezmoi][2] 的工具，该工具与其它工具略有不同。

### 点文件管理的历史

如果你在 [GitHub 上搜索“dotfiles”][3]，那么你将看到有超过 10 万个存储库在解决一个目标：将人们的点文件存储在可共享且可重复的领地中。但是，除了都在使用 Git 之外，它们存储文件的方式各有不同。

虽然 Git 解决了代码管理问题，也将其转换为配置文件管理，但它并没有解决如何区分发行版、角色（例如家用计算机与工作计算机）、机密信息管理以及按设备配置的问题。

因此，许多用户决定制定自己的解决方案，多年来，社区已经做出了许多成果。本文将简要介绍已有的一些解决方案。

#### 在孤立的环境中进行实验

你想在封闭的环境中快速尝试以下解决方案吗？运行：

```
$ podman run --rm -it fedora
```

来创建一个 Fedora 容器尝试应用程序。退出容器时，该容器将自动删除自身。

#### 安装问题

如果将点文件存储在 Git 存储库中，你肯定希望可以让更改轻松地自动应用到主目录之中，乍一看，最简单的方法是使用符号链接，例如 `ln -s ~/.dotfies/bashrc ~/.bashrc`。这可以使你的更改在更新存储库时立即就绪。

符号链接的问题在于管理符号链接可能很麻烦。Stow 和 [RCM][4]（在 Fedora 杂志上介绍过）可以帮助你管理这些，但是这些并不是非常舒服的解决方案。下载后，需要对私有文件进行适当的修改和设置访问模式。如果你在一个系统上修改了点文件，然后将存储库下载到另一个系统，则可能会发生冲突并需要进行故障排除。

解决此问题的另一种方法是编写自己的安装脚本。这是最灵活的选项，但要权衡花费更多时间来构建自定义解决方案是否值得。

#### 机密信息问题

Git 旨在跟踪更改。如果你在 Git 存储库中存储密码或 API 密钥之类的机密信息，则会比较麻烦，并且需要重写 Git 历史记录以删除该机密信息。如果你的存储库是公开的，那么如果其他人下载了你的存储库，你的机密信息将不再保密。仅这个问题就会阻止许多人与公共世界共享其点文件。

#### 多设备配置问题

问题不在于如何将配置拉到多个设备，而是当你有多个需要不同配置的设备的问题。大多数人通过使用不同的文件夹或使用不同的<ruby>复刻<rt>fork</rt></ruby>来处理此问题。这使得难以在不同设备和角色集之间共享配置。

### Chezmoi 是如何干的

Chezmoi 是一种考虑了以上问题的用于管理点文件的工具，它不会盲目地从存储库复制或符号链接文件。 Chezmoi 更像是模板引擎，可以根据系统变量、模板、机密信息管理器和 Chezmoi 自己的配置文件来生成你的点文件。

#### Chezmoi 入门

目前，Chezmoi 并不在 Fedora 的默认软件库中。你可以使用以下命令下载 Chezmoi 的当前版本。

```
$ sudo dnf install https://github.com/twpayne/chezmoi/releases/download/v1.7.17/chezmoi-1.7.17-x86_64.rpm
```

这会将预打包的 RPM 安装到你的系统中。

让我们继续使用以下方法创建你的存储库：

```
$ chezmoi init
```

它将在 `~/.local/share/chezmoi/` 中创建你的新存储库。你可以使用以下命令轻松地切换到该目录：

```
$ chezmoi cd
```

让我们添加第一个文件：

```
chezmoi add ~/.bashrc
```

这将你的 `.bashrc` 文件添加到 chezmoi 存储库。

注意：如果你的 `.bashrc` 文件实际上是一个符号链接，则需要添加 `-f` 标志以跟随它来读取实际文件的内容。

现在，你可以使用以下命令编辑该文件：

```
$ chezmoi edit ~/.bashrc
```

现在让我们添加一个私有文件，这是一个具有 600 或类似权限的文件。我在 `.ssh/config` 中有一个文件，我想通过使用如下命令添加它：

```
$ chezmoi add ~/.ssh/config
```

Chezmoi 使用特殊的前缀来跟踪隐藏文件和私有文件，以解决 Git 的限制。运行以下命令以查看它：

```
$ chezmoi cd
```

**请注意，标记为私有的文件实际上并不是私有的，它们仍会以纯文本格式保存在你的 Git 存储库中。稍后会进一步解释。**

你可以使用以下方法应用任何更改：

```
$ chezmoi apply
```

并使用如下命令检查有什么不同：

```
$ chezmoi diff
```

#### 使用变量和模板

要导出 Chezmoi 可以收集的所有数据，请运行：

```
$ chezmoi data
```

其中大多数是有关用户名、架构、主机名、操作系统类型和操作系统名称的信息。但是你也可以添加我们自己的变量。

继续，运行：

```
$ chezmoi edit-config
```

然后输入以下内容：

```
[data]
         email = "fedorauser@example.com"
         name = "Fedora Mcdora"
```

保存文件，然后再次运行 `chezmoi data`。你将在底部看到你的电子邮件和姓名已经添加成功。现在，你可以将这些与 Chezmoi 的模板一起使用。运行：

```
$ chezmoi add  -T --autotemplate ~/.gitconfig
```

来将你的 `.gitconfig` 作为模板添加到 Chezmoi 中。如果 Chezmoi 成功地正确推断了模板，你将获得以下信息：

```
[user]
         email = "{{ .email }}"
         name = "{{ .name }}"
```

如果没有，则可以将文件更改为这样。

使用以下方法检查文件：

```
$ chezmoi edit ~/.gitconfig
```

然后使用：

```
$ chezmoi cat ~/.gitconfig
```

来查看 Chezmoi 为此文件生成什么。我生成的示例如下：

```
[root@a6e273a8d010 ~]# chezmoi cat ~/.gitconfig
[user]
    email = "fedorauser@example.com"
    name = "Fedora Mcdora"
[root@a6e273a8d010 ~]#
```

它将在我们的 Chezmoi 配置中生成一个充满变量的文件。你也可以使用变量执行简单的逻辑语句。一个例子是：

```
{{- if eq .chezmoi.hostname "fsteel" }}
# 如果主机名为 "fsteel" 才包括此部分
{{- end }}
```

请注意，要使其正常工作，该文件必须是模板。你可以通过查看文件是否在 `chezmoi cd` 中的文件名后附加 `.tmpl` 或使用 `-T` 选项读取文件来进行检查。

#### 让机密信息保持机密

要对设置进行故障排除，请使用以下命令。

```
$ chezmoi doctor
```

这里重要的是它还向你显示了[所支持的密码管理器][5]。

```
[root@a6e273a8d010 ~]# chezmoi doctor
 warning: version dev
      ok: runtime.GOOS linux, runtime.GOARCH amd64
      ok: /root/.local/share/chezmoi (source directory, perm 700)
      ok: /root (destination directory, perm 550)
      ok: /root/.config/chezmoi/chezmoi.toml (configuration file)
      ok: /bin/bash (shell)
      ok: /usr/bin/vi (editor)
 warning: vimdiff (merge command, not found)
      ok: /usr/bin/git (source VCS command, version 2.25.1)
      ok: /usr/bin/gpg (GnuPG, version 2.2.18)
 warning: op (1Password CLI, not found)
 warning: bw (Bitwarden CLI, not found)
 warning: gopass (gopass CLI, not found)
 warning: keepassxc-cli (KeePassXC CLI, not found)
 warning: lpass (LastPass CLI, not found)
 warning: pass (pass CLI, not found)
 warning: vault (Vault CLI, not found)
 [root@a6e273a8d010 ~]#
```

你可以使用这些客户端，也可以使用[通用客户端][6]，也可以使用系统的[密钥环][7]。

对于 GPG，你需要使用以下命令将以下内容添加到配置中：

```
$ chezmoi edit-config
```

```
[gpg]
   recipient = "<Your GPG keys Recipient"
```

你可以使用：

```
$ chezmoi add --encrypt
```

来添加任何文件，这些文件将在你的源存储库中加密，并且不会以纯文本格式公开。Chezmoi 会在应用时自动将其解密。

我们也可以在模板中使用它们。例如，存储在 [Pass][8]（已在 Fedora 杂志上介绍）中的机密令牌。继续，生成你的机密信息。

在此示例中，它称为 `githubtoken`：

```
rwaltr@fsteel:~] $ pass ls
 Password Store
 └── githubtoken
 [rwaltr@fsteel:~] $
```

接下来，编辑你的模板，例如我们之前创建的 `.gitconfig` 并添加以下行。

```
token = {{ pass "githubtoken" }}
```

然后让我们使用检查：

```
$ chezmoi cat ~/.gitconfig
```

```
[rwaltr@fsteel:~] $ chezmoi cat ~/.gitconfig
 This is Git's per-user configuration file.
 [user]
           name = Ryan Walter
           email = rwalt@pm.me
           token = mysecrettoken
 [rwaltr@fsteel:~] $
```

现在，你的机密信息已在密码管理器中妥善保护，你的配置可以公开共享而没有任何风险！

### 最后的笔记

这里仅仅涉及到表面。请访问 [Chezmoi 的网站][2]了解更多信息。如果你正在寻找有关如何使用 Chezmoi 的更多示例，作者还可以公开了他的[点文件][9]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/take-back-your-dotfiles-with-chezmoi/

作者：[Ryan Walter][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rwaltr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/chezmoi-cover-816x346.png
[2]: https://www.chezmoi.io/
[3]: https://github.com/search?q=dotfiles&type=Repositories
[4]: https://fedoramagazine.org/managing-dotfiles-rcm/
[5]: https://www.chezmoi.io/docs/how-to/#keep-data-private
[6]: https://www.chezmoi.io/docs/how-to/#use-a-generic-tool-to-keep-your-secrets
[7]: https://www.chezmoi.io/docs/how-to/#use-a-keyring-to-keep-your-secrets
[8]: https://fedoramagazine.org/using-pass-to-manage-your-passwords-on-fedora/
[9]: https://github.com/twpayne/dotfiles
