Ubuntu 14.04 Apache2.2迁移2.4问题解决
================================================================================
如果你进行了一次**Ubuntu**从12.04到14.04的升级，那么这次升级还包括了一个重大的升级--**Apache**从2.2版本到2.4版本。**Apache**的这次升级带来了许多性能提升，但是如果继续使用2.2的配置会导致很多错误。

### 访问控制的改变 ###

从**Apache 2.4**起，授权（authorization）开始启用，比起2.2的一个检查一个数据存储，授权更加灵活。过去很难确定那些命令授权应用了，但是授权（authorization）的引入解决了这些问题，现在，配置可以控制什么时候授权方法被调用，什么条件决定何时授权访问。

这就是为什么大多数的升级失败是由于错误配置，2.2的访问控制基于IP地址，主机名和其他字符通过使用指令Order，来设置Allow, Deny或 Satisfy，但是2.4，这些一切被新模板授权（authorization）来替代检查。

为了弄清楚这些，可以来看一些虚拟主机的例子，这些可以在/etc/apache2/sites-enabled/default 或者 /etc/apache2/sites-enabled/网页名称 中找到:

老2.2虚拟主机配置：

    Order allow,deny
    Allow from all

新2.4虚拟主机配置：

    Require all granted

![apache 2.4 config](http://blog.linoxide.com/wp-content/uploads/2014/12/apache-2.4-config.jpg)

### .htaccess 问题 ###

升级后如果一些设置不执行或者得到重定向错误，检查是否这些设置是在.htaccess文件中。如果是，2.4已经不再使用.htaccess文件，在2.4中默认使用AllowOverride指令来设置，因此忽略了.htaccess文件。你需要做的就是改变和增加AllowOverride All命令到你的页面配置文件中。

上面截图中，可以看见AllowOverride All指令。

### 丢失配置文件或者模块 ###

根据我的经验，这次升级带了其他问题就是老模块和配置文件不再需要或者不被支持了。所以你必须十分清楚Apache不再支持的各种文件，并且在老配置中移除这些老模块来解决问题。之后你可以搜索和安装相似的模块来替代。

### 其他需要的知道的小改变 ###

这里还有一些其他改变的需要考虑，虽然这些通常只会发生警告，而不是错误。

- MaxClients重命名为MaxRequestWorkers，使之有更准确的描述。而异步MPM，如event，客服端最大连接数不量比与工作线程数。老名字依然支持。
- DefaultType命令无效，使用它已经没有任何效果了。需要使用其他配置设定来替代它
- EnableSendfile默认关闭
- FileETag 默认"MTime Size"（没有INode）
- KeepAlive 只接受On或Off值。之前的任何值不是Off或者0都认为是On
- Mutex 替代 Directives AcceptMutex, LockFile, RewriteLock, SSLMutex, SSLStaplingMutex, 和 WatchdogMutexPath 。需要删除或者替代所有2.2老配置的设置。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/apache-migration-2-2-to-2-4-ubuntu-14-04/

作者：[Adrian Dinu][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://httpd.apache.org/docs/2.4/
