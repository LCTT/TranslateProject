[#]: subject: (5 everyday sysadmin tasks to automate with Ansible)
[#]: via: (https://opensource.com/article/21/3/ansible-sysadmin)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13256-1.html)

用 Ansible 自动化系统管理员的 5 个日常任务
======

> 通过使用 Ansible 自动执行可重复的日常任务，提高工作效率并避免错误。

![](https://img.linux.net.cn/data/attachment/album/202103/31/233904oo7q68eo2njfmf8o.jpg)

如果你讨厌执行重复性的任务，那么我有一个提议给你，去学习 [Ansible][2]!

Ansible 是一个工具，它可以帮助你更轻松、更快速地完成日常任务，这样你就可以更有效地利用时间，比如学习重要的新技术。对于系统管理员来说，它是一个很好的工具，因为它可以帮助你实现标准化，并在日常活动中进行协作，包括：

  1. 安装、配置和调配服务器和应用程序；
  2. 定期更新和升级系统；
  3. 监测、减轻和排除问题。

通常，许多这些基本的日常任务都需要手动步骤，而根据个人的技能的不同，可能会造成不一致并导致配置发生漂移。这在小规模的实施中可能是可以接受的，因为你管理一台服务器，并且知道自己在做什么。但当你管理数百或数千台服务器时会发生什么？

如果不小心，这些手动的、可重复的任务可能会因为人为的错误而造成延误和问题，而这些错误可能会影响你及你的组织的声誉。

这就是自动化的价值所在。而 [Ansible][3] 是自动化这些可重复的日常任务的完美工具。

自动化的一些原因是：

  1. 你想要一个一致和稳定的环境。
  2. 你想要促进标准化。
  3. 你希望减少停机时间，减少严重事故案例，以便可以享受生活。
  4. 你想喝杯啤酒，而不是排除故障问题!

本文提供了一些系统管理员可以使用 Ansible 自动化的日常任务的例子。我把本文中的剧本和角色放到了 GitHub 上的 [系统管理员任务仓库][4] 中，以方便你使用它们。

这些剧本的结构是这样的（我的注释前面有 `==>`）。

```
[root@homebase 6_sysadmin_tasks]# tree -L 2
.
├── ansible.cfg ==> 负责控制 Ansible 行为的配置文件
├── ansible.log
├── inventory
│   ├── group_vars
│   ├── hosts  ==> 包含我的目标服务器列表的清单文件
│   └── host_vars
├── LICENSE
├── playbooks  ==> 包含我们将在本文中使用的剧本的目录
│   ├── c_logs.yml
│   ├── c_stats.yml
│   ├── c_uptime.yml
│   ├── inventory
│   ├── r_cron.yml
│   ├── r_install.yml
│   └── r_script.yml
├── README.md
├── roles    ==> 包含我们将在本文中使用的角色的目录
│   ├── check_logs
│   ├── check_stats
│   ├── check_uptime
│   ├── install_cron
│   ├── install_tool
│   └── run_scr
└── templates ==> 包含 jinja 模板的目录
    ├── cron_output.txt.j2
    ├── sar.txt.j2
    └── scr_output.txt.j2
```

清单类似这样的：

```
[root@homebase 6_sysadmin_tasks]# cat inventory/hosts
[rhel8]
master ansible_ssh_host=192.168.1.12
workernode1 ansible_ssh_host=192.168.1.15

[rhel8:vars]
ansible_user=ansible ==> 请用你的 ansible 用户名更新它
```

这里有五个你可以用 Ansible 自动完成的日常系统管理任务。

### 1、检查服务器的正常运行时间

你需要确保你的服务器一直处于正常运行状态。机构会拥有企业监控工具来监控服务器和应用程序的正常运行时间，但自动监控工具时常会出现故障，你需要登录进去验证一台服务器的状态。手动验证每台服务器的正常运行时间需要花费大量的时间。你的服务器越多，你需要花费的时间就越长。但如果有了自动化，这种验证可以在几分钟内完成。

使用 [check_uptime][5] 角色和 `c_uptime.yml` 剧本：

```
[root@homebase 6_sysadmin_tasks]# ansible-playbook -i inventory/hosts  playbooks/c_uptime.yml -k
SSH password:
PLAY [Check Uptime for Servers] ****************************************************************************************************************************************
TASK [check_uptime : Capture timestamp] *************************************************************************************************
.
截断...
.
PLAY RECAP *************************************************************************************************************************************************************
master                     : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
[root@homebase 6_sysadmin_tasks]#
```

剧本的输出是这样的：

```
[root@homebase 6_sysadmin_tasks]# cat /var/tmp/uptime-master-20210221004417.txt
-----------------------------------------------------
 Uptime for  master
-----------------------------------------------------
 00:44:17 up 44 min,  2 users,  load average: 0.01, 0.09, 0.09
-----------------------------------------------------
[root@homebase 6_sysadmin_tasks]# cat /var/tmp/uptime-workernode1-20210221184525.txt
-----------------------------------------------------
 Uptime for  workernode1
-----------------------------------------------------
 18:45:26 up 44 min,  2 users,  load average: 0.01, 0.01, 0.00
-----------------------------------------------------
```

使用 Ansible，你可以用较少的努力以人类可读的格式获得多个服务器的状态，[Jinja 模板][6] 允许你根据自己的需要调整输出。通过更多的自动化，你可以按计划运行，并通过电子邮件发送输出，以达到报告的目的。

### 2、配置额外的 cron 作业

你需要根据基础设施和应用需求定期更新服务器的计划作业。这似乎是一项微不足道的工作，但必须正确且持续地完成。想象一下，如果你对数百台生产服务器进行手动操作，这需要花费多少时间。如果做错了，就会影响生产应用程序，如果计划的作业重叠，就会导致应用程序停机或影响服务器性能。

使用 [install_cron][7] 角色和 `r_cron.yml` 剧本：

```
[root@homebase 6_sysadmin_tasks]# ansible-playbook -i inventory/hosts playbooks/r_cron.yml -k
SSH password:
PLAY [Install additional cron jobs for root] ***************************************************************************************************************************
.
截断...
.
PLAY RECAP *************************************************************************************************************************************************************
master                     : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

验证剧本的结果：

```
[root@homebase 6_sysadmin_tasks]# ansible -i inventory/hosts all -m shell -a "crontab -l" -k
SSH password:
master | CHANGED | rc=0 >>
1 2 3 4 5 /usr/bin/ls /tmp
#Ansible: Iotop Monitoring
0 5,2 * * * /usr/sbin/iotop -b -n 1 >> /var/tmp/iotop.log 2>> /var/tmp/iotop.err
workernode1 | CHANGED | rc=0 >>
1 2 3 4 5 /usr/bin/ls /tmp
#Ansible: Iotop Monitoring
0 5,2 * * * /usr/sbin/iotop -b -n 1 >> /var/tmp/iotop.log 2>> /var/tmp/iotop.err
```

使用 Ansible，你可以以快速和一致的方式更新所有服务器上的 crontab 条目。你还可以使用一个简单的点对点 Ansible 命令来报告更新后的 crontab 的状态，以验证最近应用的变化。

### 3、收集服务器统计和 sars

在常规的故障排除过程中，为了诊断服务器性能或应用程序问题，你需要收集<ruby>系统活动报告<rt>system activity reports</rt></ruby>（sars）和服务器统计。在大多数情况下，服务器日志包含非常重要的信息，开发人员或运维团队需要这些信息来帮助解决影响整个环境的具体问题。

安全团队在进行调查时非常特别，大多数时候，他们希望查看多个服务器的日志。你需要找到一种简单的方法来收集这些文档。如果你能把收集任务委托给他们就更好了。

通过 [check_stats][8] 角色和 `c_stats.yml` 剧本来完成这个任务：

```
$ ansible-playbook -i inventory/hosts  playbooks/c_stats.yml

PLAY [Check Stats/sar for Servers] ***********************************************************************************************************************************

TASK [check_stats : Get current date time] ***************************************************************************************************************************
changed: [master]
changed: [workernode1]
.
截断...
.
PLAY RECAP ***********************************************************************************************************************************************************
master                     : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

输出看起来像这样：

```
$ cat /tmp/sar-workernode1-20210221214056.txt
-----------------------------------------------------
 sar output for workernode1
-----------------------------------------------------
Linux 4.18.0-193.el8.x86_64 (node1)     21/02/21        _x86_64_        (2 CPU)
21:39:30     LINUX RESTART      (2 CPU)
-----------------------------------------------------
```

### 4、收集服务器日志

除了收集服务器统计和 sars 信息，你还需要不时地收集日志，尤其是当你需要帮助调查问题时。

通过 [check_logs][9] 角色和 `r_cron.yml` 剧本来实现：

```
$ ansible-playbook -i inventory/hosts  playbooks/c_logs.yml -k
SSH password:

PLAY [Check Logs for Servers] ****************************************************************************************************************************************
.
截断...
.
TASK [check_logs : Capture Timestamp] ********************************************************************************************************************************
changed: [master]
changed: [workernode1]
PLAY RECAP ***********************************************************************************************************************************************************
master                     : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

为了确认输出，打开转储位置生成的文件。日志应该是这样的：

```
$ cat /tmp/logs-workernode1-20210221214758.txt | more
-----------------------------------------------------
 Logs gathered: /var/log/messages for workernode1
-----------------------------------------------------

Feb 21 18:00:27 node1 kernel: Command line: BOOT_IMAGE=(hd0,gpt2)/vmlinuz-4.18.0-193.el8.x86_64 root=/dev/mapper/rhel-root ro crashkernel=auto resume=/dev/mapper/rhel
-swap rd.lvm.lv=rhel/root rd.lvm.lv=rhel/swap rhgb quiet
Feb 21 18:00:27 node1 kernel: Disabled fast string operations
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Feb 21 18:00:27 node1 kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
```

### 5、安装或删除软件包和软件

你需要能够持续快速地在系统上安装和更新软件和软件包。缩短安装或更新软件包和软件所需的时间，可以避免服务器和应用程序不必要的停机时间。

通过 [install_tool][10] 角色和 `r_install.yml` 剧本来实现这一点：

```
$ ansible-playbook -i inventory/hosts playbooks/r_install.yml -k
SSH password:
PLAY [Install additional tools/packages] ***********************************************************************************

TASK [install_tool : Install specified tools in the role vars] *************************************************************
ok: [master] => (item=iotop)
ok: [workernode1] => (item=iotop)
ok: [workernode1] => (item=traceroute)
ok: [master] => (item=traceroute)

PLAY RECAP *****************************************************************************************************************
master                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

这个例子安装了在 vars 文件中定义的两个特定包和版本。使用 Ansible 自动化，你可以比手动安装更快地安装多个软件包或软件。你也可以使用 vars 文件来定义你要安装的软件包的版本。

```
$ cat roles/install_tool/vars/main.yml
---
# vars file for install_tool
ins_action: absent
package_list:
  - iotop-0.6-16.el8.noarch
  - traceroute
```

### 拥抱自动化

要成为一名有效率的系统管理员，你需要接受自动化来鼓励团队内部的标准化和协作。Ansible 使你能够在更少的时间内做更多的事情，这样你就可以将时间花在更令人兴奋的项目上，而不是做重复的任务，如管理你的事件和问题管理流程。

有了更多的空闲时间，你可以学习更多的知识，让自己可以迎接下一个职业机会的到来。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ansible-sysadmin

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://www.ansible.com/
[3]: https://opensource.com/tags/ansible
[4]: https://github.com/mikecali/6_sysadmin_tasks
[5]: https://github.com/mikecali/6_sysadmin_tasks/tree/main/roles/check_uptime
[6]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_templating.html
[7]: https://github.com/mikecali/6_sysadmin_tasks/tree/main/roles/install_cron
[8]: https://github.com/mikecali/6_sysadmin_tasks/tree/main/roles/check_stats
[9]: https://github.com/mikecali/6_sysadmin_tasks/tree/main/roles/check_logs
[10]: https://github.com/mikecali/6_sysadmin_tasks/tree/main/roles/install_tool
