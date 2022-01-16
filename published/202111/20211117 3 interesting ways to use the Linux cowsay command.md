[#]: subject: "3 interesting ways to use the Linux cowsay command"
[#]: via: "https://opensource.com/article/21/11/linux-cowsay-command"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14021-1.html"

使用 cowsay 命令的 3 种有趣方式
======

> 想试一个只是好玩的应用吗？试试 cowsay。

![](https://img.linux.net.cn/data/attachment/album/202111/25/232451f6v8fnne2np8e22e.jpg)

大多数时候，终端是一个生产力的动力源。但是，终端的作用不止是命令和配置。在所有杰出的开源软件中，有些是 [为了好玩而写的][2]。我以前介绍过一些 [有趣的命令][3]，但这篇文章只讲一个：古老的 `cowsay` 命令。

`cowsay` 是一只可配置的会说话（或思考）的牛。它接受一个文本字符串，并输出一个牛说话的图形。下面是一头牛在说它喜欢 Linux：

```
< I love Linux >
--------------
       \   ^__^
        \  (oo)\_______
           (__)\       )\/\
               ||----w |
               ||     ||
```

要得到这个结果，我只需输入：

```
$ cowsay "I love Linux"
```

### 在 Linux 上安装 cowsay

你可以用你的包管理器安装 `cowsay`。在 Debian、Mint、Elementary 和类似的发行版上：

```
$ sudo apt install cowsay
```

在 Fedora 上：

```
$ sudo apt install cowsay-beefymiracle
```

### Cowsay 命令选项

`cowsay` 是一个简单又有点傻的应用。除了为你的终端机提供一些不同样式外，它并没有什么实际用途。例如，与其让一头普通的牛说一个有趣短语，你可以让一头长着古怪眼睛的牛说一个有趣的短语。输入：

```
$ cowsay -e @@ Hello
```

你会看到：

```
< Hello >
 -------
       \   ^__^
        \  (@@)\_______
           (__)\       )\/\
               ||----w |
               ||     ||
```

或者你可以让它伸出舌头。输入：

```
$ cowsay -T U Hello
```

你会看到：

```
< Hello >
-------
       \   ^__^
        \  (oo)\_______
           (__)\       )\/\
            U ||----w |
               ||     ||
```

更好的是，你可以将 `fortune` 命令与 `cowsay` 结合起来：

```
$ fortune | cowsay
```

现在你有了一头特别睿智的牛：

```
 _______________________________________
/ we:                                   \
|                                       |
| The single most important word in the |
\ world.                                /
 ---------------------------------------
       \   ^__^
        \  (oo)\_______
           (__)\       )\/\
               ||----w |
               ||     ||
```

### “结实的奇迹”

在 Fedora 上，有一个额外的 `cowsay` 选项，也是一个非官方的项目吉祥物。多年来，Fedora 安装程序一直在展示宣传开源贡献的幻灯片。因为它们是根据汽车电影院的插曲设计的，所以幻灯片中常见的卡通人物是拟人化的热狗。

为了与这个主题保持一致，你可以用 Fedora 版本的 `cowsay` 调用一个所谓的“<ruby>结实的奇迹<rt>beefy miracle</rt></ruby>”。（LCTT 译注：Fedora 17 的开发代号。）

```
$ cowsay -f beefymiracle Hello Fedora
```

你会得到一个非常傻的输出：

```
< Hello Fedora >
 --------------      .---. __
          ,    \    /     \   \    ||||
         \\\\      |O___O |    | \\||||
         \   //    | \_/  |    |  \   /
          '--/----/|     /     |   |-'
                 // //  /     -----'
                //  \\ /      /
               //  // /      /
              //  \\ /      /
             //  // /      /
            /|   ' /      /
            //\___/      /
           //   ||\     /
           \\_  || '---'
           /' /  \\_.-
          /  /    --| |
          '-'      |  |
                    '-'
```

### 图形化的 cowsay

如果你发现自己需要用图形化的牛来传递信息，可以使用 `xcowsay` 命令。这是一个类似于 `cowsay` 的图形程序，它接受一个由用户输入的文本字符串，或从另一个应用（如 Fortune）输送过来的文本字符串。

![A cartoon cow has a speech bubble that reads "I love Linux"][4]

### 有趣的 Linux 命令

虽然 `cowsay` 不是一个有用的命令，但它是一个有趣的命令，相当于你终端的桌面小工具。它很适合用来分散注意力和进行有趣的管道命令实验（尝试将 `ifconfig` 管道到 `cowsay`，或 `lsblk` 或 `mount`，或任何东西！）。如果你想让你的终端更有趣，试试 `cowsay`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-cowsay-command

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_CowParade_osdc.png?itok=6GD1Wnbm (Cow on parade.)
[2]: https://opensource.com/life/16/6/fun-and-semi-useless-toys-linux
[3]: https://opensource.com/article/21/11/fun-linux-commands
[4]: https://opensource.com/sites/default/files/uploads/graphical_cowsay.png (graphical cowsay)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
