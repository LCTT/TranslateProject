[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11666-1.html)
[#]: subject: (How to remove duplicate lines from files with awk)
[#]: via: (https://opensource.com/article/19/10/remove-duplicate-lines-files-awk)
[#]: author: (Lazarus Lazaridis https://opensource.com/users/iridakos)

怎样使用 awk 删掉文件中重复的行
======

> 学习怎样使用 awk 的 `!visited[$0]++` 在不重新排序或改变原排列顺序的前提下删掉重复的行。 

![](https://img.linux.net.cn/data/attachment/album/201912/12/124322vwe3tq3wlw33tw1f.jpg)

假设你有一个文本文件，你需要删掉所有重复的行。

### TL;DR

*要保持原来的排列顺序*删掉重复行，使用：

```
awk '!visited[$0]++' your_file > deduplicated_file
```

### 工作原理

这个脚本维护一个关联数组，索引（键）为文件中去重后的行，每个索引对应的值为该行出现的次数。对于文件的每一行，如果这行（之前）出现的次数为 0，则值加 1，并打印这行，否则值加 1，不打印这行。

我之前不熟悉 `awk`，我想弄清楚这么短小的一个脚本是怎么实现的。我调研了下，下面是调研心得：

* 这个 awk “脚本” `!visited[$0]++` 对输入文件的*每一行*都执行。
* `visited[]` 是一个[关联数组][2]（又名[映射][3]）类型的变量。`awk` 会在第一次执行时初始化它，因此我们不需要初始化。
* `$0` 变量的值是当前正在被处理的行的内容。
* `visited[$0]` 通过与 `$0`（正在被处理的行）相等的键来访问该映射中的值，即出现次数（我们在下面设置的）。
* `!` 对表示出现次数的值取反：
    * 在 `awk` 中，[任意非零的数或任意非空的字符串的值是 `true`][4]。
    * [变量默认的初始值为空字符串][5]，如果被转换为数字，则为 0。
    * 也就是说：
        * 如果 `visited[$0]` 的值是一个比 0 大的数，取反后被解析成 `false`。
        * 如果 `visited[$0]` 的值为等于 0 的数字或空字符串，取反后被解析成 `true` 。
    * `++` 表示变量 `visited[$0]` 的值加 1。
        * 如果该值为空，`awk` 自动把它转换为 `0`（数字） 后加 1。 
        * 注意：加 1 操作是在我们取到了变量的值之后执行的。

总的来说，整个表达式的意思是：

  * `true`：如果表示出现次数为 0 或空字符串
  * `false`：如果出现的次数大于 0

`awk` 由 [模式或表达式和一个与之关联的动作][6] 组成：

```
<模式/表达式> { <动作> }
```

如果匹配到了模式，就会执行后面的动作。如果省略动作，`awk` 默认会打印（`print`）输入。

> 省略动作等价于 `{print $0}`。

我们的脚本由一个 `awk` 表达式语句组成，省略了动作。因此这样写：

```
awk '!visited[$0]++' your_file > deduplicated_file
```

等于这样写：

```
awk '!visited[$0]++ { print $0 }' your_file > deduplicated_file
```

对于文件的每一行，如果表达式匹配到了，这行内容被打印到输出。否则，不执行动作，不打印任何东西。

### 为什么不用 uniq 命令？

`uniq` 命令仅能对相邻的行去重。这是一个示例：

```
$ cat test.txt
A
A
A
B
B
B
A
A
C
C
C
B
B
A
$ uniq < test.txt
A
B
A
C
B
A
```

### 其他方法

#### 使用 sort 命令

我们也可以用下面的 [sort][7] 命令来去除重复的行，但是*原来的行顺序没有被保留*。


```
sort -u your_file > sorted_deduplicated_file
```

#### 使用 cat + sort + cut

上面的方法会产出一个去重的文件，各行是基于内容进行排序的。[通过管道连接命令][8]可以解决这个问题。


```
cat -n your_file | sort -uk2 | sort -nk1 | cut -f2-
```

**工作原理**

假设我们有下面一个文件：

```
abc
ghi
abc
def
xyz
def
ghi
klm
```

`cat -n test.txt` 在每行前面显示序号：

```
1       abc
2       ghi
3       abc
4       def
5       xyz
6       def
7       ghi
8       klm
```

`sort -uk2` 基于第二列（`k2` 选项）进行排序，对于第二列相同的值只保留一次（`u` 选项）：

```
1       abc
4       def
2       ghi
8       klm
5       xyz
```

`sort -nk1` 基于第一列排序（`k1` 选项），把列的值作为数字来处理（`-n` 选项）：

```
1       abc
2       ghi
4       def
5       xyz
8       klm
```

最后，`cut -f2-` 从第二列开始打印每一行，直到最后的内容（`-f2-` 选项：留意 `-` 后缀，它表示这行后面的内容都包含在内）。

```
abc
ghi
def
xyz
klm
```

### 参考

* [GNU awk 用户手册][9]
* [awk 中的数组][2]
* [Awk — 真值][4]
* [Awk 表达式][5]
* [Unix 怎么删除文件中重复的行？][10]
* [不用排序去掉重复的行（去重）][11]
* ['!a[$0]++' 工作原理][12]

以上为全文。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/remove-duplicate-lines-files-awk

作者：[Lazarus Lazaridis][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/iridakos
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://kirste.userpage.fu-berlin.de/chemnet/use/info/gawk/gawk_12.html
[3]: https://en.wikipedia.org/wiki/Associative_array
[4]: https://www.gnu.org/software/gawk/manual/html_node/Truth-Values.html
[5]: https://ftp.gnu.org/old-gnu/Manuals/gawk-3.0.3/html_chapter/gawk_8.html
[6]: http://kirste.userpage.fu-berlin.de/chemnet/use/info/gawk/gawk_9.html
[7]: http://man7.org/linux/man-pages/man1/sort.1.html
[8]: https://stackoverflow.com/a/20639730/2292448
[9]: https://www.gnu.org/software/gawk/manual/html_node/
[10]: https://stackoverflow.com/questions/1444406/how-can-i-delete-duplicate-lines-in-a-file-in-unix
[11]: https://stackoverflow.com/questions/11532157/remove-duplicate-lines-without-sorting
[12]: https://unix.stackexchange.com/questions/159695/how-does-awk-a0-work/159734#159734
[13]: https://opensource.com/sites/default/files/uploads/duplicate-cat.jpg (Duplicate cat)
[14]: https://iridakos.com/about/
[15]: http://creativecommons.org/licenses/by-nc/4.0/
