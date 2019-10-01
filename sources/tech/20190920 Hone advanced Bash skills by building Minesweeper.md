[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hone advanced Bash skills by building Minesweeper)
[#]: via: (https://opensource.com/article/19/9/advanced-bash-building-minesweeper)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakarhttps://opensource.com/users/dnearyhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/marcobravo)

通过编写扫雷游戏提高你的bash技巧
======
那些令人怀念的经典游戏可是提高编程能力的好素材。今天就让我们仔细探索一番，怎么用Bash编写一个扫雷程序。
![bash logo on green background][1]

我在编程教学方面不是专家，但当我想更好掌握某一样东西时，会试着找出让自己乐在其中的方法。比方说，当我想在shell编程方面更进一步时，我决定用Bash编写一个[扫雷][2]游戏来加以练习。

如果你是一个有经验的Bash程序员，并且在提高技巧的同时乐在其中，你可以在终端中编写个人版本的扫雷。完整代码可以在这个 [GitHub 库]中找到[3].

### 做好准备

在我编写任何代码之前，我列出了游戏所必须的几个部分：

  1. 显示雷区
  2. 创建游戏逻辑
  3. 创建逻辑以确定有效雷区
  4. 记录当前还有多少个未被发现以及已标记的雷
  5. 创建游戏结束逻辑


### 显示雷区

In Minesweeper, the game world is a 2D array (columns and rows) of concealed cells. Each cell may or may not contain an explosive mine. The player's objective is to reveal cells that contain no mine, and to never reveal a mine. Bash version of the game uses a 10x10 matrix, implemented using simple bash arrays.

在扫雷中，游戏界面是一个由2D数组（列和行）组成的不透明小方格。每一格下都有可能藏有地雷。玩家的任务就是找到那些不含雷的方格，并且在这一过程中，不能点到地雷。Bash版本的扫雷使用10x10的矩阵，实际逻辑则由一个简单的Bash数组来完成。

First, I assign some random variables. These are the locations that mines could be placed on the board. By limiting the number of locations, it will be easy to build on top of this. The logic could be better, but I wanted to keep the game looking simple and a bit immature. (I wrote this for fun, but I would happily welcome your contributions to make it look better.)
首先，我先生成了一些随机数字。这将是地雷在雷区里的位置。为了控制地雷的数量，在开始编写代码之前，这么做会容易一些。实现这一功能的逻辑可以更好，但我这么做，是为了让游戏实现保持简洁，并有改进空间。（我编写这个游戏纯属娱乐，但如果你能将它修改的更好，我也是很乐意的。）

The variables below are some default variables, declared to call randomly for field placement, like the variables a-g, we will use them to calculate our extractable mines:
下面这些变量有一些是默认的，像


```
# 变量
score=0 # 会用来存放游戏分数
# variables below will be used to randomly get the extract-able cells/fields from our mine. 下面这些变量用来随机生成
a="1 10 -10 -1"
b="-1 0 1"
c="0 1"
d="-1 0 1 -2 -3"
e="1 2 20 21 10 0 -10 -20 -23 -2 -1"
f="1 2 3 35 30 20 22 10 0 -10 -20 -25 -30 -35 -3 -2 -1"
g="1 4 6 9 10 15 20 25 30 -30 -24 -11 -10 -9 -8 -7"
#
# 声明
declare -a room  # 声明一个room 数组，它用来表示雷区的每一格。
```

接下来，我会用列（0-9）和行（a-j）显示出游戏界面,并且使用一个10x10矩阵作为雷区。（M[10][10] 是一个索引从0-99，有100个值的数组。） 如想了解更多关于Bash 数组的内容，请阅读这本书[_那些关于Bash你所不了解的事: Bash数组简介_][4]。


创建一个叫 **plough**的函数，我们先将标题显示出来：两个空行，列头，和一行 “-”，以示意往下是游戏界面: 


```
printf '\n\n'
printf '%s' "     a   b   c   d   e   f   g   h   i   j"
printf '\n   %s\n' "-----------------------------------------"
```

然后,我初始化一个计数器变量，叫 **r**，它会用来记录已显示多少横行。 注意，稍后在游戏代码中，我们会用同一个变量**r**，作为我们的数组索引。 在 [Bash **for** 循环][5]中，用 **seq**命令从0增加到9。我用 (**d%**)占位，来显示示行号（$row,被**seq**定义的变量） 
Next, I establish a counter variable, called **r**, to keep track of how many horizontal rows have been populated. Note that, we will use the same counter variable '**r**' as our array index later in the game code. In a [Bash **for** loop][5], using the **seq** command to increment from 0 to 9, I print a digit (**d%**) to represent the row number ($row, which is defined by **seq**):


```
r=0 # our counter
for row in $(seq 0 9); do
  printf '%d  ' "$row" # print the row numbers from 0-9
```

Before we move ahead from here, lets check what we have made till now. We printed sequence **[a-j] **horizontally first and then we printed row numbers in a range **[0-9]**, we will be using these two ranges to act as our users input coordinates to locate the mine to extract.** **
在我们接着往下做之前，让我们看看到现在都做了什么。我们先横着显示 **[a-j]** 然后再将 **[0-9]** 的行号显示出来，我们会用这两个范围，来确定用户所点击地雷的确切位置。 

Next,** **Within each row, there is a column intersection, so it's time to open a new **for** loop. This one manages each column, so it essentially generates each cell in the playing field. I have added some helper functions that you can see the full definition of in the source code. For each cell,  we need something to make the field look like a mine, so we initialize the empty ones with a dot (.), using a custom function called [**is_null_field**][6]. Also, we need an array variable to store the value for each cell, we will use the predefined global array variable **[room][7]** along with an index [variable **r**][8]. As **r** increments, we iterate over the cells, dropping mines along the way.

接着，在每行中，插入列，所以是时候写一个新的 **for** 循环了。 这一循环管理着每一列，也就是说，实际上是生成游戏界面的每一格。我添加了一些说明函数，这样，你能在源码中看到它的完整定义。 对每一格来说，我们需要一些让它看起来像地雷的东西，所以我们先用一个点（.）来初始化空格。实现这一想法，我们用的是一个叫[**is_null_field**][6] 的自定义函数。 同时，我们需要一个存储每一格具体值的数组，这儿我们会用到之前已定义的全局数组 **[room][7]** , 并且用 [变量 **r**][8]作为索引。 随着  **r** 的增加，我们会遍历所有单元格，并随机部署地雷。

```
  for col in $(seq 0 9); do
    ((r+=1))  # increment the counter as we move forward in column sequence
    is_null_field $r  # assume a function which will check, if the field is empty, if so, initialize it with a dot(.)
    printf '%s \e[33m%s\e[0m ' "|" "${room[$r]}" # finally print the separator, note that, the first value of ${room[$r]} will be '.', as it is just initialized.
  #close col loop
  done
```

最后，为了保持游戏界面整齐好看，我会在每行用一个竖线作为结尾，并在最后结束行循环：

```
printf '%s\n' "|"   #显示出行分隔符
printf '   %s\n' "-----------------------------------------"
# 结束行循环
done
printf '\n\n'
```

完整的 **plough** 代码如下：

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

It took me some time to decide on needing the **is_null_field**, so let's take a closer look at what it does. We need a dependable state from the beginning of the game. That choice is arbitrary–it could have been a number or any character. I decided to assume everything was declared as a dot (.) because I believe it makes the gameboard look pretty. Here's what that looks like:

我花了点时间来思考，**is_null_field** 的具体功能是什么。让我们来看看它到底能做些什么。在开始之初，我们需要游戏有一个固定的状态。你可以随便选择，最初所有格子的初始值，可以是一个数字或者任意字符。 我最终决定，所有单元格的初始值为一个点（.），以文我觉得这样会让游戏界面更好看。下面就是这一函数的完整代码：

```
is_null_field()
{
  local e=$1 # 在数组room中，我们已经用过循环变量 'r'了，这次我们用'e'
    if [[ -z "${room[$e]}" ]];then
      room[$r]="."  #这里用点（.）来初始化每一个单元格
    fi
}
```

Now that, I have all the cells in our mine initialized, I get a count of all available mines by declaring and later calling a simple function shown below:
现在，我已经初始化了所有的格子，现在只要用一个很简单的函数，就能得出，当前游戏中还有多少单元格可以操作：

```
get_free_fields()
{
  free_fields=0    # 初始化变量 
  for n in $(seq 1 ${#room[@]}); do
    if [[ "${room[$n]}" = "." ]]; then  # free field. 检查当前单元格是否等于初始值（.），如果判断结果为真，则记为空余格子。 
      ((free_fields+=1))
    fi
  done
}
```

这是显示出来的游戏界面，[**a-j]** 为列， [**0-9**] 为行。
![Minefield][9]

### 创建玩家逻辑

玩家操作背后的逻辑在于，先从[stdin][10] 中读取数据作为坐标，然后再找出对应位置实际包含的值。这里用到了Bash的[参数扩展][11]，来设法得到行列数。然后将代表列数的字母传给switch,从而得到其对应的列数。为了更好地理解这一过程，可以看看下面这段代码中，变量 '**o'** 所对应的值。 举个例子，玩家输入了 **c3** ，这时 Bash 将其分成两个字符： **c** and **3** 。 为了简单起见，我跳过了如何处理无效输入的部分。

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

下面的代码会计算，用户所选单元格实际对应的数字，然后将结果储存在变量中。

There is also a lot of use of **shuf** command here, **shuf** is a [Linux utility][12] designed to provide a random permutation of information where the **-i** option denotes indexes or possible ranges to shuffle and **-n** denotes the maximum number or output given back. Double parentheses allow for [mathematical evaluation][13] in Bash, and we will use them heavily here.

这里也用到了很多的 **shuf** 命令，**shuf** 是一个专门用来生成随机序列的[Linux命令][12]。 **-i**  选项，后面需要提供需要打乱的数或者范围， **-n** 选择则规定，输出结果最多需要返回几个值。两个圆括号，在Bash中可以进行[数学计算]，这里我们会多次用到。

还是沿用之前的例子，玩家输入了  **c3** 。 接着，它被转化成了**ro=3** 和 **o=3**。 之后，通过上面的switch 代码， 将**c** 转化为对应的整数，带进公式，以得到最终结果 '**i'.** 的值。   


```
  i=$(((ro*10)+o))   # Follow BODMAS rule, to calculate final index.
  is_free_field $i $(shuf -i 0-5 -n 1)   # call a custom function that checks if the final index value points to a an empty/free cell/field.
```

仔细观察这个计算过程，看看最终结果 '**i**'  是如何计算出来的：

```
i=$(((ro*10)+o))
i=$(((3*10)+3))=$((30+3))=33
```

最后结果是33。在我们的游戏界面显示出来，玩家输入坐标指向了第33个单元格，也就是在第3行（从0开始，否则这里变成4），第3列。

### Create the logic to determine the available minefield 创建

为了找到地雷，在将坐标转化，并找到实际位置之后，程序会检查这一单元格是否可选。如不可选，程序会显示一条警告信息，并要求玩家重新输入坐标。

在这段代码中，单元格是否可选，是由数组里对应的值是否为点(**.**)决定的。 如果可选，则重置单元格对应的值，并更新分数。反之，因为其对应值不为点，则设置 变量 **not_allowed**。 为简单起见，游戏中[警告消息][14]这部分源码，我会留给读者们自己去探索。

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
 
如输入坐标有效，且对应位置为地雷，如下图所示。 玩家输入 **h6**，游戏界面会出现一些随机生成的值。在发现地雷后，这些值会被加入用户得分。


![Extracting mines][16]

Now remember the variables we declared at the start, [a-g], I will now use them here to extract random mines assigning their value to the variable **m** using Bash indirection. So, depending upon the input coordinates, the program picks a random set of additional numbers (**m**) to calculate the additional fields to be populated (as shown above) by adding them to the original input coordinates, represented here by **i (**calculated above**)**.



Please note the character **X** in below code snippet, is our sole GAME-OVER trigger, we added it to our shuffle list to appear at random, with the beauty of **shuf** command, it can appear after any number of chances or may not even appear for our lucky winning user.


```
m=$(shuf -e a b c d e f g X -n 1)   # add an extra char X to the shuffle, when m=X, its GAMEOVER
  if [[ "$m" != "X" ]]; then        # X will be our explosive mine(GAME-OVER) trigger
    for limit in ${!m}; do          # !m represents the value of value of m
      field=$(shuf -i 0-5 -n 1)     # again get a random number and
      index=$((i+limit))            # add values of m to our index and calculate a new index till m reaches its last element.
      is_free_field $index $field
    done
```

I want all revealed cells to be contiguous to the cell selected by the player.

![Extracting mines][17]

### 记录已显示和可用单元格的个数

这个程序需要记录，游戏界面中哪些单元格是可选择的。否则，程序会一直让用户输入数据，即使所有单元格都被选中过。为了实现这一功能，我创建了一个叫 **free_fields** 的变量，初始值为0。 用一个 **for**  循环，记录下游戏界面中可选择单元格的数量。 ****如果单元格所对应的值为点 (**.**), 则 **free_fields** 加一。



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

等下，如果 **free_fields=0** 呢？ 这意味着，玩家已选择过所有单元格。如果想更好理解这一部分，可以看看这里的[源代码][18] 。


```
if [[ $free_fields -eq 0 ]]; then   # 这意味着你已选择过所有格子
      printf '\n\n\t%s: %s %d\n\n' "You Win" "you scored" "$score"
      exit 0
fi
```

### 创建游戏结束逻辑

对于游戏结束这种情况，我们这里使用了一些很巧妙的技巧，将结果在屏幕中央显示出来。我把这部分留给读者朋友们自己去探索。



```
if [[ "$m" = "X" ]]; then
    g=0                      #  为了在参数扩展中使用它
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

文章到这里就结束了，朋友们！ 如果你想了解更多，具体可以查看我的[GitHub 库][3]，那儿有这个扫雷游戏的源代码，并且你还能找到更多用Bash 编写的游戏。 我希望，这篇文章能激起你学习Bash的兴趣，并乐在其中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/advanced-bash-building-minesweeper

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakarhttps://opensource.com/users/dnearyhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/marcobravo
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
