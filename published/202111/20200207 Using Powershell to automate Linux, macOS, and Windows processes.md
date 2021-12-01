[#]: collector: (lujun9972)
[#]: translator: (FigaroCao)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14011-1.html)
[#]: subject: (Using Powershell to automate Linux, macOS, and Windows processes)
[#]: via: (https://opensource.com/article/20/2/devops-automation)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub)

使用 Powershell 来自动化 Linux、macOS 以及 Windows 流程
======

> 自动化是 DevOps 的关键，但是，是否任何事都可以自动化？

![](https://img.linux.net.cn/data/attachment/album/202111/23/123000eexe7iez7wsew72e.jpg)

自动化控制了那些手工的、费力的和容易出错的过程，用运行自动化脚本的计算机代替了执行手工任务的工程师。每个人都认同手工流程是健康的 DevOps 模式的敌人。一些人认为自动化不是一件好事，因为它取代了辛勤工作的工程师，而另一些人则意识到它提高了一致性、可靠性和效率，节省了时间，（最重要的是）使工程师能够聪明地工作。

> “DevOps 并不只是自动化或者基础架构即代码。” — [Donovan Brown][2]

自从上个世纪 80 年代早期开始使用自动化流程和工具链以来，每当我听到或读到“自动化一切”的建议时，我总是会激动不已。虽然在技术上可以实现一切自动化，但自动化是复杂的，并且需要付出开发、调试和维护方面的代价。如果你曾经重新启用一个许久不用的 Azure 资源管理器（ARM）模板或很久以前编写的宝贵维护脚本，并期望它在几个月或几年之后仍然能够完美地执行，那么你就会明白，自动化就像任何其他代码一样，是脆弱的，需要持续的维护和培养。

所以，你应该对什么进行自动化并在何时进行自动化？

  * 当你手动执行自动化流程超过一两次
  * 当你需要经常地持续地执行自动化流程
  * 自动化任何可被自动化的

更重要的是，什么是你不应该自动化的？

  * 不要自动化一次性的流程，因为不值得投入，除非你会重新使用它作为参考文档，并定期验证它的可用性
  * 不要自动化高度不稳定的流程，因为太复杂且昂贵
  * 不要自动化有问题的流程，在自动化前先修复它们

举例来说，我的团队使用我们通用的协作和工程系统来不断的监控数百个用户活动。如果一个用户在三个月或者更长时间处于非活动状态，并且这个用户被分配了一个昂贵的许可证，我们就会重分配这个用户一个功能少一些但是免费的许可证。

如图 1 所示，这是一个没有技术挑战性的流程。这是一个令人费解且容易出错的过程，尤其是在执行上下文时与其他开发和运维任务切换时。

![Manual process to switch user license][3]

*图 1 手工流程切换用户许可证*

顺带的，这里有一个用简单三步创建的价值流图的例子:

  1. 可视化所有活动: 列出用户、过滤用户、重置许可证。
  2. 确定利益相关者，即运营和授权团队。
  3. 措施：
    * 总交货时间（TLT）= 13 小时
    * 总周期时间（TCT） = 1.5 小时
    * 总效率百分比 = TLT/TCT*100 = 11.5%

如果你在人群流量大和容易看到的区域挂一个这些可视化的副本，比如在你的团队的讨论区、餐厅，或在去洗手间的路上，你将引发大量的讨论和主动反馈。例如，从视觉上看，很明显，手工任务是一种浪费，主要是由于漫长的流程等待时间造成的。

让我们研究一个简单的 PowerShell 脚本，它可以自动化该流程，如图 2 所示，将总交付时间从 13 小时减少到 4 小时加 60 秒，并将总体效率从 11.5 提高到 12.75%。

![Semi-automated PowerShell-based process to switch user license][4]

*图 2 半自动化的 PowerShell 脚本切换用户许可*

[PowerShell][5] 是一种开源的基于任务的脚本语言。它可以在 [GitHub][6] 上找到。它构建在 .NET 上，允许你自动化 Linux、macOS 和 Windows 流程。具有开发背景的用户，特别是 C# 用户，将享受到 PowerShell 的全部好处。

下面的 PowerShell 脚本示例通过它的服务 [REST API][8] 与 [Azure DevOps][7] 进行通信。脚本结合了在图 1 中的手动列表用户和过滤用户任务，识别了 Demo 组织中的所有两个月没有活动的、使用基本许可证或更昂贵的基本+测试许可证的用户，并将用户的详细信息输出到控制台。很简单！

首先，设置认证标头和其他变量，这些变量将在稍后的初始化脚本中使用：

```
param(
  [string]   $orgName       = "DEMO",
  [int]      $months        = "-2",
  [string]   $patToken      = "<PAT>"
)

# Basic authentication header using the personal access token (PAT)
$basicAuth = ("{0}:{1}" -f "",$patToken)
$basicAuth = [System.Text.Encoding]::UTF8.GetBytes($basicAuth)
$basicAuth = [System.Convert]::ToBase64String($basicAuth)
$headers   = @{Authorization=("Basic {0}" -f $basicAuth)}

# REST API Request to get all entitlements
$request_GetEntitlements    = "https://vsaex.dev.azure.com/" + $orgName + "/_apis/userentitlements?top=10000&api-version=5.1-preview.2";

# Initialize data variables
$members              = New-Object System.Collections.ArrayList
[int] $count          = 0;
[string] $basic       = "Basic";
[string] $basicTest   = "Basic + Test Plans";
```

接下来，使用此脚本查询所有授权，以识别不活动用户：

```
# Send the REST API request and initialize the members array list.
$response = Invoke-RestMethod -Uri $request_GetEntitlements -headers $headers -Method Get
$response.items | ForEach-Object { $members.add($_.id) | out-null }

# Iterate through all user entitlements
$response.items | ForEach-Object {
  $name    = [string]$_.user.displayName;
  $date    = [DateTime]$_.lastAccessedDate;
  $expired = Get-Date;
  $expired = $expired.AddMonths($months);
  $license = [string]$_.accessLevel.AccountLicenseType;
  $licenseName = [string]$_.accessLevel.LicenseDisplayName;
  $count++;

  if ( $expired -gt $date ) {

    # Ignore users who have NEVER or NOT YET ACTIVATED their license
    if ( $date.Year -eq 1 ) {
      Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
    }
    # Look for BASIC license
    elseif ( $licenseName -eq $basic ) {
         Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
    }
    # Look for BASIC + TEST license
    elseif ( $licenseName -eq $basicTest ) {
        Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
    }
  }
}
```

当你运行脚本时，你将得到以下输出，你可以将其转发给授权团队，以重置用户许可证：

```
**INACTIVE** Name: Demo1 Last Access: 2019/09/06 11:01:26 AM License: Basic
**INACTIVE** Name: Demo2 Last Access: 2019/06/04 08:53:15 AM License: Basic
**INACTIVE** Name: Demo3 Last Access: 2019/09/26 12:54:57 PM License: Basic
**INACTIVE** Name: Demo4 Last Access: 2019/06/07 12:03:18 PM License: Basic
**INACTIVE** Name: Demo5 Last Access: 2019/07/18 10:35:11 AM License: Basic
**INACTIVE** Name: Demo6 Last Access: 2019/10/03 09:21:20 AM License: Basic
**INACTIVE** Name: Demo7 Last Access: 2019/10/02 11:45:55 AM License: Basic
**INACTIVE** Name: Demo8 Last Access: 2019/09/20 01:36:29 PM License: Basic + Test Plans
**INACTIVE** Name: Demo9 Last Access: 2019/08/28 10:58:22 AM License: Basic
```

如果你将最后一步自动化，自动将用户许可设置为一个自由的利益相关方许可，如图3所示，你可以进一步将总体交付时间减少到65秒，并将总体效率提高到77%。

![Fully automated PowerShell-based process to switch user license][9]

*图 3 完全自动化的基于 Powershell 的流程来切换用户许可证。*

这个 PowerShell 脚本的核心价值不仅在于能够实现 _自动化_，还在于能够 _定期_、_持续_ 和 _快速地_ 执行这个流程。进一步的改进是使用 Azure 管道等调度器每周或每天触发脚本，但我将把程序化的许可证重置和脚本调度保留在未来的文章中。

这里有一个图表，可以直观地看到进展情况：

![Graph to visualize progress][10]

*图 4，措施，措施，措施*

我希望你能喜欢这个简短的关于自动化、PowerShell、REST API 和价值流图的介绍。请在评论中分享你的想法和反馈。

------

via: https://opensource.com/article/20/2/devops-automation

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[FigaroCao](https://github.com/FigaroCao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wpschaub
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: http://www.donovanbrown.com/post/what-is-devops
[3]: https://opensource.com/sites/default/files/uploads/devops_quest_to_automate_1.png (Manual process to switch user license)
[4]: https://opensource.com/sites/default/files/uploads/the_devops_quest_to_automate_everything_automatable_using_powershell_picture_2.png (Semi-automated PowerShell-based process to switch user license)
[5]: https://opensource.com/article/19/8/variables-powershell
[6]: https://github.com/powershell/powershell
[7]: https://docs.microsoft.com/en-us/azure/devops/user-guide/what-is-azure-devops?view=azure-devops
[8]: https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-5.1
[9]: https://opensource.com/sites/default/files/uploads/devops_quest_to_automate_3.png (Fully automated PowerShell-based process to switch user license)
[10]: https://opensource.com/sites/default/files/uploads/devops_quest_to_automate_4.png (Graph to visualize progress)
