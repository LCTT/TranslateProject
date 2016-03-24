WordPress 可以触发 Linux 上的 Ghost 缺陷
-----
*建议用户马上更新可用的补丁*

![WordPress validating pingback’s post URL](http://i1-news.softpedia-static.com/images/news2/WordPress-Can-Be-Used-to-Leverage-Critical-Ghost-Flaw-in-Linux-471730-2.jpg)

**这个漏洞之前由Qualys的安全研究员发现，并取了绰号叫[Ghost](1)，可以利用WordPress或其他PHP应用来攻击网站服务器。**

这个瑕疵是一个缓冲区溢出问题，可以被攻击者触发用来获取Linux主机的命令行执行权限。发生在glibc的“`__nss_hostname_digits_dots()`”函数中，它会被“gethostbyname()”函数用到。

###PHP应用可以用来利用这个瑕疵

Sucuri的Marc-Alexandre Montpas说之所以这个问题很重要是因为这些函数在大量软件和服务器系统使用。

“说这是个严重问题的一个例子是WordPress本身：它使用一个叫`wp_http_validate_url()`的函数来验证每个pingback的发送URL，它是通过PHP应用的“gethostbyname()”函数替代来执行的”，他在周三的一篇博客文章里写到。

攻击者可以用这种方式来引入一个设计用来触发服务器端漏洞的恶意URL，从而获得系统访问权限。

实际上，Trustwave的安全研究人员提供了[验证][2]代码，可以使用WordPress的pingback功能引起缓冲区溢出。

###多个Linux发行版受到影响

ghost漏洞存在于glibc 2.17以上版本中，发布于2013年5月21日。glibc当前版本是2.20，发布于2014年9月。

不过，当时并没有升级为一个安全补丁，许多发行版并没有包含进去，特别是提供长期支持（LTS）的发行版。

受影响的系统包括Debian 7（wheezy），Red Hat企业版Linux 6和7，CentOS 6和7，Ubuntu 12.04。幸运的是，Linux供应商已经开始发布可以减轻风险的升级补丁。建议用户马上下载并更新。

为了展示这个漏洞，Qualys建立了一个利用它通过Exim邮件服务器运行远程代码的试验页面。这家安全公司声称在这个漏洞丢掉半条命之前不会关闭这个页面，意思是受影响的系统的数量降到50%的水平。

Linux上存在漏洞的应用包括clockdiff，ping和arping（在某些特定情况下），procmail，pppd，和Exim邮件服务器。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/WordPress-Can-Be-Used-to-Leverage-Critical-Ghost-Flaw-in-Linux-471730.shtml

本文发布时间:30 Jan 2015, 17:36 GMT

作者：[Ionut Ilascu][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/ionut-ilascu
[1]:http://news.softpedia.com/news/Linux-Systems-Affected-by-14-year-old-Vulnerability-in-Core-Component-471428.shtml
[2]:http://blog.spiderlabs.com/2015/01/ghost-gethostbyname-heap-overflow-in-glibc-cve-2015-0235.html
