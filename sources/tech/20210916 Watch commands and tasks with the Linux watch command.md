[#]: subject: "Watch commands and tasks with the Linux watch command"
[#]: via: "https://opensource.com/article/21/9/linux-watch-command"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Watch commands and tasks with the Linux watch command
======
See how the watch command can let you know when a task has been
completed or a command has been executed.
![Clock, pen, and notepad on a desk][1]

There are many times when you need to wait for something to finish, such as:

  * A file download.
  * Creating or extracting a [tar][2] file.
  * An [Ansible][3] job.



Some of these processes have some sort of progress indication, but sometimes the process is run through a layer of abstraction, and the only way to measure the progress is through its side effects. Some of these might be:

  * A file being downloaded keeps growing.
  * A directory extracted from a tarball fills up with files.
  * The Ansible job builds a [container][4].



You can query all of these things with commands like these:


```
$ ls -l downloaded-file
$ find . | wc -l
$ podman ps
$ docker ps
```

But running these commands over and over, even if it is with the convenience of [Bash history][5] and the **Up Arrow**, is tedious.

Another approach is to write a little Bash script to automate these commands for you:


```
while :
do
  docker ps
  sleep 2
done
```

But such scripts can also become tedious to write. You could write a little generic script and package it, so it's always available to you. Luckily, other open source developers have already been there and done that.

The result is the command `watch`.

### Installing watch

The `watch` command is part of the [`procps-ng` package][6], so if you're on Linux, you already have it installed.

On macOS, install `watch` using [MacPorts][7] or [Homebrew][8]. On Windows, use [Chocolatey][9].

### Using watch

The `watch` command periodically runs a command and shows its output. It has some text-terminal niceties, so only the latest output is on the screen.

The simplest usage is: `watch <command>`.

For example, prefixing the `docker ps` command with `watch` works like this:


```
`$ watch docker ps`
```

The `watch` command, and a few creative Unix command-line tricks, can generate ad-hoc dashboards. For example, to count audit events:


```
`$ watch 'grep audit: /var/log/kern.log |wc -l'`
```

In the last example, it is probably useful if there's a visual indication that the number of audit events changed. If change is expected, but you want something to look "different," `watch --differences` works well. It highlights any differences from the last run. This works especially well if you are grepping in multiple files, so you can easily see which one changed.

If changes are not expected, you can ask for them to be highlighted "permanently" to know which ones to investigate by using `watch --differences=permanent`. This is often more useful.

### Controlling frequency

Finally, sometimes the command might be resource-intensive and should not be run too frequently. The `-n` parameter controls the frequency. Watch uses two seconds by default, but `watch -n 10` might be appropriate for something more resource-intensive, like grepping for a pattern in any file in a subdirectory:


```
`$ watch -n 10 'find . -type f | xargs grep suspicious-pattern'`
```

### Watch a command with watch

The `watch` command is useful for many ad-hoc system administration tasks where you need to wait for some time-consuming step, without a progress bar, before moving on to the next one. Though this is not a great situation to be in, `watch` can make it slightly better—and give you time to start working on those notes for the retrospective! Download the **[cheat sheet][10] **to keep helpful syntax and options close at hand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/linux-watch-command

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6 (Clock, pen, and notepad on a desk)
[2]: https://opensource.com/article/17/7/how-unzip-targz-file
[3]: https://opensource.com/resources/what-ansible
[4]: https://opensource.com/resources/what-docker
[5]: https://opensource.com/article/20/6/bash-history-control
[6]: https://opensource.com/article/21/8/linux-procps-ng
[7]: https://opensource.com/article/20/11/macports
[8]: https://opensource.com/article/20/6/homebrew-mac
[9]: https://opensource.com/article/20/3/chocolatey
[10]: https://opensource.com/downloads/watch-cheat-sheet
