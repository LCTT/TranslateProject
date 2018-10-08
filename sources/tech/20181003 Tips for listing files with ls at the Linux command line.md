Tips for listing files with ls at the Linux command line
======
Learn some of the Linux 'ls' command's most useful variations.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

One of the first commands I learned in Linux was `ls`. Knowing what’s in a directory where a file on your system resides is important. Being able to see and modify not just some but all of the files is also important.

My first LInux cheat sheet was the [One Page Linux Manual][1] , which was released in1999 and became my go-to reference. I taped it over my desk and referred to it often as I began to explore Linux. Listing files with `ls -l` is introduced on the first page, at the bottom of the first column.

Later, I would learn other iterations of this most basic command. Through the `ls` command, I began to learn about the complexity of the Linux file permissions and what was mine and what required root or sudo permission to change. I became very comfortable on the command line over time, and while I still use `ls -l` to find files in the directory, I frequently use `ls -al` so I can see hidden files that might need to be changed, like configuration files.

According to an article by Eric Fischer about the `ls` command in the [Linux Documentation Project][2], the command's roots go back to the `listf` command on MIT’s Compatible Time Sharing System in 1961. When CTSS was replaced by [Multics][3], the command became `list`, with switches like `list -all`. According to [Wikipedia][4], `ls` appeared in the original version of AT&T Unix. The `ls` command we use today on Linux systems comes from the [GNU Core Utilities][5].

Most of the time, I use only a couple of iterations of the command. Looking inside a directory with `ls` or `ls -al` is how I generally use the command, but there are many other options that you should be familiar with.

`$ ls -l` provides a simple list of the directory:

![](https://opensource.com/sites/default/files/uploads/linux_ls_1_0.png)

Using the man pages of my Fedora 28 system, I find that there are many other options to `ls`, all of which provide interesting and useful information about the Linux file system. By entering `man ls` at the command prompt, we can begin to explore some of the other options:

![](https://opensource.com/sites/default/files/uploads/linux_ls_2_0.png)

To sort the directory by file sizes, use `ls -lS`:

![](https://opensource.com/sites/default/files/uploads/linux_ls_3_0.png)

To list the contents in reverse order, use `ls -lr`:

![](https://opensource.com/sites/default/files/uploads/linux_ls_4.png)

To list contents by columns, use `ls -c`:

![](https://opensource.com/sites/default/files/uploads/linux_ls_5.png)

`ls -al` provides a list of all the files in the same directory:

![](https://opensource.com/sites/default/files/uploads/linux_ls_6.png)

Here are some additional options that I find useful and interesting:

  * List only the .txt files in the directory: `ls *.txt`
  * List by file size: `ls -s`
  * Sort by time and date: `ls -d`
  * Sort by extension: `ls -X`
  * Sort by file size: `ls -S`
  * Long format with file size: `ls -ls`
  * List only the .txt files in a directory: `ls *.txt`



To generate a directory list in the specified format and send it to a file for later viewing, enter `ls -al > mydirectorylist`. Finally, one of the more exotic commands I found is `ls -R`, which provides a recursive list of all the directories on your computer and their contents.

For a complete list of the all the iterations of the `ls` command, refer to the [GNU Core Utilities][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/ls-command

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[1]: http://hackerspace.cs.rutgers.edu/library/General/One_Page_Linux_Manual.pdf
[2]: http://www.tldp.org/LDP/LG/issue48/fischer.html
[3]: https://en.wikipedia.org/wiki/Multics
[4]: https://en.wikipedia.org/wiki/Ls
[5]: http://www.gnu.org/s/coreutils/
[6]: https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html#ls-invocation
