Ansible 入门秘诀
======

> 用 Ansible 自动化你的数据中心的关键点。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-big-data.png?itok=L34b2exg)

Ansible 是一个开源自动化工具，可以从中央控制节点统一配置服务器、安装软件或执行各种 IT 任务。它采用一对多、<ruby>无客户端<rt>agentless</rt></ruby>的机制，从控制节点上通过 SSH 发送指令给远端的客户机来完成任务（当然除了 SSH 外也可以用别的协议）。

Ansible 的主要使用群体是系统管理员，他们经常会周期性地执行一些安装、配置应用的工作。尽管如此，一些非特权用户也可以使用 Ansible，例如数据库管理员就可以通过 Ansible 用 `mysql` 这个用户来创建数据库、添加数据库用户、定义访问权限等。

让我们来看一个简单的使用场景，一位系统管理员每天要配置 100 台服务器，并且必须在每台机器上执行一系列 Bash 命令，然后交付给用户。

![](https://opensource.com/sites/default/files/u128651/mapping-bash-commands-to-ansible.png)

这是个简单的例子，但应该能够证明：在 yaml 文件里写好命令然后在远程服务器上运行，是一件非常轻松的事。而且如果运行环境不同，就可以加入判断条件，指明某些命令只能在特定的服务器上运行（如：只在那些不是 Ubuntu 或 Debian 的系统上运行 `yum` 命令）。

Ansible 的一个重要特性是用<ruby>剧本<rt>playbook</rt></ruby>来描述一个计算机系统的最终状态，所以一个剧本可以在服务器上反复执行而不影响其最终状态（LCTT 译注：即是幂等的）。如果某个任务已经被实施过了（如，“用户 `sysman` 已经存在”），那么 Ansible 就会忽略它继续执行后续的任务。

### 定义

  * <ruby>任务<rt>task</rt></ruby>：是工作的最小单位，它可以是个动作，比如“安装一个数据库服务”、“安装一个 web 服务器”、“创建一条防火墙规则”或者“把这个配置文件拷贝到那个服务器上去”。
  * <ruby>动作<rt>play</rt></ruby>： 由任务组成，例如，一个动作的内容是要“设置一个数据库，给 web 服务用”，这就包含了如下任务：1）安装数据库包；2）设置数据库管理员密码；3）创建数据库实例；4）为该实例分配权限。
  * <ruby>剧本<rt>playbook</rt></ruby>：（LCTT 译注：playbook 原指美式橄榄球队的[战术手册][5]，也常指“剧本”，此处惯例采用“剧本”译名）由动作组成，一个剧本可能像这样：“设置我的网站，包含后端数据库”，其中的动作包括：1）设置数据库服务器；2）设置 web 服务器。
  * <ruby>角色<rt>role</rt></ruby>：用来保存和组织剧本，以便分享和再次使用它们。还拿上个例子来说，如果你需要一个全新的 web 服务器，就可以用别人已经写好并分享出来的角色来设置。因为角色是高度可配置的（如果编写正确的话），可以根据部署需求轻松地复用它们。
  * <ruby>[Ansible 星系][1]<rt>Ansible Galaxy</rt></ruby>：是一个在线仓库，里面保存的是由社区成员上传的角色，方便彼此分享。它与 GitHub 紧密集成，因此这些角色可以先在 Git 仓库里组织好，然后通过 Ansible 星系分享出来。

这些定义以及它们之间的关系可以用下图来描述：

![](https://opensource.com/sites/default/files/u128651/ansible-definitions.png)

请注意上面的例子只是组织任务的方式之一，我们当然也可以把安装数据库和安装 web 服务器的剧本拆开，放到不同的角色里。Ansible 星系上最常见的角色是独立安装、配置每个应用服务，你可以参考这些安装 [mysql][2] 和  [httpd][3] 的例子。

### 编写剧本的小技巧

学习 Ansible 最好的资源是其[官方文档][4]。另外，像学习其他东西一样，搜索引擎是你的好朋友。我推荐你从一些简单的任务开始，比如安装应用或创建用户。下面是一些有用的指南：

  * 在测试的时候少选几台服务器，这样你的动作可以执行的更快一些。如果它们在一台机器上执行成功，在其他机器上也没问题。
  * 总是在真正运行前做一次<ruby>测试<rt>dry run</rt></ruby>，以确保所有的命令都能正确执行（要运行测试，加上 `--check-mode` 参数 ）。
  * 尽可能多做测试，别担心搞砸。任务里描述的是所需的状态，如果系统已经达到预期状态，任务会被简单地忽略掉。
  * 确保在 `/etc/ansible/hosts` 里定义的主机名都可以被正确解析。
  * 因为是用 SSH 与远程主机通信，主控节点必须要能接受密钥，所以你面临如下选择：1）要么在正式使用之前就做好与远程主机的密钥交换工作；2）要么在开始管理某台新的远程主机时做好准备输入 “Yes”，因为你要接受对方的 SSH 密钥交换请求（LCTT 译注：还有另一个不那么安全的选择，修改主控节点的 ssh 配置文件，将 `StrictHostKeyChecking` 设置成 “no”）。
  * 尽管你可以在同一个剧本内把不同 Linux 发行版的任务整合到一起，但为每个发行版单独编写剧本会更明晰一些。

### 总结一下

Ansible 是你在数据中心里实施运维自动化的好选择，因为它：

  * 无需客户端，所以比其他自动化工具更易安装。
  * 将指令保存在 YAML 文件中（虽然也支持 JSON），比写 shell 脚本更简单。
  * 开源，因此你也可以做出自己的贡献，让它更加强大！

你是怎样使用 Ansible 让数据中心更加自动化的呢？请在评论中分享您的经验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/tips-success-when-getting-started-ansible

作者：[Jose Delarosa][a]
译者：[jdh8383](https://github.com/jdh8383)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jdelaros1
[1]:https://galaxy.ansible.com/
[2]:https://galaxy.ansible.com/bennojoy/mysql/
[3]:https://galaxy.ansible.com/xcezx/httpd/
[4]:http://docs.ansible.com/
[5]:https://usafootball.com/football-playbook/
