如何在shell脚本中使用变量
================================================================================
在每种**编程**语言中，**变量**都扮演了一个重要的角色。在Linux shell脚本编程中，我们使用两种类型的变量：**系统定义的变量**和**用户定义的变量**。

shell脚本中的变量是用来**调用**一个**数值**或者**字符值**的手段。与正规的编程语言不同的是，shell脚本不要求你去为变量**声明一个类型**。

在本文中，我们将讨论shell脚本编程中的变量及其类型，以及如何设置和使用这些变量。

### 系统定义的变量： ###

这些变量由**操作系统（Linux）自身**创建并维护，通常它们以**大写字母**定义，我们可以通过命令“**$ set**”来查看这些变量。下面列出了部分系统定义的变量：

<table width="100%" cellspacing="1" cellpadding="1">
  <tbody>
    <tr>
      <td><strong>系统定义的变量 </strong></td>
      <td><strong>意义 </strong></td>
    </tr>
    <tr>
      <td> BASH=/bin/bash </td>
      <td>  Bash Shell 名称 </td>
    </tr>
    <tr>
      <td> BASH_VERSION=4.1.2(1) </td>
      <td> Bash 版本 </td>
    </tr>
    <tr>
      <td> COLUMNS=80 </td>
      <td> 你的屏幕宽度（列数） </td>
    </tr>
    <tr>
      <td> HOME=/home/linuxtechi </td>
      <td> 用户家目录 </td>
    </tr>
    <tr>
      <td> LINES=25 </td>
      <td> 你的屏幕高度（行数） </td>
    </tr>
    <tr>
      <td> LOGNAME=LinuxTechi </td>
      <td> 当前登录用户的名字 </td>
    </tr>
    <tr>
      <td> OSTYPE=Linux </td>
      <td> 操作系统类型 </td>
    </tr>
    <tr>
      <td> PATH=/usr/bin:/sbin:/bin:/usr/sbin </td>
      <td> 可执行文件搜索路径  </td>
    </tr>
    <tr>
      <td> PS1=[\u@\h \W]\$ </td>
      <td> 命令行提示符 </td>
    </tr>
    <tr>
      <td> PWD=/home/linuxtechi </td>
      <td> 当前工作目录 </td>
    </tr>
    <tr>
      <td> SHELL=/bin/bash </td>
      <td> Shell 名称 </td>
    </tr>
    <tr>
      <td> USERNAME=linuxtechi </td>
      <td> 当前登录的用户名 </td>
    </tr>
  </tbody>
</table>

要打印以上变量的值，可以使用**echo command**命令，如下：

    # echo $HOME
    # echo $USERNAME

我们可以通过在环境变量名前前置一个美元符号来从你的脚本里输入环境变量。请看下面脚本演示：

    $ cat myscript
    
    #!/bin/bash
    # display user information from the system.
    echo “User info for userid: $USER”
    echo UID: $UID
    echo HOME: $HOME 

注意：echo命令中的**环境变量**在脚本运行时会被它们的值替代。同时注意，我们可以再第一个字符串的双引号中放置**$USER**系统变量，而shell脚本仍然可以明白我们的意思。然而，该方法有一个**缺点**。看下面这个例子：

    $ echo “The cost of the item is $15”
    The cost of the item is 5

很明显，那不是我们说希望的。无论何时，当脚本遇见引号中的美元符号时，它都会认为你是在调用一个变量。在本例中，该脚本试着显示**变量$1**（而这个变量并没有定义），然后显示数字5。要显示实际上的美元符号，你**必须前置**一个**反斜线字符**：

    $ echo “The cost of the item is \$15”
    The cost of the item is $15

那样好多了。反斜线允许shell脚本将**美元符号**解释成为实际的美元符号，而不是变量。

### 用户定义的变量：  ###

这些变量由**用户**定义。shell脚本允许我们在脚本中设置并使用我们**自己的变量**。设置变量允许你**临时存储数据**并在脚本中使用，让shell脚本看起来像一个真正的计算机程序。

**用户变量**可以是任何不超过**20个的字母、数字**或者**下划线字符**的文本字符串（LCTT 译注：变量只能以字母或下划线开头）。用户变量是大小写敏感的，因此，变量Var1和变量var1是不同的变量。这个小规则常常让新手编写脚本时麻烦重重。

我们可以通过**等于号**为变量赋值。变量，等于号和值（对于新手又是个麻烦的地方）之间不能有空格。下面是几个给用户变量赋值的例子：

    var1=10
    var2=-57
    var3=testing
    var4=“still more testing”

shell脚本为变量值**自动确定数据类型**。shell脚本内定义的变量会在脚本运行时保留它们的值，当脚本完成后则删除这些值。

就像系统变量一样，用户变量也可以使用美元符号来调用：

    $ cat test3
    #!/bin/bash
    # testing variables
    days=10
    guest="Katie"
    echo "$guest checked in $days days ago"
    days=5
    guest="Jessica"
    echo "$guest checked in $days days ago"
    $

运行脚本会产生以下输出：

    $ chmod u+x test3
    $ ./test3
    Katie checked in 10 days ago
    Jessica checked in 5 days ago
    $

每次变量被**调用**，它都会变成了当前分配给它的值。有一点很重要，当调用一个变量值时，你使用**美元符号**，但是当为一个变量分配一个值时，你不能用美元符号。下面用例子来说明：

    $ cat test4
    #!/bin/bash
    # assigning a variable value to another variable
    value1=10
    value2=$value1
    echo The resulting value is $value2
    $

当你使用赋值语句中**value1**变量的**值**时，你仍然必须使用美元符号。这段代码产生了如下输出：

    $ chmod u+x test4
    $ ./test4
    The resulting value is 10
    $

如果你忘了美元符号，而又让value2赋值行看起来像这样：

value2=value1

你会获得下面的输出：

    $ ./test4    
    The resulting value is value1
    $

没有美元符号，**shell解释**变量名为**普通文本字符串**，这极有可能不是你想要的。

### 在shell变量中使用反引号（`）： ###

**反引号允许**你将shell命令的输出赋值给变量。虽然这似乎没什么大不了，但它是**脚本编程**中主要的构建基块。你必须使用反引号将整个命令行包含起来：

    **testing=`date`**

shell会在**反引号**中运行命令，然后将输出结果赋值给变量testing。下面的例子给出了如何使用一个常规shell命令的输出结果来创建一个变量：

    $ cat test5
    #!/bin/bash
    # using the backtick character
    testing=`date`
    echo "The date and time are: " $testing
    $

变量testing接收来自date命令的输出结果，而它又在echo语句中被调用。运行脚本会产生如下输出：

    $ chmod u+x test5
    $ ./test5
    The date and time are: Mon Jan 31 20:23:25 EDT 2011

**注**：在bash中，你也可以选用$(...)语法来替换反引号(`)，它有个优点就是可以重用（re-entrant）。

例：

    $ echo " Today’s date & time is :" $(date)
    Today’s date & time is : Sun Jul 27 16:26:56 IST 2014 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/variables-in-shell-scripting/

作者：[Pradeep Kumar][a]
译者：[	](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
