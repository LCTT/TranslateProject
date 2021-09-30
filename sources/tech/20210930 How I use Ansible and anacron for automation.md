[#]: subject: "How I use Ansible and anacron for automation"
[#]: via: "https://opensource.com/article/21/9/ansible-anacron-automation"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use Ansible and anacron for automation
======
With anacron, I can drop scripts and Ansible playbooks into place for
all manner of trivial tasks.
![Woman programming][1]

Automation is the great IT and DevOps ideal, but in my experience, anything that's not immediately convenient may as well not exist at all. There have been many times when I've come up with a pretty good solution for some task, and I'll even script it, but I stop short of making it literally automated because the infrastructure for easy automation doesn't exist on the machine I'm working on.

My favorite easy automation tool used to be the cron system—old, reliable, user-facing, and (aside from a scheduling syntax I can never commit to memory) simple. However, the problem with cron is that it assumes a computer is on 24 hours a day, every day. After missing one too many scheduled backups, I discovered [anacron][2], the cron system based on timestamps rather than scheduled times. If your computer is off when a job would typically have run, anacron ensures that it's run when the computer is back on. Creating a job is as easy as dropping a shell script into one of three directories: `cron.daily`, `cron.weekly`, or `cron.monthly` (you can define more if you want). With anacron, I find myself dropping scripts and Ansible playbooks into place for all manner of trivial tasks, including pop-up reminders of upcoming due dates or events.

It's a simple and obvious solution to a modern problem, but it does me no good if anacron isn't installed on the computer.

### Software setup with Ansible

Any time I set up a new computer, whether it's a laptop, workstation, or server, I install anacron. That's easy, but an anacron install only provides the anacron command. It doesn't set up the anacron user environment. So I created an Ansible playbook to set up what the user needs to use anacron and install the anacron command.

First, the standard Ansible boilerplate:


```
\---
\- hosts: localhost
  tasks:
```

### Creating directories with Ansible

Next, I create the directory tree I use for anacron. You can think of this as a sort of transparent crontab.


```
    - name: create directory tree
      ansible.builtin.file:
        path: "{{ item }}"
        state: directory
      with_items:
        - '~/.local/etc/cron.daily'
        - '~/.local/etc/cron.weekly'
        - '~/.local/etc/cron.monthly'
        - '~/.var/spool/anacron'
```

The syntax of this might seem a little strange, but it's actually a loop. The `with_items:` directive defines four directories to create, and Ansible iterates over the `ansible.builtin.file:` directive once for each directory (the directory name populates the `{{ item }}` variable). As with everything in Ansible, there's no error or conflict if the directory already exists.

### Copying files with Ansible

The `ansible.builtin.copy` module copies files from one location to another. For this to work, I needed to create a file called `anacrontab`. It's not an Ansible playbook, so I keep it in my `~/Ansible/data` directory, where I keep support files for my playbooks.


```
    - name: copy anacrontab into place
      ansible.builtin.copy:
        src: ~/Ansible/data/anacrontab
        dest: ~/.local/etc/anacrontab
        mode: '0755'
```

My `anacrontab` file is simple and mimics the one some distributions install by default into `/etc/anacron`:


```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
1  0  cron.day    run-parts $HOME/.local/etc/cron.daily/
7  0  cron.wek    run-parts $HOME/.local/etc/cron.weekly/
30 0  cron.mon    run-parts $HOME/.local/etc/cron.monthly/
```

### Running anacron on login

Most Linux distributions configure anacron to read jobs from `/etc/anacron`. I mostly use anacron as a regular user, so I launch anacron from my login `~/.profile`. I don't want to have to remember to configure that myself, so I have Ansible do it. I use the `ansible.builtin.lineinfile` module, which creates `~/.profile` if it doesn't already exist and inserts the anacron launch line.


```
    - name: add local anacrontab to .profile
      ansible.builtin.lineinfile:
        path: ~/.profile
        regexp: '^/usr/sbin/anacron'
        line: '/usr/sbin/anacron -t ~/.local/etc/anacrontab'
        create: true
```

### Installing anacron with Ansible

For most of my systems, the `dnf` module would work for package installation, but my workstation runs Slackware (which uses `slackpkg`), and sometimes a different Linux distro makes its way into my collection. The `ansible.builtin.package` module provides a generic interface to package installation, so I use it for this playbook. Luckily, I haven't come across a repo that names `anacron` anything but `anacron`, so for now, I don't have to account for potential differences in package names.

This is actually a separate play because package installation requires privilege escalation, provided by the `becomes: true` directive.


```
\- hosts: localhost
  become: true
  tasks:
    - name: install anacron
      ansible.builtin.package:
        name: anacron
        state: present
```

### Using anacron and Ansible for easy automation

To install anacron with Ansible, I run the playbook:


```
`$ ansible-playbook ~/Ansible/setup-anacron.yaml`
```

From then on, I can write shell scripts to perform some trivial but repetitive task and copy it into `~/.local/etc/cron.daily` to have it automatically run once a day (or thereabouts). I also write Ansible playbooks for tasks such as [cleaning out my downloads folder][3]. I place my playbooks in `~/Ansible`, which is where I keep my Ansible plays, and then create a shell script in `~/.local/etc/cron.daily` to execute the play. It's easy, painless, and quickly becomes second nature.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/ansible-anacron-automation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/21/9/keep-folders-tidy-ansible
