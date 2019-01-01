[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 5 configuration management tools)
[#]: via: (https://opensource.com/article/18/12/configuration-management-tools)
[#]: author: (Marco Bravo https://opensource.com/users/marcobravo)

Top 5 configuration management tools
======
Learn about configuration management tools and figure out which will work best for your DevOps organization.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M)

DevOps is evolving and gaining traction as organizations discover how it enables them to produce better applications and reduce their software products' time to market.

[DevOps' core values][1] are Culture, Automation, Measurement, and Sharing (CAMS), and an organization's adherence to them influences how successful it is.

  * **Culture** brings people and processes together;
  * **Automation** creates a fabric for DevOps;
  * **Measurement** permits improvements; and
  * **Sharing** enables the feedback loop in the CAMS cycle.



Another DevOps concept is the idea that almost everything can be managed in code: servers, databases, networks, log files, application configurations, documentation, automated tests, deployment processes, and more.

In this article, I'll focus on one aspect of automation: Configuration management. As part of [Infrastructure as Code][2] (IaC), configuration management tools enable the use of tested and proven software development practices for managing and provisioning data centers through plaintext definition files.

By manipulating simple configuration files, a DevOps team can use application development best practices, such as version control, testing, small deployments, and design patterns. In short, this means code can be written to provision and manage an infrastructure as well as automate processes.

### Why use configuration management tools?

Configuration management tools enable changes and deployments to be faster, repeatable, scalable, predictable, and able to maintain the desired state, which brings controlled assets into an expected state.

Some advantages of using configuration management tools include:

  * Adherence to coding conventions that make it easier to navigate code
  * Idempotency, which means that the end state remains the same, no matter how many times the code is executed
  * Distribution design to improve managing large numbers of remote servers



Some configuration management tools use a pull model, in which an agent installed on the servers runs periodically to pull the latest definitions from a central repository and apply them to the server. Other tools use a push model, where a central server triggers updates to managed servers.

### Top 5 configuration management tools

There are a variety of configuration management tools available, and each has specific features that make it better for some situations than others. Yet the top five configuration management tools, presented below in alphabetical order, have several things in common that I believe are essential for DevOps success: all have an open source license, use externalized configuration definition files, run unattended, and are scriptable. All of the descriptions are based on information from the tools' software repositories and websites.

#### Ansible

"Ansible is a radically simple IT automation platform that makes your applications and systems easier to deploy. Avoid writing scripts or custom code to deploy and update your applications—automate in a language that approaches plain English, using SSH, with no agents to install on remote systems." —[GitHub repository][3]

Ansible is one of my favorite tools; I started using it several years ago and fell in love with it. You can use Ansible to execute the same command for a list of servers from the command line. You can also use it to automate tasks using "playbooks" written into a YAML file, which facilitate communication between teams and non-technical people. Its main advantages are that it is simple, agentless, and easy to read (especially for non-programmers).

Because agents are not required, there is less overhead on servers. An SSH connection is necessary when running in push mode (which is the default), but pull mode is available if needed. [Playbooks][4] can be written with a minimal set of commands or they can be scaled for more elaborate automation tasks that could include roles, variables, and modules written by other people.

You can combine Ansible with other tools to create a central console to control processes. Those tools include Ansible Works (AWX), Jenkins, RunDeck, and [ARA][5], which offers [traceability when running playbooks][6].

### CFEngine

"CFEngine 3 is a popular open source configuration management system. Its primary function is to provide automated configuration and maintenance of large-scale computer systems." —[GitHub repository][7]

CFEngine was introduced by Mark Burgess in 1993 as a scientific approach to automated configuration management. The goal was to deal with the entropy in computer systems' configuration and resolve it with end-state "convergence." Convergence means a desired end-state and elaborates on idempotence as a capacity to reach the desired end-state. Burgess' research evolved in 2004 when he proposed the [Promise theory][8] as a model of voluntary cooperation between agents.

The current version of CFEngine incorporates Promise theory and uses agents running on each server that pull the configuration from a central repository. It requires some expert knowledge to deal with configurations, so it's best suited for technical people.

### Chef

"A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure." —[GitHub repository][9]

Chef uses "recipes" written in Ruby to keep your infrastructure running up-to-date and compliant. The recipes describe a series of resources that should be in a particular state. Chef can run in client/server mode or in a standalone configuration named [chef-solo][10]. It has good integration with the major cloud providers to automatically provision and configure new machines.

Chef has a solid user base and provides a full toolset to allow people with different technical backgrounds and skills to interact around the recipes. But, at its base, it is more technically oriented tool.

### Puppet

"Puppet, an automated administrative engine for your Linux, Unix, and Windows systems, performs administrative tasks (such as adding users, installing packages, and updating server configurations) based on a centralized specification." —[GitHub repository][11]

Conceived as a tool oriented toward operations and sysadmins, Puppet has consolidated as a configuration management tool. It usually works in a client-server architecture, and an agent communicates with the server to fetch configuration instructions.

Puppet uses a declarative language or Ruby to describe the system configuration. It is organized in modules, and manifest files contain the desired-state goals to keep everything as required. Puppet uses the push model by default, and the pull model can be configured.

### Salt

"Software to automate the management and configuration of any infrastructure or application at scale." — [GitHub repository][12]

Salt was created for high-speed data collection and scale beyond tens of thousands of servers. It uses Python modules to handle configuration details and specific actions. These modules manage all of Salt's remote execution and state management behavior. Some level of technical skills are required to configure the modules.

Salt uses a client-server topology (with the Salt master as server and Salt minions as clients). Configurations are kept in Salt state files, which describe everything required to keep a system in the desired state.

### Conclusion

The landscape of DevOps tools is evolving all the time, and it is important to keep an eye on the changes. I hope this article will encourage you to explore these concepts and tools further. If so, the Cloud Native Computing Foundation (CNCF) maintains a good reference in the [Cloud Native Landscape Project][13].


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/configuration-management-tools

作者：[Marco Bravo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://www.oreilly.com/learning/why-use-terraform
[2]: https://www.oreilly.com/library/view/infrastructure-as-code/9781491924334/ch04.html
[3]: https://github.com/ansible/ansible
[4]: https://opensource.com/article/18/8/ansible-playbooks-you-should-try
[5]: https://github.com/openstack/ara
[6]: https://opensource.com/article/18/5/analyzing-ansible-runs-using-ara
[7]: https://github.com/cfengine/core
[8]: https://en.wikipedia.org/wiki/Promise_theory
[9]: https://github.com/chef/chef
[10]: https://docs.chef.io/chef_solo.html
[11]: https://github.com/puppetlabs/puppet
[12]: https://github.com/saltstack/salt
[13]: https://github.com/cncf/landscape
