[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My first day using Ansible)
[#]: via: (https://opensource.com/article/20/10/first-day-ansible)
[#]: author: (David Both https://opensource.com/users/dboth)

My first day using Ansible
======
A sysadmin shares information and advice about putting Ansible into
real-world use configuring computers on his network.
![People work on a computer server with devices][1]

Getting a new computer, whether physical or virtual, up and running is time-consuming and requires a good deal of work—whether it's your first time or the 50th. For many years, I have used a series of scripts and RPMs that I created to install the packages I need and to perform many bits of configuration for my favorite tools. This approach has worked well and simplified my work, as well as reduced the amount of time I spend typing commands.

I am always looking for better ways of doing things, and, for several years now, I have been hearing and reading about [Ansible][2], which is a powerful tool for automating system configuration and management. Ansible allows a sysadmin to define a specific state for each host in one or more playbooks and then performs whatever tasks are necessary to bring the host to that state. This includes installing or deleting various resources such as RPM or Apt packages, configuration and other files, users, groups, and much more.

I have delayed learning how to use it for a long time because—stuff. Until recently, when I ran into a problem that I thought Ansible could easily solve.

This article is not a complete how-to for getting started with Ansible; rather, it is intended to provide insight into some of the issues that I encountered and some information that I found only in some very obscure places. Much of the information I found in various online discussions and Q&amp;A groups about Ansible was incorrect. Errors ranged from information that was really old with no indication of its date or provenance to information that was just wrong.

The information in this article is known to work—although there might be other ways of accomplishing the same things—and it works with Ansible 2.9.13 and [Python][3] 3.8.5.

### My problem

All of my best learning experiences start with a problem I need to solve, and this was no exception.

I have been working on a little project to modify the configuration files for the [Midnight Commander][4] (mc) file manager and pushing them out to various systems on my network for testing. Although I have a script to automate this, it still requires a bit of fussing with a command-line loop to provide the names of the systems to which I want to push the new code. The large number of changes I was making to the configuration files made it necessary for me to push the new ones frequently. But, just when I thought I had my new configuration just right, I would find a problem and need to do another push after making the fix.

This environment made it difficult to keep track of which systems had the new files and which did not. I also have a couple of hosts that need to be treated differently. And my little bit of knowledge about Ansible suggested that it would probably be able to do all or most of what I need.

### Getting started

I had read a number of good articles and books about Ansible, but never in an "I have to get this working NOW!" kind of situation. And now was—well, NOW!

In rereading these documents, I discovered that they mostly talk about how to install Ansible from GitHub using—wait for it—Ansible. That is cool, but I really just wanted to get started, so I installed it on my Fedora workstation using DNF and the version in the Fedora repository. Easy.

But then I started looking for the file locations and trying to determine which configuration files I needed to modify, where to keep my playbooks, what a playbook even looks like, and what it does. I had lots of (so far) unanswered questions running around in my head.

So, without further descriptions of my tribulations, here are the things I discovered and that got me going.

### Configuration

Ansible's configuration files are kept in `/etc/ansible`. Makes sense, right, since `/etc` is where system programs are supposed to keep their configuration files. The two files I needed to work with are `ansible.cfg` and `hosts`.

#### ansible.cfg

After getting started with some of the exercises I found in the documents and online, I began receiving warning messages about deprecating certain older Python files. So, I set `deprecation_warnings` to `false` in `ansible.cfg` and those angry red warning messages stopped:


```
`deprecation_warnings = False`
```

Those warnings are important, so I will revisit them later and figure out what I need to do. But for now, they no longer clutter the screen and obfuscate the errors I actually need to be concerned about.

#### The hosts file

Not the same as the `/etc/hosts` file, the `hosts` file is also known as the inventory file, and it lists the hosts on your network. This file allows grouping hosts together in related sets, such as servers, workstations, and pretty much any designation you need. This file contains its own help and plenty of examples, so I won't go into boring detail here. However, there are some things to know.

Hosts can be listed outside of any groups, but groups can be helpful in identifying hosts with one or more common characteristics. Groups use the INI format, so a server group looks like this:


```
[servers]
server1
server2
...etc.
```

A hostname must be present in this file for Ansible to work on it. Even though some subcommands allow you to specify a hostname, the command will fail unless the hostname is in the `hosts` file. A host can also be listed in multiple groups. So `server1` might also be a member of the `[webservers]` group in addition to the `[servers]` group, and a member of the `[ubuntu]` group to differentiate it from Fedora servers.

Ansible is smart. If the `all` argument is used for the hostname, Ansible scans the file and performs the defined tasks on all hosts listed in the file. Ansible will only attempt to work on each host once, no matter how many groups it appears in. This also means that there does not need to be a defined "all" group because Ansible can determine all hostnames in the file and create its own list of unique hostnames.

Another little thing to look out for is multiple entries for a single host. I use `CNAME` records in my DNS zone file to create aliased names that point to the [A records][5] for some of my hosts. That way, I can refer to a host as `host1` or `h1` or `myhost`. If you use multiple hostnames for the same host in the `hosts` file, Ansible will try to perform its tasks on all of those hostnames; it has no way of knowing that they refer to the same host. The good news is that this does not affect the overall result; it just takes a bit more time as Ansible works on the secondary hostnames and determines that all of the operations have already been performed.

### Ansible facts

Most of the materials I have read on Ansible talk about [Ansible facts][6], which "are data related to your remote systems, including operating systems, IP addresses, attached filesystems, and more." This information is available in other ways, such as `lshw`, `dmidecode`, the `/proc` filesystem, and more, but Ansible generates a JSON file containing this information. Each time Ansible runs, it generates this facts data. There is an amazing amount of information in this data stream, all of which are in `<"variable-name": "value">` pairs. All of these variables are available for use within an Ansible playbook. The best way to understand the huge amount of information available is to display it yourself:


```
`# ansible -m setup <hostname> | less`
```

See what I mean? Everything you ever wanted to know about your host hardware and Linux distribution is there and usable in a playbook. I have not yet gotten to the point where I need to use those variables, but I am certain I will in the next couple of days.

### Modules

The `ansible` command above uses the `-m` option to specify the "setup" module. Ansible has many modules already built-in, so you do not need to use the `-m` for those. There are also many downloadable modules that can be installed, but the built-ins do everything I have needed for my current projects so far.

### Playbooks

Playbooks can be located almost anywhere. Since I need to run my playbooks as root, I placed mine in `/root/ansible`. As long as this directory is the present working directory (PWD) when I run Ansible, it can find my playbook. Ansible also has a runtime option to specify a different playbook and location.

Playbooks can contain comments, although I have seen very few articles or books that mention this. As a sysadmin who believes in documenting everything, I find using comments can be very helpful. This is not so much about saying the same things in the comments as I do in the task name; rather, it is about identifying the purpose of groups of tasks and ensuring that I record my reasons for doing certain things in a certain way or order. This can help with debugging problems later when I may have forgotten my original thinking.

Playbooks are simply collections of tasks that define the desired state of a host. A hostname or inventory group is specified at the beginning of the playbook and defines the hosts on which Ansible will run the playbook.

Here is a sample of my playbook:


```
################################################################################
# This Ansible playbook updates Midnight commander configuration files.        #
################################################################################
\- name: Update midnight commander configuration files
  hosts: all
 
  tasks:
  - name: ensure midnight commander is the latest version
    dnf:
      name: mc
      state: present

  - name: create ~/.config/mc directory for root
    file:
      path: /root/.config/mc
      state: directory
      mode: 0755
      owner: root
      group: root

  - name: create ~/.config/mc directory for dboth
    file:
      path: /home/dboth/.config/mc
      state: directory
      mode: 0755
      owner: dboth
      group: dboth

  - name: copy latest personal skin
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/DavidsGoTar.ini
      dest: /usr/share/mc/skins/DavidsGoTar.ini
      mode: 0644
      owner: root
      group: root

  - name: copy latest mc ini file
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/ini
      dest: /root/.config/mc/ini
      mode: 0644
      owner: root
      group: root

  - name: copy latest mc panels.ini file
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/panels.ini
      dest: /root/.config/mc/panels.ini
      mode: 0644
      owner: root
      group: root
&lt;SNIP&gt;
```

The playbook starts with its own name and the hosts it will act on—in this case, all of the hosts listed in my `hosts` file. The `tasks` section lists the specific tasks required to bring the host into compliance with the desired state. This playbook starts with a task in which Ansible's built-in DNF updates Midnight Commander if it is not the most recent release. The next tasks ensure that the required directories are created if they do not exist, and the remainder of the tasks copy the files to the proper locations. These `file` and `copy` tasks can also set the ownership and file modes for the directories and files.

The details of my playbook are beyond the scope of this article, but I used a bit of a brute-force attack on the problem. There are other methods for determining which users need to have the files updated rather than using a task for each file for each user. My next objective is to simplify this playbook to use some of the more advanced techniques.

Running a playbook is easy; just use the `ansible-playbook` command. The .yml extension stands for YAML. I have seen several meanings for that, but my bet is on "Yet Another Markup Language," despite the fact that some claim that YAML is not one.

This command runs the playbook I created for updating my Midnight Commander files:


```
`# ansible-playbook -f 10 UpdateMC.yml`
```

The `-f` option specifies that Ansible should fork up to 10 threads in order to perform operations in parallel. This can greatly speed overall task completion, especially when working on multiple hosts.

### Output

The output from a running playbook lists each task and the results. An `ok` means the machine state managed by the task is already defined in the task stanza. Because the state defined in the task is already true, Ansible did not need to perform the actions defined in the task stanza.

The response `changed` indicates that Ansible performed the task specified in the stanza in order to bring it to the desired state. In this case, the machine state defined in the stanza was not true, so the actions defined were performed to make it true. On a color-capable terminal, the `TASK` lines are shown in color. On my host with my amber-on-black terminal color configuration, the `TASK` lines are shown in amber, `changed` lines are in brown, and `ok` lines are shown in green. Error lines are displayed in red.

The following output is from the playbook I will eventually use to perform post-install configuration on new hosts:


```
PLAY [Post-installation updates, package installation, and configuration]

TASK [Gathering Facts]
ok: [testvm2]

TASK [Ensure we have connectivity]
ok: [testvm2]

TASK [Install all current updates]
changed: [testvm2]

TASK [Install a few command line tools]
changed: [testvm2]

TASK [copy latest personal Midnight Commander skin to /usr/share]
changed: [testvm2]

TASK [create ~/.config/mc directory for root]
changed: [testvm2]

TASK [Copy the most current Midnight Commander configuration files to /root/.config/mc]
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/DavidsGoTar.ini)
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/ini)
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/panels.ini)

