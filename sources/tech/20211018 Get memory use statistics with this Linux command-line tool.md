[#]: subject: "Get memory use statistics with this Linux command-line tool"
[#]: via: "https://opensource.com/article/21/10/memory-stats-linux-smem"
[#]: author: "Tomasz Waraksa https://opensource.com/users/tomasz"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get memory use statistics with this Linux command-line tool
======
The smem command allows you to quickly view your web applications'
memory use.
![Programming at a browser, orange hands][1]

In my programming work, I often need to know the memory used by web applications. A rough estimate is usually enough before getting down to details and browser profiling tools.

To interrogate memory use on Linux or macOS, people typically use [top][2] or [htop][3]. I'd love to see a single number: How much RAM did a process take. But statistics shown by these utilities can be hard to understand. With web browsers, it's even more complicated because they often run many separate processes. They all show up in top output as a long list, each with its own individual metrics.

![Memory usage using htop][4]

(Tomasz Waraksa, [CC BY-SA 4.0][5])

### Enter smem command

Luckily there is [smem][6], another command-line utility for viewing memory use statistics. Install it with your package manager of choice, for example:


```
`sudo apt install smem`
```

To get total memory use by [Firefox][7], do:


```
`smem -c pss -P firefox -k -t | tail -n 1`
```

What happens here?

  * `-c` switch specifies columns to show. I'm only interested in _the pss_ column, which shows memory allocated by a process.
  * `-P` switch filters processes to include only those with _firefox_ in the name
  * `-k` switch tells to show memory use in mega/gigabytes instead of plain bytes
  * `-t` switch displays the totals
  * `tail -n 1` filter outputs only the last line, just where the totals are



The output is as simple as it gets:


```
$ smem -t -k -c pss -P firefox | tail -n 1
4.9G
```

Straight to the point! And, after another busy day of work, with over fifty opened tabs, Firefox still uses only 5 GB. Take that, Google Chrome ;-)

#### Even easier with a script

For convenience, create a little script named `memory-use`, which takes the process name as a parameter. I keep all my scripts in `~/bin`, so:


```
`echo 'smem -c pss -P "$1" -k -t | tail -n 1' > ~/bin/memory-use && chmod +x ~/bin/memory-use`
```

Now I can measure memory use of any application as easy as:


```
memory-use firefox
memory-use chrome
memory-use slack
```

#### And there is even more!

The utility can do much more than show the total memory use. It can even generate graphic output.

For example:


```
`smem --pie name -c pss`
```

Shows something like this:

![Pie chart output from smem][8]

(Tomasz Waraksa, [CC BY-SA 4.0][5])

For more details, I recommend looking into [smem man pages][6].

You can find another great tutorial at <https://linoxide.com/memory-usage-reporting-smem/>.

Enjoy!

* * *

_This article originally appeared on the [author's blog][9] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/memory-stats-linux-smem

作者：[Tomasz Waraksa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomasz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y (Programming at a browser, orange hands)
[2]: https://linux.die.net/man/1/top
[3]: https://linux.die.net/man/1/htop
[4]: https://opensource.com/sites/default/files/uploads/1_htop.png (Memory usage using htop)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://linux.die.net/man/8/smem
[7]: https://www.mozilla.org/en-US/firefox/
[8]: https://opensource.com/sites/default/files/uploads/2_smem-pie-chart.png (Pie chart output from smem)
[9]: https://letsdebug.it/post/26-measure-application-memory-use-on-linux/
