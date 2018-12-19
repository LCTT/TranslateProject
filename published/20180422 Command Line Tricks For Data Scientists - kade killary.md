数据科学家的命令行技巧
======

![](https://i.imgur.com/0mzQMcB.png)

对于许多数据科学家来说，数据操作从始至终就是 Pandas 或 Tidyverse。从理论上讲，这样做没有任何问题。毕竟，这就是这些工具存在的原因。然而，对于像分隔符转换这样的简单任务，这些工具是大材小用了。

立志掌握命令行应该在每个开发人员的学习清单上，特别是数据科学家。学习 shell 的来龙去脉将无可否认地提高你的生产力。除此之外，命令行还是计算领域的一个重要历史课程。例如，awk —— 一种数据驱动的脚本语言。1977 年，在 [Brain Kernighan][1]（即传奇的 [K&R 书][2]中 K）的帮助下，awk 首次出现。今天，大约五十年过去了，awk 仍然活跃在每年[新出版的书][3]里面。因此，可以安全地假设对命令行魔法的付出不会很快贬值。

### 我们将涵盖什么

* ICONV
* HEAD
* TR
* WC
* SPLIT
* SORT & UNIQ
* CUT
* PASTE
* JOIN
* GREP
* SED
* AWK

### ICONV

文件编码可能会很棘手。现在大部分文件都是 UTF-8 编码的。要了解 UTF-8 背后的一些魔力，请查看这个出色的[视频][4]。尽管如此，有时我们收到的文件不是这种编码。这可能引起对改变编码模式的一些胡乱尝试。这里，`iconv` 是一个拯救者。`iconv` 是一个简单的程序，它将获取采用一种编码的文本并输出采用另一种编码的文本。

```
# Converting -f (from) latin1 (ISO-8859-1)
# -t (to) standard UTF_8

iconv -f ISO-8859-1 -t UTF-8 < input.txt > output.txt
```

实用选项：

* `iconv -l` 列出所有已知编码
* `iconv -c` 默默丢弃无法转换的字符

### HEAD

如果你是一个 Pandas 重度用户，那么会很熟悉 `head`。通常在处理新数据时，我们想做的第一件事就是了解其内容。这就得启动 Pandas，读取数据然后调用 `df.head()` —— 要说这有点费劲。没有任何选项的 `head` 将打印出文件的前 10 行。`head` 的真正力量在于干净利落的测试操作。例如，如果我们想将文件的分隔符从逗号更改为管道。一个快速测试将是：`head mydata.csv | sed 's/,/|/g'`。

```bash
# Prints out first 10 lines
head filename.csv

# Print first 3 lines
head -n 3 filename.csv
```

实用选项：

* `head -n` 打印特定行数
* `head -c` 打印特定字节数

### TR

`tr` 类似于翻译。这个功能强大的实用程序是文件基础清理的主力。理想的用例是替换文件中的分隔符。

```bash
# Converting a tab delimited file into commas
cat tab_delimited.txt | tr "\t" "," comma_delimited.csv
```

`tr` 另一个功能是你可以用内建 `[:class:]` 变量（POSIX 字符类）发挥威力。这些包括了：

- `[:alnum:]` 所有字母和数字
- `[:alpha:]` 所有字母
- `[:blank:]` 所有水平空白
- `[:cntrl:]` 所有控制字符
- `[:digit:]` 所有数字
- `[:graph:]` 所有可打印字符，但不包括空格
- `[:lower:]` 所有小写字母
- `[:print:]` 所有可打印字符，包括空格
- `[:punct:]` 所有标点符号
- `[:space:]` 所有水平或垂直空白
- `[:upper:]` 所有大写字母
- `[:xdigit:]` 所有 16 进制数字

你可以将这些连接在一起以组成强大的程序。以下是一个基本的字数统计程序，可用于检查 README 是否被滥用。

```
cat README.md | tr "[:punct:][:space:]" "\n" | tr "[:upper:]" "[:lower:]" | grep . | sort | uniq -c | sort -nr
```

另一个使用基本正则表达式的例子：

```
# Converting all upper case letters to lower case
cat filename.csv | tr '[A-Z]' '[a-z]'
```

实用选项：

* `tr -d` 删除字符
* `tr -s` 压缩字符
* `\b` 退格
* `\f` 换页
* `\v` 垂直制表符
* `\NNN` 八进制字符

### WC

单词计数。它的价值主要来自其 `-l` 选项，它会给你提供行数。

```
# Will return number of lines in CSV
wc -l gigantic_comma.csv
```

这个工具可以方便地确认各种命令的输出。所以，如果我们在转换文件中的分隔符之后运行 `wc -l`，我们会期待总行数是一样的，如果不一致，我们就知道有地方出错了。

实用选项：

* `wc -c` 打印字节数
* `wc -m` 打印字符数
* `wc -L` 打印最长行的长度
* `wc -w` 打印单词数量

### SPLIT

文件大小的范围可以很广。对于有的任务，拆分文件或许是有好处的，所以使用 `split` 吧。`split` 的基本语法是：

```bash
# We will split our CSV into new_filename every 500 lines
split -l 500 filename.csv new_filename_
# filename.csv
# ls output
# new_filename_aaa
# new_filename_aab
# new_filename_aa
```

它有两个奇怪的地方是命名约定和缺少文件扩展名。后缀约定可以通过 `-d` 标志变为数字。要添加文件扩展名，你需要运行以下 `find` 命令。它将通过附加 `.csv` 扩展名来更改当前目录中所有文件的名称，所以小心了。

```bash
find . -type f -exec mv '{}' '{}'.csv \;
# ls output
# filename.csv.csv
# new_filename_aaa.csv
# new_filename_aab.csv
# new_filename_aac.csv
```

实用选项：

* `split -b N` 按特定字节大小分割
* `split -a N` 生成长度为 N 的后缀
* `split -x` 使用十六进制后缀

### SORT & UNIQ

上面两个命令很明显：它们的作用就是字面意思。这两者结合起来可以提供最强大的冲击 (例如，唯一单词的数量)。这是由于 `uniq` 只作用于重复的相邻行。这也是在输出前进行 `sort` 的原因。一个有趣的事情是 `sort -u` 会达到和典型的 `sort file.txt | uniq` 模式一样的结果。

`sort` 对数据科学家来说确实具有潜在的有用能力：能够根据特定列对整个 CSV 进行排序。

```bash
# Sorting a CSV file by the second column alphabetically
sort -t"," -k2,2 filename.csv

# Numerically
sort -t"," -k2n,2 filename.csv

# Reverse order
sort -t"," -k2nr,2 filename.csv
```

这里的 `-t` 选项将逗号指定为分隔符，通常假设分隔符是空格或制表符。此外，`-k` 选项是为了确定我们的键。这里的语法是 `-km,n`，`m` 作为开始列，`n` 作为结束列。

实用选项：

* `sort -f` 忽略大小写
* `sort -r` 反向排序
* `sort -R` 乱序
* `uniq -c` 统计出现次数
* `uniq -d` 只打印重复行

### CUT

`cut` 用于删除列。作为演示，如果我们只想删除第一和第三列。

```bash
cut -d, -f 1,3 filename.csv
```

要选择除了第一行外的所有行。

```bash
cut -d, -f 2- filename.csv
```

结合其他命令，将 `cut` 用作过滤器。

```bash
# Print first 10 lines of column 1 and 3, where "some_string_value" is present
head filename.csv | grep "some_string_value" | cut -d, -f 1,3
```

查出第二列中唯一值的数量。

```bash
cat filename.csv | cut -d, -f 2 | sort | uniq | wc -l

# Count occurences of unique values, limiting to first 10 results
cat filename.csv | cut -d, -f 2 | sort | uniq -c | head
```

### PASTE

`paste` 是一个带有趣味性功能的特定命令。如果你有两个需要合并的文件，并且它们已经排序好了，`paste` 帮你解决了接下来的步骤。

```bash
# names.txt
adam
john
zach

# jobs.txt
lawyer
youtuber
developer

# Join the two into a CSV
paste -d ',' names.txt jobs.txt > person_data.txt

# Output
adam,lawyer
john,youtuber
zach,developer
```

更多 SQL 式变种，见下文。

### JOIN

`join` 是一个简单的、<ruby>准切向的<rt>quasi-tangential</rt></ruby> SQL。最大的区别是 `join` 将返回所有列以及只能在一个字段上匹配。默认情况下，`join` 将尝试使用第一列作为匹配键。为了获得不同结果，必须使用以下语法：

```bash
# Join the first file (-1) by the second column
# and the second file (-2) by the first
join -t "," -1 2 -2 1 first_file.txt second_file.txt
```

标准的 `join` 是内连接。然而，外连接通过 `-a` 选项也是可行的。另一个值得一提的技巧是 `-q` 标志，如果发现有缺失的字段，可用于替换值。

```bash
# Outer join, replace blanks with NULL in columns 1 and 2
# -o which fields to substitute - 0 is key, 1.1 is first column, etc...
join -t"," -1 2 -a 1 -a2 -e ' NULL' -o '0,1.1,2.2' first_file.txt second_file.txt
```

它不是最用户友好的命令，而是绝望时刻的绝望措施。

实用选项：

* `join -a` 打印不可配对的行
* `join -e` 替换丢失的输入字段
* `join -j` 相当于 `-1 FIELD -2 FIELD`

### GREP

`grep` 即 <ruby>用正则表达式全局搜索并且打印<rt>Global search for a Regular Expression and Print</rt></ruby>，可能是最有名的命令，并且名副其实。`grep` 很强大，特别适合在大型代码库中查找。在数据科学的王国里，它充当其他命令的提炼机制。虽然它的标准用途也很有价值。

```
# Recursively search and list all files in directory containing 'word'

grep -lr 'word' .

# List number of files containing word

grep -lr 'word' . | wc -l

```

计算包含单词或模式的总行数。

```
grep -c 'some_value' filename.csv

# Same thing, but in all files in current directory by file name

grep -c 'some_value' *
```

对多个值使用“或”运算符： `\|`。

```
grep "first_value\|second_value" filename.csv
```

实用选项：

* `alias grep="grep --color=auto"` 使 grep 色彩丰富
* `grep -E` 使用扩展正则表达式
* `grep -w` 只匹配整个单词
* `grep -l` 打印匹配的文件名
* `grep -v` 非匹配

### 大人物们

`sed` 和 `awk` 是本文中最强大的两个命令。为简洁起见，我不打算详细讨论这两个命令。相反，我将介绍各种能证明其令人印象深刻的力量的命令。如果你想了解更多，[这儿就有一本书][5]是关于它们的。

### SED

`sed` 本质上是一个流编辑器。它擅长替换，但也可以用于所有输出重构。

最基本的 `sed` 命令由 `s/old/new/g` 组成。它的意思是搜索 `old`，全局替换为 `new`。 如果没有 `/g`，我们的命令将在 `old` 第一次出现后终止。

为了快速了解它的功能，我们可以深入了解一个例子。 在以下情景中，你已有以下文件：

```
balance,name
$1,000,john
$2,000,jack
```

我们可能想要做的第一件事是删除美元符号。`-i` 标志表示原位。`''` 表示零长度文件扩展名，从而覆盖我们的初始文件。理想情况下，你可以单独测试，然后输出到新文件。

```
sed -i '' 's/\$//g' data.txt
# balance,name
# 1,000,john
# 2,000,jack
```

接下来，去除 `blance` 列的逗号。

```
sed -i '' 's/\([0-9]\),\([0-9]\)/\1\2/g' data.txt
# balance,name
# 1000,john
# 2000,jack
```

最后 jack 有一天决定辞职。所以，再见了，我的朋友。

```
sed -i '' '/jack/d' data.txt
# balance,name
# 1000,john
```

正如你所看到的，`sed` 有很多强大的功能，但乐趣并不止于此。

### AWK

最好的留在最后。`awk` 不仅仅是一个简单的命令：它是一个成熟的语言。在本文中涉及的所有内容中，`awk` 是目前为止最酷的。如果你感兴趣，这里有很多很棒的资源 —— 看 [这里][6]、[这里][7] 和 [这里][8]。

`awk` 的常见用例包括：

* 文字处理
* 格式化文本报告
* 执行算术运算
* 执行字符串操作

`awk` 可以以最原生的形式并行 `grep`。

```
awk '/word/' filename.csv
```

或者更加神奇：将 `grep` 和 `cut` 组合起来。在这里，对于所有带我们指定单词 `word` 的行，`awk` 打印第三和第四列，用 `tab` 分隔。`-F,` 用于指定切分时的列分隔符为逗号。

```bash
awk -F, '/word/ { print $3 "\t" $4 }' filename.csv
```

`awk` 内置了许多精巧的变量。比如，`NF` —— 字段数，和 `NR` —— 记录数。要获取文件中的第 53 条记录：

```bash
awk -F, 'NR == 53' filename.csv
```

更多的花招是其基于一个或多个值进行过滤的能力。下面的第一个示例将打印第一列等于给定字符串的行的行号和列。

```bash
awk -F, ' $1 == "string" { print NR, $0 } ' filename.csv

# Filter based off of numerical value in second column
awk -F, ' $2 == 1000 { print NR, $0 } ' filename.csv
```

多个数值表达式：

```bash
# Print line number and columns where column three greater
# than 2005 and column five less than one thousand

awk -F, ' $3 >= 2005 && $5 <= 1000 { print NR, $0 } ' filename.csv
```

求出第三列的总和：

```bash
awk -F, '{ x+=$3 } END { print x }' filename.csv
```

在第一列等于 `something` 的那些行，求出第三列值的总和。

```bash
awk -F, '$1 == "something" { x+=$3 } END { print x }' filename.csv
```

获取文件的行列数：

```bash
awk -F, 'END { print NF, NR }' filename.csv

# Prettier version
awk -F, 'BEGIN { print "COLUMNS", "ROWS" }; END { print NF, NR }' filename.csv
```

打印出现了两次的行：

```bash
awk -F, '++seen[$0] == 2' filename.csv
```

删除重复的行：

```bash
# Consecutive lines
awk 'a !~ $0; {a=$0}']

# Nonconsecutive lines
awk '! a[$0]++' filename.csv

# More efficient
awk '!($0 in a) {a[$0];print}
```

使用内置函数 `gsub()` 替换多个值。

```bash
awk '{gsub(/scarlet|ruby|puce/, "red"); print}'
```

这个 `awk` 命令将组合多个 CSV 文件，忽略标题，然后在最后附加它。

```bash
awk 'FNR==1 && NR!=1{next;}{print}' *.csv > final_file.csv
```

需要缩小一个庞大的文件？ `awk` 可以在 `sed` 的帮助下处理它。具体来说，该命令根据行数将一个大文件分成多个较小的文件。这个一行脚本将增加一个扩展名。

```bash
sed '1d;$d' filename.csv | awk 'NR%NUMBER_OF_LINES==1{x="filename-"++i".csv";}{print > x}'

# Example: splitting big_data.csv into data_(n).csv every 100,000 lines
sed '1d;$d' big_data.csv | awk 'NR%100000==1{x="data_"++i".csv";}{print > x}'
```

### 结语

命令行拥有无穷无尽的力量。本文中介绍的命令足以将你从一无所知提升到英雄人物。除了涵盖的内容之外，还有许多实用程序可以考虑用于日常数据操作。[Csvkit][9]、[xsv][10] 还有 [q][11] 是需要记住的三个。如果你希望更深入地了解命令行数据科学，查看[这本书][12]。它也可以[免费][13]在线获得！

--------------------------------------------------------------------------------

via: http://kadekillary.work/post/cli-4-ds/

作者：[Kade Killary][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[GraveAccent](https://github.com/graveaccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kadekillary.work/authors/kadekillary
[1]:https://en.wikipedia.org/wiki/Brian_Kernighan
[2]:https://en.wikipedia.org/wiki/The_C_Programming_Language
[3]:https://www.amazon.com/Learning-AWK-Programming-cutting-edge-text-processing-ebook/dp/B07BT98HDS
[4]:https://www.youtube.com/watch?v=MijmeoH9LT4
[5]:https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=sr_1_1?ie=UTF8&qid=1524381457&sr=8-1&keywords=sed+and+awk
[6]:https://www.amazon.com/AWK-Programming-Language-Alfred-Aho/dp/020107981X/ref=sr_1_1?ie=UTF8&qid=1524388936&sr=8-1&keywords=awk
[7]:http://www.grymoire.com/Unix/Awk.html
[8]:https://www.tutorialspoint.com/awk/index.htm
[9]:http://csvkit.readthedocs.io/en/1.0.3/
[10]:https://github.com/BurntSushi/xsv
[11]:https://github.com/harelba/q
[12]:https://www.amazon.com/Data-Science-Command-Line-Time-Tested/dp/1491947853/ref=sr_1_1?ie=UTF8&qid=1524390894&sr=8-1&keywords=data+science+at+the+command+line
[13]:https://www.datascienceatthecommandline.com/
