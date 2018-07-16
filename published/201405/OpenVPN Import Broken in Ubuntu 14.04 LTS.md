Ubuntu 14.04 LTS中OpenVPN导入功能被破坏
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/OpenVPN-Import-Broken-in-Ubuntu-14-04-LTS-441601-2.jpg)

**几周前Canonical公司发布了 Ubuntu 14.04 LTS版本，新的操作系统做了很大的变化，但仍有些问题
需要解决，比如：openVPN 的导入功能**。

如果你曾在Ubuntu系统上使用过VPN连接，你应该知道，为了实现VPN连接不得不去官方软件包管理中心下载 network-manager-openvpn 软件包，其允许用户导入openVPN文件和所有的设置以及证书。

在ubuntu 14.04 LTS之前的版本，openVPN 导入功能能够正常使用，但是此前发布的network-manager-openvpn软件包某些文件被破坏，当导入时将导致整个网络管理功能崩溃。

在 [Launchpad][1] 上已有匿名用户上报了这个问题, 但到目前为止该问题依然没有被修复。在3月份首次提交了该bug的报告，意味着最新的发行版本忽略了该问题。

异常的问题已经被确认，但是似乎没有人去修复它，至少没有出现在Lanchpad上.

事实证明，通过众多人的留下的评论来判断bug并首次上报，很值得广泛使用, 但如果没有发布修复bug的方法，那是很烦人的。

如果有新的改变或者这个bug被修复，我们将随时告知大家

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/OpenVPN-Import-Broken-in-Ubuntu-14-04-LTS-441601.shtml

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://bugs.launchpad.net/ubuntu/+source/network-manager-openvpn/+bug/1294899