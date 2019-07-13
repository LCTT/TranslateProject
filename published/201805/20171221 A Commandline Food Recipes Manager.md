HeRM's ：一个命令行食谱管理器
======

![配图](https://www.ostechnix.com/wp-content/uploads/2017/12/herms-720x340.jpg)

烹饪让爱变得可见，不是吗？确实！烹饪也许是你的热情或爱好或职业，我相信你会维护一份烹饪日记。保持写烹饪日记是改善烹饪习惯的一种方法。有很多方法可以记录食谱。你可以维护一份小日记/笔记或将配方的笔记存储在智能手机中，或将它们保存在计算机中文档中。这有很多选择。今天，我介绍 **HeRM's**，这是一个基于 Haskell 的命令行食谱管理器，能为你的美食食谱做笔记。使用 Herm's，你可以添加、查看、编辑和删除食物配方，甚至可以制作购物清单。这些全部来自你的终端！它是免费的，是使用 Haskell 语言编写的开源程序。源代码在 GitHub 中免费提供，因此你可以复刻它，添加更多功能或改进它。

### HeRM's - 一个命令食谱管理器

#### 安装 HeRM's

由于它是使用 Haskell 编写的，因此我们需要首先安装 Cabal。 Cabal 是一个用于下载和编译用 Haskell 语言编写的软件的命令行程序。Cabal 存在于大多数 Linux 发行版的核心软件库中，因此你可以使用发行版的默认软件包管理器来安装它。

例如，你可以使用以下命令在 Arch Linux 及其变体（如 Antergos、Manjaro Linux）中安装 cabal：

```
sudo pacman -S cabal-install
```

在 Debian、Ubuntu 上：

```
sudo apt-get install cabal-install
```

安装 Cabal 后，确保你已经添加了 `PATH`。为此，请编辑你的 `~/.bashrc`：

```
vi ~/.bashrc
```

添加下面这行：

```
PATH=$PATH:~/.cabal/bin
```

按 `:wq` 保存并退出文件。然后，运行以下命令更新所做的更改。

```
source ~/.bashrc
```

安装 cabal 后，运行以下命令安装 `herms`：

```
cabal install herms
```

喝一杯咖啡！这将需要一段时间。几分钟后，你会看到一个输出，如下所示。

```
[...]
Linking dist/build/herms/herms ...
Installing executable(s) in /home/sk/.cabal/bin
Installed herms-1.8.1.2
```

恭喜！ Herms 已经安装完成。

#### 添加食谱

让我们添加一个食谱，例如 Dosa。对于那些想知道的，Dosa 是一种受欢迎的南印度食物，配以 sambar（LCTT 译注：扁豆和酸豆炖菜，像咖喱汤） 和**酸辣酱**。这是一种健康的，可以说是最美味的食物。它不含添加的糖或饱和脂肪。制作一个也很容易。有几种不同的 Dosas，在我们家中最常见的是 Plain Dosa。

要添加食谱，请输入：

```
herms add
```

你会看到一个如下所示的屏幕。开始输入食谱的详细信息。

![][2]

要变换字段，请使用以下键盘快捷键：

  * `Tab` / `Shift+Tab` - 下一个/前一个字段
  * `Ctrl + <箭头键>` - 导航字段
  * `[Meta 或者 Alt] + <h-j-k-l>` - 导航字段
  * `Esc` - 保存或取消。


添加完配方的详细信息后，按下 `ESC` 键并点击 `Y` 保存。同样，你可以根据需要添加尽可能多的食谱。

要列出添加的食谱，输入：

```
herms list
```

![][3]

要查看上面列出的任何食谱的详细信息，请使用下面的相应编号。

```
herms view 1
```

![][4]

要编辑任何食谱，使用：

```
herms edit 1
```

完成更改后，按下 `ESC` 键。系统会询问你是否要保存。你只需选择适当的选项。

![][5]

要删除食谱，命令是：

```
herms remove 1
```

要为指定食谱生成购物清单，运行：

```
herms shopping 1
```

![][6]

要获得帮助，运行：

```
herms -h
```

当你下次听到你的同事、朋友或其他地方谈到好的食谱时，只需打开 Herm's，并快速记下，并将它们分享给你的配偶。她会很高兴！

今天就是这些。还有更好的东西。敬请关注！

干杯！！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/herms-commandline-food-recipes-manager/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/12/Make-Dosa-1.png 
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-1-1.png 
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-2.png 
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-3.png 
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-4.png 
