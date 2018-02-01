使用 ACL 设置用户访问指定文件/目录的权限
======

当提到文件和目录的权限时，你的第一反应可能是“属主/群组/其它”权限。 这些权限可以通过 `chmod`、 `chown` 等命令来修改。

文件和目录都有属主 (文件所有者 )、群组 (所属组) 以及其它权限，这些权限构成一个集合。 然而这些权限集合有它的局限性，无法做到为不同的用户设置不同的权限。

Linux 对文件和目录有以下默认权限。

- 文件 -> `644` -> `-rw-r-r-` （所有者有读写权限，组成员有只读权限， 其他人也只有读权限）
- 目录 -> `755` -> `drwxr-xr-x` （所有者有读、写和执行权限，组成员有读和执行的权限，其他人也有读和执行的权限）

比如： 默认情况下，所有者可以访问和编辑他们自己主目录中的文件， 也可以访问相关同组人的文件，但他们不能修改这些文件，因为组成员没有写权限，而且让组成员有写权限也是不明智的。 基于同样的原因，他/她也不能修改其他人的文件。 然而在某些情况下，多个用户想要修改同一个文件， 那该怎么办呢？

假设有个名叫 `magi` 的用户，他想要修改 `httpd.conf` 文件怎么办呢？ 这个文件是归 root 用户所有的，这样如何授权呢？ 为了解决这种情况，<ruby>访问控制列表<rt>Access Control List</rt></ruby>（ACL）诞生了。

### 什么是 ACL？

ACL 表示<ruby>访问控制列表<rt>Access Control List</rt></ruby>（ACL），它为文件系统提供了附加的、更具有弹性的权限机制。 它被设计来为补充 UNIX 文件权限机制。 ACL 允许你赋予任何某用户/组访问某项资源的权限。 `setfacl` 与 `getfacl` 命令会帮助你管理 ACL 而不会有任何麻烦。

### 什么是 setfacl？

`setfacl` 用于设置文件和目录的 ACL。

### 什么 getfacl？

`getfacl` - 获取文件的 ACL 。对于每个文件， `getfacl` 都会显示文件名、文件所有者、所属组以及ACL。 如果目录有默认 ACL， `getfacl` 也会显示这个默认的 ACL。

### 如何确认是否启用了 ACL？

运行 `tune2fs` 命令来检查是否启用了 ACL。

```
# tune2fs -l /dev/sdb1 | grep options
Default mount options: (none)
```

上面的输出很明显第说明 `/dev/sdb1` 分区没有启用 ACL。

如果结果中没有列出 `acl`，则你需要在挂载选项中加上 `acl`。 为了让它永久生效， 修改 `/etc/fstab` 中 `/app` 这一行成这样：

```
# more /etc/fstab

UUID=f304277d-1063-40a2-b9dc-8bcf30466a03 / ext4 defaults 1 1
/dev/sdb1 		 /app ext4 defaults，acl 1 1

```

或者，你也可以使用下面命令将其添加道文件系统的超级块中：

```
# tune2fs -o +acl /dev/sdb1
```

现在，通过运行以下命令来动态修改选项：

```
# mount -o remount,acl /app
```

再次运行 `tune2fs` 命令来看选项中是否有 `acl` 了：

```
# tune2fs -l /dev/sdb1 | grep options
Default mount options： acl
```

嗯，现在 `/dev/sdb1` 分区中有 ACL 选项了。

### 如何查看默认的 ACL 值

要查看文件和目录默认的 ACL 值，可以使用 `getfacl` 命令后面加上文件路径或者目录路径。 注意， 当你对非 ACL 文件/目录运行 `getfacl` 命令时， 则不会显示附加的 `user` 和 `mask` 参数值。

```
# getfacl /etc/apache2/apache2.conf

# file： etc/apache2/apache2.conf
# owner： root
# group： root
user::rw-
group::r--
other::r--
```

### 如何为文件设置 ACL

以下面格式运行 `setfacl` 命令可以为指定文件设置 ACL。在下面的例子中，我们会给 `magi` 用户对 `/etc/apache2/apache2.conf` 文件 `rwx` 的权限。

```
# setfacl -m u:magi:rwx /etc/apache2/apache2.conf
```

