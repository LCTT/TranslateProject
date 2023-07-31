[#]: subject: "Shell Scripting is Still Going Strong"
[#]: via: "https://www.opensourceforu.com/2022/05/shell-scripting-is-still-going-strong/"
[#]: author: "Bipin Patwardhan https://www.opensourceforu.com/author/bipin-patwardhan/"
[#]: collector: "lkxed"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16049-1.html"

探索 Shell 脚本的威力
======

> 本文章向你介绍了 Shell 脚本的基础知识以及其在日常生活中的重要性。
 
![][0]

当我们登录到一个 UNIX/Linux 系统时，我们首先注意到的是闪烁的光标和 `$` 符号之间的空格。这就是 Shell（交互界面）。多年来，它一直是一种无处不在（有时甚至是唯一的）与计算机交互的界面。在图形用户界面（GUI）出现和流行之前，终端和 Shell 是唯一的机制，可以让计算机按照我们的意图进行操作。乍一看，我们可能会想知道 Shell 的作用，除了将命令传递给底层操作系统以进行执行之外。我们中的大多数人熟悉像 `ls`（用于列出目录内容），`cd`（用于更改当前目录）等命令。通过 Shell，我们可以执行这些命令。Shell 理解我们输入的文本 - 将其转换为标记 - 然后在操作系统上执行这些标记。

### 不同的 Shell 变种

最初，终端使用了朴素的 Bourne Shell（即 Sh）。多年来，许多不同的 Shell 变种被开发出来和使用。其中一些流行的包括 C Shell（Csh） 和 Korn Shell（Ksh）。Sh 在一段时间内不再受欢迎，但通过其最新的化身 —— Bourne Again Shell（Bash），它再次流行起来。

### Shell 实际上是做什么的？

Shell 是操作系统（OS）和用户之间的直接接口。通过使用命令和应用程序来使用计算机上安装的工具，我们可以使计算机按照我们的意愿工作。一些命令是安装在操作系统上的应用程序，而某些命令则是直接内置在 Shell 中的。在 Bash 中内置的一些命令包括 `clear`、`cd`、`eval` 和 `exec`，还有 `ls` 和 `mkdir` 这样的应用程序。内置在 Shell 中的命令因 Shell 而异。

在本文中，我们将涵盖与 Bash 相关的几个方面。

### 更多关于 Shell 的内容

我们中的大多数人都用过像 `ls`、`cd` 和 `mkdir` 这样的命令。当我们在一个目录上运行 `ls -l` 命令时，该目录中的所有子目录和文件都会在屏幕上列出。如果数量很大，屏幕会滚动。如果终端不支持滚动条（在很多年里都是如此），则无法查看已滚动过的条目。为了克服这个问题，我们使用像 `more` 和 `less` 这样的命令。它们允许我们逐页查看输出。通常使用的命令是：

```
ls -l | less
```

在这里 Shell 是在做什么？看起来像是单个命令，实际上是 `ls` 和 `less` 两个命令依次执行。管道符（`|`）将这两个程序连接起来，但连接由 Shell 管理。由于有了管道符，Shell 连接了这两个程序——它将 `ls` 命令的标准输出连接到 `less` 的标准输入（stdin）。管道功能使我们能够将任何程序的输出作为另一个程序的输入提供，而无需对程序进行任何更改。这是许多 UNIX/Linux 应用程序的理念——保持应用程序简单，然后将许多应用程序组合在一起以实现最终结果，而不是让一个程序做很多事情。

如果需要，我们可以将 `ls` 的输出重定向到文件中，然后使用 `vi` 查看它。为此，我们使用以下命令：

```
ls -l > /tmp/my_file.txt
vi /tmp/my_file.txt
```

在这种情况下，`ls` 的输出被重定向到一个文件中。这由 Shell 进行管理，它理解 `>` 符号表示重定向。它将其后面的标记视为文件。

### 使用 Shell 自动化

结合命令的能力是使用 Shell 命令创建自动化脚本的关键要素之一。在我最近的项目中，我们使用集群模式执行 Python/Spark（PySpark）应用程序。每个应用程序执行了许多结构化查询语言（SQL）语句 - SparkSQL。为了跟踪应用程序的进展，我们会打印有关正在执行的 SQL 的详细信息。这样可以让我们保留应用程序中正在发生的情况的日志。由于应用程序在集群模式下执行，要查看日志，我们必须使用以下 `yarn` 命令：

```
yarn log –applicationId [application_id]
```

在大多数情况下，应用程序生成的日志非常大。因此，我们通常将日志导入到 `less` 中，或将其重定向到一个文件中。我们使用的命令是：

```
yarn log –aplicationId [application_id] | less
```

我们的开发团队有 40 人。每个人都必须记住这个命令。为了简化操作，我将这个命令转换成了一个 Bash 脚本。为此，我创建了一个以 `.sh` 为扩展名的文件。在 UNIX 和 Linux 系统上，文件扩展名并不重要。只要文件是可执行的，它就能工作。扩展名在 MS Windows 上有意义。

### 需要记住的重要事项

Shell 是一个解释器。这意味着它会逐行读取程序并执行它。这种方法的限制在于错误（如果有）在事先无法被识别。直到解释器读取和执行它们时，错误才会被识别出来。简而言之，假如我们有一个在前 20 行完美执行，但在第 21 行由于语法错误而失败的 Shell 程序。当脚本在第 21 行失败时，Shell 不会回滚/撤销之前的步骤。当发生这样的情况时，我们必须纠正脚本并从第一行开始执行。因此，例如，如果在遇到错误之前删除了几个文件，脚本的执行将停止，而文件将永远消失。

我创建的脚本是：

```
#!/bin/bash
yarn log –applicationId 123 | less
```

…其中 123 是应用程序的 ID。

第一行的前两个字符是特殊字符（“释伴”）。它们告诉脚本这是一个可执行文件，并且该行包含要用于执行的程序的名称。脚本的其余行传递给所提到的程序。在这个例子中，我们将执行 Bash。即使包含了第一行，我们仍然必须使用以下命令对文件应用执行权限：

```
chmod +x my_file.sh
```

在给文件设置了执行权限之后，我们可以如下执行它：

```
./my_file.sh
```

如果我们没有给文件设置执行权限，我们可以使用以下命令执行该脚本：

```
sh ./my_file.sh
```

### 传递参数

你很快就会意识到，这样的脚本很方便，但立即变得无用。每次执行 Python/Spark 应用程序时，都会生成一个新的 ID。因此，对于每次运行，我们都必须编辑文件并添加新的应用程序 ID。这无疑降低了脚本的可用性。为了提高其可用性，我们应该将应用程序 ID 作为参数传递：

```
#!/bin/bash
yarn –log -applicationId ${1} | less
```

我们需要这样执行脚本：

```
./show_log.sh 123
```

脚本将执行 `yarn` 命令，获取应用程序的日志并允许我们查看它。

如果我们想将输出重定向到一个文件中怎么办？没问题。我们可以将输出重定向到一个文件而不是发送给 `less`：

```
#!/bin/bash
ls –l ${1} > ${2}
view ${2}
```

要运行脚本，我们需要提供两个参数，命令变为：

```
./my_file.sh /tmp /tmp/listing.txt
```

当执行时，`$1` 将绑定到 `/tmp`，`$2` 将绑定到 `/tmp/listing.txt`。对于 Shell，参数从一到九命名。这并不意味着我们不能将超过九个参数传递给脚本。我们可以，但这是另一篇文章的主题。你会注意到，我将参数命名为 `${1}` 和 `${2}`，而不是 `$1` 和 `$2`。将参数名称封闭在花括号中是一个好习惯，因为它使我们能够无歧义地将参数作为较长变量的一部分组合起来。例如，我们可以要求用户将文件名作为参数，并使用它来形成一个更大的文件名。例如，我们可以将 `$1` 作为参数，创建一个新的文件名为 `${1}_student_names.txt`。

### 使脚本更健壮

如果用户忘记提供参数怎么办？Shell 允许我们检查这种情况。我们将脚本修改如下：

```
#!/bin/bash
if [ -z "${2}" ]; then
  echo "file name not provided"
  exit 1
fi
if [ -z "${1}" ]; then
  echo "directory name not provided"
  exit 1
fi
DIR_NAME=${1}
FILE_NAME=${2}
ls -l ${DIR_NAME} > /tmp/${FILE_NAME}
view /tmp/${FILE_NAME}
```

在这个程序中，我们检查是否传递了正确的参数。如果未传递参数，我们将退出脚本。你会注意到，我以相反的顺序检查参数。如果我们在检查第一个参数存在之前检查第二个参数的存在，如果只传递了一个参数，脚本将进行到下一步。虽然可以按递增顺序检查参数的存在，但我最近意识到，从九到一检查会更好，因为我们可以提供适当的错误消息。你还会注意到，参数已分配给变量。参数一到九是位置参数。将位置参数分配给具名参数可以在出现问题时更容易调试脚本。

### 自动化备份

我自动化的另一个任务是备份。在开发的初期阶段，我们没有使用版本控制系统。但我们需要有一个机制来定期备份。因此，最好的方法是编写一个 Shell 脚本，在执行时将所有代码文件复制到一个单独的目录中，将它们压缩，并使用日期和时间作为后缀来上传到 HDFS。我知道，这种方法不如使用版本控制系统那样清晰，因为我们存储了完整的文件，查找差异仍然需要使用像 `diff` 这样的程序；但它总比没有好。尽管我们最终没有删除代码文件，但团队确实删除了存储助手脚本的 `bin` 目录！！！而且对于这个目录，我没有备份。我别无选择，只能重新创建所有的脚本。

一旦建立了源代码控制系统，我很容易将备份脚本扩展到除了之前上传到 HDFS 的方法之外，还可以将文件上传到版本控制系统。

### 总结

如今，像 Python、Spark、Scala 和 Java 这样的编程语言很受欢迎，因为它们用于开发与人工智能和机器学习相关的应用程序。尽管与 Shell 相比，这些语言更强大，但“不起眼”的 Shell 提供了一个即用即得的平台，让我们能够创建辅助脚本来简化我们的日常任务。Shell 是相当强大的，尤其是因为我们可以结合操作系统上安装的所有应用程序的功能。正如我在我的项目中发现的那样，即使经过了几十年，Shell 脚本仍然非常强大。我希望我已经说服你尝试一下了。

### 最后一个例子

Shell 脚本确实非常方便。考虑以下命令：

```
spark3-submit --queue pyspark --conf "spark.yarn.principal=abcd@abcd.com" --conf "spark.yarn.keytab=/keytabs/abcd.keytab" --jars /opt/custom_jars/abcd_1.jar --deploy-mode cluster --master yarn $*
```

我们要求在执行 Python/Spark 应用程序时使用此命令。现在想象一下，这个命令必须每天被一个由 40 个人组成的团队多次使用。大多数人会在记事本中复制这个命令，每次需要使用时，会将其从记事本中复制并粘贴到终端中。如果复制粘贴过程中出现错误怎么办？如果有人错误使用了参数怎么办？我们如何调试使用的是哪个命令？查看历史记录并没有太多帮助。

为了让团队能够简单地执行 Python/Spark 应用程序，我们可以创建一个 Bash Shell 脚本，如下所示：

```
#!/bin/bash
SERVICE_PRINCIPAL=abcd@abcd.com
KEYTAB_PATH=/keytabs/abcd.keytab
MY_JARS=/opt/custom_jars/abcd_1.jar
MAX_RETRIES=128
QUEUE=pyspark
MASTER=yarn
MODE=cluster

spark3-submit --queue ${QUEUE} --conf "spark.yarn.principal=${SERVICE_PRINCIPAL}" --conf "spark.yarn.keytab=${KEYTAB_PATH}" --jars ${MY_JARS} --deploy-mode ${MODE} --master ${MASTER} $*
```

这展示了一个 Shell 脚本的强大之处，让我们的生活变得简单。根据你的需求，你可以尝试更多的命令和脚本，并进一步探索。

*（题图：MJ/f32880e8-0cdc-4897-8a1c-242c131111bf）*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/shell-scripting-is-still-going-strong/

作者：[Bipin Patwardhan][a]
选题：[lkxed][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/bipin-patwardhan/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Penguin-with-linux-command.jpg
[0]: https://img.linux.net.cn/data/attachment/album/202307/31/070953kv0kdvld33h55uk5.jpg