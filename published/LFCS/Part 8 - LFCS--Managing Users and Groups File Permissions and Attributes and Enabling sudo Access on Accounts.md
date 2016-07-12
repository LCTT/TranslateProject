LFCS 系列第八讲：管理用户和用户组、文件权限和属性以及启用账户 sudo 访问权限
================================================================================

去年八月份，Linux 基金会发起了全新的 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，旨在让世界各地的人能够参与到中等水平的 Linux 系统的基本管理操作的认证考试中去，这项认证包括：维护正在运行的系统和服务的能力、全面监控和分析的能力以及何时向上游团队请求支持的决策能力。

![Linux Users and Groups Management](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-8.png)

*第八讲： Linux 基金会认证系统管理员*

请看以下视频，里边将描述 LFCS 认证程序。

注：youtube视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程的第八讲，在这一讲中，我们将引导你学习如何在 Linux 管理用户和用户组权限的设置，这些内容是 LFCS 认证的必备知识。

由于 Linux 是一个多用户的操作系统（允许多个用户通过不同主机或者终端访问一个独立系统），因此你需要知道如何才能有效地管理用户：如何添加、编辑、禁用和删除用户账户，并赋予他们足以完成自身任务的必要权限。

（LCTT 译注：本篇原文章节顺序有误，根据理解做了调整。）

### 添加用户账户 ###

添加新用户账户，你需要以 root 运行以下两条命令中的任意一条：

    # adduser [new_account]
    # useradd [new_account]

当新用户账户添加到系统时，会自动执行以下操作：

1. 自动创建用户家目录（默认是 /home/username）。
2. 自动拷贝下列隐藏文件到新建用户的家目录，用来设置新用户会话的环境变量。

       	.bash_logout
    	.bash_profile
    	.bashrc

3. 自动创建邮件缓存目录 /var/spool/mail/username。
4. 自动创建于用户名相同的用户组。

####理解 /etc/passwd 中的内容####

/etc/passwd 文件中存储了所有用户账户的信息，每个用户在里边都有一条对应的记录，其格式（每个字段用冒号隔开）如下：

    [username]:[x]:[UID]:[GID]:[Comment]:[Home directory]:[Default shell]

- 字段 [username] 和 [Comment] 是不言自明的。
- 第二个字段中 x 表明通过用户名 username 登录系统是有密码保护的， 密码保存在 /etc/shadow 文件中。
- [UID] 和 [GID] 字段用整数表示，代表该用户的用户标识符和对应所在组的组标志符。
- 字段 [Home directory] 为 username 用户家目录的绝对路径。
- 字段 [Default shell] 指定用户登录系统时默认使用的 shell。

####理解 /etc/group 中的内容####

/etc/group 文件存储所有用户组的信息。每行记录的格式如下：

    [Group name]:[Group password]:[GID]:[Group members]

- [Group name] 为用户组名称。
- 字段 [Group password] 为 x 的话，则说明不使用用户组密码。
- [GID] 与 /etc/passwd 中保存的 GID 相同。
- [Group members] 用户组中的用户使用逗号隔开。

![Add User Accounts in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-user-accounts.png)

*添加用户账户*

#### 修改用户信息 ####

添加用户账户之后，你可以使用 usermod 命令来修改用户信息中的部分字段，该命令基本语法如下：

    # usermod [options] [username]

**设置账户的过期时间**

通过 –expiredate 标记后边接 年-月-日 格式的日期，如下：

    # usermod --expiredate 2014-10-30 tecmint

**将用户添加到其他组**

使用 -aG 或者 –append –groups 选项，后边跟着用户组，如果有多个用户组，每个用户组之间使用逗号隔开。

    # usermod --append --groups root,users tecmint

**改变用户家目录的默认位置**

使用 -d 或者 –home 选项，后边跟着新的家目录的绝对路径。

    # usermod --home /tmp tecmint

**改变用户的默认 shell**

使用 –shell 选项，后边跟着新 shell 的路径。

    # usermod --shell /bin/sh tecmint

下面，我们一次运行上述命令：

    # usermod --expiredate 2014-10-30 --append --groups root,users --home /tmp --shell /bin/sh tecmint