**仔细分析起来：**

  * `setfacl`： 命令
  * `-m`： 修改文件的当前 ACL
  * `u`： 指明用户
  * `magi`： 用户名
  * `rwx`： 要设置的权限
  * `/etc/apache2/apache2.conf`： 文件名称

再查看一次新的 ACL 值：

```
# getfacl /etc/apache2/apache2.conf

# file： etc/apache2/apache2.conf
# owner： root
# group： root
user::rw-
user:magi:rwx
group::r--
mask::rwx
other::r--
```

注意： 若你发现文件或目录权限后面有一个加号（`+`），就表示设置了 ACL。

```
# ls -lh /etc/apache2/apache2.conf
-rw-rwxr--+ 1 root root 7.1K Sep 19 14:58 /etc/apache2/apache2.conf
```

### 如何为目录设置 ACL

以下面格式运行 `setfacl` 命令可以递归地为指定目录设置 ACL。在下面的例子中，我们会将 `/etc/apache2/sites-available/` 目录中的 `rwx` 权限赋予 `magi` 用户。

```
# setfacl -Rm u:magi:rwx /etc/apache2/sites-available/
```

**其中：**

  * `-R`： 递归到子目录中

再次查看一下新的 ACL 值。

```
# getfacl /etc/apache2/sites-available/

# file： etc/apache2/sites-available/
# owner： root
# group： root
user::rwx
user:magi:rwx
group::r-x
mask::rwx
other::r-x

```

现在 `/etc/apache2/sites-available/` 中的文件和目录都设置了 ACL。

```
# ls -lh /etc/apache2/sites-available/
total 20K
-rw-rwxr--+ 1 root root 1.4K Sep 19 14:56 000-default.conf
-rw-rwxr--+ 1 root root 6.2K Sep 19 14:56 default-ssl.conf
-rw-rwxr--+ 1 root root 1.4K Dec 8 02:57 mywebpage.com.conf
-rw-rwxr--+ 1 root root 1.4K Dec 7 19:07 testpage.com.conf
```

### 如何为组设置 ACL

以下面格式为指定文件运行 `setfacl` 命令。在下面的例子中，我们会给 `appdev` 组赋予 `/etc/apache2/apache2.conf` 文件的 `rwx` 权限。

```
# setfacl -m g:appdev:rwx /etc/apache2/apache2.conf
```

**其中：**

  * `g`： 指明一个组

对多个用户和组授权，只需要用 `逗号` 区分开，就像下面这样。

```
# setfacl -m u:magi:rwx,g:appdev:rwx /etc/apache2/apache2.conf
```

### 如何删除 ACL

以下面格式运行 `setfacl` 命令会删除文件对指定用户的 ACL。这只会删除用户权限而保留 `mask` 的值为只读。

```
# setfacl -x u:magi /etc/apache2/apache2.conf
```

**其中：**

  * `-x`： 从文件的 ACL 中删除

再次查看 ACL 值。在下面的输出中我们可以看到 `mask` 的值是读。

```
# getfacl /etc/apache2/apache2.conf

# file： etc/apache2/apache2.conf
# owner： root
# group： root
user::rw-
group::r--
mask::r--
other::r--
```

使用 `-b` 来删除文件中所有的 ACL。

```
# setfacl -b /etc/apache2/apache2.conf
```

**其中：**

  * `-b`： 删除所有的 ACL 条目

再次查看删掉后的 ACl 值就会发现所有的东西都不见了，包括 `mask` 的值也不见了。

```
# getfacl /etc/apache2/apache2.conf

# file： etc/apache2/apache2.conf
# owner： root
# group： root
user::rw-
group::r--
other::r--
```

### 如何备份并还原 ACL

下面命令可以备份和还原 ACL 的值。要制作备份， 需要进入对应的目录然后这样做（假设我们要备份 `sites-available` 目录中的 ACL 值)。

```
# cd /etc/apache2/sites-available/
# getfacl -R * > acl_backup_for_folder
```

还原的话，则运行下面命令：

```
# setfacl --restore=/etc/apache2/sites-available/acl_backup_for_folder
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-configure-access-control-lists-acls-setfacl-getfacl-linux/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com
