[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn object-oriented programming with Python)
[#]: via: (https://opensource.com/article/19/7/get-modular-python-classes)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Python 学习面对对象的编程
======
使用 Python 类使你的代码变得更加模块化。
![Developing code.][1]

在我上一篇文章中，我解释了如何通过使用函数、创建模块或者两者一起来[使 Python 代码更加模块化][2]。函数对于避免重复多次使用的代码非常有用，而模块可以确保你在不同的项目中复用代码。但是模块化还有另一种方法：类。

如果你已经听过 _面对对象编程_ 这个术语，那么你可能会对类的用途有一些概念。程序员倾向于将类视为一个虚拟对象，有时与物理世界中的某些东西直接相关，有时则作为某种编程概念的表现形式。无论哪种表示，当你想要在程序中为你或程序的其他部分创建“对象”时，你都可以创建一个类来交互。

### 没有类的模板

假设你正在编写一个以幻想世界为背景的游戏，并且你需要这个应用程序能够涌现出各种坏蛋来给玩家的生活带来一些刺激。了解了很多关于函数的知识后，你可能会认为这听起来像是函数的一个教科书案例：需要经常重复的代码，但是在调用时可以考虑变量而只编写一次。

下面一个纯粹基于函数的敌人生成器实现的例子：

```
#!/usr/bin/env python3

import random

def enemy(ancestry,gear):
    enemy=ancestry
    weapon=gear
    hp=random.randrange(0,20)
    ac=random.randrange(0,20)
    return [enemy,weapon,hp,ac]

def fight(tgt):
    print("You take a swing at the " + tgt[0] + ".")
    hit=random.randrange(0,20)
    if hit &gt; tgt[3]:
        print("You hit the " + tgt[0] + " for " + str(hit) + " damage!")
        tgt[2] = tgt[2] - hit
    else:
        print("You missed.")

foe=enemy("troll","great axe")
print("You meet a " + foe[0] + " wielding a " + foe[1])
print("Type the a key and then RETURN to attack.")

while True:
    action=input()

    if action.lower() == "a":
        fight(foe)

    if foe[2] &lt; 1:
        print("You killed your foe!")
    else:
        print("The " + foe[0] + " has " + str(foe[2]) + " HP remaining")
```

**enemy** 函数创造了一个具有多个属性的敌人，例如祖先、武器、生命值和防御等级。它返回每个属性的列表，表示敌人全部特征。

从某种意义上说，这段代码创建了一个对象，即使它还没有使用类。程序员将这个 "enemy" 称为 _对象_，因为该函数的结果（本例中是一个包含字符串和整数的列表）表示游戏中一个单独但复杂的 _东西_。也就是说，列表中字符串和整数不是任意的：它们一起描述了一个虚拟对象。

在编写描述符集合时，你可以使用变量，以便随时使用它们来生成敌人。这有点像模板。

在示例代码中，当需要对象的属性时，会检索相应的列表项。例如，要获取敌人的祖先，代码会查询 **foe[0]**，对于生命值，会查询 **foe[2]**，以此类推。

这种方法没有什么不妥，代码按预期运行。你可以添加更多不同类型的敌人，创建一个敌人类型列表，并在敌人创建期间从列表中随机选择，等等，它工作得很好。实际上，[Lua][3] 非常有效地利用这个原理来近似面对对象模型。

然而，有时候对象不仅仅是属性列表。

### 使用对象

在 Python 中，一切都是对象。你在 Python 中创建的任何东西都是某个预定义模板的 _实例_。甚至基本的字符串和整数都是 Python **type** 类的衍生物。你可以在这个交互式 Python shell 中见证：

```
&gt;&gt;&gt; foo=3
&gt;&gt;&gt; type(foo)
&lt;class 'int'&gt;
&gt;&gt;&gt; foo="bar"
&gt;&gt;&gt; type(foo)
&lt;class 'str'&gt;
```

当一个对象由一个类定义时，它不仅仅是一个属性的集合，Python 类具有各自的函数。从逻辑上讲，这很方便，因为只涉及某个对象类的操作包含在该对象的类中。

在示例代码中，fight 代码是主应用程序的功能。这对于一个简单的游戏来说是可行的，但对于一个复杂的游戏来说，世界中不仅仅有玩家和敌人，还可能有城镇居民、牲畜、建筑物、森林等等，他们都不需要使用战斗功能。将战斗代码放在敌人的类中意味着你的代码更有条理，在一个复杂的应用程序中，这是一个重要的优势。

此外，每个类都有特权访问自己的本地变量。例如，敌人的生命值，除了某些功能之外，是不会改变的数据。游戏中的随机蝴蝶不应该意外地将敌人的生命值降低到 0。理想情况下，即使没有类，也不会发生这种情况。但是在具有大量活动部件的复杂应用程序中，确保不需要相互交互的部件永远不会发生这种情况，这是一个非常有用的技巧。

Python 类也受垃圾收集的影响。当不再使用类的实例时，它将被移出内存。你可能永远不知道这种情况会什么时候发生，但是你往往知道什么时候它不会发生，因为你的应用程序占用了更多的内存，而且运行速度比较慢。将数据集隔离到类中可以帮助 Python 跟踪哪些数据正在使用，哪些不在需要了。

### 优雅的 Python

下面是一个同样简单的战斗游戏，使用了 Enemy 类：

```
#!/usr/bin/env python3

import random

class Enemy():
    def __init__(self,ancestry,gear):
        self.enemy=ancestry
        self.weapon=gear
        self.hp=random.randrange(10,20)
        self.ac=random.randrange(12,20)
        self.alive=True

    def fight(self,tgt):
        print("You take a swing at the " + self.enemy + ".")
        hit=random.randrange(0,20)

        if self.alive and hit &gt; self.ac:
            print("You hit the " + self.enemy + " for " + str(hit) + " damage!")
            self.hp = self.hp - hit
            print("The " + self.enemy + " has " + str(self.hp) + " HP remaining")
        else:
            print("You missed.")

        if self.hp &lt; 1:
            self.alive=False

# 游戏开始
foe=Enemy("troll","great axe")
print("You meet a " + foe.enemy + " wielding a " + foe.weapon)

# 主函数循环
while True:
   
    print("Type the a key and then RETURN to attack.")
       
    action=input()

    if action.lower() == "a":
        foe.fight(foe)
               
    if foe.alive == False:
        print("You have won...this time.")
        exit()
```

这个版本的游戏将敌人作为一个包含相同属性（祖先，武器，生命值和防御）的对象来处理，并添加一个新的属性来衡量敌人时候已被击败，以及一个战斗功能。

类的第一个函数是一个特殊的函数，在 Python 中称为 \_init\_ 或初始化函数。这类似于其他语言中的[构造器][4]，它创建了类的一个实例，你可以通过它的属性和调用类时使用的任何变量来识别它（示例代码中的 **foe**）。

### Self 和类实例

类的函数接受一种你在类之外看不到的新形式的输入：**self**。如果不包含 **self**，那么当你调用类函数时，Python 无法知道要使用的类的 _哪个_ 实例。这就像在一间充满兽人的房间里说：“我要和兽人战斗”，向一个兽人发起。没有人知道你指的是谁，所以坏事就发生了。

![Image of an Orc, CC-BY-SA by Buch on opengameart.org][5]

CC-BY-SA by Buch on opengameart.org

类中创建的每个属性都以 **self** 符号作为前缀，该符号将变量标识为类的属性。一旦派生出类的实例，就用表示该实例的变量替换掉 **self** 前缀。使用这个技巧，你可以在一间满是兽人的房间里说：“我要和祖先是 orc 的兽人战斗”，这样来挑战一个兽人。当 orc 听到 "gorblar.orc" 时，它就知道你指的是谁（他自己），所以你得到是一场公平的战斗而不是争吵。在 Python 中：

```
gorblar=Enemy("orc","sword")
print("The " + gorblar.enemy + " has " + str(gorblar.hp) + " remaining.")
```

通过检索类属性而不是查询 **foe[0]**（在函数示例中）或 **gorblar[0]** 来寻找敌人（**gorblar.enemy** 或 **gorblar.hp** 或你需要的任何对象的任何值）。

### 本地变量

如果类中的变量没有以 **self** 关键字作为前缀，那么它就是一个局部变量，就像在函数中一样。例如，无论你做什么，你都无法访问 **Enemy.fight** 类之外的 **hit** 变量：

```
&gt;&gt;&gt; print(foe.hit)
Traceback (most recent call last):
  File "./enclass.py", line 38, in &lt;module&gt;
    print(foe.hit)
AttributeError: 'Enemy' object has no attribute 'hit'

&gt;&gt;&gt; print(foe.fight.hit)
Traceback (most recent call last):
  File "./enclass.py", line 38, in &lt;module&gt;
    print(foe.fight.hit)
AttributeError: 'function' object has no attribute 'hit'
```

**hi** 变量包含在 Enemy 类中，并且只能“存活”到在战斗种发挥作用。

### 更模块化

本例使用与主应用程序相同的文本文档中的类。在一个复杂的游戏中，我们更容易将每个类看作是自己独立的应用程序。当多个开发人员处理同一个应用程序时，你会看到这一点：一个开发人员处理一个类，另一个开发主程序，只要他们彼此沟通这个类必须具有什么属性，就可以并行地开发这两个代码块。

要使这个示例游戏模块化，可以把它拆分为两个文件：一个用于主应用程序，另一个用于类。如果它是一个更复杂的应用程序，你可能每个类都有一个文件，或每个逻辑类组有一个文件（例如，用于建筑物的文件，用于自然环境的文件，用于敌人或 NPC 的文件等）。
 
将只包含 Enemy 类的一个文件保存为 **enemy.py**，将另一个包含其他内容的文件保存为 **main.py**。

以下是 **enemy.py**：

```
import random

class Enemy():
    def __init__(self,ancestry,gear):
        self.enemy=ancestry
        self.weapon=gear
        self.hp=random.randrange(10,20)
        self.stg=random.randrange(0,20)
        self.ac=random.randrange(0,20)
        self.alive=True

    def fight(self,tgt):
        print("You take a swing at the " + self.enemy + ".")
        hit=random.randrange(0,20)

        if self.alive and hit &gt; self.ac:
            print("You hit the " + self.enemy + " for " + str(hit) + " damage!")
            self.hp = self.hp - hit
            print("The " + self.enemy + " has " + str(self.hp) + " HP remaining")
        else:
            print("You missed.")

        if self.hp &lt; 1:
            self.alive=False
```

以下是 **main.py**：

```
#!/usr/bin/env python3

import enemy as en

# game start
foe=en.Enemy("troll","great axe")
print("You meet a " + foe.enemy + " wielding a " + foe.weapon)

# main loop
while True:
   
    print("Type the a key and then RETURN to attack.")

    action=input()

    if action.lower() == "a":
        foe.fight(foe)

    if foe.alive == False:
        print("You have won...this time.")
        exit()
```

导入模块 **enemy.py** 使用了一条特别的语句，将类文件名称作为引用而不是 **.py** 扩展名，后跟你选择的命名空间指示符（例如，**import enemy as en**）。这个指示符是在你调用类时在代码中使用的。你需要在导入时添加指定符，例如 **en.Enemy**，而不是只使用 **Enemy()**。 

所有这些文件名都是任意的，尽管在原则上并不罕见。将应用程序的中心命名为 **main.py** 是一个常见约定，和一个充满类的文件通常以小写形式命名，其中的类都以大写字母开头。是否遵循这些约定不会影响应用程序的运行方式，但它确实使经验丰富的 Python 程序员更容易快速理解应用程序的工作方式。

在如何构建代码方面有一些灵活性。例如，使用代码示例，两个文件必须位于同一目录中。如果你只想将类打包为模块，那么必须创建一个名为 **mybad** 的目录，并将你的类移入其中。在 **main.py** 中，你的 import 语句稍有变化：

```
from mybad import enemy as en
```

两种方法都会产生相同的结果，但如果你创建的类足够通用，你认为其他开发人员可以在他们的项目中使用它们，那么后者是更好的。

无论你选择哪种方式，都可以启动游戏的模块化版本：

```
$ python3 ./main.py
You meet a troll wielding a great axe
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You missed.
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You hit the troll for 8 damage!
The troll has 4 HP remaining
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You hit the troll for 11 damage!
The troll has -7 HP remaining
You have won...this time.
```

游戏启动了，它现在更加模块化了。现在你知道了面对对象的应用程序意味着什么，但最重要的是，当你向兽人发起决斗的时候，你要想清楚。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/get-modular-python-classes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
[2]: https://opensource.com/article/19/6/get-modular-python-functions
[3]: https://opensource.com/article/17/4/how-program-games-raspberry-pi
[4]: https://opensource.com/article/19/6/what-java-constructor
[5]: https://opensource.com/sites/default/files/images/orc-buch-opengameart_cc-by-sa.jpg (CC-BY-SA by Buch on opengameart.org)
