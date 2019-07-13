[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10507-1.html)
[#]: subject: (Get started with Roland, a random selection tool for the command line)
[#]: via: (https://opensource.com/article/19/1/productivity-tools-roland)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Roland 吧，一款命令行随机选择工具
======

> Roland 可以帮你做出艰难的决定，它是我们在开源工具系列中的第七个工具，将帮助你在 2019 年提高工作效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第七个工具来帮助你在 2019 年更有效率。

### Roland

当一周的工作结束后，我唯一想做的就是躺到沙发上打一个周末的游戏。但即使我的职业义务在工作日结束后停止了，但我仍然需要管理我的家庭。洗衣、宠物护理、确保我孩子有他所需要的东西，以及最重要的是：决定晚餐吃什么。

像许多人一样，我经常受到[决策疲劳][1]的困扰，根据速度、准备难易程度以及（坦白地说）任何让我压力最小的方式都会导致不太健康的晚餐选择。

![](https://opensource.com/sites/default/files/uploads/roland-1.png)

[Roland][2] 让我计划饭菜变得容易。Roland 是一款专为桌面角色扮演游戏设计的 Perl 应用。它从怪物和雇佣者等项目列表中随机挑选。从本质上讲，Roland 在命令行做的事情就像游戏管理员在桌子上掷骰子，以便在《要对玩家做的坏事全书》中找个东西一样。

通过微小的修改，Roland 可以做得更多。例如，只需添加一张表，我就可以让 Roland 帮我选择晚餐。

第一步是安装 Roland 及其依赖项。

```
git clone git@github.com:rjbs/Roland.git
cpan install Getopt::Long::Descriptive Moose \
   namespace::autoclean List:AllUtils Games::Dice \
   Sort::ByExample Data::Bucketeer Text::Autoformat \
   YAML::XS
cd oland
```

接下来，创建一个名为 `dinner` 的 YAML 文档，并输入我们所有的用餐选项。

```
type: list
pick: 1
items:
  - "frozen pizza"
  - "chipotle black beans"
  - "huevos rancheros"
  - "nachos"
  - "pork roast"
  - "15 bean soup"
  - "roast chicken"
  - "pot roast"
  - "grilled cheese sandwiches"
```

运行命令 `bin/roland dinner` 将读取文件并选择其中一项。

![](https://opensource.com/sites/default/files/uploads/roland-2.png)

我想提前计划一周，这样我可以提前购买所有食材。 `pick` 命令确定列表中要选择的物品数量，现在，`pick` 设置为 1。如果我想计划一周的晚餐菜单，我可以将 `pick: 1` 变成 `pick: 7`，它会提供一周的菜单。你还可以使用 `-m` 选项手动输入选择。

![](https://opensource.com/sites/default/files/uploads/roland-3.png)

你也可以用 Roland 做些有趣的事情，比如用经典短语添加一个名为 `8ball` 的文件。

![](https://opensource.com/sites/default/files/uploads/roland-4.png)

你可以创建各种文件来帮助做出长时间工作后看起来非常难做的常见决策。即使你不用来做这个，你仍然可以用它来为今晚的游戏设置哪个狡猾的陷阱做个决定。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tools-roland

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Decision_fatigue
[2]: https://github.com/rjbs/Roland
