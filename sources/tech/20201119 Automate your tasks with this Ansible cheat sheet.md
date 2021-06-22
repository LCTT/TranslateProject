[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate your tasks with this Ansible cheat sheet)
[#]: via: (https://opensource.com/article/20/11/ansible-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Automate your tasks with this Ansible cheat sheet
======
Start automating your repetitive tasks by getting to know Ansible's
modules, YAML structure, and more.
![Cheat Sheet cover image][1]

Ansible is one of the primary tools in the world of [automation and orchestration][2] because of its broad usefulness and flexibility. However, those same traits are the very reason it can be difficult to get started with [Ansible][3]. It isn't a graphical application, and yet it also isn't a scripting or programming language. But like a programming language, the answer to the common question of "what can I do with it?" is "everything," which makes it difficult to know where to begin doing _anything_.

Here's how I view Ansible: It's an "engine" that uses other people's modules to accomplish complex tasks you describe in a special "pseudo-code" text format called YAML. This means you need to have three things to get started with Ansible:

  1. Ansible
  2. A repetitive task you want to automate
  3. A basic understanding of YAML



This article aims to help you get started with these three things.

### Install Ansible

Part of Ansible's widespread popularity can be attributed to how it lets you (the user) completely ignore what operating system (OS) you're targeting. Generally, you don't have to think about whether your Ansible task will be executed on Linux, macOS, Windows, or BSD. Ansible takes care of the messy platform-specific bits for you.

However, to _run_ Ansible, you do need to have Ansible installed somewhere. The computer where Ansible is installed is called the _control node_. Any computer that Ansible targets is called a _host_.

Only the control node needs to have Ansible installed.

If you're on Linux, you can install Ansible from your software repository with your package manager.

As yet, Windows is unable to serve as an Ansible control node, although the more progress it makes toward [POSIX][4], the better things look for it, so keep a close watch on Microsoft's [Windows Subsystem for Linux (WSL)][5] product.

On macOS, you can use a third-party package manager like [Homebrew][6] or [MacPorts][7].

### Ansible modules

Ansible is just an engine. The parts that do 90% of the work are [Ansible modules][8]. These modules are programmed by lots of different people all over the world. Some have become so popular that the Ansible team adopts them and helps maintain them.

As a user, much of your interaction with Ansible is directed to its modules. Choosing a module is like choosing an app on your phone or computer: you have a task you want done, so you look for an Ansible module that claims to assist.

Most modules are tied to specific applications. For instance, the [file][9] module helps create and manage files. The [authorized_key][10] module helps manage SSH keys, [Database][11] modules help control and manipulate databases, and so on.

Part of deciding on a task to offload onto Ansible is finding the module that will help you accomplish it. Ansible plays run _tasks_, and tasks consist of Ansible keywords or Ansible modules.

### YAML and Ansible

The YAML text format is a highly structured way to feed instructions to an application, making it almost a form of code. Like a programming language, you must write YAML according to a specific set of syntax rules. A YAML file intended for Ansible is called a _playbook_, and it consists of one or more Ansible _plays_.

An Ansible play, like YAML, has a very limited structure. There are two kinds of instructions: a _sequence_ and a _mapping_. An Ansible play, as with YAML, always starts with 3 dashes (`---`).

#### Sequences

A _sequence_ element is a list. For example, here's a list of penguin species in YAML:


```
\---
\- Emperor
\- Gentoo
\- Yellow-eyed
\----
```

#### Mapping

A _mapping_ element consists of two parts: a key and a value. A _key_ in Ansible is usually a keyword defined by an Ansible module, and the value is sometimes Boolean (`true` or `false`) or some choice of parameters defined by the module, or something arbitrary, a variable, depending on what's being set.

Here's a simple mapping in YAML:


```
\---
\- Name: "A list of penguin species"
\----
```

#### Sequences and mapping

These two data types aren't mutually exclusive.

You can put a sequence into a mapping. In such a case, the sequence is a value for a mapping's key. When placing a sequence into a mapping, you indent the sequence so that it is a "descendent" (or "child") of its key:


```
\---
\- Penguins:
 - Emperor
  - Gentoo
  - Yellow-eyed
\----
```

You can also place mappings in a sequence:


```
\---
\- Penguin: Emperor
\- Mammal: Gnu
\- Planar: Demon
\----
```

Those are all the rules you need to be familiar with to write valid YAML.

### Write an Ansible play

For Ansible plays, whether you use a sequence or a mapping (or a mapping in a sequence, or a sequence in a mapping) is dictated by Ansible or the Ansible module you're using. The "language" of Ansible mostly speaks to configuration options to help you determine how and where your play will run. A quick reference to all Ansible keywords is available in the [Ansible playbook documentation][12].

From the list of keywords, you can create an opening for your play. You start with three dashes because that's how a YAML file always starts. Then you give your play a name in a mapping block. You must also define what hosts (computers) you want the play to run on, and how Ansible is meant to reach the computer.

For this example, I set the host to `localhost`, so the play runs only on _this_ computer, and the connection type to `local` (the default is `ssh`):


```
\---
\- name: "My first Ansible play"
  hosts: localhost
  connection: local
\----
```

Most of the YAML you'll write in a play is probably configuration options for a specific Ansible module. To find out what instructions a module expects from your Ansible play, refer to that module's documentation. [Modules maintained by Ansible][8] are documented on Ansible's website.

For this example, I'll use the debug module.

![Documentation for Ansible debugger module][13]

On [debug's documentation page][14], three parameters are listed:

  * `msg` is an optional string to print to the terminal.
  * `var` is an optional variable, interpreted as a string. This is mutually exclusive with `msg`, so you can use one or the other—not both.
  * `verbosity` is an integer you can use to control how verbose this debugger is. Its default is 0, so there is no threshold to pass.



It's a simple module, but the thing to look for is the YAML data type of each parameter. Can you determine from my description whether these parameters are a sequence (a list) or a mapping (a key and value pair)? Knowing what kind of YAML block to use in your play helps you write valid plays.

Here's a simple "hello world" Ansible play:


```
\---
\- name: "My first Ansible play"
  hosts: localhost
  connection: local
  tasks:
    - name: "Print a greeting"
      debug:
        msg: "Hello world"
\----
```

Notice that the play contains a `task`. This task is a mapping that contains a sequence of exactly one item. The item in this task is `name` (and its value), the module being used by the task, and a `msg` parameter (along with its value). These are all part of the task mapping, so they're indented to show inheritance.

You can test this Ansible play by using the `ansible-playbook` command with the `--check` option:


```
$ ansible-playbook --check hello.yaml
PLAY [My first Ansible play] *************************

TASK [Gathering Facts] *******************************
ok: [localhost]

TASK [Print a greeting] ******************************
ok: [localhost] =&gt; {
    "msg": "Hello world"
}

PLAY RECAP *******************************************
localhost: ok=2  changed=0  unreachable=0  failed=0
```

It's verbose, but you can debug the message in your "Print a greeting" task, right where you put it.

### Testing modules

Using a new Ansible module is like trying out a new Linux command. You read its documentation, study its syntax, and then try some tests.

There are at least two other modules you could use to write a "hello world" play: [assert][15] and [meta][16]. Try reading through the documentation for these modules, and see if you can create a simple test play based on what you learned above.

For further examples of how modules are used to get work done, visit [Ansible Galaxy][17], an open source repository of community-contributed plays.

### For a quick reference of important Ansible commands, download our [Ansible cheat sheet][18].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/ansible-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/resources/what-ansible
[4]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[5]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[6]: https://opensource.com/article/20/6/homebrew-mac
[7]: https://opensource.com/article/20/11/macports
[8]: https://docs.ansible.com/ansible/2.8/modules/modules_by_category.html
[9]: https://docs.ansible.com/ansible/2.8/modules/file_module.html#file-module
[10]: https://docs.ansible.com/ansible/2.8/modules/authorized_key_module.html#authorized-key-module
[11]: https://docs.ansible.com/ansible/2.8/modules/list_of_database_modules.html
[12]: https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html
[13]: https://opensource.com/sites/default/files/screenshot_from_2020-11-13_20-44-15.png (Documentation for Ansible debugger module)
[14]: https://docs.ansible.com/ansible/2.8/modules/debug_module.html
[15]: https://docs.ansible.com/ansible/2.8/modules/assert_module.html
[16]: https://docs.ansible.com/ansible/2.8/modules/meta_module.html
[17]: https://galaxy.ansible.com/
[18]: https://opensource.com/downloads/ansible-cheat-sheet
