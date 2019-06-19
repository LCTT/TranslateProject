[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get the latest Ansible 2.8 in Fedora)
[#]: via: (https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Get the latest Ansible 2.8 in Fedora
======

![][1]

Ansible is one of the most popular automation engines in the world. It lets you automate virtually anything, from setup of a local system to huge groups of platforms and apps. It’s cross platform, so you can use it with all sorts of operating systems. Read on for more information on how to get the latest Ansible in Fedora, some of its changes and improvements, and how to put it to use.

### Releases and features

Ansible 2.8 was recently released with many fixes, features, and enhancements. It was available in Fedora mere days afterward as an official update in Fedora 29 and 30, as well as EPEL. The follow-on version 2.8.1 released two weeks ago. Again, the new release was available within a few days in Fedora.

Installation is, of course, easy to do from the official Fedora repositories [using sudo][2]:

```
$ sudo dnf -y install ansible
```

The 2.8 release has a long list of changes, and you can read them in the [Porting Guide for 2.8][3]. But they include some goodies, such as _Python interpreter discovery._ Ansible 2.8 now tries to figure out which Python is preferred by the platform it runs on. In cases where that fails, Ansible uses a fallback list. However, you can still use a variable _ansible_python_interpreter_ to set the Python interpreter.

Another change makes Ansible more consistent across platforms. Since _sudo_ is more exclusive to UNIX/Linux, and other platforms don’t have it, _become_ is now used in more places. This includes command line switches. For example, _–ask-sudo-pass_ has become _–ask-become-pass_ , and the prompt is now _BECOME password:_ instead.

There are many more features in the 2.8 and 2.8.1 releases. Do check out the [official changelog on GitHub][4] for all the details.

### Using Ansible

Maybe you’re not sure if Ansible is something you could really use. Don’t worry, you might not be alone in thinking that, because it’s so powerful. But it turns out that it’s not hard to use it even for simple or individual setups like a home with a couple computers (or even just one!).

We covered this topic earlier in the Fedora magazine as well:

> [Using Ansible to set up a workstation][5]

Give Ansible a try and see what you think. The great part about it is that Fedora stays quite up to date with the latest releases. Happy automating!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/ansible28-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://docs.ansible.com/ansible/latest/porting_guides/porting_guide_2.8.html
[4]: https://github.com/ansible/ansible/blob/stable-2.8/changelogs/CHANGELOG-v2.8.rst
[5]: https://fedoramagazine.org/using-ansible-setup-workstation/
