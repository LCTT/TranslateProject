RHCSA 系列: 如何管理RHEL7的用户和组 – Part 3
================================================================================
和管理其他Linux服务器一样，管理一个 RHEL 7 服务器 要求你能够添加，修改，暂停或删除用户帐户，并且授予他们文件,目录，其他系统资源所必要的权限。
![User and Group Management in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/User-and-Group-Management-in-Linux.png)

RHCSA: 用户和组管理 – Part 3

### 管理用户帐户##

如果想要给RHEL 7 服务器添加账户，你需要以root用户执行如下两条命令

    # adduser [new_account]
    # useradd [new_account]

当添加新的用户帐户时，默认会执行下列操作。

- 他/她 的主目录就会被创建(一般是"/home/用户名"，除非你特别设置)
- 一些隐藏文件 如`.bash_logout`, `.bash_profile` 以及 `.bashrc` 会被复制到用户的主目录，并且会为用户的回话提供环境变量.你可以进一步查看他们的相关细节。
- 会为您的账号添加一个邮件池目录
- 会创建一个和用户名同样的组

用户帐户的全部信息被保存在`/etc/passwd `文件。这个文件以如下格式保存了每一个系统帐户的所有信息(以:分割)
    [username]:[x]:[UID]:[GID]:[Comment]:[Home directory]:[Default shell]

-  `[username]` 和`[Comment]` 是用于自我解释的
-  ‘x’表示帐户的密码保护(详细在`/etc/shadow`文件)，就是我们用于登录的`[username]`.
-  `[UID]` 和`[GID]`是用于显示`[username]` 的 用户认证和主用户组。

最后,

-  `[Home directory]`显示`[username]`的主目录的绝对路径
-  `[Default shell]` 是当用户登录系统后使用的默认shell

另外一个你必须要熟悉的重要的文件是存储组信息的`/etc/group`.因为和`/etc/passwd`类似，所以也是由:分割
    [Group name]:[Group password]:[GID]:[Group members]



- `[Group name]` 是组名
- 这个组是否使用了密码 (如果是"X"意味着没有).
- `[GID]`: 和`/etc/passwd`中一样
- `[Group members]`:用户列表，使用,隔开。里面包含组内的所有用户 

添加过帐户后，任何时候你都可以通过 usermod 命令来修改用户战壕沟，基础的语法如下:
    # usermod [options] [username]

相关阅读

- [15 ‘useradd’ Command Examples][1]
- [15 ‘usermod’ Command Examples][2]

#### 示例1 : 设置帐户的过期时间 ####

如果你的公司有一些短期使用的帐户或者你相应帐户在有限时间内使用，你可以使用 `--expiredate`  参数 ，后加YYYY-MM-DD格式的日期。为了查看是否生效，你可以使用如下命令查看
    # chage -l [username]

