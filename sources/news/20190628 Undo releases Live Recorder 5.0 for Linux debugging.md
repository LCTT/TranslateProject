[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Undo releases Live Recorder 5.0 for Linux debugging)
[#]: via: (https://www.networkworld.com/article/3405584/undo-releases-live-recorder-5-0-for-linux-debugging.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Undo releases Live Recorder 5.0 for Linux debugging
======

![André Gustavo Stumpf \(CC BY 2.0\)][1]

Linux debugging has taken a giant step forward with the release of Live Recorder 5.0 from Undo. Just released on Wednesday, this product makes debugging on multi-process systems significantly easier. Based on flight recorder technology, it delves more deeply into processes to provide insight into what’s going on within each process. This includes memory, threads, program flow, service calls and more. To make this possible, Live Recorder 5.0's record, replay and debugging capabilities have been enhanced with the ability to:

  * Record the exact order in which processes altered shared memory variables. It is even possible to zero in on specific variables and skip backward to the last line of code in any process that altered the variable.
  * Expose potential defects by randomizing thread execution to help reveal race conditions, crashes and other multi-threading defects.
  * Record and replay the execution of individual Kubernetes and Docker containers to help resolve defects faster in microservices environments



The Undo Live Recorder enables engineering teams to record and replay the execution of any software program -- no matter how complex -- and to diagnose and fix the root cause of any issue in test or production.

Depending on your license, Live Recorder can be used on the command line with the **live-record** command that is somewhat similar to strace though, instead of printing system calls and signals, it creates an "Undo recording". Captured failings in recordings can then be debugged (far more effective than grappling with core dumps!). These recordings can also be can be shared with other members of the staff and can be replayed with the reversible debugger to further investigate the cause of the crash or other problem.

The Undo Engine is supported on the following Linux distributions:

  * Red Hat Enterprise Linux 6.8, 6.9, 6.10, 7.4, 7.5, 7.6 and 8.0
  * Fedora 28, 29 and 30
  * SuSE Linux Enterprise Server 12.3, 12.4 and 15
  * Ubuntu 16.04 LTS, 18.04 LTS, 18.10 and 19.04



Undo is a fast-growing, venture-backed technology start-up based in San Francisco and Cambridge, UK. They claim that the Live Recorder provides 100% certainty about the factors that led to any software failure -- even in the most complex software environments.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3405584/undo-releases-live-recorder-5-0-for-linux-debugging.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/flight_data_recorder-100800552-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
