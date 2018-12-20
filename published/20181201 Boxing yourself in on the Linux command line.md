[#]: collector: (lujun9972)
[#]: translator: (jrglinux)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Boxing yourself in on the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-boxes)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: (https://linux.cn/article-10352-1.html)

神奇的 Linux 命令行字符形状工具 boxes
======

> 本文将教你如何在 Linux 命令行终端中使用 boxes 工具绘制字符形状图形来包装你的文字让其更突出。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-boxes.png?itok=Rii6nT5P)

现在正值假期，每个 Linux 终端用户都该得到一点礼物。无论你是庆祝圣诞节还是庆祝其他节日，或者什么节日也没有，都没有关系。我将在接下来的几周内介绍 24 个 Linux 命令行小玩具，供你把玩或者与朋友分享。让我们享受乐趣，让这个月过得快乐一点，因为对于北半球来说，这个月有点冷并且沉闷。

对于我要讲述的内容，可能你之前就有些了解。但是，我还是希望我们都有机会学到一些新的东西（我做了一点研究，确保可以分享 24 个小玩具）。

24 个 Linux 终端小玩具中的第一个是叫做 `boxes` 的小程序。为何从 `boxes` 说起呢？因为在没有它的情况下很难将所有其他命令礼物包装起来！

在我的 Fedora 机器上，默认没有安装 `boxes` 程序，但它在我的普通仓库中可以获取到，所以用如下命令就可安装：

```
$ sudo dnf install boxes -y
```

如果你在使用其他 Linux 发行版，一般也都可以在默认仓库中找到 `boxes`。

`boxes` 是我真正希望在高中和大学计算机课程中就使用的实用程序，因为善意的老师要求我在每个源文件、函数、代码块等开头添加一些特定外观的备注信息。

```
/***************/
/* Hello World */
/***************/
```

事实证明，一旦你需要在框内添加几行文字，并且格式化的将它们统一风格就会变得很乏味。而 `boxes` 是一个简单实用程序，它使用 ASCII 艺术风格的字符形状框来包围文本。其字符形状默认风格是源代码注释风格，但也提供了一些其他选项。

它真的很容易使用。使用管道，便可以将一个简短问候语塞进字符形状盒子里。

```
$ cat greeting.txt | boxes -d diamonds -a c
```

上面的命令输出结果如下：

```
       /\          /\          /\
    /\//\\/\    /\//\\/\    /\//\\/\
 /\//\\\///\\/\//\\\///\\/\//\\\///\\/\
//\\\//\/\\///\\\//\/\\///\\\//\/\\///\\
\\//\/                            \/\\//
 \/                                  \/
 /\      I'm wishing you all a       /\
//\\     joyous holiday season      //\\
\\//     and a Happy Gnu Year!      \\//
 \/                                  \/
 /\                                  /\
//\\/\                            /\//\\
\\///\\/\//\\\///\\/\//\\\///\\/\//\\\//
 \/\\///\\\//\/\\///\\\//\/\\///\\\//\/
    \/\\//\/    \/\\//\/    \/\\//\/
       \/          \/          \/
```

或者玩点更有趣的，比如：

```
echo "I am a dog" | boxes -d dog -a c
```

不要惊讶，它将会输出如下：

```
          __   _,--="=--,_   __
         /  \."    .-.    "./  \
        /  ,/  _   : :   _  \/` \
        \  `| /o\  :_:  /o\ |\__/
         `-'| :="~` _ `~"=: |
            \`     (_)     `/
     .-"-.   \      |      /   .-"-.
.---{     }--|  /,.-'-.,\  |--{     }---.
 )  (_)_)_)  \_/`~-===-~`\_/  (_(_(_)  (
(              I am a dog               )
 )                                     (
'---------------------------------------'
```

`boxes` 程序提供了[很多选项][1] 用于填充、定位甚至处理正则表达式。你可以在其 [项目主页][2] 上了解更多有关 `boxes` 的信息，或者转到 [GitHub][3] 去下载源代码或者贡献你自己的盒子形状。说到此，如果你想给你的提交找个好点子，我已经有了一个想法：为什么不能是一个节日礼物盒子？

```
         _  _
        /_\/_\
 _______\_\/_/_______
|       ///\\\       |
|      ///  \\\      |
|                    |
|     "Happy pull    |
|       request!"    |
|____________________|
```

`boxes` 是基于 GPLv2 许可证的开源项目。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。即使要介绍的小玩具已经有 24 个了，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

你可以通过 [Drive a locomotive through your Linux terminal][4] 来查看明天会介绍的命令行小玩具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-boxes

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://boxes.thomasjensen.com/examples.html
[2]: https://boxes.thomasjensen.com/
[3]: https://github.com/ascii-boxes/boxes
[4]: https://opensource.com/article/18/12/linux-toy-sl
