[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12039-1.html)
[#]: subject: (Coronavirus challenges remote networking)
[#]: via: (https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

新型冠状病毒对远程网络的影响
======

> 由于 COVID-19 的肆虐，IBM、谷歌、亚马逊、AT&T、思科、苹果等公司都争先恐后地为远程办公提供了技术上的支持，这为远程网络带来了不少的压力。

![](https://images.idgesg.net/images/article/2018/02/crisis_survival_strategy_disaster_preparedness_readiness_recovery_continuity_plan_thinkstock_600161484-100749343-large.jpg)

在新型冠状病毒广泛传播的大环境下，很多公司都要求员工留在家中远程办公，远程网络技术因此承受了更大的压力，一些带宽和安全方面的问题也接踵而至。

在过去的几十年当中，由于企业的蓬勃发展，远程办公的人数估计增加了 400 多万。而当前疫情流行的背景下，远程办公的需求激增，有望达到一个新的高峰。

一家<ruby>虚拟私有网络<rt>Virtual Private Network</rt></ruby>（缩写：???）提供商 [Atlas][1] 的一份研究表明，在今年 3 月 9 日到 3 月 15 日之间，美国的虚拟私有网络使用量增加了 53%，并且还会继续提高。而在意大利这个疫情爆发比美国早两周的国家，过去一周内的虚拟私有网络使用量甚至增加了 112%。Atlas 虚拟私有网络的首席执行官 Rachel Welch 在一份声明中称，美国的虚拟私有网络使用量在 3 月底预估会达到 150% 的增幅。

部分企业正在尝试通过<ruby>一日测试<rt>one-day test</rt></ruby>来评估远程办公的可行性。据《[芝加哥论坛报][2]》的报道，摩根大通、晨星以及一家数据分析方面的初创公司 Arity 已经通过让员工在家办公一天来测试整个办公系统的稳定性。

在政府方面，[美国国家海洋与大气管理局][3]和 NASA 都已经进行或计划进行网络方面的压力测试，评估是否有足够的网络容量足以让上千名工作人员远程办公，以及远程办公可能造成的影响。而放眼整个美国，供职于美国政府部门的员工数量在 [200 万][4]左右。

为了避免蜂窝数据网络发生拥堵，美国[联邦通信委员会][5]已批准 T-mobile 临时访问已分配给其它运营商的 600MHz 频段，T-mobile 表示“将使用这个频段让美国人更方便地享受远程医疗、参与远程工作和学习，同时在保持‘物理距离’的情况下保持联系”。

- [video](https://youtu.be/-1-ugVx0hVc)

但也有一些业内人士指出，在一些对蜂窝网络有较强依赖的的场景下，“最后一英里”的网络访问会变得非常拥堵。

网络情报公司 ThousandEyes 的主要产品是局域网和广域网性能分析的软件，该公司的产品经理 Alex Cruz Farmer 表示，网络瓶颈在于一些较为偏远的农村地区，因为那些地区的网络基础设施较为薄弱，主要通过微波或蜂窝网络来访问互联网。最大的挑战在于现有的解决方案所能提供的带宽远远不足。

Alex Cruz Farmer 还补充道，尽管持续时间不长，但现在的确已经出现一些由于运营商问题或网络负载增加导致的故障现象。

AT&T 表示目前已经留意到蜂窝网络使用量的变化，但网络容量并没有作出提高。

[AT&T 在一份声明中称][7]，在新冠病毒传播最严重的城市中，由于越来越多的人留在了家中远程办公，减少了通勤和人群聚集，很多特定位置和特定时段的蜂窝网络使用量峰值都明显降低了。他们还使用了一些工具对网络带宽进行了统计和监控，通过这些工具，他们可以更直观地了解网络使用情况的趋势，同时获取网络性能和网络容量方面的报告，进而管理整个通信网络。

Verison 表示，自从新型冠状病毒疫情爆发以来，尽管在家办公的用户数量大增，但使用的数据量并没有明显的上升。他们在一份声明中称：“Verison 的网络是为满足未来的需求设计建造的，面对各种需求量的增加或使用方式的改变，我们都有充分的准备。虽然这是一次前所未有的社会事件，整个局面也在不断发生改变，但随着不断了解实际需求的变化情况，我们随时可以对网络资源作出调整”。

Verison 一直在关注受影响最严重的地区的网络使用情况，并承诺将会与医院、医护人员、政府机构合作，制定网络资源使用的优先级，以满足他们的需求。Verison 还宣布计划在 2020 年将支出在 170 亿至 180 亿美元的基础上再提高 5 亿美元，以实现“加快 Verison 向 5G 过渡并在困难时期帮助支撑经济”的目标。

### 企业虚拟私有网络安全问题

对于企业来说，数据中心与远程用户之间的网络和安全问题解决起来绝非易事，尤其是使用虚拟私有网络进行远程访问时，来自用户所在住宅网络的访问几乎无法由企业控制。CIMI 公司总裁 Tom Nolle 认为，IT 部门有必要验证这些连接是否符合企业的标准（关于 Tom Nolle 更多关于在家办公的看法，可以查阅[这里][8]）。

Tom Nolle 认为像 ISP、DNS 和 Wi-Fi 这些常见的家用网络要素都应该作为适合远程办公网络业务认证的一部分。他发现 Google 的 DNS 服务比 ISP 提供的服务更能承受压力，OpenDNS 也是一个很好的选择，这说明用户可以考虑使用其中一种。

Tom Nolle 还说，家庭 Wi-Fi 网络的安全性也是一个问题，IT 部门应该要求远程办公的员工提交 Wi-Fi 配置的屏幕截图，以保证使用了正确的加密方式。之所以有这样的想法，是因为他觉得很多远程办公的员工都会绕过企业预设的一些安全措施。

DNS 软件公司 BlueCat 的首席战略官 Andrew Wertkin 表示，对一些刚刚开始在家远程办公的员工来说，适当提供相关指导是很有必要的。大部分员工从来没有尝试过在家远程办公，他们或许并不了解安全的重要性。如果员工访问公司网络的时候使用的是个人设备而不是公司设备，就更有可能出现问题。

而使用[虚拟私有网络][9]远程办公的人数激增也会为企业带来成本上的挑战。

“虚拟私有网络设备并不便宜，如果考虑到计算资源的成本和每个人的均摊成本，迁移到云上的虚拟环境会带来一笔不小的开支，这还不包括每个虚拟私有网络许可证价格的上升”，Alex Cruz Farmer 坦言。

在容量方面，随着远程访问量的增加，用于分配 IP 地址的 DHCP 服务也会承受巨大的压力。Andrew Wertkin 指出，如果进行远程连接的设备无法获取到网络地址，则是否具有足够的虚拟私有网络许可证并不重要。企业内部必须对这些风险进行测试，了解其中存在瓶颈的部分，并制定规避这些风险的策略。

按照这个思路，企业甚至需要验证数据中心可以用于公开的 SSL 套接字数量，否则也会面临数量不足的风险。

微软 Office 365 产品团队的高级程序经理 Paul Collinge 也表达了类似的担忧。他在一篇关于优化 Office 365 员工远程办公流量的[博客][10]中写道，当大量员工在同时接入企业网络时，会对诸如虚拟私有网络集中器、中央网络出口设备（例如代理、DLP）、中央互联网带宽、回程 MPLS 和 NAT 等网络要素产生巨大的压力。最终导致的结果是低下的性能、低下的生产力，以及员工们低下的使用体验。

Alex Cruz Farmer 提出，企业很可能需要增加网络上虚拟私有网络集中器的数量，这样就可以让远程用户分布在多个不同的虚拟私有网络端点上，避免产生拥堵。退而求其次，只能在防火墙上把某些端口放开，允许特定应用程序的公开访问，尽管这样有助于提高工作效率，但却降低了整体的安全性。

### 虚拟私有网络隧道分割技术有效吗？

业内人士对<ruby>隧道分割<rt>tunneling split</rt></ruby>有不同的看法。

BlueCat 的 Andrew Wertkin 认为，虚拟私有网络可以使用隧道分割技术，使得仅有需要访问企业内部网络的流量才通过虚拟私有网络隧道访问，其余流量则直接进入互联网。这意味着会有部分流量不受隧道和企业网络内部的安全控制，用户的计算机会暴露在互联网当中，进而导致企业的数据和网络面临安全风险。

尽管如此，微软在上周还是建议 IT 管理员使用隧道分割技术以缓解 Office 365 由于大量远程用户涌入导致的拥堵问题。微软在[建议][10]中提供了相关接入点的 URL 和 IP 地址列表，并引导 IT 人员如何按照这个方式将流量路由到 Office 365。

按照 Paul Collinge 的说法，虚拟私有网络客户端需要经过配置，才能将流量路由到已标识的 URL/IP/  端口上，进而为全球的用户提供高性能的服务。

Alex Cruz Farmer 认为，在虚拟私有网络使用率上升之后，企业很有必要对网络安全进行一个全面的审查。对于仍然在使用传统网络安全架构的企业来说，应该开始考虑基于云端的网络安全方案了，这不仅可以提升远程办公的性能，还能减少企业对于广域网的使用量。

其它相关情况：

* [FCC][11] 呼吁，宽带提供商应该适当放宽数据传输的限制，电话运营商应该适当免除用户的长途电话费，远程教育提供商应该合作为社会提供远程学习的机会，网络运营商应该优先考虑医院或医疗机构的网络连接需求。对此，AT&T 已经作出了相关的回应和行动。
* [美国参议员 Mark R. Warner (D-VA)][12] 和其他 17 名参议员致信了 AT&T、CenturyLink、Charter Communications、Comcast、Cox Communications、Sprint、T-Mobile、Verizon 这八家主要 ISP 的首席执行官，呼吁这些公司应该采取措施应对远程办公、在线教育、远程医疗、远程支持服务等方面需求激增带来的压力。这些参议员在信中呼吁，各公司应该降低可能对远程服务产生影响的限制和费用，同时还应该为受到疫情影响的学生提供免费或收费的宽带服务，否则学生在疫情期间无法接入网络进行在线学习。
* [思科][13]、微软、[谷歌][14]、[LogMeIn][15]、[Spectrum][16] 等供应商都提供了一些免费工具，帮助用户在疫情爆发期间正常进行安全通信。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://atlasvpn.com/blog/vpn-usage-in-italy-rockets-by-112-and-53-in-the-us-amidst-coronavirus-outbreak/
[2]: https://www.chicagotribune.com/coronavirus/ct-coronavirus-work-from-home-20200312-bscm4ifjvne7dlugjn34sksrz4-story.html
[3]: https://federalnewsnetwork.com/workforce/2020/03/agencies-ramp-up-coronavirus-preparations-as-noaa-plans-large-scale-telework-test/
[4]: https://fas.org/sgp/crs/misc/R43590.pdf
[5]: https://www.fcc.gov/coronavirus
[6]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[7]: https://about.att.com/pages/COVID-19.html
[8]: https://blog.cimicorp.com/?p=4055
[9]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[10]: https://techcommunity.microsoft.com/t5/office-365-blog/how-to-quickly-optimize-office-365-traffic-for-remote-staff-amp/ba-p/1214571
[11]: https://www.fcc.gov/document/commissioner-starks-statement-fccs-response-covid-19
[12]: https://www.warner.senate.gov/public/_cache/files/2/3/239084db-83bd-4641-bf59-371cb829937a/A99E41ACD1BA92FB37BDE54E14A97BFA.letter-to-isps-on-covid-19-final-v2.-signed.pdf
[13]: https://blogs.cisco.com/collaboration/cisco-announces-work-from-home-webex-contact-center-quick-deployment
[14]: https://cloud.google.com/blog/products/g-suite/helping-businesses-and-schools-stay-connected-in-response-to-coronavirus
[15]: https://www.gotomeeting.com/work-remote?clickid=RFlSQF3DBxyOTSr0MKVSfWfHUknShrScK0%3AhTY0&irgwc=1&cid=g2m_noam_ir_aff_cm_pl_ct
[16]: https://www.multichannel.com/news/charter-opening-wi-fi-hotspots-in-face-of-covid-19
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
