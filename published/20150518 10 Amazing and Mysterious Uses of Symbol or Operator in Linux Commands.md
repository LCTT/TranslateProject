在Linux命令行下令人惊叹的惊叹号（!）
================================================================================
`'!'`符号在Linux中不但可以用作否定符号，还可以用来从历史命令记录中取出命令或不加修改的执行之前运行的命令。下面的所有命令都已经在Bash Shell中经过确切地检验。尽管我没有试过，但大多都不能在别的Shell中运行。这里我们介绍下Linux命令行中符号`'!'`那惊人和奇妙的用法。

### 1. 使用数字从历史命令列表中找一条命令来执行 ###

您也许没有意识到您可以从历史命令列表（之前已经执行的命令集）中找出一条来运行。首先，通过"history"命令查找之前命令的序号。

    $ history

![使用history命令找到最后执行的命令](http://www.tecmint.com/wp-content/uploads/2015/05/history-Command.gif)

*使用history命令找到最后执行的命令*

现在，只需要使用历史命令输出中显示在该命令前面的数字便可以运行这个命令。例如，运行一个在`history`输出中编号是1551的命令。

    $ !1551

![使用命令ID来执行最后运行的命令](http://www.tecmint.com/wp-content/uploads/2015/05/Run-Commands-By-number.gif)

*使用命令ID来执行最后运行的命令*

这样，编号为1551的命令（上面的例子是[top命令][1]）便运行了。这种通过ID号来执行之前的命令的方式很有用，尤其是在这些命令都很长的情况下。您只需要使用**![history命令输出的序号]**便可以调用它。

### 2. 运行之前的倒数第二个、第七个命令等 ###

您可以以另一种方式来运行之前执行的命令，通过使用-1代表最后的命令，-2代表倒数第二个命令，-7代表倒数第七个命令等。

首先使用history命令来获得执行过的命令的列表。**history命令的执行很有必要**，因为您可以通过它来确保没有`rm command > file`或其他会导致危险的命令。接下来执行倒数第六个、第八个、第十个命令。

    $ history
    $ !-6
    $ !-8
    $ !-10

![通过负数序号运行之前执行的命令](http://www.tecmint.com/wp-content/uploads/2015/05/3.gif)

*通过负数序号运行之前执行的命令*

### 3. 传递最后执行的命令的参数，以方便的运行新的命令 ###

我需要显示`/home/$USER/Binary/firefox`文件夹的内容，因此我执行：

    $ ls /home/$USER/Binary/firefox

接下来，我意识到我应该执行'ls -l'来查看哪个文件是可执行文件。因此我应该重新输入整个命令么？不，我不需要。我仅需要在新的命令中带上最后的参数，类似：

    $ ls -l !$

这里`!$`将把最后执行的命令的参数传递到这个新的命令中。

![将上一个命令的参数传递给新命令](http://www.tecmint.com/wp-content/uploads/2015/05/4.gif)

*将上一个命令的参数传递给新命令*

### 4. 如何使用!来处理两个或更多的参数 ###

比如说我在桌面创建了一个文本文件file1.txt。

    $ touch /home/avi/Desktop/1.txt

然后在cp命令中使用绝对路径将它拷贝到`/home/avi/Downloads`。

    $ cp /home/avi/Desktop/1.txt /home/avi/downloads

这里，我们给cp命令传递了两个参数。第一个是`/home/avi/Desktop/1.txt`，第二个是`/home/avi/Downloads`。让我们分别处理他们，使用`echo [参数]`来打印两个不同的参数。

    $ echo "1st Argument is : !^"
    $ echo "2nd Argument is : !cp:2"

注意第一个参数可以使用`"!^"`进行打印，其余的命令可以通过`"![命令名]:[参数编号]"`打印。

在上面的例子中，第一个命令是`cp`，第二个参数也需要被打印。因此是`"!cp:2"`，如果任何命令比如xyz运行时有5个参数，而您需要获得第四个参数，您可以使用`"!xyz:4"`。所有的参数都可以通过`"!*"`来获得。

![处理两个或更多的参数](http://www.tecmint.com/wp-content/uploads/2015/05/5.gif)

*处理两个或更多的参数*

### 5. 以关键字为基础执行上个的命令 ###

我们可以以关键字为基础执行上次执行的命令。可以从下面的例子中理解：

    $ ls /home > /dev/null						[命令1]
    $ ls -l /home/avi/Desktop > /dev/null		                [命令2]	
    $ ls -la /home/avi/Downloads > /dev/null	                [命令3]
    $ ls -lA /usr/bin > /dev/null				        [命令4]

上面我们使用了同样的命令（ls），但有不同的开关和不同的操作文件夹。而且，我们还将输出传递到`/dev/null`，我们并未显示输出，因而终端依旧很干净。

现在以关键字为基础执行上个的命令。

    $ ! ls					[命令1]
    $ ! ls -l				[命令2]	
    $ ! ls -la				[命令3]
    $ ! ls -lA				[命令4]

检查输出，您将惊奇发现您仅仅使用关键字`ls`便执行了您已经执行过的命令。

![以关键字为基础执行命令](http://www.tecmint.com/wp-content/uploads/2015/05/6.gif)

*以关键字为基础执行命令*

（LCTT 译注：澄清一下，这种用法会按照命令名来找到最后匹配的命令，不会匹配参数。所以上述执行的四个命令都是执行了 `ls -lA /usr/bin > /dev/null`，并增加了新的参数而已。）

### 6. !!操作符的威力 ###

您可以使用`(!!)`运行/修改您上个运行的命令。它将附带一些修改/调整并调用上个命令。让我给您展示一些实际情境。

昨天我运行了一行脚本来获得我的私有IP，因此我执行了：

    $ ip addr show | grep inet | grep -v 'inet6'| grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d/

接着，我突然发现我需要将上面脚本的输出重定向到一个ip.txt的文件，因此，我该怎么办呢？我该重新输入整个命令并重定向到一个文件么？一个简单的解决方案是使用向上光标键并添加`'> ip.txt'`来将输出重定向到文件。

    $ ip addr show | grep inet | grep -v 'inet6'| grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d/ > ip.txt

在这里要感谢救世主"向上光标键"。现在，考虑下面的情况，这次我运行了下面这一行脚本。

    $ ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

一旦我运行了这个脚本，Bash提示符便返回了错误消息`"bash: ifconfig: command not found"`。原因并不难猜，我运行了本应以root权限的运行的命令。

所以，怎么解决呢？以root用户登录并且再次键入整个命令就太麻烦了！而且向上导航键也不管用了（LCTT 译注：当你以新的用户身份登录了，是不能用向上光标键找到之前的另外一个用户的命令历史的）。因此，我们需要调用`"!!"`（去掉引号），它将为那个用户调用上个命令。

    $ su -c !! root

这里su是用来切换到root用户的，`-c`用来以某用户运行特定的命令，最重要的部分是`!!`，它将被替换为上次运行的命令。当然！您需要提供root密码。

![!!操作符的威力](http://www.tecmint.com/wp-content/uploads/2015/05/7.gif)

*!!操作符的威力*

我通常在下面的情景中使用`!!`。

当我用普通用户来运行apt-get，我通常收到提示说我没有权限来执行。

    $ apt-get upgrade && apt-get dist-upgrade

好吧，有错误。但别担心，使用下面的命令来成功的执行...

    $ su -c !!

同样的适用于：

    $ service apache2 start
    
或
    
    $ /etc/init.d/apache2 start
    
或
    
    $ systemctl start apache2

普通用户不被授权执行那些任务，这样相当于我运行：

    $ su -c 'service apache2 start'
    
或
    
    $ su -c '/etc/init.d/apache2 start'
    
或
    
    $ su -c 'systemctl start apache2'
    
（LCTT 译注：使用`!!`之前，一定要确认你执行的是什么命令！另外，在 root 身份下，千万不要养成使用它的习惯，因为你总是会在不合适的目录执行不合适的命令！）

### 7.运行一个影响所有除了![FILE_NAME]的文件命令 ###

`!`（逻辑非）能用来对除了`'!'`后的文件的所有的文件/扩展名执行命令。

A.从文件夹移除所有文件，2.txt除外。

    $ rm !(2.txt)

B.从文件夹移除所有的文件类型，pdf类型除外。

    $ rm !(*.pdf)

### 8.检查某个文件夹（比如/home/avi/Tecmint）是否存在？并打印 ###

这里，我们使用`'! -d'`来验证文件夹是否存在，当文件夹不存在时，将使用其后跟随AND操作符`(&&)`进行打印，当文件夹存在时，将使用OR操作符`(||)`进行打印。

逻辑上，当`[ ! -d /home/avi/Tecmint ]`的输出为0时，它将执行AND逻辑符后面的内容，否则，它将执行OR逻辑符`(||)`后面的内容。

    $ [ ! -d /home/avi/Tecmint ] && printf '\nno such /home/avi/Tecmint directory exist\n' || printf '\n/home/avi/Tecmint directory exist\n'

### 9.检查某文件夹是否存在？如果不存在则退出该命令 ###

类似于上面的情况，但这里当期望的文件夹不存在时，该命令会退出。

    $ [ ! -d /home/avi/Tecmint ] && exit

### 10.如果您的home文件夹内不存在一个文件夹（比方说test），则创建它 ###

这是脚本语言中的一个常用的实现，当期望的文件夹不存在时，创建一个。

    [ ! -d /home/avi/Tecmint ] && mkdir /home/avi/Tecmint

这便是全部了。如果您知道或偶尔遇到其他值得了解的`'!'`使用方法，请您在反馈的地方给我们提建议。保持联系！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mysterious-uses-of-symbol-or-operator-in-linux-commands/

作者：[Avishek Kumar][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/12-top-command-examples-in-linux/
