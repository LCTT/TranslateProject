如何向你的 Python 游戏中添加一个敌人
======

> 在本系列的第五部分，学习如何增加一个坏蛋与你的好人战斗。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/game-dogs-chess-play-lead.png?itok=NAuhav4Z)

在本系列的前几篇文章中（参见 [第一部分][1]、[第二部分][2]、[第三部分][3] 以及 [第四部分][4])，你已经学习了如何使用 Pygame 和 Python 在一个空白的视频游戏世界中生成一个可玩的角色。但没有恶棍，英雄又将如何？

如果你没有敌人，那将会是一个非常无聊的游戏。所以在此篇文章中，你将为你的游戏添加一个敌人并构建一个用于创建关卡的框架。

在对玩家妖精实现全部功能之前，就来实现一个敌人似乎就很奇怪。但你已经学到了很多东西，创造恶棍与与创造玩家妖精非常相似。所以放轻松，使用你已经掌握的知识，看看能挑起怎样一些麻烦。

针对本次训练，你能够从 [Open Game Art][5] 下载一些预创建的素材。此处是我使用的一些素材：

+ 印加花砖（LCTT 译注：游戏中使用的花砖贴图）
+ 一些侵略者
+ 妖精、角色、物体以及特效

### 创造敌方妖精

是的，不管你意识到与否，你其实已经知道如何去实现敌人。这个过程与创造一个玩家妖精非常相似：

  1. 创建一个类用于敌人生成
  2. 创建 `update` 方法使得敌人能够检测碰撞
  3. 创建 `move` 方法使得敌人能够四处游荡

从类入手。从概念上看，它与你的 `Player` 类大体相同。你设置一张或者一组图片，然后设置妖精的初始位置。

在继续下一步之前，确保你有一张你的敌人的图像，即使只是一张临时图像。将图像放在你的游戏项目的 `images` 目录（你放置你的玩家图像的相同目录）。

如果所有的活物都拥有动画，那么游戏看起来会好得多。为敌方妖精设置动画与为玩家妖精设置动画具有相同的方式。但现在，为了保持简单，我们使用一个没有动画的妖精。

在你代码 `objects` 节的顶部，使用以下代码创建一个叫做 `Enemy` 的类：

```
class Enemy(pygame.sprite.Sprite):
    '''
    生成一个敌人
    '''
    def __init__(self,x,y,img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
```

如果你想让你的敌人动起来，使用让你的玩家拥有动画的 [相同方式][4]。

### 生成一个敌人

你能够通过告诉类，妖精应使用哪张图像，应出现在世界上的什么地方，来生成不只一个敌人。这意味着，你能够使用相同的敌人类，在游戏世界的任意地方生成任意数量的敌方妖精。你需要做的仅仅是调用这个类，并告诉它应使用哪张图像，以及你期望生成点的 X 和 Y 坐标。

再次，这从原则上与生成一个玩家精灵相似。在你脚本的 `setup` 节添加如下代码：

```
enemy   = Enemy(20,200,'yeti.png')  # 生成敌人
enemy_list = pygame.sprite.Group()  # 创建敌人组
enemy_list.add(enemy)               # 将敌人加入敌人组
```

在示例代码中，X 坐标为 20，Y 坐标为 200。你可能需要根据你的敌方妖精的大小，来调整这些数字，但尽量生成在一个范围内，使得你的玩家妖精能够碰到它。`Yeti.png` 是用于敌人的图像。

接下来，将敌人组的所有敌人绘制在屏幕上。现在，你只有一个敌人，如果你想要更多你可以稍后添加。一但你将一个敌人加入敌人组，它就会在主循环中被绘制在屏幕上。中间这一行是你需要添加的新行：

```
    player_list.draw(world)
    enemy_list.draw(world)  # 刷新敌人
    pygame.display.flip()
```

启动你的游戏，你的敌人会出现在游戏世界中你选择的 X 和 Y 坐标处。

### 关卡一

你的游戏仍处在襁褓期，但你可能想要为它添加另一个关卡。为你的程序做好未来规划非常重要，因为随着你学会更多的编程技巧，你的程序也会随之成长。即使你现在仍没有一个完整的关卡，你也应该按照假设会有很多关卡来编程。

思考一下“关卡”是什么。你如何知道你是在游戏中的一个特定关卡中呢？

你可以把关卡想成一系列项目的集合。就像你刚刚创建的这个平台中，一个关卡，包含了平台、敌人放置、战利品等的一个特定排列。你可以创建一个类，用来在你的玩家附近创建关卡。最终，当你创建了一个以上的关卡，你就可以在你的玩家达到特定目标时，使用这个类生成下一个关卡。

将你写的用于生成敌人及其群组的代码，移动到一个每次生成新关卡时都会被调用的新函数中。你需要做一些修改，使得每次你创建新关卡时，你都能够创建一些敌人。

```
class Level():
    def bad(lvl,eloc):
        if lvl == 1:
            enemy = Enemy(eloc[0],eloc[1],'yeti.png') # 生成敌人
            enemy_list = pygame.sprite.Group() # 生成敌人组
            enemy_list.add(enemy)              # 将敌人加入敌人组
        if lvl == 2:
            print("Level " + str(lvl) )

        return enemy_list
```

`return` 语句确保了当你调用 `Level.bad` 方法时，你将会得到一个 `enemy_list` 变量包含了所有你定义的敌人。

