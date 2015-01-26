Translating by Medusar

How to make a file immutable on Linux
================================================================================
Suppose you want to write-protect some important files on Linux, so that they cannot be deleted or tampered with by accident or otherwise. In other cases, you may want to prevent certain configuration files from being overwritten automatically by software. While changing their ownership or permission bits on the files by using chown or chmod is one way to deal with this situation, this is not a perfect solution as it cannot prevent any action done with root privilege. That is when chattr comes in handy.

chattr is a Linux command which allows one to set or unset attributes on a file, which are separate from the standard (read, write, execute) file permission. A related command is lsattr which shows which attributes are set on a file. While file attributes managed by chattr and lsattr are originally supported by EXT file systems (EXT2/3/4) only, this feature is now available on many other native Linux file systems such as XFS, Btrfs, ReiserFS, etc.

In this tutorial, I am going to demonstrate how to use chattr to make files immutable on Linux.

chattr and lsattr commands are a part of e2fsprogs package which comes pre-installed on all modern Linux distributions.

Basic syntax of chattr is as follows.

    $ chattr [-RVf] [operator][attribute(s)] files...

The operator can be '+' (which adds selected attributes to attribute list), '-' (which removes selected attributes from attribute list), or '=' (which forces selected attributes only).

Some of available attributes are the following.

- **a**: can be opened in append mode only.
- **A**: do not update atime (file access time).
- **c**: automatically compressed when written to disk.
- **C**: turn off copy-on-write.
- **i**: set immutable.
- **s**: securely deleted with automatic zeroing. 

### Immutable Attribute ###

To make a file immutable, you can add "immutable" attribute to the file as follows. For example, to write-protect /etc/passwd file:

    $ sudo chattr +i /etc/passwd

Note that you must use root privilege to set or unset "immutable" attribute on a file. Now verify that "immutable" attribute is added to the file successfully.

    $ lsattr /etc/passwd

Once the file is set immutable, this file is impervious to change for any user. Even the root cannot modify, remove, overwrite, move or rename the file. You will need to unset the immutable attribute before you can tamper with the file again.

To unset the immutable attribute, use the following command:

    $ sudo chattr -i /etc/passwd

![](https://farm9.staticflickr.com/8613/16152651317_076a65cf50_b.jpg)

If you want to make a whole directory (e.g., /etc) including all its content immutable at once recursively, use "-R" option:

    $ sudo chattr -R +i /etc

### Append Only Attribute ###

Another useful attribute is "append-only" attribute which forces a file to grow only. You cannot overwrite or delete a file with "append-only" attribute set. This attribute can be useful when you want to prevent a log file from being cleared by accident.

Similar to immutable attribute, you can turn a file into "append-only" mode by:

    $ sudo chattr +a /var/log/syslog

Note that when you copy an immutable or append-only file to another file, those attributes will not be preserved on the newly created file.

### Conclusion ###

In this tutorial, I showed how to use chattr and lsattr commands to manage additional file attributes to prevent (accidental or otherwise) file tampering. Beware that you cannot rely on chattr as a security measure as one can easily undo immutability. One possible way to address this limitation is to restrict the availability of chattr command itself, or drop kernel capability CAP_LINUX_IMMUTABLE. For more details on chattr and available attributes, refer to its man page.

--------------------------------------------------------------------------------

via: http://xmodulo.com/make-file-immutable-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
