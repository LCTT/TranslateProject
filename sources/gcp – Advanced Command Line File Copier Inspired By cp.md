(翻译中......)
gcp – Advanced Command Line File Copier Inspired By cp
================================================================================
A few weeks back, we discussed [advanced copy][1] (modified cp command that shows progress bar). A reader dropped in a comment pointing out another utility that also provides basic cp command functionality but along with some advanced features. So, in this article, lets discuss the very same command line utility — **gcp**.

### gcp – Advanced Command Line File Copier ###

gcp — as the manual suggests — is an advanced command line file copier that is inspired by the standard [cp command][2] but provides various advanced features like progress bar indicator, source lists, continuous copying even if there is a problematic file etc.

Here is a complete list of options :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-main.png)

### Testing Environment ###

- OS – Ubuntu 13.04
- Shell – Bash 4.2.45
- Application – gcp 0.1.3

### A Brief Tutorial ###

Here are some of the examples of gcp command :

**1. Transfer Progress Indicator**

The gcp command provides transfer progress indicator so that the user is aware of the current status of the copying process.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-1.png)

So you can see that the gcp command provides details like complete file size, percentage of copy complete, transfer rate and time left for the copy operation to complete.

**2. Copy Directories Recursively Through -r Option**

To copy complete directories recursively, use -r option.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-2.png)

So you can see that the gcp command shows the transfer indicator taking in account the complete size of the folder.

**3. Elaborate Error Descriptions**

In case of any error, the gcp command displays descriptive error messages pinning down the individual culprit file.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-3.png)

So you can see that the gcp command provided a detailed error message related to the file **August Rush.avi** that was already present inside the destination folder. But an error did not disrupt the copy of other file(s).

**4. Get Detailed Output Through -v Option**

The verbose option -v can be used to keep track of all the details that the gcp command is up to.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-4.png)

So you can see that extended details were provided in output when -v option was used.

**5. Create And Use Sources List**

One of the shining features of the gcp command is that it lets you create a list of source files that you can use later.

For example, I saved the list of source file in the following copy operation using the option **–sources-save**.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-1.png)

The list name in this case is **SOURCES_SAVE**. You can confirm the saved list through **–sources-list** option.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-3.png)

So you can see that a list named **SOURCES_SAVE** is saved.

Now, I deleted the files that I copied in the first step :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-2.png)

and repeated the first step again but without mentioning the source file names. The option **–sources-load** was use to load the source file names from the list **SOURCES_SAVE**.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-4.png)

So you can see that the gcp command picked up the source file names from the list **SOURCES_SAVE** and the copy process started normally.

Here are other options related to source file lists :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-5.png)

The gcp command provides various other useful options. For complete list of options, read the [man page of gcp][3].

### Download/Installation/Configuration ###

Here are some of the important links related to the gcp command :

- [Home Page][4]
- [Download Link][5]
- [Another useful gcp Tutorial][6]

You can alternatively download and install the gcp command through command line package managers like yum, apt-get etc. Ubuntu users can also use Ubuntu software centre to download and install this utility.

### Pros ###

- Status bar and source lists are the USP of this utility.
- Skips the problematic file(s) but the copy operation is not hampered.
- Usage is similar to that of the standard cp command.

### Cons ###

- While copying folders, it could be better if copy status of each file is displayed.
- Doesn’t come pre-installed in most of the Linux distributions.

### Conclusion ###

If you are fed up of waiting blindly while copying large files through standard cp command the gcp is a good alternative. System administrators will love the source list feature. It’s a must have utility.

**Have you ever used gcp or any other advanced cp-like command line utility? Share your experience with us.**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/gcp-advanced-command-line-file-copier-inspired-by-cp/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/advanced-copy-cp-command/
[2]:http://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/
[3]:http://manpages.ubuntu.com/manpages/precise/en/man1/gcp.1.html
[4]:http://wiki.goffi.org/wiki/Gcp/en
[5]:http://wiki.goffi.org/wiki/Gcp/en
[6]:http://www.hecticgeek.com/2012/03/gcp-command-line-file-copy-ubuntu-linux/