Git 发布2.2.1版，修复严重安全问题
================================================================================
![](http://www.phoronix.com/assets/categories/freesoftware.jpg)

Git 今天下午发布2.2.1版本，修复了Git客服端中一个严重的安全漏洞（原意为脆弱的）。幸运的是，这个漏洞虽然影响到了OS X 和Windows用户，却没有影响到Unix/Linux用户。

这次的Git漏洞影响那些使用Git客户端不区分大小写的文件系统。对大小写不敏感的平台，像Windows和OS X，传递.Git /config 可以覆盖用户的.Git /config，从而可能导致执行任意代码。幸运的是，大多数的Phoronix读者在Linux，感谢大小写敏感的文件系统，这就不是个问题了。

除了攻击不区分大小写的文件系统的，一些可能导致覆盖git 配置文件的字符出现了，Windows和OS X的HFS + 也会把某些字符串映射回.git文件。而Git 2.2.1版本就是解决这些问题。

更多的细节请戳[Git 2.2.1 release announcement][1] and [GitHub has additional details][2].

--------------------------------------------------------------------------------
via: http://www.phoronix.com/scan.php?page=news_item&px=MTg2ODA

作者：[Michael Larabel][a]
译者：[kingname](https://github.com/kingname)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.michaellarabel.com/
[1]:http://article.gmane.org/gmane.linux.kernel/1853266
[2]:https://github.com/blog/1938-git-client-vulnerability-announced
