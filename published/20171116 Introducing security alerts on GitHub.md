介绍 GitHub 上的安全警报
====================================

上个月，我们用依赖关系图让你更容易跟踪你代码依赖的的项目，它目前支持 Javascript 和 Ruby。如今，超过 75％ 的 GitHub 项目有依赖，我们正在帮助你做更多的事情，而不只是关注那些重要的项目。在启用依赖关系图后，当我们检测到你的依赖中有漏洞时会通知你，并给出来自 Github 社区中的已知修复。

 [![Security Alerts & Suggested Fix](https://user-images.githubusercontent.com/594029/32851987-76c36e4a-c9eb-11e7-98fc-feb39fddaadb.gif)][1] 

### 如何开始使用安全警报

无论你的项目时私有还是公有的，安全警报都会为团队中的正确人员提供重要的漏洞信息。

**启用你的依赖图：**

公开仓库将自动启用依赖关系图和安全警报。对于私人仓库，你需要在仓库设置中添加安全警报，或者在 “Insights” 选项卡中允许访问仓库的 “依赖关系图” 部分。

**设置通知选项：**

启用依赖关系图后，管理员将默认收到安全警报。管理员还可以在依赖关系图设置中将团队或个人添加为安全警报的收件人。

**警报响应：**

当我们通知你潜在的漏洞时，我们将突出显示我们建议更新的任何依赖关系。如果存在已知的安全版本，我们将通过机器学习和公开数据选择一个，并将其包含在我们的建议中。

### 漏洞覆盖率

有 [CVE ID][2]（[国家漏洞数据库][3]公开披露的漏洞）的漏洞将包含在安全警报中。但是，并非所有漏洞都有 CVE ID，甚至许多公开披露的漏洞也没有。随着安全数据的增长，我们将继续更好地识别漏洞。如需更多帮助来管理安全问题，请查看我们的 [GitHub Marketplace 中的安全合作伙伴][4]。

这是使用世界上最大的开源数据集的下一步，可以帮助你保持代码安全并做到最好。依赖关系图和安全警报目前支持 JavaScript 和 Ruby，并将在 2018 年提供 Python 支持。

- [了解更多关于安全警报][5]

--------------------------------------------------------------------------------

via: https://github.com/blog/2470-introducing-security-alerts-on-github

作者：[mijuhan][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/mijuhan
[1]:https://user-images.githubusercontent.com/594029/32851987-76c36e4a-c9eb-11e7-98fc-feb39fddaadb.gif
[2]:https://cve.mitre.org/
[3]:https://nvd.nist.gov/
[4]:https://github.com/marketplace/category/security
[5]:https://help.github.com/articles/about-security-alerts-for-vulnerable-dependencies/
