如何在 Linux 或者 UNIX 下调试 Bash Shell 脚本
======

来自我的邮箱：

> 我写了一个 hello world 小脚本。我如何能调试运行在 Linux 或者类 UNIX 的系统上的 bash shell 脚本呢？

这是 Linux / Unix 系统管理员或新用户最常问的问题。shell 脚本调试可能是一项繁琐的工作（不容易阅读）。调试 shell 脚本有多种方法。

您需要传递 `-x` 或 `-v` 参数，以在 bash shell 中浏览每行代码。

[![如何在 Linux 或者 UNIX 下调试 Bash Shell 脚本][1]][1]

让我们看看如何使用各种方法调试 Linux 和 UNIX 上运行的脚本。

### -x 选项来调试脚本

用 `-x` 选项来运行脚本：

```
$ bash -x script-name
$ bash -x domains.sh
```
### 使用 set 内置命令

bash shell 提供调试选项，可以打开或关闭使用 [set 命令][2]：

*  `set -x` : 显示命令及其执行时的参数。
*  `set -v` : 显示 shell 输入行作为它们读取的

可以在 shell 脚本本身中使用上面的两个命令：

```
#!/bin/bash
clear
 
# turn on debug mode
set -x
for f in *
do
   file $f
done
# turn OFF debug mode
set +x
ls
# more commands
```

你可以代替 [标准释伴][3] 行：

```
#!/bin/bash
```

用以下代码（用于调试）：

```
#!/bin/bash -xv
```

### 使用智能调试功能

首先添加一个叫做 `_DEBUG` 的特殊变量。当你需要调试脚本的时候，设置 `_DEBUG` 为 `on`：

```
_DEBUG="on"
```

在脚本的开头放置以下函数：

```
function DEBUG()
{
 [ "$_DEBUG" == "on" ] &&  $@
}
```

现在，只要你需要调试，只需使用 `DEBUG` 函数如下：

```
DEBUG echo "File is $filename"
```

或者：

```
DEBUG set -x
Cmd1
Cmd2
DEBUG set +x
```

当调试完（在移动你的脚本到生产环境之前）设置 `_DEBUG` 为 `off`。不需要删除调试行。

```
_DEBUG="off" # 设置为非 'on' 的任何字符
```

示例脚本：

```
#!/bin/bash
_DEBUG="on"
function DEBUG()
{
 [ "$_DEBUG" == "on" ] &&  $@
}
 
DEBUG echo 'Reading files'
for i in *
do
  grep 'something' $i > /dev/null
  [ $? -eq 0 ] && echo "Found in $i file"
done
DEBUG set -x
a=2
b=3
c=$(( $a + $b ))
DEBUG set +x
echo "$a + $b = $c"
```

保存并关闭文件。运行脚本如下：

```
$ ./script.sh
```

输出：

```
Reading files
Found in xyz.txt file
+ a=2
+ b=3
+ c=5
+ DEBUG set +x
+ '[' on == on ']'
+ set +x
2 + 3 = 5
```

现在设置 `_DEBUG` 为 `off`（你需要编辑该文件）：

```
_DEBUG="off"
```

运行脚本：

```
$ ./script.sh
```

输出：

```
Found in xyz.txt file
2 + 3 = 5
```

以上是一个简单但非常有效的技术。还可以尝试使用 `DEBUG` 作为别名而不是函数。

### 调试 Bash Shell 的常见错误

Bash 或者 sh 或者 ksh 在屏幕上给出各种错误信息，在很多情况下，错误信息可能不提供详细的信息。

#### 跳过在文件上应用执行权限

当你 [编写你的第一个 hello world 脚本][4],您可能会得到一个错误，如下所示：

```
bash: ./hello.sh: Permission denied
```

设置权限使用 `chmod` 命令:

```
$ chmod +x hello.sh
$ ./hello.sh
$ bash hello.sh
```

#### 文件结束时发生意外的错误

如果您收到文件结束意外错误消息，请打开脚本文件，并确保它有打开和关闭引号。在这个例子中，`echo` 语句有一个开头引号，但没有结束引号：

