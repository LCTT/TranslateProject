不！Linux 桌面版并没有流行起来
============================================================

一直流传着这样一个说法，Linux 桌面版已经流行起来了，并且使用者超过了 macOS，其实，它并不是这样的。

有很多“故事”说，Linux 桌面版的市场占有率比通常的 1.5% - 3% 增加了一倍，达到5%。这些报告是基于 [NetMarketShare][4] 的桌面操作系统分析，它显示，在七月份，Linux 桌面版的市场占有率从 2.5% 飙升，在九月份几乎达到 5%。但对 Linux 迷来说，很不幸，它并不是真的。

它也不是谷歌推出的 Chrome OS，它在 NetMarketShare 和 [StatCounter][5] 的桌面操作系统的数据中被低估，它被认为是 Linux，请注意，那是公平的，因为 [Chrome OS 是基于 Linux 的][6]。

真正的解释要简单的多。这似乎只是一个错误。NetMarketShare 的市场营销高管 Vince Vizzaccaro 告诉我，“Linux 份额是不正确的。我们意识到这个问题，目前正在调查此事”。

如果这听起来很奇怪，那是因为你可能认为，NetMarketShare 和 StatCounter 只是计算用户数量。他们没有。相反，他们都使用自己的秘密的方法去统计这些操作系统的数据。

NetMarketShare 的方法是对 “[从网站访问者的浏览器中收集数据][7]到我们专用的请求式 HitsLink 分析网络中和 SharePost 客户端。该网络包括超过4万个网站，遍布全球。我们“计数”到我们的网络站点的唯一并且每天只对每个网络站点进行一次唯一访问的访客。”

然后，公司按国家对数据进行加权。“ 我们将我们的流量与 CIA 的网络流量进行比较，并相应地对我们的数据进行加权。” 例如，如果我们的全球数据显示巴西占我们网络流量的 2%，而 CIA 的数据显示巴西占全球互联网流量的4%，我们将统计每一个来自巴西的唯一访问者两次。

他们究竟如何 “权衡” 每天访问一个站点的数据？我们不知道。

StatCounter 也有自己的方法。它使用 “[在全球超过 200 万个站点上安装的跟踪代码][8]。这些网站涵盖了各种活动和地理位置。每个月，我们都会在这些站点上记录数十亿页的页面查看。对于每个页面查看，我们分析使用的浏览器/操作系统/屏幕分辨率，如果页面查看来自移动设备。 ... 我们总结了所有这些数据以获取我们的全球统计信息。

我们为互联网使用趋势提供独立的、公正的统计数据。我们不与任何其他信息源核对我们的统计数据，也 [没有使用人为加权][9]。

他们如何汇总他们的数据？你猜猜看？其它我们也不知道。

因此，无论何时，从他们这些经常被引用的操作系统或浏览器的数字中，通常是“加盐”处理过的。

对于更精确的，以美国为对象的操作系统和浏览器数量，我更喜欢使用联邦政府的 [数字分析程序 (DAP)][10]。

与其它的不同， DAP 的数量来自在过去的 90 天访问过 [400 个美国政府行政机构域名][11] 的数十亿访问者。那里有 [大概 5000 个网站][12]，并且包含每个秘密部门。 DAP 从一个谷歌分析帐户中得到原始数据。 DAP 有 [开源的代码，它显示在这个网站上][13] 和它的 [数据收集代码][14]。最重要的是，与其它的不同，你可以从 [JavaScript Object Notation (JSON)][15] 上下载它的数据，这样你就可以自己分析原始数据了。

在 [分析美国][16] 网站上，它汇总了 DAP 的数据，你可以找到 Linux 桌面版，和往常一样，它挂在 “其它” 中，占 1.5%。Windows 仍然是高达 45.9%，接下来是 Apple iOS，占 25.5%，Android 占 18.6%，而 macOS 占 8.5%。

对不起，伙计们，我也我希望它更高，真的，我相信它是。没有人，甚至是 DAP，看上起做的更好，基于 Linux 的 Chrome OS 数据。直到现在，Linux 桌面版仅为 Linux 高手、软件开发者、系统管理员和工程师使用。Linux 迷们必须保留着所有计算机设备 -- 服务器、云、超级计算机等等上最高级的操作系统。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/no-the-linux-desktop-hasnt-jumped-in-popularity/

作者：[Steven J. Vaughan-Nichols ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[2]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[3]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[4]:https://www.netmarketshare.com/
[5]:https://statcounter.com/
[6]:http://www.zdnet.com/article/the-secret-origins-of-googles-chrome-os/
[7]:http://www.netmarketshare.com/faq.aspx#Methodology
[8]:http://gs.statcounter.com/faq#methodology
[9]:http://gs.statcounter.com/faq#no-weighting
[10]:https://www.digitalgov.gov/services/dap/
[11]:https://analytics.usa.gov/data/live/second-level-domains.csv
[12]:https://analytics.usa.gov/data/live/sites.csv
[13]:https://github.com/GSA/analytics.usa.gov
[14]:https://github.com/18F/analytics-reporter
[15]:http://json.org/
[16]:https://analytics.usa.gov/
[17]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[18]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[19]:http://www.zdnet.com/blog/open-source/
[20]:http://www.zdnet.com/topic/enterprise-software/
