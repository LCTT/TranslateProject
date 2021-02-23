[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Detecting CPU steal time in guest virtual machines)
[#]: via: (https://opensource.com/article/20/1/cpu-steal-time)
[#]: author: (Jamie Fargen https://opensource.com/users/jamiefargen)

Detecting CPU steal time in guest virtual machines
======
Is your VM getting all of its vitamin CPU? Use GNU top to find out
what's causing guest performance issues.
![and old computer and a new computer, representing migration to new software or hardware][1]

CPU steal time is defined in the [GNU **top**][2] command as "time stolen from [a] VM by the hypervisor." CPU steal time occurs when a hypervisor process and a guest instance are trying to utilize the same hypervisor physical core (pCPU) at the same time. This results in less processor time available to the guest's virtual CPU (vCPU) and performance degradation for the guest.

In today's virtualized environments (which have become nearly universal with the adoption of public and private clouds), a guest instance can experience performance CPU steal time under several scenarios:

  * Oversubscription of the hypervisor and multiple guest VMs' vCPUs with high CPU utilization are running on the same pCPUs.
  * The guest vCPU and its emulator thread are pinned to the same pCPU resulting in vhost processes stealing CPU time from the guest vCPU while processing I/O.
  * Hypervisor processes, like monitoring, logging, and I/O processes, are concurrently using a pCPU that is also in use by a guest VM vCPU.



Normally, a systems engineer brought in to investigate an application or system performance issue will find that the system's performance is degraded due to CPU time stolen from the guest. The guest's performance issues usually become apparent in the form of low disk or network I/O performance, network packet loss, and other application performance anomalies.

Even when a system administrator is observing the guest and the hypervisor, it can be difficult to narrow down the cause of the guest instance's degraded performance due to CPU steal time. There are a few reasons for the difficulty. First, CPU steal time is not logged by any of the commonly monitored log files. A hypervisor that is being observed may be expected to be under heavy load but steal time can occur on hypervisors that are under normal load. And finally, administrators may not be aware that hypervisor CPU contention can be observed from within the guest VM instance using GNU top.

Fortunately, GNU top indeed makes it quite easy to detect CPU steal time on a guest VM instance. Steal time is displayed in top's output at the end of line 3, which beings with **%Cpu(s)**, as shown in the following screenshots (it is the value at the end, labeled **st**.) The first example shows a guest with little steal time:

![Output of the top command showing low CPU steal time][3]

Output of the top command from a guest experiencing a low CPU steal time of 0.2 st.

This screenshot shows a guest experiencing heavy CPU steal time:

![Output of the top command showing high CPU steal time][4]

Output of the top command from a guest experiencing a heavy CPU steal time of 9.0 st.

In both examples, the stress tool was executed with four processes that consumed all four vCPUs of the guest instance. In the first example, the hypervisor was relatively idle, so the guest's steal time was just 0.2. But in the second example, the stress tool was executed at the same time on the hypervisor with eight processes that consumed all eight of the hypervisors' pCPUs, which produced a high CPU steal time of 9.0.

There is another sign of steal time in the second example: the stress utility process cannot consume ~100% of the guests' vCPUs; it can only consume 99.3%, 99.3%, 86.4%, and 74.4%, respectively. In total, this is equal to 40.3% of a guest vCPU's being stolen. This is because the hypervisor is consuming cycles on the same pCPUs that the guest vCPU's processes are using.

### Using top to mitigate poor performance

This example shows how the oversubscription of guest VM instances and other processes on a hypervisor can contend with a guest, and how to use GNU top to detect it based on the CPU steal time percentage on a guest VM.

It is important to detect this type of performance degradation in a guest VM so that you can mitigate the cause of poor system and application performance. In a public cloud, the only solution might be migrating the instance or changing to an instance type with guaranteed pCPU service-level agreements (SLAs). In a private cloud, there are more options, but again, the simplest approach may be to migrate the instance to a hypervisor with lower utilization. However, if many guest instances experience high CPU steal time, you will need to make changes to how guests' and hypervisors' processes are managed to attain guest instances' performance SLAs.

David Both explains the importance of keeping hardware cool and shares some Linux tools that can...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/cpu-steal-time

作者：[Jamie Fargen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamiefargen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: https://en.wikipedia.org/wiki/Top_(software)
[3]: https://opensource.com/sites/default/files/uploads/cpu-steal-time_1.png (Output of the top command showing low CPU steal time)
[4]: https://opensource.com/sites/default/files/uploads/cpu-steal-time_2.png (Output of the top command showing high CPU steal time)
