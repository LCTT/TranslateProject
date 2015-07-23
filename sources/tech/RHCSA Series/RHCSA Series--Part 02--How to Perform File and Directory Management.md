[translating by xiqingongzi]
RHCSA Series: How to Perform File and Directory Management – Part 2
================================================================================
In this article, RHCSA Part 2: File and directory management, we will review some essential skills that are required in the day-to-day tasks of a system administrator.

![RHCSA: Perform File and Directory Management – Part 2](http://www.tecmint.com/wp-content/uploads/2015/03/RHCSA-Part2.png)

RHCSA: Perform File and Directory Management – Part 2

### Create, Delete, Copy, and Move Files and Directories ###

File and directory management is a critical competence that every system administrator should possess. This includes the ability to create / delete text files from scratch (the core of each program’s configuration) and directories (where you will organize files and other directories), and to find out the type of existing files.

The [touch command][1] can be used not only to create empty files, but also to update the access and modification times of existing files.

![touch command example](http://www.tecmint.com/wp-content/uploads/2015/03/touch-command-example.png)

touch command example

You can use `file [filename]` to determine a file’s type (this will come in handy before launching your preferred text editor to edit it).

![file command example](http://www.tecmint.com/wp-content/uploads/2015/03/file-command-example.png)

file command example

and `rm [filename]` to delete it.

![Linux rm command examples](http://www.tecmint.com/wp-content/uploads/2015/03/rm-command-examples.png)

rm command example

As for directories, you can create directories inside existing paths with `mkdir [directory]` or create a full path with `mkdir -p [/full/path/to/directory].`

![mkdir command example](http://www.tecmint.com/wp-content/uploads/2015/03/mkdir-command-example.png)

mkdir command example

When it comes to removing directories, you need to make sure that they’re empty before issuing the `rmdir [directory]` command, or use the more powerful (handle with care!) `rm -rf [directory]`. This last option will force remove recursively the `[directory]` and all its contents – so use it at your own risk.

### Input and Output Redirection and Pipelining ###

The command line environment provides two very useful features that allows to redirect the input and output of commands from and to files, and to send the output of a command to another, called redirection and pipelining, respectively.

To understand those two important concepts, we must first understand the three most important types of I/O (Input and Output) streams (or sequences) of characters, which are in fact special files, in the *nix sense of the word.

- Standard input (aka stdin) is by default attached to the keyboard. In other words, the keyboard is the standard input device to enter commands to the command line.
- Standard output (aka stdout) is by default attached to the screen, the device that “receives” the output of commands and display them on the screen.
- Standard error (aka stderr), is where the status messages of a command is sent to by default, which is also the screen.

In the following example, the output of `ls /var` is sent to stdout (the screen), as well as the result of ls /tecmint. But in the latter case, it is stderr that is shown.

![Linux input output redirect](http://www.tecmint.com/wp-content/uploads/2015/03/Linux-input-output-redirect.png)

Input and Output Example

To more easily identify these special files, they are each assigned a file descriptor, an abstract representation that is used to access them. The essential thing to understand is that these files, just like others, can be redirected. What this means is that you can capture the output from a file or script and send it as input to another file, command, or script. This will allow you to store on disk, for example, the output of commands for later processing or analysis.

To redirect stdin (fd 0), stdout (fd 1), or stderr (fd 2), the following operators are available.

注：表格
<table cellspacing="0" border="0">
<colgroup width="226"></colgroup>
<colgroup width="743"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">Redirection Operator</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">Effect</span></b></td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Redirects standard output to a file containing standard output. If the destination file exists, it will be overwritten.</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&gt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Appends standard output to a file.</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">2&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Redirects standard error to a file containing standard output. If the destination file exists, it will be overwritten.</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">2&gt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Appends standard error to the existing file.</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&amp;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Redirects both standard output and standard error to a file; if the specified file exists, it will be overwritten.</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&lt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">Uses the specified file as standard input.</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&lt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">The specified file is used for both standard input and standard output.</td>
</tr>
</tbody>
</table>

As opposed to redirection, pipelining is performed by adding a vertical bar `(|)` after a command and before another one.

Remember:

- Redirection is used to send the output of a command to a file, or to send a file as input to a command.
- Pipelining is used to send the output of a command to another command as input.

#### Examples Of Redirection and Pipelining ####

**Example 1: Redirecting the output of a command to a file**

There will be times when you will need to iterate over a list of files. To do that, you can first save that list to a file and then read that file line by line. While it is true that you can iterate over the output of ls directly, this example serves to illustrate redirection.

    # ls -1 /var/mail > mail.txt

![Redirect output of command tot a file](http://www.tecmint.com/wp-content/uploads/2015/03/Redirect-output-to-a-file.png)

Redirect output of command tot a file

**Example 2: Redirecting both stdout and stderr to /dev/null**

In case we want to prevent both stdout and stderr to be displayed on the screen, we can redirect both file descriptors to `/dev/null`. Note how the output changes when the redirection is implemented for the same command.

    # ls /var /tecmint
    # ls /var/ /tecmint &> /dev/null

![Redirecting stdout and stderr ouput to /dev/null](http://www.tecmint.com/wp-content/uploads/2015/03/Redirecting-stdout-stderr-ouput.png)

Redirecting stdout and stderr ouput to /dev/null

#### Example 3: Using a file as input to a command ####

While the classic syntax of the [cat command][2] is as follows.

    # cat [file(s)]

You can also send a file as input, using the correct redirection operator.

    # cat < mail.txt

![Linux cat command examples](http://www.tecmint.com/wp-content/uploads/2015/03/cat-command-examples.png)

cat command example

#### Example 4: Sending the output of a command as input to another ####

If you have a large directory or process listing and want to be able to locate a certain file or process at a glance, you will want to pipeline the listing to grep.

Note that we use to pipelines in the following example. The first one looks for the required keyword, while the second one will eliminate the actual `grep command` from the results. This example lists all the processes associated with the apache user.

    # ps -ef | grep apache | grep -v grep

![Send output of command as input to another](http://www.tecmint.com/wp-content/uploads/2015/03/Send-output-of-command-as-input-to-another1.png)

Send output of command as input to another

### Archiving, Compressing, Unpacking, and Uncompressing Files ###

If you need to transport, backup, or send via email a group of files, you will use an archiving (or grouping) tool such as [tar][3], typically used with a compression utility like gzip, bzip2, or xz.

Your choice of a compression tool will be likely defined by the compression speed and rate of each one. Of these three compression tools, gzip is the oldest and provides the least compression, bzip2 provides improved compression, and xz is the newest and provides the best compression. Typically, files compressed with these utilities have .gz, .bz2, or .xz extensions, respectively.

注：表格
<table cellspacing="0" border="0">
<colgroup width="165"></colgroup>
<colgroup width="137"></colgroup>
<colgroup width="366"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">Command</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">Abbreviation</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">Description</span></b></td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;create</span></td>
<td align="LEFT" style="border: 1px solid #000000;">c</td>
<td align="LEFT" style="border: 1px solid #000000;">Creates a tar archive</td>
</tr>
<tr>
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;concatenate</span></td>
<td align="LEFT" style="border: 1px solid #000000;">A</td>
<td align="LEFT" style="border: 1px solid #000000;">Appends tar files to an archive</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;append</span></td>
<td align="LEFT" style="border: 1px solid #000000;">r</td>
<td align="LEFT" style="border: 1px solid #000000;">Appends non-tar files to an archive</td>
</tr>
<tr>
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;update</span></td>
<td align="LEFT" style="border: 1px solid #000000;">u</td>
<td align="LEFT" style="border: 1px solid #000000;">Appends files that are newer than those in an archive</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;diff or &ndash;compare</span></td>
<td align="LEFT" style="border: 1px solid #000000;">d</td>
<td align="LEFT" style="border: 1px solid #000000;">Compares an archive to files on disk</td>
</tr>
<tr>
<td align="LEFT" height="20" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;list</span></td>
<td align="LEFT" style="border: 1px solid #000000;">t</td>
<td align="LEFT" style="border: 1px solid #000000;">Lists the contents of a tarball</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;extract or &ndash;get</span></td>
<td align="LEFT" style="border: 1px solid #000000;">x</td>
<td align="LEFT" style="border: 1px solid #000000;">Extracts files from an archive</td>
</tr>
</tbody>
</table>

注：表格
<table cellspacing="0" border="0">
<colgroup width="258"></colgroup>
<colgroup width="152"></colgroup>
<colgroup width="803"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">Operation modifier</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">Abbreviation</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">Description</span></b></td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>directory dir</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> C</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Changes to directory dir before performing operations</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>same-permissions and <span style="font-family: Courier New;">&mdash;</span>same-owner</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> p</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Preserves permissions and ownership information, respectively.</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;verbose</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> v</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Lists all files as they are read or extracted; if combined with &ndash;list, it also displays file sizes, ownership, and timestamps</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>exclude file</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &mdash;</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Excludes file from the archive. In this case, file can be an actual file or a pattern.</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>gzip or <span style="font-family: Courier New;">&mdash;</span>gunzip</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> z</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Compresses an archive through gzip</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;bzip2</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> j</span></td>
<td align="LEFT" height="24" style="border: 1px solid #000001;">Compresses an archive through bzip2</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;xz</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> J</span></td>
<td align="LEFT" style="border: 1px solid #000001;">Compresses an archive through xz</td>
</tr>
</tbody>
</table>

#### Example 5: Creating a tarball and then compressing it using the three compression utilities ####

You may want to compare the effectiveness of each tool before deciding to use one or another. Note that while compressing small files, or a few files, the results may not show much differences, but may give you a glimpse of what they have to offer.

    # tar cf ApacheLogs-$(date +%Y%m%d).tar /var/log/httpd/*        # Create an ordinary tarball
    # tar czf ApacheLogs-$(date +%Y%m%d).tar.gz /var/log/httpd/*    # Create a tarball and compress with gzip
    # tar cjf ApacheLogs-$(date +%Y%m%d).tar.bz2 /var/log/httpd/*   # Create a tarball and compress with bzip2
    # tar cJf ApacheLogs-$(date +%Y%m%d).tar.xz /var/log/httpd/*    # Create a tarball and compress with xz

![Linux tar command examples](http://www.tecmint.com/wp-content/uploads/2015/03/tar-command-examples.png)

tar command examples

#### Example 6: Preserving original permissions and ownership while archiving and when ####

If you are creating backups from users’ home directories, you will want to store the individual files with the original permissions and ownership instead of changing them to that of the user account or daemon performing the backup. The following example preserves these attributes while taking the backup of the contents in the `/var/log/httpd` directory:

    # tar cJf ApacheLogs-$(date +%Y%m%d).tar.xz /var/log/httpd/* --same-permissions --same-owner

### Create Hard and Soft Links ###

In Linux, there are two types of links to files: hard links and soft (aka symbolic) links. Since a hard link represents another name for an existing file and is identified by the same inode, it then points to the actual data, as opposed to symbolic links, which point to filenames instead.

In addition, hard links do not occupy space on disk, while symbolic links do take a small amount of space to store the text of the link itself. The downside of hard links is that they can only be used to reference files within the filesystem where they are located because inodes are unique inside a filesystem. Symbolic links save the day, in that they point to another file or directory by name rather than by inode, and therefore can cross filesystem boundaries.

The basic syntax to create links is similar in both cases:

    # ln TARGET LINK_NAME               # Hard link named LINK_NAME to file named TARGET
    # ln -s TARGET LINK_NAME            # Soft link named LINK_NAME to file named TARGET

#### Example 7: Creating hard and soft links ####

There is no better way to visualize the relation between a file and a hard or symbolic link that point to it, than to create those links. In the following screenshot you will see that the file and the hard link that points to it share the same inode and both are identified by the same disk usage of 466 bytes.

On the other hand, creating a hard link results in an extra disk usage of 5 bytes. Not that you’re going to run out of storage capacity, but this example is enough to illustrate the difference between a hard link and a soft link.

![Difference between a hard link and a soft link](http://www.tecmint.com/wp-content/uploads/2015/03/hard-soft-link.png)

Difference between a hard link and a soft link

A typical usage of symbolic links is to reference a versioned file in a Linux system. Suppose there are several programs that need access to file fooX.Y, which is subject to frequent version updates (think of a library, for example). Instead of updating every single reference to fooX.Y every time there’s a version update, it is wiser, safer, and faster, to have programs look to a symbolic link named just foo, which in turn points to the actual fooX.Y.

Thus, when X and Y change, you only need to edit the symbolic link foo with a new destination name instead of tracking every usage of the destination file and updating it.

### Summary ###

In this article we have reviewed some essential file and directory management skills that must be a part of every system administrator’s tool-set. Make sure to review other parts of this series as well in order to integrate these topics with the content covered in this tutorial.

Feel free to let us know if you have any questions or comments. We are always more than glad to hear from our readers.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/file-and-directory-management-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/8-pratical-examples-of-linux-touch-command/
[2]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[3]:http://www.tecmint.com/18-tar-command-examples-in-linux/
