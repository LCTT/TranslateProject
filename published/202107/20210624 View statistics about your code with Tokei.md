[#]: subject: "View statistics about your code with Tokei"
[#]: via: "https://opensource.com/article/21/6/tokei"
[#]: author: "Sudeshna Sur https://opensource.com/users/sudeshna-sur"
[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13554-1.html"

使用 Tokei 查看有关代码的统计信息
======

> 了解有关项目编程语言的详细信息。

![](https://img.linux.net.cn/data/attachment/album/202107/06/114306ar6zjnrr92rn2vnz.jpg)

近来，GitHub 添加了一个小指标来展示项目的细节，包括项目使用的编程语言。在这之前，对一个新的贡献者来说，了解他们感兴趣的项目的信息是较为困难的。

这个补充很有帮助，但是如果您想知道有关本地存储库中项目的相同信息该怎么办呢？ 这正是 [Tokei][2] 派上用场的地方。这是一个当你想和精通不同语言的人想要构建一个项目时可以告诉你项目的代码数据的特别有用的工具。

### 探索 Tokei

据其 [README][3]，“Tokei 是一个可以展示你的代码数据的程序。Tokei 将会展示文件的数量，和这些文件中不同语言的代码、注释、空白的行数。”它的 v.12.1.0 版本 [elaborates][4] 是这样子介绍的，“Tokei 是一个快速准确的代码分析 CLI 工具和库，可以使你轻松快速地在你的代码库中看到有多少空白、评论和代码行”。它能够识别超过 150 种编程语言。

```
$ ./tokei ~/exa/src ~/Work/wildfly/jaxrs
==================
Language   Files Lines Code Comments Blank
Java        46    6135  4324  945     632
XML         23    5211  4839  473     224
---------------------------------
Rust
Markdown
-----------------------------------
Total
```

### 安装 Tokei

在 Fedora 上安装 Tokei：

```
$ sudo dnf install tokei
```

用 Rust's Cargo 包管理器安装：

```
$ cargo install tokei
```

### 使用 Tokei

要列出当前目录中的代码统计：

```
$ tokei
===============================================================================
 Language            Files        Lines         Code     Comments       Blanks
===============================================================================
 Ada                    10         2840         1681          560          599
 Assembly                4         2508         1509          458          541
 GNU Style Assembly      4         2751         1528          748          475
 Autoconf               16         2294         1153          756          385
 Automake                1           45           34            0           11
 BASH                    4         1895         1602          133          160
 Batch                   2            4            4            0            0
 C                     330       206433       150241        23402        32790
 C Header              342        60941        24682        29143         7116
 CMake                  48         4572         3459          548          565
 C#                      9         1615          879          506          230
 C++                     5          907          599          136          172
 Dockerfile              2           16           10            0            6
 Fish                    1           87           77            5            5
 HTML                    1          545          544            1            0
 JSON                    5         8995         8995            0            0
 Makefile               10          504          293           72          139
 Module-Definition      12         1183         1046           65           72
 MSBuild                 1          141          140            0            1
 Pascal                  4         1443         1016          216          211
 Perl                    2          189          137           16           36
 Python                  4         1257          949          112          196
 Ruby                    1           23           18            1            4
 Shell                  15         1860         1411          222          227
 Plain Text             35        29425            0        26369         3056
 TOML                   64         3180         2302          453          425
 Visual Studio Pro|     30        14597        14597            0            0
 Visual Studio Sol|      6          655          650            0            5
 XML                     1          116           95           17            4
 YAML                    2           81           56           12           13
 Zsh                     1           59           48            8            3
-------------------------------------------------------------------------------
 Markdown               55         4677            0         3214         1463
 |- C                    1            2            2            0            0
 |- Rust                19          336          268           20           48
 |- TOML                23           61           60            0            1
 (Total)                           5076          330         3234         1512
-------------------------------------------------------------------------------
 Rust                  496       210966       188958         5348        16660
 |- Markdown           249        17676         1551        12502         3623
 (Total)                         228642       190509        17850        20283
===============================================================================
 Total                1523       566804       408713        92521        65570
===============================================================================
$
```

下面的命令打印出了支持的语言和拓展：

```
$ tokei -l
ABNF
ABAP
ActionScript
Ada
Agda
Alex
Alloy
Arduino C++
AsciiDoc
ASN.1
ASP
ASP.NET
Assembly
GNU Style Assembly
```

如果你在两个文件夹上运行 `tokei` 并指定其位置作为参数，它将以先入先出的规则打印单个文件的统计数据：

![Running Tokei on two files][5]

默认情况下，`tokei` 仅仅输出有关语言的数据，但是使用 `--files` 标记可提供单个文件统计信息：

```
$ tokei ~/exa/src --files
===========================================================================================
 Language                              Files      Lines      Code             Comments     Blanks
===========================================================================================
 Rust                                   54          9339        7070             400       1869
 |- Markdown                            33          1306           0            1165        141
 (Total)                                           10645        7070        1565       2010
-------------------------------------------------------------------------------------------
 /home/ssur/exa/src/theme/default_theme.rs           130         107           0         23
 /home/ssur/exa/src/output/render/times.rs            30          24           0          6
 /home/ssur/exa/src/output/render/users.rs            98          76           0         22
 /home/ssur/exa/src/output/render/size.rs            182         141           3         38
 /home/ssur/exa/src/output/render/octal.rs           116          88           0         28
 /home/ssur/exa/src/output/render/mod.rs              33          20           3         10
 /home/ssur/exa/src/output/render/inode.rs            28          20           0          8
 /home/ssur/exa/src/output/render/links.rs            87          65           0         22
 /home/ssur/exa/src/output/render/groups.rs          123          93           0         30
 |ome/ssur/exa/src/output/render/filetype.rs          31          26           0          5
 /home/ssur/exa/src/output/render/blocks.rs           57          40           0         17
 /home/ssur/exa/src/output/render/git.rs             108          87           0         21
 |/ssur/exa/src/output/render/permissions.rs         204         160           3         41
 /home/ssur/exa/src/output/grid.rs                    67          51           3         13
 /home/ssur/exa/src/output/escape.rs                  26          18           4          4
 /home/ssur/exa/src/theme/lsc.rs                     235         158          39         38
 /home/ssur/exa/src/options/theme.rs                 159         124           6         29
 /home/ssur/exa/src/options/file_name.rs              46          39           0          7
 /home/ssur/exa/src/options/flags.rs                  84          63           6         15
 /home/ssur/exa/src/fs/mod.rs                         10           8           0          2
 /home/ssur/exa/src/fs/feature/mod.rs                 33          25           0          8
-- /home/ssur/exa/src/output/time.rs ---------------------------------------------------------------
 |- Rust                                             215          170          5         40
 |- Markdown                                          28            0         25          3
```

### 总结

我发现使用 `tokei` 来了解我的代码统计数据十分容易。另一个使用 `tokei` 的好处就是它可以用作为一个很容易集成到其他项目的库。访问 Tokei 的 [Crate.io page][7] 和 [Docs.rs][8] 网站来了解其更多用法。如果你想参与其中，你也可以通过它的 [GitHub 仓库][2] 来为 Tokei 作贡献。

你是否觉得 Tokei 很有用呢？可以在下方的评论区告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/tokei

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming_screen.png?itok=BgcSm5Pl "A screen of code."
[2]: https://github.com/XAMPPRocky/tokei
[3]: https://github.com/XAMPPRocky/tokei/blob/master/README.md
[4]: https://github.com/XAMPPRocky/tokei/releases/tag/v12.1.0
[5]: https://opensource.com/sites/default/files/uploads/tokei-two-files_0.png "Running Tokei on two files"
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://crates.io/crates/tokei
[8]: https://docs.rs/tokei/12.1.2/tokei/
