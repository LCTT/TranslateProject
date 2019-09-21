Linux 下 cut 命令的 4 个基础实用的示例
============================================================

`cut` 命令是用来从文本文件中移除“某些列”的经典工具。在本文中的“一列”可以被定义为按照一行中位置区分的一系列字符串或者字节，或者是以某个分隔符为间隔的某些域。

先前我已经介绍了[如何使用 AWK 命令][13]。在本文中，我将解释 linux 下 `cut` 命令的 4 个本质且实用的例子，有时这些例子将帮你节省很多时间。

![Cut Linux 命令示例](https://i1.wp.com/linuxhandbook.com/wp-content/uploads/2018/07/cut-command-linux.jpeg?resize=702%2C395&ssl=1)

### Linux 下 cut 命令的 4 个实用示例

假如你想，你可以观看下面的视频，视频中解释了本文中我列举的 cut 命令的使用例子。

- https://www.youtube.com/PhE_cFLzVFw

### 1、 作用在一系列字符上

当启用 `-c` 命令行选项时，`cut` 命令将移除一系列字符。

和其他的过滤器类似， `cut` 命令不会直接改变输入的文件，它将复制已修改的数据到它的标准输出里去。你可以通过重定向命令的结果到一个文件中来保存修改后的结果，或者使用管道将结果送到另一个命令的输入中，这些都由你来负责。

假如你已经下载了上面视频中的[示例测试文件][26]，你将看到一个名为 `BALANCE.txt` 的数据文件，这些数据是直接从我妻子在她工作中使用的某款会计软件中导出的：

```
sh$ head BALANCE.txt
ACCDOC    ACCDOCDATE    ACCOUNTNUM ACCOUNTLIB              ACCDOCLIB                        DEBIT          CREDIT
4         1012017       623477     TIDE SCHEDULE           ALNEENRE-4701-LOC                00000001615,00
4         1012017       445452     VAT BS/ENC              ALNEENRE-4701-LOC                00000000323,00
4         1012017       4356       PAYABLES                ALNEENRE-4701-LOC                               00000001938,00
5         1012017       623372     ACCOMODATION GUIDE      ALNEENRE-4771-LOC                00000001333,00
5         1012017       445452     VAT BS/ENC              ALNEENRE-4771-LOC                00000000266,60
5         1012017       4356       PAYABLES                ALNEENRE-4771-LOC                               00000001599,60
6         1012017       4356       PAYABLES                FACT FA00006253 - BIT QUIROBEN                  00000001837,20
6         1012017       445452     VAT BS/ENC              FACT FA00006253 - BIT QUIROBEN   00000000306,20
6         1012017       623795     TOURIST GUIDE BOOK      FACT FA00006253 - BIT QUIROBEN   00000001531,00
```

上述文件是一个固定宽度的文本文件，因为对于每一项数据，都使用了不定长的空格做填充，使得它看起来是一个对齐的列表。

这样一来，每一列数据开始和结束的位置都是一致的。从 `cut` 命令的字面意思去理解会给我们带来一个小陷阱：`cut` 命令实际上需要你指出你想_保留_的数据范围，而不是你想_移除_的范围。所以，假如我_只_需要上面文件中的 `ACCOUNTNUM` 和 `ACCOUNTLIB` 列，我需要这么做：

```
sh$ cut -c 25-59 BALANCE.txt | head
ACCOUNTNUM ACCOUNTLIB
623477     TIDE SCHEDULE
445452     VAT BS/ENC
4356       /accountPAYABLES
623372     ACCOMODATION GUIDE
445452     VAT BS/ENC
4356       PAYABLES
4356       PAYABLES
445452     VAT BS/ENC
623795     TOURIST GUIDE BOOK
```

#### 范围如何定义？

正如我们上面看到的那样， `cut` 命令需要我们特别指定需要保留的数据的_范围_。所以，下面我将更正式地介绍如何定义范围：对于 `cut` 命令来说，范围是由连字符(`-`)分隔的起始和结束位置组成，范围是基于 1 计数的，即每行的第一项是从 1 开始计数的，而不是从 0 开始。范围是一个闭区间，开始和结束位置都将包含在结果之中，正如它们之间的所有字符那样。如果范围中的结束位置比起始位置小，则这种表达式是错误的。作为快捷方式，你可以省略起始_或_结束值，正如下面的表格所示：


| 范围 | 含义 |
|---|---|
| `a-b` | a 和 b 之间的范围（闭区间） |
|`a` | 与范围 `a-a` 等价 |
| `-b` | 与范围 `1-a` 等价 |
| `b-` | 与范围 `b-∞`  等价 |

`cut` 命令允许你通过逗号分隔多个范围，下面是一些示例：

```
# 保留 1 到 24 之间（闭区间）的字符
cut -c -24 BALANCE.txt

# 保留 1 到 24（闭区间）以及 36 到 59（闭区间）之间的字符
cut -c -24,36-59 BALANCE.txt

# 保留 1 到 24（闭区间）、36 到 59（闭区间）和 93 到该行末尾之间的字符
cut -c -24,36-59,93- BALANCE.txt
```

`cut` 命令的一个限制（或者是特性，取决于你如何看待它）是它将 _不会对数据进行重排_。所以下面的命令和先前的命令将产生相同的结果，尽管范围的顺序做了改变：

```
cut -c 93-,-24,36-59 BALANCE.txt
```

你可以轻易地使用 `diff` 命令来验证：

```
diff -s <(cut -c -24,36-59,93- BALANCE.txt) \
              <(cut -c 93-,-24,36-59 BALANCE.txt)
Files /dev/fd/63 and /dev/fd/62 are identical
```

类似的，`cut` 命令 _不会重复数据_：

```
# 某人或许期待这可以第一列三次，但并不会……
cut -c -10,-10,-10 BALANCE.txt | head -5
ACCDOC
4
4
4
5
```

值得提及的是，曾经有一个提议，建议使用 `-o` 选项来去除上面提到的两个限制，使得 `cut` 工具可以重排或者重复数据。但这个提议被 [POSIX 委员会拒绝了][14]，_“因为这类增强不属于 IEEE P1003.2b 草案标准的范围”_。

据我所知，我还没有见过哪个版本的 `cut` 程序实现了上面的提议，以此来作为扩展，假如你知道某些例外，请使用下面的评论框分享给大家！

### 2、 作用在一系列字节上

当使用 `-b` 命令行选项时，`cut` 命令将移除字节范围。

咋一看，使用_字符_范围和使用_字节_没有什么明显的不同：

```
sh$ diff -s <(cut -b -24,36-59,93- BALANCE.txt) \
              <(cut -c -24,36-59,93- BALANCE.txt)
Files /dev/fd/63 and /dev/fd/62 are identical
```

这是因为我们的示例数据文件使用的是 [US-ASCII 编码][27]（字符集），使用 `file -i` 便可以正确地猜出来：

```
sh$ file -i BALANCE.txt
BALANCE.txt: text/plain; charset=us-ascii
```

在 US-ASCII 编码中，字符和字节是一一对应的。理论上，你只需要使用一个字节就可以表示 256 个不同的字符（数字、字母、标点符号和某些符号等）。实际上，你能表达的字符数比 256 要更少一些，因为字符编码中为某些特定值做了规定（例如 32 或 65 就是[控制字符][28]）。即便我们能够使用上述所有的字节范围，但对于存储种类繁多的人类手写符号来说，256 是远远不够的。所以如今字符和字节间的一一对应更像是某种例外，并且几乎总是被无处不在的 UTF-8 多字节编码所取代。下面让我们看看如何来处理多字节编码的情形。

#### 作用在多字节编码的字符上

正如我前面提到的那样，示例数据文件来源于我妻子使用的某款会计软件。最近好像她升级了那个软件，然后呢，导出的文本就完全不同了，你可以试试和上面的数据文件相比，找找它们之间的区别：

```
sh$ head BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTNUM ACCOUNTLIB              ACCDOCLIB                        DEBIT          CREDIT
4         1012017       623477     TIDE SCHEDULE           ALNÉENRE-4701-LOC                00000001615,00
4         1012017       445452     VAT BS/ENC              ALNÉENRE-4701-LOC                00000000323,00
4         1012017       4356       PAYABLES                ALNÉENRE-4701-LOC                               00000001938,00
5         1012017       623372     ACCOMODATION GUIDE      ALNÉENRE-4771-LOC                00000001333,00
5         1012017       445452     VAT BS/ENC              ALNÉENRE-4771-LOC                00000000266,60
5         1012017       4356       PAYABLES                ALNÉENRE-4771-LOC                               00000001599,60
6         1012017       4356       PAYABLES                FACT FA00006253 - BIT QUIROBEN                  00000001837,20
6         1012017       445452     VAT BS/ENC              FACT FA00006253 - BIT QUIROBEN   00000000306,20
6         1012017       623795     TOURIST GUIDE BOOK      FACT FA00006253 - BIT QUIROBEN   00000001531,00
```

上面的标题栏或许能够帮助你找到什么被改变了，但无论你找到与否，现在让我们看看上面的更改过后的结果：

```
sh$ cut -c 93-,-24,36-59 BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE            00000001615,00
4         1012017       VAT BS/ENC               00000000323,00
4         1012017       PAYABLES                                00000001938,00
5         1012017       ACCOMODATION GUIDE       00000001333,00
5         1012017       VAT BS/ENC               00000000266,60
5         1012017       PAYABLES                                00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                                00000000240,00
31        1012017       VAT BS/DEBIT             00000000040,00
31        1012017       ADVERTISEMENTS           00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE        00000000069,14
36        1012017       VAT BS/ENC                00000000013,83
```

我_毫无删减地_复制了上面命令的输出。所以可以很明显地看出列对齐那里有些问题。

对此我的解释是原来的数据文件只包含 US-ASCII 编码的字符（符号、标点符号、数字和没有发音符号的拉丁字母）。

但假如你仔细地查看经软件升级后产生的文件，你可以看到新导出的数据文件保留了带发音符号的字母。例如现在合理地记录了名为 “ALNÉENRE” 的公司，而不是先前的 “ALNEENRE”（没有发音符号）。

`file -i` 正确地识别出了改变，因为它报告道现在这个文件是 [UTF-8 编码][15] 的。

```
sh$ file -i BALANCE-V2.txt
BALANCE-V2.txt: text/plain; charset=utf-8
```

如果想看看 UTF-8 文件中那些带发音符号的字母是如何编码的，我们可以使用 `[hexdump][12]`，它可以让我们直接以字节形式查看文件：

```
# 为了减少输出，让我们只关注文件的第 2 行
sh$ sed '2!d' BALANCE-V2.txt
4         1012017       623477     TIDE SCHEDULE           ALNÉENRE-4701-LOC                00000001615,00
sh$ sed '2!d' BALANCE-V2.txt  | hexdump -C
00000000  34 20 20 20 20 20 20 20  20 20 31 30 31 32 30 31  |4         101201|
00000010  37 20 20 20 20 20 20 20  36 32 33 34 37 37 20 20  |7       623477  |
00000020  20 20 20 54 49 44 45 20  53 43 48 45 44 55 4c 45  |   TIDE SCHEDULE|
00000030  20 20 20 20 20 20 20 20  20 20 20 41 4c 4e c3 89  |           ALN..|
00000040  45 4e 52 45 2d 34 37 30  31 2d 4c 4f 43 20 20 20  |ENRE-4701-LOC   |
00000050  20 20 20 20 20 20 20 20  20 20 20 20 20 30 30 30  |             000|
00000060  30 30 30 30 31 36 31 35  2c 30 30 20 20 20 20 20  |00001615,00     |
00000070  20 20 20 20 20 20 20 20  20 20 20 0a              |           .|
0000007c
```

在 `hexdump`  输出的 00000030 那行，在一系列的空格（字节 `20`）之后，你可以看到：

*   字母 `A` 被编码为 `41`，
*   字母 `L` 被编码为 `4c`，
*   字母 `N` 被编码为 `4e`。

但对于大写的[带有注音的拉丁大写字母 E][16] （这是它在 Unicode 标准中字母 _É_ 的官方名称），则是使用 _2_ 个字节 `c3 89` 来编码的。

这样便出现问题了：对于使用固定宽度编码的文件， 使用字节位置来表示范围的 `cut` 命令工作良好，但这并不适用于使用变长编码的 UTF-8 或者 [Shift JIS][17] 编码。这种情况在下面的 [POSIX 标准的非规范性摘录][18] 中被明确地解释过：

> 先前版本的 `cut` 程序将字节和字符视作等同的环境下运作（正如在某些实现下对退格键 `<backspace>` 和制表键 `<tab>` 的处理）。在针对多字节字符的情况下，特别增加了 `-b` 选项。

嘿，等一下！我并没有在上面“有错误”的例子中使用 '-b' 选项，而是 `-c` 选项呀！所以，难道_不应该_能够成功处理了吗！？

是的，确实_应该_：但是很不幸，即便我们现在已身处 2018 年，GNU Coreutils 的版本为 8.30 了，`cut` 程序的 GNU 版本实现仍然不能很好地处理多字节字符。引用 [GNU 文档][19] 的话说，_`-c` 选项“现在和 `-b` 选项是相同的，但对于国际化的情形将有所不同[...]”_。需要提及的是，这个问题距今已有 10 年之久了！

另一方面，[OpenBSD][20] 的实现版本和 POSIX 相吻合，这将归功于当前的本地化（`locale`）设定来合理地处理多字节字符：

```
# 确保随后的命令知晓我们现在处理的是 UTF-8 编码的文本文件
openbsd-6.3$ export LC_CTYPE=en_US.UTF-8

# 使用 `-c` 选项， `cut` 能够合理地处理多字节字符
openbsd-6.3$ cut -c -24,36-59,93- BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE           00000001615,00
4         1012017       VAT BS/ENC              00000000323,00
4         1012017       PAYABLES                               00000001938,00
5         1012017       ACCOMODATION GUIDE      00000001333,00
5         1012017       VAT BS/ENC              00000000266,60
5         1012017       PAYABLES                               00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                               00000000240,00
31        1012017       VAT BS/DEBIT            00000000040,00
31        1012017       ADVERTISEMENTS          00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE      00000000069,14
36        1012017       VAT BS/ENC              00000000013,83
```

正如期望的那样，当使用 `-b` 选项而不是 `-c` 选项后， OpenBSD 版本的 `cut` 实现和传统的 `cut` 表现是类似的：

```
openbsd-6.3$ cut -b -24,36-59,93- BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE            00000001615,00
4         1012017       VAT BS/ENC               00000000323,00
4         1012017       PAYABLES                                00000001938,00
5         1012017       ACCOMODATION GUIDE       00000001333,00
5         1012017       VAT BS/ENC               00000000266,60
5         1012017       PAYABLES                                00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                                00000000240,00
31        1012017       VAT BS/DEBIT             00000000040,00
31        1012017       ADVERTISEMENTS           00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE        00000000069,14
36        1012017       VAT BS/ENC                00000000013,83
```

### 3、 作用在域上

从某种意义上说，使用 `cut` 来处理用特定分隔符隔开的文本文件要更加容易一些，因为只需要确定好每行中域之间的分隔符，然后复制域的内容到输出就可以了，而不需要烦恼任何与编码相关的问题。

下面是一个用分隔符隔开的示例文本文件：

```
sh$ head BALANCE.csv
ACCDOC;ACCDOCDATE;ACCOUNTNUM;ACCOUNTLIB;ACCDOCLIB;DEBIT;CREDIT
4;1012017;623477;TIDE SCHEDULE;ALNEENRE-4701-LOC;00000001615,00;
4;1012017;445452;VAT BS/ENC;ALNEENRE-4701-LOC;00000000323,00;
4;1012017;4356;PAYABLES;ALNEENRE-4701-LOC;;00000001938,00
5;1012017;623372;ACCOMODATION GUIDE;ALNEENRE-4771-LOC;00000001333,00;
5;1012017;445452;VAT BS/ENC;ALNEENRE-4771-LOC;00000000266,60;
5;1012017;4356;PAYABLES;ALNEENRE-4771-LOC;;00000001599,60
6;1012017;4356;PAYABLES;FACT FA00006253 - BIT QUIROBEN;;00000001837,20
6;1012017;445452;VAT BS/ENC;FACT FA00006253 - BIT QUIROBEN;00000000306,20;
6;1012017;623795;TOURIST GUIDE BOOK;FACT FA00006253 - BIT QUIROBEN;00000001531,00;
```

你可能知道上面文件是一个 [CSV][29] 格式的文件（它以逗号来分隔），即便有时候域分隔符不是逗号。例如分号（`;`）也常被用来作为分隔符，并且对于那些总使用逗号作为 [十进制分隔符][30]的国家（例如法国，所以上面我的示例文件中选用了他们国家的字符），当导出数据为 “CSV” 格式时，默认将使用分号来分隔数据。另一种常见的情况是使用 [tab 键][32] 来作为分隔符，从而生成叫做 [tab 分隔的值][32] 的文件。最后，在 Unix 和 Linux 领域，冒号 (`:`) 是另一种你能找到的常见分隔符号，例如在标准的 `/etc/passwd` 和 `/etc/group` 这两个文件里。

当处理使用分隔符隔开的文本文件格式时，你可以向带有 `-f` 选项的 `cut` 命令提供需要保留的域的范围，并且你也可以使用 `-d` 选项来指定分隔符（当没有使用 `-d` 选项时，默认以 tab 字符来作为分隔符）：

```
sh$ cut -f 5- -d';' BALANCE.csv | head
ACCDOCLIB;DEBIT;CREDIT
ALNEENRE-4701-LOC;00000001615,00;
ALNEENRE-4701-LOC;00000000323,00;
ALNEENRE-4701-LOC;;00000001938,00
ALNEENRE-4771-LOC;00000001333,00;
ALNEENRE-4771-LOC;00000000266,60;
ALNEENRE-4771-LOC;;00000001599,60
FACT FA00006253 - BIT QUIROBEN;;00000001837,20
FACT FA00006253 - BIT QUIROBEN;00000000306,20;
FACT FA00006253 - BIT QUIROBEN;00000001531,00;
```

#### 处理不包含分隔符的行

但要是输入文件中的某些行没有分隔符又该怎么办呢？很容易地认为可以将这样的行视为只包含第一个域。但 `cut` 程序并 _不是_ 这样做的。 

默认情况下，当使用 `-f` 选项时，`cut` 将总是原样输出不包含分隔符的那一行（可能假设它是非数据行，就像表头或注释等）：

```
sh$ (echo "# 2018-03 BALANCE"; cat BALANCE.csv) > BALANCE-WITH-HEADER.csv

sh$ cut -f 6,7 -d';' BALANCE-WITH-HEADER.csv | head -5
# 2018-03 BALANCE
DEBIT;CREDIT
00000001615,00;
00000000323,00;
;00000001938,00
```

使用 `-s` 选项，你可以做出相反的行为，这样 `cut` 将总是忽略这些行：

```
sh$ cut -s -f 6,7 -d';' BALANCE-WITH-HEADER.csv | head -5
DEBIT;CREDIT
00000001615,00;
00000000323,00;
;00000001938,00
00000001333,00;
```

假如你好奇心强，你还可以探索这种特性，来作为一种相对隐晦的方式去保留那些只包含给定字符的行：

```
# 保留含有一个 `e` 的行
sh$ printf "%s\n" {mighty,bold,great}-{condor,monkey,bear} | cut -s -f 1- -d'e'
```

#### 改变输出的分隔符

作为一种扩展， GNU 版本实现的 `cut` 允许通过使用 `--output-delimiter` 选项来为结果指定一个不同的域分隔符：

```
sh$ cut -f 5,6- -d';' --output-delimiter="*" BALANCE.csv | head
ACCDOCLIB*DEBIT*CREDIT
ALNEENRE-4701-LOC*00000001615,00*
ALNEENRE-4701-LOC*00000000323,00*
ALNEENRE-4701-LOC**00000001938,00
ALNEENRE-4771-LOC*00000001333,00*
ALNEENRE-4771-LOC*00000000266,60*
ALNEENRE-4771-LOC**00000001599,60
FACT FA00006253 - BIT QUIROBEN**00000001837,20
FACT FA00006253 - BIT QUIROBEN*00000000306,20*
FACT FA00006253 - BIT QUIROBEN*00000001531,00*
```

需要注意的是，在上面这个例子中，所有出现域分隔符的地方都被替换掉了，而不仅仅是那些在命令行中指定的作为域范围边界的分隔符。

### 4、 非 POSIX GNU 扩展

说到非 POSIX GNU 扩展，它们中的某些特别有用。特别需要提及的是下面的扩展也同样对字节、字符或者域范围工作良好（相对于当前的 GNU 实现来说）。

`--complement`：

想想在 sed 地址中的感叹符号(`!`)，使用它，`cut` 将只保存**没有**被匹配到的范围:

```
# 只保留第 5 个域
sh$ cut -f 5 -d';' BALANCE.csv |head -3
ACCDOCLIB
ALNEENRE-4701-LOC
ALNEENRE-4701-LOC

# 保留除了第 5 个域之外的内容
sh$ cut --complement -f 5 -d';' BALANCE.csv |head -3
ACCDOC;ACCDOCDATE;ACCOUNTNUM;ACCOUNTLIB;DEBIT;CREDIT
4;1012017;623477;TIDE SCHEDULE;00000001615,00;
4;1012017;445452;VAT BS/ENC;00000000323,00;
```

`--zero-terminated (-z)`：

使用 [NUL 字符][6] 来作为行终止符，而不是 [<ruby>新行<rt>newline</rt></ruby>字符][7]。当你的数据包含 新行字符时， `-z` 选项就特别有用了，例如当处理文件名的时候（因为在文件名中新行字符是可以使用的，而 NUL 则不可以）。

为了展示 `-z` 选项，让我们先做一点实验。首先，我们将创建一个文件名中包含换行符的文件：

```
bash$ touch $'EMPTY\nFILE\nWITH FUNKY\nNAME'.txt
bash$ ls -1 *.txt
BALANCE.txt
BALANCE-V2.txt
EMPTY?FILE?WITH FUNKY?NAME.txt
```

现在假设我想展示每个 `*.txt` 文件的前 5 个字符。一个想当然的解决方法将会失败：

```
sh$ ls -1 *.txt | cut -c 1-5
BALAN
BALAN
EMPTY
FILE
WITH
NAME.
```

你可以已经知道 [ls][21] 是为了[方便人类使用][33]而特别设计的，并且在一个命令管道中使用它是一个反模式（确实是这样的）。所以让我们用 [find][22] 来替换它：

```
sh$ find . -name '*.txt' -printf "%f\n" | cut -c 1-5
BALAN
EMPTY
FILE
WITH
NAME.
BALAN
```

上面的命令基本上产生了与先前类似的结果（尽管以不同的次序，因为 `ls` 会隐式地对文件名做排序，而 `find` 则不会）。

在上面的两个例子中，都有一个相同的问题，`cut` 命令不能区分 新行 字符是数据域的一部分（即文件名），还是作为最后标记的 新行 记号。但使用 NUL 字节（`\0`）来作为行终止符就将排除掉这种混淆的情况，使得我们最后可以得到期望的结果：

```
# 我被告知在某些旧版的 `tr` 程序中需要使用 `\000` 而不是 `\0` 来代表 NUL 字符（假如你需要这种改变请让我知晓！）
sh$ find . -name '*.txt' -printf "%f\0" | cut -z -c 1-5| tr '\0' '\n'
BALAN
EMPTY
BALAN
```

通过上面最后的例子，我们就达到了本文的最后部分了，所以我将让你自己试试 `-printf` 后面那个有趣的 `"%f\0"` 参数或者理解为什么我在管道的最后使用了 [tr][23] 命令。

### 使用 cut 命令可以实现更多功能

我只是列举了 `cut` 命令的最常见且在我眼中最基础的使用方式。你甚至可以将它以更加实用的方式加以运用，这取决于你的逻辑和想象。

不要再犹豫了，请使用下面的评论框贴出你的发现。最后一如既往的，假如你喜欢这篇文章，请不要忘记将它分享到你最喜爱网站和社交媒体中！

--------------------------------------------------------------------------------

via: https://linuxhandbook.com/cut-command/

作者：[Sylvain Leroux][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxhandbook.com/author/sylvain/
[1]:https://linuxhandbook.com/cut-command/#_what_s_a_range
[2]:https://linuxhandbook.com/cut-command/#_working_with_multibyte_characters
[3]:https://linuxhandbook.com/cut-command/#_handling_lines_not_containing_the_delimiter
[4]:https://linuxhandbook.com/cut-command/#_changing_the_output_delimiter
[5]:http://click.linksynergy.com/deeplink?id=IRL8ozn3lq8&type=10&mid=39197&murl=https%3A%2F%2Fwww.udemy.com%2Fyes-i-know-the-bash-linux-command-line-tools%2F
[6]:https://en.wikipedia.org/wiki/Null_character
[7]:https://en.wikipedia.org/wiki/Newline
[8]:https://linuxhandbook.com/cut-command/#_working_with_character_ranges
[9]:https://linuxhandbook.com/cut-command/#_working_with_byte_ranges
[10]:https://linuxhandbook.com/cut-command/#_working_with_fields
[11]:https://linuxhandbook.com/cut-command/#_non_posix_gnu_extensions
[12]:https://linux.die.net/man/1/hexdump
[13]:https://linuxhandbook.com/awk-command-tutorial/
[14]:http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html#tag_20_28_18
[15]:https://en.wikipedia.org/wiki/UTF-8#Codepage_layout
[16]:https://www.fileformat.info/info/unicode/char/00c9/index.htm
[17]:https://en.wikipedia.org/wiki/Shift_JIS#Shift_JIS_byte_map
[18]:http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html#tag_20_28_16
[19]:https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html#cut-invocation
[20]:https://www.openbsd.org/
[21]:https://linux.die.net/man/1/ls
[22]:https://linux.die.net/man/1/find
[23]:https://linux.die.net/man/1/tr
[24]:https://linuxhandbook.com/author/sylvain/
[25]:https://linuxhandbook.com/cut-command/#comments
[26]:https://static.yesik.it/EP22/Yes_I_Know_IT-EP22.tar.gz
[27]:https://en.wikipedia.org/wiki/ASCII#Character_set
[28]:https://en.wikipedia.org/wiki/Control_character
[29]:https://en.wikipedia.org/wiki/Comma-separated_values
[30]:https://en.wikipedia.org/wiki/Decimal_separator
[31]:https://en.wikipedia.org/wiki/Tab_key#Tab_characters
[32]:https://en.wikipedia.org/wiki/Tab-separated_values
[33]:http://lists.gnu.org/archive/html/coreutils/2014-02/msg00005.html
