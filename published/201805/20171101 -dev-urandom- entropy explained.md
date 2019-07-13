/dev/[u]random：对熵的解释
======

### 熵

当谈到 `/dev/random` 和 `/dev/urandom` 的主题时，你总是会听到这个词：“<ruby>熵<rt>Entropy</rt></ruby>”。每个人对此似乎都有自己的比喻。那为我呢？我喜欢将熵视为“随机果汁”。它是果汁，随机数需要它变得更随机。

如果你曾经生成过 SSL 证书或 GPG 密钥，那么可能已经看到过像下面这样的内容：

```
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
++++++++++..+++++.+++++++++++++++.++++++++++...+++++++++++++++...++++++
+++++++++++++++++++++++++++++.+++++..+++++.+++++.+++++++++++++++++++++++++>.
++++++++++>+++++...........................................................+++++
Not enough random bytes available. Please do some other work to give
the OS a chance to collect more entropy! (Need 290 more bytes)
```

通过在键盘上打字并移动鼠标，你可以帮助生成熵或随机果汁。

你可能会问自己……为什么我需要熵？以及为什么它对于随机数真的变得随机如此重要？那么，假设我们的熵的来源仅限于键盘、鼠标和磁盘 IO 的数据。但是我们的系统是一个服务器，所以我知道没有鼠标和键盘输入。这意味着唯一的因素是你的 IO。如果它是一个单独的、几乎不使用的磁盘，你将拥有较低的熵。这意味着你的系统随机的能力很弱。换句话说，我可以玩概率游戏，并大幅减少破解 ssh 密钥或者解密你认为是加密会话的时间。

好的，但这是很难实现的对吧？不，实际上并非如此。看看这个 [Debian OpenSSH 漏洞][1]。这个特定的问题是由于某人删除了一些负责添加熵的代码引起的。有传言说，他们因为它导致 valgrind 发出警告而删除了它。然而，在这样做的时候，随机数现在少了很多随机性。事实上，熵少了很多，因此暴力破解变成了一个可行的攻击向量。

希望到现在为止，我们理解了熵对安全性的重要性。无论你是否意识到你正在使用它。

### /dev/random 和 /dev/urandom

`/dev/urandom` 是一个伪随机数生成器，缺乏熵它也**不会**停止。

`/dev/random` 是一个真随机数生成器，它会在缺乏熵的时候停止。

大多数情况下，如果我们正在处理实际的事情，并且它不包含你的核心信息，那么 `/dev/urandom` 是正确的选择。否则，如果就使用 `/dev/random`，那么当系统的熵耗尽时，你的程序就会变得有趣。无论它直接失败，或只是挂起——直到它获得足够的熵，这取决于你编写的程序。

### 检查熵

那么，你有多少熵？

```
[root@testbox test]# cat /proc/sys/kernel/random/poolsize
4096
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
2975
```

`/proc/sys/kernel/random/poolsize`，说明熵池的大小（以位为单位）。例如：在停止抽水之前我们应该储存多少随机果汁。`/proc/sys/kernel/random/entropy_avail` 是当前池中随机果汁的数量（以位为单位）。

### 我们如何影响这个数字？

这个数字可以像我们使用它一样耗尽。我可以想出的最简单的例子是将 `/dev/random` 定向到 `/dev/null` 中：

```
[root@testbox test]# cat /dev/random > /dev/null &
[1] 19058
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
0
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
1
```

影响这个最简单的方法是运行 [Haveged][2]。Haveged 是一个守护进程，它使用处理器的“抖动”将熵添加到系统熵池中。安装和基本设置非常简单。

```
[root@b08s02ur ~]# systemctl enable haveged
Created symlink from /etc/systemd/system/multi-user.target.wants/haveged.service to /usr/lib/systemd/system/haveged.service.
[root@b08s02ur ~]# systemctl start haveged
```

在流量相对中等的机器上：

```
[root@testbox ~]# pv /dev/random > /dev/null 
  40 B 0:00:15 [   0 B/s] [                    <=>                                                                                                                                                      ]
  52 B 0:00:23 [   0 B/s] [                           <=>                                                                                                                                               ]
  58 B 0:00:25 [5.92 B/s] [                              <=>                                                                                                                                            ]
  64 B 0:00:30 [6.03 B/s] [                                  <=>                                                                                                                                        ]
^C
[root@testbox ~]# systemctl start haveged
[root@testbox ~]# pv /dev/random > /dev/null 
7.12MiB 0:00:05 [1.43MiB/s] [                <=>                                                                                                                                                        ]
15.7MiB 0:00:11 [1.44MiB/s] [                                    <=>                                                                                                                                    ]
27.2MiB 0:00:19 [1.46MiB/s] [                                                               <=>                                                                                                         ]
  43MiB 0:00:30 [1.47MiB/s] [                                                                                                    <=>                                                                    ]
^C
```

使用 `pv` 我们可以看到我们通过管道传递了多少数据。正如你所看到的，在运行 `haveged` 之前，我们是 2.1 位/秒（B/s）。而在开始运行 `haveged` 之后，加入处理器的抖动到我们的熵池中，我们得到大约 1.5MiB/秒。

--------------------------------------------------------------------------------

via: http://jhurani.com/linux/2017/11/01/entropy-explained.html

作者：[James J][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jblevins.org/log/ssh-vulnkey
[1]:http://jhurani.com/linux/2017/11/01/%22https://jblevins.org/log/ssh-vulnkey%22
[2]:http://www.issihosts.com/haveged/
