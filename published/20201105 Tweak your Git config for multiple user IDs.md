[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12814-1.html)
[#]: subject: (Tweak your Git config for multiple user IDs)
[#]: via: (https://opensource.com/article/20/10/git-config)
[#]: author: (Ramanathan M https://opensource.com/users/muthiahramanathan)

调整你的 Git 配置以适应多个用户 ID 的需要
======

> 可以使用相同的机器用于工作和个人的 Git 提交，而无需手动重置你的配置。

![](https://img.linux.net.cn/data/attachment/album/202011/12/013805t4u4nu57rc6ur7nt.jpg)

Git 的 [git config][2] 命令可以让你为 Git 设置仓库或全局选项。它有很多选项，其中的一个选项 `includeIf` 在你使用在 Git 时有双重角色时非常方便，比如说，你既是全职的开发者，又在业余时间为开源项目做贡献。在这种情况下，大多数人都不想为两个角色使用一个共同的配置，或者，至少，他们肯定希望保持配置的某些部分是不同的，尤其是当他们在两个角色中使用同一台计算机时。

我的情况就是这样，所以我在 Git 配置中保留了两组不同的邮件 ID。这样一来，在我工作场所的项目仓库中提交的内容就会使用我办公室的邮件 ID，而在我个人 GitHub 帐户中提交的内容则使用我个人的邮件 ID。

以下是我的全局配置（维护在 `$HOME/.gitconfig`）中的一个片段，我将在下文中介绍。

```
[includeIf "gitdir:~/priv_scm/"]
        path = ~/priv_scm/.gitconfig
[includeIf "gitdir:~/work_scm/"]
        path = ~/work_scm/.gitconfig
```

### 什么是 includeIf？

`includeIf.condition.path` 变量，是 `include` 配置指令的一部分，允许你有条件地设置自定义配置。同时，自定义配置的路径也可以作为指令的一部分来设置。

这个指令支持三个关键字：`gitdir`、`gitdir/I` 和 `onbranch`。我将简单解释一下 `gitdir`，我在上面的代码片段中使用了它。你可以在[文档][3]中了解其他两个关键词。

在 `includeIf` 指令中使用 `gitdir` 关键字会对模式进行条件检查。根据规则，如果当前工作目录与 `gitdir` 中指定的目录模式相匹配，那么它就会从给定的路径中选取配置。我将在配置片段上应用这个规则来展示它是如何被应用的。

在配置片段中，你可以看到一个简单的模式，`~/`，它与 `gitdir` 关键字一起使用。这个模式会被存储在 `$HOME` 环境变量中的值所替代。

### 如何使用它

如果你使用同一个系统在 GitHub 或 GitLab 上的开源项目上工作，并在工作中提交到 Git 仓库，你可以有两个顶级目录，比如 `$HOME/priv_scm` 和 `$HOME/work_scm`。在这两个目录中，你可以有两个单独的 `.gitconfig` 文件，其中包含与你的 `user.name` 和 `user.email` 相关的设置。然而，它们也可以包含存储在 `$HOME` 的全局 `.gitconfig` 中，它可以保存两个环境通用的所有自定义项。

这里是一个例子 `$HOME/priv_scm/.gitconfig` 的片段：

```
$ cat $HOME/priv_scm/.gitconfig
[user]
    name  = Ramanathan Muthiah
    email = &lt;personal-mailid-goes-here&gt;
```

有了这个配置，你就可以切换目录，并开始在开源项目上工作，而无需手动重置一些与 Git 相关的配置。这些更改会在主 `.gitconfig` 中借助 `includeIf` 条件指令自动处理。

### Git 小贴士

希望这个小贴士能帮助你组织 Git 项目。你最喜欢的 Git 小贴士是什么？请在评论中分享吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/git-config

作者：[Ramanathan M][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/muthiahramanathan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://git-scm.com/docs/git-config
[3]: https://git-scm.com/docs/git-config#_conditional_includes
