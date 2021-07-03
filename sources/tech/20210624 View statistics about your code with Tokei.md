[#]: subject: (View statistics about your code with Tokei)
[#]: via: (https://opensource.com/article/21/6/tokei)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (zepoch)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

View statistics about your code with Tokei
======
Learn details about projects' programming languages and more.
![A screen of code.][1]

Recently, GitHub added a small indicator that shows details about projects, including what programming languages a project uses. Before this, it was hard for new contributors to know this type of information about the projects they were interested in.

This addition is helpful, but what if you want to know the same information about projects in your local repository? That's where [Tokei][2] comes in handy. It's a tool that tells you code statistics about a project, which is especially useful when you want to build a project with people who are proficient in different languages.

### Exploring Tokei

According to its [README][3], "Tokei is a program that displays statistics about your code. Tokei will show the number of files, total lines within those files and code, comments, and blanks grouped by language." The introduction to its v.12.1.0 release [elaborates][4], "Tokei is a fast and accurate code analysis CLI tool and library, allowing you to easily and quickly see how many blank lines, comments, and lines of code are in your codebase." It can identify over 150 programming languages.


```
$ ./tokei ~/exa/src ~/Work/wildfly/jaxrs
==================
Language   Files Lines Code Comments Blank
Java        46    6135  4324  945     632
XML         23    5211  4839  473     224
\---------------------------------
Rust
Markdown
\-----------------------------------
Total
```

### Install Tokei

To install Tokei in Fedora:


```
`$ sudo dnf install tokei`
```

To install it with Rust's Cargo package manager:


```
`$ cargo install tokei`
```

### Use Tokei

To list code statistics for the current directory:


```
$ tokei
===============================================================================
 Language            Files        Lines         Code     Comments       Blanks
===============================================================================
 Ada                    10         2840         1681          560          599
 Assembly                4         2508         1509          458          541
 GNU Style Assembly      4         2751         1528          748          475
 Autoconf               16         2294         1153          756          385
 Automake                1           45           34            0           11
 BASH                    4         1895         1602          133          160
 Batch                   2            4            4            0            0
 C                     330       206433       150241        23402        32790
 C Header              342        60941        24682        29143         7116
 CMake                  48         4572         3459          548          565
 C#                      9         1615          879          506          230
 C++                     5          907          599          136          172
 Dockerfile              2           16           10            0            6
 Fish                    1           87           77            5            5
 HTML                    1          545          544            1            0
 JSON                    5         8995         8995            0            0
 Makefile               10          504          293           72          139
 Module-Definition      12         1183         1046           65           72
 MSBuild                 1          141          140            0            1
 Pascal                  4         1443         1016          216          211
 Perl                    2          189          137           16           36
 Python                  4         1257          949          112          196
 Ruby                    1           23           18            1            4
 Shell                  15         1860         1411          222          227
 Plain Text             35        29425            0        26369         3056
 TOML                   64         3180         2302          453          425
 Visual Studio Pro|     30        14597        14597            0            0
 Visual Studio Sol|      6          655          650            0            5
 XML                     1          116           95           17            4
 YAML                    2           81           56           12           13
 Zsh                     1           59           48            8            3
\-------------------------------------------------------------------------------
 Markdown               55         4677            0         3214         1463
 |- C                    1            2            2            0            0
 |- Rust                19          336          268           20           48
 |- TOML                23           61           60            0            1
 (Total)                           5076          330         3234         1512
\-------------------------------------------------------------------------------
 Rust                  496       210966       188958         5348        16660
 |- Markdown           249        17676         1551        12502         3623
 (Total)                         228642       190509        17850        20283
===============================================================================
 Total                1523       566804       408713        92521        65570
===============================================================================
$
```

The following command prints out the supported languages and extensions:


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

If you run `tokei` on two files and specify their location as an argument, it prints the stats for individual files in a last-in-first-out format:

![Running Tokei on two files][5]

(Sudeshna Sur, [CC BY-SA 4.0][6])

By default, `tokei` outputs only data about the languages used, but using the `--files` flag provides individual file statistics:


```
$ tokei ~/exa/src --files
===========================================================================================
 Language                              Files      Lines      Code             Comments     Blanks
===========================================================================================
 Rust                                   54          9339        7070             400       1869
 |- Markdown                            33          1306           0            1165        141
 (Total)                                           10645        7070        1565       2010
\-------------------------------------------------------------------------------------------
 /home/ssur/exa/src/theme/default_theme.rs           130         107           0         23
 /home/ssur/exa/src/output/render/times.rs            30          24           0          6
 /home/ssur/exa/src/output/render/users.rs            98          76           0         22
 /home/ssur/exa/src/output/render/size.rs            182         141           3         38
 /home/ssur/exa/src/output/render/octal.rs           116          88           0         28
 /home/ssur/exa/src/output/render/mod.rs              33          20           3         10
 /home/ssur/exa/src/output/render/inode.rs            28          20           0          8
 /home/ssur/exa/src/output/render/links.rs            87          65           0         22
 /home/ssur/exa/src/output/render/groups.rs          123          93           0         30
 |ome/ssur/exa/src/output/render/filetype.rs          31          26           0          5
 /home/ssur/exa/src/output/render/blocks.rs           57          40           0         17
 /home/ssur/exa/src/output/render/git.rs             108          87           0         21
 |/ssur/exa/src/output/render/permissions.rs         204         160           3         41
 /home/ssur/exa/src/output/grid.rs                    67          51           3         13
 /home/ssur/exa/src/output/escape.rs                  26          18           4          4
 /home/ssur/exa/src/theme/lsc.rs                     235         158          39         38
 /home/ssur/exa/src/options/theme.rs                 159         124           6         29
 /home/ssur/exa/src/options/file_name.rs              46          39           0          7
 /home/ssur/exa/src/options/flags.rs                  84          63           6         15
 /home/ssur/exa/src/fs/mod.rs                         10           8           0          2
 /home/ssur/exa/src/fs/feature/mod.rs                 33          25           0          8
\-- /home/ssur/exa/src/output/time.rs ---------------------------------------------------------------
 |- Rust                                             215          170          5         40
 |- Markdown                                          28            0         25          3
```

### Conclusion

I found it very easy to use `tokei` to learn more about my code statistics. Another good thing about `tokei` is that it can be used as a library, which makes it easy to integrate into other projects. Visit Tokei's [Crate.io page][7] and [Docs.rs][8] to learn more about its usage. If you would like to get involved, you can also contribute to Tokei through its [GitHub repository][2].

Do you find Tokei useful? Let us know in the comments section below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/tokei

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming_screen.png?itok=BgcSm5Pl (A screen of code.)
[2]: https://github.com/XAMPPRocky/tokei
[3]: https://github.com/XAMPPRocky/tokei/blob/master/README.md
[4]: https://github.com/XAMPPRocky/tokei/releases/tag/v12.1.0
[5]: https://opensource.com/sites/default/files/uploads/tokei-two-files_0.png (Running Tokei on two files)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://crates.io/crates/tokei
[8]: https://docs.rs/tokei/12.1.2/tokei/
