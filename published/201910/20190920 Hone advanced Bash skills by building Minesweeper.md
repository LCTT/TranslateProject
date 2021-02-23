[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11430-1.html)
[#]: subject: (Hone advanced Bash skills by building Minesweeper)
[#]: via: (https://opensource.com/article/19/9/advanced-bash-building-minesweeper)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

通过编写扫雷游戏提高你的 Bash 技巧
======

> 那些令人怀念的经典游戏可是提高编程能力的好素材。今天就让我们仔细探索一番，怎么用 Bash 编写一个扫雷程序。

![bash logo on green background][1]

我在编程教学方面不是专家，但当我想更好掌握某一样东西时，会试着找出让自己乐在其中的方法。比方说，当我想在 shell 编程方面更进一步时，我决定用 Bash 编写一个[扫雷][2]游戏来加以练习。

如果你是一个有经验的 Bash 程序员，希望在提高技巧的同时乐在其中，那么请跟着我编写一个你的运行在终端中的扫雷游戏。完整代码可以在这个 [GitHub 存储库][3]中找到。

### 做好准备

在我编写任何代码之前，我列出了该游戏所必须的几个部分：

1. 显示雷区
2. 创建游戏逻辑
3. 创建判断单元格是否可选的逻辑
4. 记录可用和已查明（已排雷）单元格的个数
5. 创建游戏结束逻辑

### 显示雷区

在扫雷中，游戏界面是一个由 2D 数组（列和行）组成的不透明小方格。每一格下都有可能藏有地雷。玩家的任务就是找到那些不含雷的方格，并且在这一过程中，不能点到地雷。这个 Bash 版本的扫雷使用 10x10 的矩阵，实际逻辑则由一个简单的 Bash 数组来完成。

首先，我先生成了一些随机数字。这将是地雷在雷区里的位置。控制地雷的数量，在开始编写代码之前，这么做会容易一些。实现这一功能的逻辑可以更好，但我这么做，是为了让游戏实现保持简洁，并有改进空间。（我编写这个游戏纯属娱乐，但如果你能将它修改的更好，我也是很乐意的。）

下面这些变量在整个过程中是不变的，声明它们是为了随机生成数字。就像下面的 `a` - `g` 的变量，它们会被用来计算可排除的地雷的值：

```
# 变量
score=0 # 会用来存放游戏分数
# 下面这些变量，用来随机生成可排除地雷的实际值
a="1 10 -10 -1"
b="-1 0 1"
c="0 1"
d="-1 0 1 -2 -3"
e="1 2 20 21 10 0 -10 -20 -23 -2 -1"
f="1 2 3 35 30 20 22 10 0 -10 -20 -25 -30 -35 -3 -2 -1"
g="1 4 6 9 10 15 20 25 30 -30 -24 -11 -10 -9 -8 -7"
#
# 声明
declare -a room  # 声明一个 room 数组，它用来表示雷区的每一格。
```

接下来，我会用列（0-9）和行（a-j）显示出游戏界面，并且使用一个 10x10 矩阵作为雷区。（`M[10][10]` 是一个索引从 0-99，有 100 个值的数组。） 如想了解更多关于 Bash 数组的内容，请阅读这本书[那些关于 Bash 你所不了解的事: Bash 数组简介][4]。


创建一个叫 `plough` 的函数，我们先将标题显示出来：两个空行、列头，和一行 `-`，以示意往下是游戏界面: 

```
printf '\n\n'
printf '%s' "     a   b   c   d   e   f   g   h   i   j"
printf '\n   %s\n' "-----------------------------------------"
```

然后，我初始化一个计数器变量，叫 `r`，它会用来记录已显示多少横行。注意，稍后在游戏代码中，我们会用同一个变量 `r`，作为我们的数组索引。 在 [Bash for 循环][5]中，用 `seq` 命令从 0 增加到 9。我用数字（`d%`）占位，来显示行号（`$row`，由 `seq` 定义）： 


```
r=0 # 计数器
for row in $(seq 0 9); do
  printf '%d  ' "$row" # 显示 行数 0-9 
```

在我们接着往下做之前，让我们看看到现在都做了什么。我们先横着显示 `[a-j]` 然后再将 `[0-9]` 的行号显示出来，我们会用这两个范围，来确定用户排雷的确切位置。 

接着，在每行中，插入列，所以是时候写一个新的 `for` 循环了。这一循环管理着每一列，也就是说，实际上是生成游戏界面的每一格。我添加了一些辅助函数，你能在源码中看到它的完整实现。 对每一格来说，我们需要一些让它看起来像地雷的东西，所以我们先用一个点（`.`）来初始化空格。为了实现这一想法，我们用的是一个叫 [`is_null_field`][6] 的自定义函数。 同时，我们需要一个存储每一格具体值的数组，这儿会用到之前已定义的全局数组 [`room`][7] , 并用 [变量 `r`][8]作为索引。随着 `r` 的增加，遍历所有单元格，并随机部署地雷。

```
  for col in $(seq 0 9); do
    ((r+=1))  # 循环完一列行数加一
    is_null_field $r  #  假设这里有个函数，它会检查单元格是否为空，为真，则此单元格初始值为点（.）
    printf '%s \e[33m%s\e[0m ' "|" "${room[$r]}" #  最后显示分隔符，注意，${room[$r]} 的第一个值为 '.'，等于其初始值。
  #结束 col 循环
  done
```

最后，为了保持游戏界面整齐好看，我会在每行用一个竖线作为结尾，并在最后结束行循环：

```
printf '%s\n' "|"   # 显示出行分隔符
printf '   %s\n' "-----------------------------------------"
# 结束行循环
done
printf '\n\n'
```

完整的 `plough` 代码如下：

```
plough()
{
  r=0
  printf '\n\n'
  printf '%s' "     a   b   c   d   e   f   g   h   i   j"
  printf '\n   %s\n' "-----------------------------------------"
  for row in $(seq 0 9); do
    printf '%d  ' "$row"
    for col in $(seq 0 9); do
       ((r+=1))
       is_null_field $r
       printf '%s \e[33m%s\e[0m ' "|" "${room[$r]}"
    done
    printf '%s\n' "|"
    printf '   %s\n' "-----------------------------------------"
  done
  printf '\n\n'
}
```

我花了点时间来思考，`is_null_field` 的具体功能是什么。让我们来看看，它到底能做些什么。在最开始，我们需要游戏有一个固定的状态。你可以随便选择个初始值，可以是一个数字或者任意字符。我最后决定，所有单元格的初始值为一个点（`.`），因为我觉得，这样会让游戏界面更好看。下面就是这一函数的完整代码：

```
is_null_field()
{
  local e=$1 # 在数组 room 中，我们已经用过循环变量 'r' 了，这次我们用 'e'
    if [[ -z "${room[$e]}" ]];then
      room[$r]="."  #这里用点（.）来初始化每一个单元格
    fi
}
```

现在，我已经初始化了所有的格子，现在只要用一个很简单的函数就能得出当前游戏中还有多少单元格可以操作：

```
get_free_fields()
{
  free_fields=0    # 初始化变量 
  for n in $(seq 1 ${#room[@]}); do
    if [[ "${room[$n]}" = "." ]]; then  # 检查当前单元格是否等于初始值（.），结果为真，则记为空余格子。 
      ((free_fields+=1))
    fi
  done
}
```

这是显示出来的游戏界面，`[a-j]` 为列，`[0-9]` 为行。

![Minefield][9]

### 创建玩家逻辑

玩家操作背后的逻辑在于，先从 [stdin][10] 中读取数据作为坐标，然后再找出对应位置实际包含的值。这里用到了 Bash 的[参数扩展][11]，来设法得到行列数。然后将代表列数的字母传给分支语句，从而得到其对应的列数。为了更好地理解这一过程，可以看看下面这段代码中，变量 `o` 所对应的值。 举个例子，玩家输入了 `c3`，这时 Bash 将其分成两个字符：`c` 和 `3`。为了简单起见，我跳过了如何处理无效输入的部分。

```
  colm=${opt:0:1}  # 得到第一个字符，一个字母
  ro=${opt:1:1}    # 得到第二个字符，一个整数
  case $colm in
    a ) o=1;;      # 最后，通过字母得到对应列数。
    b ) o=2;;
    c ) o=3;;
    d ) o=4;;
    e ) o=5;;
    f ) o=6;;
    g ) o=7;;
    h ) o=8;;
    i ) o=9;;
    j ) o=10;;
  esac
```

下面的代码会计算用户所选单元格实际对应的数字，然后将结果储存在变量中。

这里也用到了很多的 `shuf` 命令，`shuf` 是一个专门用来生成随机序列的 [Linux 命令][12]。`-i` 选项后面需要提供需要打乱的数或者范围，`-n` 选项则规定输出结果最多需要返回几个值。Bash 中，可以在两个圆括号内进行[数学计算][13]，这里我们会多次用到。

还是沿用之前的例子，玩家输入了 `c3`。 接着，它被转化成了 `ro=3` 和 `o=3`。 之后，通过上面的分支语句代码， 将 `c` 转化为对应的整数，带进公式，以得到最终结果 `i` 的值。   

```
  i=$(((ro*10)+o))   # 遵循运算规则，算出最终值
  is_free_field $i $(shuf -i 0-5 -n 1)   #  调用自定义函数，判断其指向空/可选择单元格。
```

仔细观察这个计算过程，看看最终结果 `i` 是如何计算出来的：

```
i=$(((ro*10)+o))
i=$(((3*10)+3))=$((30+3))=33
```

最后结果是 33。在我们的游戏界面显示出来，玩家输入坐标指向了第 33 个单元格，也就是在第 3 行（从 0 开始，否则这里变成 4），第 3 列。

### 创建判断单元格是否可选的逻辑

为了找到地雷，在将坐标转化，并找到实际位置之后，程序会检查这一单元格是否可选。如不可选，程序会显示一条警告信息，并要求玩家重新输入坐标。

在这段代码中，单元格是否可选，是由数组里对应的值是否为点（`.`）决定的。如果可选，则重置单元格对应的值，并更新分数。反之，因为其对应值不为点，则设置变量 `not_allowed`。为简单起见，游戏中[警告消息][14]这部分源码，我会留给读者们自己去探索。

```
is_free_field()
{
  local f=$1
  local val=$2
  not_allowed=0
  if [[ "${room[$f]}" = "." ]]; then
    room[$f]=$val
    score=$((score+val))
  else
    not_allowed=1
  fi
}
```

![Extracting mines][15]
 
如输入坐标有效，且对应位置为地雷，如下图所示。玩家输入 `h6`，游戏界面会出现一些随机生成的值。在发现地雷后，这些值会被加入用户得分。

![Extracting mines][16]

还记得我们开头定义的变量，`a` - `g` 吗，我会用它们来确定随机生成地雷的具体值。所以，根据玩家输入坐标，程序会根据（`m`）中随机生成的数，来生成周围其他单元格的值（如上图所示）。之后将所有值和初始输入坐标相加，最后结果放在 `i`（计算结果如上）中。

请注意下面代码中的 `X`，它是我们唯一的游戏结束标志。我们将它添加到随机列表中。在 `shuf` 命令的魔力下，`X` 可以在任意情况下出现，但如果你足够幸运的话，也可能一直不会出现。

```
m=$(shuf -e a b c d e f g X -n 1)   # 将 X 添加到随机列表中，当 m=X，游戏结束
  if [[ "$m" != "X" ]]; then        # X 将会是我们爆炸地雷（游戏结束）的触发标志
    for limit in ${!m}; do          # !m 代表 m 变量的值
      field=$(shuf -i 0-5 -n 1)     # 然后再次获得一个随机数字
      index=$((i+limit))            # 将 m 中的每一个值和 index 加起来，直到列表结尾
      is_free_field $index $field
    done
```

我想要游戏界面中，所有随机显示出来的单元格，都靠近玩家选择的单元格。

![Extracting mines][17]

### 记录已选择和可用单元格的个数

这个程序需要记录游戏界面中哪些单元格是可选择的。否则，程序会一直让用户输入数据，即使所有单元格都被选中过。为了实现这一功能，我创建了一个叫 `free_fields` 的变量，初始值为 `0`。用一个 `for`  循环，记录下游戏界面中可选择单元格的数量。 如果单元格所对应的值为点（`.`），则 `free_fields` 加一。

```
get_free_fields()
{
  free_fields=0
  for n in $(seq 1 ${#room[@]}); do
    if [[ "${room[$n]}" = "." ]]; then
      ((free_fields+=1))
    fi
  done
}
```

等下，如果 `free_fields=0` 呢？ 这意味着，玩家已选择过所有单元格。如果想更好理解这一部分，可以看看这里的[源代码][18]。

```
if [[ $free_fields -eq 0 ]]; then   # 这意味着你已选择过所有格子
      printf '\n\n\t%s: %s %d\n\n' "You Win" "you scored" "$score"
      exit 0
fi
```

### 创建游戏结束逻辑

对于游戏结束这种情况，我们这里使用了一些很[巧妙的技巧][19]，将结果在屏幕中央显示出来。我把这部分留给读者朋友们自己去探索。

```
if [[ "$m" = "X" ]]; then
    g=0                      # 为了在参数扩展中使用它
    room[$i]=X               # 覆盖此位置原有的值，并将其赋值为X
    for j in {42..49}; do    # 在游戏界面中央，
      out="gameover"
      k=${out:$g:1}          # 在每一格中显示一个字母
      room[$j]=${k^^}
      ((g+=1))
    done
fi
```

最后，我们显示出玩家最关心的两行。

```
if [[ "$m" = "X" ]]; then
      printf '\n\n\t%s: %s %d\n' "GAMEOVER" "you scored" "$score"
      printf '\n\n\t%s\n\n' "You were just $free_fields mines away."
      exit 0
fi
```

![Minecraft Gameover][20]

文章到这里就结束了，朋友们！如果你想了解更多，具体可以查看我的 [GitHub 存储库][3]，那儿有这个扫雷游戏的源代码，并且你还能找到更多用 Bash 编写的游戏。 我希望，这篇文章能激起你学习 Bash 的兴趣，并乐在其中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/advanced-bash-building-minesweeper

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://en.wikipedia.org/wiki/Minesweeper_(video_game)
[3]: https://github.com/abhiTamrakar/playground/tree/master/bash_games
[4]: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
[5]: https://opensource.com/article/19/6/how-write-loop-bash
[6]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L114-L120
[7]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L41
[8]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L74
[9]: https://opensource.com/sites/default/files/uploads/minefield.png (Minefield)
[10]: https://en.wikipedia.org/wiki/Standard_streams#Standard_input_(stdin)
[11]: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
[12]: https://linux.die.net/man/1/shuf
[13]: https://www.tldp.org/LDP/abs/html/dblparens.html
[14]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L143-L177
[15]: https://opensource.com/sites/default/files/uploads/extractmines.png (Extracting mines)
[16]: https://opensource.com/sites/default/files/uploads/extractmines2.png (Extracting mines)
[17]: https://opensource.com/sites/default/files/uploads/extractmines3.png (Extracting mines)
[18]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L91
[19]: https://github.com/abhiTamrakar/playground/blob/28143053ced699c80569666f25268e8b96c38c46/bash_games/minesweeper.sh#L131-L141
[20]: https://opensource.com/sites/default/files/uploads/gameover.png (Minecraft Gameover)
