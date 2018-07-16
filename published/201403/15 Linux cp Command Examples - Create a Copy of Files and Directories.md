Linux cp 命令的15个示例 - 创建文件和目录的副本
================================================================================

拷贝文件和目录是每一个操作系统的基本指令。备份行为基本上是创建文件和目录的副本。在Linux系统下，我们可以用**cp**命令来实现。

### copy 命令是什么 ###

正如我们在上文提到的，**cp**是一个用来创建文件和目录副本的命令。在这里我们提供了一些在日常操作中可能用到的cp命令的实例。

### 1. 不带任何参数下，运行cp  ###

这是 cp 命令最基础的使用。 拷贝名为 myfile.txt 从一个位置到另一个位置，我们可以像这样子输入：

    $ cp myfile.txt /home/pungki/office

![Copy without options](http://linoxide.com/wp-content/uploads/2014/01/cp_default.png)


如果我们没有输入绝对路径，这意味着我们正在当前目录下拷贝一个文件。在上面的实例中，**myfile.txt**位于**/home/pungki/Documents**目录下。如果我们当前目录正是**/home/pungki/Documets**,那么没有必要输入**/home/pungki/Documents/myfile.txt**来拷贝文件。当**/home/pungki/office**是一个目录，则文件会拷贝到里面。


#### 2. 同时拷贝多个文件  ####


要在同时拷贝多个文件，我们只需要将多个文件用空格隔开。如下示例：

    $ cp file_1.txt file_2.txt file_3.txt /home/pungki/office

![Copying multiple files](http://linoxide.com/wp-content/uploads/2014/01/cp_multiple_file.png)


#### 3. 拷贝一个目录  ####


要拷贝一个目录的话会有点棘手。你需要添加 **-r** 或者 **-R** 选项来实现。**-r**或**-R** 选项表明递归操作。无论该目录是否为空目录，**这个选项都是必要的**。如下示例：

    $ cp -r directory_1 /home/pungki/office

![Copy directory](http://linoxide.com/wp-content/uploads/2014/01/cp_directory.png)


需要注意的一件事，你需要**移除在目录名尾部的斜杠**。否则你会收到类似的错误信息**cp: omitting directory‘directory_1/**’

![Copy directory error](http://linoxide.com/wp-content/uploads/2014/01/cp_directory_error.png)


如果你收到错误信息，则目录不会被拷贝到目标文件夹。


#### 4. 创建文件的硬链接，而不是拷贝它们####




拷贝文件意味着你必须使用一些存储空间来储存拷贝的文件。有时候出于某种原因，你可能想要创建“快捷方式”或者链接到文件，而不是拷贝它们。要做到这一点，我们可以使用**-l**选项。

    $ cp -l file_4.txt /home/pungki/office

![Copy hardlinks](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks.png)


从上图看出，我们看到**file_4.txt**的硬链接已经拷贝到**/home/pungki/office/file_4.txt**。标记有同样的 inode, **835386**。但是请注意，硬链接不能用来创建目录。下面让我们看一个例子。


*原目录 directory_1 的 inode 值是 278230*
![Inode number of original directory](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_dir_1_ori.png)


*原文件 file_5.txt 的 inode 值是 279231*
![Original inode number of file](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_file_5_ori.png)


*对 directory_1 执行 cp 命令*
![Copy using -rl options](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_rl_dir.png)


*拷贝的 directory_1副本的 inode 值是 274800*
![Inode number of copied directory](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_dir_1_result.png)


*拷贝的 file_5.txt副本的 inode 值是 279231。跟它的原文件一样*
![Inode number of copied file](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_file_5_result.png)


#### 5. 创建文件的符号链接 ####

也有一种链接叫做 **软链接** 或 **符号链接**。我们用 **-s** 选项来实现。下面是命令的示例。

    $ cp -s /home/pungki/Documents/file_6.txt file_6.txt


创建符号链接只能在当前目录下进行。在上面的截图中，我们想要创建符号链接 **/home/pungki/office/file_6.txt 指向原文件 /home/pungki/Documents/file_6.txt**。但是为了创建符号链接，**我必须**在将/home/pungki/office作为目标目录。一旦我设法进入目录，我就可以向上面一样运行 cp **-s** 命令。


现在你列出文件详情，你会看到**/home/pungki/office/file_6.txt**指向了原文件。在其文件名后标记了箭头符号。

![Symbolic links](http://linoxide.com/wp-content/uploads/2014/01/cp_symlinks.png)


#### 6. 不随符号链接拷贝原文件  ####
[译注:意思是只拷贝符号链接文件]


我们可以用 **-P** 选项来实现。当对符号链接使用 cp 命令，它会照原样拷贝它自身。来看看下面的示例。

    $ cp -P file_6.txt ./movie

![Copy using -P option](http://linoxide.com/wp-content/uploads/2014/01/cp_P.png)


如你所见，cp 命令照原样拷贝**file_6.txt**自身。文件类型仍然是一个符号链接。


#### 7. 随符号链接拷贝原文件 ####


现在我们可以试一下**-L**选项。基本上，这个刚好与上面的 -P 选项 **相反**。下面是个示例：

    $ cp -L file_6.txt ./movie

![Copy using -L option](http://linoxide.com/wp-content/uploads/2014/01/cp_L.png)


使用这个选项，拷贝的文件将会和**file_6.txt**原文件一样。我们可以从文件大小看出来。拷贝的文件有**50 字节**而当**file_6.txt**作为符号链接时文件大小只有**33 字节**。


#### 8. 文件归档 ####

当我们去拷贝一个目录时，我们会用**-r**或者**-R**选项。但是我们也可以用**-a**选项来归档文件。这样会创建文件和目录的**准确套录**，如果有的话也可以包括符号链接。下面是示例：[译注：-a 会保留原文件或目录的属性]

    $ cp -a directory_1/ /home/pungki/office

![Copy using -a option](http://linoxide.com/wp-content/uploads/2014/01/cp_a.png)


上列的命令会拷贝一个名为 directory_1 的目录到**/home/pungki/office**目录下。如你所见，**file_6.txt**依然作为符号链接被复制。


#### 9. 显示正在做什么  ####


默认情况下，当拷贝作业成功时，我们仅仅会再次看到命令提示符。如果你想了解在拷贝文件时都发生了什么，我们可以用 **-v** 选项。

    $ cp -v *.txt /home/pungki/office

![Verbose option](http://linoxide.com/wp-content/uploads/2014/01/cp_v.png)


当我们从当前目录下拷贝所有的 txt 文件到 **/home/pungki/office** 目录，**-v**选项会显示正在操作的过程。这些额外的信息会帮助我们了解更多拷贝过程。


#### 10. 当原文件较目标文件新时拷贝 ####


我们用 **-u**选项来实现。下面是具体示例:

    $ cp -vu *.txt /home/pungki/office

![Copy only if newer](http://linoxide.com/wp-content/uploads/2014/01/cp_u.png)

起初我们看到**file_1.txt 是0字节**大小。然后我们用 vi 编辑，加入一些内容并保存。接下来，我们发现文件大小已经变为了 36 个字节。
与此同时在**/home/pungki/office**目录中，我们**已经包含了所有**txt文件。当我们用 -u 选项，结合 -v 选项来查看具体操作，cp 命令会只拷贝比目标目录下新的文件。因此，我们看到**只有 file_1.txt 拷贝到 /home/pungki/office 目录下**。


#### 11. 使用交互模式 ####


交互模式下会询问是否覆盖目标目录下的文件。使用 **-i** 选项，启用交互模式。

    $ cp -ir directory_1/ /home/pungki/office/

![Interactive mode](http://linoxide.com/wp-content/uploads/2014/01/cp_i.png)


#### 12. 创建备份文件 ####


当目标目录已经含有同名文件，默认情况下 cp 命令会覆盖目标目录下的同名文件。使用 **--backup** 选项，cp 命令会为每一个现有的目标文件做一个备份。../office 相对于 /home/pungki/office 。下面是示例：

    $ cp --backup=simple -v *.txt ../office

![Backup option](http://linoxide.com/wp-content/uploads/2014/01/cp_backup.png)


正如我们看到的，**--backup=simple** 选项会创建一个在文件名末尾用波浪符标记(~)的备份文件。**--backup** 选项也有一些其他控制：

- **none, off**:从不备份(即使给出 --backup)
- **numbered, t**:用编号备份
- **existing, nil** :如果编号备份存在则使用编号备份，否者用简易备份[译注：也就是用波浪号]
- **simple, never** :总是使用简易备份


#### 13. 只拷贝文件属性 ####


cp 命令也提供给我们 **--attributes-only** 选项。顾名思义，这个选项只会拷贝文件名及其属性，不会拷贝任何数据。下面是示例：

    $ cp --attributes-only file_6.txt -v ../office

![Copy attributes only](http://linoxide.com/wp-content/uploads/2014/01/cp_attributes_only.png)


从上图看出， **原文件 file_6.txt 有 50 字节**大小。用了 **--attributes-only**选项，**拷贝的文件只有0字节**大小。这是因为文件内容并没有拷贝。


### 14. 强制拷贝 #####


用了 **-f** 选项会强制进行拷贝操作。如果目标文件不能打开，可以用 **-f** 尝试一下。

    $ cp -f *.txt -v ../office

![Copy with force](http://linoxide.com/wp-content/uploads/2014/01/cp_f.png)


#### 15. 在拷贝之前先删除目标 ####


我们可以用，**--remove-destination 选项** 实现。这个选项与上面的**-f选项形成对照**。如果 cp 命令在目标目录下发现同名文件， cp 命令会先删除目标文件，然后再拷贝一份新的。下面是示例：

    $ cp --remove-destination *.txt -v ../office

![Remove destination option](http://linoxide.com/wp-content/uploads/2014/01/cp_remove_destination.png)


### 总结 ###


cp 命令是 Linux 下最基础的命令之一。对于那些想要学习 Linux 的人，必须得把这个命令掌握。当然你也可以在你的终端下键入 **man cp** 或者 **cp --help** 来显示更多帮助信息。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-cp-command/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
