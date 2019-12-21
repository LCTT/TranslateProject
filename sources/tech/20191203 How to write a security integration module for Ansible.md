[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a security integration module for Ansible)
[#]: via: (https://opensource.com/article/19/12/security-ansible-module)
[#]: author: (Adam Miller https://opensource.com/users/maxamillion)

How to write a security integration module for Ansible
======
Ansible automation offers a lot of potential for the information
security industry. Learn how to take advantage of it in this summary of
an AnsibleFest 2019 talk.
![Security monster][1]

[Ansible][2] is a [radically simple IT automation platform][3] that makes your applications and systems easier to deploy. It allows you to avoid writing scripts or custom code to deploy and update your applications, systems, and various classifications of network-attached devices. Ansible allows you to automate in a language that approaches plain English with no agents to install on remote systems and uses native protocols based on device type—such as SSH for Unix-style operating systems, WinRM for Windows systems, REST APIs (**httpapi**) for REST API appliances, and many more.

### Background

At [AnsibleFest 2019][4], my colleague [Sumit Jaiswal][5] and I gave a talk, titled "[Ansible development deep dive: How to write a security integration module and collection for Ansible][6]," about something that we have been working on. This article recaps the finer points of our talk; I hope it will highlight the potential of what Ansible is—and can be capable of—in the realm of information security automation.

A lot of this started with my colleague [Massimo Ferrari's][7] statement that "Ansible automation can be the _lingua franca_ to integrate and orchestrate the many security platforms spread across different domains." We spent a lot of time mulling this over; it may be obvious to DevOps and automation professionals who've discovered the power of Ansible, but infosec doesn't have similar tools that target the industry's problems in the same way. Therefore, Ferrari's statement offers a lot of potential for the infosec industry.

In this article, I'll summarize two major points we highlighted in our AnsbileFest 2019 talk:

  * Ansible recommended development practices
  * Classify what you're integrating with and how you connect to it (API or CLI?)



### Ansible recommended development practices

The Ansible engineering team likes to never write the words "best practice," because we can't possibly know what's best for you in your specific situation. You are the expert on topics as they apply to your unique environment and requirements. However, we can provide _recommendations_, which I'll outline from the perspective of an Ansible module developer.

#### Modules

Modules are user-focused and self-contained. This mostly means that the code contained in your module should be self-contained within your [module][8] or in a **[module_util][9]**. The latter is what allows us to share code between modules, but everything must be as self-contained as possible, as we don't want to introduce too many external dependencies. We also want each module to perform some sort of state management. Each module should be [idempotent][10], which basically means "inflict change if needed, otherwise, do not." A module should not attempt to contain a workflow (that's what [playbooks][11] are for), and we want to leave that up to the user. Modules shouldn't attempt to "do too much," such that you have one massive module that takes 100 arguments and, based on values provided by the user, performs wildly different actions on the target device.

An example of what we generally want to avoid could go something like this:


```
\- name: Create a virtual machine
  some_module:
    thing_to_do: "create_virtual_machine"
    name: "bobs_awesome_vm"
    storage_size: 100G
    ram: 24G
    vcpus: 4

\- name: Create a virtual storage volume
  some_module:
    thing_to_do: "create_virtual_storage_vol"
    name: "bobs_awesome_storage"
    storage_size: 1000G
    lun_id: 12
```

In this example, the fictitious **some_module** is performing completely disjointed actions based on the value of **thing_to_do**. This is not a discrete, self-contained unit of work from the perspective of an Ansible module. These should be two separate modules that could even share code on the backend through a custom module_util (if that makes the developer's life easier). Either way, they should be separate modules so the user can easily define, read, and understand the task as written. As a developer, you want to make the module's interaction user-focused.

Another aspect of being user-focused is that the user should not need any knowledge of the destination API in order to use the module effectively. The module should provide useful defaults, documentation, and examples that allow users to pick their own automation path.

#### Collections

[Ansible collections][12] are a relatively new concept, but they are generally seen as the future for Ansible content of all shapes and sizes. They allow Ansible content, such as modules, module_utils, plugins of all kinds, roles, docs, tests, playbooks, and whatever the community dreams up next, to exist as a cohesive unit to be tested, verified, and distributed as an entity. What's more (and this is its real advantage for developers) is that it decouples the content from the [Ansible Core runtime][13]. This allows Ansible content to be lifecycle-managed separately from Ansible itself, meaning it can be released as often or as infrequently as the content author or maintainer desires. No longer will new features have to wait six months for the next Ansible release. The collection authors can release as often as they desire.

Collections are meant to be a simple progression into a brave new world where the Ansible Core execution engine is symbolically similar to [CPython][14]. Ansible collections are symbolically similar to Python modules found on [PyPI][15]. [Ansible Galaxy][16] is symbolically similar to PyPI as the de facto distribution mechanism.

From a developer standpoint, you simply need to drop your files in the correct location and update any custom module_utils Python import paths. From a user perspective, you just need to add the **collection** namespace and name to the [play][11] or [block][17] that intends to use that content.

### Classify what you're integrating with and how you connect to it

In the security realm, appliance devices or software that is meant to be used like an appliance (network devices, embedded systems, and so on) sometimes present the administrator both an [application programming interface][18] (API) and a [command-line interface][19] (CLI). As a module developer, you must make some decisions in service of ease of development, maintainability of code, and, ultimately, consistent user experience.

#### CLI

If you are potentially going to wrap a CLI, ask yourself whether that CLI offers a consistent interface with output you can reasonably and consistently parse. Beyond that, does the CLI offer the ability to formulate idempotent transactions? While the majority of CLIs offer **get** and **set** types of transactions (especially on Unix/Linux systems), some of them do not, and this is something module authors need to consider.

When considering CLI implementations with network or embedded devices that have a standard CLI but don't offer a traditional Unix shell, you should look into implementing a [cliconf plugin][20]. This type of plugin enables your users to interact with appliances or embedded devices in a way that's natural to the seasoned Ansible user and beginner alike. Alternatively, should you find yourself with a device that allows you to execute local Python code (_local_ to the device or system itself; a "managed host" in Ansible terminology), then consider the **[run_command][21]** module_util. The latter situation is effectively just a traditional [module development][22] workflow, as it would be for a traditional GNU/Linux distribution.

#### API

If the technology you are attempting to integrate with offers an API, determine whether that API is a local on-system API (local to the remote "managed host" system) or a remote API such as a [REST][23] API?

In the event you find yourself with a local Python API and it's advantageous to use it instead of the REST API (in the event both are available), this situation is effectively the same as a traditional [module development][22] workflow in a GNU/Linux distribution.

However, if the only option is a REST API, or if the available REST API is determined to be the best option, then writing an [httpapi connection plugin][24] is best for general ease of implementation, maintenance, and handling things like AuthN, AuthZ, sessions, and so on. It also offers an idiomatic pattern for talking to these types of devices, even though they have a considerably different means of communication than most others that Ansible works with.

An example to illustrate this point is probably common to anyone who has automated a web service with a module that doesn't provide an httpapi connection plugin. Typically in these scenarios, the play, block, or task must be run against **localhost**, and the various information for the connection to the web service must be passed to each invocation of the module for each task.


```
\---
\- name: talk to foo device
  hosts: localhost
  tasks:
    - name: do something
      foo_device_do_thing:
        url: foo.example.com
        username: "{{ foo_device_username }}"
        passwd: "{{ foo_device_password }}"
        validate_certs: true
        thing_state: present
        some_param: bar
```

If this module had been implemented against an httpapi connection plugin instead, then the various connection-specific parameters would be host variables or group variables and wouldn't have to be carried around at the task level in playbooks.

Here's an inventory entry to handle the AuthN/AuthZ connection for all Ansible modules, written against the httpapi connection plugin. It also performs session handling for increased performance:


```
[foo_devices]
foo.example.com

[foo_devices:vars]
ansible_network_os=foo_device
ansible_user=foo_device_username
ansible_httpapi_pass=foo_device_password
ansible_httpapi_validate_certs=true
```

This playbook would be considerably more idiomatic. The **foo_devices** are a first-class device type and [host pattern][25] for the playbook.


```
\---
\- name: talk to foo device
  hosts: foo_devices
  tasks:
    - name: do something
      foo_device_do_thing:
        thing_state: present
        some_param: bar
```

A playbook has to define information for every task, so imagine one that has 20 or 100 tasks. The overhead would be considerable. This doesn't feel much like directly automating the hosts defined in the host field. However, the httpapi connection plugin negates the need to define the connection information over and over, and it also talks natively to devices over a REST API, just as you would on a Linux system over SSH in a playbook.

Something to note about httpapi connection plugins is that, even though the user defines hosts, groups, host vars, and group vars, just in like a traditional Unix/Linux or Windows-managed host, these modules actually execute against the localhost (the "control host" in Ansible nomenclature). This is something to keep in mind when you're developing.

### What the what?

If you're new to Ansible module development, this might seem like a lot to take in at once. To be fair, it is. However, as you become more seasoned in the finer points of Ansible module development for a wide array of device types and technology solution classifications, the motivation for different development strategies starts to make sense. Some device classifications have idiosyncrasies, and this model helps Ansible developers and users deal with those in a consistent and predictable way.

### Wrapping up

If you have questions about Ansible module development models, feel free to reach out through the vibrant [Ansible Community][26], and more specifically, the [Ansible Security Automation Working Group][27].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/security-ansible-module

作者：[Adam Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/maxamillion
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://www.ansible.com
[3]: https://opensource.com/article/19/2/quickstart-guide-ansible
[4]: https://www.ansible.com/ansiblefest
[5]: https://github.com/justjais
[6]: https://www.ansible.com/development-deep-dive-how-to-write-a-security-integration-module-for-ansible
[7]: https://www.linkedin.com/in/massimoferrari/
[8]: https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html#developing-modules-general
[9]: https://docs.ansible.com/ansible/latest/dev_guide/developing_module_utilities.html
[10]: https://en.wikipedia.org/wiki/Idempotence
[11]: https://docs.ansible.com/ansible/latest/user_guide/playbooks.html
[12]: https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html
[13]: https://github.com/ansible/ansible
[14]: https://en.wikipedia.org/wiki/CPython
[15]: https://pypi.org
[16]: https://galaxy.ansible.com
[17]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_blocks.html
[18]: https://en.wikipedia.org/wiki/Application_programming_interface
[19]: https://en.wikipedia.org/wiki/Command-line_interface
[20]: https://docs.ansible.com/ansible/latest/plugins/cliconf.html
[21]: https://docs.ansible.com/ansible/latest/reference_appendices/module_utils.html#ansible.module_utils.basic.AnsibleModule.run_command
[22]: https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html
[23]: https://en.wikipedia.org/wiki/Representational_state_transfer
[24]: https://docs.ansible.com/ansible/latest/network/dev_guide/developing_plugins_network.html#developing-plugins-httpapi
[25]: https://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html
[26]: https://www.ansible.com/community
[27]: https://github.com/ansible/community/wiki/Security-Automation
