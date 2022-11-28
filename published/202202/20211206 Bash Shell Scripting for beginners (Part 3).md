[#]: subject: "Bash Shell Scripting for beginners (Part 3)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-3"
[#]: author: "Matthew Darnell https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14313-1.html"

Bash Shell 脚本新手指南（三）
======

![][1]

欢迎来到面向初学者的 Bash Shell 脚本知识第三部分。这最后一篇文章将再来学习一些知识点，这些将使你为持续的个人发展做好准备。它将涉及到函数、用 `if`/`elif` 语句进行比较，并以研究 `while` 循环作为结尾。

### 函数

让我们从一个看似困难但其实很简单的基本概念开始，即函数。把它看作是一种简单的方法，可以把脚本中被反复使用的部分放到一个可重复使用的组中。你在本系列第一篇或第二篇文章中所做的任何事情都可以放在一个函数中。因此，让我们把一个函数放到我们的 `learnToScript.sh` 文件中。让我指出几个关键点。你将需要为你的函数起一个名字、一对小括号，以及用大括号包围放在你的函数中的命令。

```
#!/bin/bash

#A function to return an echo statement.
helloFunc() {
        echo "Hello from a function."
}

#invoke the first function helloFunc()
helloFunc
```

你会看到如下输出结果：

```
[zexcon@fedora ~]$ ./learnToScript.sh
Hello from a function.
[zexcon@fedora ~]$
```

函数是重复使用一组命令的好方法，但如果你能使它们在每次使用时对不同的数据进行操作，它们会更加有用。这就要求你在每次调用函数时提供数据，这称为参数。

要提供参数，你只需在调用函数时把它们加在函数名称后面。为了使用你提供的数据，你在函数命令中使用位置来引用它们。它们将被命名为 `$1`、`$2`、`$3`，以此类推，这取决于你的函数将需要多少个参数。

让我们修改上一个例子来帮助更好地理解这个问题。

```
#!/bin/bash

#A function to return an echo statement.
helloFunc() {
        echo "Hello from a function."
        echo $1
        echo $2
        echo "You gave me $# arguments"
}

#invoke the function helloFunc()
helloFunc "How is the weather?" Fine
```

输出如下：

```
Hello from a function.
How is the weather?
Fine
You gave me 2 arguments
```

输出中发生的事情是 `helloFunc()` 在每一行都做了一个回显。首先它回显了一个 `Hello from a function`，然后它继续回显变量 `$1` 的值，结果是你传递给 `helloFunc` 的 `"How is the weather?"`。然后它将继续处理变量 `$2`，并回显其值，这是你传递的第二个项目：`Fine`。该函数将以回显 `You gave me $# arguments` 结束。注意，第一个参数是一个用双引号括起来的单个字符串 `"How is the weather?"`。第二个参数 `Fine` 没有空格，所以不需要引号。

除了使用 `$1`、`$2` 等之外，你还可以通过使用变量 `$#` 来确定传递给函数的参数数量。这意味着你可以创建一个接受可变参数数量的函数。

关于 bash 函数的更多细节，网上有很多好的参考资料。[这里有一个可以让你入门的资料][2]。

我希望你能了解到函数如何在你的 bash 脚本中提供巨大的灵活性。

### 数值比较 []

如果你想进行数字比较，你需要在方括号 `[]` 中使用以下运算符之一：

- `-eq` （等于）
- `-ge` （等于或大于）
- `-gt` （大于）
- `-le` （小于或等于）
- `-lt` （小于）
- `-ne` （不相等）

因此，举例来说，如果你想看 12 是否等于或小于 25，可以像 `[ 12 -le 25 ]` 这样。当然，12 和 25 可以是变量。例如，`[ $twelve -le $twentyfive ]`。（LCTT 译注：注意保留方括号和判断语句间的空格）

### if 和 elif 语句

那么让我们用数字比较来介绍 `if` 语句。Bash 中的 `if` 语句将以 `if` 开始, 以 `fi` 结束。`if` 语句 以 `if` 开始，然后是你想做的检查。在本例中，检查的内容是变量 `numberOne` 是否等于 `1`。如果 `numberOne` 等于 `1`，将执行 `then` 语句，否则将执行 `else` 语句。

```
#!/bin/bash

numberTwelve=12

if [ $numberTwelve -eq 12 ]
then
        echo "numberTwelve is equal to 12"
elif [ $numberTwelve -gt 12 ]
then
        echo "numberTwelve variable is greater than 12"
else
        echo "neither of the statemens matched"
fi
```

输出如下：

```
[zexcon@fedora ~]$ ./learnToScript.sh
numberTwelve variable is equal to 12
```

你所看到的是 `if` 语句的第一行，它在检查变量的值是否真的等于 `12`。如果是的话，语句就会停止，并发出 `numberTwelve is equal to 12` 的回显，然后在 `fi` 之后继续执行你的脚本。如果变量大于 `12` 的话，就会执行 `elif` 语句，并在 `fi` 之后继续执行。当你使用 `if` 或 `if`/`elif` 语句时，它是自上而下工作的。当第一条语句是匹配的时候，它会停止并执行该命令，并在 `fi` 之后继续执行。

### 字符串比较 [[]]

这就是数字比较。那么字符串的比较呢？使用双方括号 `[[]]` 和以下运算符等于或不等于。（LCTT 译注：注意保留方括号和判断语句间的空格）

- `=` （相等）
- `!=` （不相等）

请记住，字符串还有一些其他的比较方法，我们这里不会讨论，但可以深入了解一下它们以及它们是如何工作的。

```
#!/bin/bash

#variable with a string
stringItem="Hello"

#This will match since it is looking for an exact match with $stringItem
if [[ $stringItem = "Hello" ]]
then
        echo "The string is an exact match."
else
        echo "The strings do not match exactly."
fi

#This will utilize the then statement since it is not looking for a case sensitive match
if [[ $stringItem = "hello" ]]
then
        echo "The string does match but is not case sensitive."
else
        echo "The string does not match because of the capitalized H."
fi
```

你将得到以下三行：

```
[zexcon@fedora ~]$ ./learnToScript.sh
The string is an exact match.
The string does not match because of the capitalized H.
[zexcon@fedora ~]$
```

### while 循环

在结束这个系列之前，让我们看一下循环。一个关于 `while` 循环的例子是：“当 1个数值 小于 10 时，在数值上加 1”，你继续这样做直到该判断语句不再为真。下面你将看到变量 `number` 设置为 `1`。在下一行，我们有一个 `while` 语句，它检查 `number` 是否小于或等于 `10`。在 `do` 和 `done` 之间包含的命令被执行，因为 `while` 的比较结果为真。所以我们回显一些文本，并在 `number` 的值上加 `1`。我们继续执行，直到 `while` 语句不再为真，它脱离了循环，并回显 `We have completed the while loop since $number is greater than 10.`。

```
#!/bin/bash

number=1

while [ $number -le 10 ]
do
        echo "We checked the current number is $number so we will increment once"
        ((number=number+1))
done
        echo "We have completed the while loop since $number is greater than 10."

```

`while` 循环的结果如下：

```
[zexcon@fedora ~]$ ./learnToScript.sh
We checked the current number is 1 so we will increment once
We checked the current number is 2 so we will increment once
We checked the current number is 3 so we will increment once
We checked the current number is 4 so we will increment once
We checked the current number is 5 so we will increment once
We checked the current number is 6 so we will increment once
We checked the current number is 7 so we will increment once
We checked the current number is 8 so we will increment once
We checked the current number is 9 so we will increment once
We checked the current number is 10 so we will increment once
We have completed the while loop since 11 is greater than 10.
[zexcon@fedora ~]$
```

正如你所看到的，实现这一目的所需的脚本量要比用 `if` 语句不断检查每个数字少得多。这就是循环的伟大之处，而 `while` 循环只是众多方式之一，它以不同的方式来满足你的个人需要。

### 总结

下一步是什么？正如文章所指出的，这是，面向 Bash Shell 脚本初学者的。希望我激发了你对脚本的兴趣或终生的热爱。我建议你去看看其他人的脚本，了解你不知道或不理解的地方。请记住，由于本系列每篇文章都介绍了数学运算、比较字符串、输出和归纳数据的多种方法，它们也可以用函数、循环或许多其他方法来完成。如果你练习所讨论的基础知识，你将会很开心地把它们与你还要学习的所有其他知识结合起来。试试吧，让我们在 Fedora Linux 世界里见。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-3

作者：[Matthew Darnell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/11/bash_shell_scripting_pt3-816x345.jpg
[2]: https://opensource.com/article/20/6/bash-functions
