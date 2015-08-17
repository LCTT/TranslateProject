Part 3 - LFCS: How to Archive/Compress Files & Directories, Setting File Attributes and Finding Files in Linux
================================================================================
Recently, the Linux Foundation started the LFCS (Linux Foundation Certified Sysadmin) certification, a brand new program whose purpose is allowing individuals from all corners of the globe to have access to an exam, which if approved, certifies that the person is knowledgeable in performing basic to intermediate system administration tasks on Linux systems. This includes supporting already running systems and services, along with first-level troubleshooting and analysis, plus the ability to decide when to escalate issues to engineering teams.

![Linux Foundation Certified Sysadmin – Part 3](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-3.png)

Linux Foundation Certified Sysadmin – Part 3

Please watch the below video that gives the idea about The Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This post is Part 3 of a 10-tutorial series, here in this part, we will cover how to archive/compress files and directories, set file attributes, and find files on the filesystem, that are required for the LFCS certification exam.

### Archiving and Compression Tools ###

A file archiving tool groups a set of files into a single standalone file that we can backup to several types of media, transfer across a network, or send via email. The most frequently used archiving utility in Linux is tar. When an archiving utility is used along with a compression tool, it allows to reduce the disk size that is needed to store the same files and information.

#### The tar utility ####

tar bundles a group of files together into a single archive (commonly called a tar file or tarball). The name originally stood for tape archiver, but we must note that we can use this tool to archive data to any kind of writeable media (not only to tapes). Tar is normally used with a compression tool such as gzip, bzip2, or xz to produce a compressed tarball.

**Basic syntax:**

    # tar [options] [pathname ...]

Where … represents the expression used to specify which files should be acted upon.

#### Most commonly used tar commands ####

注：表格
<table cellspacing="0" border="0">
  <colgroup width="150">
  </colgroup>
  <colgroup width="109">
  </colgroup>
  <colgroup width="351">
  </colgroup>
  <tbody>
    <tr>
      <td bgcolor="#999999" height="18" align="CENTER" style="border: 1px solid #000001;"><b>Long option</b></td>
      <td bgcolor="#999999" align="CENTER" style="border: 1px solid #000001;"><b>Abbreviation</b></td>
      <td bgcolor="#999999" align="CENTER" style="border: 1px solid #000001;"><b>Description</b></td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;create</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;c</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Creates a tar archive</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;concatenate</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;A</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Appends tar files to an archive</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;append</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;r</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Appends files to the end of an archive</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;update</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;u</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Appends files newer than copy in archive</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;diff or &ndash;compare</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;d</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Find differences between archive and file system</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;file archive</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;f</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Use archive file or device ARCHIVE</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;list</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;t</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Lists the contents of a tarball</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;extract or &ndash;get</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;x</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Extracts files from an archive</td>
    </tr>
  </tbody>
</table>

#### Normally used operation modifiers ####

注：表格
<table cellspacing="0" border="0">
  <colgroup width="162">
  </colgroup>
  <colgroup width="109">
  </colgroup>
  <colgroup width="743">
  </colgroup>
  <tbody>
    <tr class="alt">
      <td bgcolor="#999999" height="18" align="CENTER" style="border: 1px solid #000001;"><b><span style="font-family: Droid Sans;">Long option</span></b></td>
      <td bgcolor="#999999" align="CENTER" style="border: 1px solid #000001;"><b><span style="font-family: Droid Sans;">Abbreviation</span></b></td>
      <td bgcolor="#999999" align="CENTER" style="border: 1px solid #000001;"><b><span style="font-family: Droid Sans;">Description</span></b></td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;directory dir</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;C</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Changes to directory dir before performing operations</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;same-permissions</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;p</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Droid Sans;">&nbsp;Preserves original permissions</span></td>
    </tr>
    <tr>
      <td height="38" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;verbose</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;v</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Lists all files read or extracted. When this flag is used along with &ndash;list, the file sizes, ownership, and time stamps are displayed.</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;verify</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;W</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Droid Sans;">&nbsp;Verifies the archive after writing it</span></td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;exclude file</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&mdash;</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Excludes file from the archive</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;exclude=pattern</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;X</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Droid Sans;">&nbsp;Exclude files, given as a PATTERN</span></td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000001;">&nbsp;&ndash;gzip or &ndash;gunzip</td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;z</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Processes an archive through gzip</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;bzip2</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;j</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Processes an archive through bzip2</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;&ndash;xz</span></td>
      <td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Consolas;">&nbsp;J</span></td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;Processes an archive through xz</td>
    </tr>
  </tbody>
</table>

