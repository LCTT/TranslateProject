Power(Shell) to the people
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_lightbulbs.png?itok=pwp22hTw)

Earlier this year, [PowerShell Core][1] [became generally available][2] under an Open Source ([MIT][3]) license. PowerShell is hardly a new technology. From its first release for Windows in 2006, PowerShell's creators [sought][4] to incorporate the power and flexibility of Unix shells while remedying their perceived deficiencies, particularly the need for text manipulation to derive value from combining commands.

Five major releases later, PowerShell Core allows the same innovative shell and command environment to run natively on all major operating systems, including OS X and Linux. Some (read: almost everyone) may still scoff at the audacity and/or the temerity of this Windows-born interloper to offer itself to platforms that have had strong shell environments since time immemorial (at least as defined by a millennial). In this post, I hope to make the case that PowerShell can provide advantages to even seasoned users.

### Consistency across platforms

If you plan to port your scripts from one execution environment to another, you need to make sure you use only the commands and syntaxes that work. For example, on GNU systems, you would obtain yesterday's date as follows:
```
date --date="1 day ago"

```

On BSD systems (such as OS X), the above syntax wouldn't work, as the BSD date utility requires the following syntax:
```
date -v -1d

```

Because PowerShell is licensed under a permissive license and built for all platforms, you can ship it with your application. Thus, when your scripts run in the target environment, they'll be running on the same shell using the same command implementations as the environment in which you tested your scripts.

### Objects and structured data

*nix commands and utilities rely on your ability to consume and manipulate unstructured data. Those who have lived for years with `sed` `grep` and `awk` may be unbothered by this statement, but there is a better way.

Let's redo the yesterday's date example in PowerShell. To get the current date, run the `Get-Date` cmdlet (pronounced "commandlet"):
```
> Get-Date                        



Sunday, January 21, 2018 8:12:41 PM

```

The output you see isn't really a string of text. Rather, it is a string representation of a .Net Core object. Just like any other object in any other OOP environment, it has a type and most often, methods you can call.

Let's prove this:
```
> $(Get-Date).GetType().FullName

System.DateTime

```

The `$(...)` syntax behaves exactly as you'd expect from POSIX shells—the result of the evaluation of the command in parentheses is substituted for the entire expression. In PowerShell, however, the $ is strictly optional in such expressions. And, most importantly, the result is a .Net object, not text. So we can call the `GetType()` method on that object to get its type object (similar to `Class` object in Java), and the `FullName` [property][5] to get the full name of the type.

So, how does this object-orientedness make your life easier?

First, you can pipe any object to the `Get-Member` cmdlet to see all the methods and properties it has to offer.
```
> (Get-Date) | Get-Member
PS /home/yevster/Documents/ArticlesInProgress> $(Get-Date) | Get-Member        


   TypeName: System.DateTime


Name                 MemberType     Definition                                
----                 ----------     ----------                                
Add                  Method         datetime Add(timespan value)              
AddDays              Method         datetime AddDays(double value)            
AddHours             Method         datetime AddHours(double value)            
AddMilliseconds      Method         datetime AddMilliseconds(double value)    
AddMinutes           Method         datetime AddMinutes(double value)          
AddMonths            Method         datetime AddMonths(int months)            
AddSeconds           Method         datetime AddSeconds(double value)          
AddTicks             Method         datetime AddTicks(long value)              
AddYears             Method         datetime AddYears(int value)              
CompareTo            Method         int CompareTo(System.Object value), int ...
```

You can quickly see that the DateTime object has an `AddDays` that you can quickly use to get yesterday's date:
```
> (Get-Date).AddDays(-1)


Saturday, January 20, 2018 8:24:42 PM
```

To do something slightly more exciting, let's call Yahoo's weather service (because it doesn't require an API token) and get your local weather.
```
$city="Boston"
$state="MA"
$url="https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22${city}%2C%20${state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
```

Now, we could do things the old-fashioned way and just run `curl $url` to get a giant blob of JSON, or...
```
$weather=(Invoke-RestMethod $url)
```

If you look at the type of `$weather` (by running `echo $weather.GetType().FullName`), you will see that it's a `PSCustomObject`. It's a dynamic object that reflects the structure of the JSON.

And PowerShell will be thrilled to help you navigate through it with its tab completion. Just type `$weather.` (making sure to include the ".") and press Tab. You will see all the root-level JSON keys. Type one, followed by a "`.`", press Tab again, and you'll see its children (if any).

Thus, you can easily navigate to the data you want:
```
> echo $weather.query.results.channel.atmosphere.pressure                                                              
1019.0


> echo $weather.query.results.channel.wind.chill                                                                      
41
```

And if you have JSON or CSV lying around (or returned by an outside command) as unstructured data, just pipe it into the `ConvertFrom-Json` or `ConvertFrom-CSV` cmdlet, respectively, and you can have your data in nice clean objects.

### Computing vs. automation

We use shells for two purposes. One is for computing, to run individual commands and to manually respond to their output. The other is automation, to write scripts that execute multiple commands and respond to their output programmatically.

A problem that most of us have learned to overlook is that these two purposes place different and conflicting requirements on the shell. Computing requires the shell to be laconic. The fewer keystrokes a user can get away with, the better. It's unimportant if what the user has typed is barely legible to another human being. Scripts, on the other hand, are code. Readability and maintainability are key. And here, POSIX utilities often fail us. While some commands do offer both laconic and readable syntaxes (e.g. `-f` and `--force`) for some of their parameters, the command names themselves err on the side of brevity, not readability.

PowerShell includes several mechanisms to eliminate that Faustian tradeoff.

First, tab completion eliminates typing of argument names. For instance, type `Get-Random -Mi`, press Tab and PowerShell will complete the argument for you: `Get-Random -Minimum`. But if you really want to be laconic, you don't even need to press Tab. For instance, PowerShell will understand
```
Get-Random -Mi 1 -Ma 10
```

because `Mi` and `Ma` each have unique completions.

You may have noticed that all PowerShell cmdlet names have a verb-noun structure. This can help script readability, but you probably don't want to keep typing `Get-` over and over in the command line. So don't! If you type a noun without a verb, PowerShell will look for a `Get-` command with that noun.

Caution: although PowerShell is not case-sensitive, it's a good practice to capitalize the first letter of the noun when you intend to use a PowerShell command. For example, typing `date` will call your system's `date` utility. Typing `Date` will call PowerShell's `Get-Date` cmdlet.

And if that's not enough, PowerShell has aliases to create simple names. For example, if you type `alias -name cd`, you will discover the `cd` command in PowerShell is itself an alias for the `Set-Location` command.

So to review—you get powerful tab completion, aliases, and noun completions to keep your command names short, automatic and consistent parameter name truncation, while still enjoying a rich, readable syntax for scripting.

### So... friends?

There are just some of the advantages of PowerShell. There are more features and cmdlets I haven't discussed (check out [Where-Object][6] or its alias `?` if you want to make `grep` cry). And hey, if you really feel homesick, PowerShell will be happy to launch your old native utilities for you. But give yourself enough time to get acclimated in PowerShell's object-oriented cmdlet world, and you may find yourself choosing to forget the way back.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/powershell-people

作者：[Yev Bronshteyn][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/yevster
[1]:https://github.com/PowerShell/PowerShell/blob/master/README.md
[2]:https://blogs.msdn.microsoft.com/powershell/2018/01/10/powershell-core-6-0-generally-available-ga-and-supported/
[3]:https://spdx.org/licenses/MIT
[4]:http://www.jsnover.com/Docs/MonadManifesto.pdf
[5]:https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/properties
[6]:https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-6
