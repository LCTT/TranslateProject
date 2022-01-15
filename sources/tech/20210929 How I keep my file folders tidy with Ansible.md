[#]: subject: "How I keep my file folders tidy with Ansible"
[#]: via: "https://opensource.com/article/21/9/keep-folders-tidy-ansible"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I keep my file folders tidy with Ansible
======
I try to use Ansible often, even for tasks that I know how to do with a
shell script because I know that Ansible is easy to scale.
![Filing cabinet for organization][1]

I try to use Ansible often, even for tasks that I know how to do with a shell script because I know that Ansible is easy to scale. Even though I might develop an Ansible playbook just for my personal workstation, sometimes it ends up being a lot more useful than intended, and it's easy to apply that same playbook to all the computers on my network. And besides, sometimes the greatest enemy of getting really good at something is the impression that it's only meant for serious professionals, or big projects, or whatever you feel that you're not. I use Ansible because it's a great open source tool, but I benefit from it the most because it scales.

One of the tasks I recently assigned to Ansible was the monumental one of keeping my Downloads folder tidy. If you're like me, you end up downloading many files from the Internet throughout the day and then forget that the files exist. On the one hand, I don't mind this habit. There have been times when I realize I still need a file in my Downloads folder, so forgetting about a file rather than promptly removing it can be helpful. However, there are other files that I download expressly to use once and then ought to remove.

I decided to use a highly specific Ansible task to find files I know I don't need and then remove them.

### Ansible boilerplate

Ansible playbooks generally start in exactly the same way: Define your hosts and announce a task:


```
\---
\- hosts: localhost
  tasks:
```

Commit those three lines to memory. They're the "shebang" (`#!`) of Ansible playbooks. Once you have those lines in a text file, you can start defining the steps in your task.

### Finding files with Ansible

You can locate files on a system using the [`find` Ansible module][2]. If an Ansible module is a command, its parameters are its [command options][3]. In this example playbook, I want to find files explicitly located in the `~/Downloads` folder and I can define that using the `paths` parameter.

This is my process when I start writing a playbook: I find a module in the Ansible module index that seems likely to do what I need, and then I read through its parameters to find out what kind of control I have over the module.

In my case, the files I accidentally collect in my Downloads folder are CSV files. They get downloaded weekly, processed, and then ought to disappear. But they hang around for weeks until I get overwhelmed and delete them. Here's how to find CSV files in Downloads with Ansible:


```
\---
\- hosts: localhost
  tasks:
    - name: Find CSV in Downloads
      find:
        paths: ~/Downloads
        recurse: false
        patterns: '*.csv,*.CSV'
      register: result
```

The `paths` parameter tells Ansible where to search for files.

The `recurse: false` parameter forbids Ansible from searching in subdirectories of Downloads. This gives me the ability to retain CSV files that I've downloaded and saved into a subdirectory. Ansible only targets the CSV files I save straight to Downloads (which is my habit).

The `patterns` parameter tells Ansible what to count as a match. All of the CSV files I download end in .csv, but I'm confident that I'm willing to remove .CSV (in all capital letters) as well.

The finishing touch to this step is to invoke the `register` module, which saves the results of the `find` process into a variable called `result`.

This is important because I want Ansible to perform a second action on the results of `find`, so those results need to be stored somewhere for the next step.

### Removing files with Ansible

The next step in the task is to remove the files that `find` has uncovered. The module used to remove files is the [`file` module][4].

This step relies entirely on the `find` step, so it uses several variables:


```
    - name: Remove CSV files
      file:
        path: "{{ item.path }}"
        state: absent
      with_items: "{{ result.files }}"
```

The `path` parameter uses the built-in `"{{ item.path }}"` variable, which confusingly isn't actually defined yet. The variable has no information on the path until the `file` module is used in a loop by the `with_items` keyword. The `with_items` step uses the contents of the `result` variable to extract one filename at a time, which becomes the `item` for the `path` parameter. Once the current item's path is extracted, Ansible uses the `state: absent` rule to ensure that the file located at that path is _not_ left on the system (in other words, it's deleted.)

This is a _very_ dangerous step, especially during testing. If you get this step wrong, you can easily remove files you don't intend to delete.

### Verify the playbook 

Ansible playbooks are written in [YAML][5], which has a strict syntax. Verify that your YAML is correct using the `yamllint` command:


```
$ yamllint cleanup.yaml
$
```

No results means no errors. This playbook must have been written by someone who really [knows and loves YAML][6]!

### Testing Ansible plays safely

To avoid deleting my entire home directory by accident, I ran my first attempt with the `--check` option. This ensures that Ansible doesn't actually make changes to your system.


```
$ ansible-playbook --check example.yaml
[WARNING]: provided hosts list is empty, only localhost is available.
'all'

PLAY [localhost] ****************************************************

TASK [Gathering Facts] **********************************************
ok: [localhost]

TASK [Find CSV files in Downloads] **********************************
ok: [localhost]

TASK [Remove CSV files] *********************************************
changed: [localhost] =&gt; (item={'path': '/home/tux/Downloads/foo.csv', [...]
changed: [localhost] =&gt; (item={'path': '/home/tux/Downloads/bar.csv', [...]
changed: [localhost] =&gt; (item={'path': '/home/tux/Downloads/baz.csv', [...]

PLAY RECAP **********************************************************
localhost                  : ok=3    changed=1    unreachable=0 [...]
```

The output is very verbose, but it shows that my playbook is correct: Only CSV files within Downloads have been marked for removal.

### Running Ansible playbooks

To run an Ansible playbook, you use the `ansible-playbook` command:


```
`$ ansible-playbook example.yaml`
```

Confirm the results:


```
$ ls *.csv  ~/Downloads/
ls: cannot access '*.csv': No such file or directory
/home/tux/Downloads/:
file.txt
```

### Schedule the Ansible playbook

The Ansible playbook has been confirmed, but I want it to run at least every week. I use [Anacron][7] rather than Cron, so I created an Anacron job to run weekly:


```
$ cat &lt;&lt; EOF &gt;&gt; ~/.local/etc/cron.weekly/cleanup
#!/bin/sh
ansible-playbook $HOME/Ansible/cleanup.yaml
EOF
$ chmod +x ~/.local/etc/cron.daily/cleanup
```

### What can you do with Ansible?

Generally, Ansible is meant as a system maintenance tool. It's finely tuned to bootstrap complex systems to help with course correction when something's gone wrong and to keep a system in a specific state. I've used it for simple but repetitive tasks, like setting up a complex directory tree that would typically require several commands or clicks. I've also used it for tasks I don't want to do wrong, like removing old files from directories. I've also used it for tasks that are just too complex for me to bother trying to remember, like synchronizing several changes made to a production system with its redundant backup system.

I don't use this cleanup script on my servers because I don't download CSV files every week on my servers, but I do use a variation of it. Ansible isn't a replacement for shell or Python scripting, but for some tasks, it's a very precise method to perform some set of tasks that you might want to run on many more systems.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/keep-folders-tidy-ansible

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://docs.ansible.com/ansible/2.8/modules/find_module.html#find-module
[3]: https://opensource.com/article/21/8/linux-terminal#options
[4]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html
[5]: https://www.redhat.com/sysadmin/yaml-beginners
[6]: https://www.redhat.com/sysadmin/yaml-tips
[7]: https://opensource.com/article/21/2/linux-automation
