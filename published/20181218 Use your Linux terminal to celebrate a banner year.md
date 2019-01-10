[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10428-1.html)
[#]: subject: (Use your Linux terminal to celebrate a banner year)
[#]: via: (https://opensource.com/article/18/12/linux-toy-figlet)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

使用你的 Linux 终端庆祝新年
======

> 想让你的终端被记住么？将它打在横幅上，不要错过。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-figlet.png?itok=o4XmTL-b)

欢迎再次来到为期 24 天的 Linux 命令行玩具日历。如果这是你第一次访问该系列，你甚至可能会问自己什么是命令行玩具。我们也在思考，但一般来说，它可能是一个游戏，或任何简单的消遣，可以帮助你在终端玩得开心。

很可能你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新事物。

今天的玩具是 `figlet`，一个在 Linux 终端上以横幅形式打印文本的程序。

你可能会再标准仓库中找到 `figlet`。在我的 Fedora 上，这意味着安装就像下面这样简单：

```
$ sudo dnf install figlet
```

之后，只需使用程序的名称来调用它。你可以以交互方式使用它，或者将一些文本通过管道输入，如下所示：

```
echo "Hello world" | figlet
 _   _      _ _                            _     _
| | | | ___| | | ___   __      _____  _ __| | __| |
| |_| |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` |
|  _  |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |
|_| |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_|
```

`figlet` 有许多不同的字体。要查看可用的字体，请尝试使用命令 `showfigfonts`。在我这里显示了十几个。我在下面复制了一些我的最爱。

```
block :
                                           
_|        _|                      _|        
_|_|_|    _|    _|_|      _|_|_|  _|  _|    
_|    _|  _|  _|    _|  _|        _|_|      
_|    _|  _|  _|    _|  _|        _|  _|    
_|_|_|    _|    _|_|      _|_|_|  _|    _|  


bubble :
  _   _   _   _   _   _  
 / \ / \ / \ / \ / \ / \
( b | u | b | b | l | e )
 \_/ \_/ \_/ \_/ \_/ \_/


lean :
                                     
    _/                              
   _/    _/_/      _/_/_/  _/_/_/    
  _/  _/_/_/_/  _/    _/  _/    _/  
 _/  _/        _/    _/  _/    _/    
_/    _/_/_/    _/_/_/  _/    _/  


script :
                         
               o          
 ,   __   ,_        _ _|_
/ \_/    /  |  |  |/ \_|  
 \/ \___/   |_/|_/|__/ |_/
                 /|      
                 \|      
```

你可以在项目的[主页][1]上找到有关 `figlet` 的更多信息。我下载的版本是以 MIT 许可开源的。

你会发现 `figlet` 不是唯一的 Linux 终端横幅打印机。另外一个你可以选择的是 [toilet][2]，它有一套自己的 ASCII 艺术风格的打印选项。

你有特别喜欢的命令行小玩具需要我介绍的吗？我们的日历基本上满了，但我们仍然希望在新的一年中展示一些很酷的命令行玩具。请在评论中留言，我会查看的。记得让我知道你对今天玩具的看法。

一定要看看昨天的玩具，[使用 asciiquarium 在终端中游泳][3]，记得明天回来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-figlet

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://www.figlet.org/
[2]: http://caca.zoy.org/wiki/toilet
[3]: https://opensource.com/article/18/12/linux-toy-asciiquarium
