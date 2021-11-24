[#]: subject: "Use the Linux cowsay command for a colorful holiday greeting"
[#]: via: "https://opensource.com/article/21/11/linux-cowsay"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13977-1.html"

使用 Linux cowsay 命令制作丰富多彩的节日问候 
======

> 用这个有趣的 Linux 命令行工具来庆祝节日吧。

![](https://img.linux.net.cn/data/attachment/album/202111/12/101540nq1nut3gzkzz1qus.jpg)

你可能听说过这样一个小程序：它能接受输入信息（比如你通过键盘输入的消息），并输出一张引用了输入消息的牛的图像。这个小程序被称为 `cowsay`，之前我们已经 [介绍][2] 过了。 

所以，为了搞点有趣的事，我想用它来庆祝 <ruby>亡灵节<rt>Día de los Muertos</rt></ruby>（LCTT 译注：墨西哥传统的鬼节，著名动画电影《<ruby>寻梦环游记<rt>Coco</rt></ruby>》即以此为背景）。

除了牛之外，其实还有一些其他的可用图像。当安装 `cowsay` 时，程序会自动安装其他几个图像，并存储在 `/usr/share/cowsay` 目录中。你可以用 `-l` 参数来获取图像列表。 

```
$ sudo dnf install cowsay
$ cowsay -l
```

实际上还有很多与 `cowsay` 或类似程序相关的开发活动。你可以创建自己的图像文件，也可以下载其他人制作的图像。例如，GitHub 上就有 [Charc0al 的 cowsay 文件转换器][3]。你可以用这一工具将自己的图片转换为 `cowsay` 所需的特殊 ASCII 格式文件。根据 Linux 或 FreeBSD 终端设置不同，你可能会启用颜色支持，而 `cowsay` 也可以显示彩色图像。Charc0al 的转换器也提供了许多现成的颜色文件。 

我选择了“<ruby>甲壳虫汁<rt>Beetlejuice</rt></ruby>”（LCTT 译注：同名美国奇幻喜剧电影中的主角大法师）文件来开展我的“庆祝活动”。首先，我将 [beetlejuice.cow][4] 文件保存到了 `/usr/share/cowsay` 目录。这个目录权限属于 root 用户，你可以先将该文件保存到家目录，然后再复制过去。此外我们还需要将该文件的读取权限赋予所有用户。

```
$ sudo cp beetlejuice.cow /usr/share/cowsay
$ sudo chmod o+r /usr/share/cowsay/beetlejuice.cow
```

关注一下图像是如何生成的（过程很有趣）。首先将各种 ASCII 颜色控制代码设置为变量，然后用这些变量，以传统的 ASCII 艺术风格绘制图像。生成的图像几乎是全身的，并且在不滚动屏幕的情况下，不适配我的终端的高度，所以我编辑了一下该文件，删除了最后 15 行以降低高度。

这个图像也可以被 `cowsay` 程序检测到，并展示在列表中。

```
$ cowsay -l
Cow files in /usr/share/cowsay:
beavis.zen beetlejuice blowfish bud-frogs bunny cheese cower default dragon
...
```

现在，只要运行程序，并使用 `-f` 选项指定该图像就可以了。别忘了提供要输出的信息。

```
$ cowsay -f beetlejuice "Happy Day of the Dead!"
```

![ASCII display of Beetlejuice via cowsay][5]

*“甲壳虫汁”祝你亡灵节快乐 (CC BY-SA 4.0)*

`cowsay` 是 Linux 中一个有趣的搞怪小玩意。发挥你的创意，探索一下 `cowsay` 以及 ASCII 的艺术吧。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-cowsay

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/drew-hays-unsplash.jpg?itok=uBrvJkTW (Pumpkins painted for Day of the Dead)
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
[3]: https://charc0al.github.io/cowsay-files/converter/
[4]: https://raw.githubusercontent.com/charc0al/cowsay-files/master/cows/beetlejuice.cow
[5]: https://opensource.com/sites/default/files/cowsay_beetlejuice.png
