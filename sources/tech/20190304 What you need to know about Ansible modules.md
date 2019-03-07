[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about Ansible modules)
[#]: via: (https://opensource.com/article/19/3/developing-ansible-modules)
[#]: author: (Jairo da Silva Junior https://opensource.com/users/jairojunior)

What you need to know about Ansible modules
======
Learn how and when to develop custom modules for Ansible.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_container_block.png?itok=S8MbXEYw)

Ansible works by connecting to nodes and sending small programs called modules to be executed remotely. This makes it a push architecture, where configuration is pushed from Ansible to servers without agents, as opposed to the pull model, common in agent-based configuration management systems, where configuration is pulled.

These modules are mapped to resources and their respective states, which are represented in YAML files. They enable you to manage virtually everything that has an API, CLI, or configuration file you can interact with, including network devices like load balancers, switches, firewalls, container orchestrators, containers themselves, and even virtual machine instances in a hypervisor or in a public (e.g., AWS, GCE, Azure) and/or private (e.g., OpenStack, CloudStack) cloud, as well as storage and security appliances and system configuration.

With Ansible's batteries-included model, hundreds of modules are included and any task in a playbook has a module behind it.

The contract for building modules is simple: JSON in the stdout. The configurations declared in YAML files are delivered over the network via SSH/WinRM—or any other connection plugin—as small scripts to be executed in the target server(s). Modules can be written in any language capable of returning JSON, although most Ansible modules (except for Windows PowerShell) are written in Python using the Ansible API (this eases the development of new modules).

Modules are one way of expanding Ansible capabilities. Other alternatives, like dynamic inventories and plugins, can also increase Ansible's power. It's important to know about them so you know when to use one instead of the other.

Plugins are divided into several categories with distinct goals, like Action, Cache, Callback, Connection, Filters, Lookup, and Vars. The most popular plugins are:

  * **Connection plugins:** These implement a way to communicate with servers in your inventory (e.g., SSH, WinRM, Telnet); in other words, how automation code is transported over the network to be executed.
  * **Filters plugins:** These allow you to manipulate data inside your playbook. This is a Jinja2 feature that is harnessed by Ansible to solve infrastructure-as-code problems.
  * **Lookup plugins:** These fetch data from an external source (e.g., env, file, Hiera, database, HashiCorp Vault).



Ansible's official docs are a good resource on [developing plugins][1].

### When should you develop a module?

Although many modules are delivered with Ansible, there is a chance that your problem is not yet covered or it's something too specific—for example, a solution that might make sense only in your organization. Fortunately, the official docs provide excellent guidelines on [developing modules][2].

**IMPORTANT:** Before you start working on something new, always check for open pull requests, ask developers at #ansible-devel (IRC/Freenode), or search the [development list][3] and/or existing [working groups][4] to see if a module exists or is in development.

Signs that you need a new module instead of using an existing one include:

  * Conventional configuration management methods (e.g., templates, file, get_url, lineinfile) do not solve your problem properly.
  * You have to use a complex combination of commands, shells, filters, text processing with magic regexes, and API calls using curl to achieve your goals.
  * Your playbooks are complex, imperative, non-idempotent, and even non-deterministic.



In the ideal scenario, the tool or service already has an API or CLI for management, and it returns some sort of structured data (JSON, XML, YAML).

### Identifying good and bad playbooks

> "Make love, but don't make a shell script in YAML."

So, what makes a bad playbook?

```
- name: Read a remote resource
   command: "curl -v http://xpto/resource/abc"
 register: resource
 changed_when: False

 - name: Create a resource in case it does not exist
   command: "curl -X POST http://xpto/resource/abc -d '{ config:{ client: xyz, url: http://beta, pattern: core.md Dict.md lctt2014.md lctt2016.md lctt2018.md README.md } }'"
   when: "resource.stdout | 404"

 # Leave it here in case I need to remove it hehehe
 #- name: Remove resource
 #  command: "curl -X DELETE http://xpto/resource/abc"
 #  when: resource.stdout == 1
```

Aside from being very fragile—what if the resource state includes a 404 somewhere?—and demanding extra code to be idempotent, this playbook can't update the resource when its state changes.

Playbooks written this way disrespect many infrastructure-as-code principles. They're not readable by human beings, are hard to reuse and parameterize, and don't follow the declarative model encouraged by most configuration management tools. They also fail to be idempotent and to converge to the declared state.

Bad playbooks can jeopardize your automation adoption. Instead of harnessing configuration management tools to increase your speed, they have the same problems as an imperative automation approach based on scripts and command execution. This creates a scenario where you're using Ansible just as a means to deliver your old scripts, copying what you already have into YAML files.

Here's how to rewrite this example to follow infrastructure-as-code principles.

```
- name: XPTO
  xpto:
    name: abc
    state: present
    config:
      client: xyz
      url: http://beta
      pattern: "*.*"
```

The benefits of this approach, based on custom modules, include:

  * It's declarative—resources are properly represented in YAML.
  * It's idempotent.
  * It converges from the declared state to the current state.
  * It's readable by human beings.
  * It's easily parameterized or reused.



### Implementing a custom module

Let's use [WildFly][5], an open source Java application server, as an example to introduce a custom module for our not-so-good playbook:

```
 - name: Read datasource
   command: "jboss-cli.sh -c '/subsystem=datasources/data-source=DemoDS:read-resource()'"
   register: datasource

 - name: Create datasource
   command: "jboss-cli.sh -c '/subsystem=datasources/data-source=DemoDS:add(driver-name=h2, user-name=sa, password=sa, min-pool-size=20, max-pool-size=40, connection-url=.jdbc:h2:mem:demo;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE..)'"
   when: 'datasource.stdout | outcome => failed'
```

Problems:

  * It's not declarative.
  * JBoss-CLI returns plaintext in a JSON-like syntax; therefore, this approach is very fragile, since we need a type of parser for this notation. Even a seemingly simple parser can be too complex to treat many [exceptions][6].
  * JBoss-CLI is just an interface to send requests to the management API (port 9990).
  * Sending an HTTP request is more efficient than opening a new JBoss-CLI session, connecting, and sending a command.
  * It does not converge to the desired state; it only creates the resource when it doesn't exist.



A custom module for this would look like:

```
- name: Configure datasource
      jboss_resource:
        name: "/subsystem=datasources/data-source=DemoDS"
        state: present
        attributes:
          driver-name: h2
          connection-url: "jdbc:h2:mem:demo;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE"
          jndi-name: "java:jboss/datasources/DemoDS"
          user-name: sa
          password: sa
          min-pool-size: 20
          max-pool-size: 40
```

This playbook is declarative, idempotent, more readable, and converges to the desired state regardless of the current state.

### Why learn to build custom modules?

Good reasons to learn how to build custom modules include:

  * Improving existing modules
  * You have bad playbooks and want to improve them, or …
  * You don't, but want to avoid having bad playbooks.
  * Knowing how to build a module considerably improves your ability to debug problems in playbooks, thereby increasing your productivity.



> "…abstractions save us time working, but they don't save us time learning." —Joel Spolsky, [The Law of Leaky Abstractions][7]

#### Custom Ansible modules 101

  * JSON (JavaScript Object Notation) in stdout: that's the contract!
  * They can be written in any language, but …
  * Python is usually the best option (or the second best)
  * Most modules delivered with Ansible ( **lib/ansible/modules** ) are written in Python and should support compatible versions.



#### The Ansible way

  * First step:

```
git clone https://github.com/ansible/ansible.git
```

  * Navigate in **lib/ansible/modules/** and read the existing modules code.

  * Your tools are: Git, Python, virtualenv, pdb (Python debugger)

  * For comprehensive instructions, consult the [official docs][8].




#### An alternative: drop it in the library directory

```
library/                  # if any custom modules, put them here (optional)
module_utils/             # if any custom module_utils to support modules, put them here (optional)
filter_plugins/           # if any custom filter plugins, put them here (optional)

site.yml                  # master playbook
webservers.yml            # playbook for webserver tier
dbservers.yml             # playbook for dbserver tier

roles/
    common/               # this hierarchy represents a "role"
        library/          # roles can also include custom modules
        module_utils/     # roles can also include custom module_utils
        lookup_plugins/   # or other types of plugins, like lookup in this case
```

  * It's easier to start.
  * Doesn't require anything besides Ansible and your favorite IDE/text editor.
  * This is your best option if it's something that will be used internally.



**TIP:** You can use this directory layout to overwrite existing modules if, for example, you need to patch a module.

#### First steps

You could do it in your own—including using another language—or you could use the AnsibleModule class, as it is easier to put JSON in the stdout ( **exit_json()** , **fail_json()** ) in the way Ansible expects ( **msg** , **meta** , **has_changed** , **result** ), and it's also easier to process the input ( **params[]** ) and log its execution ( **log()** , **debug()** ).

```
def main():

  arguments = dict(name=dict(required=True, type='str'),
                  state=dict(choices=['present', 'absent'], default='present'),
                  config=dict(required=False, type='dict'))

  module = AnsibleModule(argument_spec=arguments, supports_check_mode=True)
  try:
      if module.check_mode:
          # Do not do anything, only verifies current state and report it
          module.exit_json(changed=has_changed, meta=result, msg='Fez alguma coisa ou não...')

      if module.params['state'] == 'present':
          # Verify the presence of a resource
          # Desired state `module.params['param_name'] is equal to the current state?
          module.exit_json(changed=has_changed, meta=result)

      if module.params['state'] == 'absent':
          # Remove the resource in case it exists
          module.exit_json(changed=has_changed, meta=result)

  except Error as err:
      module.fail_json(msg=str(err))
```

**NOTES:** The **check_mode** ("dry run") allows a playbook to be executed or just verifies if changes are required, but doesn't perform them. **** Also, the **module_utils** directory can be used for shared code among different modules.

For the full Wildfly example, check [this pull request][9].

### Running tests

#### The Ansible way

The Ansible codebase is heavily tested, and every commit triggers a build in its continuous integration (CI) server, [Shippable][10], which includes linting, unit tests, and integration tests.

For integration tests, it uses containers and Ansible itself to perform the setup and verify phase. Here is a test case (written in Ansible) for our custom module's sample code:

```
- name: Configure datasource
 jboss_resource:
   name: "/subsystem=datasources/data-source=DemoDS"
   state: present
   attributes:
     connection-url: "jdbc:h2:mem:demo;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE"
     ...
 register: result

- name: assert output message that datasource was created
 assert:
   that:
      - "result.changed == true"
      - "'Added /subsystem=datasources/data-source=DemoDS' in result.msg"
```

#### An alternative: bundling a module with your role

Here is a [full example][11] inside a simple role:

```
[*Molecule*]() + [*Vagrant*]() + [*pytest*](): `molecule init` (inside roles/<name>)
```

It offers greater flexibility to choose:

  * Simplified setup
  * How to spin up your infrastructure: e.g., Vagrant, Docker, OpenStack, EC2
  * How to verify your infrastructure tests: Testinfra and Goss



But your tests would have to be written using pytest with Testinfra or Goss, instead of plain Ansible. If you'd like to learn more about testing Ansible roles, see my article about [using Molecule][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/developing-ansible-modules

作者：[Jairo da Silva Junior][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jairojunior
[b]: https://github.com/lujun9972
[1]: https://docs.ansible.com/ansible/latest/dev_guide/developing_plugins.html#developing-plugins
[2]: https://docs.ansible.com/ansible/latest/dev_guide/developing_modules.html
[3]: https://groups.google.com/forum/#!forum/ansible-devel
[4]: https://github.com/ansible/community/
[5]: http://www.wildfly.org/
[6]: https://tools.ietf.org/html/rfc7159
[7]: https://en.wikipedia.org/wiki/Leaky_abstraction#The_Law_of_Leaky_Abstractions
[8]: https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html#developing-modules-general
[9]: https://github.com/ansible/ansible/pull/43682/files
[10]: https://app.shippable.com/github/ansible/ansible/dashboard
[11]: https://github.com/jairojunior/ansible-role-jboss/tree/with_modules
[12]: https://opensource.com/article/18/12/testing-ansible-roles-molecule
