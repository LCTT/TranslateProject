如何查找 Linux 中最大的 10 个文件
======


当系统的磁盘空间不足时，您可能更愿意使用 `df`、`du` 或 `ncdu` 命令进行检查，但这些命令只会显示当前目录的文件，并不会显示整个系统范围的文件。

您得花费大量的时间才能用上述命令获取系统中最大的文件，因为要进入到每个目录重复运行上述命令。

这个方法比较麻烦，也并不恰当。

如果是这样，那么该如何在 Linux 中找到最大的 10 个文件呢？

我在谷歌上搜索了很久，却没发现类似的文章，我反而看到了很多关于列出当前目录中最大的 10 个文件的文章。所以，我希望这篇文章对那些有类似需求的人有所帮助。

本教程中，我们将教您如何使用以下四种方法在 Linux 系统中查找最大的前 10 个文件。

### 方法 1：

在 Linux 中没有特定的命令可以直接执行此操作，因此我们需要将多个命令结合使用。

```
# find / -type f -print0 | xargs -0 du -h | sort -rh | head -n 10

1.4G	/swapfile
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
93M	/usr/lib/firefox/libxul.so
84M	/var/lib/snapd/snaps/core_3604.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3247.snap

```

**详解：**

**`find`**：在目录结构中搜索文件的命令

**`/`**：在整个系统（从根目录开始）中查找

**`-type`**：指定文件类型

**`f`**：普通文件

**`-print0`**：输出完整的文件名，其后跟一个空字符

**`|`**：控制操作符，将一条命令的输出传递给下一个命令以供进一步处理

**`xargs`**：将标准输入转换成命令行参数的命令

**`-0`**：以空字符（null）而不是空白字符（whitespace）（LCTT 译者注：即空格、制表符和换行）来分割记录

**`du -h`**：以可读格式计算磁盘空间使用情况的命令

**`sort`**：对文本文件进行排序的命令

**`-r`**：反转结果

**`-h`**：用可读格式打印输出

**`head`**：输出文件开头部分的命令

**`n -10`**：打印前 10 个文件

### 方法 2：

这是查找 Linux 系统中最大的前 10 个文件的另一种方法。我们依然使用多个命令共同完成这个任务。

```
# find / -type f -exec du -Sh {} + | sort -rh | head -n 10

1.4G	/swapfile
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
93M	/usr/lib/firefox/libxul.so
84M	/var/lib/snapd/snaps/core_3604.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3247.snap

```

**详解：**

**`find`**：在目录结构中搜索文件的命令

**`/`**：在整个系统（从根目录开始）中查找

**`-type`**：指定文件类型

**`f`**：普通文件

**`-exec`**：在所选文件上运行指定命令

**`du`**：计算文件占用的磁盘空间的命令

**`-S`**：不包含子目录的大小

**`-h`**：以可读格式打印

**`{}`**：递归地查找目录，统计每个文件占用的磁盘空间

**`|`**：控制操作符，将一条命令的输出传递给下一个命令以供进一步处理

**`sort`**：对文本文件进行按行排序的命令

**`-r`**：反转结果

**`-h`**：用可读格式打印输出

**`head`**：输出文件开头部分的命令

**`n -10`**：打印前 10 个文件

### 方法 3：

这里介绍另一种方法，在 Linux 系统中搜索最大的前 10 个文件。

```
# find / -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}

84M	/var/lib/snapd/snaps/core_3247.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3604.snap
93M	/usr/lib/firefox/libxul.so
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
1.4G	/swapfile

```

**详解：**

**`find`**：在目录结构中搜索文件的命令

**`/`**：在整个系统（从根目录开始）中查找

**`-type`**：指定文件类型

**`f`**：普通文件

**`-print0`**：输出完整的文件名，其后跟一个空字符

**`|`**：控制操作符，将一条命令的输出传递给下一个命令以供进一步处理

**`xargs`**：将标准输入转换成命令行参数的命令

**`-0`**：以空字符（null）而不是空白字符（whitespace）来分割记录

**`du`**：计算文件占用的磁盘空间的命令

**`sort`**：对文本文件进行按行排序的命令

**`-n`**：根据数字大小进行比较

**`tail -10`**：输出文件结尾部分的命令（最后 10 个文件）

**`cut`**：从每行删除特定部分的命令

**`-f2`**：只选择特定字段值

**`-I{}`**：将初始参数中出现的每个替换字符串都替换为从标准输入读取的名称

**`-s`**：仅显示每个参数的总和

**`-h`**：用可读格式打印输出

**`{}`**：递归地查找目录，统计每个文件占用的磁盘空间

### 方法 4：

还有一种在 Linux 系统中查找最大的前 10 个文件的方法。

```
# find / -type f -ls | sort -k 7 -r -n | head -10 | column -t | awk '{print $7,$11}'

1494845440 /swapfile
1085984380 /home/magi/ubuntu-17.04-desktop-amd64.iso
591003648 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
395770383 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
394891761 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
103999072 /usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
97356256 /usr/lib/firefox/libxul.so
87896064 /var/lib/snapd/snaps/core_3604.snap
87793664 /var/lib/snapd/snaps/core_3440.snap
87089152 /var/lib/snapd/snaps/core_3247.snap

```

**详解：**

**`find`**：在目录结构中搜索文件的命令

**`/`**：在整个系统（从根目录开始）中查找

**`-type`**：指定文件类型

**`f`**：普通文件

**`-ls`**：在标准输出中以 `ls -dils` 的格式列出当前文件

**`|`**：控制操作符，将一条命令的输出传递给下一个命令以供进一步处理

**`sort`**：对文本文件进行按行排序的命令

**`-k`**：按指定列进行排序

**`-r`**：反转结果

**`-n`**：根据数字大小进行比较

**`head`**：输出文件开头部分的命令

**`-10`**：打印前 10 个文件

**`column`**：将其输入格式化为多列的命令

**`-t`**：确定输入包含的列数并创建一个表

**`awk`**：样式扫描和处理语言

**`'{print $7,$11}'`**：只打印指定的列

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-find-search-check-print-top-10-largest-biggest-files-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/