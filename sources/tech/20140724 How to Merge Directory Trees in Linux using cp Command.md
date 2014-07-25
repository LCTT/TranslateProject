hunanchenxingyu translating ....
================================================================================
How to Merge Directory Trees in Linux using cp Command
================================================================================
How to merge two directory trees with similar layout into a third directory? Let us consider the following example to understand the problem.

Suppose two directories dir1 and dir2 have 3 sub-directories a, b and c in each of them. The directory layout is like below:

![Layout of input directories](http://linoxide.com/wp-content/uploads/2014/07/01.merge_dir_layout.png)
Layout of input directories

These directories a, b and c have some files in them. The output of tree command will illustrate better:

![Layout of files](http://linoxide.com/wp-content/uploads/2014/07/02.merge_file_layout.png)
Layout of files

### 1. Using cp to create merge: ###

Now we want to merge these two directories into a third directory, say “merged”.
The simplest thing that you can do to achieve this is to copy recursively the directories like below:

![Copy directories recursively to create new merge](http://linoxide.com/wp-content/uploads/2014/07/03.merge_cp_recursive.png)
Copy directories recursively to create new merge

#### 1.1 Problem with cp command and alternative: ####

The problem with this approach is that the files created inside merged directory are copy of original files, and not the original files themselves. But wait, (you might be asking yourself) what is the problem if the files are not original? So to answer your question, consider the situation where you have large number of bulky files. In that case, copying all the files might take hours.

Now let’s get back and try the same with mv command instead of cp.

![Attempt to merge with mv command](http://linoxide.com/wp-content/uploads/2014/07/04.merge_mv_recursive.png)
Attempt to merge with mv command

The directories are not merged. So we cannot use mv command to merge directories like this.
Now how can you keep the original files inside “merged” directory?

### 2. The solution: ###

The cp command has a very useful option to draw us out of this situation.
The -l or --link option to cp aommand creates the hard links instead of copying the files themselves. Let us try with that.

Before trying out the hard link option to cp command, let us print the inode number of the original files.
The tree command has option to print the inodes with --inodes option:

![Display inodes of original files](http://linoxide.com/wp-content/uploads/2014/07/05.merge_display_inodes.png)
Display inodes of original files

Now we have the inodes listed here, we can proceed to creating the hard links with --link option to cp command:

![Merge directories with hard links](http://linoxide.com/wp-content/uploads/2014/07/06.merge_create_links.png)
Merge directories with hard links

#### 2.1 Verify the files: ####

Now the files are copied, let us verify if the inodes match with original files:

![Verify Inodes](http://linoxide.com/wp-content/uploads/2014/07/07.merge_verify_inodes.png)
Verify Inodes

#### 2.2 Cleanup: ####

As you can see that the files have same inodes as original files. Now the problem is solved and we have the original files inside merged directory. We can now cleanup by removing the directories dir1 and dir2.

![Remove original directories](http://linoxide.com/wp-content/uploads/2014/07/08.merge_cleanup.png)
Remove original directories

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/merge-directory-trees-linux/

原文作者：[Raghu][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/raghu/