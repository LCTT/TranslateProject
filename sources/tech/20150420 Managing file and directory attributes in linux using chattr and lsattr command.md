Translating by ictlyh
Managing file & directory attributes in linux using chattr & lsattr command
================================================================================
There are certain control attributes that may be set on a file or directory in order to allow data to be appended, to prevent it from being changed or deleted, etc. For example, you can enable attributes on a critical system file or directory so that no users, including root, can delete or change it, disallow a backup utility such as the dump command to back up a specific file or directory, and so on. These attributes can only be set on files and directories located in an ext2, ext3, or an ext4 file system

There are two commands **lsattr** and **chattr** that are used for attribute management. The following is the list of commonly used attributes

注：表格代码
<table width="482" cellspacing="0" cellpadding="4" style="height: 651px">
<colgroup>
<col width="112">
<col width="514"> </colgroup>
<tbody>
<tr valign="top">
<td width="112">
<p align="justify" class="western"><b>Attributes</b></p>
</td>
<td width="514">
<p align="justify" class="western"><b>Description</b></p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">a (append)</p>
</td>
<td width="514">
<p align="justify" class="western">Append operation is allowed on the file</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">A</p>
</td>
<td width="514">
<p align="justify" class="western">This attribute will not allow to update access time of a file</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">c (compressed)</p>
</td>
<td width="514">
<p align="justify" class="western">When this attribute is enable then file is compressed on the disk automatically</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">d (dump)</p>
</td>
<td width="514">
<p align="justify" class="western">File cannot be backed up using the dump command.</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">D</p>
</td>
<td width="514">
<p align="justify" class="western">When D attribute is set on directory then changes are stored synchronously on the disk</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">e (extent format)</p>
</td>
<td width="514">
<p align="justify" class="western">It shows that the file is using extents for mapping the blocks on disk</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">i (immutable)</p>
</td>
<td width="514">
<p align="justify" class="western">When this attribute is enable on file then we cannot be altered, renamed and delete file.</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">j (journaling)</p>
</td>
<td width="514">
<p align="justify" class="western">When this attribute is set then file’s data is stored in journal first then written to file.</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">S (synchronous)</p>
</td>
<td width="514">
<p align="justify" class="western">When this attribute is set , then changes or modifications are stored synchronously on the disk</p>
</td>
</tr>
</tbody>
</table>

Different Options that can be used in chattr Command :

- **-R** change attributes of directory and its sub-directories recursively
- **-V** Verbose output of chattr command along with version.
- **-f** Suppress most error messages.

**Operators** that are used in chattr command to set and unset attributes

- The ‘+’ sign is used to set attribute on the files and directories,
- The ‘-‘ sign is used to remove or unset the attribute
- The ‘=’ sign causes them to be the only attributes that the files have.

Basic Syntax of **chattr** and **lsattr** command :

    # chattr <options> <attributes> <file or Directory >

    # lsattr <File or Directory>

### Example:1 Make a file immutable using ‘i’ attribute ###

    [root@linuxtechi ~]# chattr +i dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    ----i----------- dummy_data

Now try to remove and edit the File

    [root@linuxtechi ~]# rm -f dummy_data
    rm: cannot remove ‘dummy_data’: Operation not permitted
    
    [root@linuxtechi ~]# echo "test" >> dummy_data
    -bash: dummy_data: Permission denied

### Example:2 Remove the immutable attribute ###

    [root@linuxtechi ~]# chattr -i dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    ---------------- dummy_data

### Example:3 To allow only append operations on the file ###

    [root@linuxtechi ~]# chattr +a dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    -----a---------- dummy_data

Now try to append the contents of fstab file in dummy_data file

    [root@linuxtechi ~]# cat /etc/fstab >> dummy_data
    [root@linuxtechi ~]#

### Example :4 Secure Directory and its sub-directories using -R option and ‘+i’ attribute. ###

Let’s create a directory sysadmin and its subdirectories

    [root@linuxtechi ~]# mkdir sysadmin
    [root@linuxtechi ~]# mkdir sysadmin/admim_{1,2,3,4,5}
    [root@linuxtechi ~]# ls -l sysadmin/
    total 0
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_1
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_2
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_3
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_4
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_5

Set immutable attribute Recursively on the directory sysadmin

    [root@linuxtechi ~]# chattr -R +i sysadmin
    
    [root@linuxtechi ~]# lsattr -R sysadmin/
    ----i----------- sysadmin/admim_1
    sysadmin/admim_1:
    ----i----------- sysadmin/admim_2
    sysadmin/admim_2:
    ----i----------- sysadmin/admim_3
    sysadmin/admim_3:
    ----i----------- sysadmin/admim_4
    sysadmin/admim_4:
    ----i----------- sysadmin/admim_5
    sysadmin/admim_5:
    [root@linuxtechi ~]#

Now try to delete directories using rm command

    [root@linuxtechi ~]# rm -rf sysadmin
    rm: cannot remove ‘sysadmin/admim_1’: Permission denied
    rm: cannot remove ‘sysadmin/admim_2’: Permission denied
    rm: cannot remove ‘sysadmin/admim_3’: Permission denied
    rm: cannot remove ‘sysadmin/admim_4’: Permission denied
    rm: cannot remove ‘sysadmin/admim_5’: Permission denied
    [root@linuxtechi ~]#

To unset the the attributes recursively use the below command

    [root@linuxtechi ~]# chattr -R -i sysadmin

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/file-directory-attributes-in-linux-using-chattr-lsattr-command/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/