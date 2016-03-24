在 Ubuntu 14.04 中Apache从2.2迁移到2.4的问题
================================================================================
如果你将**Ubuntu**从12.04升级跨越到了14.04，那么这其中包括了一个重大的升级--**Apache**从2.2版本升级到2.4版本。**Apache**的这次升级带来了许多性能提升，**但是如果继续使用2.2的配置文件会导致很多错误**。

### 访问控制的改变 ###

从**Apache 2.4**起，所启用的授权机制比起2.2的只是针对单一数据存储的单一检查更加灵活。过去很难确定哪个 order 授权怎样被使用的，但是授权容器指令的引入解决了这些问题，现在，配置可以控制什么时候授权方法被调用，什么条件决定何时授权访问。

这就是为什么大多数的升级失败是由于配置错误的原因。2.2的访问控制是基于IP地址、主机名和其他角色，通过使用指令Order，来设置Allow, Deny或 Satisfy；但是2.4，这些一切都通过新的授权方式进行检查。

为了弄清楚这些，可以来看一些虚拟主机的例子，这些可以在/etc/apache2/sites-enabled/default 或者 /etc/apache2/sites-enabled/*你的网站名称* 中找到:

旧的2.2虚拟主机配置：

    Order allow,deny
    Allow from all

新的2.4虚拟主机配置：

    Require all granted

![apache 2.4 config](http://blog.linoxide.com/wp-content/uploads/2014/12/apache-2.4-config.jpg)

（LCTT 译注：Order、Allow和deny 这些将在之后的版本废弃，请尽量避免使用，Require 指令已可以提供比其更强大和灵活的功能。）

### .htaccess 问题 ###

升级后如果一些设置不工作，或者你得到重定向错误，请检查是否这些设置是放在.htaccess文件中。如果Apache 2.4没有使用 .htaccess 文件中的设置，那是因为在2.4中AllowOverride指令的默认是 none，因此忽略了.htaccess文件。你只需要做的就是修改或者添加AllowOverride All命令到你的网站配置文件中。

上面截图中，可以看见AllowOverride All指令。

### 丢失配置文件或者模块 ###

根据我的经验，这次升级带来的另一个问题就是在2.4中，一些旧模块和配置文件不再需要或者不被支持了。你将会收到一条“Apache不能包含相应的文件”的明确警告，你需要做的是在配置文件中移除这些导致问题的配置行。之后你可以搜索和安装相似的模块来替代。

### 其他需要了解的小改变 ###

这里还有一些其他的改变需要考虑，虽然这些通常只会发生警告，而不是错误。

- MaxClients重命名为MaxRequestWorkers，使之有更准确的描述。而异步MPM，如event，客户端最大连接数不等于工作线程数。旧的配置名依然支持。
- DefaultType命令无效，使用它已经没有任何效果了。如果使用除了 none 之外的其它配置值，你会得到一个警告。需要使用其他配置设定来替代它。
- EnableSendfile默认关闭
- FileETag 现在默认为"MTime Size"（没有INode）
- KeepAlive 只接受“On”或“Off”值。之前的任何不是“Off”或者“0”的值都被认为是“On”
- 单一的 Mutex 已经替代了 Directives AcceptMutex, LockFile, RewriteLock, SSLMutex, SSLStaplingMutex 和 WatchdogMutexPath 等指令。你需要做的是估计一下这些被替代的指令在2.2中的使用情况，来决定是否删除或者使用Mutex来替代。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/apache-migration-2-2-to-2-4-ubuntu-14-04/

作者：[Adrian Dinu][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://httpd.apache.org/docs/2.4/
