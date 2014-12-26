Translating-----geekpi

Linux FAQs with Answers--How to rename multiple files on Linux
================================================================================
> **Question**: I know I can rename a file using mv command. But what if I want to change the name of many files? It will be tedius to invoke mv command for every such file. Is there a more convenient way to rename multiple files at once? 

In Linux, when you want to change a file name, mv command gets the job done. However, mv cannot rename multiple files using wildcard. There are ways to deal with multiple files by using a combination of sed, awk or find in conjunction with [xargs][1]. However, these CLIs are rather cumbersome and not user-friendly, and can be error-prone if you are not careful. You don't want to undo incorrect name change for 1,000 files.

When it comes to renaming multiple files, the rename utility is probably the easiest, the safest, and the most powerful command-line tool. The rename command is actually a Perl script, and comes pre-installed on all modern Linux distributions.

Here is the basic syntax of rename command.

    rename [-v -n -f] <pcre> <files>

<pcre> is a Perl-compatible regular expression (PCRE) which represents file(s) to rename and how. This regular expression is in the form of 's/old-name/new-name/'.

The '-v' option shows the details of file name changes (e.g., XXX renamed as YYY).

The '-n' option tells rename to show how the files would be renamed without actually changing the names. This option is useful when you want to simulate filename change without touching files.

The '-f' option force overwriting existing files.

In the following, let's see several rename command examples.

### Change File Extensions ###

Suppose you have many image files with .jpeg extension. You want to change their file names to *.jpg. The following command converts *.jpeg files to *.jpg.

    $ rename 's/\.jpeg$/\.jpg/' *.jpeg 

### Convert Uppercase to Lowercase and Vice-Versa ###

In case you want to change text case in filenames, you can use the following commands.

To rename all files to lower-case:

    # rename 'y/A-Z/a-z/' *

To rename all files to upper-case:

    # rename 'y/a-z/A-Z/' * 

![](https://farm9.staticflickr.com/8655/16054304245_bcf9d23b59_b.jpg)

### Change File Name Patterns ###

Now let's consider more complex regular expressions which involve subpatterns. In PCRE, a subpattern captured within round brackets can be referenced by a number preceded by a dollar sign (e.g., $1, $2).

For example, the following command will rename 'img_NNNN.jpeg' to 'dan_NNNN.jpg'.

    # rename -v 's/img_(\d{4})\.jpeg$/dan_$1\.jpg/' *.jpeg

----------

    img_5417.jpeg renamed as dan_5417.jpg
    img_5418.jpeg renamed as dan_5418.jpg
    img_5419.jpeg renamed as dan_5419.jpg
    img_5420.jpeg renamed as dan_5420.jpg
    img_5421.jpeg renamed as dan_5421.jpg

The next command will rename 'img_000NNNN.jpeg' to 'dan_NNNN.jpg'.

    # rename -v 's/img_\d{3}(\d{4})\.jpeg$/dan_$1\.jpg/' *jpeg

----------

    img_0005417.jpeg renamed as dan_5417.jpg
    img_0005418.jpeg renamed as dan_5418.jpg
    img_0005419.jpeg renamed as dan_5419.jpg
    img_0005420.jpeg renamed as dan_5420.jpg
    img_0005421.jpeg renamed as dan_5421.jpg

In both cases above, the subpattern '\d{4}' captures four consecutive digits. The captured four digits are then referred to as $1, and used as part of new filenames.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/rename-multiple-files-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/xargs-command-linux.html