帐户更新前后的变动如下图所示
![Change User Account Information](http://www.tecmint.com/wp-content/uploads/2015/03/Change-User-Account-Information.png)

修改用户信息

#### 示例 2: 向组内追加用户 ####

除了创建用户时的主用户组，一个用户还能被添加到别的组。你需要使用 -aG或 -append -group 选项，后跟逗号分隔的组名
#### 示例 3: 修改用户主目录或默认Shell ####

如果因为一些原因，你需要修改默认的用户主目录(一般为 /home/用户名)，你需要使用 -d 或 -home 参数，后跟绝对路径来修改主目录
如果有用户想要使用其他的shell来取代bash(比如sh ),一般默认是bash .使用 usermod ，并使用 -shell 的参数，后加新的shell的路径
#### 示例 4: 展示组内的用户 ####

当把用户添加到组中后，你可以使用如下命令验证属于哪一个组

    # groups [username]
    # id [username]

下面图片的演示了示例2到示例四

![Adding User to Supplementary Group](http://www.tecmint.com/wp-content/uploads/2015/03/Adding-User-to-Supplementary-Group.png)

添加用户到额外的组

在上面的示例中:

    # usermod --append --groups gacanepa,users --home /tmp --shell /bin/sh tecmint

如果想要从组内删除用户，省略 `--append` 切换，并且可以使用 `--groups` 来列举组内的用户

#### 示例 5: 通过锁定密码来停用帐户 ####

如果想要关闭帐户，你可以使用 -l(小写的L)或 -lock 选项来锁定用户的密码。这将会阻止用户登录。

#### 示例 6:  解锁密码 ####

当你想要重新启用帐户让他可以继续登录时，属于 -u 或 –unlock 选项来解锁用户的密码，就像示例5 介绍的那样

    # usermod --unlock tecmint

下面的图片展示了示例5和示例6

![Lock Unlock User Account](http://www.tecmint.com/wp-content/uploads/2015/03/Lock-Unlock-User-Account.png)

锁定上锁用户

#### 示例 7:删除组和用户 ####

如果要删除一个组，你需要使用 groupdel ，如果需要删除用户  你需要使用 userdel (添加 -r 可以删除主目录和邮件池的内容)
    # groupdel [group_name]        # 删除组
    # userdel -r [user_name]       # 删除用户，并删除主目录和邮件池

如果一些文件属于组，他们将不会被删除。但是组拥有者将会被设置为删除掉的组的GID
### 列举，设置，并且修改 ugo/rwx 权限 ###

著名的 [ls 命令][3] 是管理员最好的助手. 当我们使用 -l 参数, 这个工具允许您查看一个目录中的内容（或详细格式).

而且，该命令还可以应用于单个文件中。无论哪种方式，在“ls”输出中的前10个字符表示每个文件的属性。
这10个字符序列的第一个字符用于表示文件类型：

- – (连字符): 一个标准文件
- d: 一个目录
- l: 一个符号链接
- c: 字符设备（将数据作为字节流，即一个终端）
- b: 块设备（处理数据块，即存储设备）

文件属性的下一个九个字符，分为三个组，被称为文件模式，并注明读（r），写（w），并执行（x）授予文件的所有者，文件的所有组，和其他的用户（通常被称为“世界”）。
在文件的读取权限允许打开和读取相同的权限时，允许其内容被列出，如果还设置了执行权限，还允许它作为一个程序和运行。
文件权限是通过chmod命令改变的，它的基本语法如下：

    # chmod [new_mode] file

new_mode是一个八进制数或表达式，用于指定新的权限。适合每一个随意的案例。或者您已经有了一个更好的方式来设置文件的权限，所以你觉得可以自由地使用最适合你自己的方法。
八进制数可以基于二进制等效计算，可以从所需的文件权限的文件的所有者，所有组，和世界。一定权限的存在等于2的幂（R = 22，W = 21，x = 20），没有时意为0。例如：
![File Permissions](http://www.tecmint.com/wp-content/uploads/2015/03/File-Permissions.png)

文件权限

在八进制形式下设置文件的权限，如上图所示

    # chmod 744 myfile

请用一分钟来对比一下我们以前的计算，在更改文件的权限后，我们的实际输出为：

![Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/Long-List-Format.png)

长列表格式

#### 示例 8: 寻找777权限的文件 ####

出于安全考虑，你应该确保在正常情况下，尽可能避免777权限（读、写、执行的文件）。虽然我们会在以后的教程中教你如何更有效地找到所有的文件在您的系统的权限集的说明，你现在仍可以使用LS grep获取这种信息。
在下面的例子，我们会寻找 /etc 目录下的777权限文件. 注意，我们要使用第二章讲到的管道的知识[第二章：文件和目录管理][4]:

    # ls -l /etc | grep rwxrwxrwx

![Find All Files with 777 Permission](http://www.tecmint.com/wp-content/uploads/2015/03/Find-All-777-Files.png)

查找所有777权限的文件

#### 示例 9: 为所有用户指定特定权限 ####

shell脚本，以及一些二进制文件，所有用户都应该有权访问（不只是其相应的所有者和组），应该有相应的执行权限（我们会讨论特殊情况下的问题）：
    # chmod a+x script.sh

**注意**: 我们可以设置文件模式使用表示用户权限的字母如“u”，组所有者权限的字母“g”，其余的为o 。所有权限为a.权限可以通过`+` 或 `-` 来管理。

![Set Execute Permission on File](http://www.tecmint.com/wp-content/uploads/2015/03/Set-Execute-Permission-on-File.png)

为文件设置执行权限

长目录列表还显示了该文件的所有者和其在第一和第二列中的组主。此功能可作为系统中文件的第一级访问控制方法：

![Check File Owner and Group](http://www.tecmint.com/wp-content/uploads/2015/03/Check-File-Owner-and-Group.png)

检查文件的属主和属组

改变文件的所有者，您将使用chown命令。请注意，您可以在同一时间或单独的更改文件的所有权：
    # chown user:group file

虽然可以在同一时间更改用户或组，或在同一时间的两个属性，但是不要忘记冒号区分，如果你想要更新其他属性，让另外的选项保持空白：
    # chown :group file              # Change group ownership only
    # chown user: file               # Change user ownership only

#### 示例 10:从一个文件复制权限到另一个文件####

If you would like to “clone” ownership from one file to another, you can do so using the –reference flag, as follows:
如果你想“克隆”一个文件的所有权到另一个，你可以这样做，使用–reference参数，如下：
    # chown --reference=ref_file file

ref_file的所有信息会复制给 file

![Clone File Ownership](http://www.tecmint.com/wp-content/uploads/2015/03/Clone-File-Ownership.png)

复制文件属主信息

### 设置 SETGID 协作目录 ###

你应该授予在一个特定的目录中拥有访问所有的文件的权限给一个特点的用户组，你将有可能使用目录设置setgid的方法。当setgid后设置，真实用户的有效GID成为团队的主人。
因此，任何用户都可以访问该文件的组所有者授予的权限的文件。此外，当setgid设置在一个目录中，新创建的文件继承同一组目录，和新创建的子目录也将继承父目录的setgid。
    # chmod g+s [filename]

为了设置 setgid 在八进制形式，预先准备好数字2 来给基本的权限
    # chmod 2755 [directory]

### 总结 ###

扎实的用户和组管理知识，符合规则的,Linux权限管理，以及部分实践，可以帮你快速解决RHEL 7 服务器的文件权限。
我向你保证，当你按照本文所概述的步骤和使用系统文档(和第一章解释的那样 [Part 1: Reviewing Essential Commands & System Documentation][5] of this series) 你将掌握基本的系统管理的能力。

请随时让我们知道你是否有任何问题或意见使用下面的表格。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-manage-users-and-groups/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/add-users-in-linux/
[2]:http://www.tecmint.com/usermod-command-examples/
[3]:http://www.tecmint.com/ls-interview-questions/
[4]:http://www.tecmint.com/file-and-directory-management-in-linux/
[5]:http://www.tecmint.com/rhcsa-exam-reviewing-essential-commands-system-documentation/
