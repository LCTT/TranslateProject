[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10631-1.html)
[#]: subject: (Linux security: Cmd provides visibility, control over user activity)
[#]: via: (https://www.networkworld.com/article/3342454/linux-security-cmd-provides-visibility-control-over-user-activity.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 安全：Cmd 提供可视化控制用户活动
======
> Cmd 可以帮助机构监控、验证和阻止那些超出系统预期使用范围的活动。

![](https://images.techhive.com/images/article/2017/01/background-1900329_1920-100705659-large.jpg)

有一个新的 Linux 安全工具你值得了解一下：Cmd（读作 “see em dee”），它极大地改变了可以对 Linux 用户进行控制的类型。它远远超出了传统的用户权限配置，并在监视和控制用户能够在 Linux 系统上运行的命令方面发挥了积极作用。

Cmd 由同名公司开发，专注于云应用。鉴于越来越多的应用迁移到依赖于 Linux 的云环境中，而可用工具的缺口使得难以充分实施所需的安全性。除此以外，Cmd 还可用于管理和保护本地系统。

### Cmd 与传统 Linux 安全控件的区别

Cmd 公司的领导 Milun Tesovic 和 Jake King 表示，除非了解了用户日常如何工作以及什么被视是“正常”，机构无法自信地预测或控制用户行为。他们寻求提供一种能够精细控制、监控和验证用户活动的工具。

Cmd 通过形成用户活动配置文件（描绘这些用户通常进行的活动）来监视用户活动，注意其在线行为的异常（登录时间、使用的命令、用户位置等），以及预防和报告某些意味着系统攻击的活动（例如，下载或修改文件和运行特权命令）。产品的行为是可配置的，可以快速进行更改。

如今大多数人用来检测威胁、识别漏洞和控制用户权限的工具，我们已经使用了很久了，但我们仍在努力抗争保持系统和数据的安全。Cmd 让我们更能够确定恶意用户的意图，无论这些用户是设法侵入帐户还是代表内部威胁。

![1 sources live sessions][1] 

*查看实时 Linux 会话*

### Cmd 如何工作？

在监视和管理用户活动时，Cmd 可以：

* 收集描述用户活动的信息
* 使用基线来确定什么是正常的
* 使用特定指标检测并主动防止威胁
* 向负责人发送警报

![2 triggers][3]

*在 Cmd 中构建自定义策略*

Cmd 扩展了系统管理员通过传统方法可以控制的内容，例如配置 `sudo` 权限，提供更精细和特定情境的控制。

管理员可以选择可以与 Linux 系统管理员所管理的用户权限控制分开管理的升级策略。

Cmd 客户端提供实时可视化（而不是事后日志分析），并且可以阻止操作、要求额外的身份验证或根据需要进行协商授权。

此外，如果有用户位置信息，Cmd 支持基于地理定位的自定义规则。并且可以在几分钟内将新策略推送到部署在主机上的客户端。

![3 command blocked][4]

*在 Cmd 中构建触发器查询*

### Cmd 的融资新闻

[Cmd][2] 最近完成了由 [GV][6] （前身为 Google Ventures）领投，Expa、Amplify Partners 和其他战略投资者跟投的 [1500 万美元的融资][5]。这使该公司的融资金额达到了 2160 万美元，这将帮助其继续为该产品增加新的防御能力并发展其工程师团队。

此外，该公司还任命 GV 的普通合伙人 Karim Faris 为董事会成员。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3342454/linux-security-cmd-provides-visibility-control-over-user-activity.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/1-sources-live-sessions-100789431-large.jpg
[2]: https://cmd.com
[3]: https://images.idgesg.net/images/article/2019/02/2-triggers-100789432-large.jpg
[4]: https://images.idgesg.net/images/article/2019/02/3-command-blocked-100789433-large.jpg
[5]: https://www.linkedin.com/pulse/changing-cybersecurity-announcing-cmds-15-million-funding-jake-king/
[6]: https://www.gv.com/
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
