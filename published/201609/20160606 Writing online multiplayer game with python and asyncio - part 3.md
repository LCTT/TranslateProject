使用 Python 和 Asyncio 来编写在线多人游戏（三）
=================================================================

![](https://7webpages.com/media/cache/17/81/178135a6db5074c72a1394d31774c658.gif)

> 在这个系列中，我们基于多人游戏 [贪吃蛇][1] 来制作一个异步的 Python 程序。上一篇文章聚焦于[编写游戏循环][2]上，而本系列第 1 部分则涵盖了如何[异步化][3]。

- 代码戳[这里][4]

### 4、制作一个完整的游戏

![](https://7webpages.com/static/img/14chs7.gif)

#### 4.1 工程概览

在此部分，我们将回顾一个完整在线游戏的设计。这是一个经典的贪吃蛇游戏，增加了多玩家支持。你可以自己在 （<http://snakepit-game.com>） 亲自试玩。源码在 GitHub 的这个[仓库][5]。游戏包括下列文件：

- [server.py][6] - 处理主游戏循环和连接。
- [game.py][7] - 主要的 `Game` 类。实现游戏的逻辑和游戏的大部分通信协议。
- [player.py][8] - `Player` 类，包括每一个独立玩家的数据和蛇的展现。这个类负责获取玩家的输入并相应地移动蛇。
- [datatypes.py][9] - 基本数据结构。
- [settings.py][10] - 游戏设置，在注释中有相关的说明。
- [index.html][11] - 客户端所有的 html 和 javascript代码都放在一个文件中。

#### 4.2 游戏循环内窥

多人的贪吃蛇游戏是个用于学习十分好的例子，因为它简单。所有的蛇在每个帧中移动到一个位置，而且帧以非常低的频率进行变化，这样就可以让你就观察到游戏引擎到底是如何工作的。因为速度慢，对于玩家的按键不会立马响应。按键先是记录下来，然后在一个游戏循环迭代的最后计算下一帧时使用。

> 现代的动作游戏帧频率更高，而且通常服务端和客户端的帧频率是不相等的。客户端的帧频率通常依赖于客户端的硬件性能，而服务端的帧频率则是固定的。一个客户端可能根据一个游戏“嘀嗒”的数据渲染多个帧。这样就可以创建平滑的动画，这个受限于客户端的性能。在这个例子中，服务端不仅传输物体的当前位置，也要传输它们的移动方向、速度和加速度。客户端的帧频率称之为 FPS（每秒帧数：frames per second），服务端的帧频率称之为 TPS（每秒滴答数：ticks per second）。在这个贪吃蛇游戏的例子中，二者的值是相等的，在客户端显示的一帧是在服务端的一个“嘀嗒”内计算出来的。

我们使用类似文本模式的游戏区域，事实上是 html 表格中的一个字符宽的小格。游戏中的所有对象都是通过表格中的不同颜色字符来表示。大部分时候，客户端将按键的码发送至服务端，然后每个“滴答”更新游戏区域。服务端一次更新包括需要更新字符的坐标和颜色。所以我们将所有游戏逻辑放置在服务端，只将需要渲染的数据发送给客户端。此外，我们通过替换通过网络发送的数据来减少游戏被破解的概率。

#### 4.3 它是如何运行的？

这个游戏中的服务端出于简化的目的，它和例子 3.2 类似。但是我们用一个所有服务端都可访问的 `Game` 对象来代替之前保存了所有已连接 websocket 的全局列表。一个 `Game` 实例包括一个表示连接到此游戏的玩家的 `Player` 对象的列表（在 `self._players` 属性里面），以及他们的个人数据和 websocket 对象。将所有游戏相关的数据存储在一个 `Game` 对象中，会方便我们增加多个游戏房间这个功能——如果我们要增加这个功能的话。这样，我们维护多个 `Game` 对象，每个游戏开始时创建一个。

客户端和服务端的所有交互都是通过编码成 json 的消息来完成。来自客户端的消息仅包含玩家所按下键码对应的编号。其它来自客户端消息使用如下格式：

```
[command, arg1, arg2, ... argN ]
```

来自服务端的消息以列表的形式发送，因为通常一次要发送多个消息 （大多数情况下是渲染的数据）：

```
[[command, arg1, arg2, ... argN ], ... ]
```

在每次游戏循环迭代的最后会计算下一帧，并且将数据发送给所有的客户端。当然，每次不是发送完整的帧，而是发送两帧之间的变化列表。

注意玩家连接上服务端后不是立马加入游戏。连接开始时是观望者（spectator）模式，玩家可以观察其它玩家如何玩游戏。如果游戏已经开始或者上一个游戏会话已经在屏幕上显示 “game over” （游戏结束），用户此时可以按下 “Join”（参与），来加入一个已经存在的游戏，或者如果游戏没有运行（没有其它玩家）则创建一个新的游戏。后一种情况下，游戏区域在开始前会被先清空。

游戏区域存储在 `Game._field` 这个属性中，它是由嵌套列表组成的二维数组，用于内部存储游戏区域的状态。数组中的每一个元素表示区域中的一个小格，最终小格会被渲染成 html 表格的格子。它有一个 `Char` 的类型，是一个 `namedtuple` ，包括一个字符和颜色。在所有连接的客户端之间保证游戏区域的同步很重要，所以所有游戏区域的更新都必须依据发送到客户端的相应的信息。这是通过 `Game.apply_render()` 来实现的。它接受一个 `Draw` 对象的列表，其用于内部更新游戏区域和发送渲染消息给客户端。

> 我们使用 `namedtuple` 不仅因为它表示简单数据结构很方便，也因为用它生成 json 格式的消息时相对于 `dict` 更省空间。如果你在一个真实的游戏循环中需要发送复杂的数据结构，建议先将它们序列化成一个简单的、更短的格式，甚至打包成二进制格式（例如 bson，而不是 json），以减少网络传输。

`Player` 对象包括用 `deque` 对象表示的蛇。这种数据类型和 `list` 相似，但是在两端增加和删除元素时效率更高，用它来表示蛇很理想。它的主要方法是 `Player.render_move()`，它返回移动玩家的蛇至下一个位置的渲染数据。一般来说它在新的位置渲染蛇的头部，移除上一帧中表示蛇的尾巴的元素。如果蛇吃了一个数字变长了，在相应的多个帧中尾巴是不需要移动的。蛇的渲染数据在主类的 `Game.next_frame()` 中使用，该方法中实现所有的游戏逻辑。这个方法渲染所有蛇的移动，检查每一个蛇前面的障碍物，而且生成数字和“石头”。每一个“嘀嗒”，`game_loop()` 都会直接调用它来生成下一帧。

如果蛇头前面有障碍物，在 `Game.next_frame()` 中会调用 `Game.game_over()`。它后通知所有的客户端那个蛇死掉了 （会调用 `player.render_game_over()` 方法将其变成石头），然后更新表中的分数排行榜。`Player` 对象的 `alive` 标记被置为 `False`，当渲染下一帧时，这个玩家会被跳过，除非他重新加入游戏。当没有蛇存活时，游戏区域会显示 “game over” （游戏结束）。而且，主游戏循环会停止，设置 `game.running` 标记为 `False`。当某个玩家下次按下 “Join” （加入）时，游戏区域会被清空。

在渲染游戏的每个下一帧时也会产生数字和石头，它们是由随机值决定的。产生数字或者石头的概率可以在 `settings.py` 中修改成其它值。注意数字的产生是针对游戏区域每一个活的蛇的，所以蛇越多，产生的数字就越多，这样它们都有足够的食物来吃掉。

#### 4.4 网络协议

从客户端发送消息的列表：

命令	    | 参数		|描述
:--         |:--          |:--
new_player  |	[name]	    |设置玩家的昵称
join		    |             |玩家加入游戏


从服务端发送消息的列表：

命令	    | 参数	                  |描述
:--         |:--                            |:--
handshake	  |[id]	                          |给一个玩家指定 ID
world	      |[[(char, color), ...], ...]	  |初始化游戏区域（世界地图）
reset_world	|	                              |清除实际地图，替换所有字符为空格
render	    |[x, y, char, color]	          |在某个位置显示字符
p_joined	  |[id, name, color, score]	      |新玩家加入游戏
p_gameover	|[id]	                          |某个玩家游戏结束
p_score	    |[id, score]	                  |给某个玩家计分
top_scores	|[[name, score, color], ...]	  |更新排行榜

典型的消息交换顺序：

客户端 -> 服务端	|服务端 -> 客户端     |服务端 -> 所有客户端	  |备注
:--               |:--                  |:--                       |:--
new_player			  |                     |                         |名字传递给服务端
                  |handshake		        |                         |指定 ID
                  |world		            |                         |初始化传递的世界地图
                  |top_scores		        |                         |收到传递的排行榜
join			        |                     |                         |玩家按下“Join”，游戏循环开始
                  |                     |reset_world	            |命令客户端清除游戏区域
                  |                     |render, render, ...	    |第一个游戏“滴答”，渲染第一帧
(key code)			  |                     |                         |玩家按下一个键
                  |                     |render, render, ...	    |渲染第二帧
                  |                     |p_score	                |蛇吃掉了一个数字
                  |                     |render, render, ...	    |渲染第三帧
                  |                     |                         |... 重复若干帧 ...
                  |                     |p_gameover	              |试着吃掉障碍物时蛇死掉了
                  |                     |top_scores	              |更新排行榜（如果需要更新的话）

### 5. 总结

说实话，我十分享受 Python 最新的异步特性。新的语法做了改善，所以异步代码很容易阅读。可以明显看出哪些调用是非阻塞的，什么时候发生 greenthread 的切换。所以现在我可以宣称 Python 是异步编程的好工具。

SnakePit 在 7WebPages 团队中非常受欢迎。如果你在公司想休息一下，不要忘记给我们在 [Twitter][12] 或者 [Facebook][13] 留下反馈。

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/

作者：[Kyrylo Subbotin][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/
[1]: http://snakepit-game.com/
[2]: https://linux.cn/article-7784-1.html
[3]: https://linux.cn/article-7767-1.html
[4]: https://github.com/7WebPages/snakepit-game
[5]: https://github.com/7WebPages/snakepit-game
[6]: https://github.com/7WebPages/snakepit-game/blob/master/server.py
[7]: https://github.com/7WebPages/snakepit-game/blob/master/game.py
[8]: https://github.com/7WebPages/snakepit-game/blob/master/player.py
[9]: https://github.com/7WebPages/snakepit-game/blob/master/datatypes.py
[10]: https://github.com/7WebPages/snakepit-game/blob/master/settings.py
[11]: https://github.com/7WebPages/snakepit-game/blob/master/index.html
[12]: https://twitter.com/7WebPages
[13]: https://www.facebook.com/7WebPages/
