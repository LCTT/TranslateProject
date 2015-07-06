在Linux中用chattr和lsattr命令管理文件和目录属性
================================================================================
为了允许添加数据，防止更改或者删除等，文件和文件夹可以设定了特定的控制属性。例如，你可以在关键的系统文件或者文件夹中启用属性，然后没有任何用户，包括root，可以删除或者修改它，比如不允许使用像dump这样的命令等备份工具去备份一个特定的文件或者文件夹，等等。这些属性只可以在ext2，ext3或者ext4文件系统中的文件和文件夹上设定。

有两个命令 **lsattr** 和 **chattr** 用来管理属性。下面是常用属性的列表。

注：表格代码
<table width="482" cellspacing="0" cellpadding="4"  border="1">
<colgroup>
<col width="112">
<col width="514"> </colgroup>
<tbody>
<tr valign="top">
<td width="112">
<p align="justify" class="western"><b>属性</b></p>
</td>
<td width="514">
<p align="justify" class="western"><b>描述</b></p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">a (append)</p>
</td>
<td width="514">
<p align="justify" class="western">允许在文件中进行追加操作</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">A</p>
</td>
<td width="514">
<p align="justify" class="western">这个属性不允许更新文件的访问时间</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">c (compressed)</p>
</td>
<td width="514">
<p align="justify" class="western">启用这个属性时，文件在磁盘上会自动压缩</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">d (dump)</p>
</td>
<td width="514">
<p align="justify" class="western">不能使用dump命令备份文件</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">D</p>
</td>
<td width="514">
<p align="justify" class="western">设置了文件夹的D属性时，更改会在同步保存在磁盘上</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">e (extent format)</p>
</td>
<td width="514">
<p align="justify" class="western">它表明，该文件使用磁盘上的块的映射扩展</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">i (immutable)</p>
</td>
<td width="514">
<p align="justify" class="western">在文件上启用这个属性时，我们不能更改、重命名或者删除这个文件</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">j (journaling)</p>
</td>
<td width="514">
<p align="justify" class="western">设置了这个属性时，文件的数据首先保存在日志中，然后再写入文件</p>
</td>
</tr>
<tr valign="top">
<td width="112">
<p align="justify" class="western">S (synchronous)</p>
</td>
<td width="514">
<p align="justify" class="western">设置了这个属性时，变更或更改同步保存到磁盘上</p>
</td>
</tr>
</tbody>
</table>

chattr属性中可以使用的不同选项 ：

- **-R** 递归地修改文件夹和子文件夹的属性
- **-V** chattr命令会输出带有版本信息的冗余信息
- **-f** 忽略大部分错误信息

在chattr中用于设置或者取消属性的 **操作符**

- '+' 符号用来为文件和文件夹设置属性，
- '-'  符号用来移除或者取消属性
- '=' 使它们成为文件有的唯一属性。

**chattr** 和 **lsattr** 命令的基本语法 ：

    # chattr <options> <attributes> <file or Directory >

    # lsattr <File or Directory>

### 例:1 使用‘i’属性使文件不可更改 ###

    [root@linuxtechi ~]# chattr +i dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    ----i----------- dummy_data

现在试着删除或者修改文件

    [root@linuxtechi ~]# rm -f dummy_data
    rm: cannot remove 'dummy_data': Operation not permitted
    
    [root@linuxtechi ~]# echo "test" >> dummy_data
    -bash: dummy_data: Permission denied

### 例:2 移除不可更改属性 ###

    [root@linuxtechi ~]# chattr -i dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    ---------------- dummy_data

### 例:3 在文件中只允许追加操作 ###

    [root@linuxtechi ~]# chattr +a dummy_data
    [root@linuxtechi ~]# lsattr dummy_data
    -----a---------- dummy_data

现在试着把fstab文件的内容追加到dummy_data文件

    [root@linuxtechi ~]# cat /etc/fstab >> dummy_data
    [root@linuxtechi ~]#

### 例 :4 使用 -R 选项和 ‘+i’ 属性使文件夹和它的子文件夹成为安全目录 ###

让我们来新建一个sysadmin文件夹和它的子文件夹

    [root@linuxtechi ~]# mkdir sysadmin
    [root@linuxtechi ~]# mkdir sysadmin/admim_{1,2,3,4,5}
    [root@linuxtechi ~]# ls -l sysadmin/
    total 0
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_1
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_2
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_3
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_4
    drwxr-xr-x. 2 root root 6 Apr 19 09:50 admim_5

在sysadmin文件夹递归设置不可更改属性

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

现在试着用rm命令删除文件夹

    [root@linuxtechi ~]# rm -rf sysadmin
    rm: cannot remove ‘sysadmin/admim_1’: Permission denied
    rm: cannot remove ‘sysadmin/admim_2’: Permission denied
    rm: cannot remove ‘sysadmin/admim_3’: Permission denied
    rm: cannot remove ‘sysadmin/admim_4’: Permission denied
    rm: cannot remove ‘sysadmin/admim_5’: Permission denied
    [root@linuxtechi ~]#

使用以下命令递归取消属性

    [root@linuxtechi ~]# chattr -R -i sysadmin

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/file-directory-attributes-in-linux-using-chattr-lsattr-command/

作者：[Pradeep Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/