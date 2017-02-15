如何在 Linux 中创建一个共享目录
============================================================

作为系统管理员，你可能有一个特定目录，你希望为 Linux 服务器上的每个用户授予读/写访问权限。在本指南中，我们将回顾如何在 Linux 中对特定目录（共享目录）上的所有用户启用写访问。

这要求设置适当的访问权限，而最有效、可靠的方法是为所有要共享或对特定目录的写访问权的用户分配一个公共组。

如果你系统中还没有存在这个目录和公众组，用下面的命令创建：

```
$ sudo mkdir -p /var/www/reports/
$ sudo groupadd project 
```

接着将对目录 `/var/www/reports/` 有写权限的用户添加到 `project` 组中。

```
$ sudo usermod -a -G project tecmint 
```
[
 ![Create Common Directory Group](http://www.tecmint.com/wp-content/uploads/2017/01/Create-Common-Directory-Group.png) 
][1]

*创建公共目录组*

上面命令使用到的标志和参数是：

1.  `-a` – 将用户添加到增补组中。
2.  `-G` – 指定组名。
3.  `project` – 组名。
4.  `tecmint` – 已有的用户名。

在这之后，给目录配置适当的权限，`-R` 会让操作递归进入子目录中： 

```
$ sudo chgrp -R project /var/www/reports/
$ sudo chmod -R 2775 /var/www/reports/
```

解释下上面 `chmod` 命令中的 `2775`：

1.  `2` - 打开 setGID 位，意味着新创建的子文件继承与目录相同的组，新创建的子目录继承父目录的 setGID 位。
2.  `7` - 为所有者提供 rwx 权限。
3.  `7` - 给组 rwx 权限。
4.  `5` - 为其他人提供 rx 权限。

你可以使用下面的命令创建更多的系统用户并将它们添加到目录组中：

```
$ sudo useradd -m -c "Aaron Kili" -s/bin/bash -G project aaronkilik
$ sudo useradd -m -c "John Doo" -s/bin/bash -G project john
$ sudo useradd -m -c "Ravi Saive" -s/bin/bash -G project ravi
```

接着创建每个用户存储他们项目报告的子目录：

```
$ sudo mkdir -p /var/www/reports/aaronkilik_reports
$ sudo mkdir -p /var/www/reports/johndoo_reports
$ sudo mkdir -p /var/www/reports/ravi_reports
```

现在你可以创建文件/文件，并分享给该组的其他用户了。

就是这样了！在本篇中，我们回顾了如何启用所有用户对特定目录的写权限。要了解更多关于 Linux 中的用户/组，阅读[如何管理用户/组和属性][2]。

记得在评论栏中留下你对这篇文章的想法。

--------------------------------------------------------------------------------

译者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 和 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-a-shared-directory-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-Common-Directory-Group.png
[2]:http://www.tecmint.com/manage-users-and-groups-in-linux/
