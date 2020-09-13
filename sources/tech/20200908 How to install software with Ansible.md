[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install software with Ansible)
[#]: via: (https://opensource.com/article/20/9/install-packages-ansible)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to install software with Ansible
======
Automate software installations and updates across your devices with
Ansible playbooks.
![Puzzle pieces coming together to form a computer screen][1]

Ansible is a popular automation tool used by sysadmins and developers to keep their computer systems in prime condition. As is often the case with extensible frameworks, [Ansible][2] has limited use on its own, with its real power dwelling in its many modules. Ansible modules are, in a way, what commands are to a [Linux][3] computer. They provide solutions to specific problems, and one common task when maintaining computers is keeping all the ones you use updated and consistent.

I used to use a text list of packages to keep my systems more or less synchronized: I'd list the packages installed on my laptop and then cross-reference that with my desktop, or between one server and another server, making up for any difference manually. Of course, installing and maintaining applications on a Linux machine is a basic task for Ansible, and it means you can list what you want across all computers under your care.

### Finding the right Ansible module

The number of Ansible modules can be overwhelming. How do you find the one you need for a given task? In Linux, you might look in your Applications menu or in `/usr/bin` to discover new applications to run. When you're using Ansible, you refer to the [Ansible module index][4].

The index is listed primarily by category. With a little searching, you're very likely to find a module for whatever you need. For package management, the [Packaging modules][5] section contains a module for nearly any system with a package manager.

### Writing an Ansible playbook

To begin, choose the package manager on your local computer. For instance, if you're going to write your Ansible instructions (a "playbook," as it's called in Ansible) on a laptop running Fedora, start with the `dnf` module. If you're writing on Elementary OS, use the `apt` module, and so on. This gets you started with something you can test and verify as you go, and you can expand your work for your other computers later.

The first step is to create a directory representing your playbook. This isn't strictly necessary, but it's a good idea to establish the habit. Ansible can run with just a configuration file written in YAML, but if you want to expand your playbook later, you can control Ansible by how you lay out your directories and files. For now, just create a directory called `install_packages` or similar:


```
`$ mkdir ~/install_packages`
```

The file that serves as the Ansible playbook can be named anything you like, but it's traditional to name it `site.yml`:


```
`$ touch ~/install_packages/site.yml`
```

Open `site.yml` in your favorite text editor, and add this:


```
\---
\- hosts: localhost
  tasks:
    - name: install packages
      become: true
      become_user: root
      dnf:
        state: present
        name:
         - tcsh
         - htop
```

You must adjust the module name you use to match the distribution you're using. In this example, I used `dnf` because I wrote the playbook on Fedora Linux.

Like with a command in a Linux terminal, knowing _how_ to invoke an Ansible module is half the battle. This playbook example follows the standard playbook format:

  * `hosts` targets a computer or computers. In this case, the computer being targeted is `localhost`, which is the computer you're using right now (as opposed to a remote system you want Ansible to connect with).
  * `tasks` opens a list of tasks you want to be performed on the hosts.
    * `name` is a human-friendly title for a task. In this case, I'm using `install packages` because that's what this task is doing.
    * `become` permits Ansible to change which user is running this task.
    * `become_user` permits Ansible to become the `root` user to run this task. This is necessary because only the root user can install new applications using `dnf`.
    * `dnf` is the name of the module, which you discovered from the module index on the Ansible website.



The items under the `dnf` item are specific to the `dnf` module. This is where the module documentation is essential. Like a man page for a Linux command, the module documentation tells you what options are available and what kinds of arguments are required.

![Ansible documentation][6]

Ansible module documentation (Seth Kenlon, [CC BY-SA 4.0][7])

Package installation is a relatively simple task and only requires two elements. The `state` option instructs Ansible to check whether or not _some package_ is present on the system, and the `name` option lists which packages to look for. Ansible deals in machine _state_, so module instructions always imply change. Should Ansible scan a system and find a conflict between how a playbook describes a system (in this case, that the commands `tcsh` and `htop` are present) and what the system state actually is (in this example, `tcsh` and `htop` are not present), then Ansible's task is to make whatever changes are necessary for the system to match the playbook. Ansible can make those changes because of the `dnf` (or `apt` or whatever your package manager is) module.

Each module is likely to have a different set of options, so when you're writing playbooks, anticipate referring to the module documentation often. Until you're very familiar with a module, it's the only reasonable way to expect a module to do what you need it to do.

### Verifying YAML

Playbooks are written in YAML. Because YAML adheres to a strict syntax, it's helpful to install the `yamllint` command to check (or "lint," in computer terminology) your work. Better still, there's a linter specific to Ansible called `ansible-lint` created specifically for playbooks. Install these before continuing.

On Fedora or CentOS:


```
`$ sudo dnf install yamllint python3-ansible-lint`
```

On Debian, Elementary, Ubuntu, or similar:


```
`$ sudo apt install yamllint ansible-lint`
```

Verify your playbook with `ansible-lint`. If you don't have access to `ansible-lint`, you can use `yamllint`.


```
`$ ansible-lint ~/install_packages/site.yml`
```

