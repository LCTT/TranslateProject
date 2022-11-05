[#]: subject: "Infuse your awk scripts with Groovy"
[#]: via: "https://opensource.com/article/22/9/awk-groovy"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

为你的 awk 脚本注入 Groovy
======
Awk 和 Groovy 相辅相成，可以创建强大、有用的脚本。

最近我写了一个关于使用 Groovy 脚本来清理我的音乐文件中的标签的系列。我开发了一个[框架][2]，可以识别我的音乐目录的结构，并使用它来遍历内容文件。在该系列的最后一篇文章中，我从框架中分离出一个实用类，我的脚本可以用它来处理内容文件。

这个独立的框架让我想起了很多 awk 的工作方式。对于那些不熟悉 awk 的人来说，你学习下发表在 Opensource.com 的电子书 [awk 实用指南][3]。

我从 1984 年开始大量使用 awk，当时我们的小公司买了第一台”真正的“计算机，它运行的是 System V Unix。对我来说，awk 是非常完美的：它有关联内存——认为数组是由字符串而不是数字来索引的。它内置了正则表达式，尤其是在列处理中似乎专为处理数据而生，而且结构紧凑，易于学习。最后，它非常适合在 Unix 工作流使用，从标准输入或文件中读取数据并写入到输出，数据不需要经过其他的转换就出现在了输入流中。

说 awk 是我日常计算工具箱中的一个重要部分一点也不为过。然而，在我使用 awk 的过程中，有几件事让我感到不满意。

可能主要的问题是 awk 善于处理有分隔字段的数据，但很奇怪它不善于处理 CSV 文件，因为 CSV 文件的字段被引号包围时可以嵌入分隔符。另外，自 awk 发明以来，正则表达式已经有了很大的发展，我们需要记住两套正则表达式的语法规则，而这并不利于编写无 bug 的代码。[一套这样的规则已经很糟糕了][4]。

由于 awk 是一门简洁的语言，因此它缺少很多我认为有用的东西，比如更丰富的基础类型、结构体、switch 语句等等。

相比之下，Groovy 拥有这些能力：请参照 [OpenCSV 库][5]，它很擅长处理 CSV 文件、Java 正则表达式和强大的匹配运算符、丰富的基础类型、类、 switch 语句等等。

Groovy 所缺乏的是简单的面向管道的概念，即把要处理数据作为一个传入的流，以及把处理过的数据作为一个传出的流。

但我的音乐目录处理框架让我想到，也许我可以创建一个 Groovy 版本的 awk "引擎"。这就是我写这篇文章的目的。

### 安装 Java 和 Groovy

Groovy 是基于 Java 的，需要先安装 Java。最新的、合适的 Java 和 Groovy 版本可能都在你的 Linux 发行版的软件库中。Groovy 也可以按照 [Groovy主页][6]上的说明进行安装。对于 Linux 用户来说，一个不错的选择是 [SDKMan][7]，它可以用来获得多个版本的 Java、Groovy 和其他许多相关工具。在这篇文章中，我使用的是SDK的版本：

* Java: version 11.0.12-open of OpenJDK 11;
* Groovy: version 3.0.8.

### 使用 Groovy 创建 awk

这里的基本想法是将打开一个或多个文件进行处理、将每行分割成字段、以及提供对数据流的访问等复杂情况封装在三个部分：

* 在处理数据之前
* 在处理每行数据时
* 在处理完所有数据之后

我并不打算用 Groovy 来取代 awk。相反，我只是在努力实现我的典型用例，那就是：

* 使用一个脚本文件而不是在命令行写代码
* 处理一个或多个输入文件
* 设置默认的分隔符为 `|`，并基于这个分隔符分割所有行
* 使用 OpenCSV 完成分割工作（awk 做不到）

### 框架类

下面是 “awk 引擎”的 Groovy 类：

```
1 @Grab('com.opencsv:opencsv:5.6')
 2 import com.opencsv.CSVReader
 3 public class AwkEngine {
 4 // With admiration and respect for
 5 //     Alfred Aho
 6 //     Peter Weinberger
 7 //     Brian Kernighan
 8 // Thank you for the enormous value
 9 // brought my job by the awk
10 // programming language
11 Closure onBegin
12 Closure onEachLine
13 Closure onEnd

14 private String fieldSeparator
15 private boolean isFirstLineHeader
16 private ArrayList<String> fileNameList
   
17 public AwkEngine(args) {
18     this.fileNameList = args
19     this.fieldSeparator = "|"
20     this.isFirstLineHeader = false
21 }
   
22 public AwkEngine(args, fieldSeparator) {
23     this.fileNameList = args
24     this.fieldSeparator = fieldSeparator
25     this.isFirstLineHeader = false
26 }
   
27 public AwkEngine(args, fieldSeparator, isFirstLineHeader) {
28     this.fileNameList = args
29     this.fieldSeparator = fieldSeparator
30     this.isFirstLineHeader = isFirstLineHeader
31 }
   
32 public void go() {
33     this.onBegin()
34     int recordNumber = 0
35     fileNameList.each { fileName ->
36         int fileRecordNumber = 0
37         new File(fileName).withReader { reader ->
38             def csvReader = new CSVReader(reader,
39                 this.fieldSeparator.charAt(0))
40             if (isFirstLineHeader) {
41                 def csvFieldNames = csvReader.readNext() as
42                     ArrayList<String>
43                 csvReader.each { fieldsByNumber ->
44                     def fieldsByName = csvFieldNames.
45                         withIndex().
46                         collectEntries { name, index ->
47                             [name, fieldsByNumber[index]]
48                         }
49                     this.onEachLine(fieldsByName,
50                             recordNumber, fileName,
51                             fileRecordNumber)
52                     recordNumber++
53                     fileRecordNumber++
54                 }
55             } else {
56                 csvReader.each { fieldsByNumber ->
57                     this.onEachLine(fieldsByNumber,
58                         recordNumber, fileName,
59                         fileRecordNumber)
60                     recordNumber++
61                     fileRecordNumber++
62                 }
63             }
64         }
65     }
66     this.onEnd()
67 }
68 }
```

虽然这看起来是相当多的代码，但许多行是因为太长换行了（例如，通常你会合并第 38 行和第 39 行，第 41 行和第 42 行，等等）。让我们逐行看一下。

第 1 行使用 `@Grab` 注解从 [Maven Central][8] 获取 OpenCSV 库的 5.6 本周。不需要 XML。

第 2 行我引入了 OpenCSV 的 `CSVReader` 类

第 3 行，像 Java 一样，我声明了一个 public 实用类 `AwkEngine`。

第 11-13 行定义了脚本所使用的 Groovy 闭包实例，作为该类的钩子。像任何 Groovy 类一样，它们“默认是 public”，但 Groovy 将这些字段创建为 private，并对其进行外部引用（使用 Groovy 提供的 getter 和 setter 方法）。我将在下面的示例脚本中进一步解释这个问题。

第 14-16 行声明了 private 字段 —— 字段分隔符，一个指示文件第一行是否为标题的 flag，以及一个文件名的列表。

第 17-31 行定义了三个构造函数。第一个接收命令行参数。第二个接收字段的分隔符。第三个接收指示第一行是否为标题的 flag。

第 31-67 行定义了引擎本身，即 `go()` 方法。

第 33 行调用了 `onBegin()` 闭包（等同于 awk 的 `BEGIN {}`  语句）。

第 34 行初始化流的 `recordNumber`（等同于 awk 的 `NR` 变量）为 0（注意我这里是从 00 而不是 1 开始的）。

第 35-65 行实用 each `{}` 来循环处理列表中的文件。

第 36 行初始化文件的 `fileRecordNumber`（等同于 awk 的 `FNR` 变量）为 0（从 0 而不是  1 开始）。

第 37-64 行获取一个文件对应的 `Reader` 实例并处理它。

第 38-39 行获取一个 `CSVReader` 实例。

第 40 行检测第一行是否为标题。

如果第一行是标题，那么在 41-42 行会从第一行获取字段的标题名字列表。

第 43-54 行处理其他的行。

第 44-48 行把字段的值复制到 `name:value` 的 map 中。

第 49-51 行调用 `onEachLine()` 闭包（等同于 awk 程序 `BEGIN {}` 和 `END {}`  之间的部分，不同的是，这里不能输入执行条件），传入的参数是 `name:value` map、处理过的总行数、文件名和该文件处理过的行数。

第 52-53 行是处理过的总行数和该文件处理过的行数的自增。

如果第一行不是标题：

第 56-62 行处理每一行。

第 57-59 调用 `onEachLine()` 闭包，传入的参数是字段值的数组、处理过的总行数、文件名和该文件处理过的行数。

第 60-61 行是处理过的总行数和该文件处理过的行数的自增。

第 66 行调用 `onEnd()` 闭包（等同于 awk 的 `END {}`）。

这就是该框架的内容。现在你可以编译它：

```
$ groovyc AwkEngine.groovy
```

一点注释：

如果传入的参数不是一个文件，编译就会失败，并出现标准的 Groovy 堆栈跟踪，看起来像这样：

```
Caught: java.io.FileNotFoundException: not-a-file (No such file or directory)
java.io.FileNotFoundException: not-a-file (No such file or directory)
at AwkEngine$_go_closure1.doCall(AwkEngine.groovy:46)
```

OpenCSV 可能会返回 `String[]` 值，不像 Groovy 中的 `List` 值那样方便（例如，数组没有 `each {}`）。第 41-42 行将标题字段值数组转换为 list，因此第 57 行的 `fieldsByNumber` 可能也应该转换为 list。

### 在脚本中使用这个框架

下面是一个使用 `AwkEngine` 来处理 `/etc/group` 之类由冒号分隔并没有标题的文件的简单脚本：

```
1 def ae = new AwkEngine(args, ‘:')
2 int lineCount = 0

3 ae.onBegin = {
4    println “in begin”
5 }

6 ae.onEachLine = { fields, recordNumber, fileName, fileRecordNumber ->
7    if (lineCount < 10)
8       println “fileName $fileName fields $fields”
9       lineCount++
10 }

11 ae.onEnd = {
12    println “in end”
13    println “$lineCount line(s) read”
14 }

15 ae.go()
```

第 1 行 调用的有两个参数的构造函数，传入了参数列表，并定义冒号为分隔符。

第  2 行定义一个脚本级的变量 `lineCount`，用来记录处理过的行数（注意，Groovy 闭包不要求定义在外部的变量为 final）。

第 3-5 行定义 `onBegin()` 闭包，在标准输出中打印出 “in begin” 字符串。

第 6-10 行定义 `onEachLine()` 闭包，打印文件名和前 10 行字段，无论是否为前 10 行，处理过的总行数 `lineCount` 都会自增。

第 11-14 行定义 `onEnd()` 闭包，打印 “in end” 字符串和处理过的总行数。

第 15 行运行脚本，使用 `AwkEngine`。

像下面一样运行一下脚本：

```
$ groovy Test1Awk.groovy /etc/group
in begin
fileName /etc/group fields [root, x, 0, ]
fileName /etc/group fields [daemon, x, 1, ]
fileName /etc/group fields [bin, x, 2, ]
fileName /etc/group fields [sys, x, 3, ]
fileName /etc/group fields [adm, x, 4, syslog,clh]
fileName /etc/group fields [tty, x, 5, ]
fileName /etc/group fields [disk, x, 6, ]
fileName /etc/group fields [lp, x, 7, ]
fileName /etc/group fields [mail, x, 8, ]
fileName /etc/group fields [news, x, 9, ]
in end
78 line(s) read
$
```

当然，编译框架类生成的 `.class` 文件需要在 classpath 中，这样才能正常运行。通常你可以用 `jar` 把这些 class 文件打包起来。

我非常喜欢 Groovy 对行为委托的支持，这在其他语言中需要各种诡异的手段。许多年来，Java 需要匿名类和相当多的额外代码。Lambda 已经在很大程度上解决了这个问题，但它们仍然不能引用其范围之外的非 final 变量。

下面是另一个更有趣的脚本，它很容易让人想起我对 awk 的典型使用方式：

```
1 def ae = new AwkEngine(args, ‘;', true)
2 ae.onBegin = {
3    // nothing to do here
4 }

5 def regionCount = [:]
6    ae.onEachLine = { fields, recordNumber, fileName, fileRecordNumber ->
7    regionCount[fields.REGION] =
8    (regionCount.containsKey(fields.REGION) ?
9    regionCount[fields.REGION] : 0) +
10   (fields.PERSONAS as Integer)
11 }

12 ae.onEnd = {
13    regionCount.each { region, population ->
14    println “Region $region population $population”
15    }
16 }

17 ae.go()
```

第 1 行调用了三个函数的构造方法，`true` 表示这是“真正的 CSV” 文件，第一行为标题。由于它是西班牙语的文件，因此它的逗号表示数字的`点`，标准的分隔符是分号。

第 2-4 行定义 `onBegin()` 闭包，这里什么也不做。

第 5 行定义一个（空的）`LinkedHashmap`，key 是 String 类型，value 是 Integer 类型。数据文件来自于智利最近的人口普查，你要在这个脚本中计算出智利每个地区的人口数量。

第 6-11 行处理文件中的行（加上标题一共有 180,500 行）—— 请注意在这个案例中，由于你定义 第 1 行为 CSV 列的标题，因此 `fields` 参数会成为 `LinkedHashMap<String,String>` 实例。

第 7-10 行是 `regionCount` map 计数增加，key 是 `REGION` 字段的值，value 是 `PERSONAS` 字段的值 —— 请注意，与 awk 不同，在 Groovy 中你不能在赋值操作的右边使用一个不存在的 map 而期望得到空值或零值。

第 12-16 行，打印每个地区的人口数量。

第 17 行运行脚本，调用 `AwkEngine` 。

像下面一样运行一下脚本：

```
$ groovy Test2Awk.groovy ~/Downloads/Censo2017/ManzanaEntidad_CSV/Censo*csv
Region 1 population 330558
Region 2 population 607534
Region 3 population 286168
Region 4 population 757586
Region 5 population 1815902
Region 6 population 914555
Region 7 population 1044950
Region 8 population 1556805
Region 16 population 480609
Region 9 population 957224
Region 10 population 828708
Region 11 population 103158
Region 12 population 166533
Region 13 population 7112808
Region 14 population 384837
Region 15 population 226068
$
```

以上为全部内容。对于那些喜欢 awk 但又希望得到更多的东西的人，我希望你能喜欢这种 Groovy 的方法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/awk-groovy

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_screen_windows_files.png
[2]: https://opensource.com/article/22/8/music-tagging-framework-groovy
[3]: https://opensource.com/downloads/awk-ebook
[4]: http://regex.info/blog/2006-09-15/247
[5]: http://opencsv.sourceforge.net/
[6]: https://groovy.apache.org/download.html
[7]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[8]: https://mvnrepository.com/artifact/com.opencsv/opencsv