因为你现在将创造敌人作为每个关卡的一部分，你的 `setup` 部分也需要做些更改。不同于创造一个敌人，取而代之的是你必须去定义敌人在那里生成，以及敌人属于哪个关卡。

```
eloc = []
eloc = [200,20]
enemy_list = Level.bad( 1, eloc )
```

再次运行游戏来确认你的关卡生成正确。与往常一样，你应该会看到你的玩家，并且能看到你在本章节中添加的敌人。

### 痛击敌人

一个敌人如果对玩家没有效果，那么它不太算得上是一个敌人。当玩家与敌人发生碰撞时，他们通常会对玩家造成伤害。

因为你可能想要去跟踪玩家的生命值，因此碰撞检测发生在 `Player` 类，而不是 `Enemy` 类中。当然如果你想，你也可以跟踪敌人的生命值。它们之间的逻辑与代码大体相似，现在，我们只需要跟踪玩家的生命值。

为了跟踪玩家的生命值，你必须为它确定一个变量。代码示例中的第一行是上下文提示，那么将第二行代码添加到你的 Player 类中：

```
        self.frame  = 0
        self.health = 10
```

在你 `Player` 类的 `update` 方法中，添加如下代码块：

```
        hit_list = pygame.sprite.spritecollide(self, enemy_list, False)
        for enemy in hit_list:
            self.health -= 1
            print(self.health)
```

这段代码使用 Pygame 的 `sprite.spritecollide` 方法，建立了一个碰撞检测器，称作 `enemy_hit`。每当它的父类妖精（生成检测器的玩家妖精）的碰撞区触碰到 `enemy_list` 中的任一妖精的碰撞区时，碰撞检测器都会发出一个信号。当这个信号被接收，`for` 循环就会被触发，同时扣除一点玩家生命值。

一旦这段代码出现在你 `Player` 类的 `update` 方法，并且 `update` 方法在你的主循环中被调用，Pygame 会在每个时钟滴答中检测一次碰撞。

### 移动敌人

如果你愿意，静止不动的敌人也可以很有用，比如能够对你的玩家造成伤害的尖刺和陷阱。但如果敌人能够四处徘徊，那么游戏将更富有挑战。

与玩家妖精不同，敌方妖精不是由玩家控制，因此它必须自动移动。

最终，你的游戏世界将会滚动。那么，如何在游戏世界自身滚动的情况下，使游戏世界中的敌人前后移动呢？

举个例子，你告诉你的敌方妖精向右移动 10 步，向左移动 10 步。但敌方妖精不会计数，因此你需要创建一个变量来跟踪你的敌人已经移动了多少步，并根据计数变量的值来向左或向右移动你的敌人。

首先，在你的 `Enemy` 类中创建计数变量。添加以下代码示例中的最后一行代码：

```
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.counter = 0 # 计数变量
```

然后，在你的 `Enemy` 类中创建一个 `move` 方法。使用 if-else 循环来创建一个所谓的死循环：

  * 如果计数在 0 到 100 之间，向右移动；
  * 如果计数在 100 到 200 之间，向左移动；
  * 如果计数大于 200，则将计数重置为 0。

死循环没有终点，因为循环判断条件永远为真，所以它将永远循环下去。在此情况下，计数器总是介于 0 到 100 或 100 到 200 之间，因此敌人会永远地从左向右再从右向左移动。

你用于敌人在每个方向上移动距离的具体值，取决于你的屏幕尺寸，更确切地说，取决于你的敌人移动的平台大小。从较小的值开始，依据习惯逐步提高数值。首先进行如下尝试：

```
    def move(self):
        '''
        敌人移动
        '''
        distance = 80
        speed = 8

        if self.counter >= 0 and self.counter <= distance:
            self.rect.x += speed
        elif self.counter >= distance and self.counter <= distance*2:
            self.rect.x -= speed
        else:
            self.counter = 0

        self.counter += 1
```

你可以根据需要调整距离和速度。

当你现在启动游戏，这段代码有效果吗？

当然不，你应该也知道原因。你必须在主循环中调用 `move` 方法。如下示例代码中的第一行是上下文提示，那么添加最后两行代码：

```
    enemy_list.draw(world) #refresh enemy
    for e in enemy_list:
        e.move()
```

启动你的游戏看看当你打击敌人时发生了什么。你可能需要调整妖精的生成地点，使得你的玩家和敌人能够碰撞。当他们发生碰撞时，查看 [IDLE][6] 或 [Ninja-IDE][7] 的控制台，你可以看到生命值正在被扣除。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/yeti.png?itok=4_GsDGor)

你应该已经注意到，在你的玩家和敌人接触时，生命值在时刻被扣除。这是一个问题，但你将在对 Python 进行更多练习以后解决它。

现在，尝试添加更多敌人。记得将每个敌人加入 `enemy_list`。作为一个练习，看看你能否想到如何改变不同敌方妖精的移动距离。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/pygame-enemy

作者：[Seth Kenlon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]:https://linux.cn/article-9071-1.html
[2]:https://linux.cn/article-10850-1.html
[3]:https://linux.cn/article-10858-1.html
[4]:https://linux.cn/article-10874-1.html
[5]:https://opengameart.org
[6]:https://docs.python.org/3/library/idle.html
[7]:http://ninja-ide.org/
