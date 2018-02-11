Tips for success when getting started with Ansible
==================================================

Key information for automating your data center with Ansible.
-------------------------------------------------------------

![Key information for automating your data center with Ansible.](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-big-data.png?itok=L34b2exg "Key information for automating your data center with Ansible.")

Image by : 

[Cory Doctorow][1]. Modified by Opensource.com. [CC BY-SA 2.0.][2]

Get the newsletter
------------------

Join the 85,000 open source advocates who receive our giveaway alerts and article roundups.

Ansible is an open source automation tool used to configure servers, install software, and perform a wide variety of IT tasks from one central location. It is a one-to-many agentless mechanism where all instructions are run from a control machine that communicates with remote clients over SSH, although other protocols are also supported.

While targeted for system administrators with privileged access who routinely perform tasks such as installing and configuring applications, Ansible can also be used by non-privileged users. For example, a database administrator using the `mysql` login ID could use Ansible to create databases, add users, and define access-level controls.

Let's go over a very simple example where a system administrator provisions 100 servers each day and must run a series of Bash commands on each one before handing it off to users.

[mapping-bash-commands-to-ansible.png][3]
-----------------------------------------

![Mapping Bash commands to an Ansible playbook](https://opensource.com/sites/default/files/u128651/mapping-bash-commands-to-ansible.png "Mapping Bash commands to an Ansible playbook")

This is a simple example, but should illustrate how easily commands can be specified in yaml files and executed on remote servers. In a heterogeneous environment, conditional statements can be added so that certain commands are only executed in certain servers (e.g., "only execute `yum` commands in systems that are not Ubuntu or Debian").

One important feature in Ansible is that a playbook describes a _desired_ state in a computer system, so a playbook can be run multiple times against a server without impacting its state. If a certain task has already been implemented (e.g., "user `sysman` already exists"), then Ansible simply ignores it and moves on.

Definitions
-----------

*   **Tasks:**  A task is the smallest unit of work. It can be an action like "Install a database," "Install a web server," "Create a firewall rule," or "Copy this configuration file to that server."
*   **Plays:**  A play is made up of tasks. For example, the play: "Prepare a database to be used by a web server" is made up of tasks: 1) Install the database package; 2) Set a password for the database administrator; 3) Create a database; and 4) Set access to the database.
*   **Playbook:**  A playbook is made up of plays. A playbook could be: "Prepare my website with a database backend," and the plays would be 1) Set up the database server; and 2) Set up the web server.
*   **Roles:**  Roles are used to save and organize playbooks and allow sharing and reuse of playbooks. Following the previous examples, if you need to fully configure a web server, you can use a role that others have written and shared to do just that. Since roles are highly configurable (if written correctly), they can be easily reused to suit any given deployment requirements.
*   **Ansible Galaxy:**  Ansible [Galaxy][4] is an online repository where roles are uploaded so they can be shared with others. It is integrated with GitHub, so roles can be organized into Git repositories and then shared via Ansible Galaxy.

These definitions and their relationships are depicted here:

[ansible-definitions.png][5]
----------------------------

![Ansible definitions and how they relate to each other](https://opensource.com/sites/default/files/u128651/ansible-definitions.png "Ansible definitions and how they relate to each other")

Please note this is just one way to organize the tasks that need to be executed. We could have split up the installation of the database and the web server into separate playbooks and into different roles. Most roles in Ansible Galaxy install and configure individual applications. You can see examples for installing [mysql][6] and installing [httpd][7].

Tips for writing playbooks
--------------------------

The best source for learning Ansible is the official [documentation][8] site. And, as usual, online search is your friend. I recommend starting with simple tasks, like installing applications or creating users. Once you are ready, follow these guidelines:

*   When testing, use a small subset of servers so that your plays execute faster. If they are successful in one server, they will be successful in others.
*   Always do a dry run to make sure all commands are working (run with `--check-mode` flag).
*   Test as often as you need to without fear of breaking things. Tasks describe a desired state, so if a desired state is already achieved, it will simply be ignored.
*   Be sure all host names defined in `/etc/ansible/hosts` are resolvable.
*   Because communication to remote hosts is done using SSH, keys have to be accepted by the control machine, so either 1) exchange keys with remote hosts prior to starting; or 2) be ready to type in "Yes" to accept SSH key exchange requests for each remote host you want to manage.
*   Although you can combine tasks for different Linux distributions in one playbook, it's cleaner to write a separate playbook for each distro.

In the final analysis
---------------------

Ansible is a great choice for implementing automation in your data center:

*   It's agentless, so it is simpler to install than other automation tools.
*   Instructions are in YAML (though JSON is also supported) so it's easier than writing shell scripts.
*   It's open source software, so contribute back to it and make it even better!

How have you used Ansible to automate your data center? Share your experience in the comments.

About the author
----------------

[![](https://opensource.com/sites/default/files/styles/profile_pictures/public/picture-16796-913ac6d64003aec243fbe58eaa7cc856.jpg?itok=VZzHCQXx)][9]

Jose Delarosa \- Jose is a Linux engineer at Dell EMC. He spends most days learning new things, keeping stuff from breaking, and keeping customers happy.

[More about me][10]

---

via: [https://opensource.com/article/18/2/tips-success-when-getting-started-ansible][11]

作者: [null][12] 选题者: [@lujun9972][13] 译者: [译者ID][14] 校对: [校对者ID][15]

本文由 [LCTT][16] 原创编译，[Linux中国][17] 荣誉推出

[1]: https://www.flickr.com/photos/doctorow/2711081060
[2]: https://creativecommons.org/licenses/by-sa/2.0/
[3]: https://opensource.com/file/384801
[4]: https://galaxy.ansible.com/
[5]: https://opensource.com/file/384796
[6]: https://galaxy.ansible.com/bennojoy/mysql/
[7]: https://galaxy.ansible.com/xcezx/httpd/
[8]: http://docs.ansible.com/
[9]: https://opensource.com/users/jdelaros1
[10]: https://opensource.com/users/jdelaros1
[11]: https://opensource.com/article/18/2/tips-success-when-getting-started-ansible
[12]: undefined
[13]: https://github.com/lujun9972
[14]: https://github.com/译者ID
[15]: https://github.com/校对者ID
[16]: https://github.com/LCTT/TranslateProject
[17]: https://linux.cn/