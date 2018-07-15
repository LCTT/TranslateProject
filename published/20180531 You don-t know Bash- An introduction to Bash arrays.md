你所不了解的 Bash：关于 Bash 数组的介绍
======

> 进入这个古怪而神奇的 Bash 数组的世界。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S)

尽管软件工程师常常使用命令行来进行各种开发，但命令行中的数组似乎总是一个模糊的东西（虽然不像正则操作符 `=~` 那么复杂隐晦）。除开隐晦和有疑问的语法，[Bash][1] 数组其实是非常有用的。

### 稍等，这是为什么？

写 Bash 相关的东西很难，但如果是写一篇像手册那样注重怪异语法的文章，就会非常简单。不过请放心，这篇文章的目的就是让你不用去读该死的使用手册。

#### 真实（通常是有用的）示例

为了这个目的，想象一下真实世界的场景以及 Bash 是怎么帮忙的：你正在公司里面主导一个新工作，评估并优化内部数据管线的运行时间。首先，你要做个参数扫描分析来评估管线使用线程的状况。简单起见，我们把这个管道当作一个编译好的 C++ 黑盒子，这里面我们能够调整的唯一的参数是用于处理数据的线程数量：`./pipeline --threads 4`。

### 基础

我们首先要做的事是定义一个数组，用来容纳我们想要测试的 `--threads` 参数：

```
allThreads=(1 2 4 8 16 32 64 128)
```

本例中，所有元素都是数字，但参数并不一定是数字，Bash 中的数组可以容纳数字和字符串，比如 `myArray=(1 2 "three" 4 "five")` 就是个有效的表达式。就像 Bash 中其它的变量一样，确保赋值符号两边没有空格。否则 Bash 将会把变量名当作程序来执行，把 `=` 当作程序的第一个参数。

现在我们初始化了数组，让我们解析它其中的一些元素。仅仅输入 `echo $allThreads` ，你能发现，它只会输出第一个元素。

要理解这个产生的原因，需要回到上一步，回顾我们一般是怎么在 Bash 中输出变量。考虑以下场景：

```
type="article"
echo "Found 42 $type"
```

假如我们得到的变量 `$type` 是一个单词，我们想要添加在句子结尾一个 `s`。我们无法直接把 `s` 加到 `$type` 里面，因为这会把它变成另一个变量，`$types`。尽管我们可以利用像 `echo "Found 42 "$type"s"` 这样的代码形变，但解决这个问题的最好方法是用一个花括号：`echo "Found 42 ${type}s"`，这让我们能够告诉 Bash 变量名的起止位置（有趣的是，JavaScript/ES6 在 [template literals][2] 中注入变量和表达式的语法和这里是一样的）

事实上，尽管 Bash 变量一般不用花括号，但在数组中需要用到花括号。这反而允许我们指定要访问的索引，例如 `echo ${allThreads[1]}` 返回的是数组中的第二个元素。如果不写花括号，比如 `echo $allThreads[1]`，会导致 Bash 把 `[1]` 当作字符串然后输出。

是的，Bash 数组的语法很怪，但是至少他们是从 0 开始索引的，不像有些语言（说的就是你，`R` 语言）。

### 遍历数组

上面的例子中我们直接用整数作为数组的索引，我们现在考虑两种其他情况：第一，如果想要数组中的第 `$i` 个元素，这里 `$i` 是一个代表索引的变量，我们可以这样 `echo ${allThreads[$i]}` 解析这个元素。第二，要输出一个数组的所有元素，我们把数字索引换成 `@` 符号（你可以把 `@` 当作表示 `all` 的符号）：`echo ${allThreads[@]}`。

#### 遍历数组元素

记住上面讲过的，我们遍历 `$allThreads` 数组，把每个值当作 `--threads` 参数启动管线：

```
for t in ${allThreads[@]}; do
  ./pipeline --threads $t
done
```

#### 遍历数组索引

接下来，考虑一个稍稍不同的方法。不遍历所有的数组元素，我们可以遍历所有的索引：

```
for i in ${!allThreads[@]}; do
  ./pipeline --threads ${allThreads[$i]}
done
```

一步一步看：如之前所见，`${allThreads[@]}` 表示数组中的所有元素。前面加了个感叹号，变成 `${!allThreads[@]}`，这会返回数组索引列表（这里是 0 到 7）。换句话说。`for` 循环就遍历所有的索引 `$i` 并从 `$allThreads` 中读取第 `$i` 个元素，当作 `--threads` 选项的参数。

这看上去很辣眼睛，你可能奇怪为什么我要一开始就讲这个。这是因为有时候在循环中需要同时获得索引和对应的值，例如，如果你想要忽视数组中的第一个元素，使用索引可以避免额外创建在循环中累加的变量。

### 填充数组

到目前为止，我们已经能够用给定的 `--threads` 选项启动管线了。现在假设按秒计时的运行时间输出到管线。我们想要捕捉每个迭代的输出，然后把它保存在另一个数组中，因此我们最终可以随心所欲的操作它。

#### 一些有用的语法

在深入代码前，我们要多介绍一些语法。首先，我们要能解析 Bash 命令的输出。用这个语法可以做到：`output=$( ./my_script.sh )`，这会把命令的输出存储到变量 `$output` 中。

我们需要的第二个语法是如何把我们刚刚解析的值添加到数组中。完成这个任务的语法看起来很熟悉：

```
myArray+=( "newElement1" "newElement2" )
```

#### 参数扫描

万事具备，执行参数扫描的脚步如下：

