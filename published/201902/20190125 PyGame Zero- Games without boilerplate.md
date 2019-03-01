[#]: collector: (lujun9972)
[#]: translator: (bestony)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10532-1.html)
[#]: subject: (PyGame Zero: Games without boilerplate)
[#]: via: (https://opensource.com/article/19/1/pygame-zero)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

PyGame Zero: 无需模板的游戏开发
======

> 在你的游戏开发过程中有了 PyGame Zero，和枯燥的模板说再见吧。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python3-game.png?itok=jG9UdwC3)

Python 是一个很好的入门级编程语言。并且，游戏是一个很好的入门项目：它们是可视化的，自驱动的，并且可以很愉快的与朋友和家人分享。虽然，绝大多数的 Python 写就的库，比如 [PyGame][1] ，会让初学者因为忘记微小的细节很容易导致什么都没渲染而感到困扰。

在理解所有部分的作用之前，他们会将其中的许多部分都视为“无意识的模板文件”——需要复制和粘贴到程序中才能使其工作的神奇段落。

[PyGame Zero][2] 试图通过在 PyGame 上放置一个抽象层来弥合这一差距，因此它字面上并不需要模板。

我们在说的“字面”，就是在指字面。

这是一个合格的 PyGame Zero 文件：

```
# This comment is here for clarity reasons
```

我们可以将它放在一个 `game.py` 文件里，并运行：

```
$ pgzrun game.py
```

这将会展示一个窗口，并运行一个可以通过关闭窗口或按下 `CTRL-C` 中断的游戏循环。

遗憾的是，这将是一场无聊的游戏。什么都没发生。

为了让它更有趣一点，我们可以画一个不同的背景：

```
def draw():
    screen.fill((255, 0, 0))
```

这将会把背景色从黑色换为红色。但是这仍是一个很无聊的游戏，什么都没发生。我们可以让它变的更有意思一点：

```
colors = [0, 0, 0]

def draw():
    screen.fill(tuple(colors))

def update():
    colors[0] = (colors[0] + 1) % 256
```

这将会让窗口从黑色开始，逐渐变亮，直到变为亮红色，再返回黑色，一遍一遍循环。

`update` 函数更新了参数的值，而 `draw` 基于这些参数渲染这个游戏。

即使是这样，这里也没有任何方式给玩家与这个游戏的交互的方式。让我们试试其他一些事情：

```
colors = [0, 0, 0]

def draw():
    screen.fill(tuple(colors))

def update():
    colors[0] = (colors[0] + 1) % 256

def on_key_down(key, mod, unicode):
    colors[1] = (colors[1] + 1) % 256
```

现在，按下按键来提升亮度。

这些包括游戏循环的三个重要部分：响应用户输入，更新参数和重新渲染屏幕。

PyGame Zero 提供了更多功能，包括绘制精灵图和播放声音片段的功能。

试一试，看看你能想出什么类型的游戏！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/pygame-zero

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://www.pygame.org/news
[2]: https://pygame-zero.readthedocs.io/en/stable/
