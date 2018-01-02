如何优雅的使用大部分的 Linux 文件压缩
=======
    如果你对 linux 系统下的对文件压缩命令或操作的有效性有任何疑问 ，你应该看一下 **apropos compress** 这个命令的输出 ；如果你有机会这么做 ，你会惊异于有如此多的的命令来进行压缩文件和解压缩文件 ；还有许多命令来进行压缩文件的比较 ，检验 ，并且能够在压缩文件中的内容中进行搜索 ，甚至能够把压缩文件从一个格式变成另外一种格式 （ *.z 格式变为 *.gz 格式 ） 。
    你想在所有词目中寻找一组 bzip2 的压缩命令 。包括 zip ，gzip ，和 xz 在内 ，你将得到一个有意思的操作。

```
$ apropos compress | grep ^bz
    bzcat (1)            - decompresses files to stdout
    bzcmp (1)            - compare bzip2 compressed files
    bzdiff (1)           - compare bzip2 compressed files
    bzegrep (1)          - search possibly bzip2 compressed files for a regular expression
    bzexe (1)            - compress executable files in place
    bzfgrep (1)          - search possibly bzip2 compressed files for a regular expression
    bzgrep (1)           - search possibly bzip2 compressed files for a regular expression
    bzip2 (1)            - a block-sorting file compressor, v1.0.6
    bzless (1)           - file perusal filter for crt viewing of bzip2 compressed text
    bzmore (1)           - file perusal filter for crt viewing of bzip2 compressed text   
```

    在我的Ubuntu系统上 ，列出了超过 60 条命令作为 apropos compress 命令的返回 。

## 压缩算法
    压缩并没有普适的方案 ，某些压缩工具是有损耗的压缩 ，例如能够使 mp3 文件减小大小而能够是听者有接近聆听原声的音乐感受 。但是 Linux 命令行能够用算法使压缩文件或档案文件能够重新恢复为原始数据 ，换句话说 ，算法能够使压缩或存档无损 。

    这是如何做到的 ？300 个相同的在一行的相同的字符能够被压缩成像 “300x” 。但是这种算法不会对大多数的文件产生有效的益处 。因为文件中完全随机的序列要比相同字符的序列要多的多 。 压缩算法会越来越复杂和多样 ，所以在 Unix 早期 ，压缩是第一个被介绍的 。

## 在 Linux 系统上的压缩命令
    在 Linux 系统上最常用的压缩命令是 zip ，gzip ，bzip2 ，xz 。 前面提到的常用压缩命令以同样的方式工作 。会权衡文件内容压缩程度 ，压缩花费的时间 ，压缩文件在其他你需要使用的系统上的兼容性 。
    一些时候压缩一个文件并不会花费很多时间和性能 。在下面的例子中 ，被压缩的文件会比原始文件要大 。当在一个不是很普遍的情况下 ，尤其是在文件内容达到一定等级的随机度 。

```
$ time zip bigfile.zip bigfile
    adding: bigfile (default 0% )
real    0m0.055s
user    0m0.000s
sys     0m0.016s 
$ ls -l bigfile*
-rw-r--r-- 1 root root   0 12月 20 22:36 bigfile
-rw------- 1 root root 164 12月 20 22:41 bigfile.zip
```
    注意压缩后的文件 ( bigfile.zip ) 比源文件 ( bigfile ) 要大 。如果压缩增加了文件的大小或者减少的很少的百分比 ，那就只剩下在线备份的好处了 。如果你在压缩文件后看到了下面的信息 。你不会得到太多的益处 。
        ( defalted 1% )

    文件内容在文件压缩的过程中有很重要的作用 。在上面文件大小增加的例子中是因为文件内容过于随机 。压缩一个文件内容只包含 0 的文件 。你会有一个相当震惊的压缩比 。在如此极端的情况下 ，三个常用的压缩工具都有非常棒的效果 。