```
allThreads=(1 2 4 8 16 32 64 128)
allRuntimes=()
for t in ${allThreads[@]}; do
  runtime=$(./pipeline --threads $t)
  allRuntimes+=( $runtime )
done
```

就是这个了！

### 还有什么能做的？

这篇文章中，我们讲过使用数组进行参数扫描的场景。我敢保证有很多理由要使用 Bash 数组，这里就有两个例子：

#### 日志警告

本场景中，把应用分成几个模块，每一个都有它自己的日志文件。我们可以编写一个 cron 任务脚本，当某个模块中出现问题标志时向特定的人发送邮件：

```
# 日志列表，发生问题时应该通知的人
logPaths=("api.log" "auth.log" "jenkins.log" "data.log")
logEmails=("jay@email" "emma@email" "jon@email" "sophia@email")

# 在每个日志中查找问题标志
for i in ${!logPaths[@]};
do
  log=${logPaths[$i]}
  stakeholder=${logEmails[$i]}
  numErrors=$( tail -n 100 "$log" | grep "ERROR" | wc -l )

  # 如果近期发现超过 5 个错误，就警告负责人
  if [[ "$numErrors" -gt 5 ]];
  then
    emailRecipient="$stakeholder"
    emailSubject="WARNING: ${log} showing unusual levels of errors"
    emailBody="${numErrors} errors found in log ${log}"
    echo "$emailBody" | mailx -s "$emailSubject" "$emailRecipient"
  fi
done
```

#### API 查询

如果你想要生成一些分析数据，分析你的 Medium 帖子中用户评论最多的。由于我们无法直接访问数据库，SQL 不在我们考虑范围，但我们可以用 API！

为了避免陷入关于 API 授权和令牌的冗长讨论，我们将会使用 [JSONPlaceholder][3]，这是一个面向公众的测试服务 API。一旦我们查询每个帖子，解析出每个评论者的邮箱，我们就可以把这些邮箱添加到我们的结果数组里：

```
endpoint="https://jsonplaceholder.typicode.com/comments"
allEmails=()

# 查询前 10 个帖子
for postId in {1..10};
do
  # 执行 API 调用，获取该帖子评论者的邮箱
  response=$(curl "${endpoint}?postId=${postId}")
  
  # 使用 jq 把 JSON 响应解析成数组
  allEmails+=( $( jq '.[].email' <<< "$response" ) )
done
```

注意这里我是用  [jq 工具][4] 从命令行里解析 JSON 数据。关于 `jq` 的语法超出了本文的范围，但我强烈建议你了解它。

你可能已经想到，使用 Bash 数组在数不胜数的场景中很有帮助，我希望这篇文章中的示例可以给你思维的启发。如果你从自己的工作中找到其它的例子想要分享出来，请在帖子下方评论。

### 请等等，还有很多东西！

由于我们在本文讲了很多数组语法，这里是关于我们讲到内容的总结，包含一些还没讲到的高级技巧：

| 语法 | 效果 |
|:--|:--|
| `arr=()` | 创建一个空数组 |
| `arr=(1 2 3)` | 初始化数组 |
| `${arr[2]}` | 取得第三个元素 |
| `${arr[@]}` | 取得所有元素 |
| `${!arr[@]}` | 取得数组索引 |
| `${#arr[@]}` | 计算数组长度 |
| `arr[0]=3` | 覆盖第 1 个元素 |
| `arr+=(4)` | 添加值 |
| `str=$(ls)` | 把 `ls` 输出保存到字符串 |
| `arr=( $(ls) )` | 把 `ls` 输出的文件保存到数组里 |
| `${arr[@]:s:n}` | 取得从索引 `s` 开始的 `n` 个元素 |

### 最后一点思考

正如我们所见，Bash 数组的语法很奇怪，但我希望这篇文章让你相信它们很有用。只要你理解了这些语法，你会发现以后会经常使用 Bash 数组。

#### Bash 还是 Python？

问题来了：什么时候该用 Bash 数组而不是其他的脚本语法，比如 Python？

对我而言，完全取决于需求——如果你可以只需要调用命令行工具就能立马解决问题，你也可以用 Bash。但有些时候，当你的脚本属于一个更大的 Python 项目时，你也可以用 Python。

比如，我们可以用 Python 来实现参数扫描，但我们只用编写一个 Bash 的包装：

```
import subprocess

all_threads = [1, 2, 4, 8, 16, 32, 64, 128]
all_runtimes = []

# 用不同的线程数字启动管线
for t in all_threads:
  cmd = './pipeline --threads {}'.format(t)

  # 使用子线程模块获得返回的输出
  p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
  output = p.communicate()[0]
  all_runtimes.append(output)
```

由于本例中没法避免使用命令行，所以可以优先使用 Bash。

#### 羞耻的宣传时间

如果你喜欢这篇文章，这里还有很多类似的文章！ [在此注册，加入 OSCON][5]，2018 年 7 月 17 号我会在这做一个主题为 [你所不了解的 Bash][6]  的在线编码研讨会。没有幻灯片，不需要门票，只有你和我在命令行里面敲代码，探索 Bash 中的奇妙世界。

本文章由 [Medium] 首发，再发布时已获得授权。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

作者：[Robert Aboukhalil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[BriFuture](https://github.com/BriFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/robertaboukhalil
[1]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks
[2]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
[3]:https://github.com/typicode/jsonplaceholder
[4]:https://stedolan.github.io/jq/
[5]:https://conferences.oreilly.com/oscon/oscon-or
[6]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/detail/67166
[7]:https://medium.com/@robaboukhalil/the-weird-wondrous-world-of-bash-arrays-a86e5adf2c69
