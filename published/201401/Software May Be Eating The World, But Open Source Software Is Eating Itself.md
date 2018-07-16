软件在吞噬世界，但是开源软件在吞噬自己
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/shutterstock_144092914.jpg)

**在开源世界，大家都不安分**


像[Marc Andreessen posits][1]所说，软件可能在吞噬世界，但是开源软件似乎在吞噬自己。伴随着快速的步伐，软件世界逐渐习惯产业化，他们的卖主开始为更多的利益投资（比如：在操作系统方面的微软和数据库方面的甲骨文）， 开源软件的世界正迈向一个加速进化的时代，从来不满足于既得的荣誉。

在快速变更的开源世界，企业如何投资？

### 开源超神了 ###

虽然[Dirk Riehle][2]对于开源项目增长的分析并不是特别过时，当然，一部分已经[增长的趋势][3]除外：

![](http://readwrite.com/files/total-growth-figure-5.jpg)

现在大部分重要领域的技术-大数据，云，移动-都是开源的。伴随着Haddop、OpenStack等工具的活跃，我们应该期待开源软件卯足了劲发展。

这是好是坏？

### 开源码农竞争激烈 ###

举个栗子，在系统配置领域。 Redmonk 的 Stephen O'Grady 挑了些数据用来衡量受欢迎程度，Chef、 Puppet、 Ansible 和 Salt，后面两个是这个领域的新星，但是赢得了相当的社区热情和采纳度。

这让O'Grady [推测][4]：“ 看起来合理地去认为系统配置领域会和开源关系型数据库一样有相同的变革趋势，伴随着两个突出的工程出现，这样的观点有点问题。”

O’Grady觉得：

> 从这些观察中得出的最有趣的结论或许是 Ansible 和 Salt 的关联。这些工程会有不错的前景，比如在这个领域对解决方案的需求，和非常强的个人偏好的影响，例如，Salt 在 Python 开发者当中的亲和力。

实际上，我必须承认最有趣的的结论是，没有开源项目能保证长久。Puppet 在2005年退出，并且一直在和有固定期权的在职者竞争，现在和Chef竞争（4年后退出），Ansible（最新两年）和 Salt（最新两年）。

任何重要领域的在职者，总是会穷追不舍地吹毛求疵。但是在开源世界，比赛不会等待十亿美元的市场在它产生影响的时候形成。由Chef 和 Puppet 铺垫了的 Salt 和 Ansible 在市场的上升就是一个证明。

### 社区付出了，社区也拿走了 ###

你会发现同样的动态在CMS中(Drupal 、Joomla 、 Alfresco 、 Wordpress 以及无数的其它 CMS)，在云中(Eucalyptus 、 OpenStack 、 CloudStack 、 CloudFoundry 、 OpenShift 及其它)，在[web 服务器中][5]，在关系和非关系的数据库中。

开源数据库数量的膨胀伴随着几乎每天都产生的新对手，正如[DB-Engines database tracking service][6]中可以看到的一样。或许最好玩的是开源关系数据库领域，直到最近MySQL支配这个领域。Postgers 也是和 MySQL 赛跑，虽然是老二，但是排得非常后。


现在事情都在变化，或者骚动。很大程度因为 Oracle 的所谓的对 MySQL 社区的践踏，Postggres 在最前沿的 MySQLer中炙手可热。MariaDB 也是这样。虽然还是一个小家伙，比如[RedHat Fedora和Ubuntu等Linux发行版内置数据库更换成MariaDB了][7]，Google换掉了MySQL等。

或许就像O'Grady说的，这归结为开发者的偏好。如果开发者占据主要地位，小小的可以阻碍他们向更合适自己的新项目转换的障碍，会导致秩序混乱。如果这有道理，将会很好解释开源为什么拒绝长期垄断。

很难让开发者保持乐观。

### 做一笔社区友好的生意 ###

对于想要对已有的开源项目投资的企业，这意味着什么呢？一个简单的、也许没有不令人满意的答案是企业应该投入到项目中，确定他们的可持续性，并且给予企业能力去支持他们自己。

但是大部分企业不想自己码出最好的代码。

相反，他们会去寻找受欢迎程度高的项目，非常适合企业的需求的，而且还有很强的社区的。如果项目在社区变得没什么意思的时候，欢迎程度可能会飞跃。最基础的原因，Linux已经在操作系统之巅呆了很久了，已经适应社区影响和需求。

不幸的是，没有什么方法去真正衡量一个开源社区的活力。一些成功的项目，比如OpenStack，取决于强大的基础。其他的，像Linux，取决于强大的个人和他的帮手。

但是所有成功的开源项目维持了他们强劲的热度，每几个月就会有一个发行版。快速发展的项目会非常难以供企业支持。

企业应该怎样避免开源项目荒废的风险呢?


--------------------------------------------------------------------------------

via: http://readwrite.com/2013/12/12/open-source-innovation

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://online.wsj.com/news/articles/SB10001424053111903480904576512250915629460
[2]:http://dirkriehle.com/publications/2008-2/the-total-growth-of-open-source/
[3]:http://www.techrepublic.com/blog/linux-and-open-source/driving-forces-behind-linux-and-open-source-growth/
[4]:http://redmonk.com/sogrady/2013/12/06/configuration-management-2013/
[5]:http://www.theregister.co.uk/2013/02/06/open_and_shut/
[6]:http://db-engines.com/en/ranking
[7]:http://www.zdnet.com/oracle-who-fedora-and-opensuse-will-replace-mysql-with-mariadb-7000010640/
