[#]: subject: "How to Add Comments in Bash Scripts"
[#]: via: "https://itsfoss.com/bash-comments/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Bash 脚本中添加注释
======

在 bash 脚本中添加注释是保持代码整洁且易于理解的最有效方法之一。

你可能会问为什么。

假设你的脚本包含一个复杂的正则表达式或多个复杂的代码块，在这种情况下，你可以添加注释，以便其他开发人员或你可以了解该代码块的含义。

注释掉部分代码也有助于调试脚本。

在本教程中，我将引导你了解在 bash 脚本中添加注释的三种方法：

   * 单行注释
   * 行内评论
   * 多行注释



那么让我们从第一个开始。

### bash 中的单行注释

要添加单行注释，你必须将 hashtag (#) 放在行的开头并编写注释。

这是一个简单的例子：

````

    #!/bin/bash
    # This is a comment
    echo "Hello, World!"

````

执行时，注释将被忽略，当我执行上面的命令时，它看起来像这样：

![][1]

💡

# 注释规则的唯一例外是脚本开头的 #!/bin/bash 行。它称为[释伴][2]，用于指定运行脚本时要使用的解释器。有不同的 shell，语法也可能不同。因此，一个好的做法是指定脚本是为哪个 shell 编写的。例如，如果是 ksh，则可以使用 #!/bin/ksh

### bash 脚本中的内联注释

或者，你可以将注释放在代码块内以记录该特定行的用途。

🚧

# 之后的任何内容在该行结束之前都不会执行，因此请确保在代码末尾添加注释。

这是一个简单的例子：

````

    #!/bin/bash
    echo "Hello, World!" #Prints hello world

````

![][3]

### bash 中的多行注释

🚧

Bash 中没有内置的多行注释功能。但是，有一些解决方法可以实现多行注释效果。

顾名思义，bash 脚本中的多行注释允许你在多行中编写注释，或者通过将它们放在多行注释部分来阻止执行代码块：

   1. 在每行的开头使用#
   2. [冒号表示法][4]（使用冒号后跟单引号）
   3. Here 文档（使用 << 后跟分隔符）



那么让我们从第一个开始。

#### 1\. 对块注释的每一行使用 #

如果你的目的是解释脚本的一部分，我建议使用此方法。毕竟，# 才是真正的注释功能。

这也是许多开发人员使用的方法。

假设你必须在一开始就解释脚本的用途、作者信息或许可信息。你可以这样写：

```

    #!/bin/bash

    ######################################
    ## This script is used for scanning ##
    ## local network                    ##
    ## Licensed under GPL 2.0           ##
    ######################################

    rest of the bash script code

```

当你知道 bash 脚本的行为方式时这不错。如果你正在调试 bash 脚本并希望隐藏部分脚本，则在所需代码的每一行开头添加 # 并在调试后将其删除是一项耗时的任务。

接下来的两节将帮助你做到这一点。

#### 2\. 冒号表示法

要使用冒号表示法，请在 `: '` 和结束的 `'` 之间编写块注释，如下所示：

```

    #!/bin/bash

    : '
    This is how you can use colon notation
    And this line too will be ignored
    '
    echo "GOODBYE"

```

当你执行上面的脚本时，它应该只打印 GOODBYE。

![][5]

#### 2\. Here 文档

到目前为止，这是在 bash 中编写多行注释的最流行的方法，你可以使用 `<<` 后跟分隔符（一组用于指定注释开始和结束的字符）。

使用方法如下：

```

    #!/bin/bash

    <<DELIMITER
    Comment line 1
    Comment line 2
    DELIMITER

    echo "Hello, World!"

```

还困惑吗？ 这是一个简单的例子：

```

    #!/bin/bash

    <<COMMENT
    This is a multi-line comment using a here document.
    You can add as many lines as you want between <<COMMENT and the terminating keyword.
    This block won't be executed by the shell.
    COMMENT

    echo "Hello, World!"

```

在上面的示例中，我使用了 `COMMENT` 作为分隔符，但你可以使用任何内容，但要确保它从注释中脱颖而出，否则会造成混乱。

当我执行上面的脚本时，它给出了以下输出：

![][6]

正如你所看到的，它忽略了 <<COMMENT 中的所有内容

### 从头开始学习 bash！

如果你打算从头开始学习 bash 或者想浏览所有基础知识，我们为你制作了详细的指南：

![][7]

我希望本指南对你有所帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-comments/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/10/Use-single-line-comments-in-bash.png
[2]: https://linuxhandbook.com/shebang/
[3]: https://itsfoss.com/content/images/2023/10/How-to-use-the-single-line-comments-in-bash.png
[4]: https://stackoverflow.com/questions/3224878/what-is-the-purpose-of-the-colon-gnu-bash-builtin
[5]: https://itsfoss.com/content/images/2023/10/Use-multi-line-comments-using-colon-notation-in-bash.png
[6]: https://itsfoss.com/content/images/2023/10/Use-multi-line-comments-in-bash-using----and-delimeter.png
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
