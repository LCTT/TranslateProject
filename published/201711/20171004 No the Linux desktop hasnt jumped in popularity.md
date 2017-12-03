不，Linux 桌面版并没有突然流行起来
============================================================

> 最近流传着这样一个传闻，Linux 桌面版已经突然流行起来了，并且使用者超过了 macOS。其实，并不是的。

有一些传闻说，Linux 桌面版的市场占有率从通常的 1.5% - 3% 翻了一番，达到 5%。那些报道是基于 [NetMarketShare][4] 的桌面操作系统分析报告而来的，据其显示，在七月份，Linux 桌面版的市场占有率从 2.5% 飙升，在九月份几乎达到 5%。但对 Linux 爱好者来说，很不幸，它并不是真的。

它也不是因为加入了谷歌推出的 Chrome OS，它在 [NetMarketShare][4] 和 [StatCounter][5] 的桌面操作系统的数据中被低估，它被认为是 Linux。但请注意，那是公正的，因为 [Chrome OS 是基于 Linux 的][6]。

真正的解释要简单的多。这似乎只是一个错误。NetMarketShare 的市场营销高管 Vince Vizzaccaro 告诉我，“Linux 份额是不正确的。我们意识到这个问题，目前正在调查此事”。

如果这听起来很奇怪，那是因为你可能认为，NetMarketShare 和 StatCounter 只是计算用户数量。但他们不是这样的。相反，他们都使用自己的秘密的方法去统计这些操作系统的数据。

NetMarketShare 的方法是对 “[从网站访问者的浏览器中收集数据][7]到我们专用的请求式 HitsLink 分析网络中和 SharePost 客户端。该网络包括超过 4 万个网站，遍布全球。我们‘计数’访问我们的网络站点的唯一访客，并且一个唯一访客每天每个网络站点只计数一次。”

然后，公司按国家对数据进行加权。“我们将我们的流量与 CIA 互联网流量按国家进行比较，并相应地对我们的数据进行加权。例如，如果我们的全球数据显示巴西占我们网络流量的 2%，而 CIA 的数据显示巴西占全球互联网流量的 4%，那么我们将统计每一个来自巴西的唯一访客两次。”

他们究竟如何 “权衡” 每天访问一个站点的数据？我们不知道。

StatCounter 也有自己的方法。它使用 “[在全球超过 200 万个站点上安装的跟踪代码][8]。这些网站涵盖了各种类型和不同的地理位置。每个月，我们都会记录在这些站点上的数十亿页的页面访问。对于每个页面访问，我们分析其使用的浏览器/操作系统/屏幕分辨率（如果页面访问来自移动设备）。 ... 我们统计了所有这些数据以获取我们的全球统计信息。

我们为互联网使用趋势提供独立的、公正的统计数据。我们不与任何其他信息源核对我们的统计数据，也 [没有使用人为加权][9]。”

他们如何汇总他们的数据？你猜猜看？其它我们也不知道。

因此，无论何时，你看到的他们这些经常被引用的操作系统或浏览器的数字，使用它们要有很大的保留余地。

对于更精确的，以美国为对象的操作系统和浏览器数量，我更喜欢使用联邦政府的 [数字分析计划（DAP）][10]。

与其它的不同， DAP 的数字来自在过去的 90 天访问过 [400 个美国政府行政机构域名][11] 的数十亿访问者。那里有 [大概 5000 个网站][12]，并且包含每个内阁部门。 DAP 从一个谷歌分析帐户中得到原始数据。 DAP [开源了它在这个网站上显示其数据的代码][13] 以及它的 [数据收集代码][14]。最重要的是，与其它的不同，你可以以 [JSON][15] 格式下载它的数据，这样你就可以自己分析原始数据了。

在 [美国分析][16] 网站上，它汇总了 DAP 的数据，你可以找到 Linux 桌面版，和往常一样，它仍以 1.5% 列在 “其它” 中。Windows 仍然是高达 45.9%，接下来是 Apple iOS，占 25.5%，Android 占 18.6%，而 macOS 占 8.5%。

对不起，伙计们，我也希望它更高，但是，这就是事实。没有人，即使是 DAP，似乎都无法很好地将基于 Linux 的 Chrome OS 数据单列出来。尽管如此，Linux 桌面版仍然是 Linux 高手、软件开发者、系统管理员和工程师的专利。Linux 爱好者们还只能对其它所有的计算机设备 —— 服务器、云、超级计算机等等的（Linux）操作系统表示自豪。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/no-the-linux-desktop-hasnt-jumped-in-popularity/

作者：[Steven J. Vaughan-Nichols][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
