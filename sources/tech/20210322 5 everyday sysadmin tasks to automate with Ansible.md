[#]: subject: (5 everyday sysadmin tasks to automate with Ansible)
[#]: via: (https://opensource.com/article/21/3/ansible-sysadmin)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 everyday sysadmin tasks to automate with Ansible
======
Get more efficient and avoid errors by automating repeatable daily tasks
with Ansible.
![Tips and gears turning][1]

If you hate performing repetitive tasks, then I have a proposition for you. Learn [Ansible][2]!

Ansible is a tool that will help you do your daily tasks easier and faster, so you can use your time in more effective ways, like learning new technology that matters. It's a great tool for sysadmins because it helps you achieve standardization and collaborate on daily activities, including:

  1. Installing, configuring, and provisioning servers and applications
  2. Updating and upgrading systems regularly
  3. Monitoring, mitigating, and troubleshooting issues



Typically, many of these essential daily tasks require manual steps that depend upon an individual's skills, creating inconsistencies and resulting in configuration drift. This might be OK in a small-scale implementation where you're managing one server and know what you are doing. But what happens when you are managing hundreds or thousands of servers?

If you are not careful, these manual, repeatable tasks can cause delays and issues because of human errors, and those errors might impact you and your organization's reputation.

This is where the value of automation comes into the picture. And [Ansible][3] is a perfect tool for automating these repeatable daily tasks.

Some of the reasons to automate are:

  1. You want a consistent and stable environment.
  2. You want to foster standardization.
  3. You want less downtime and fewer severe incident cases so you can enjoy your life.
  4. You want to have a beer instead of troubleshooting issues!



This article offers some examples of the daily tasks a sysadmin can automate using Ansible. I put the playbooks and roles from this article into a [sysadmin tasks repository][4] on GitHub to make it easier for you to use them.

These playbooks are structured like this (my notes are preceded with `==>`):


```
[root@homebase 6_sysadmin_tasks]# tree -L 2
.
├── ansible.cfg ===&gt; Ansible config file that is responsible for controlling how ansible behave
├── ansible.log
├── inventory
│   ├── group_vars
│   ├── hosts  ==&gt; the inventory file that contains the list of my target server
│   └── host_vars
├── LICENSE
├── playbooks  ==&gt; the directory that contains playbooks that we will be using for this article
│   ├── c_logs.yml
│   ├── c_stats.yml
│   ├── c_uptime.yml
│   ├── inventory
│   ├── r_cron.yml
│   ├── r_install.yml
│   └── r_script.yml
├── README.md
├── roles    ==&gt; the directory that contains the roles that we will be using in this article.
│   ├── check_logs
│   ├── check_stats
│   ├── check_uptime
│   ├── install_cron
│   ├── install_tool
│   └── run_scr
└── templates ==&gt; the directory that contains the jinja template
    ├── cron_output.txt.j2
    ├── sar.txt.j2
    └── scr_output.txt.j2
```

The inventory looks like this:


```
[root@homebase 6_sysadmin_tasks]# cat inventory/hosts
[rhel8]
master ansible_ssh_host=192.168.1.12
workernode1 ansible_ssh_host=192.168.1.15

[rhel8:vars]
ansible_user=ansible ==&gt; Please update this with your preferred ansible user
```

Here are five daily sysadmin tasks that you can automate with Ansible.

### 1\. Check server uptime

You need to make sure your servers are up and running all the time. Organizations have enterprise monitoring tools to monitor server and application uptime, but from time to time, the automated monitoring tools fail, and you need to jump in and verify a server's status. It takes a lot of time to verify each server's uptime manually. The more servers you have, the longer time you have to spend. But with automation, this verification can be done in minutes.

Use the [check_uptime][5] role and the `c_uptime.yml` playbook:


```
[root@homebase 6_sysadmin_tasks]# ansible-playbook -i inventory/hosts  playbooks/c_uptime.yml -k
SSH password:
PLAY [Check Uptime for Servers] ****************************************************************************************************************************************
TASK [check_uptime : Capture timestamp] *************************************************************************************************
.
snip...
.
PLAY RECAP *************************************************************************************************************************************************************
master                     : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
[root@homebase 6_sysadmin_tasks]#
```

The playbook's output looks like this:


```
[root@homebase 6_sysadmin_tasks]# cat /var/tmp/uptime-master-20210221004417.txt
\-----------------------------------------------------
 Uptime for  master
\-----------------------------------------------------
 00:44:17 up 44 min,  2 users,  load average: 0.01, 0.09, 0.09
\-----------------------------------------------------
[root@homebase 6_sysadmin_tasks]# cat /var/tmp/uptime-workernode1-20210221184525.txt
\-----------------------------------------------------
 Uptime for  workernode1
\-----------------------------------------------------
 18:45:26 up 44 min,  2 users,  load average: 0.01, 0.01, 0.00
\-----------------------------------------------------
```

Using Ansible, you can get the status of multiple servers in a human-readable format with less effort, and the [Jinja template][6] allows you to adjust the output based on your needs. With more automation, you can run this on a schedule and send the output through email for reporting purposes.

### 2\. Configure additional cron jobs

You need to update your servers' scheduled jobs regularly based on infrastructure and application requirements. This may seem like a menial job, but it has to be done correctly and consistently. Imagine the time this takes if you are doing this manually with hundreds of production servers. If it is done wrong, it can impact production applications, which can cause application downtime or impact server performance if scheduled jobs overlap.

Use the [install_cron][7] role and the `r_cron.yml` playbook:


```
[root@homebase 6_sysadmin_tasks]# ansible-playbook -i inventory/hosts playbooks/r_cron.yml -k
SSH password:
PLAY [Install additional cron jobs for root] ***************************************************************************************************************************
.
snip
.
PLAY RECAP *************************************************************************************************************************************************************
master                     : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Verify the playbook's results:


```
[root@homebase 6_sysadmin_tasks]# ansible -i inventory/hosts all -m shell -a "crontab -l" -k
SSH password:
master | CHANGED | rc=0 &gt;&gt;
1 2 3 4 5 /usr/bin/ls /tmp
#Ansible: Iotop Monitoring
0 5,2 * * * /usr/sbin/iotop -b -n 1 &gt;&gt; /var/tmp/iotop.log 2&gt;&gt; /var/tmp/iotop.err
workernode1 | CHANGED | rc=0 &gt;&gt;
1 2 3 4 5 /usr/bin/ls /tmp
#Ansible: Iotop Monitoring
0 5,2 * * * /usr/sbin/iotop -b -n 1 &gt;&gt; /var/tmp/iotop.log 2&gt;&gt; /var/tmp/iotop.err
```

Using Ansible, you can update the crontab entry on all your servers in a fast and consistent way. You can also report the updated crontab's status using a simple ad-hoc Ansible command to verify the recently applied changes.

### 3\. Gather server stats and sars

During routine troubleshooting and to diagnose server performance or application issues, you need to gather system activity reports (sars) and server stats. In most scenarios, server logs contain very important information that developers or ops teams need to help solve specific problems that affect the overall environment.

Security teams are very particular when conducting investigations, and most of the time, they want to look at logs for multiple servers. You need to find an easy way to collect this documentation. It's even better if you can delegate the collection task to them.

Do this with the [check_stats][8] role and the `c_stats.yml` playbook:


```
$ ansible-playbook -i inventory/hosts  playbooks/c_stats.yml

PLAY [Check Stats/sar for Servers] ***********************************************************************************************************************************

TASK [check_stats : Get current date time] ***************************************************************************************************************************
changed: [master]
changed: [workernode1]
.
snip...
.
PLAY RECAP ***********************************************************************************************************************************************************
master                     : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

The output will look like this:


```
$ cat /tmp/sar-workernode1-20210221214056.txt
\-----------------------------------------------------
 sar output for workernode1
\-----------------------------------------------------
Linux 4.18.0-193.el8.x86_64 (node1)     21/02/21        _x86_64_        (2 CPU)
21:39:30     LINUX RESTART      (2 CPU)
\-----------------------------------------------------
```

### 4\. Collect server logs

In addition to gathering server stats and sars information, you will also need to collect logs from time to time, especially if you need to help investigate issues.

Do this with the [check_logs][9] role and the `r_cron.yml` playbook:


```
$ ansible-playbook -i inventory/hosts  playbooks/c_logs.yml -k
SSH password:

PLAY [Check Logs for Servers] ****************************************************************************************************************************************
.
snip
.
TASK [check_logs : Capture Timestamp] ********************************************************************************************************************************
changed: [master]
changed: [workernode1]
PLAY RECAP ***********************************************************************************************************************************************************
master                     : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

To confirm the output, open the files generated in the dump location. The logs should look like this:


```
$ cat /tmp/logs-workernode1-20210221214758.txt | more
\-----------------------------------------------------
 Logs gathered: /var/log/messages for workernode1
\-----------------------------------------------------

Feb 21 18:00:27 node1 kernel: Command line: BOOT_IMAGE=(hd0,gpt2)/vmlinuz-4.18.0-193.el8.x86_64 root=/dev/mapper/rhel-root ro crashkernel=auto resume=/dev/mapper/rhel
-swap rd.lvm.lv=rhel/root rd.lvm.lv=rhel/swap rhgb quiet
Feb 21 18:00:27 node1 kernel: Disabled fast string operations
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Feb 21 18:00:27 node1 kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Feb 21 18:00:27 node1 kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
```

### 5\. Install or remove packages and software

You need to be able to install and update software and packages on your systems consistently and rapidly. Reducing the time it takes to install or update packages and software avoids unnecessary downtime of servers and applications.

Do this with the [install_tool][10] role and the `r_install.yml` playbook:


```
$ ansible-playbook -i inventory/hosts playbooks/r_install.yml -k
SSH password:
PLAY [Install additional tools/packages] ***********************************************************************************

TASK [install_tool : Install specified tools in the role vars] *************************************************************
ok: [master] =&gt; (item=iotop)
ok: [workernode1] =&gt; (item=iotop)
ok: [workernode1] =&gt; (item=traceroute)
ok: [master] =&gt; (item=traceroute)

PLAY RECAP *****************************************************************************************************************
master                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
workernode1                : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

This example installs two specific packages and versions defined in a vars file. Using Ansible automation, you can install multiple packages or software faster than doing it manually. You can also use the vars file to define the version of the packages that you want to install:


```
$ cat roles/install_tool/vars/main.yml
\---
# vars file for install_tool
ins_action: absent
package_list:
  - iotop-0.6-16.el8.noarch
  - traceroute
```

### Embrace automation

To be an effective sysadmin, you need to embrace automation to encourage standardization and collaboration within your team. Ansible enables you to do more in less time so that you can spend your time on more exciting projects instead of doing repeatable tasks like managing your incident and problem management processes.

With more free time on your hands, you can learn more and make yourself available for the next career opportunity that comes your way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ansible-sysadmin

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
