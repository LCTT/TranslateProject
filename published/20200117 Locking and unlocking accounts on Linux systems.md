[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11813-1.html)
[#]: subject: (Locking and unlocking accounts on Linux systems)
[#]: via: (https://www.networkworld.com/article/3513982/locking-and-unlocking-accounts-on-linux-systems.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 系统中禁用与解禁用户的账号
======

> 总有这样的时候：有时你需要禁用某位 Linux 用户的账号，有时你还需要反过来解禁用户的账号。
本文将介绍一些管理用户访问的命令，并介绍它们背后的原理。

![](https://images.idgesg.net/images/article/2019/10/cso_cybersecurity_mysterious_padlock_complex_circuits_gold_by_sqback_gettyimages-1177918748_2400x1600-100813830-large.jpg)

假如你正管理着一台 [Linux][1] 系统，那么很有可能将遇到需要禁用一个账号的情况。可能是某人已经换了职位，他们是否还需要该账号仍是个问题；或许有理由相信再次使用该账号并没有大碍。不管上述哪种情况，知晓如何禁用账号并解禁账号都是你需要知道的知识。

需要你记住的一件重要的事是尽管有多种方法来禁用账号，但它们并不都达到相同的效果。假如用户使用公钥/私钥来使用该账号而不是使用密码来访问，那么你使用的某些命令来阻止用户获取该账号或许将不会生效。

### 使用 passwd 来禁用一个账号

最为简单的用来禁用一个账号的方法是使用 `passwd -l` 命令。例如：

```
$ sudo passwd -l tadpole
```

上面这个命令的效果是在加密后的密码文件 `/etc/shadow` 中，用户对应的那一行的最前面加上一个 `!` 符号。这样就足够阻止用户使用密码来访问账号了。

在没有使用上述命令前，加密后的密码行如下所示（请注意第一个字符）：

```
$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPCnXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7:::
```

而禁用该账号后，这一行将变为：

```
!$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPCnXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7:::
```

在 tadpole 下一次尝试登录时，他可能会使用他原有的密码来尝试多次登录，但就是无法再登录成功了。另一方面，你则可以使用下面的命令来查看他这个账号的状态（`-S` = status）：

```
$ sudo passwd -S tadpole
tadpole L 10/15/2019 0 99999 7 -1
```

第二项的 `L` 告诉你这个账号已经被禁用了。在该账号被禁用前，这一项应该是 `P`。如果显示的是 `NP` 则意味着该账号还没有设置密码。

命令 `usermod -L` 也具有相同的效果（添加 `!` 来禁用账号的使用）。

使用这种方法来禁用某个账号的一个好处是当需要解禁某个账号时非常容易。只需要使用一个文本编辑器或者使用 `passwd -u` 命令来执行相反的操作，即将添加的 `!` 移除即可。

```
$ sudo passwd -u tadpole
passwd: password expiry information changed.
```

但使用这种方式的问题是如果用户使用公钥/私钥对的方式来访问他/她的账号，这种方式将不能阻止他们使用该账号。

### 使用 chage 命令来禁用账号

另一种禁用用户账号的方法是使用 `chage` 命令，它可以帮助管理用户账号的过期日期。

```
$ sudu chage -E0 tadpole
$ sudo passwd -S tadpole
tadpole P 10/15/2019 0 99999 7 -1
```

`chage` 命令将会稍微修改 `/etc/shadow` 文件。在这个使用 `:` 来分隔的文件（下面将进行展示）中，某行的第 8 项将被设置为 `0`（先前为空），这就意味着这个账号已经过期了。`chage` 命令会追踪密码更改期间的天数，通过选项也可以提供账号过期信息。第 8 项如果是 0 则意味着这个账号在 1970 年 1 月 1 日后的一天过期，当使用上面显示的那个命令时可以用来禁用账号。

```
$ sudo grep tadpole /etc/shadow | fold
tadpole:$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPC
nXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7::0:
                                                    ^
                                                    |
                                                    +--- days until expiration
```

为了执行相反的操作，你可以简单地使用下面的命令将放置在 `/etc/shadow` 文件中的 `0` 移除掉：

```
% sudo chage -E-1 tadpole
```

一旦一个账号使用这种方式被禁用，即便是无密码的 [SSH][4] 登录也不能再访问该账号了。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3513982/locking-and-unlocking-accounts-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
