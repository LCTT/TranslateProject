[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to cohost GitHub and GitLab with Ansible)
[#]: via: (https://opensource.com/article/19/11/how-host-github-gitlab-ansible)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to cohost GitHub and GitLab with Ansible
======
Protect your access to important projects by mirroring Git repositories
with Ansible.
![Hands programming][1]

Open source is everywhere. It's in your computer at home, it's in your computer at work, it's on the internet, and a lot of it is managed with [Git][2]. Because Git is decentralized, many people also think of it as a kind of crowdsourced backup solution. The theory is that each time someone clones a Git repository to their local computer, they are creating a backup of the project's source code. If 100 people do that, then there are 100 backup copies of a repository.

This, in theory, mitigates "disasters" such as a project maintainer [suddenly deciding to remove a repository][3] or [inexplicably blocking all traffic][4] and leaving developers scrambling to figure out who has the latest version of the master branch. Similarly, entire code-hosting sites have disappeared in the past. Nobody anticipated the closure of Google Code, Microsoft CodePlex, or Gitorious when they were at their peak.

In short, if the internet has taught us anything over the past few decades, it's that relying on the internet to magically create backups isn't the most reliable road to redundancy.

Besides, it's a problem for a lot of people that many open source projects are hosted on GitHub, which is not an open platform. Many developers and users would prefer to support and interact with a stack such as GitLab, which has an open source community edition.

### Using Ansible for Git

Git's decentralization is useful in solving this problem. Using pure Git, you can easily push to two or more repositories with a single **push** command. However, for that to be useful against unexpected failure, you must be interacting (and pushing, specifically) with a Git repository frequently. Furthermore, there may be repositories out there that you want to back up, even though you may never push or pull the code yourself.

But using Ansible, you can automate Git pulls of a project's master branch (or any other branch, for that matter) and then automate Git pushes of the repository to an "offsite" mirror. In other words, you can have your computer regularly pull from GitHub and push to GitLab or [Gitolite][5] or Gitea (or whatever Git host you prefer).

### Ansible modules

There wouldn't be much to Ansible if it weren't for its excellent collection of modules. Like third-party libraries for Python or applications for Linux, the technical _driver_ of the useful and surprisingly easy tricks Ansible is famous for are the parts that other people have already figured out for you. Because this article is tackling how to effectively and reliably backup a Git repository, the modules used here are the [Git module][6] and the [ini_file][7] module.

To begin, create a file called **mirror.yaml** to serve as the playbook. You can start mostly as you usually do with Ansible, with **name** and **task** entries. This example adds **localhost** to the **hosts** list so that the play runs on the controller machine (the computer you're sitting at right now), but in real life, you would probably run this on a specific host or group of hosts on your network.


```
\---
\- name: "Mirror a Git repo with Ansible"
  hosts: localhost
  tasks:
```

### Git pull and clone

If you're going to make a backup, then you need a copy of the latest code. The obvious way to make that happen with a Git repository is to perform a **git pull**. However, **pull** assumes that a clone already exists, and a well-written Ansible _play_ (an Ansible script) assumes as little as possible. It's better to tell Ansible to **clone** a repository first.

Add your first task to your playbook:


```
\---
\- name: "Mirror a Git repo with Ansible"
  hosts: localhost
  vars:
    git_dir: /tmp/soso.git
  tasks:

  - name: "Clone the git repo"
    git:
       repo: '<https://github.com/ozkl/soso.git>'
       dest: '{{ git_dir }}'
       clone: yes
       update: yes
```

This example uses the open source, Unix-like operating system **soso** as the repository I want to mirror. This is a completely arbitrary choice and in no way implies a lack of confidence in this repository's future. It also uses a variable to refer to the destination folder, **/tmp/soso.git**, which is convenient now and also beneficial later should you want to scale this out to be a generic mirroring script. In real life, you would probably have a more permanent location than **/tmp**, such as **/home/gitmirrors/soso.git** or **/opt/gitmirrors/soso.git**, on your worker machine.

Run your playbook:


```
`$ ansible-playbook mirror.yaml`
```

The first time you run the playbook, Ansible correctly detects that the Git repository does not yet exist locally, so it clones it.


```
PLAY [Ansible Git mirror] ********

TASK [Gathering Facts] ***********
ok: [localhost]

TASK [Clone git repo] ************
changed: [localhost]

PLAY RECAP ***********************
localhost: ok=2 changed=1 failed=0 [...]
```

Should you run the playbook again, Ansible correctly detects that there have been no changes since the last time it was run and it reports that no actions were performed:


```
`localhost: ok=2 changed=0 failed=0 [...]`
```

Next, Ansible must be instructed to push the repository to another Git server.

### Git push

The Git module in Ansible doesn't provide a **push** function, so that part of the process is manual. However, before you can push the repo to an alternate mirror, you have to have a mirror, and you have to configure the mirror as an alternate remote.

First, you must add an alternate remote to your Git configuration. Because the Git config file is an INI-style configuration, you can use the **ini_file** Ansible module to append the required information easily. Add this to your playbook:


```
 - name: "Add alternate remote"
    ini_file: dest={{ git_dir }}/.git/config section='remote \"mirrored\"' option=url value='[git@gitlab.com][8]:example/soso-mirror.git'
    tags: configuration
```

For this to work, you must have an empty repository on your destination server (in this case, [GitLab.com][9]). If you need to create destination repositories in your playbook, you can do that by following Steve Ovens' excellent article "[How to use Ansible to set up a Git server over SSH][10]."

Finally, use Git directly to push HEAD to your alternate remote:


```
 - name: "Push the repo to alternate remote"
    shell: 'git --verbose --git-dir={{ git_dir }}/.git push mirrored HEAD'
```

Run the playbook as usual, and then automate the process so that you never have to run it directly again. You can adjust the script with variables and specific Git commands to suit your needs, but with regular pulls and pushes, you can be sure that an important project that lives on one server is safely mirrored on another.

Here is the full playbook for reference:


```
\---
\- name: "Mirror a Git repository with Ansible"
  hosts: localhost
  vars:
    git_dir: /tmp/soso.git

  tasks:

  - name: "Clone the Git repo"
    git:
       repo: '<https://github.com/ozkl/soso.git>'
       dest: '{{ git_dir }}'
       clone: yes
       update: yes

  - name: "Add alternate remote"
    ini_file: dest={{ git_dir }}/.git/config section='remote \"mirrored\"' option=url value='[git@gitlab.com][8]:example/soso-mirror.git'
    tags: configuration
 
  - name: "Push the repo to alternate remote"
    shell: 'git --verbose --git-dir={{ git_dir }}/.git push mirrored HEAD'
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/how-host-github-gitlab-ansible

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-is-git
[3]: https://github.com/AntiMicro/antimicro/issues/3
[4]: https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons
[5]: https://opensource.com/article/19/4/server-administration-git
[6]: https://docs.ansible.com/ansible/latest/modules/git_module.html
[7]: https://docs.ansible.com/ansible/latest/modules/ini_file_module.html
[8]: mailto:git@gitlab.com
[9]: http://GitLab.com
[10]: https://opensource.com/article/17/8/ansible-environment-management
