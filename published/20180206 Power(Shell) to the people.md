给大家安利一下 PowerShell
======

> 代码更简洁、脚本更清晰、跨平台一致性等好处是让 Linux 和 OS X 用户喜爱 PowerShell 的原因。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_lightbulbs.png?itok=pwp22hTw)

今年（2018）早些时候，[Powershell Core][1] 以 [MIT][3] 开源协议发布了[正式可用版（GA）][2]。PowerShell 算不上是新技术。自 2006 年为 Windows 发布了第一版 PowerShell 以来，PowerShell 的创建者在[结合了][4] Unⅸ shell 的强大和灵活的同时也在弥补他们所意识到的缺点，特别是从组合命令中获取值时所要进行的文本操作。

在发布了 5 个主要版本之后，PowerShell 已经可以在所有主流操作系统上（包括 OS X 和 Linux）本地运行同样创新的 shell 和命令行环境。一些人（应该说是大多数人）可能依旧在嘲弄这位诞生于 Windows 的闯入者的大胆和冒失：为那些远古以来（从千禧年开始算不算？）便存在着强大的 shell 环境的平台引荐自己。在本帖中，我希望可以将 PowerShell 的优势介绍给大家，甚至是那些经验老道的用户。

### 跨平台一致性

如果你计划将脚本从一个执行环境迁移到另一个平台时，你需要确保只使用了那些在两个平台下都起作用的命令和语法。比如在 GNU 系统中，你可以通过以下方式获取昨天的日期：

```
date --date="1 day ago"
```

在 BSD 系统中（比如 OS X），上述语法将没办法工作，因为 BSD 的 date 工具需要以下语法：

```
date -v -1d
```

因为 PowerShell 具有宽松的许可证，并且在所有的平台都有构建，所以你可以把 PowerShell 和你的应用一起打包。因此，当你的脚本运行在目标系统中时，它们会运行在一样的 shell 环境中，使用与你的测试环境中同样的命令实现。

### 对象和结构化数据

*nix 命令和工具依赖于你使用和操控非结构化数据的能力。对于那些长期活在 `sed`、 `grep` 和 `awk` 环境下的人们来说，这可能是小菜一碟，但现在有更好的选择。

让我们使用 PowerShell 重写那个获取昨天日期的实例。为了获取当前日期，使用 `Get-Date` cmdlet（读作 “commandlet”）：

```
> Get-Date                        

Sunday, January 21, 2018 8:12:41 PM
```

你所看到的输出实际上并不是一个文本字符串。不如说，这是 .Net Core 对象的一个字符串表现形式。就像任何 OOP 环境中的对象一样，它具有类型以及你可以调用的方法。

让我们来证明这一点：

```
> $(Get-Date).GetType().FullName
System.DateTime
```

`$(...)` 语法就像你所期望的 POSIX shell 中那样，计算括弧中的命令然后替换整个表达式。但是在 PowerShell 中，这种表达式中的 `$` 是可选的。并且，最重要的是，结果是一个 .Net 对象，而不是文本。因此我们可以调用该对象中的 `GetType()` 方法来获取该对象类型（类似于 Java 中的 `Class` 对象），`FullName` [属性][5] 则用来获取该类型的全称。

那么，这种对象导向的 shell 是如何让你的工作变得更加简单呢？

首先，你可将任何对象排进 `Get-Member` cmdlet 来查看它提供的所有方法和属性。

```
> (Get-Date) | Get-Member
PS /home/yevster/Documents/ArticlesInProgress> $(Get-Date) | Get-Member         


   TypeName: System.DateTime

Name                 MemberType     Definition                                 
----                 ----------     ----------                                 
Add                  Method         datetime Add(timespan value)               
AddDays              Method         datetime AddDays(double value)             
AddHours             Method         datetime AddHours(double value)            
AddMilliseconds      Method         datetime AddMilliseconds(double value)     
AddMinutes           Method         datetime AddMinutes(double value)          
AddMonths            Method         datetime AddMonths(int months)             
AddSeconds           Method         datetime AddSeconds(double value)          
AddTicks             Method         datetime AddTicks(long value)              
AddYears             Method         datetime AddYears(int value)               
CompareTo            Method         int CompareTo(System.Object value), int ...
```

你可以很快的看到 DateTime 对象具有一个 `AddDays` 方法，从而可以使用它来快速的获取昨天的日期：

```
> (Get-Date).AddDays(-1)

Saturday, January 20, 2018 8:24:42 PM
```

为了做一些更刺激的事，让我们调用 Yahoo 的天气服务（因为它不需要 API 令牌）然后获取你的本地天气。

