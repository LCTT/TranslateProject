Linux 下最为人熟知的归档/压缩工具
================================================================================
很多时候，通过互联网发送或接收大文件和图片是一件令人头疼的事。压缩及解压缩工具正好可以应对这个问题。下面让我们快速浏览一些可以使得我们的工作更加轻松的开源工具。

### Tar ###

Tar 由 'Tape archiver（磁带归档器）' 衍生而来，最初被用来在磁带上归档和存储文件。Tar 是一个 GNU 软件，它可以压缩一组文件（归档），或提取它们以及对已有的归档文件进行相关操作。在存储、备份以及传输文件方面，它是很有用的。在创建归档文件时，Tar 可以保持原有文件和目录结构不变。通过 Tar 归档的文件的后缀名为 ‘.tar’。

**基本用法如下：**

#### a) 创建归档 (c / --create) ####

    tar --create --verbose --file=archive.tar file1 file2 file3

或

    tar cvf archive.tar file1 file2 file3

![tar cvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-cvf.png)

*创建一个归档*

#### b) 列出归档文件内容 ( t / --list) ####

    tar --list archive.tar

![tar tvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-tvf.png)

*列出归档中包含的文件*

#### c) 提取归档 (x / --extract) ####

    tar xvf archive.tar

    tar xvf archive.tar --wildcards '*.c'  -  从归档中提取后缀名为 *.c 的文件。

![tar xvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-xvf.png)

*提取文件*

![tar xvf --wildcards](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-wildcard.png)

*只提取需要的文件*

#### d) 对归档文件进行更新 ( u / --update) ####

    tar uvf archive.tar newfile.c   -  假如归档的newfile.c  要比先前已经归档的新，则添加更新的 newfile.c 到归档里面.

![tar uvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-uvf.png)

*更新一个归档*

#### e) 从归档中删除文件 (--delete) ####

    tar --delete -f archive.tar file1.c   - 从压缩包'archive.tar' 中删除文件'file1.c' 

![tar --delete](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-delete.png)

*删除文件*

更加具体的使用方法请参考[tar 主页][1]。

### Gzip / Gunzip ###

Gzip 即 GNU zip，它是一个被广泛用于 Linux 操作系统中的压缩应用，被其压缩的文件的后缀名为'*.gz' 。

**基本用法如下：**

#### a) 压缩文件 ####

    gzip file(s)

每个文件将被**单独压缩**。

![gzip](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip.png)

*压缩文件*

通常在压缩完成后，它会将原来的文件删除。我们可以使用 `-c` 选项来保留原来的文件。

    gzip -c file > file.gz

![gzip-c](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip-c.png)

*压缩后保留原有文件*

我们也可以将一组文件压缩到一个单独的文件中

    cat file1 file2 file3 | gzip > archieve.gz

![gz group](http://blog.linoxide.com/wp-content/uploads/2015/01/gz-group.png)

*压缩一组文件*

#### b) 检查压缩比 ####

被压缩文件的压缩比可以使用 ‘-l’ 选项来进行检验。

    gzip -l archieve.gz

![gzip -l](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip-l.png)

*检查压缩率*

#### c) 解压文件 ####

Gunzip 用来解压文件，在这里，原有的（压缩）文件在被解压后同样会被删除。使用 `-c`选项来保留原始文件。

    gunzip -c archieve.gz

![gunzip -c](http://blog.linoxide.com/wp-content/uploads/2015/01/gunzip-c.png)

*解压文件*

gzip 加上'-d'选项 和 gunzip 对压缩文件有同样的效果。

更多细节可以从 [gzip 主页][2] 得到。

### Bzip2 / Bunzip2 ###

同 gzip 一样，[Bzip2][3] 也是一个压缩工具，与其他传统的工具相比，它可以将文件压缩到更小，但其缺点为：运行速度比 gzip 慢。

**基本用法如下：**

#### a) 压缩文件 ####

一般情况下，针对压缩而言，Bzip2 不用什么选项，将被压缩的文件被传递为它的参数。每个文件被单独压缩，且压缩文件以 'bz2' 为后缀名。

    bzip2 file1 file2 file3

![bzip2](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2.png)

*文件压缩*

使用 '-k' 选项可以使得在压缩或解压缩之后保留原有的文件。

![bzip2 -k](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2-k.png)

*在压缩后保留原有文件*


#### b) 解压 ####

'-d' 选项被用来解压缩。 

![bzip2 -d](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2-d.png)

*使用 -d 选项解压缩文件*

也可以使用 bunzip2 来解压缩。

    bunzip2 filename

![bunzip2](http://blog.linoxide.com/wp-content/uploads/2015/01/bunzip2.png)

*解压文件*

bunzip2 可以解压后缀名为 bz2, bz, tbz2 和 tbz 的文件。带有 tbz2 和 tbz 的文件在压缩后，后缀名将变为'.tar' 。

    bzip2 -dc  	- 	执行解压文件到标准输出的功能。

### 7-zip ###

[7-zip][4] 是另一个开源压缩软件。它使用 7z 这种新的压缩格式，并支持高压缩比。因此，它被认为是比先前提及的压缩工具更好的软件。在 Linux 下，可以通过 p7zip 软件包得到，该软件包里包含 3 个二进制文件： 7z, 7za 和 7zr，读者可以参考 [p7zip wiki][5] 来了解这三个二进制文件之间的不同。在本篇中，我们将使用 7zr 来解释 7-zip 的用法。归档文件以 '.7z' 为后缀名。

**基本用法如下：**

#### a) 创建归档 ####

    7zr a archive-name.7z file-name(s) / directory-name(s)

![7zr a](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-a.png)

*创建一个归档文件*

#### b) 列出归档包含文件 ####

    7zr l archive-name.7z

![7zr l](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-l.png)

*列出归档中包含的文件*

#### c) 提取归档文件 ####

    7zr e archive-name.7z

![7zr e](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-e.png)

*提取归档*

#### d) 更新归档文件 ####

    7zr u archive-name.7z new-file

![7zr u](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-u.png)

*更新一个归档文件*

#### e) 从归档文件中删除文件 ####

    7zr d archive-name.7z file-to-be-deleted

![7zr d](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-d.png)

*删除文件*

![7zr l](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-d-l.png)

*确认文件删除*

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/linux-compress-decompress-tools/

作者：[B N Poornima][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:http://www.gnu.org/software/tar/
[2]:http://www.gzip.org/
[3]:http://www.bzip.org/
[4]:http://www.7-zip.org/
[5]:https://wiki.archlinux.org/index.php/p7zip