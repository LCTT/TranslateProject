[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12057-1.html)
[#]: subject: (How open source software is fighting COVID-19)
[#]: via: (https://opensource.com/article/20/3/open-source-software-covid19)
[#]: author: (Jeff Stern https://opensource.com/users/jeffstern)

开源软件在应对新冠病毒中的贡献
======

> 在新冠疫情爆发之际，涌现了数以千计的开源项目，今天我们来了解其中四个。

![](https://img.linux.net.cn/data/attachment/album/202003/30/210613wchojyc5rrwh8y5k.jpg)

在当前紧张的疫情环境下，保持专注和积极性是一个很大的挑战。而研究开源社区如何应对这一次疫情爆发，对于我来说却成为了一种宣泄。

从今年一月底开始，整个开源社区已经贡献了数以千计关于冠状病毒或新冠病毒的[开源软件仓库][2]，其中涉及的内容包括但不限于数据集、模型、可视化、Web 应用、移动应用，且大多数都使用了 JavaScript 和 Python 编写。

之前我们分享过一些关于[开源硬件创客们在帮助][3]遏制冠状病毒传播方面做的贡献，现在将继续分享四个由开源社区作出的应对冠状病毒和新冠病毒的项目，这体现了开发者们和整个开源社区在当下对整个世界的影响力。

### 1. PennSignals：CHIME

![CHIME by PennSignals][4]

<ruby>新冠病毒流行病医院影响模型<rt>COVID-19 Hospital Impact Model for Epidemics</rt></ruby>（[CHIME][5]）是由宾夕法尼亚大学 Penn Medicine 机构的数据科学家们建立的开源在线应用，它可以让医院更好地了解本次新型冠状病毒对医院需求的影响。

医院的管理人员可以通过 CHIME 来大致预测未来几天和几周内将会有多少患者需要住院治疗，并推算 ICU 和呼吸机的需求量。只需要输入当前住院患者数以及一些相关的变量，就可以看到未来几天内需求的变化情况。

CHIME 主要使用 Python 开发，并通过 [Pandas][6] 这个开源库实现了大部分的数据转换和数值计算，最终得出相关的估计值。Pandas 的背后有一个强大的团队进行支持，它是在数据分析方面被广泛使用的 Python 库之一。和很多其它的开源项目一样，Pandas 团队的收入大部分来源于[用户的资金支持][7]。

### 2. Locale.ai：实时新冠病毒可视化

![Locale.ai COVID-19 visualization][8]

实时显示世界各地病例数量分布的地图可以让我们直观了解新冠病毒的规模和扩散程度。Locale.ai 就开发了这样一个开源、可交互的[新冠病毒已知病例可视化分布图][9]，这个图会根据最新的可靠数据实时进行更新。

这个项目有趣的地方在于，它的数据是是通过 GitHub 用户 ExpDev07 创建的[开源 API][10] 进行检索的，这个 API 的数据来源是[约翰·霍普金斯大学的开源数据集][11]，而约翰·霍普金斯大学这份聚合了多个来源的数据集则是 GitHub 上新冠病毒相关的最受欢迎的项目。这就是开源领域中分支带来的一大好处。

Locale.ai 的这个图表通过 [Vue.js][11] 开发。Vue.js 是一个在 Web 应用开发方面非常流行的框架，它是由[尤雨溪][12]创造并维护的。值得一提的是，尤雨溪是少数以全职参与开源项目维护的人之一。

### 3. BlankerL：DXY-COVID-19-Crawler

![BlankerL DXY-COVID-19-Crawler][13]

[DXY-COVID-19-Crawler][14] 建立于今年 1 月份，是开源社区对新冠病毒最早发起响应的项目之一。当时该病毒主要在中国范围内传播，中国医学界通过[丁香园][15]网站来进行病例的报告和跟踪。为了使这些疫情信息具有更高的可读性和易用性，GitHub 用户 BlankerL 开发了一个爬虫，系统地从丁香园网站获取数据，并通过 API 和数据仓库的方式对外公开。这些数据也被学术研究人员用于研究病毒传播趋势和制作相关的可视化图表。到目前为止，DXY-COVID-19-Crawler 这个项目已经获得了超过 1300 个星标和近 300 次的复刻。

BlankerL 使用 Python 和 [Beautiful Soup][16] 库开发了这个爬虫。Beautiful Soup 是 Python 开发者用于从页面 HTML DOM 中提取信息的库，它由 Leonard Richardson 维护，这位作者另外还全职担任软件架构师。

### 4. 东京新冠病毒工作组网站

![City of Tokyo's COVID-19 Task Force site][17]

世界各地很多城市都在网络上持续更新当地的新冠病毒信息。东京都政府则为此创建了一个[综合性的网站][18]，让东京当地居民、在东京设有办事处的公司以及到东京的游客了解最新情况，并采取相应的预防措施。

这个网站的不同之处在于它是由东京都政府[开源][19]的。这个项目受到了来自 180 多名用户的贡献，日本的[长野市、千叶市、福冈市][20]还对这个网站进行了改造。这个项目是城市公共建设更好地服务大众的有力示范。

这个开源网站也使用了很多开源技术。通过 [Tidelift][21]，我留意到项目中存在了 1365 个依赖项，而这都是由 38 个由开发者明确使用的直接依赖项所依赖的。也就是说，超过一千多个开源项目（包括 [Nuxt.js][22]、[Prettier][23]、[Babel][24]、[Ajv][25] 等等）都为东京向市民共享信息提供了帮助。

![Dependencies in Tokyo's COVID-19 Task Force site][26]

### 其它项目

除此以外，还有很多[应对新冠病毒的重要项目][27]正在公开进行当中。在这次研究中，开源社区应对流行病以及利用开源技术开展工作的方式让我深受启发。接下来的一段时间都是应对疫情的关键时期，我们也可以继续在开源社区中寻找到更大的动力。

如果你也参与到了新冠病毒相关的开源项目当中，欢迎在评论区分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-source-software-covid19

作者：[Jeff Stern][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffstern
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Medical%20costs.jpg?itok=ke57j6cs (symbols showing healthcare)
[2]: https://github.com/search?q=coronavirus+OR+covid19
[3]: https://linux.cn/article-12047-1.html
[4]: https://opensource.com/sites/default/files/uploads/chime_pennsignals.png (CHIME by PennSignals)
[5]: http://penn-chime.phl.io/
[6]: https://tidelift.com/subscription/pkg/pypi-pandas
[7]: https://pandas.pydata.org/about/sponsors.html
[8]: https://opensource.com/sites/default/files/uploads/locale-ai-visualization.png (Locale.ai COVID-19 visualization)
[9]: https://github.com/localeai/covid19-live-visualization
[10]: https://github.com/CSSEGISandData/COVID-19
[11]: https://tidelift.com/subscription/pkg/npm-vue
[12]: https://blog.tidelift.com/vuejs-evan-you-javascript-framework
[13]: https://opensource.com/sites/default/files/uploads/dxy-covid-19-crawler.png (BlankerL DXY-COVID-19-Crawler)
[14]: https://github.com/BlankerL/DXY-COVID-19-Crawler
[15]: https://dxy.cn
[16]: https://blog.tidelift.com/beautiful-soup-is-now-part-of-the-tidelift-subscription
[17]: https://opensource.com/sites/default/files/uploads/tokyo-covid19-task-force.png (City of Tokyo's COVID-19 Task Force site)
[18]: https://stopcovid19.metro.tokyo.lg.jp/en/
[19]: https://github.com/tokyo-metropolitan-gov/covid19
[20]: https://github.com/tokyo-metropolitan-gov/covid19/issues/1802
[21]: https://tidelift.com/
[22]: https://tidelift.com/subscription/pkg/npm-nuxt
[23]: https://blog.tidelift.com/prettier-is-now-part-of-the-tidelift-subscriptions
[24]: https://tidelift.com/subscription/pkg/npm-babel
[25]: https://blog.tidelift.com/ajv-is-now-part-of-the-tidelift-subscription
[26]: https://opensource.com/sites/default/files/uploads/tokyo-dependencies.png (Dependencies in Tokyo's COVID-19 Task Force site)
[27]: https://github.com/soroushchehresa/awesome-coronavirus
