[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Have a cow at the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-cowsay)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: (https://linux.cn/article-10346-1.html)


在 Linux 命令行上拥有一头奶牛
======

> 使用 cowsay 实用程序将牛的话语带到你的终端输出。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cowsay.png?itok=RA4NDbrY)

欢迎来到 Linux 命令行玩具第四天。如果这是你第一次访问这个系列，你可能会问自己，什么是命令行玩具。我们也在考虑这一点，但是一般来说，这可能是一个游戏，或者任何简单的娱乐，可以帮助你在终端玩得开心。

你们中的一些人会见过我们之前的选中的各种玩具，但是我们希望至少有一个对每个人来说都是新的。因为几乎所有我告诉他这个系列的人都已经问过它了，所以今天的选中的玩具是必须提及的。

你也不会认为我们会在不提及 `cowsay` 的情况下完成这个系列，对吧？ 

`cowsay` 是一个神奇的实用程序，它将文本作为 ASCII 艺术牛的讲话文本输出。

你可能会发现 `cowsay` 打包在你的默认存储库中，甚至可能已经安装了。对我来说，在 Fedora，像这样安装:

```
$ sudo dnf install -y cowsay
```

然后，用 `cowsay` 调用它，然后是你的消息。也许你想到昨天我们谈到的 [fortune 应用][1] 连接起来。 

```
$ fortune | cowsay
 _________________________________________
/ If at first you do succeed, try to hide \
\ your astonishment.                      /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

就这样！`cowsay` 还有点小变体，称为 cow 文件，通常可以在 `/usr/share/cowsay` 找到 ，要查看系统上可用的 cow 文件，请在 `cowsay` 之后使用 `-l` 。然后，用 `-f` 试试其中之一。 

```
$ cowsay -f dragon "Run for cover, I feel a sneeze coming on."
 _______________________________________
/ Run for cover, I feel a sneeze coming \
\ on.                                   /
 ---------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \ 
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
```

我对 `cowsay` 的真正不满是，我今天没有足够的时间来为牛的挤奶 —— 一语双关。牛排价格太高了，我只是开个玩笑。 

更严重的是，我已经完全忘记了 `cowsay` 直到我在学习 Ansible 的剧本时再次遇到它。如果你碰巧安装了 `cowsay`，当你运行 Ansible 的剧本时，你会从一队奶牛那里获得输出。例如，运行这个剧本：

```
- hosts:
    - localhost
  tasks:
    - action: ping
```

可能会给你以下信息：

```
$ ansible-playbook playbook.yml
 __________________
< PLAY [localhost] >
 ------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [localhost]
 _____________
< TASK [ping] >
 -------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [localhost]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

localhost                  : ok=2    changed=0    unreachable=0    failed=0  
```

`cowsay`  在 GPLv3 许可证下可用，您可以在 GitHub 上找到 它的 Perl [源代码][2]。我也见过其他语言的版本，所以可以看看其他变体；例如，这是 [R 语言版][3]。用你选择的语言实现你自己的版本可能是一项有趣的编程学习任务。 

既然讲完了 `cowsay`，我们可以去更绿色的牧场了。

你有希望我来介绍的喜欢的命令行玩具吗？这个系列的排期大部分都填好了，但我还有一些空位方。在下面的评论中让我知道，我会来看看。如果有空间，我会尝试把它包括进去。如果没有，但是我收到了一些好的意见，我在结尾提及。

看看昨天的玩具，[如何给你的 Linux 终端带来好运][1]，明天再来看看另一个！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-cowsay

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-fortune
[2]: https://github.com/tnalpgge/rank-amateur-cowsay
[3]: https://github.com/sckott/cowsay
