实用的Linux SHELL面试问题及答案
================================================================================

随着之前有关面试的系列文章，读者的反应比较强烈，所以我决定出一篇有关Linux Shell相关的面试文章，如果对本文有什么意见或意见的话，欢迎反馈到我的邮箱里。

如果想要阅读已发表在Tecmint.com的文章，可以点击链接，链接到[访谈系列] [1]，在这里我们已经介绍很多题目即文章。，FTP，MySQL和Apache的，脚本，Linux命令等。

![Practical Interview Question on Shell Scripting](http://www.tecmint.com/wp-content/uploads/2014/06/Interview-Questions-on-Shell-Scripting.png)
> 实用的shell脚本面试问题

这边提到的5个面试问题，延续之前的有关Linux面试问题和答案。如果你是Tecmint.com的读者，你的支持我非常感谢。

### 1. 写一个shell脚本来得到当前的日期，时间，用户名和当前工作目录。 ###

> **答案** : 输出用户名，当前日期和时间，以及当前工作目录的命令就是logname，date，who i am和pwd。

现在，创建一个名为**`userstats.sh`**文件，将下面的代码添加到它。

    #!/bin/bash 
    echo "Hello, $LOGNAME" 
    echo "Current date is `date`" 
    echo "User is `who i am`" 
    echo "Current directory `pwd`"

给它添加执行权限，并且执行他。

    # chmod 755 userstats.sh 
    # ./userstats.sh

#### 样例输出 ####

    Hello, avi 
    Current date is Sat Jun  7 13:05:29 IST 2014 
    User is avi      pts/0        2014-06-07 11:59 (:0) 
    Current directory /home/avi/Desktop

### 2.写一个shell脚本，进行两个数字的相加，如果没有输入参数就输出错误信息和一行使用说明###

> **答案** :  下面是简单的shell脚本以及描述，如果没有命令行参数，它会抛出错误与如何使用脚本的说明。

再创建一个名为**`twonumbers.sh`**文件和下面的内容添加到文件里。

    #!/bin/bash 
    # The Shebang
    
    if [ $# -ne 2 ] 
    # If two Inputs are not received from Standard Input
    
    then 
    # then execute the below statements
    
        echo "Usage - $0   x    y" 
        # print on standard output, how-to use the script (Usage - ./1.sh   x    y )
    
        echo "        Where x and y are two nos for which I will print sum" 
        # print on standard output, “Where x and y are two nos for which I will print sum ”
    
        exit 1 
        # Leave shell in Error Stage and before the task was successfully carried out.
    
    fi 
    # End of the if Statement.
    
        echo "Sum of $1 and $2 is `expr $1 + $2`"
        # If the above condition was false and user Entered two numbers as a command Line Argument,   
           it will show the sum of the entered numbers.

给他添加可执行权限，并且执行。

    # chmod 755 two-numbers.sh

**情形一**: 未输入两个数字作为命令行参数运行脚本，你将得到下面的输出。

#### 样例输出 ####

    # ./two-numbers.sh
    
    Usage - ./two-numbers.sh   x    y 
            Where x and y are two nos for which I will print sum

**情形二**: 当数字存在时，你会得到如图所示的结果。

    $ ./two-numbers.sh 4 5 
    
    Sum of 4 and 5 is 9

因此，上述shell脚本满足了问题的要求。

### 3.你需要打印一个给定的数字的反序，如输入10572，输出27501，如果没有输入数据，应该抛出错误和使用脚本说明。在此之前，告诉我你需要在这里使用的算法。 ###

#### 算法 ####

1. 输入的数字为n
2. 赋值 rev=0, sd=0 (反向和单个数字设置为0)
3. n % 10, 将得到最左边的数字
4. 反向数字可以用这个方法生成 rev * 10 + sd
5. 对输入数字进行右位移操作（除以10）
6. 如果n > 0, 进入第三步，否则进行第七步
7. 输出rev

现在，创建一个名为**`numbers.sh**`文件，并添加以下代码。

    #!/bin/bash 
    if [ $# -ne 1 ] 
    then 
        echo "Usage: $0   number" 
        echo "       I will find reverse of given number" 
        echo "       For eg. $0 0123, I will print 3210" 
        exit 1 
    fi 
    
    n=$1 
    rev=0 
    sd=0 
    
    while [ $n -gt 0 ] 
    do 
        sd=`expr $n % 10` 
        rev=`expr $rev \* 10  + $sd` 
        n=`expr $n / 10` 
    done 
        echo  "Reverse number is $rev"

授予对文件的执行权限，并运行如下所示的脚本。

    # chmod 755 numbers.h

**情形一**: 当输入不包含命令行参数，你将得到下面的输出。

#### 样例输出 ####

    ./numbers.sh
    
    Usage: ./numbers.sh  number 
           I will find reverse of given number 
           For eg. ./2.sh 123, I will print 321

**情形二**: 正常输入

    $ ./numbers.sh 10572 

    Reverse number is 27501

上面的脚本非常完美，输出正是我们需要的。

### 4. 你应该直接用终端，而不是依靠任何shell脚本来进行实数计算。你会怎么做（比如实数7.56+2.453）？ ###

> **答案** : 我们需要用如下所述的特殊方式使用bc命令。将7.56+2.453作为输入通过管道进入bc中。

    $ echo 7.56 + 2.453 | bc
    
    10.013

### 5. 你需要给出圆周率的值，精度为小数点后100位，什么是最简单的方法。 ###

> **答案** : 找圆周率的值最简单的方法，我们只是需要发出以下命令。

    # pi 100 

    3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067

很明显！安装我们必须有包**`pi`**。只用一个**apt**或**yum**命令，就能获得所需的软件包，同时用最简单方法来实现这个需求。

就是这样。我会很快在Tecmint.com发表另一个有趣的文章。至此敬请关注。别忘了向我们提供您在的评论和反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/practical-interview-questions-on-linux-shell-scripting/

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/category/interview-questions/