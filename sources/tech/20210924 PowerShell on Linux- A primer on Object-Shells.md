[#]: subject: "PowerShell on Linux? A primer on Object-Shells"
[#]: via: "https://fedoramagazine.org/powershell-on-linux-a-primer-on-object-shells/"
[#]: author: "TheEvilSkeletonOzymandias42 https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

PowerShell on Linux? A primer on Object-Shells
======

![][1]

Photos by [NOAA][2] and [Cedric Fox][3] on [Unsplash][4]

In the previous post, [Install PowerShell on Fedora Linux][5], we went through different ways to install PowerShell on Fedora Linux and explained the basics of PowerShell. This post gives you an overview of PowerShell and a comparison to POSIX-compliant shells.

### Table of contents

  * [Differences at first glance — Usability][6]
    * [Speed and efficiency][7]
      * [Aliases][8]
      * [Custom aliases][9]
  * [Differences between POSIX Shells — Char-stream vs. Object-stream][10]
    * [To filter for something][11]
    * [Output formatting][12]
      * [Field separators, column-counting and sorting][13]
      * [Getting rid of fields and formatting a nice table][14]
      * [How it’s done in PowerShell][15]
  * [Remote Administration with PowerShell — PowerShell-Sessions on Linux!?][16]
    * [Background][17]
    * [What this is good for][18]
  * [Conclusion][19]



### Differences at first glance — Usability

One of the very first differences to take note of when using PowerShell for the first time is semantic clarity.

Most commands in traditional POSIX shells, like the Bourne Again Shell (BASH), are heavily abbreviated and often require memorizing.

Commands like _awk_, _ps_, _top_ or even _ls_ do not communicate what they do with their name. Only when one already _does_ know what they do, do the names start to make sense. Once I know that _ls_ **lists** files the abbreviation makes sense.

In PowerShell on the other hand, commands are perfectly self-descriptive. They accomplish this by following a strict naming convention.

Commands in PowerShell are called “cmdlets” (pronounced commandlets). These always follow the scheme of Verb-Noun.

One example: To **get** all files or child-items in a directory I tell PowerShell like this:

```
PS > Get-ChildItem

    Directory: /home/Ozymandias42

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          14/04/2021    08:11                Folder1
d----          13/04/2021    11:55                Folder2
```

**An Aside:**
The cmdlet name is Get-Child_Item_ not _Item**s**_. This is in acknowledgement of [Set-theory][20]. Each of the standard cmdlets return a list or a set of results. The number of items in a set —mathematicians call this the sets [cardinality][21]— can be 0, 1 or any arbitrary natural number, meaning the set can be empty, contain exactly one result or many results. The reason for this, and why I stress this here, is because the standard cmdlets _also_ implicitly implement a ForEach-Loop for any results they return. More about this later.

#### Speed and efficiency

##### Aliases

You might have noticed that standard cmdlets are long and can therefore be time consuming when writing scripts. However, many cmdlets are aliased and don’t necessarily depend on the case, which mitigates this problem.

Let’s write a script with unaliased cmdlets as an example:

```
PS > Get-Process | ForEach-Object {Write-Host $_.Name -ForegroundColor Cyan}
```

This lists the name of running processes in cyan. As you can see, many characters are in upper case and cmdlets names are relatively long. Let’s shorten them and replace upper case letters to make the script easier to type:

```
PS > gps | foreach {write-host $_.name -foregroundcolor cyan}
```

This is the same script but with greatly simplified input.

To see the full list of aliased cmdlets, type _Get-Alias_.

##### Custom aliases

Just like any other shell, PowerShell also lets you set your own aliases by using the _Set-Alias_ cmdlet. Let’s alias _Write-Host_ to something simpler so we can make the same script even easier to type:

```
PS > Set-Alias -Name wh -Value Write-Host
```

Here, we aliased _wh_ to _Write-Host_ to increase typebility. When setting aliases, _-Name_ indicates what you want the alias to be and _-Value_ indicates what you want to alias to.

Let’s see how it looks now:

```
PS > gps | foreach {wh $_.name -foregroundcolor cyan}
```

You can see that we already made the script easier to type. If we wanted, we could also alias _ForEach-Object_ to _fe_, but you get the gist.

If you want to see the properties of an alias, you can type _Get-Alias_. Let’s check the properties of the alias _wh_ using the _Get-Alias_ cmdlet:

```
PS > Get-Alias wh

CommandType     Name                  Version    Source
-----------     ----                  -------    ------
Alias           wh -> Write-Host
```

##### Autocompletion and suggestions

PowerShell suggests cmdlets or flags when you press the Tab key twice, by default. If there is nothing to suggest, PowerShell automatically completes to the cmdlet.

### Differences between POSIX Shells — Char-stream vs. Object-stream

Any scripting will eventually string commands together via pipe | and soon come to notice a few key differences.

In bash what is moved from one command to the next through a pipe is just a string of characters. However, in PowerShell this is not the case.

In PowerShell, every cmdlet is aware of data structures and objects. For example, a structure like this:

```
{
  firstAuthor=Ozy,
  secondAuthor=Skelly
}
```

This data is kept as-is even if a command, used alone, would have presented this data as follows:

```
AuthorNr.  AuthorName
1          Ozy
2          Skelly
```

In bash, on the other hand, that formatted output would need to be created by parsing with helper tools like _awk_ or _cut_ first, to be usable with a different command.

PowerShell does not require this parsing since the underlying structure is sent when using a pipe rather than the formatted output shown without. So the command _authorObject | doThingsWithSingleAuthor firstAuthor_ is possible.

The following examples shall further illustrate this.

**Beware:** This will get fairly technical and verbose. Skip if satisfied already.

A few of the most often used constructs to illustrate the advantage of PowerShell over bash, when using pipes, are to:

  * filter for something
  * format output
  * sort output



When implementing these in bash there are a few things that will re-occur time and time again.
The following sections will exemplarise these constructs and their variants in bash and contrast them with their PowerShell equivalents.

#### To filter for something

Let’s say you want to see all processes matching the name _ssh-agent_.
In human thinking terms you know what you want.

  1. Get all processes
  2. Filter for all processes that match our criteria
  3. Print those processes



To apply this in bash we could do it in two ways.

The first one, which most people who are comfortable with bash might use is this one:

```
$ ps -p $(pgrep ssh-agent)
```

At first glance this is straight forward. _ps_ get’s all processes and the _-p_ flag tells it to filter for a given list of pids.
What the veteran bash user might forget here however is that this might read this way but is not actually run as such. There’s a tiny but important little thing called the order of evaluation.

_$()_ is d a subshell. A subshell is run, or evaluated, first. This means the list of pids to filter again is first and the result is then returned in place of the subshell for the waiting outer command _ps_ to use.

This means it is written as:

  1. Print processes
  2. Filter Processes



but evaluated the other way around. It also implicitly combines the original steps 2. and 3.

A less often used variant that more closely matches the human thought pattern and evaluation order is:

```
$ pgrep ssh-agent | xargs ps
```

The second one still combines two steps, the steps 1. and 2. but follows the evaluation logic a human would think of.

The reason this variant is less used is that ominous _xargs_ command. What this basically does is to append all lines of output from the previous command as a single long line of arguments to the command followed by it. In this case _ps_.

This is necessary because pgrep produces output like this:

```
$ pgrep bash
14514
15308
```

When used in conjunction with a subshell _ps_, might not care about this but when using pipes to approximate the human evaluation order this becomes a problem.

What _xargs_ does, is to reduce the following construct to a single command:

```
$ for i in $(pgrep ssh-agent); do ps $i ; done
```

Okay. Now we have talked a LOT about evaluation order and how to do it in bash in different ways with different evaluation orders of the three basic steps we outlined.

So with this much preparation, how does PowerShell handle it?

```
PS > Get-Process | Where-Object Name -Match ssh-agent
```

Completely self-descriptive and follows the evaluation order of the steps we outlined perfectly. Also do take note of the absence of _xargs_ or any explicit for-loop.

As mentioned in our aside a few hundred words back, the standard cmdlets all implement ForEach internally and do it implicitly when piped input in list-form.

#### Output formatting

This is where PowerShell really shines. Consider a simple example to see how it’s done in bash first. Say we want to list all files in a directory sorted by size from the biggest to the smallest and listed as a table with filename, size and creation date. Also let’s say we have some files with long filenames in there and want to make sure we get the full filename no matter how big our terminal.

##### Field separators, column-counting and sorting

Now the first obvious step is to run _ls_ with the _-l_ flag to get a list with not just the filenames but the creation date and the file sizes we need to sort against too.

We will get a more verbose output than we need. Like this one:

```
$ ls -l
total 148692
-rwxr-xr-x 1 root root      51984 May 16  2020 [
-rwxr-xr-x 1 root root     283728 May  7 18:13 appdata2solv
lrwxrwxrwx 1 root root          6 May 16  2020 apropos -> whatis
-rwxr-xr-x 1 root root      35608 May 16  2020 arch
-rwxr-xr-x 1 root root      14784 May 16  2020 asn1Coding
-rwxr-xr-x 1 root root      18928 May 16  2020 asn1Decoding
[not needed] [not needed]
```

What is apparent is, that to get the kind of output we want we have to get rid of the fields marked _[not needed]_ in the above example but that’s not the only thing needing work. We also need to sort the output so that the biggest file is the first in the list, meaning reverse sort…

This, of course, can be done in multiple ways but it only shows again, how convoluted bash scripts can get.

We can either sort with the _ls_ tool directly by using the _-r_ flag for reverse sort, and the _–sort=size_ flag for sort by size, or we can pipe the whole thing to _sort_ and supply that with the _-n_ flag for numeric sort and the _-k 5_ flag to sort by the fifth column.

Wait! **fifth** ? Yes. Because this too we would have to know. _sort_, by default, uses spaces as field separators, meaning in the tabular output of _ls -l_ the numbers representing the size is the 5th field.

##### Getting rid of fields and formatting a nice table

To get rid of the remaining fields, we once again have multiple options. The most straightforward option, and most likely to be known, is probably _cut_. This is one of the few UNIX commands that is self-descriptive, even if it’s just because of the natural brevity of it’s associated verb. So we pipe our results, up to now, into _cut_ and tell it to only output the columns we want and how they are separated from each other.

_cut -f5- -d” “_ will output from the fifth field to the end. This will get rid of the first columns.

```
283728 May  7 18:13 appdata2solv
 51984 May 16  2020 [
 35608 May 16  2020 arch
 14784 May 16  2020 asn1Coding
     6 May 16  2020 apropos -> whatis
```

This is till far from how we wanted it. First of all the filename is in the last column and then the filesize is in the Human unfriendly format of blocks instead of KB, MB, GB and so on. Of course we could fix that too in various ways at various points in our already long pipeline.

All of this makes it clear that transforming the output of traditional UNIX commands is quite complicated and can often be done at multiple points in the pipeline.

##### How it’s done in PowerShell

```
PS > Get-ChildItem
| Sort-Object Length -Descending
| Format-Table -AutoSize
    Name,
    @{Name="Size"; Expression=
        {[math]::Round($_.Length/1MB,2).toString()+" MB"}
    },
    CreationTime
#Reformatted over multiple lines for better readability.
```

The only actual output transformation being done here is the conversion and rounding of bytes to megabytes for better human readability. This also is one of the only real weaknesses of PowerShell, that it lacks a _simple_ mechanism to get human readable filesizes.

That part aside it’s clear, that Format-Table allows you to simply list the columns wanted by their names in the order you want them.

This works because of the aforementioned object-nature of piped data-streams in PowerShell. There is no need to cut apart strings by delimiters.

#### Remote Administration with PowerShell — PowerShell-Sessions on Linux!?

#### Background

Remote administration via PowerShell on Windows has traditionally always been done via Windows Remoting, using the WinRM protocol.

With the release of Windows 10, Microsoft has also offered a Windows native OpenSSH Server and Client.

Using the SSH Server alone on Windows provides the user a CMD prompt unless the default system Shell is changed via a registry key.

A more elegant option is to make use of the Subsystem facility in _sshd_config_. This makes it possible to configure arbitrary binaries as remote-callable subsystems instead of the globally configured default shell.

By default there is usually one already there. The sftp subsystem.

To make PowerShell available as Subsystem one simply needs to add it like so:

```
Subsystem powershell /usr/bin/pwsh -sshs --noprofile --nologo
```

This works —with the correct paths of course— on _all_ OS’ PowerShell Core is available for. So that means Windows, Linux, and macOS.

#### What this is good for

It is now possible to open a PowerShell (Remote) Session to a properly configured SSH-enabled Server by doing this:

```
PS > Enter-PSSession
    -HostName <target-HostName-or-IP>
    -User <targetUser>
    -IdentityFilePath <path-to-id_rsa-file>
    ...
    <-SSHTransport>
```

What this does is to register and enter an interactive PSSession with the Remote-Host. By itself this has no functional difference from a normal SSH-session. It does, however, allow for things like running scripts from a local host on remote machines via other cmdlets that utilise the same subsystem.

One such example is the _Invoke-Command_ cmdlet. This becomes especially useful, given that _Invoke-Command_ has the _-AsJob_ flag.

What this enables is running local scripts as batchjobs on multiple remote servers while using the local Job-manager to get feedback about when the jobs have finished on the remote machines.

While it is possible to run local scripts via ssh on remote hosts it is not as straight forward to view their progress and it gets outright hacky to run local scripts remotely. We refrain from giving examples here, for brevity’s sake.

With PowerShell, however, this can be as easy as this:

```
$listOfRemoteHosts | Invoke-Command
    -HostName $_
    -FilePath /home/Ozymandias42/Script2Run-Remotely.ps1
    -AsJob
```

Overview of the running tasks is available by doing this:

```
PS > Get-Job

Id     Name            PSJobTypeName   State         HasMoreData     Location             Command
--     ----            -------------   -----         -----------     --------             -------
1      Job1            BackgroundJob   Running       True            localhost            Microsoft.PowerShe…
```

Jobs can then be attached to again, should they require manual intervention, by doing _Receive-Job &lt;JobName-or-JobNumber&gt;_.

### Conclusion

In conclusion, PowerShell applies a fundamentally different philosophy behind its syntax in comparison to standard POSIX shells like bash. Of course, for bash, it’s historically rooted in the limitations of the original UNIX. PowerShell provides better semantic clarity with its cmdlets and outputs which means better understandability for humans, hence easier to use and learn. PowerShell also provides aliased cmdlets in the case of unaliased cmdlets being too long. The main difference is that PowerShell is object-oriented, leading to elimination of input-output parsing. This allows PowerShell scripts to be more concise.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/powershell-on-linux-a-primer-on-object-shells/

作者：[TheEvilSkeletonOzymandias42][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/powershell_2-816x345.jpg
[2]: https://unsplash.com/@noaa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/@thecedfox?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/shell?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://fedoramagazine.org/install-powershell-on-fedora-linux
[6]: tmp.YtC5jLcRsL#differences-at-first-glance--usability
[7]: tmp.YtC5jLcRsL#speed-and-efficiency
[8]: tmp.YtC5jLcRsL#aliases
[9]: tmp.YtC5jLcRsL#custom-aliases
[10]: tmp.YtC5jLcRsL#differences-between-posix-shells--char-stream-vs-object-stream
[11]: tmp.YtC5jLcRsL#to-filter-for-something
[12]: tmp.YtC5jLcRsL#output-formatting
[13]: tmp.YtC5jLcRsL#field-operators-collumn-counting-and-sorting
[14]: tmp.YtC5jLcRsL#getting-rid-of-fields-and-formatting-a-nice-table
[15]: tmp.YtC5jLcRsL#how-its-done-in-powershell
[16]: tmp.YtC5jLcRsL#remote-administration-with-powershell--powershell-sessions-on-linux
[17]: tmp.YtC5jLcRsL#background
[18]: tmp.YtC5jLcRsL#what-this-is-good-for
[19]: tmp.YtC5jLcRsL#conclusion
[20]: https://en.wikipedia.org/wiki/Set_(mathematics)
[21]: https://en.wikipedia.org/wiki/Set_(mathematics)#Cardinality
