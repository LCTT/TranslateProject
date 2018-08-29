如何在 Linux Shell 编程中定义和使用函数
======

函数是一段可复用的代码。我们通常把重复的代码放进函数中并且在不同的地方去调用它。库是函数的集合。我们可以在库中定义经常使用的函数，这样其它脚本便可以不再重复代码而使用这些函数。

![Functions-Linux-Shell-Script][1]

本文我们将讨论诸多关于函数的内容和一些使用技巧。为了方便演示，我将在 Ubuntu 系统上使用 **Bourne Again SHell (Bash)**。

### 调用函数

在 Shell 中调用函数和调用其它命令是一模一样的。例如，如果你的函数名称为 `my_func`，你可以在命令行中像下面这样执行它：

```
$ my_func
```

如果你的函数接收多个参数，那么可以像下面这样写（类似命令行参数的使用）：

```
$ my_func arg1 arg2 arg3
```

### 定义函数

我们可以用下面的语法去定义一个函数：

```
function function_name {
    Body of function
}
```

函数的主体可以包含任何有效的命令、循环语句和其它函数或脚本。现在让我们创建一个简单的函数，它向屏幕上显示一些消息（注：直接在命令行里写）。

```
function print_msg {
    echo "Hello, World"
}
```

现在，让我们执行这个函数：

```
$ print_msg
Hello, World
```

不出所料，这个函数在屏幕上显示了一些消息。

在上面的例子中，我们直接在终端里创建了一个函数。这个函数也可以保存到文件中。如下面的例子所示。

```
#!/bin/bash
function print_msg {
    echo "Hello, World"
}
print_msg
```

我们已经在 `function.sh` 文件中定义了这个函数。现在让我们执行这个脚本：

```
$ chmod +x function.sh
$ ./function.sh
Hello, World
```

你可以看到，上面的输出和之前的是一模一样的。

### 更多函数用法

在上一小节中我们定义了一个非常简单的函数。然而在软件开发的过程中，我们需要更多高级的函数，它可以接收多个参数并且带有返回值。在这一小节中，我们将讨论这种函数。

#### 向函数传递参数

我们可以像调用其它命令那样给函数提供参数。我们可以在函数里使用美元 `$` 符号访问到这些参数。例如，`$1` 表示第一个参数，`$2` 代表第二个参数，以此类推。

让我们修改下之前的函数，让它以参数的形式接收信息。修改后的函数就像这样：

```
function print_msg {
    echo "Hello $1"
}
```

在上面的函数中我们使用 `$1` 符号访问第一个参数。让我们执行这个函数：

```
$ print_msg "LinuxTechi"
```

执行完后，生成如下信息：

```
Hello LinuxTechi
```

#### 从函数中返回数值

跟其它编程语言一样，Bash 提供了返回语句让我们可以向调用者返回一些数值。让我们举例说明：

```
function func_return_value {
    return 10
}
```

上面的函数向调用者返回 `10`。让我们执行这个函数：

```
$ func_return_value
$ echo "Value returned by function is: $?"
```

当你执行完，将会产生如下的输出结果：

```
Value returned by function is: 10
```

**提示**：在 Bash 中使用 `$?` 去获取函数的返回值。

### 函数技巧

目前我们已经对 Bash 中的函数有了一些了解。现在让我们创建一些非常有用的 Bash 函数，它们可以让我们的生活变得更加轻松。

#### Logger

让我们创建一个 `logger` 函数，它可以输出带有日期和时间的 log 信息。

```
function log_msg {
    echo "[`date '+ %F %T'` ]: $@"
}
```

执行这个函数：

```
$ log_msg "This is sample log message"
```

执行完，就会生成如下信息：

```
[ 2018-08-16 19:56:34 ]: This is sample log message
```

#### 显示系统信息

让我们创建一个显示 GNU/Linux 信息的函数

```
function system_info {
    echo "### OS information ###"
    lsb_release -a

    echo
    echo "### Processor information ###"
    processor=`grep -wc "processor" /proc/cpuinfo`
    model=`grep -w "model name" /proc/cpuinfo  | awk -F: '{print $2}'`
    echo "Processor = $processor"
    echo "Model     = $model"

    echo
    echo "### Memory information ###"
    total=`grep -w "MemTotal" /proc/meminfo | awk '{print $2}'`
    free=`grep -w "MemFree" /proc/meminfo | awk '{print $2}'`
    echo "Total memory: $total kB"
    echo "Free memory : $free kB"
}
```

执行完后会生成以下信息：

```
### OS information ###
No LSB modules are available.
Distributor ID:           Ubuntu
Description:   Ubuntu 18.04.1 LTS
Release:         18.04
Codename:    bionic

### Processor information ###
Processor = 1
Model     =  Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz

### Memory information ###
Total memory: 4015648 kB
Free memory : 2915428 kB
```

#### 在当前目录下查找文件或者目录

下面的函数从当前目录下查找文件或者目录：

```
function search {
    find . -name $1
}
```

让我们使用下面的命令查找 `dir4` 这个目录：

```
$ search dir4
```

当你执行完命令后，将会产生如下输出：

```
./dir1/dir2/dir3/dir4
```

#### 数字时钟

下面的函数在终端里创建了一个简单的数字时钟：

```
function digital_clock {
    clear
    while [ 1 ]
    do
        date +'%T'
        sleep 1
        clear
    done
}
```

### 函数库

库是函数的集合。将函数定义在文件里并在当前环境中导入那个文件，这样可以创建函数库。

假设我们已经在 `utils.sh` 中定义好了所有函数，接着在当前的环境下使用下面的命令导入函数：

```
$ source utils.sh
```

之后你就可以像调用其它 Bash 命令那样执行库中任何的函数了。

### 总结

本文我们讨论了诸多可以提升效率的实用技巧。我希望这篇文章能够启发你去创造自己的技巧。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/define-use-functions-linux-shell-script/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[LuuMing](https://github.com/LuuMing)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
[1]: https://www.linuxtechi.com/wp-content/uploads/2018/08/Functions-Linux-Shell-Script.jpg
