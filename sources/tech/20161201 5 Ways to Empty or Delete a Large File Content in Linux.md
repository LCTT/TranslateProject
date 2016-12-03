5 Ways to Empty or Delete a Large File Content in Linux
============================================================

Occasionally, while dealing with files in Linux terminal, you may want to clear the content of a file without necessarily opening it using any [Linux command line editors][1]. How can this be achieved? In this article, we will go through several different ways of emptying file content with the help of some useful commands.

Caution: Before we proceed to looking at the various ways, note that because in [Linux everything is a file][2], you must always make sure that the file(s) you are emptying are not important user or system files. Clearing the content of a critical system or configuration file could lead to a fatal application/system error or failure.

With that said, below are means of clearing file content from the command line.

Important: For the purpose of this article, we’ve used file `access.log` in the following examples.

### 1\. Empty File Content by Redirecting to Null

A easiest way to empty or blank a file content using shell redirect `null` (non-existent object) to the file as below:

```
# > access.log
```
[
 ![Empty Large File Using Null Redirect in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-in-Linux.png) 
][3]

Empty Large File Using Null Redirect in Linux

### 2\. Empty File Using ‘true’ Command Redirection

Here we will use a symbol `:` is a shell built-in command that is essence equivalent to the `true`command and it can be used as a no-op (no operation).

Another method is to redirect the output of `:` or `true` built-in command to the file like so:

```
# : > access.log
OR 
# true > access.log
```
[
 ![Empty Large File Using Linux Commands](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Using-Linux-Commands.png) 
][4]

Empty Large File Using Linux Commands

### 3\. Empty File Using cat/cp/dd utilities with /dev/null

In Linux, the `null` device is basically utilized for discarding of unwanted output streams of a process, or else as a suitable empty file for input streams. This is normally done by redirection mechanism.

And the `/dev/null` device file is therefore a special file that writes-off (removes) any input sent to it or its output is same as that of an empty file.

Additionally, you can empty contents of a file by redirecting output of `/dev/null` to it (file) as input using [cat command][5]:

```
# cat /dev/null > access.log
```
[
 ![Empty File Using cat Command](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-cat-Command.png) 
][6]

Empty File Using cat Command

Next, we will use [cp command][7] to blank a file content as shown.

```
# cp /dev/null access.log
```
[
 ![Empty File Content Using cp Command](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Content-Using-cp-Command.png) 
][8]

Empty File Content Using cp Command

In the following command, `if` means the input file and `of` refers to the output file.

```
# dd if=/dev/null of=access.log
```
[
 ![Empty File Content Using dd Command](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Content-Using-dd-Command.png) 
][9]

Empty File Content Using dd Command

### 4\. Empty File Using echo Command

Here, you can use an [echo command][10] with an empty string and redirect it to the file as follows:

```
# echo "" > access.log
OR
# echo > access.log
```
[
 ![Empty File Using echo Command](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-echo-Command.png) 
][11]

Empty File Using echo Command

Note: You should keep in mind that an empty string is not the same as null. A string is already an object much as it may be empty while null simply means non-existence of an object.

For this reason, when you redirect the out of the [echo command][12] above into the file, and view the file contents using the [cat command][13], is prints an empty line (empty string).

To send a null output to the file, use the flag `-n` which tells echo to not output the trailing newline that leads to the empty line produced in the previous command.

```
# echo -n "" > access.log
```
[
 ![Empty File Using Null Redirect](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-Null-Redirect.png) 
][14]

Empty File Using Null Redirect

### 5\. Empty File Using truncate Command

The truncate command helps to [shrink or extend the size of a file][15] to a defined size.

You can employ it with the `-s` option that specifies the file size. To empty a file content, use a size of 0 (zero) as in the next command:

```
# truncate -s 0 access.log
```
[
 ![Truncate File Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Truncate-File-Content-in-Linux.png) 
][16]

Truncate File Content in Linux

That’s it for now, in this article we have covered multiple methods of clearing or emptying file content using simple command line utilities and shell redirection mechanism.

These are not probably the only available practical ways of doing this, so you can also tell us about any other methods not mentioned in this guide via the feedback section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/empty-delete-file-content-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/linux-command-line-editors/
[2]:http://www.tecmint.com/explanation-of-everything-is-a-file-and-types-of-files-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-in-Linux.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Using-Linux-Commands.png
[5]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-cat-Command.png
[7]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Content-Using-cp-Command.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Content-Using-dd-Command.png
[10]:http://www.tecmint.com/echo-command-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-echo-Command.png
[12]:http://www.tecmint.com/echo-command-in-linux/
[13]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-File-Using-Null-Redirect.png
[15]:http://www.tecmint.com/parted-command-to-create-resize-rescue-linux-disk-partitions/
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Truncate-File-Content-in-Linux.png
