[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ops tasks to do with Ansible)
[#]: via: (https://opensource.com/article/19/8/ops-tasks-ansible)
[#]: author: (Mark Phillips https://opensource.com/users/markphttps://opensource.com/users/adminhttps://opensource.com/users/alsweigarthttps://opensource.com/users/belljennifer43)

5 ops tasks to do with Ansible
======
Less DevOps, more OpsDev.
![gears and lightbulb to represent innovation][1]

In this DevOps world, it sometimes appears the Dev half gets all the limelight, with Ops the forgotten half in the relationship. It's almost as if the leading Dev tells the trailing Ops what to do, with almost everything "Ops" being whatever Dev says it should be. Ops, therefore, gets left behind, punted to the back, relegated to the bench.

I'd like to see more OpsDev happening. So let's look at a handful of things Ansible can help you do with your day-to-day Ops life. 

![Job templates][2]

I've chosen to present these solutions within [Ansible Tower][3] because I think a user interface (UI) adds value to most of these tasks. If you want to emulate this, you can test it out in [AWX][4], the upstream open source version of Tower.

### Manage users

In a large-scale environment, your users would be centralised in a system like Active Directory or LDAP. But I bet there are still a whole load of environments with lots of static users in them, too. Ansible can help you centralise that decentralised problem. And _the community_ has already solved it for us. Meet the [Ansible Galaxy][5] role **[users][6]**.

What's clever about this role is it allows us to manage users via *data—*no changes to play logic required.

![User data][7]

With simple data structures, we can add, remove and modify static users on a system. Very useful.

### Manage sudo

Privilege escalation comes [in many forms][8], but one of the most popular is [sudo][9]. It's relatively easy to manage sudo through discrete files per user, group, etc. But some folk get nervous about giving privilege escalation willy-nilly and prefer it to be time-bound. So [here's a take on that][10], using the simple **at** command to put a time limit on the granted access.

![Managing sudo][11]

### Manage services

Wouldn't it be great to give a [menu][12] to an entry-level ops team so they could just restart certain services? Voila!

![Managing services][13]

### Manage disk space

Here's [a simple role][14] that can be used to look for files larger than size _N_ in a particular directory. Doing this in Tower, we have the bonus of enabling [callbacks][15]. Imagine your monitoring solution spotting a filesystem going over X% full and triggering a job in Tower to go find out what files are the cause.

![Managing disk space][16]

### Debug a system performance problem

[This role][17] is fairly simple: it runs some commands and prints the output. The details are printed at the end of the run for you, sysadmin, to cast your skilled eyes over. Bonus homework: use [regexs][18] to find certain conditions in the output (CPU hog over 80%, say).

![Debugging system performance][19]

### Summary

I've recorded a short video of these five tasks in action. You can find all [the code on GitHub][20] too!

Michael DeHaan is the guy who created, in his own words, "that Ansible thing." A lot of the things...

A little bit of coding knowledge can let anyone write small scripts to do these tasks and save them...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/ops-tasks-ansible

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markphttps://opensource.com/users/adminhttps://opensource.com/users/alsweigarthttps://opensource.com/users/belljennifer43
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://opensource.com/sites/default/files/uploads/00_templates.png (Job templates)
[3]: https://www.ansible.com/products/tower
[4]: https://github.com/ansible/awx
[5]: https://galaxy.ansible.com
[6]: https://galaxy.ansible.com/singleplatform-eng/users
[7]: https://opensource.com/sites/default/files/uploads/01_users_data.png (User data)
[8]: https://docs.ansible.com/ansible/latest/plugins/become.html
[9]: https://www.sudo.ws/intro.html
[10]: https://github.com/phips/ansible-demos/tree/master/roles/sudo
[11]: https://opensource.com/sites/default/files/uploads/02_sudo.png (Managing sudo)
[12]: https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#surveys
[13]: https://opensource.com/sites/default/files/uploads/03_services.png (Managing services)
[14]: https://github.com/phips/ansible-demos/tree/master/roles/disk
[15]: https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#provisioning-callbacks
[16]: https://opensource.com/sites/default/files/uploads/04_diskspace.png (Managing disk space)
[17]: https://github.com/phips/ansible-demos/tree/master/roles/gather_debug
[18]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html#regular-expression-filters
[19]: https://opensource.com/sites/default/files/uploads/05_debug.png (Debugging system performance)
[20]: https://github.com/phips/ansible-demos
