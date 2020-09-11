[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Ansible to document procedures)
[#]: via: (https://opensource.com/article/19/4/ansible-procedures)
[#]: author: (Marco Bravo https://opensource.com/users/marcobravo/users/shawnhcorey/users/marcobravo)

How to use Ansible to document procedures
======
In Ansible, the documentation is the playbook, so the documentation
naturally evolves alongside the code
![][1]

> "Documentation is a love letter that you write to your future self." —[Damian Conway][2]

I use [Ansible][3] as my personal notebook for documenting coding procedures—both the ones I use often and the ones I rarely use. This process facilitates my work and reduces the time it takes to do repetitive tasks, the ones where specific commands in a certain sequence are executed to accomplish a specific result.

By documenting with Ansible, I don't need to memorize all the parameters for each command or all the steps involved with a specific procedure, and it's easy to share the details with my teammates.

Traditional approaches for documentation, like wikis or shared drives, are useful for general documents, but inevitably they become outdated and can't keep pace with the rapid changes in infrastructure and environments. For specific procedures, it's better to document directly into the code using a tool like Ansible.

### Ansible's advantages

Before we begin, let's recap some basic Ansible concepts: a _playbook_ is a high-level organization of procedures using plays; _plays_ are specific procedures for a group of hosts; _tasks_ are specific actions, _modules_ are units of code, and _inventory_ is a list of managed nodes.

Ansible's great advantage is that the documentation is the playbook itself, so it evolves with and is contained inside the code. This is not only useful; it's also practical because, more than just documenting solutions with Ansible, you're also coding a playbook that permits you to write your procedures and commands, reproduce them, and automate them. This way, you can look back in six months and be able to quickly understand and execute them again.

It's true that this way of resolving problems could take more time at first, but it will definitely save a lot of time in the long term. By being courageous and disciplined to adopt these new habits, you will improve your skills in each iteration.

Following are some other important elements and support tools that will facilitate your process.

### Use source code control

> "First do it, then do it right, then do it better." —[Addy Osmani][4]

When working with Ansible playbooks, it's very important to implement a playbook-as-code strategy. A good way to accomplish this is to use a source code control repository that will permit to you start with a simple solution and iterate to improve it.

A source code control repository provides many advantages as you collaborate with other developers, restore previous versions, and back up your work. But in creating documentation, its main advantages are that you get traceability about what are you doing and can iterate around small changes to improve your work.

The most popular source control system is [Git][5], but there are [others][6] like [Subversion][7], [Bazaar][8], [BitKeeper][9], and [Mercurial][10].

### Keep idempotency in mind

In infrastructure automation, idempotency means to reach a specific end state that remains the same, no matter how many times the process is executed. So when you are preparing to automate your procedures, keep the desired result in mind and write scripts and commands that will achieve them consistently.

This concept exists in most Ansible modules because after you specify the desired final state, Ansible will accomplish it. For instance, there are modules for creating filesystems, modifying iptables, and managing cron entries. All of these modules are idempotent by default, so you should give them preference.

If you are using some of the lower-level modules, like command or shell, or developing your own modules, be careful to write code that will be idempotent and safe to repeat many times to get the same result.

The idempotency concept is important when you prepare procedures for automation because it permits you to evaluate several scenarios and incorporate the ones that will make your code safer and create an abstraction level that points to the desired result.

### Test it!

Testing your deployment workflow creates fewer surprises when your code arrives in production. Ansible's belief that you shouldn't need another framework to validate basic things in your infrastructure is true. But your focus should be on application testing, not infrastructure testing.

Ansible's documentation offers several [testing strategies for your procedures][11]. For testing Ansible playbooks, you can use [Molecule][12], which is designed to aid in the development and testing of Ansible roles. Molecule supports testing with multiple instances, operating systems/distributions, virtualization providers, test frameworks, and testing scenarios. This means Molecule will run through all the testing steps: linting verifications, checking playbook syntax, building Docker environments, running playbooks against Docker environments, running the playbook again to verify idempotence, and cleaning everything up afterward. [Testing Ansible roles with Molecule][13] is a good introduction to Molecule.

### Run it!

Running Ansible playbooks can create logs that are formatted in an unfriendly and difficult-to-read way. In those cases, the Ansible Run Analysis (ARA) is a great complementary tool for running Ansible playbooks, as it provides an intuitive interface to browse them. Read [Analyzing Ansible runs using ARA][14] for more information.

Remember to protect your passwords and other sensitive information with [Ansible Vault][15]. Vault can encrypt binary files, **group_vars** , **host_vars** , **include_vars** , and **var_files**. But this encrypted data is exposed when you run a playbook in **-v** (verbose) mode, so it's a good idea to combine it with the keyword **no_log** set to **true** to hide any task's information, as it indicates that the value of the argument should not be logged or displayed.

### A basic example

Do you need to connect to a server to produce a report file and copy the file to another server? Or do you need a lot of specific parameters to connect? Maybe you're not sure where to store the parameters. Or are your procedures are taking a long time because you need to collect all the parameters from several sources?

Suppose you have a network topology with some restrictions and you need to copy a file from a server that you can access ( **server1** ) to another server that is managed by a third party ( **server2** ). The parameters to connect are:


```
Source server: server1
Target server: server2
Port: 2202
User: transfers
SSH Key: transfers_key
File to copy: file.log
Remote directory: /logs/server1/
```

In this scenario, you need to connect to **server1** and copy the file using these parameters. You can accomplish this using a one-line command:


```
`ssh server1 "scp -P 2202 -oUser=transfers -i ~/.ssh/transfers_key file.log server2:/logs/server1/"`
```

Now your playbook can do the procedure.

### Useful combinations

If you produce a lot of Ansible playbooks, you can organize all your procedures with other tools like [AWX][16] (Ansible Works Project), which provides a web-based user interface, a REST API, and a task engine built on top of Ansible so that users can better control their Ansible project use in IT environments.

Other interesting combinations are Ansible with [Rundeck][17], which provides procedures as self-service jobs, and [Jenkins][18] for continuous integration and continuous delivery processes.

### Conclusion

I hope that these tips for using Ansible will help you improve your automation processes, coding, and documentation. If you have more interest, dive in and learn more. And I would like to hear your ideas or questions, so please share them in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/ansible-procedures

作者：[Marco Bravo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marcobravo/users/shawnhcorey/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2
[2]: https://en.wikipedia.org/wiki/Damian_Conway
[3]: https://www.ansible.com/
[4]: https://addyosmani.com/
[5]: https://git-scm.com/
[6]: https://en.wikipedia.org/wiki/Comparison_of_version_control_software
[7]: https://subversion.apache.org/
[8]: https://bazaar.canonical.com/en/
[9]: https://www.bitkeeper.org/
[10]: https://www.mercurial-scm.org/
[11]: https://docs.ansible.com/ansible/latest/reference_appendices/test_strategies.html
[12]: https://molecule.readthedocs.io/en/latest/
[13]: https://opensource.com/article/18/12/testing-ansible-roles-molecule
[14]: https://opensource.com/article/18/5/analyzing-ansible-runs-using-ara
[15]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
[16]: https://github.com/ansible/awx
[17]: https://www.rundeck.com/ansible
[18]: https://www.redhat.com/en/blog/integrating-ansible-jenkins-cicd-process