```
#!/bin/bash

...
....

echo 'Error: File not found
                           ^^^^^^^
                           missing quote
```

还要确保你检查缺少的括号和大括号 `{}`：

```
#!/bin/bash
.....
[ ! -d $DIRNAME ] && { echo "Error: Chroot dir not found"; exit 1;
                                                                    ^^^^^^^^^^^^^
                                                                    missing brace }
...
```

#### 丢失像 fi，esac，;; 等关键字。

如果你缺少了结尾的关键字，如 `fi` 或 `;;` 你会得到一个错误，如 “XXX 意外”。因此，确保所有嵌套的 `if` 和 `case` 语句以适当的关键字结束。有关语法要求的页面。在本例中，缺少 `fi`：

```
#!/bin/bash
echo "Starting..."
....
if [ $1 -eq 10 ]
then
   if [ $2 -eq 100 ]
   then
      echo "Do something"
fi
 
for f in $files
do
  echo $f
done
 
# 注意 fi 丢失了
```

#### 在 Windows 或 UNIX 框中移动或编辑 shell 脚本

不要在 Linux 上创建脚本并移动到 Windows。另一个问题是编辑 Windows 10上的 shell 脚本并将其移动到 UNIX 服务器上。这将由于换行符不同而导致命令没有发现的错误。你可以使用下列命令 [将 DOS 换行转换为 CR-LF 的Unix/Linux 格式][5] ：

```
dos2unix my-script.sh
```

### 技巧

#### 技巧 1 - 发送调试信息输出到标准错误

[标准错误] 是默认错误输出设备，用于写所有系统错误信息。因此，将消息发送到默认的错误设备是个好主意：

```
# 写错误到标准输出
echo "Error: $1 file not found"
#
# 写错误到标准错误（注意 1>&2 在 echo 命令末尾）
#
echo "Error: $1 file not found" 1>&2
```

#### 技巧 2 - 在使用 vim 文本编辑器时，打开语法高亮

大多数现代文本编辑器允许设置语法高亮选项。这对于检测语法和防止常见错误如打开或关闭引号非常有用。你可以在不同的颜色中看到。这个特性简化了 shell 脚本结构中的编写，语法错误在视觉上截然不同。高亮不影响文本本身的意义，它只为你提示而已。在这个例子中，我的脚本使用了 vim 语法高亮：

[!如何调试 Bash Shell 脚本，在 Linux 或者 UNIX 使用 Vim 语法高亮特性][7]][7]

#### 技巧 3  - 使用 shellcheck 检查脚本

[shellcheck 是一个用于静态分析 shell 脚本的工具][8]。可以使用它来查找 shell 脚本中的错误。这是用 Haskell 编写的。您可以使用这个工具找到警告和建议。你可以看看如何在 Linux 或 类UNIX 系统上安装和使用 shellcheck 来改善你的 shell 脚本，避免错误和高效。

作者：Vivek Gite

作者是 nixCraft 创造者，一个经验丰富的系统管理员和一个练习 Linux 操作系统/ UNIX shell 脚本的教练。他曾与全球客户和各种行业，包括 IT，教育，国防和空间研究，以及非营利部门。关注他的 [推特][9]，[脸谱网][10]，[谷歌+ ][11]。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/debugging-shell-script.html

作者：[Vivek Gite][a]
译者：[zjon](https://github.com/zjon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/wp-content/uploads/2007/01/How-to-debug-a-bash-shell-script-on-Linux-or-Unix.jpg
[2]:https://bash.cyberciti.biz/guide/Set_command
[3]:https://bash.cyberciti.biz/guide/Shebang
[4]:https://www.cyberciti.biz/faq/hello-world-bash-shell-script/
[5]:https://www.cyberciti.biz/faq/howto-unix-linux-convert-dos-newlines-cr-lf-unix-text-format/
[6]:https://bash.cyberciti.biz/guide/Standard_error
[7]:https://www.cyberciti.biz/media/new/tips/2007/01/bash-vim-debug-syntax-highlighting.png
[8]:https://www.cyberciti.biz/programming/improve-your-bashsh-shell-script-with-shellcheck-lint-script-analysis-tool/
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz


