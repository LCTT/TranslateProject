Software May Be Eating The World, But Open Source Software Is Eating Itself
================================================================================
**Nothing sits still for long in the world of open source.**

Software may be eating the world, as [Marc Andreessen posits][1], but open-source software seems to be eating itself. And at a far faster clip. While the software world has grown used to products and their vendors dominating for long stretches (think: Microsoft in operating systems and Oracle in databases), the new world of open source is moving at an accelerated, Darwinian pace, leaving no project to rest on its laurels.

In this fast-changing open source world, how should enterprises decide where to invest?

### Open Source Picks Up The Pace ###

Though [Dirk Riehle's analysis][2] of the total growth in open source projects is a few years old, if anything the trend he plots has [accelerated][3]:

![](http://readwrite.com/files/total-growth-figure-5.jpg)

Today much of the interesting code in technology’s most important markets—Big Data, cloud, mobile—is open source. With more activity focused on areas like Hadoop or OpenStack, we should expect the pace and volume of open code creation to increase.

Which may be good or bad.

### No Rest For The Open Source Developer ###

Take, for example, the configuration management market. Redmonk’s Stephen O’Grady sifts a number of data sources that measure the popularity of Chef, Puppet, Ansible and Salt, the latter two being very new to the market, yet demonstrating considerable community enthusiasm and adoption.

This prompts O’Grady to [speculate][4] that “Where it once was reasonable to conclude that the configuration management space would evolve in similar fashion to the open source relational database market—i.e. with two dominant projects—that future is now in question.”

O’Grady goes on to suggest:

> The most interesting conclusion to be taken from this brief look at a variety of community data sources, however, may well be the relevance of both Ansible and Salt. That these projects appear to have viable prospects in front of them speaks to the demand for solutions in the area, as well as the strong influence of personal preferences—e.g. the affinity for Salt amongst Python developers.

Actually, I’d argue that the most interesting conclusion is that no open-source project has guaranteed longevity. Puppet came out in 2005 and is still making headway against entrenched proprietary incumbents, yet now it has to fight off Chef (which came out four years later), Ansible (last two years) and Salt (last two years).

Yes, incumbents in any important market, proprietary or otherwise, will always have new market entrants nibbling at their heels. But in open source, the competition doesn’t wait for billion-dollar markets to form before it launches attacks. The rise of Salt and Ansible in a market already well-served by Chef and Puppet is a testament to this.

### The Community Giveth, And The Community Taketh Away ###

You will find this same dynamic in content management (Drupal vs. Joomla vs. Alfresco vs. Wordpress vs. countless other CMSes), cloud (Eucalyptus vs. OpenStack vs. CloudStack vs. CloudFoundry vs. OpenShift vs. many others), [web servers][5] and databases, both relational and NoSQL.

The ranks of open-source databases swell with new entrants almost daily, as can be seen on the [DB-Engines database tracking service][6]. Perhaps most interesting is the open-source relational database market. Up until recently, MySQL dominated that market. Postgres was a viable runner up to MySQL, but it was a very distant second.

Today things are in motion. Or commotion. Largely due to Oracle’s alleged fumbling of the MySQL community, Postgres is on a tear, booming even with the hipster crowd that welcomed MySQL. But so is MariaDB. Though still a comparative gnat, leading [Linux distributions like Red Hat’s Fedora and Ubuntu have embraced MariaDB][7], as has Google, replacing MySQL.

Perhaps, as O’Grady implies, this comes down to developer preferences. If developers rule, then little impedes them from switching to new projects that may fit their needs better, throwing a given market into disarray. If this is correct, it would explain why open source resists long term monopolies:

It’s hard to keep developers happy.

### Building A Community-Friendly Business ###

What does this mean for enterprises that are looking to make long-term investments on a given open-source project? An easy, if unsatisfying, answer is that enterprises should contribute to the projects they care about, ensuring their sustainability as well as giving the enterprise the ability to support themselves should the project dwindle.

But most enterprises don’t want to have to code the winner themselves.

Instead they should look for popular projects that are good technical fits for their enterprise requirements and that have strong communities. Popularity can be fleeting if a project grows callous to its community. One of the primary reasons Linux has endured so long at the top of the operating system heap is that it has been so accommodating to community influence and requirements.

Unfortunately, there’s no One True Way to measure vitality in an open source community. Some successful projects, like OpenStack, lean on a strong foundation. Others, like Linux, depend upon a strong individual and her lieutenants.

But all successful open-source projects that maintain their lead innovate quickly, with regular releases every few months. While a fast-moving project may be more difficult for enterprises to support, it may also be a key indication that the project will remain relevant.

How else should enterprises hedge against the risk of obsolescence of an open-source project?

Lede image courtesy of [Shutterstock][8].

--------------------------------------------------------------------------------

via: http://readwrite.com/2013/12/12/open-source-innovation

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://online.wsj.com/news/articles/SB10001424053111903480904576512250915629460
[2]:http://dirkriehle.com/publications/2008-2/the-total-growth-of-open-source/
[3]:http://www.techrepublic.com/blog/linux-and-open-source/driving-forces-behind-linux-and-open-source-growth/
[4]:http://redmonk.com/sogrady/2013/12/06/configuration-management-2013/
[5]:http://www.theregister.co.uk/2013/02/06/open_and_shut/
[6]:http://db-engines.com/en/ranking
[7]:http://www.zdnet.com/oracle-who-fedora-and-opensuse-will-replace-mysql-with-mariadb-7000010640/
[8]:http://www.shutterstock.com/