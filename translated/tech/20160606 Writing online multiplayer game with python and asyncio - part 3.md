使用 Python 和 asyncio 来编写在线多人游戏 - 第3部分
=================================================================

![](https://7webpages.com/media/cache/17/81/178135a6db5074c72a1394d31774c658.gif)

在这个系列中，我们基于多人游戏 [贪吃蛇][1] 来制作一个异步的 Python 程序。前一篇文章聚焦于[编写游戏循环][2]上，而本系列第1部分涵盖了 [异步化][3]。

代码戳[这里][4]

### 4. 制作一个完成的游戏

![](https://7webpages.com/static/img/14chs7.gif)

#### 4.1 工程概览
#### 4.1 Project's overview

在此部分，我们将回顾一个完整在线游戏的设计。这是一个经典的贪吃蛇游戏，增加了多玩家支持。你可以自己在 (<http://snakepit-game.com>) 亲自试玩。源码在 Github的这个[仓库][5]。游戏包括下列文件：

- [server.py][6] - 处理主游戏循环和连接服务器。
- [game.py][7] - 主要 `Game` 类。实现游戏的逻辑和游戏的大部分通信协议。
- [player.py][8] - `Player` 类，包括每一个独立玩家的数据和蛇的表示。这个类负责获取玩家的输入以及根据输入相应地移动蛇。
- [datatypes.py][9] - 基本数据结构。
- [settings.py][10] - 游戏设置，在注释中有相关的说明。
- [index.html][11] - 一个文件中包括客户端所有的 html 和 javascript代码。

#### 4.2 游戏循环内窥

多人的贪吃蛇游戏是个十分好的例子，因为它简单。所有的蛇在每个帧中移动到一个位置，而且帧之间的变化频率较低，这样你就可以一探一个游戏引擎到底是如何工作的。因为速度慢，对于玩家的按键不会立马响应。按键先是记录下来，然后在一个游戏迭代的最后计算下一帧时使用。

> 现代的动作游戏帧频率更高，而且服务端和客户端的帧频率不相等。客户端的帧频率通常依赖于客户端的硬件性能，而服务端的帧频率是固定的。一个客户端可能根据一个游戏嘀嗒的数据渲染多个帧。这样就可以创建平滑的动画，这个受限于客户端的性能。在这个例子中，服务器不仅传输物体的当前位置，也要传输他们的移动方向，速度和加速度。客户端的帧频率称之为 FPS(frames per second)，服务端的帧频率称之为 TPS(ticks per second)。在这个贪吃蛇游戏的例子中，二者的值是相等的，客户端帧的展现和服务端的嘀嗒是同步的。

我们使用文本模式一样的游戏区域，事实上是 html 表格中的一个字符宽的小格。游戏中的所有对象都是通过表格中的不同颜色字符来表示。大部分时候，客户端将按键码发送至服务器，然后每个 tick 更新游戏区域。服务端一次更新包括需要更新字符的坐标和颜色。所以我们将所有游戏逻辑放置在服务端，只将需要渲染的数据发送给客户端。此外，我们通过替换网络上发送的数据来最小化游戏被破解的概率。

#### 4.3 它是如何运行的？

这个游戏中的服务端出于简化的目的，它和例子 3.2 类似。但是我们用一个所有服务器都可访问的 Game 对象来代替之前保存所有已连接 websocket 的全局列表。一个 Game 实例包括玩家的列表 (self._players)，表示连接到此游戏的玩家，他们的个人数据和 websocket 对象。将所有游戏相关的数据存储在一个 Game 对象中，会方便我们增加多个游戏房间这个功能。这样的话，我们只要维护多个 Game 对象，每个游戏开始时创建相应的 Game 对象。

客户端和服务端的所有交互都是通过编码成 json 的消息来完成。来自客户端的消息仅包含玩家所按下键对应的编码。其它来自客户端消息使用如下格式：

```
[command, arg1, arg2, ... argN ]
```

来自服务端的消息以列表的形式发送，因为通常一次要发送多个消息 （大多数情况下是渲染的数据）：

```
[[command, arg1, arg2, ... argN ], ... ]
```

在每次游戏循环迭代的最后会计算下一帧，并且将数据发送给所有的客户端。当然，每次不是发送完整的帧，而是发送两帧之间的变化列表。

注意玩家连接上服务器后不是立马加入游戏。连接开始时是观望者 (spectator) 模式，玩家可以观察其它玩家如何玩游戏。如果游戏已经开始或者上一个游戏会话已经在屏幕上显示 "game over" (游戏结束)，用户此时可以按下 "Join" (参与)，加入一个已经存在的游戏或者如果游戏不在运行（没有其它玩家）则创建一个新的游戏。后一种情况，游戏区域在开始前会被先清空。

游戏区域存储在 `Game._field` 这个属性中，它是二维的嵌套列表，用于内部存储游戏区域的状态。数组中的每一个元素表示区域中的一个小格，最终小格会被渲染成 html 表格的格子。如果它的类型是 Char，它是一个 `namedtuple` ，包括一个字符和颜色。在所有连接的客户端之间保证游戏区域的同步很重要，所以所有游戏区域的更新都必须依据发送到客户端的相应的信息。这是通过 `Game.apply_render()` 来实现的。它接受一个 `Draw` 对象的列表，其用于内部更新游戏区域和发送渲染消息给客户端。

我们使用 `namedtuple` 不仅因为它表示简单数据结构很方便，也因为用它生成 json 格式的消息时相对于字典更省空间。如果你在一个真实的游戏循环中需要发送完整的数据结构，建议先将它们序列化成一个简单的，更短的格式，甚至打包成二进制格式(例如 bson，而不是 json)，以减少网络传输。

`ThePlayer` 对象包括用双端队列表示的蛇。这种数据类型和列表相似，但是在两端增加和删除元素时效率更高，用它来表示蛇很理想。它的主要方法是 `Player.render_move()`，它返回移动玩家蛇至下一个位置的渲染数据。一般来说它在新的位置渲染蛇的头部，移除上一帧中表示蛇的尾巴元素。如果蛇吃了一个数字，需要增长，在相应的多个帧中尾巴是不需要移动的。蛇的渲染数据在主要类的 `Game.next_frame()` 中使用，该方法中实现所有的游戏逻辑。这个方法渲染所有蛇的移动，检查每一个蛇前面的障碍物，而且生成数字和石头。每一个嘀嗒，`game_loop()` 都会直接调用它来生成下一帧。

如果蛇头前面有障碍物，在 `Game.next_frame()` 中会调用 `Game.game_over()`。所有的客户端都会收到那个蛇死掉的通知 (会调用 `player.render_game_over()` 方法将其变成石头)，然后更新表中的分数排行榜。`Player` 的存活标记被置为 `False`，当渲染下一帧时，这个玩家会被跳过，除非他重新加入游戏。当没有蛇存活时，游戏区域会显示 "game over" (游戏结束) 。而且，主游戏循环会停止，设置 `game.running` 标记为 `False`。当某个玩家下次按下 "Join" (加入) 时，游戏区域会被清空。

在渲染游戏的每个下一帧时都会产生数字和石头，他们是由随机值决定的。产生数字或者石头的概率可以在 settings.py 中修改。注意数字是针对游戏区域每一个活的蛇产生的，所以蛇越多，产生的数字就越多，这样他们都有足够的食物来消费。

#### 4.4 网络协议
#### 4.4 Network protocol

从客户端发送消息的列表：

Command	    | Parameters	|Description
:--         |:--          |:--
new_player  |	[name]	    |Setting player's nickname
join		    |             |Player is joining the game


从服务端发送消息的列表

Command	    | Parameters	                  |Description
:--         |:--                            |:--
handshake	  |[id]	                          |Assign id to a player
world	      |[[(char, color), ...], ...]	  |Initial play field (world) map
reset_world	|	                              |Clean up world map, replacing all characters with spaces
render	    |[x, y, char, color]	          |Display character at position
p_joined	  |[id, name, color, score]	      |New player joined the game
p_gameover	|[id]	                          |Game ended for a player
p_score	    |[id, score]	                  |Setting score for a player
top_scores	|[[name, score, color], ...]	  |Update top scores table

典型的消息交换顺序

Client -> Server	|Server -> Client     |Server -> All clients	  |Commentaries
:--               |:--                  |:--                       |:--
new_player			  |                     |                         |Name passed to server
                  |handshake		        |                         |ID assigned
                  |world		            |                         |Initial world map passed
                  |top_scores		        |                         |Recent top scores table passed
join			        |                     |                         |Player pressed "Join", game loop started
                  |                     |reset_world	            |Command clients to clean up play field
                  |                     |render, render, ...	    |First game tick, first frame rendered
(key code)			  |                     |                         |Player pressed a key
                  |                     |render, render, ...	    |Second frame rendered
                  |                     |p_score	                |Snake has eaten a digit
                  |                     |render, render, ...	    |Third frame rendered
                  |                     |                         |... Repeat for a number of frames ...
                  |                     |p_gameover	              |Snake died when trying to eat an obstacle
                  |                     |top_scores	              |Updated top scores table (if updated)

### 5. 总结

说实话，我十分享受 Python 最新的异步特性。新的语法很友善，所以异步代码很容易阅读。可以明显看出哪些调用是非阻塞的，什么时候发生 greenthread 的切换。所以现在我可以宣称 Python 是异步编程的好工具。

SnakePit 在 7WebPages 团队中非常受欢迎。如果你在公司想休息一下，不要忘记给我们在 [Twitter][12] 或者 [Facebook][13] 留下反馈。

更多详见：

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/

作者：[Saheetha Shameer][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/
[1]: http://snakepit-game.com/
[2]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-writing-game-loop/
[3]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/
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
