[#]: subject: "Five common mistakes when using automation"
[#]: via: "https://fedoramagazine.org/five-common-mistakes-when-using-automation/"
[#]: author: "Gary Scarborough https://fedoramagazine.org/author/gscarbor/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用自动化时的五个常见错误
======

![][1]

背景图片来自 [“Modern Times”（1936）][2]，[United Artists][3]，公共领域，通过 Wikimedia Commons

随着自动化扩展到涵盖 IT 的更多方面，越来越多的管理员正在学习自动化技能并应用它们来减轻他们的工作量。自动化可以减轻重复性任务的负担，并为基础设施增加一定程度的一致性。但是，当 IT 工作人员部署自动化时，会出现可能对大大小小的基础设施造成严重破坏的常见错误。在自动化部署中通常会出现五个常见错误。

### 缺乏测试

初学者常犯的错误是自动化脚本没有经过全面测试。由于拼写错误或逻辑错误，简单的 shell 脚本可能会对服务器产生不利影响。将该错误乘以基础架构中的服务器数量，你可能会遇到一大堆问题需要清理。在大规模部署之前始终测试你的自动化脚本。

### 意外的服务器负载

经常发生的第二个错误是没有预测脚本可能对其他资源施加的系统负载。当目标是十几个服务器时，运行从仓库下载文件或安装包的脚本可能没问题。脚本通常在成百上千台服务器上运行。这种负载可以使支持服务停止或完全崩溃。不要忘记考虑端点影响或设置合理的并发率。

### 离开脚本

自动化工具的一种用途是确保符合标准设置。自动化可以轻松确保组中的每台服务器都具有完全相同的设置。如果该组中的服务器需要根据该基线进行更改，同时管理员不了解合规标准，那么可能会出现问题。安装和启用不需要和不想要的服务，从而导致可能的安全问题。

### 缺乏文档

管理员的一项固定职责应该是记录他们的工作。由于合同到期、升职或定期员工流动，公司可能会在 IT 部门频繁招聘新员工。公司内的工作组相互隔离也很常见。由于这些原因，重要的是记录哪些自动化已经到位。与用户运行脚本不同，自动化可能会在创建它的人离开组之后继续很长时间。管理员可能会发现自己在其基础设施中面临着来自自动化未经检查的奇怪行为。

### 缺乏经验

列表中的最后一个错误是管理员对他们正在自动化的系统不够了解。管理员经常被雇用到他们没有接受过足够培训且没有人可以学习的职位上工作。自 COVID 以来，当公司努力填补空缺时，这一点尤其重要。然后管理员被迫处理他们没有设置并且可能不完全理解的基础设施。这可能会导致非常低效的脚本浪费资源或配置错误的服务器。

### 结论

越来越多的管理员正在学习自动化来帮助他们完成日常任务。因此，自动化正被应用于更多的技术领域。希望此列表将有助于防止新用户犯这些错误，并敦促经验丰富的管理员重新评估他们的 IT 策略。自动化旨在减轻重复性任务的负担，而不是为最终用户带来更多工作。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/five-common-mistakes-when-using-automation/

作者：[Gary Scarborough][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gscarbor/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/05/modern-times-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Modern_Times_(film)
[3]: https://commons.wikimedia.org/wiki/File:Chaplin_-_Modern_Times.jpg
