如何在 Shell 脚本中执行语法检查调试模式
============================================================

我们开启了 Shell 脚本调试系列文章，先是解释了不同的调试选项，下面介绍[如何启用 Shell 调试模式][1]。

写完脚本后，建议在运行脚本之前先检查脚本中的语法，而不是查看它们的输出以确认它们是否正常工作。

在本系列的这一部分，我们将了解如何使用语法检查调试模式。记住我们之前在本系列的[第一部分][1]中解释了不同的调试选项，在这里，我们将使用它们来执行脚本调试。

### 启用 verbose 调试模式

在进入本指导的重点之前，让我们简要地探索下 **verbose 模式**。它可以用 `-v` 调试选项来启用，它会告诉 shell 在读取时显示每行。

要展示这个如何工作，下面是一个示例脚本来[批量将 PNG 图片转换成 JPG 格式][2]。

将下面内容输入（或者复制粘贴）到一个文件中。

```
#!/bin/bash
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
done
exit 0
```

接着保存文件，并用下面的命令使脚本可执行：

```
$ chmod +x script.sh
```

我们可以执行脚本并显示它被 Shell 读取到的每一行：

```
$ bash -v script.sh
```
[
 ![Display All Lines in Shell Script](http://www.tecmint.com/wp-content/uploads/2016/12/Show-Shell-Script-Lines.png) 
][3]

*显示shell脚本中的所有行*

### 在 Shell 脚本中启用语法检查调试模式

回到我们主题的重点，`-n` 激活语法检查模式。它会让 shell 读取所有的命令，但是不会执行它们，它（shell）只会检查语法。

一旦 shell 脚本中发现有错误，shell 会在终端中输出错误，不然就不会显示任何东西。

激活语法检查的命令如下：

```
$ bash -n script.sh
```

因为脚本中的语法是正确的，上面的命令不会显示任何东西。所以，让我们尝试删除结束 for 循环的 `done` 来看下是否会显示错误：

下面是修改过的含有 bug 的批量将 png 图片转换成 jpg 格式的脚本。

```
#!/bin/bash
#script with a bug
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
exit 0
```

保存文件，接着运行该脚本并执行语法检查：

```
$ bash -n script.sh
```
[
 ![Check Syntax in Shell Script](http://www.tecmint.com/wp-content/uploads/2016/12/Check-Syntax-in-Shell-Script.png) 
][4]

*检查 shell 脚本语法*

从上面的输出中，我们看到我们的脚本中有一个错误，for 循环缺少了一个结束的 `done` 关键字。shell 脚本从头到尾检查文件，一旦没有找到它（`done`），shell 会打印出一个语法错误：

```
script.sh: line 11: syntax error: unexpected end of file
```

我们可以同时结合 verbose 模式和语法检查模式：

```
$ bash -vn script.sh
```
[
 ![Enable Verbose and Syntax Checking in Script](http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Verbose-and-Syntax-Checking-in-Script.png) 
][5]

*在脚本中同时启用 verbose 检查和语法检查*

另外，我们可以通过修改脚本的首行来启用脚本检查，如下面的例子：

```
#!/bin/bash -n
#altering the first line of a script to enable syntax checking
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
exit 0
```

如上所示，保存文件并在运行中检查语法：

```
$ ./script.sh
script.sh: line 12: syntax error: unexpected end of file
```

此外，我们可以用内置的 set 命令来在脚本中启用调试模式。

下面的例子中，我们只检查脚本中的 for 循环语法。

```
#!/bin/bash
#using set shell built-in command to enable debugging
#convert
#enable debugging
set -n
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
#disable debugging
set +n
exit 0
```

再一次保存并执行脚本：

```
$ ./script.sh 
```

总的来说，我们应该保证在执行 Shell 脚本之前先检查脚本语法以捕捉错误。

请在下面的反馈栏中，给我们发送关于这篇指导的任何问题或反馈。在这个系列的第三部分中，我们会解释并使用 shell 追踪调试模式。


--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是一个 Linux 及 F.O.S.S 热衷者，即将是 Linux 系统管理员、web 开发者，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并热心分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-syntax-in-shell-script/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/article-8028-1.html
[2]:https://linux.cn/article-8014-1.html
[3]:http://www.tecmint.com/wp-content/uploads/2016/12/Show-Shell-Script-Lines.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/Check-Syntax-in-Shell-Script.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Verbose-and-Syntax-Checking-in-Script.png
