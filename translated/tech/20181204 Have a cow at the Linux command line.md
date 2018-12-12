[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Have a cow at the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-cowsay)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )


在Linux命令行上拥有一头奶牛
======

使用 cowsay 实用程序将牛的声音带到你的终端输出。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cowsay.png?itok=RA4NDbrY)

欢迎来到 Linux 命令行玩具第四天。如果这是你第一次访问这个系列，你可能会问自己，什么是命令行玩具。我们也在考虑这一点，但是一般来说，这可能是一个游戏，或者任何简单的娱乐，可以帮助你在终端玩得开心。

你们中的一些人以前会看过我们日历上的各种选项，但是我们希望每个人都至少有一个新的选项。因为几乎所有我提到这个系列的人都已经问过我了，今天的选项是必须的。

你不认为我们会在不提及 cowsay 的情况下完成这个系列，是吗？ 

Cowsey 是一个神奇的实用程序，它将文本作为ASCII艺术牛的口语文本输出。

你可能会发现 cowsey 打包在你的默认存储库中，甚至可能已经安装了。对我来说，在 Fedora,像这样安装:

```
$ sudo dnf install -y cowsay
```
然后，用 cowsey 调用它，然后是你的消息。也许你想到昨天我们谈到的 [幸运][1] [应用][1]。 

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

就这样！**CowSay** 几乎没有变化，称为 cow 文件，通常可以在 **/usr/share/cowsay** ，要查看系统上可用的 cow 文件选项，请在 cowsay 之后使用 **-l** 。然后，用 **-f** 试试其中之一。 

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
我对 **cowsay** 的真正不满是，我今天没有足够的时间来为牛的挤奶。牛排太高了，我可能会开个玩笑。 

更严重的是，我已经完全忘记了 **cowsay** 直到我在学习可翻译的剧本时再次遇到它。如果你碰巧安装了 **cowyay**，当你运行脚本时，你会从一系列奶牛身上获得产出。例如，运行本脚本:


```
- hosts:
    - localhost
  tasks:
    - action: ping
```
可能会给你以下信息:

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
**Cowsay** 在GPLV3许可证下可用，您可以在 GitHub 上找到 Perl [源代码][2]。我也见过其他语言的版本，所以看看其他变体；例如，这是 [R语言][3] 。用你选择的语言实现你自己的版本可能是一项有趣的编程学习任务。 

Now that **cowsay** is out of the way, we can move on to greener pastures.
既然 **cowsay** 不碍事了，我们可以去更绿色的牧场了。

你有最喜欢的命令行玩具吗，你认为我应该对它进行分析？这个系列的日历大部分都填好了，但我还有一些地方。在下面的评论中让我知道，梦幻篮球来看看。如果有空间，梦幻篮球会尝试把它包括进去。如果没有，但是我收到了一些好的意见书，梦幻篮球在结尾做了一个荣誉提名的总结。

看看昨天的玩具，[如何给你的Linux终端带来好运][1]，明天再来看看另一个！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-cowsay

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-fortune
[2]: https://github.com/tnalpgge/rank-amateur-cowsay
[3]: https://github.com/sckott/cowsay
