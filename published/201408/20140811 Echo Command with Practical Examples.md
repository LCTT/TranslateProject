Echo命令实例
================================================================================

echo命令是内建的**shell命令**，用于显示**变量**的值或者**打印一行文本**。

echo命令在构建shell脚本时扮演着重要的角色。
 
### 语法： ###

    # echo [Options] [String]

方括号中的项目是可选的。字符串可以定义为字符的有限序列（如字母，数字，符号，标点符号）。

当echo命令不带任何选项或字符串使用时，它会在显示屏上返回一个空白行，后面换一行跟上命令提示符。这是因为按下回车键就是发送一个信号给系统以开始一个新行，而echo重复了该信号。
 
### 选项： ###


- -n     不要输出衍生的新行
- -e     启用反斜线转义解释
- -E     禁用反斜线转义解释（默认）


如果使用-e选项，则可以使用如下转义序列：

- \\     反斜线
- \a     警告（BEL）
- \b     反斜线
- \c     不产生进一步输出
- \e     转义
- \f     换页
- \n     新行
- \r     换行字符
- \t     水平制表
- \v     垂直制表
- \0NNN  八进制值表示的字节NNN（1到3个数字）
- \xHH   十六进制值表示的字节NNN（1到2个数字）

### 样例：1  显示系统定义的变量的值 ###

使用set命令，我们可以列出系统定义的变量。而要打印这些变量的值，我们可以使用echo命令：

    jack@localhost:~$ echo $USER
    jack
    jack@localhost:~$ echo $HOME
    /home/jack

### 样例：2 显示用户定义的变量的值 ###

    jack@nextstep4it:~$ var1=`date`
    jack@nextstep4it:~$ echo "Today's date  time is : $var1"
    Today's date  time is : Mon Jul 28 13:11:37 IST 2014

### 样例：3 显示文本字符串 ###

    jack@nextstep4it:~$ echo " Hi this echo command testing"
    Hi this echo command testing

### 样例：4 在echo命令中使用反斜线 ###

    jack@nextstep4it:~$ echo -e "Ubuntu \bis \bthe \bbest \bDesktop \bOS"

上述命令将打印：

UbuntuisthebestDesktopOS

### 样例：5  在echo命令中使用制表符空格 ###

    nextstep4it@nextstep4it:~$ echo -e "Ubuntu \tis \tthe \tbest \tDesktop \tOS"

上述命令将显示如下输出：

Ubuntu is the best Desktop OS

### 样例：6 在echo命令中使用垂直制表符 ###

    jack@nextstep4it:~$ echo -e "Ubuntu \vis \vthe \vbest \vDesktop \vOS"
    Ubuntu
           is
                  the
                         best
                                Desktop
                                              OS

### 样例：7  设置echo命令彩色输出 ###

echo命令可以修改字体类型，字体背景色以及字体颜色，转义序列\033可以用于改变字体属性。要使转义序列生效，必须使用-e选项。下面列出了部分转义代码：

- [0m: 正常
- [1m: 粗体
- [4m: 字体加上下划线
- [7m: 逆转前景和背景色
- [8m: 不可见字符
- [9m: 跨行字体
- [30m: 灰色字体 
- [31m: 红色字体
- [32m: 绿色字体
- [33m: 棕色字体
- [34m: 蓝色字体
- [35m: 紫色字体
- [36m: 浅蓝色字体
- [37m: 浅灰字体
- [38m: 黑色字体
- [40m: 黑色背景
- [41m: 红色背景
- [42m: 绿色背景
- [43m: 棕色背景
- [44m: 蓝色背景
- [45m: 紫色背景
- [46m: 浅蓝色背景
- [47m: 浅灰色背景

下面的命令将用红色打印输出。

    jack@nextstep4it:~$ echo -e "\033[31mMagic of Linux\033[0m"
    Magic of Linux

下面的命令将以粗体以及红色背景打印出“Magic of Linux”。

    nextstep4it@nextstep4it:~$ echo -e "\033[1m\033[41mMagic of Linux\033[0m"
    Magic of Linux

--------------------------------------------------------------------------------

via: http://www.nextstep4it.com/categories/unix-command/echo-command/

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