TASK [create ~/.config/mc directory in /etc/skel]
changed: [testvm2]

&lt;SNIP&gt;
```

### The cow

If you have the [cowsay][7] program installed on your computer, you will notice that the `TASK` names appear in the cow's speech bubble:


```
 ____________________________________
&lt; TASK [Ensure we have connectivity] &gt;
 ------------------------------------
        \   ^__^
         \  (oo)\\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

If you do not have this fun feature and want it, install the cowsay package using your distribution's package manager. If you have this and don't want it, disable it with by setting `nocows = 1` in the `/etc/ansible/ansible.cfg` file.

I like the cow and think it is fun, but it reduces the amount of screen space that can be used to display messages. So I disabled it after it started getting in the way.

### Files

As with my Midnight Commander task, it is frequently necessary to install and maintain files of various types. There are as many "best practices" for creating a directory tree for storing files used in playbooks as there are sysadmins—or at least as many as the number of authors writing books and articles about Ansible.

I chose a simple structure that makes sense to me:


```
/root/ansible
└── UpdateMC
    ├── files
    │   └── MidnightCommander
    │       ├── DavidsGoTar.ini
    │       ├── ini
    │       └── panels.ini
    └── UpdateMC.yml
```

You should use whatever structure works for you. Just be aware that some other sysadmin will likely need to work with whatever you set up, so there should be some level of logic to it. When I was using RPM and Bash scripts to perform my post-install tasks, my file repository was a bit scattered and definitely not structured with any logic. As I work through creating playbooks for many of my administrative tasks, I will introduce a much more logical structure for managing my files.

