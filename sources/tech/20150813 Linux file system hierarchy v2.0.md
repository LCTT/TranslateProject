Linux file system hierarchy v2.0
================================================================================
What is a file in Linux? What is file system in Linux? Where are all the configuration files? Where do I keep my downloaded applications? Is there really a filesystem standard structure in Linux? Well, the above image explains Linux file system hierarchy in a very simple and non-complex way. It’s very useful when you’re looking for a configuration file or a binary file. I’ve added some explanation and examples below, but that’s TL;DR.

Another issue is when you got configuration and binary files all over the system that creates inconsistency and if you’re a large organization or even an end user, it can compromise your system (binary talking with old lib files etc.) and when you do [security audit of your Linux system][1], you find it is vulnerable to different exploits. So keeping a clean operating system (no matter Windows or Linux) is important.

### What is a file in Linux? ###

A simple description of the UNIX system, also applicable to Linux, is this:

> On a UNIX system, everything is a file; if something is not a file, it is a process.

This statement is true because there are special files that are more than just files (named pipes and sockets, for instance), but to keep things simple, saying that everything is a file is an acceptable generalization. A Linux system, just like UNIX, makes no difference between a file and a directory, since a directory is just a file containing names of other files. Programs, services, texts, images, and so forth, are all files. Input and output devices, and generally all devices, are considered to be files, according to the system.

![](http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-file-system-hierarchy-v2.0-2480px-blackMORE-Ops.png)

- Version 2.0 – 17-06-2015
    - – Improved: Added title and version history.
    - – Improved: Added /srv, /media and /proc.
    - – Improved: Updated descriptions to reflect modern Linux File Systems.
    - – Fixed: Multiple typo’s.
    - – Fixed: Appearance and colour.
- Version 1.0 – 14-02-2015
    - – Created: Initial diagram.
    - – Note: Discarded lowercase version.

### Download Links ###

Following are two links for download. If you need this in any other format, let me know and I will try to create that and upload it somewhere.

- [Large (PNG) Format – 2480×1755 px – 184KB][2]
- [Largest (PDF) Format – 9919x7019 px – 1686KB][3]

**Note**: PDF Format is best for printing and very high in quality

### Linux file system description ###

In order to manage all those files in an orderly fashion, man likes to think of them in an ordered tree-like structure on the hard disk, as we know from `MS-DOS` (Disk Operating System) for instance. The large branches contain more branches, and the branches at the end contain the tree’s leaves or normal files. For now we will use this image of the tree, but we will find out later why this is not a fully accurate image.

注：表格
<table cellspacing="2" border="4" style="border-collapse: collapse; width: 731px; height: 2617px;">
  <thead>
    <tr>
      <th scope="col">Directory</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><dl>
          <dd><code>/</code></dd>
        </dl></td>
      <td><i>Primary hierarchy</i> root and root directory of the entire file system hierarchy.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/bin</code></dd>
        </dl></td>
      <td>Essential command binaries that need to be available in single user mode; for all users, <i>e.g.</i>, cat, ls, cp.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/boot</code></dd>
        </dl></td>
      <td>Boot loader files, <i>e.g.</i>, kernels, initrd.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/dev</code></dd>
        </dl></td>
      <td>Essential devices, <i>e.g.</i>, <code>/dev/null</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/etc</code></dd>
        </dl></td>
      <td>Host-specific system-wide configuration filesThere has been controversy over the meaning of the name itself. In early versions of the UNIX Implementation Document from Bell labs, /etc is referred to as the <i>etcetera directory</i>, as this directory historically held everything that did not belong elsewhere (however, the FHS restricts /etc to static configuration files and may not contain binaries). Since the publication of early documentation, the directory name has been re-designated in various ways. Recent interpretations include backronyms such as “Editable Text Configuration” or “Extended Tool Chest”.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/opt</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files for add-on packages that are stored in <code>/opt/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/sgml</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files, such as catalogs, for software that processes SGML.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/X11</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files for the X Window System, version 11.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/xml</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files, such as catalogs, for software that processes XML.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/home</code></dd>
        </dl></td>
      <td>Users’ home directories, containing saved files, personal settings, etc.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/lib</code></dd>
        </dl></td>
      <td>Libraries essential for the binaries in <code>/bin/</code> and <code>/sbin/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/lib&lt;qual&gt;</code></dd>
        </dl></td>
      <td>Alternate format essential libraries. Such directories are optional, but if they exist, they have some requirements.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/media</code></dd>
        </dl></td>
      <td>Mount points for removable media such as CD-ROMs (appeared in FHS-2.3).</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/mnt</code></dd>
        </dl></td>
      <td>Temporarily mounted filesystems.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/opt</code></dd>
        </dl></td>
      <td>Optional application software packages.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/proc</code></dd>
        </dl></td>
      <td>Virtual filesystem providing process and kernel information as files. In Linux, corresponds to a procfs mount.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/root</code></dd>
        </dl></td>
      <td>Home directory for the root user.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/sbin</code></dd>
        </dl></td>
      <td>Essential system binaries, <i>e.g.</i>, init, ip, mount.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/srv</code></dd>
        </dl></td>
      <td>Site-specific data which are served by the system.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/tmp</code></dd>
        </dl></td>
      <td>Temporary files (see also <code>/var/tmp</code>). Often not preserved between system reboots.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/usr</code></dd>
        </dl></td>
      <td><i>Secondary hierarchy</i> for read-only user data; contains the majority of (multi-)user utilities and applications.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/bin</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Non-essential command binaries (not needed in single user mode); for all users.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/include</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Standard include files.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Libraries for the binaries in <code>/usr/bin/</code> and <code>/usr/sbin/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib&lt;qual&gt;</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Alternate format libraries (optional).</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/local</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td><i>Tertiary hierarchy</i> for local data, specific to this host. Typically has further subdirectories, <i>e.g.</i>, <code>bin/</code>, <code>lib/</code>, <code>share/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/sbin</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Non-essential system binaries, <i>e.g.</i>, daemons for various network-services.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/share</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Architecture-independent (shared) data.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/src</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Source code, <i>e.g.</i>, the kernel source code with its header files.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/X11R6</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>X Window System, Version 11, Release 6.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/var</code></dd>
        </dl></td>
      <td>Variable files&mdash;files whose content is expected to continually change during normal operation of the system&mdash;such as logs, spool files, and temporary e-mail files.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/cache</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Application cache data. Such data are locally generated as a result of time-consuming I/O or calculation. The application must be able to regenerate or restore the data. The cached files can be deleted without loss of data.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>State information. Persistent data modified by programs as they run, <i>e.g.</i>, databases, packaging system metadata, etc.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lock</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Lock files. Files keeping track of resources currently in use.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/log</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Log files. Various logs.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/mail</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Users’ mailboxes.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/opt</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Variable data from add-on packages that are stored in <code>/opt/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/run</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Information about the running system since last boot, <i>e.g.</i>, currently logged-in users and running <a href="http://en.wikipedia.org/wiki/Daemon_%28computing%29">daemons</a>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/spool</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Spool for tasks waiting to be processed, <i>e.g.</i>, print queues and outgoing mail queue.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd>
                <dl>
                  <dd><code>/mail</code></dd>
                </dl>
              </dd>
            </dl>
          </dd>
        </dl></td>
      <td>Deprecated location for users’ mailboxes.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/tmp</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Temporary files to be preserved between reboots.</td>
    </tr>
  </tbody>
