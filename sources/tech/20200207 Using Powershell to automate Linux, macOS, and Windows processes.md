[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Powershell to automate Linux, macOS, and Windows processes)
[#]: via: (https://opensource.com/article/20/2/devops-automation)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub)

使用Powershell来自动化Linux, macOS以及Windows进程
======
自动化对DevOps是关键的，但是，是否任何事都可以自动化？

![CICD with gears][1]

自动化控制了那些手工的、费力的和容易出错的过程，用运行自动化脚本的计算机代替了工程师执行手工任务。每个人都认同手工流程是健康的DevOps模式的敌人。一些人认为自动化不是一件好事，因为它取代了辛勤工作的工程师，而另一些人则意识到它提高了一致性、可靠性和效率，节省了时间，(最重要的是)使工程师能够聪明地工作。

> "_DevOps并不只是自动化或者基础架构即代码_" —[Donovan Brown][2].

自从上个世纪80年代早期开始使用自动化过程和工具链以来，每当我听到或读到“自动化一切”的建议时，我总是会激动不已。虽然在技术上可以实现一切自动化，但自动化是复杂的，并且需要付出开发、调试和维护方面的代价。如果您曾经重新启动过Azure资源管理器(ARM)模板或很久以前编写的宝贵维护脚本，并期望它在几个月或几年之后能够完美地执行，那么您就会明白，自动化就像任何其他代码一样，是脆弱的，需要持续的维护和培养。

所以，你应该对什么进行自动化并在何时进行自动化?

  * 当您手动执行自动化流程超过一两次
  * 当您需要经常地持续地执行自动化流程
  * 自动化任何可被自动化的



更重要的是，什么是您不能自动化的?

  * 不要自动化一次性的流程，因为不值得投入，除非您会重新使用它作为参考文档，并且您会经常验证它的可用性
  * 不要自动化高度不稳定的流程，因为太复杂且昂贵
  * 不要自动化有问题的流程，在自动化前先修复它们



举例来说，我的团队使用我们通用的协作和工程系统来不断的监控数百的用户行为。如果一个用户处于非活动状态三个月或者以上，并且这个用户被分配了一个昂贵的许可，我们就会重分配这个用户一个功能少一些但是免费的许可

如图一所示，这是一个没有技术挑战性的流程。这是一个令人费解且容易出错的过程，尤其是在执行上下文时与其他开发和运维任务切换时。

![Manual process to switch user license][3]

图 1 手工流程切换用户许可

顺带的，这里有一个用简单三步创建的价值流图的例子:

  1. 可视化所有活动: 列出用户，过滤用户，重置许可.
  2. 确定利益相关者，即运营和许可团队.
  3. 措施:
    * 总交货时间 (TLT) = 13 hours
    * 总周期时间 (TCT) = 1.5 hours
    * 总效率百分比 = TLT/TCT*100 = 11.5%



如果你在人流量大和容易看到的区域挂一个这些可视化的副本，比如在你的团队的讨论区，餐厅，或在去洗手间的路上，你将引发大量的讨论和主动反馈。例如，从视觉上看，很明显，手工任务是一种浪费，主要是由于漫长的流程等待时间造成的。

让我们研究一个简单的PowerShell脚本，它可以自动化该过程，如图2所示，将总交付时间从13小时60秒减少到4小时60秒，并将总体效率从11.5提高到12.75%。

![Semi-automated PowerShell-based process to switch user license][4]
图 2 半自动化的PowerShell脚本切换用户许可
 

[PowerShell][5] 是一种开源的基于任务的脚本语言。它可以在GitHub[on GitHub][6]上找到。它构建在.NET上，允许你自动化Linux、macOS和Windows进程。具有开发背景的用户，特别是c#用户，将充分享受PowerShell的好处。

下面的PowerShell脚本示例通过它的服务[REST API][8]与[Azure DevOps][7]进行通信。 脚本结合了手动用户和过滤用户任务列表在图1中,识别**演示Demo**组织中的所有两个月没有活动的用户,并为他们使用**基本Basic**或稍微昂贵的**基本+测试Basic+Test**许可,用户的详细信息并将其输出到控制台。是那么简单!

首先，设置验证头和其他变量，这些变量将在稍后的初始化脚本中使用:


```
param(
  [string]   $orgName       = "DEMO",
  [int]      $months        = "-2",
  [string]   $patToken      = "&lt;PAT&gt;"
)

# Basic authentication header using the personal access token (PAT)
$basicAuth = ("{0}:{1}" -f "",$patToken)
$basicAuth = [System.Text.Encoding]::UTF8.GetBytes($basicAuth)
$basicAuth = [System.Convert]::ToBase64String($basicAuth)
$headers   = @{Authorization=("Basic {0}" -f $basicAuth)}

# REST API Request to get all entitlements
$request_GetEntitlements    = "<https://vsaex.dev.azure.com/>" + $orgName + "/_apis/userentitlements?top=10000&amp;api-version=5.1-preview.2";

# Initialize data variables
$members              = New-Object System.Collections.ArrayList
[int] $count          = 0;
[string] $basic       = "Basic";
[string] $basicTest   = "Basic + Test Plans";
```

接下来，使用此脚本查询所有授权，以识别不活动用户:


```
# Send the REST API request and initialize the members array list.
$response = Invoke-RestMethod -Uri $request_GetEntitlements -headers $headers -Method Get
$response.items | ForEach-Object { $members.add($_.id) | out-null }

# Iterate through all user entitlements
$response.items | ForEach-Object {
  $name    = [string]$_.user.displayName;
  $date    = [DateTime]$_.lastAccessedDate;
  $expired = Get-Date;
  $expired = $expired.AddMonths($months);
  $license = [string]$_.accessLevel.AccountLicenseType;
  $licenseName = [string]$_.accessLevel.LicenseDisplayName;
  $count++;

  if ( $expired -gt $date ) {

    # Ignore users who have NEVER or NOT YET ACTIVATED their license
    if ( $date.Year -eq 1 )
    {
      Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
    }
    # Look for BASIC license
    elseif ( $licenseName -eq $basic ) {
         Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
      }
    }
    # Look for BASIC + TEST license
    elseif ( $licenseName -eq $basicTest ) {
        Write-Host " **INACTIVE** " " Name: " $name " Last Access: " $date "License: " $licenseName
      }
    }
}
```

当您运行脚本时，您将得到以下输出，您可以将其转发给许可团队，以重置用户许可:


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

如果您将最后一步自动化，自动将用户许可设置为一个自由的利益相关方许可，如图3所示，您可以进一步将总体交付时间减少到65秒，并将总体效率提高到77%。

![Fully automated PowerShell-based process to switch user license][9]

图 3 完全自动化的基于powershell的过程，切换用户许可证。

这个PowerShell脚本的核心价值不仅在于能够_自动化_，还在于能够_定期_、_持续_和_快速地_执行过程。进一步的改进将使用Azure管道等调度器每周或每天触发脚本，但我将在以后的文章中保留编程许可证重置和脚本调度。

这里是将流程可视化的图：

![Graph to visualize progress][10]

图 4，措施，措施，措施

我希望您能喜欢这个简短的关于自动化，PowerShell, REST API和价值流图的介绍。请在评论中分享您的想法和反馈

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/FigaroCao)
校对：[校对者ID](https://github.com/校对者ID)

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
