在 Linux 中怎样使用cp命令合并目录树
================================================================================

怎样将两个布局相似的目录树合并成一个新的目录树？为理解该问题让我们思考下面的例子.

假设 dir1 和 dir2 目录中分别有3个子目录a,b和c.目录布局如下所示: 

![Layout of input directories](http://linoxide.com/wp-content/uploads/2014/07/01.merge_dir_layout.png)
输入目录布局

在目录a,b和c中有一些文件，tree命令的输出将能更好的说明:

![Layout of files](http://linoxide.com/wp-content/uploads/2014/07/02.merge_file_layout.png)
文件布局

### 1. 使用cp命令创建合并: ###

现在我们将这两个目录合并成一个名为"merged"新的目录中.完成上述操作最简单的方式就是递归复制目录，如下图所示:

![Copy directories recursively to create new merge](http://linoxide.com/wp-content/uploads/2014/07/03.merge_cp_recursive.png)
递归复制完成新的合并

#### 1.1 cp命令和替换带来的问题: ####

这种方式所带来的问题是该合并目录中所创建的文件为原文件的副本，并非原文件本身.别急, (你可能正在问自己) 如果不是原文件又有什么问题? 要回答你的问题，考虑下你有很多大文件的情况.那种情形下，复制所有的文件可能花费数小时.

现在让我们回到刚那问题上，且尝试使用mv命令而不是cp命令.

![Attempt to merge with mv command](http://linoxide.com/wp-content/uploads/2014/07/04.merge_mv_recursive.png)
企图使用mv命令进行合并操作

这些目录不能被合并.因此我们不能像这样使用mv命令去合并目录.
现在你该怎样将原文件保存到"merged"目录中?

### 2. 解决方法: ###

cp命令有一个非常有用的选项来帮助我们摆脱这种状况.
cp命令的-l 或 --link选项能够创建硬链接而非原文件副本.让我们尝试一下.

在我们尝试cp命令的硬链接选项前，让我们查看一下原文件的inode号码.
可通过tree命令--inodes选项来查看inodes:

![Display inodes of original files](http://linoxide.com/wp-content/uploads/2014/07/05.merge_display_inodes.png)
原文件的inodes

现在我们有了inodes的列表，对于cp命令可通过--link选项创建硬链接:

![Merge directories with hard links](http://linoxide.com/wp-content/uploads/2014/07/06.merge_create_links.png)
使用硬链接合并的目录

#### 2.1 验证文件: ####

现在文件已经被复制，让我们验证一下inodes是否和原文件匹配:

![Verify Inodes](http://linoxide.com/wp-content/uploads/2014/07/07.merge_verify_inodes.png)
Verify Inodes

#### 2.2 清除: ####


正如你所看到的，这些文件的inodes和原文件的一样.现在问题已经被解决，且
原文件已被复制到合并目录中.现在我们能够移除dir1和dir2目录.

![Remove original directories](http://linoxide.com/wp-content/uploads/2014/07/08.merge_cleanup.png)
移除原始目录

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/merge-directory-trees-linux/

原文作者：[Raghu][a]

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/raghu/