```
-rw-rw-r-- 1 shs shs 10485760 Dec 8 12:31 zeroes.txt
-rw-rw-r-- 1 shs shs 49 Dec 8 17:28 zeroes.txt.bz2
-rw-rw-r-- 1 shs shs 10219 Dec 8 17:28 zeroes.txt.gz
-rw-rw-r-- 1 shs shs 1660 Dec 8 12:31 zeroes.txt.xz
-rw-rw-r-- 1 shs shs 10360 Dec 8 12:24 zeroes.zip
```
    你不会喜欢为了查看文件中的 50 个字节的而将 10 0000 0000 字节的数据完全解压 。这样是及其不可能的 。
    在更真实的情况下 ，大小差异是总体上的不同 -- 不是重大的效果 -- 对于一个小的公正的 jpg 的图片文件 。

```
-rw-r--r-- 1 shs shs 13522 Dec 11 18:58 image.jpg
-rw-r--r-- 1 shs shs 13875 Dec 11 18:58 image.jpg.bz2
-rw-r--r-- 1 shs shs 13441 Dec 11 18:58 image.jpg.gz
-rw-r--r-- 1 shs shs 13508 Dec 11 18:58 image.jpg.xz
-rw-r--r-- 1 shs shs 13581 Dec 11 18:58 image.jpg.zip
```

    在压缩拉的文本文件时 ，你会发现重要的不同 。
```
$ ls -l textfile*
    -rw-rw-r-- 1 shs shs 8740836 Dec 11 18:41 textfile
    -rw-rw-r-- 1 shs shs 1519807 Dec 11 18:41 textfile.bz2
    -rw-rw-r-- 1 shs shs 1977669 Dec 11 18:41 textfile.gz
    -rw-rw-r-- 1 shs shs 1024700 Dec 11 18:41 textfile.xz
    -rw-rw-r-- 1 shs shs 1977808 Dec 11 18:41 textfile.zip
```

    在这种情况下 ，XZ 相较于其他压缩文件有效的减小了文件的大小 ，对于第二的 bzip2 命令也有很大的提高 

## 查看压缩文件

    以 more 结尾的命令能够让你查看压缩文件而不解压文件 。

```
bzmore (1) - file perusal filter for crt viewing of bzip2 compressed text
lzmore (1) - view xz or lzma compressed (text) files
xzmore (1) - view xz or lzma compressed (text) files
zmore (1) - file perusal filter for crt viewing of compressed text
```
    这些命令在大多数工作中被使用 ，自从不得不使文件解压缩而只为了显示给用户 。在另一方面 ，留下被解压的文件在系统中 。这些命令简单的使文件解压缩 。

```
$ xzmore textfile.xz | head -1
    Here is the agenda for tomorrow's staff meeting:       
```

## 比较压缩文件
    许多的压缩工具箱包含一个差异命令 ( 例如 ：xzdiff ) 。这些工具通过这些工作来进行比较和差异而不是做算法指定的比较 。例如 ，xzdiff 命令比较 bz2 类型的文件和比较 xz 类型的文件一样简单 。

## 如何选择最好的 Linux 压缩工具
    如何选择压缩工具取决于你工作 。在一些情况下 ，选择取决于你所压缩的数据内容 。在更多的情况下 ，取决你你组织的惯例 ，除非你对磁盘空间有着很高的敏感度 。下面是一般的建议 ：
    zip ：文件需要被分享或者会在 Windows 系统下使用 。
    gzip ：文件在 Unix/Linux 系统下使用 。长远来看 ，bzip2 是普遍存在的 。
    bzip2 ：使用了不同的算法 ，产生比 gzip 更小的文件 ，但是花更长的时间 。
    xz ：一般提供做好的压缩率 ，但是也会花费相当的时间 。比其他工具更新 ，可能在你工作的系统上不存在 。

## 注意
    当你在压缩文件时，你有很多选择 ，在极少的情况下 ，会产生无效的磁盘存储空间。

--------------------------------------------------------------------------------
via: https://www.networkworld.com/article/3240938/linux/how-to-squeeze-the-most-out-of-linux-file-compression.html

作者 ：[ Sandra Henry-Stocker ][1] 译者：[ singledo ][2] 校对：校对者ID

本文由 [ LCTT ][3]原创编译，Linux中国 荣誉推出

[1]:https://www.networkworld.com
[2]:https://github.com/singledo
[3]:https://github.com/LCTT/TranslateProject