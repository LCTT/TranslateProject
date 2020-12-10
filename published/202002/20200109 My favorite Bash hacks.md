[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11841-1.html)
[#]: subject: (My favorite Bash hacks)
[#]: via: (https://opensource.com/article/20/1/bash-scripts-aliases)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

我珍藏的 Bash 秘籍
======

> 通过别名和其他捷径来提高你经常忘记的那些事情的效率。

![bash logo on green background][1]

要是你整天使用计算机，如果能找到需要重复执行的命令并记下它们以便以后轻松使用那就太棒了。它们全都呆在那里，藏在 `~/.bashrc` 中（或 [zsh 用户][2]的 `~/.zshrc` 中），等待着改善你的生活！

在本文中，我分享了我最喜欢的这些助手命令，对于我经常遗忘的事情，它们很有用，也希望这可以帮助到你，以及为你解决一些经常头疼的问题。

### 完事吱一声

当我执行一个需要长时间运行的命令时，我经常采用多任务的方式，然后就必须回头去检查该操作是否已完成。然而通过有用的 `say` 命令，现在就不用再这样了（这是在 MacOS 上；请根据你的本地环境更改为等效的方式）：

```
function looooooooong {
    START=$(date +%s.%N)
    $*
    EXIT_CODE=$?
    END=$(date +%s.%N)
    DIFF=$(echo "$END - $START" | bc)
    RES=$(python -c "diff = $DIFF; min = int(diff / 60); print('%s min' % min)")
    result="$1 completed in $RES, exit code $EXIT_CODE."
    echo -e "\n⏰  $result"
    ( say -r 250 $result 2>&1 > /dev/null & )
}
```

这个命令会记录命令的开始和结束时间，计算所需的分钟数，并“说”出调用的命令、花费的时间和退出码。当简单的控制台铃声无法使用时，我发现这个超级有用。

### 安装小助手

我在小时候就开始使用 Ubuntu，而我需要学习的第一件事就是如何安装软件包。我曾经首先添加的别名之一是它的助手（根据当天的流行梗命名的）：

```
alias canhas="sudo apt-get install -y"
```

### GPG 签名

有时候，我必须在没有 GPG 扩展程序或应用程序的情况下给电子邮件签署 [GPG][3] 签名，我会跳到命令行并使用以下令人讨厌的别名：

```
alias gibson="gpg --encrypt --sign --armor"
alias ungibson="gpg --decrypt"
```

### Docker

Docker 的子命令很多，但是 Docker compose 的更多。我曾经使用这些别名来将 `--rm` 标志丢到脑后，但是现在不再使用这些有用的别名了：

```
alias dc="docker-compose"
alias dcr="docker-compose run --rm"
alias dcb="docker-compose run --rm --build"
```

### Google Cloud 的 gcurl 助手

对于我来说，Google Cloud 是一个相对较新的东西，而它有[极多的文档][4]。`gcurl` 是一个别名，可确保在用带有身份验证标头的本地 `curl` 命令连接 Google Cloud API 时，可以获得所有正确的标头。

### Git 和 ~/.gitignore

我工作中用 Git 很多，因此我有一个专门的部分来介绍 Git 助手。

我最有用的助手之一是我用来克隆 GitHub 存储库的。你不必运行：

```
git clone git@github.com:org/repo /Users/glasnt/git/org/repo
```

我设置了一个克隆函数：

```
clone(){
    echo Cloning $1 to ~/git/$1
    cd ~/git
    git clone git@github.com:$1 $1
    cd $1
}
```

即使每次进入 `~/.bashrc` 文件看到这个时，我总是会忘记和傻笑，我也有一个“刷新上游”命令：

```
alias yoink="git checkout master && git fetch upstream master && git merge upstream/master"
```

给 Git 一族的另一个助手是全局忽略文件。在你的 `git config --global --list` 中，你应该看到一个 `core.excludesfile`。如果没有，请[创建一个][6]，然后将你总是放到各个 `.gitignore` 文件中的内容填满它。作为 MacOS 上的 Python 开发人员，对我来说，这些内容是：

```
.DS_Store     # macOS clutter
venv/         # I never want to commit my virtualenv
*.egg-info/*  # ... nor any locally compiled packages
__pycache__   # ... or source
*.swp         # ... nor any files open in vim
```

你可以在 [Gitignore.io][7] 或 GitHub 上的 [Gitignore 存储库][8]上找到其他建议。

### 轮到你了

你最喜欢的助手命令是什么？请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/bash-scripts-aliases

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/9/getting-started-zsh
[3]: https://gnupg.org/
[4]: https://cloud.google.com/service-infrastructure/docs/service-control/getting-started
[5]: mailto:git@github.com
[6]: https://help.github.com/en/github/using-git/ignoring-files#create-a-global-gitignore
[7]: https://www.gitignore.io/
[8]: https://github.com/github/gitignore