Gzip is the oldest compression tool and provides the least compression, while bzip2 provides improved compression. In addition, xz is the newest but (usually) provides the best compression. This advantages of best compression come at a price: the time it takes to complete the operation, and system resources used during the process.

Normally, tar files compressed with these utilities have .gz, .bz2, or .xz extensions, respectively. In the following examples we will be using these files: file1, file2, file3, file4, and file5.

**Grouping and compressing with gzip, bzip2 and xz**

Group all the files in the current working directory and compress the resulting bundle with gzip, bzip2, and xz (please note the use of a regular expression to specify which files should be included in the bundle – this is to prevent the archiving tool to group the tarballs created in previous steps).

    # tar czf myfiles.tar.gz file[0-9]
    # tar cjf myfiles.tar.bz2 file[0-9]
    # tar cJf myfile.tar.xz file[0-9]

![Compress Multiple Files Using tar](http://www.tecmint.com/wp-content/uploads/2014/10/Compress-Multiple-Files.png)

Compress Multiple Files

**Listing the contents of a tarball and updating / appending files to the bundle**

List the contents of a tarball and display the same information as a long directory listing. Note that update or append operations cannot be applied to compressed files directly (if you need to update or append a file to a compressed tarball, you need to uncompress the tar file and update / append to it, then compress again).

    # tar tvf [tarball]

![Check Files in tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/List-Archive-Content.png)

List Archive Content

Run any of the following commands:

    # gzip -d myfiles.tar.gz	[#1] 
    # bzip2 -d myfiles.tar.bz2	[#2] 
    # xz -d myfiles.tar.xz 		[#3] 

Then

    # tar --delete --file myfiles.tar file4 (deletes the file inside the tarball)
    # tar --update --file myfiles.tar file4 (adds the updated file)

and

    # gzip myfiles.tar		[ if you choose #1 above ]
    # bzip2 myfiles.tar		[ if you choose #2 above ]
    # xz myfiles.tar 		[ if you choose #3 above ]

Finally,

    # tar tvf [tarball] #again

and compare the modification date and time of file4 with the same information as shown earlier.

**Excluding file types**

Suppose you want to perform a backup of user’s home directories. A good sysadmin practice would be (may also be specified by company policies) to exclude all video and audio files from backups.

Maybe your first approach would be to exclude from the backup all files with an .mp3 or .mp4 extension (or other extensions). What if you have a clever user who can change the extension to .txt or .bkp, your approach won’t do you much good. In order to detect an audio or video file, you need to check its file type with file. The following shell script will do the job.

    #!/bin/bash
    # Pass the directory to backup as first argument.
    DIR=$1
    # Create the tarball and compress it. Exclude files with the MPEG string in its file type.
    # -If the file type contains the string mpeg, $? (the exit status of the most recently executed command) expands to 0, and the filename is redirected to the exclude option. Otherwise, it expands to 1.
    # -If $? equals 0, add the file to the list of files to be backed up.
    tar X <(for i in $DIR/*; do file $i | grep -i mpeg; if [ $? -eq 0 ]; then echo $i; fi;done) -cjf backupfile.tar.bz2 $DIR/*

![Exclude Files in tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/Exclude-Files-in-Tar.png)

Exclude Files in tar

**Restoring backups with tar preserving permissions**

You can then restore the backup to the original user’s home directory (user_restore in this example), preserving permissions, with the following command.

    # tar xjf backupfile.tar.bz2 --directory user_restore --same-permissions

![Restore Files from tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/Restore-tar-Backup-Files.png)

Restore Files from Archive

**Read Also:**

- [18 tar Command Examples in Linux][1]
- [Dtrx – An Intelligent Archive Tool for Linux][2]

### Using find Command to Search for Files ###

The find command is used to search recursively through directory trees for files or directories that match certain characteristics, and can then either print the matching files or directories or perform other operations on the matches.

Normally, we will search by name, owner, group, type, permissions, date, and size.

#### Basic syntax: ####

# find [directory_to_search] [expression]

**Finding files recursively according to Size**

Find all files (-f) in the current directory (.) and 2 subdirectories below (-maxdepth 3 includes the current working directory and 2 levels down) whose size (-size) is greater than 2 MB.

    # find . -maxdepth 3 -type f -size +2M

![Find Files by Size in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Files-Based-on-Size.png)

Find Files Based on Size

**Finding and deleting files that match a certain criteria**

Files with 777 permissions are sometimes considered an open door to external attackers. Either way, it is not safe to let anyone do anything with files. We will take a rather aggressive approach and delete them! (‘{}‘ + is used to “collect” the results of the search).

    # find /home/user -perm 777 -exec rm '{}' +

![Find all 777 Permission Files](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Files-with-777-Permission.png)

Find Files with 777Permission

**Finding files per atime or mtime**

Search for configuration files in /etc that have been accessed (-atime) or modified (-mtime) more (+180) or less (-180) than 6 months ago or exactly 6 months ago (180).

Modify the following command as per the example below:

    # find /etc -iname "*.conf" -mtime -180 -print

![Find Files by Modification Time](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Modified-Files.png)

Find Modified Files

- Read Also: [35 Practical Examples of Linux ‘find’ Command][3]

### File Permissions and Basic Attributes ###

The first 10 characters in the output of ls -l are the file attributes. The first of these characters is used to indicate the file type:

- – : a regular file
- -d : a directory
- -l : a symbolic link
- -c : a character device (which treats data as a stream of bytes, i.e. a terminal)
- -b : a block device (which handles data in blocks, i.e. storage devices)

The next nine characters of the file attributes are called the file mode and represent the read (r), write (w), and execute (x) permissions of the file’s owner, the file’s group owner, and the rest of the users (commonly referred to as “the world”).

Whereas the read permission on a file allows the same to be opened and read, the same permission on a directory allows its contents to be listed if the execute permission is also set. In addition, the execute permission in a file allows it to be handled as a program and run, while in a directory it allows the same to be cd’ed into it.

File permissions are changed with the chmod command, whose basic syntax is as follows:

    # chmod [new_mode] file

Where new_mode is either an octal number or an expression that specifies the new permissions.

The octal number can be converted from its binary equivalent, which is calculated from the desired file permissions for the owner, the group, and the world, as follows:

The presence of a certain permission equals a power of 2 (r=22, w=21, x=20), while its absence equates to 0. For example:

![Linux File Permissions](http://www.tecmint.com/wp-content/uploads/2014/10/File-Permissions.png)

File Permissions

To set the file’s permissions as above in octal form, type:

    # chmod 744 myfile

You can also set a file’s mode using an expression that indicates the owner’s rights with the letter u, the group owner’s rights with the letter g, and the rest with o. All of these “individuals” can be represented at the same time with the letter a. Permissions are granted (or revoked) with the + or – signs, respectively.

**Revoking execute permission for a shell script to all users**

As we explained earlier, we can revoke a certain permission prepending it with the minus sign and indicating whether it needs to be revoked for the owner, the group owner, or all users. The one-liner below can be interpreted as follows: Change mode for all (a) users, revoke (–) execute permission (x).

    # chmod a-x backup.sh

Granting read, write, and execute permissions for a file to the owner and group owner, and read permissions for the world.

When we use a 3-digit octal number to set permissions for a file, the first digit indicates the permissions for the owner, the second digit for the group owner and the third digit for everyone else:

- Owner: (r=22 + w=21 + x=20 = 7)
- Group owner: (r=22 + w=21 + x=20 = 7)
- World: (r=22 + w=0 + x=0 = 4),

    # chmod 774 myfile

In time, and with practice, you will be able to decide which method to change a file mode works best for you in each case. A long directory listing also shows the file’s owner and its group owner (which serve as a rudimentary yet effective access control to files in a system):

![Linux File Listing](http://www.tecmint.com/wp-content/uploads/2014/10/Linux-File-Listing.png)

Linux File Listing

File ownership is changed with the chown command. The owner and the group owner can be changed at the same time or separately. Its basic syntax is as follows:

    # chown user:group file

Where at least user or group need to be present.

**Few Examples**

Changing the owner of a file to a certain user.

    # chown gacanepa sent

Changing the owner and group of a file to an specific user:group pair.

    # chown gacanepa:gacanepa TestFile

Changing only the group owner of a file to a certain group. Note the colon before the group’s name.

    # chown :gacanepa email_body.txt

### Conclusion ###

As a sysadmin, you need to know how to create and restore backups, how to find files in your system and change their attributes, along with a few tricks that can make your life easier and will prevent you from running into future issues.

I hope that the tips provided in the present article will help you to achieve that goal. Feel free to add your own tips and ideas in the comments section for the benefit of the community. Thanks in advance!
Reference Links

- [About the LFCS][4]
- [Why get a Linux Foundation Certification?][5]
- [Register for the LFCS exam][6]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/compress-files-and-finding-files-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[2]:http://www.tecmint.com/dtrx-an-intelligent-archive-extraction-tar-zip-cpio-rpm-deb-rar-tool-for-linux/
[3]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[4]:https://training.linuxfoundation.org/certification/LFCS
[5]:https://training.linuxfoundation.org/certification/why-certify-with-us
[6]:https://identity.linuxfoundation.org/user?destination=pid/1