```
$city="Boston"
$state="MA"
$url="https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22${city}%2C%20${state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
```

现在，我们可以使用老派的方法然后直接运行 `curl $url` 来获取 JSON 二进制对象，或者……

```
$weather=(Invoke-RestMethod $url)
```

如果你查看了 `$weather` 类型（运行 `echo $weather.GetType().FullName`），你将会发现它是一个 `PSCustomObject`。这是一个用来反射 JSON 结构的动态对象。

然后 PowerShell 可以通过 tab 补齐来帮助你完成命令输入。只需要输入 `$weather.`（确报包含了 `.`）然后按下 `Tab` 键。你将看到所有根级别的 JSON 键。输入其中的一个，然后跟上 `.` ，再一次按下 `Tab` 键，你将看到它所有的子键（如果有的话）。

因此，你可以轻易的导航到你所想要的数据：

```
> echo $weather.query.results.channel.atmosphere.pressure                         
1019.0

> echo $weather.query.results.channel.wind.chill                                 41
```

并且如果你有非结构化的 JSON 或 CSV 数据（通过外部命令返回的），只需要将它相应的排进 `ConverFrom-Json` 或 `ConvertFrom-CSV` cmdlet，然后你可以得到一个漂亮干净的对象。

### 计算 vs. 自动化

我们使用 shell 用于两种目的。一个是用于计算，运行独立的命令然后手动响应它们的输出。另一个是自动化，通过写脚本执行多个命令，然后以编程的方式相应它们的输出。

我们大多数人都能发现这两种目的在 shell 上的不同且互相冲突的要求。计算任务要求 shell 简洁明了。用户输入的越少越好。但如果用户输入对其他用户来说几乎难以理解，那这一点就不重要了。脚本，从另一个角度来讲是代码。可读性和可维护性是关键。这一方面，POSIX 工具通常是失败的。虽然一些命令通常会为它们的参数提供简洁明了的语法（如：`-f` 和 `--force`），但是命令名字本身就不简洁明了。

PowerShell 提供了几个机制来消除这种浮士德式的平衡。

首先，tab 补齐可以消除键入参数名的需要。比如：键入 `Get-Random -Mi`，按下 `Tab` 然后 PowerShell 将会为你完成参数：`Get-Random -Minimum`。但是如果你想更简洁一些，你甚至不需要按下 `Tab`。如下所示，PowerShell 可以理解：

```
Get-Random -Mi 1 -Ma 10
```

因为 `Mi` 和 `Ma` 每一个都具有独立不同的补齐。

你可能已经留意到所有的 PowerShell cmdlet 名称具有动名词结构。这有助于脚本的可读性，但是你可能不想一而再、再而三的键入 `Get-`。所以并不需要！如果你之间键入了一个名词而没有动词的话，PowerShell 将查找带有该名词的 `Get-` 命令。

> 小心：尽管 PowerShell 不区分大小写，但在使用 PowerShell 命令是时，名词首字母大写是一个好习惯。比如，键入 `date` 将会调用系统中的 `date` 工具。键入 `Date` 将会调用 PowerShell 的 `Get-Date` cmdlet。

如果这还不够，PowerShell 还提供了别名，用来创建简单的名字。比如，如果键入 `alias -name cd`，你将会发现 `cd` 在 PowerShell 实际上时 `Set-Location` 命令的别名。

所以回顾以下 —— 你可以使用强大的 tab 补全、别名，和名词补全来保持命令名词简洁、自动化和一致性参数名截断，与此同时还可以享受丰富、可读的语法格式。

### 那么……你看呢？

这些只是 PowerShell 的一部分优势。还有更多特性和 cmdlet，我还没讨论（如果你想弄哭 `grep` 的话，可以查看 [Where-Object][6] 或其别称 `?`）。如果你有点怀旧的话，PowerShell 可以为你加载原来的本地工具。但是给自己足够的时间来适应 PowerShell 面向对象 cmdlet 的世界，然后你将发现自己会选择忘记回去的路。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/powershell-people

作者：[Yev Bronshteyn][a]
译者：[sanfusu](https://github.com/sanfusu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/yevster
[1]:https://github.com/PowerShell/PowerShell/blob/master/README.md
[2]:https://blogs.msdn.microsoft.com/powershell/2018/01/10/powershell-core-6-0-generally-available-ga-and-supported/
[3]:https://spdx.org/licenses/MIT
[4]:http://www.jsnover.com/Docs/MonadManifesto.pdf
[5]:https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/properties
[6]:https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-6