Success returns nothing, but if there are errors in your file, you must fix them before continuing. Common errors from copying and pasting include omitting a newline character at the end of the final line and using tabs instead of spaces for indentation. Fix them in a text editor, rerun the linter, and repeat this process until you get no feedback from `ansible-lint` or `yamllint`.

### Installing an application with Ansible

Now that you have a verifiably valid playbook, you can finally run it on your local machine. Because you happen to know that the task defined by the playbook requires root permissions, you must use the `--ask-become-pass` option when invoking Ansible, so you will be prompted for your administrative password.

Start the installation:


```
$ ansible-playbook --ask-become-pass ~/install_packages/site.yml
BECOME password:
PLAY [localhost] ******************************

TASK [Gathering Facts] ******************************
ok: [localhost]

TASK [install packages] ******************************
ok: [localhost]

PLAY RECAP ******************************
localhost: ok=0 changed=2 unreachable=0 failed=0 [...]
```

The commands are installed, leaving the target system in an identical state to the one described by the playbook.

### Installing an application on remote systems

Going through all of that to replace one simple command would be counterproductive, but Ansible's advantage is that it can be automated across all of your systems. You can use conditional statements to cause Ansible to use a specific module on different systems, but for now, assume all your computers use the same package manager.

To connect to a remote system, you must define the remote system in the `/etc/ansible/hosts` file. This file was installed along with Ansible, so it already exists, but it's probably empty, aside from explanatory comments. Use `sudo` to open the file in your favorite text editor.

You can define a host by its IP address or hostname, as long as the hostname can be resolved. For instance, if you've already defined `liavara` in `/etc/hosts` and can successfully ping it, then you can set `liavara` as a host in `/etc/ansible/hosts`. Alternately, if you're running a domain name server or Avahi server and can ping `liavara`, then you can set it as a host in `/etc/ansible/hosts`. Otherwise, you must use its internet protocol address.

You also must have set up a successful secure shell (SSH) connection to your target hosts. The easiest way to do that is with the `ssh-copy-id` command, but if you've never set up an SSH connection with a host before, [read my article on how to create an automated SSH connection][8].

Once you've entered the hostname or IP address in the `/etc/ansible/hosts` file, change the `hosts` definition in your playbook:


```
\---
\- hosts: all
  tasks:
    - name: install packages
      become: true
      become_user: root
      dnf:
        state: present
        name:
         - tcsh
         - htop
```

Run `ansible-playbook` again:


```
`$ ansible-playbook --ask-become-pass ~/install_packages/site.yml`
```

This time, the playbook runs on your remote system.

Should you add more hosts, there are many ways to filter which host performs which task. For instance, you can create groups of hosts (`webservers` for servers, `workstations` for desktop machines, and so on).

### Ansible for mixed environments

The logic used in the solution so far assumes that all hosts being configured by Ansible run the same OS (specifically, one that uses the **dnf** command for package management). So what do you do if you're managing hosts running a different distribution, such as Ubuntu (which uses **apt**) or Arch (using **pacman**), or even different operating systems?

As long as the targeted OS has a package manager (and these days even [MacOS has Homebrew][9] and [Windows has Chocolatey][10]), Ansible can help.

This is where Ansible's advantage becomes most apparent. In a shell script, you'd have to check for what package manager is available on the target host, and even with pure Python you'd have to check for the OS. Ansible not only has those checks built in, but it also has mechanisms to use the results in your playbook. Instead of using the **dnf** module, you can use the **action** keyword to perform tasks defined by variables provided by Ansible's fact gathering subsystem.


```
\---
\- hosts: all
  tasks:
    - name: install packages
      become: true
      become_user: root
      action: &gt;
       {{ ansible_pkg_mgr }} name=htop,transmission state=present update_cache=yes
```

The **action** keyword loads action plugins. In this example, it's using the **ansible_pkg_mgr** variable, which is populated by Ansible during the initial **Gathering Facts** task. You don't have to tell Ansible to gather facts about the OS it's running on, so it's easy to overlook it, but when you run a playbook, you see it listed in the default output:


```
TASK [Gathering Facts] *****************************************
ok: [localhost]
```

The **action** plugin uses information from this probe to populate **ansible_pkg_mgr** with the relevant package manager command to install the packages listed after the **name** argument. With 8 lines of code, you can overcome a complex cross-platform quandary that few other scripting options allow.

### Use Ansible

It's the 21st century, and we all expect our computing devices to be connected and relatively consistent. Whether you maintain two or 200 computers, you shouldn't have to perform the same maintenance tasks over and over again. Use Ansible to synchronize the computers in your life, then see what else Ansible can do for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/install-packages-ansible

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/resources/what-ansible
[3]: https://opensource.com/resources/linux
[4]: https://docs.ansible.com/ansible/latest/modules/modules_by_category.html
[5]: https://docs.ansible.com/ansible/latest/modules/list_of_packaging_modules.html
[6]: https://opensource.com/sites/default/files/uploads/ansible-module.png (Ansible documentation)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/article/20/8/how-ssh
[9]: https://opensource.com/article/20/6/homebrew-mac
[10]: https://opensource.com/article/20/3/chocolatey
