[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Powershell to automate Linux, macOS, and Windows processes)
[#]: via: (https://opensource.com/article/20/2/devops-automation)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub)

Using Powershell to automate Linux, macOS, and Windows processes
======
Automation is pivotal to DevOps, but is everything automatable?
![CICD with gears][1]

Automation takes control of manual, laborious, and error-prone processes and replaces engineers performing manual tasks with computers running automation scripts. Everyone agrees that manual processes are a foe of a healthy DevOps mindset. Some argue that automation is not a good thing because it replaces hard-working engineers, while others realize that it boosts consistency, reliability, and efficiency, saves time, and (most importantly) enables engineers to work smart.

> "_DevOps is not just automation or infrastructure as code_" —[Donovan Brown][2].

Having used automated processes and toolchains since the early '80s, I always twitch when I hear or read the recommendation to "automate everything." While it is technically possible to automate everything, automation is complex and comes at a price in terms of development, debugging, and maintenance. If you have ever dusted off an inviable Azure Resource Manager (ARM) template or a precious maintenance script you wrote a long time ago, expecting it to execute flawlessly months or years later, you will understand that automation, like any other code, is brittle and needs continuous maintenance and nurture.

So, what and when should you automate?

  * Automate processes you perform manually more than once or twice.
  * Automate processes you will perform regularly and continuously.
  * Automate everything automatable.



More importantly, what should you _not_ automate?

  * Don't automate processes that are a one-off—it is not worth the investment unless you reuse it as reference documentation and regularly validate to ensure it remains functional.
  * Don't automate highly volatile processes—it is too complex and expensive.
  * Don't automate broken processes—fix them before automating.



For example, my team continuously inspects hundreds of user activities on our common collaboration and engineering system, looking for inactivity that is wasting precious dollars. If a user has been inactive for three or more months and has been assigned an expensive license, we revert the user to a less functional and free license.

As Fig. 1 shows, it is not a technically challenging process. It is a mind-numbing and error-prone process, especially when it's performed while context switching with other development and operational tasks.

![Manual process to switch user license][3]

Fig. 1 Manual process to switch user license

Incidentally, this is an example of a value stream map created in three easy steps:

  1. Visualize all activities: list users, filter users, and reset licenses.
  2. Identify stakeholders, namely operations and licensing teams.
  3. Measure:
    * Total lead time (TLT) = 13 hours
    * Total cycle time (TCT) = 1.5 hours
    * Total efficiency percentage = TLT/TCT*100 = 11.5%



If you hang a copy of these visualizations in high-traffic and high-visibility areas, such as your team's breakout area, cafeteria, or on the way to your washrooms, you will trigger lots of discussions and unsolicited feedback. For example, looking at the visual, it is evident that the manual tasks are a waste, caused primarily by long process wait times.

Let us explore a simple PowerShell script that automates the process, as shown in Figure 2, reducing the total lead-time from 13 to 4 hours and 60 seconds, and raising the overall efficiency from 11.5 to 12.75%.

![Semi-automated PowerShell-based process to switch user license][4]

 

[PowerShell][5] is an open source task-based scripting language. It is found [on GitHub][6], is built on .NET, and allows you to automate Linux, macOS, and Windows processes. Users with a development background, especially C#, will enjoy the full benefits of PowerShell.

The PowerShell script example below communicates with [Azure DevOps][7] via its service [REST API][8]. The script combines the manual list users and filter users tasks in Fig. 1, identifies all users in the **DEMO** organization that have not been active for two months and are using either a **Basic** or a more expensive **Basic + Test** license, and outputs the user's details to the console. Simple!

First, set up the authentication header and other variables that will be used later with this initialization script:


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

Next, query all the entitlements with this script to identify inactive users:


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

When you run the script, you get the following output, which you can forward to the licensing team to reset the user licenses:


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

If you automate the final step, automatically setting the user licenses to a free stakeholder license, as in Fig. 3, you can further reduce the overall lead time to 65 seconds and raise the overall efficiency to 77%.

![Fully automated PowerShell-based process to switch user license][9]

Fig. 3 Fully automated PowerShell-based process to switch user license

The core value of this PowerShell script is not just the ability to _automate_ but also to perform the process _regularly_, _consistently_, and _quickly_. Further improvements would trigger the script weekly or daily using a scheduler such as an Azure pipeline, but I will hold the programmatic license reset and script scheduling for a future article.

Here is a graph to visualize the progress:

![Graph to visualize progress][10]

Fig. 4 Measure, measure, measure

I hope you enjoyed this brief journey through automation, PowerShell, REST APIs, and value stream mapping. Please share your thoughts and feedback in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/devops-automation

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
