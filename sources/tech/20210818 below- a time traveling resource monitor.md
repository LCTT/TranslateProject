[#]: subject: "below: a time traveling resource monitor"
[#]: via: "https://fedoramagazine.org/below-a-time-traveling-resource-monitor/"
[#]: author: "Daniel Xu https://fedoramagazine.org/author/dxuu/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

below: a time traveling resource monitor
======

![][1]

In this article, we introduce _below_: an Apache 2.0 licensed resource monitor for modern Linux systems. _below_ allows you to replay previously recorded data.

### Background

One of the kernel’s primary responsibilities is mediating access to resources. Sometimes this might mean parceling out physical memory such that multiple processes can share the same host. Other times it might mean ensuring equitable distribution of CPU time. In all these contexts, the kernel provides the mechanism and leaves the policy to “someone else”. In more recent times, this “someone else” is usually a runtime like systemd or dockerd. The runtime takes input from a scheduler or end user — something along the lines of what to run and how to run it — and turns the right knobs and pulls the right levers on the kernel such that the workload can —well — get to work.

In a perfect world this would be the end of the story. However, the reality is that resource management is a complex and rather opaque amalgam of technologies that has evolved over decades of computing. Despite some of this technology having various warts and dead ends, the end result — a container — works relatively well. While the user does not usually need to concern themselves with the details, it is crucial for infrastructure operators to have visibility into their stack. Visibility and debuggability are essential for detecting and investigating misconfigurations, bugs, and systemic issues.

To make matters more complicated, resource outages are often difficult to reproduce. It is not unusual to spend weeks waiting for an issue to reoccur so that the root cause can be investigated. Scale further compounds this issue: one cannot run a custom script on _every_ host in the hopes of logging bits of crucial state if the bug happens again. Therefore, more sophisticated tooling is required. Enter _below_.

### Motivation

Historically Facebook has been a heavy user of _atop_ [0]. _atop_ is a performance monitor for Linux that is capable of reporting the activity of all processes as well as various pieces of system level activity. One of the most compelling features _atop_ has over tools like _htop_ is the ability to record historical data as a daemon. This sounds like a simple feature, but in practice this has enabled debugging countless production issues. With long enough data retention, it is possible to go backwards in time and look at the host state before, during, and after the issue or outage.

Unfortunately, it became clear over the years that _atop_ had certain deficiencies. First, cgroups [1] have emerged as the defacto way to control and monitor resources on a Linux machine. _atop_ still lacks support for this fundamental building block. Second, _atop_ stores data on disk with custom delta compression. This works fine under normal circumstances, but under heavy resource pressure the host is likely to lose data points. Since delta compression is in use, huge swaths of data can be lost for periods of time where the data is most important. Third, the user experience has a steep learning curve. We frequently heard from _atop_ power users that they love the dense layout and numerous keybindings. However, this is a double edged sword. When someone new to the space wants to debug a production issue, they’re solving two problems at once now: the issue at hand and how to use _atop_.

_below_ was designed and developed by and for the resource control team at Facebook with input from production _atop_ users. The resource control team is responsible for, as the name suggests, resource management at scale. The team is comprised of kernel developers, container runtime developers, and hardware folks. Recognizing the opportunity for a next-generation system monitor, we designed _below_ with the following in mind:

  * Ease of use: _below_ must be both intuitive for new users as well as powerful for daily users
  * Opinionated statistics: _below_ displays accurate and useful statistics. We try to avoid collecting and dumping stats just because we can.
  * Flexibility: when the default settings are not enough, we allow the user to customize their experience. Examples include configurable keybindings, configurable default view, and a scripting interface (the default being a terminal user interface).



### Install

To install the package:

```
# dnf install -y below
```

To turn on the recording daemon:

```
# systemctl enable --now below
```

### Quick tour

_below_’s most commonly used mode is replay mode. As the name implies, replay mode replays previously recorded data. Assuming you’ve already started the recording daemon, start a session by running:

```
$ below replay --time "5 minutes ago"
```

You will then see the cgroup view:

![][2]

If you get stuck or forget a keybinding, press **?** to access the help menu.

The very top of the screen is the status bar. The status bar displays information about the current sample. You can move forwards and backwards through samples by pressing **t** and **T**, respectively. The middle section is the system overview. The system overview contains statistics about the system as a whole that are generally always useful to see. The third and lowest section is the multipurpose view. The image above shows the cgroup view. Additionally, there are process and system views, accessible by pressing **p** and **s**, respectively.

Press **↑** and **↓** to move the list selection. Press **&lt;Enter&gt;** to collapse and expand cgroups. Suppose you’ve found an interesting cgroup and you want to see what processes are running inside it. To zoom into the process view, select the cgroup and press **z**:

![][3]

Press **z** again to return to the cgroup view. The cgroup view can be somewhat long at times. If you have a vague idea of what you’re looking for, you can filter by cgroup name by pressing **/** and entering a filter:

![][4]

At this point, you may have noticed a tab system we haven’t explored yet. To cycle forwards and backwards through tabs, press **&lt;Tab&gt;** and **&lt;Shift&gt; \+ &lt;Tab&gt;** respectively. We’ll leave this as an exercise to the reader.

### Other features

Under the hood, _below_ has a powerful design and architecture. Facebook is constantly upgrading to newer kernels, so we never assume a data source is available. This tacit assumption enables total backwards and forwards compatibility between kernels and _below_ versions. Furthermore, each data point is zstd compressed and stored in full. This solves the issues with delta compression we’ve seen _atop_ have at scale. Based on our tests, our per-sample compression can achieve on average a 5x compression ratio.

_below_ also uses eBPF [2] to collect information about short-lived processes (processes that live for shorter than the data collection interval). In contrast, _atop_ implements this feature with BSD process accounting, a known slow and priority-inversion-prone kernel interface.

For the user, _below_ also supports live-mode and a dump interface. Live mode combines the recording daemon and the TUI session into one process. This is convenient for browsing system state without committing to a long running daemon or disk space for data storage. The dump interface is a scriptable interface to all the data _below_ stores. Dump is both powerful and flexible — detailed data is available in CSV, JSON, and human readable format.

### Conclusion

_below_ is an Apache 2.0 licensed open source project that we (the _below_ developers) think offers compelling advantages over existing tools in the resource monitoring space. We’ve spent a great deal of effort preparing _below_ for open source use so we hope that readers and the community get a chance to try _below_ out and report back with bugs and feature requests.

[0]: <https://www.atoptool.nl/>
[1]: <https://en.wikipedia.org/wiki/Cgroups>
[2]: <https://ebpf.io/>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/below-a-time-traveling-resource-monitor/

作者：[Daniel Xu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dxuu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/below_resource_monitor-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2021/08/image-1024x800.png
[3]: https://fedoramagazine.org/wp-content/uploads/2021/08/image-1-1024x800.png
[4]: https://fedoramagazine.org/wp-content/uploads/2021/08/image-2-1024x800.png
