[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11155-1.html)
[#]: subject: (MTTR is dead, long live CIRT)
[#]: via: (https://opensource.com/article/19/7/measure-operational-performance)
[#]: author: (Julie Gunderson https://opensource.com/users/juliegund/users/kearnsjd/users/ophir)

MTTR 已死，CIRT 长存
======

> 通过关注影响业务的事件，CIRT 是衡量运维绩效的更准确方法。

![Green graph of measurements][1]

IT 运维圈子的玩法正在发生变化，这意味着过去的规则越来越不合理。机构需要适当环境中的准确的、可理解的、且可操作的指标，以衡量运维绩效并推动关键业务转型。

越多的客户使用现代工具，他们管理的事件类型的变化越多，将所有这些不同事件粉碎到一个桶中以计算平均解决时间来表示运维绩效的意义就越少，这就是 IT 一直以来在做的事情。

### 历史与指标

历史表明，在分析信号以防止错误和误解时，背景信息是关键。例如，在 20 世纪 80 年代，瑞典建立了一个分析水听器信号的系统，以提醒他们在瑞典当地水域出现的俄罗斯潜艇。瑞典人使用了他们认为代表一类俄罗斯潜艇的声学特征 —— 但实际上是鲱鱼在遇到潜在捕食者时释放的[气泡声][2]。这种对指标的误解加剧了各国之间的紧张关系，几乎导致了战争。

![Funny fish cartoon][3]

<ruby>平均解决时间<rt>Mean Time To Resolve</rt></ruby>（MTTR）是运维经理用于获得实现目标洞察力的主要运维绩效指标。这是一项基于<ruby>系统可靠性工程<rt>systems reliability engineering</rt></ruby>的古老措施。MTTR 已被许多行业采用，包括制造、设施维护以及最近的 IT 运维，它代表了解决在特定时间段内创建的事件所需的平均时间。

MTTR 的计算方法是将所有事件（从事件创建时间到解决时间）所需的时间除以事件总数。

![MTTR formula][4]

正如它所说的，MTTR 是 **所有** 事件的平均值。MTTR 将高紧急事件和低紧急事件混为一谈。它还会重复计算每个单独的、未分组的事件，并得出有效的解决时间。它包括了在相同上下文中手动解决和自动解决的事件。它将在创建了几天（或几个月）甚至完全被忽略的事件混合在一起。最后，MTTR 包括每个小的瞬态突发事件（在 120 秒内自动关闭的事件），这些突发事件要么是非问题噪音，要么已由机器快速解决。

![Variability in incident types][5]

MTTR 将所有事件（无论何种类型）抛入一个桶中，将它们全部混合在一起，并计算整个集合中的“平均”解决时间。这种过于简单化的方法导致运维执行方式的的噪音、错误和误导性指示。

### 一种衡量绩效的新方法

<ruby>关键事件响应时间<rt>Critical Incident Response Time</rt></ruby>（CIRT）是评估运维绩效的一种更准确的新方法。PagerDuty 创立了 CIRT 的概念，但该方法可供所有人免费使用。

CIRT 通过使用以下技术剔除来自信号的噪声，其重点关注最有可能影响业务的事件：

1. 真正影响（或可能影响）业务的事件很少是低紧急事件，因此要排除所有低紧急事件。
2. 真正影响业务的事件很少（如果有的话）可以无需人为干预而通过监控工具自动解决，因此要排除未由人工解决的事件。
3. 在 120 秒内解决的短暂、爆发性和瞬态事件几乎不可能是真正影响业务的事件，因此要排除它们。
4. 长时间未被注意、提交或忽略（未确认、未解决）的事件很少会对业务造成影响；排除它们。注意：此阈值可以是特定于客户的统计推导数字（例如，高于均值的两个标准差），以避免使用任意数字。
5. 由单独警报产生的个别未分组事件并不代表较大的业务影响事件。因此，模拟具有非常保守的阈值（例如，两分钟）的事件分组以计算响应时间。

应用这些假设对响应时间有什么影响？简而言之，效果非常非常大！

通过在关键的、影响业务的事件中关注运维绩效，解决时间分布变窄并极大地向左偏移，因为现在它处理类似类型的事件而不是所有事件。

由于 MTTR 计算的响应时间长得多、人为地偏差，因此它是运维绩效较差的一个指标。另一方面，CIRT 是一项有意的措施，专注于对业务最重要的事件。

与 CIRT 一起使用的另一个关键措施是确认和解决事故的百分比。这很重要，因为它验证 CIRT（或 MTTA / MTTR）是否值得利用。例如，如果 MTTR 结果很低，比如 10 分钟，那听起来不错，但如果只有 42％ 的事件得到解决，那么 MTTR 是可疑的。

总之，CIRT 和确认、解决事件的百分比形成了一组有价值的指标，可以让你更好地了解运营的执行情况。衡量绩效是提高绩效的第一步，因此这些新措施对于实现机构的可持续、可衡量的改进周期至关重要。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/measure-operational-performance

作者：[Julie Gunderson][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/juliegund/users/kearnsjd/users/ophir
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: http://blogfishx.blogspot.com/2014/05/herring-fart-to-communicate.html
[3]: https://opensource.com/sites/default/files/uploads/fish.png (Funny fish cartoon)
[4]: https://opensource.com/sites/default/files/uploads/mttr.png (MTTR formula)
[5]: https://opensource.com/sites/default/files/uploads/incidents.png (Variability in incident types)
