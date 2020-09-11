[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage access control lists with Ansible)
[#]: via: (https://opensource.com/article/19/5/manage-access-control-lists-ansible)
[#]: author: (Taz Brown  https://opensource.com/users/heronthecli)

How to manage access control lists with Ansible
======
Automating ACL management with Ansible's ACL module is a smart way to
strengthen your security strategy.
![Data container block with hexagons][1]

Imagine you're a new DevOps engineer in a growing agile environment, and recently your company has experienced phenomenal growth. To support expansion, the company increased hiring by 25% over the last quarter and added 5,000 more servers and network devices to its infrastructure. The company now has over 13,000 users, and you need a tool to scale the existing infrastructure and manage your large number of users and their thousands of files and directories. The company decided to adopt [Ansible][2] company-wide to manage [access control lists (ACLs)][3] and answer the call of effectively managing files and directories and permissions.

Ansible can be used for a multitude of administration and maintenance tasks and, as a DevOps engineer or administrator, it's likely you've been tasked with using it to manage ACLs.

### About managing ACLs

ACLs allow regular users to share their files and directories selectively with other users and groups. With ACLs, a user can grant others the ability to read, write, and execute files and directories without leaving those filesystem elements open.

ACLs are set and removed at the command line using the **setfacl** utility. The command is usually followed by the name of a file or directory. To set permissions, you would use the Linux command **setfacl -m d ⭕rx <directory>** (e.g., **setfacl -m d ⭕rx Music/**). To view the current permissions on a directory, you would use the command **getfacl <directory>** (e.g., **getfacl Music/** ). To remove an ACL from a file or directory, you would type the command, **# setfacl -x <file/directory>** (to remove only the specified ACL from the file/directory) or **# setfacl -b <file/directory>** (to remove all ACLs from the file/directory).

Only the owner assigned to the file or directory can set ACLs. (It's important to understand this before you, as the admin, take on Ansible to manage your ACLs.) There are also default ACLs, which control directory access; if a file inside a directory has no ACL, then the default ACL is applied.


```
sudo setfacl -m d⭕rx Music
getfacl Music/
# file: Music/
# owner: root
# group: root
user::rwx
group::---
other::---
default:user::rwx
default:group::---
default:other::r-x
```

### Enter Ansible

So how can Ansible, in all its wisdom, tackle the task of applying permissions to users, files, directories, and more? Ansible can play nicely with ACLs, just as it does with a lot of features, utilities, APIs, etc. Ansible has an out-of-the-box [ACL module][3] that allows you to create playbooks/roles around granting a user access to a file, removing ACLs for users on a specific file, setting default ACLs for users on files, or obtaining ACLs on particular files.

Anytime you are administering ACLs, you should use the best practice of "least privilege," meaning you should give a user access only to what they need to perform their role or execute a task, and no more. Restraint and minimizing the attack surface are critical. The more access extended, the higher the risk of unauthorized access to company assets.

Here's an example Ansible playbook:

![Ansible playbook][4]

As an admin, automating ACL management demands that your Ansible playbooks can scale across your infrastructure to increase speed, improve efficiency, and reduce the time it takes to achieve your goals. There will be times when you need to determine the ACL for a specific file. This is essentially the same as using **getfacl <filename>** in Linux. If you want to determine the ACLs of many, specific files, start with a playbook that looks like this:


```
\---
\- hosts: all
tasks:
\- name: obtain the acl for a specific file
acl:
path: /etc/logrotate.d
user_nfsv4_acls: true
register: acl_info
```

You can use the following playbook to set permissions on files/directories:

![Ansible playbook][5]

This playbook grants user access to a file:


```
\- hosts:
become: yes
gather_facts: no
tasks:
\- name: Grant user Shirley read access to a file
acl:
path: /etc/foo.conf
entity: shirley
etype: user
permissions: r
state: present
```

And this playbook grants user access to a directory:


```
\---
\- hosts: all
become: yes
gather_facts: no
tasks:
\- name: setting permissions on directory and user
acl:
path: /path/to/scripts/directory
entity: "{{ item }}"
etype: user
permissions: rwx
state: present
loop:
\- www-data
\- root
```

### Security realized?

Applying ACLs to files and users is a practice you should take seriously in your role as a DevOps engineer. Security best practices and formal compliance often get little or no attention. When you allow access to files with sensitive data, you are always risking that the data will be tampered with, stolen, or deleted. Therefore, data protection must be a focal point in your security strategy. Ansible can be part of your security automation strategy, as demonstrated here, and your ACL application is as good a place to start as any.

Automating your security practices will, of course, go beyond just managing ACLs; it might also involve [SELinux][6] configuration, cryptography, security, and compliance. Remember that Ansible also allows you to define your systems for security, whether it's locking down users and groups (e.g., managing ACLs), setting firewall rules, or applying custom security policies.

Your security strategy should start with a baseline plan. As a DevOps engineer or admin, you should examine the current security strategy (or the lack thereof), then chart your plan for automating security in your environment.

### Conclusion

Using Ansible to manage your ACLs as part of your overall security automation strategy depends on the size of both the company you work for and the infrastructure you manage. Permissions, users, and files can quickly get out of control, potentially placing your security in peril and putting the company in a position you definitely don't want to it be.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/manage-access-control-lists-ansible

作者：[Taz Brown ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_container_block.png?itok=S8MbXEYw (Data container block with hexagons)
[2]: https://opensource.com/article/19/2/quickstart-guide-ansible
[3]: https://docs.ansible.com/ansible/latest/modules/acl_module.html
[4]: https://opensource.com/sites/default/files/images/acl.yml_.png (Ansible playbook)
[5]: https://opensource.com/sites/default/files/images/set_filedir_permissions.png (Ansible playbook)
[6]: https://opensource.com/article/18/8/cheat-sheet-selinux