![usermod Command Examples](http://www.tecmint.com/wp-content/uploads/2014/10/usermod-command-examples.png)

*usermod 命令例示*

扩展阅读

- [15 useradd Command Examples in Linux][1]
- [15 usermod Command Examples in Linux][2]

####锁定和解锁账户####

对于已有用户账户，我们还可以：

**通过锁定密码来禁用账户**

使用 -L （大写 l）或者 –lock 选项来锁定用户密码。

    # usermod --lock tecmint

**解锁用户密码**

使用 –u 或者 –unlock 选项来解锁我们之前锁定的账户。

    # usermod --unlock tecmint

![Lock User in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/lock-user-in-linux.png)

*锁定用户账户*

####删除用户账户####

你可以通过 userdel --remove 命令来删除用户账户。这样会删除用户拥有的家目录和家目录下的所有文件，以及邮件缓存目录。

    # userdel --remove [username]

#### 用户组管理 ####

每次添加新用户，系统会为该用户创建同名的用户组，此时用户组里边只有新建的用户，其他用户可以随后添加进去。建立用户组的目的之一，就是为了通过对指定资源设置权限来完成对这些资源和文件进行访问控制。

比如，你有下列用户：

- user1 (主组 user1)
- user2 (主组 user2)
- user3 (主组 user3)

他们都需要对你系统里边某个位置的 common.txt 文件，或者 user1 用户刚刚创建的共享进行读写。你可能会运行下列命令：

    # chmod 660 common.txt
    或
    # chmod u=rw,g=rw,o= common.txt [注意最后那个 = 号和文件名之间的空格]

然而，这样仅仅给文件所属的用户和用户组（本例为 user1）成员的提供了读写权限。你还需要将 user2 和 user3 添加到 user1 组，打这样做也将 user1 用户和用户组的其他文件的权限开放给了 user2 和 user3。

这时候，用户组就派上用场了，下面将演示怎么做。

**显示用户所属的用户组**

    # groups tecmint
    # id tecmint

**为需要对指定文件进行读写的多个用户建立用户组**

运行下列几条命令来完成：

    # groupadd common_group # 添加新用户组
    # chown :common_group common.txt # 将 common.txt 的用户组修改为 common_group
    # usermod -aG common_group user1 # 添加用户 user1 到 common_group 用户组
    # usermod -aG common_group user2 # 添加用户 user2 到 common_group 用户组
    # usermod -aG common_group user3 # 添加用户 user3 到 common_group 用户组

####删除用户组####

通过以下命令删除用户组：

    # groupdel [group_name]

属于这个 group_name 用户组的文件是不会被删除的，而仅仅是删除了用户组。

### Linux 文件权限 ###

除了我们在 [LFCS 系列第三讲：归档/压缩文件及目录、设置文件属性和搜索文件][3] 中说到的基本的读取、写入和执行权限外，文件还有一些不常用却很重要的的权限设置，有时候把它当做“特殊权限”。

就像之前我们讨论的基本权限，这里同样使用八进制数字或者一个字母（象征性符号）表示该权限类型。

**理解 Setuid 位**

当为可执行文件设置 setuid 位之后，用户运行程序时会继承该程序属主的有效特权。由于这样做会引起安全风险，因此设置 setuid 权限的文件及程序必须尽量少。你会发现，当系统中有用户需要访问属于 root 用户的文件是所运行的程序就带有了 setuid 权限。

也就是说，用户不仅仅可以运行这个可执行文件，而且能以 root 权限来运行。比如，让我们来看看 /bin/passwd 的权限，这个可执行文件用于改变账户的密码，修改 /etc/shadow 文件。超级用户可以改变任意账户的密码，但是其他用户只能改变自己账户的密码。

![passwd Command Examples](http://www.tecmint.com/wp-content/uploads/2014/10/passwd-command.png)

*passwd 命令例示*

因此，所有用户都有权限运行 /bin/passwd，但只有 root 用户可以指定改变指定用户账户的密码。其他用户只能改变其自身的密码。

![Change User Password in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/change-user-password.png)

*修改用户密码*

	# chmod o+u [filename]

以八进制形式来设置 setuid 位，在当前基本权限（或者想要设置的权限）前加上数字 4 就行了。

	# chmod 4755 [filename]

**理解 Setgid 位**

设置 setgid 位之后，真实用户的有效 GID 变为属组的 GID。因此，任何用户都能以属组用户的权限来访问文件。另外，当目录置了 setgid 位之后，新建的文件将继承其所属目录的 GID，并且新建的子目录会继承父目录的 setgid 位。通过这个方法，你能够以一个指定的用户组身份来访问该目录里边的文件，而不必管文件属主的主属组。

    # chmod g+s [filename]

以八进制形式来设置 setgid 位，在当前基本权限（或者想要设置的权限）前加上数字 2 就行了。

    # chmod 2755 [filename]

**给目录设置 Setgid 位**

![Add Setgid in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-setgid-to-directory.png)

*给命令设置 setgid 位*

**理解黏连（Sticky）位**

文件设置了黏连（Sticky）位是没有意义，Linux 会忽略该位。如果设置到目录上，会防止其内的文件被删除或改名，除非你是该目录或文件的属主、或者是 root 用户。

	# chmod o+t [directory]

以八进制形式来设置 sticky 位，在当前基本权限（或者想要设置的权限）前加上数字 1 就行了。

	# chmod 1755 [directory]

若没有黏连位，任何有权限读写目录的用户都可删除和重命名其中的文件。因此，黏连位通常出现在像 /tmp 之类的目录，这些目录是所有人都具有写权限的。

![Add Stickybit in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-sticky-bit-to-directory.png)

*给目录设置黏连位*

### Linux 特殊文件属性 ###

文件还有其他一些属性，用来做进一步的操作限制。比如，阻止对文件的重命名、移动、删除甚至是修改。可以通过使用 [chattr 命令][4] 来设置，并可以使用 lsattr 工具来查看这些属性。设置如下：

    # chattr +i file1
    # chattr +a file2

运行这些命令之后，file1 成为不可变状态（即不可移动、重命名、修改或删除），而 file2 进入“仅追加”模式（仅在追加内容模式中打开）。

![Protect File from Deletion](http://www.tecmint.com/wp-content/uploads/2014/10/chattr-command.png)

*通过 Chattr 命令来包含文件*

### 访问 root 账户并启用 sudo ###

访问 root 账户的方法之一，就是通过输入：

    $ su

然后输入 root 账户密码。

倘若授权成功，你将以 root 身份登录，工作目录则是登录前所在的位置。如果是想要一登录就自动进入 root 用户的家目录，请运行：

    $ su -

然后输入 root 账户密码。

![switch user by su ](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Sudo-Access.png)

*用户通过 su 切换*

执行上个步骤需要普通用户知道 root 账户的密码，这样会引起非常严重的安全问题。于是，系统管理员通常会配置 sudo 命令来让普通用户在严格控制的环境中以其他用户身份（通常是 root）来执行命令。所以，可以在严格控制用户的情况下，又允许他运行一条或多条特权命令。

- 扩展阅读：[Difference Between su and sudo User][5]

普通用户通过他自己的用户密码来完成 sudo 授权。输入命令之后会出现输入密码（并不是超级用户密码）的提示，授权成功（只要赋予了用户运行该命令的权限）的话，指定的命令就会运行。

系统管理员必须编辑 /etc/sudoers 文件，才能为 sudo 赋予相应权限。通常建议使用 visudo 命令来编辑这个文件，而不是使用文本编辑器来打开它。

    # visudo

这样会使用 vim（你可以按照 [LFCS 系列第二讲：如何安装和使用纯文本编辑器 vi/vim][6] 里边说的来编辑文件）来打开 /etc/sudoers 文件。

以下是需要设置的相关的行：

    Defaults    secure_path="/usr/sbin:/usr/bin:/sbin"
    root        ALL=(ALL) ALL
    tecmint     ALL=/bin/yum update
    gacanepa    ALL=NOPASSWD:/bin/updatedb
    %admin      ALL=(ALL) ALL

来更加深入了解这些项：

    Defaults    secure_path="/usr/sbin:/usr/bin:/sbin:/usr/local/bin"

这一行指定 sudo 将要使用的目录，这样可以阻止使用某些用户指定的目录，那样的话可能会危及系统。

下一行是用来指定权限的：

    root        ALL=(ALL) ALL

- 第一个 ALL 关键词表明这条规则适用于所有主机。
- 第二个 ALL 关键词表明第一个字段中所指定的用户能以任何用户身份的权限来运行相应命令。
- 第三个 ALL 关键词表明可以运行任何命令。

    tecmint     ALL=/bin/yum update

如果 = 号后边没有指定用户，sudo 则默认为 root 用户。本例中，tecmint 用户能以 root 身份运行 yum update 命令。

    gacanepa    ALL=NOPASSWD:/bin/updatedb

NOPASSWD 关键词表明 gacanepa 用户不需要密码，可以直接运行 /bin/updatedb 命令。

    %admin      ALL=(ALL) ALL

% 符号表示该行应用于 admin 用户组。其他部分的含义与对于用户的含义是一样的。本例表示 admin 用户组的成员可以通过任何主机连接来运行任何命令。

通过 sudo -l 命令可以查看，你的账户拥有什么样的权限。

![Sudo Access Rules](http://www.tecmint.com/wp-content/uploads/2014/10/sudo-access-rules.png)

*Sudo 访问规则*

### 总结 ###

对于系统管理员来说，高效能的用户和文件管理技能是非常必要的。本文已经涵盖了这些内容，我们希望你将这些作为一个开始，然后慢慢进步。随时在下边发表评论或提问，我们会尽快回应的。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-users-and-groups-in-linux/

作者：[Gabriel Cánepa][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/add-users-in-linux/
[2]:http://www.tecmint.com/usermod-command-examples/
[3]:https://linux.cn/article-7171-1.html
[4]:http://www.tecmint.com/chattr-command-examples/
[5]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[6]:https://linux.cn/article-7165-1.html
