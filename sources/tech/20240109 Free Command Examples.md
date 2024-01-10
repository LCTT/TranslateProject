[#]: subject: "Free Command Examples"
[#]: via: "https://itsfoss.com/free-command/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Free Command Examples
======

The free command is one of the easiest ways one can learn about their system memory (RAM) consumption and if you have swap enabled.

But the question is: How can you use the free command? Well, it is pretty easy and does not require any complex steps.

So in this tutorial, I will walk you through using the free command with examples along with exercise questions for you to practice.

### How to use the free command in Linux

To use free or any other command, it is a good idea to start with the command syntax, and I'll start with the same.

Here's the syntax for the free command:

```

    free [options]

```

You are given multiple options which are supposed to be used in the `[options]` field to change the default behavior of the free command.

Now, allow me to share some commonly used options with the free command:

Option | Description
---|---
`-h` | Print information in human-readable form by adjusting data units in KB, GB, etc.
`-s ` | Update the free output after a given seconds of interval.
`-t` | Shows the total amount of system and swap memory.
`-g` | Display data in gigabytes.
`-m` | Print information in megabytes.
`-k` | Shows output in kilobytes.

But what if you execute the free command without options? Here's what you can expect:

![][1]

Here,

  * `total`: it indicates the total amount of storage.
  * `used`: shows the utilized storage by your system.
  * `free`: the amount of free memory that is available for new processes.
  * `shared`: amount of memory used by tmpfs (temporary filesystem).
  * `buff/cache`: represents the sum of the memory used by buffers and cache.
  * `available`: it estimates how much memory is available to start a new application without swapping. It is a sum of the `free` memory and a part of the `buff/cache` which can be immediately used.



So, if you want all kinds of information, just type in the command with no flags.

Now, let's look at some examples of the free command.

#### 1\. Display information in human-readable form

By default, the free command will display the data in kibibytes which is not the most human-readable form you can have.

That's where the `-h` options come into play which prints values in human-readable form such as in KB or GBs.

```

    free -h

```

![][2]

#### 2\. Show statistics continuously

Once you execute the free command, it will only show you stats of the time when you executed the command. For example, if I executed the `free` command at `12:45` then, it will display the stats of that time only.

So the question is: How you can achieve a similar behavior like [htop][3] which shows the live stats? Not exactly the same, but you can refresh the stats at specific time intervals using the `-s` flag as shown here:

```

    free -s <seconds>

```

For example, if I want to refresh the free command every second, then I will use the following command:

```

    free -s 1

```

**Suggested Read 📖**

![][4]

#### 3\. Define how many times to display the stats

In a previous example, I explained how you can use the free command to show stats continuously, but you may not want it to refresh endlessly instead, a few times only.

For that purpose, you can use the `-c` flag as shown here:

```

    free -c <times_to_show_stats>

```

Let's say I want to see the stats 3 times, then I will be using the following:

```

    free -c 3

```

![][5]

By default, it will refresh the data every second but you can use the `-s` flag to specify the interval time:

```

    free -c <times_to_show_stats> -s <seconds>

```

For example, here, if I would like to display stats 3 times with intervals of 2 seconds, then I will be using the following command:

```

    free -c 3 -s 2

```

![][6]

#### 4\. Specify the output datatype

While for most users, using the `-h` flag to display data in human-readable form would get the job done, but what if you want to specify the data type by yourself?

Well, you can specify the datatype using the following flags:

Flag | Description
---|---
`--kilo` | Display memory in kilobytes.
`--mega` | Display memory in megabytes.
`--giga` | Display memory in gigabytes.
`--tera` | Display memory in terabytes.

You can use the above flags in the following manner:

```

    free --<kilo/mega/giga/tera>

```

For example, if I wish to display memory stats in megabytes, then, I will use the following:

```

    free --mega

```

![][7]

#### 5\. Get the sum of physical and swap memory

By default, the free memory will show the row of physical and swap memory, but what if you want to get the sum of them?

Well, you can use the `-t` flag:

```

    free -t

```

![][8]

### Exercise questions 👨‍💻

Here are some questions that you can practice to get better at using the free command:

  * Print memory stats continuously for 3 times, with an interval of 3 seconds in between.
  * Get the sum of physical and swap memory but in human-readable form.
  * Redirect the output of the free command in the text file.
  * How to print only one column from the output of the free command? (Hint: use [awk command][9] and specify column number).



If you have any doubts regarding the questions, you can reach out to us in our [community forum][10] or leave a comment here.

### Wrapping Up

Every single command comes in handy in one way or the other. The free command also has one such underrated use-case to get useful information.

If you are just getting started with a Linux terminal, we made a series for users like you who are eager to learn but can't find a place to start:

![][4]

_💬 I hope you find this guide useful! Please let me know your thoughts on what should I cover next?_

--------------------------------------------------------------------------------

via: https://itsfoss.com/free-command/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/Use-free-command-without-any-options.png
[2]: https://itsfoss.com/content/images/2024/01/Get-human-readable-data-through-the-free-command-in-Linux.png
[3]: https://itsfoss.com/use-htop/
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://itsfoss.com/content/images/2024/01/Specify-how-many-times-the-free-command-should-display-the-stats.gif
[6]: https://itsfoss.com/content/images/2024/01/Specify-how-many-times-the-free-command-should-display-the-stats-with-custom-intevals.gif
[7]: https://itsfoss.com/content/images/2024/01/Print-memory-statistics-in-megabytes-using-the-free-command-in-Linux.png
[8]: https://itsfoss.com/content/images/2024/01/Get-the-sum-of-physical-and-swap-memory-using-the-free-command.png
[9]: https://linuxhandbook.com/awk-command-tutorial/
[10]: https://itsfoss.community/