</table>

### Types of files in Linux ###

Most files are just files, called `regular` files; they contain normal data, for example text files, executable files or programs, input for or output from a program and so on.

While it is reasonably safe to suppose that everything you encounter on a Linux system is a file, there are some exceptions.

- `Directories`: files that are lists of other files.
- `Special files`: the mechanism used for input and output. Most special files are in `/dev`, we will discuss them later.
- `Links`: a system to make a file or directory visible in multiple parts of the system’s file tree. We will talk about links in detail.
- `(Domain) sockets`: a special file type, similar to TCP/IP sockets, providing inter-process networking protected by the file system’s access control.
- `Named pipes`: act more or less like sockets and form a way for processes to communicate with each other, without using network socket semantics.

### File system in reality ###

For most users and for most common system administration tasks, it is enough to accept that files and directories are ordered in a tree-like structure. The computer, however, doesn’t understand a thing about trees or tree-structures.

Every partition has its own file system. By imagining all those file systems together, we can form an idea of the tree-structure of the entire system, but it is not as simple as that. In a file system, a file is represented by an `inode`, a kind of serial number containing information about the actual data that makes up the file: to whom this file belongs, and where is it located on the hard disk.

Every partition has its own set of inodes; throughout a system with multiple partitions, files with the same inode number can exist.

Each inode describes a data structure on the hard disk, storing the properties of a file, including the physical location of the file data. When a hard disk is initialized to accept data storage, usually during the initial system installation process or when adding extra disks to an existing system, a fixed number of inodes per partition is created. This number will be the maximum amount of files, of all types (including directories, special files, links etc.) that can exist at the same time on the partition. We typically count on having 1 inode per 2 to 8 kilobytes of storage.At the time a new file is created, it gets a free inode. In that inode is the following information:

- Owner and group owner of the file.
- File type (regular, directory, …)
- Permissions on the file
- Date and time of creation, last read and change.
- Date and time this information has been changed in the inode.
- Number of links to this file (see later in this chapter).
- File size
- An address defining the actual location of the file data.

The only information not included in an inode, is the file name and directory. These are stored in the special directory files. By comparing file names and inode numbers, the system can make up a tree-structure that the user understands. Users can display inode numbers using the -i option to ls. The inodes have their own separate space on the disk.

--------------------------------------------------------------------------------

via: http://www.blackmoreops.com/2015/06/18/linux-file-system-hierarchy-v2-0/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.blackmoreops.com/2015/02/15/in-light-of-recent-linux-exploits-linux-security-audit-is-a-must/
[2]:http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-file-system-hierarchy-v2.0-2480px-blackMORE-Ops.png
[3]:http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-File-System-Hierarchy-blackMORE-Ops.pdf
