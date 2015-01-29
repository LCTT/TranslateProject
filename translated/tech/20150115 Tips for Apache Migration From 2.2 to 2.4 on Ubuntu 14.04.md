小贴士：在 Ubuntu 14.04 中Apache从2.2迁移到2.4的问题
================================================================================
如果你进行了一次**Ubuntu**从12.04到14.04的升级，那么它还包括了一个重大的升级--**Apache**从2.2版本升级到2.4版本。**Apache**的这次升级带来了许多性能提升，但是如果继续使用2.2的配置文件会导致很多错误。

### 访问控制的改变 ###

从**Apache 2.4**起，授权（authorization）开始启用，比起2.2的一个检查一个数据存储，授权更加灵活。过去很难确定授权如何并且以什么样的顺序被应用，但是授权容器指令的介绍解决了这些问题，现在，配置可以控制什么时候授权方法被调用，什么条件决定何时授权访问。

这就是为什么大多数的升级失败是由于错误配置，2.2的访问控制基于IP地址，主机名和其他字符通过使用指令Order，来设置Allow, Deny或 Satisfy，但是2.4，这些一切被新模板授权（authorization）来替代检查。

为了弄清楚这些，可以来看一些虚拟主机的例子，这些可以在/etc/apache2/sites-enabled/default 或者 /etc/apache2/sites-enabled/你的网页名称 中找到:

旧的2.2虚拟主机配置：

    Order allow,deny
    Allow from all

新的2.4虚拟主机配置：

    Require all granted

![apache 2.4 config](http://blog.linoxide.com/wp-content/uploads/2014/12/apache-2.4-config.jpg)

### .htaccess 问题 ###

升级后如果一些设置不执行或者得到重定向错误，检查是否这些设置是在.htaccess文件中。如果是，2.4已经不再使用.htaccess文件，在2.4中默认使用AllowOverride指令来设置，因此忽略了.htaccess文件。你需要做的全部就是改变或者添加AllowOverride All命令到你的网站配置文件中。

上面截图中，可以看见AllowOverride All指令。

### 丢失配置文件或者模块 ###

根据我的经验，这次升级带来的另一个问题就是在2.4中旧模块和配置文件不再需要或者不被支持了。你将会收到一条“Apache不能包含这个相应文件”的明确警告，你需要做的是在配置文件中移除这些导致问题的命令行。之后你可以搜索和安装相似的模块来替代。

### 其他需要了解的小改变 ###

这里还有一些其他改变的需要考虑，虽然这些通常只会发生警告，而不是错误。

- MaxClients重命名为MaxRequestWorkers，使之有更准确的描述。而异步MPM，如event，客户端最大连接数不量比于工作线程数。旧的名字依然支持。
- DefaultType命令无效，使用它已经没有任何效果了。需要使用其他配置设定来替代它
- EnableSendfile默认关闭
- FileETag 默认"MTime Size"（没有INode）
- KeepAlive 只接受“On”或“Off”值。之前的任何不是“Off”或者“0”的值都被认为是“On”
- Mutex 已经替代了 Directives AcceptMutex, LockFile, RewriteLock, SSLMutex, SSLStaplingMutex 和 WatchdogMutexPath 。你需要做的是估计一下这些被移动的指令在2.2中的使用情况，来决定是否删除或者使用Mutex来替代。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/apache-migration-2-2-to-2-4-ubuntu-14-04/

作者：[Adrian Dinu][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://httpd.apache.org/docs/2.4/
