[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12304-1.html)
[#]: subject: (My top 5 Ansible modules)
[#]: via: (https://opensource.com/article/19/11/ansible-modules)
[#]: author: (Mark Phillips https://opensource.com/users/markp)

我最喜欢用的 5 个 Ansible 模块
======

> 了解如何通过这些 Ansible 模块实现几乎任何事情。

![](https://img.linux.net.cn/data/attachment/album/202006/10/214614z2jv4zvet5kw322o.jpg)

在我成长的时候，我爷爷在他的花园里有一个棚子。他经常会花几个小时在那里制作和修复东西。这是在我们有互联网之前的事情，所以我花了很多时间看他在那个棚子里创造东西。虽然棚子里有很多工具，从钻头到车床到电器配件，还有很多东西我至今都无法辨认，但他使用的只是他手头的一小部分。然而，他能做到的事情似乎永远没有极限。

我之所以告诉你这个故事，是因为我觉得我的职业生涯是在一个隐喻的棚子里度过的。计算机也是如此多的工具，都在一个狭小（虚拟？）的空间里。而工具棚中又有工具棚 —— 我最喜欢的是 Ansible。最近的 2.9 版本有 3,681 个模块! **3,681 个啊！**当我在 2013 年夏天第一次开始使用 Ansible 时，1.2.1 版本只有 113 个模块，然而，正如[我当时写的][2]，我仍然可以实现任何我想象到的东西。

模块是 Ansible 的支柱，是让重任轻装上阵的齿轮。它们被设计为做好一项工作，从而实现了 [Unix 哲学][3]。我们就是这样来把这么多的模块捆绑在一起，作为乐团的指挥，Ansible 现在有很多乐器可以听从它的指挥。

回顾一下我多年来的 Ansible 剧本和角色的 Git 仓库，我发现我只用了 35 个模块。这个小的子集被用来构建大型基础设施。不过，我想知道如果用一个更小的子集可以实现什么？当我回顾这 35 个模块时，我在思考，我能否只用 5 个模块就能达到同样的效果。因此，以下是我最喜欢的五个模块，顺序无关。

### 5. authorized_key

SSH 是 Ansible 的核心，至少对于除了 Windows 以外的几乎所有其他功能都是如此。在 Ansible 中高效使用 SSH 的关键（没有双关语）是……[密钥][5]！顺便提一下，你可以用 SSH 密钥为安全性做很多非常酷的事情。值得仔细阅读 [sshd 手册页][6]中的 “authorized_keys” 部分。如果你需要精细的用户访问控制，管理 SSH 密钥可能会变得很费力，尽管我可以用接下来的两个我最爱的模块中的任何一个，但我更喜欢使用 [authorized_key][4] 这个模块，因为它[可以通过变量轻松管理][7]。

### 4. file

除了显而易见的将文件放置在某个地方的功能外，[file][8] 模块还可以设置所有权和权限。我想说的是，这样一个模块就能带来很多的好处。很大一部分安全问题也与设置权限有关，所以 [file][8] 模块和 [authorized_key][4] 可以很好地配合在一起使用。

### 3. template

操作文件内容的方法太多了，我看到很多人都在使用 [lineinfile][10]。我自己也用它做过小任务。但是，[template][9] 模块就清晰多了，因为你维护了整个文件的上下文。我更喜欢以任何人都可以*轻松*理解的方式编写 Ansible 的内容 —— 对我而言，这意味着容易理解正在发生的事情。[template][9] 的使用意味着能够看到你正在放置内容的整个文件、全部你正在改变的变量。

### 2. uri

当前发布版中的许多模块利用 Ansible 作为编排工具。它们与另一个服务对话，而不是做一些具体的事情，比如把一个文件放到一个地方。通常，这种对话也是通过 HTTP 进行的。在许多这样的模块出现之前，你*可以*直接使用 [uri][11] 模块对 API 进行编程。它是一个强大的访问工具，可以使你能够做很多事情。在我的 Ansible 虚拟棚子里，我不会少了它。

### 1. shell

这是我们工具包里的王牌、瑞士军刀。如果你为如何控制其他东西而非常苦恼，别说，说就是 [shell][12]。有人会说，我们这样说是让 Ansible 成为了 Bash 脚本 —— 但是，我想说的是，这还是有点好处的，因为可以在你的剧本和角色中使用 `name` 参数记录下每一步。对我来说，这就像一个很大的奖励一样。早在我还在做咨询的时候，我曾经帮助一个数据库管理员（DBA）迁移到 Ansible。这位 DBA 并不喜欢改变，对改变工作方法也是推三阻四。于是，为了简化迁移到 Ansible 方式，我们在 Ansible 中使用 [shell][12] 模块调用了一些现有的数据库管理脚本。并在任务中附带了翔实的 `name` 声明。

通过这五个模块，你可以实现很多事情。是的，为完成特定任务而设计的模块会让你的生活更加轻松。但是，借助简单的工程设计，你几乎可以事半功倍。Ansible 开发者 Brian Coca 是这方面的大师，[他的技巧和窍门讲座][13]总是值得一看。

* * *

你觉得我喜欢的五大模块怎么样？如果你也必须限制在这么多模块，你会选择哪五个，为什么？在下面的评论中告诉我吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/ansible-modules

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markp
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mandelbrot_set.png?itok=bmPc0np5
[2]: http://probably.co.uk/post/puppet-vs-chef-vs-ansible/
[3]: https://en.wikipedia.org/wiki/Unix_philosophy#Do_One_Thing_and_Do_It_Well
[4]: https://docs.ansible.com/ansible/latest/modules/authorized_key_module.html
[5]: https://linux.die.net/man/1/ssh-keygen
[6]: https://linux.die.net/man/8/sshd
[7]: https://github.com/phips/ansible-demos/blob/3bf59df1eb2390b31b5c42333197e2fbb7fec93f/roles/ansible-users/tasks/main.yml#L35
[8]: https://docs.ansible.com/ansible/latest/modules/file_module.html
[9]: https://docs.ansible.com/ansible/latest/modules/template_module.html
[10]: https://docs.ansible.com/ansible/latest/modules/lineinfile_module.html
[11]: https://docs.ansible.com/ansible/latest/modules/uri_module.html
[12]: https://docs.ansible.com/ansible/latest/modules/shell_module.html
[13]: https://www.ansible.com/ansible-tips-and-tricks
