[#]: subject: "Automate tasks with BAT files on FreeDOS"
[#]: via: "https://opensource.com/article/21/6/automate-tasks-bat-files-freedos"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13970-1.html"

在 FreeDOS 上使用 BAT 文件自动执行任务
======

> FreeDOS 下批处理文件的实用指南。

![](https://img.linux.net.cn/data/attachment/album/202111/10/104345whfjagaahm9nb2j3.jpg)

即使你以前没有使用过 DOS，你也可能知道它的命令行 shell，即 `COMMAND.COM`。它已经成为 DOS 的同义词，FreeDOS 为此也实现了一个类似的 shell，称为 “FreeCOM”，但也命名为 `COMMAND.COM`，就像在其他 DOS 系统上一样。

但是 FreeCOM shell 可以做的不仅仅是为你提供一个命令行提示符让你在其中运行命令，如果你需要在 FreeDOS 上自动执行任务，你可以使用 _批处理文件_，也称为 “BAT 文件”，因为这些脚本使用 `.BAT` 扩展名。

批处理文件可能比你在 Linux 编写的脚本要简单得多。因为在很久以前，这个功能最初被添加到 DOS 时，它是为了让 DOS 用户“批量处理”某些命令。它的条件分支没有太大的灵活性，也不支持更高级的功能，例如算术扩展、标准输出和错误消息的重定向、后台进程、测试、循环（这项支持）和 Linux 脚本中常见的其他结构。

本文是 FreeDOS 下批处理文件的实用指南。记住通过用百分号（`%`）包裹变量名称来引用环境变量，例如 `%PATH%`。但是，请注意，由于历史原因，`FOR` 循环的构造略有不同。

### 打印输出

批处理文件可能需要向用户打印消息，让用户知道发生了什么。使用 `ECHO` 语句打印消息。例如，一个批处理文件可能使用以下语句表明它已完成了任务：

```
ECHO Done
```

`ECHO` 语句不需要引号。FreeCOM `ECHO` 语句不会以任何特殊方式处理引号，它会像普通文本一样打印它们。

通常，FreeDOS 在执行批处理文件时会打印每一行。这在一个非常短的批处理文件中通常不是问题，它只为用户定义了几个环境变量。但是对于执行更多工作的较长批处理文件而言，批处理行的这种一直显示可能会变得很麻烦。要阻止此输出，在 `ECHO` 语句中使用 `OFF` 关键字，如下所示：

```
ECHO OFF
```

使用 `ON` 关键字在 FreeDOS 运行时恢复显示批处理行。

```
ECHO ON
```

大多数批处理文件在第一行包含一个 `ECHO OFF` 语句，以阻止消息，但是 shell 在执行语句时仍然会在屏幕上打印 `ECHO OFF`。为了隐藏该语句，批处理文件通常在前面使用 `@` 符号。这样，任何以这个特殊字符开头的行都不会打印，即使打开了 `ECHO`。

```
@ECHO OFF
```

### 注释

编写较长批处理文件时，大多数程序员都喜欢使用 _注释_ 来提醒自己这个批处理文件的用途。在批处理文件中注释，使用 `REM`（remark）关键字。`REM` 之后的任何内容都会被 FreeCOM shell 忽略。

```
@ECHO OFF
REM This is a comment
```

### 执行“辅助”批处理文件

通常，FreeCOM 一次只运行一个批处理文件。但是，你可能需要使用另一个批处理文件来执行其他操作，例如为多个批处理文件设置公共环境变量。

如果你从"正在运行"的批处理文件中直接调用第二个批处理文件，FreeCOM 将完全切换到第二个批处理文件，并停止处理第一个。要改为在第一个批处理文件“内部”运行第二个批处理文件，你需要告诉 FreeDOS shell 使用 `CALL` 关键字去 _调用_ 第二个批处理文件。

```
@ECHO OFF
CALL SETENV.BAT
```

### 条件分支

批处理文件确实支持使用 `IF` 语句的简单条件分支。它有三种基本形式：

  1. 测试上一条命令的返回状态
  2. 测试一个变量是否等于一个值
  3. 测试文件是否存在

`IF` 语句的一个常见用途是测试程序是否成功返回。如果它们正常运行，大多数程序将返回零值，或者在出现错误时返回一些其他值。在 DOS 中，这称为 _错误级别_，这是 `IF` 测试的特例。

测试名为 `MYPROG` 的程序是否成功退出，实际上是检查程序是否返回“零”。使用 `ERRORLEVEL` 关键字来测试特定值。例如：

```
@ECHO OFF
MYPROG
IF ERRORLEVEL 0 ECHO Success
```

使用 `ERRORLEVEL` 测试错误级别是检查程序退出状态的笨拙方法。检查 DOS 程序的不同返回值，更有用的方法是使用 FreeDOS 为你定义的特殊变量，称为 `ERRORLEVEL`。它存储了最近执行程序的错误级别，然后你可以使用 `==` 测试不同的值。

你可以使用 `==` 和 `IF` 语句来测试变量是否等于某个值。就像一些编程语言，你可以使用 `==` 直接比较两个值。通常，在一侧引用一个环境变量，在另一侧引用一个值，但你也可以比较两个变量的值以查看它们是否相同。例如，你可以使用此批处理文件重写上面的 `ERRORLEVEL` 代码：

```
@ECHO OFF
MYPROG
IF %ERRORLEVEL%==0 ECHO Success
```

`IF` 语句的另一个常见用途是测试文件是否存在，如果存在则采取操作。你可以使用 `EXIST` 关键字来测试。例如，要删除名为 `TEMP.DAT` 的临时文件，你可以在批处理文件中使用以下行：

```
@ECHO OFF
IF EXIST TEMP.DAT DEL TEMP.DAT
```

对于任何 `IF` 语句，你都可以使用 `NOT` 关键字来 _否定_ 测试。在文件 _不_ 存在时打印消息，你可以这样写：

```
@ECHO OFF
IF NOT EXIST TEMP.DAT ECHO No file
```

### 分支执行

利用 `IF` 测试的一种方法是跳转到批处理文件中完全不同的部分，这取决于 `IF` 测试的结果。在最简单的情况下，如果一个关键命令失败，你可能希望跳到批处理文件的末尾。或者，如果某些环境变量设置不正确，你可能想要执行其他语句。

你可以使用 `GOTO` 指令跳转到批处理文件的其他部分。它会跳转到批处理文件中称为 _标签_ 的特定行。注意，这是一个严格的 “go-to” 跳转：批处理文件执行将在新标签处启动。 

假设程序需要一个现有的空文件来存储临时数据，如果文件不存在，则需要在运行程序之前创建一个文件。你可以将这些动作添加到批处理文件中，这样你的程序始终有一个临时文件可供使用：

```
@ECHO OFF
IF EXIST temp.dat GOTO prog
ECHO Creating temp file...
TOUCH temp.dat
:prog
ECHO Running the program...
MYPROG
```

当然，这是一个非常简单的例子。对于这种情况，你可以重写批处理文件，将创建临时文件作为 `IF` 语句的一部分：

```
@ECHO OFF
IF NOT EXIST temp.dat TOUCH temp.dat
ECHO Running the program...
MYPROG
```

### 迭代

如果你需要对一组文件执行相同的任务怎么办？你可以使用 `FOR` 循环 _迭代_ 一组文件。这是一个单行循环，每次使用不同的文件运行单个命令。

`FOR` 循环对迭代变量使用一种特殊的语法，它的用法与其他 DOS 环境变量不同。要循环编辑一组文本文件，可以使用以下语句：（LCTT 译注：原文此处写错了，少写了一个 `%`）

```
@ECHO OFF
FOR %%F IN (*.TXT) DO EDIT %%F
```

注意，如果在命令行中运行此循环，而不是在批处理文件中，那么迭代变量仅需要指定一个百分号（`%`）：

```
C:\> FOR %F IN (*.TXT) DO EDIT %F
```

### 命令行处理

在运行批处理文件时，FreeDOS 提供了一种简单的方法来检测用户可能提供的命令行选项。FreeDOS 解析命令行输入，并将前九个选项存储在特殊变量 `%1`、`%2` ..... 等中，直到 `%9`。注意，无法通过这种方式直接访问第十一个（及之后）选项。特殊变量 `%0` 存储批处理文件的名称。

如果你的批处理文件需要处理 9 个以上的选项，你可以使用 `SHIFT` 语句移除第一个选项，并将每个选项向下 _移动_ 一个值。所以第二个选项变成了 `%1`，第十个选项变成了 `%9`。

大多数批处理文件只需要移动一个值。但是，如果你需要以其他增量进行移位，可以将参数提供给 `SHIFT` 语句。例如：

```
SHIFT 2
```

下面是一个简单的批处理文件，演示了移位操作：

```
@ECHO OFF
ECHO %1 %2 %3 %4 %5 %6 %7 %8 %9
ECHO Shift by one ..
SHIFT 1
ECHO %1 %2 %3 %4 %5 %6 %7 %8 %9
```

执行带有十个选项的批处理文件显示了 `SHIFT` 语句如何重新排列命令行选项，因此批处理文件现在可以用 `%9` 访问第十个参数：

```bash
C:\SRC>args 1 2 3 4 5 6 7 8 9 10
1 2 3 4 5 6 7 8 9
Shift by one ..
2 3 4 5 6 7 8 9 10
C:\SRC>
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/automate-tasks-bat-files-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk "Tips and gears turning"