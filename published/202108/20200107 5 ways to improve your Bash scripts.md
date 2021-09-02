[#]: collector: "lujun9972"
[#]: translator: "fisherue"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13717-1.html"
[#]: subject: "5 ways to improve your Bash scripts"
[#]: via: "https://opensource.com/article/20/1/improve-bash-scripts"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"

改进你的脚本程序的 5 个方法
======

> 巧用 Bash 脚本程序能帮助你完成很多极具挑战的任务。

![](https://img.linux.net.cn/data/attachment/album/202108/25/131347yblk4jg4r6blebmg.jpg)

系统管理员经常写脚本程序，不论长短，这些脚本可以完成某种任务。

你是否曾经查看过某个软件发行方提供的安装用的<ruby>脚本<rt>script</rt></ruby>程序？为了能够适应不同用户的系统配置，顺利完成安装，这些脚本程序经常包含很多函数和逻辑分支。多年来，我积累了一些改进脚本程序的一些技巧，这里分享几个，希望能对朋友们也有用。这里列出一组短脚本示例，展示给大家做脚本样本。

### 初步尝试

我尝试写一个脚本程序时，原始程序往往就是一组命令行，通常就是调用标准命令完成诸如更新网页内容之类的工作，这样可以节省时间。其中一个类似的工作是解压文件到 Apache 网站服务器的主目录里，我的最初脚本程序大概是下面这样：

```
cp january_schedule.tar.gz /usr/apache/home/calendar/
cd /usr/apache/home/calendar/
tar zvxf january_schedule.tar.gz
```

这帮我节省了时间，也减少了键入多条命令操作。时日久了，我掌握了另外的技巧，可以用 Bash 脚本程序完成更难的一些工作，比如说创建软件安装包、安装软件、备份文件系统等工作。

### 1、条件分支结构

和众多其他编程语言一样，脚本程序的条件分支结构同样是强大的常用技能。条件分支结构赋予了计算机程序逻辑能力，我的很多实例都是基于条件逻辑分支。

基本的条件分支结构就是 `if` 条件分支结构。通过判定是否满足特定条件，可以控制程序选择执行相应的脚本命令段。比如说，想要判断系统是否安装了 Java ，可以通过判断系统有没有一个 Java 库目录；如果找到这个目录，就把这个目录路径添加到可运行程序路径，也就可以调用 Java 库应用了。

```
if [ -d "$JAVA_HOME/bin" ] ; then
    PATH="$JAVA_HOME/bin:$PATH"
```

### 2、限定运行权限

你或许想只允许特定的用户才能执行某个脚本程序。除了 Linux 的权限许可管理，比如对用户和用户组设定权限、通过 SELinux 设定此类的保护权限等，你还可以在脚本里设置逻辑判断来设置执行权限。类似的情况可能是，你需要确保只有网站程序的所有者才能执行相应的网站初始化操作脚本。甚至你可以限定只有 root 用户才能执行某个脚本。这个可以通过在脚本程序里设置逻辑判断实现，Linux 提供的几个环境变量可以帮忙。其中一个是保存用户名称的变量 `$USER`， 另一个是保存用户识别码的变量 `$UID` 。在脚本程序里，执行用户的 UID 值就保存在 `$UID` 变量里。

#### 用户名判别

第一个例子里，我在一个带有几个应用服务器实例的多用户环境里指定只有用户 `jboss1` 可以执行脚本程序。条件 `if` 语句主要是判断，“要求执行这个脚本程序的用户不是 `jboss1` 吗?”当此条件为真时，就会调用第一个 `echo` 语句，接着是 `exit 1`，即退出这个脚本程序。

```
if [ "$USER" != 'jboss1' ]; then
     echo "Sorry, this script must be run as JBOSS1!"
     exit 1
fi
echo "continue script"
```

#### 根用户判别

接下来的例子是要求只有根用户才能执行脚本程序。根用户的用户识别码（UID）是 ０，设置的条件判断采用大于操作符（`-gt`），所有 UID 值大于 ０ 的用户都被禁止执行该脚本程序。

```
if [ "$UID" -gt 0 ]; then
     echo "Sorry, this script must be run as ROOT!"
     exit 1
fi
echo "continue script"
```

### 3、带参数执行程序

可执行程序可以附带参数作为执行选项，命令行脚本程序也是一样，下面给出几个例子。在这之前，我想告诉你，能写出好的程序并不只是写出我们想要它执行什么的程序，程序还需要不执行我们不要它执行的操作。如果运行程序时没有提供参数造成程序缺少足够信息，我愿意脚本程序不要做任何破坏性的操作。因而，程序的第一步就是确认命令行是否提供了参数，判定的条件就是参数数量 `$#` 是否为 0 ，如果是（意味着没有提供参数），就直接终止脚本程序并退出操作。


```
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi
echo "arguments found: $#"
```

#### 多个运行参数

可以传递给脚本程序的参数不止一个。脚本使用内部变量指代这些参数，内部变量名用非负整数递增标识，也就是 `$1`、`$2`、`$3` 等等递增。我只是扩展前面的程序，并在下面一行输出显示用户提供的前三个参数。显然，要针对所有的每个参数有对应的响应需要更多的逻辑判断，这里的例子只是简单展示参数的使用。

```
echo $1 $2 $3
```

我们在讨论这些参数变量名，你或许有个疑问，“参数变量名怎么跳过了 `$0`，（而直接从`$1` 开始）？”

是的，是这样，这是有原因的。变量名 `$0` 确实存在，也非常有用，它储存的是被执行的脚本程序的名称。

```
echo $0
```

程序执行过程中有一个变量名指代程序名称，很重要的一个原因是，可以在生成的日志文件名称里包含程序名称，最简单的方式应该是调用一个 `echo` 语句。

```
echo test >> $0.log
```

当然，你或许要增加一些代码，确保这个日志文件存放在你希望的路径，日志名称包含你认为有用的信息。

### 4、交互输入

脚本程序的另一个好用的特性是可以在执行过程中接受输入，最简单的情况是让用户可以输入一些信息。


```
echo "enter a word please:"
read word
echo $word
```

这样也可以让用户在程序执行中作出选择。

```
read -p "Install Software ?? [Y/n]: " answ
if [ "$answ" == 'n' ]; then
    exit 1
fi
    echo "Installation starting..."
```

### 5、出错退出执行

几年前，我写了个脚本，想在自己的电脑上安装最新版本的 Java 开发工具包（JDK）。这个脚本把 JDK 文件解压到指定目录，创建更新一些符号链接，再做一下设置告诉系统使用这个最新的版本。如果解压过程出现错误，在执行后面的操作就会使整个系统上的 Java 破坏不能使用。因而，这种情况下需要终止程序。如果解压过程没有成功，就不应该再继续进行之后的更新操作。下面语句段可以完成这个功能。

```
tar kxzmf jdk-8u221-linux-x64.tar.gz -C /jdk --checkpoint=.500; ec=$?
if [ $ec -ne 0 ]; then
     echo "Installation failed - exiting."
     exit 1
fi
```

下面的单行语句可以给你快速展示一下变量 `$?` 的用法。

```
ls T; ec=$?; echo $ec
```

先用 `touch T` 命令创建一个文件名为 `T` 的文件，然后执行这个单行命令，变量 `ec` 的值会是 ０。然后，用 `rm T` 命令删除文件，再执行该单行命令，变量 `ec` 的值会是 ２，因为文件 `T` 不存在，命令 `ls` 找不到指定文件报错。

在逻辑条件里利用这个出错标识，参照前文我使用的条件判断，可以使脚本文件按需完成设定操作。

### 结语

要完成复杂的功能，或许我们觉得应该使用诸如 Python、C 或 Java 这类的高级编程语言，然而并不尽然，脚本编程语言也很强大，可以完成类似任务。要充分发挥脚本的作用，有很多需要学习的，希望这里的几个例子能让你意识到脚本编程的强大。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/improve-bash-scripts

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[fisherue](https://github.com/fisherue)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl "工作者图片"