### Multiple playbook runs

It is safe to run a playbook as many times as needed or desired. Each task will only be executed if the state does not match the one specified in the task stanza. This makes it easy to recover from errors encountered during previous playbook runs. The playbook stops running when it encounters an error.

While testing my first playbook, I made many mistakes and corrected them. Each additional run of the playbook—assuming my fix is a good one—skips the tasks whose state already matches the specified one and executes those that did not. When my fix works, the previously failed task completes successfully, and any tasks after that one in my playbook also execute—until it encounters another error.

This also makes testing easy. I can add new tasks and, when I run the playbook, only those new tasks are performed because they are the only ones that do not match the test host's desired state.

### Some thoughts

Some tasks are not appropriate for Ansible because there are better methods for achieving a specific machine state. The use case that comes to mind is that of returning a VM to an initial state so that it can be used as many times as necessary to perform testing beginning with that known state. It is much easier to get the VM into the desired state and then to take a snapshot of the then-current machine state. Reverting to that snapshot is usually going to be easier and much faster than using Ansible to return the host to that desired state. This is something I do several times a day when researching articles or testing new code.

After completing my playbook for updating Midnight Commander, I started a new playbook that I will use to perform post-installation tasks on newly installed Fedora hosts. I have already made good progress, and the playbook is a bit more sophisticated and less brute-force than my first one.

On my very first day using Ansible, I created a playbook that solves a problem. I also started a second playbook that will solve the very big problem of post-install configuration. And I have learned a lot.

Although I really like using [Bash][8] scripts for many of my administrative tasks, I am already finding that Ansible can do everything I want—and in a way that can maintain the system in the state I want. After only a single day of use, I am an Ansible fan.

### Resources

The most complete and useful document I have found is the [User Guide][9] on the Ansible website. This document is intended as a reference and not a how-to or getting-started document.

Opensource.com has published many [articles about Ansible][10] over the years, and I have found most of them very helpful for my needs. The Enable Sysadmin website also has a lot of [Ansible articles][11] that I have found to be helpful. You can learn even more by checking out [AnsibleFest][12] happening this week (October 13-14, 2020). The event is completely virtual and free to register.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/first-day-ansible

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://www.ansible.com/
[3]: https://www.python.org/
[4]: https://midnight-commander.org/
[5]: https://en.wikipedia.org/wiki/List_of_DNS_record_types
[6]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html#ansible-facts
[7]: https://en.wikipedia.org/wiki/Cowsay
[8]: https://opensource.com/downloads/bash-cheat-sheet
[9]: https://docs.ansible.com/ansible/latest/user_guide/index.html
[10]: https://opensource.com/tags/ansible
[11]: https://www.redhat.com/sysadmin/topics/ansible
[12]: https://www.ansible.com/ansiblefest
