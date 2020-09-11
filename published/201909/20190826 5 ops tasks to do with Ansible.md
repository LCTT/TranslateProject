[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11312-1.html)
[#]: subject: (5 ops tasks to do with Ansible)
[#]: via: (https://opensource.com/article/19/8/ops-tasks-ansible)
[#]: author: (Mark Phillips https://opensource.com/users/markphttps://opensource.com/users/adminhttps://opensource.com/users/alsweigarthttps://opensource.com/users/belljennifer43)

5 个 Ansible 运维任务
======

> 让 DevOps 少一点，OpsDev 多一点。

![gears and lightbulb to represent innovation][1]

在这个 DevOps 世界中，看起来开发（Dev）这一半成为了关注的焦点，而运维（Ops）则是这个关系中被遗忘的另一半。这几乎就好像是领头的开发告诉尾随的运维做什么，几乎所有的“运维”都是开发说要做的。因此，运维被抛到后面，降级到了替补席上。

我想看到更多的 OpsDev。因此，让我们来看看 Ansible 在日常的运维中可以帮助你什么。

![Job templates][2]

我选择在 [Ansible Tower][3] 中展示这些方案，因为我认为用户界面 （UI） 可以增色大多数的任务。如果你想模拟测试，你可以在 Tower 的上游开源版本 [AWX][4] 中测试它。

### 管理用户

在大规模环境中，你的用户将集中在活动目录或 LDAP 等系统中。但我敢打赌，仍然存在许多包含大量的静态用户的全负荷环境。Ansible 可以帮助你将这些分散的环境集中到一起。*社区*已为我们解决了这个问题。看看 [Ansible Galaxy][5] 中的 [users][6] 角色。

这个角色的聪明之处在于它允许我们通过*数据*管理用户，而无需更改运行逻辑。

![User data][7]

通过简单的数据结构，我们可以在系统上添加、删除和修改静态用户。这很有用。

### 管理 sudo

提权有[多种形式][8]，但最流行的是 [sudo][9]。通过每个 `user`、`group` 等离散文件来管理 sudo 相对容易。但一些人对给予特权感到紧张，并倾向于有时限地给予提权。因此[下面是一种方案][10]，它使用简单的 `at` 命令对授权访问设置时间限制。

![Managing sudo][11]

### 管理服务

给入门级运维团队提供[菜单][12]以便他们可以重启某些服务不是很好吗？看下面！

![Managing services][13]

### 管理磁盘空间

这有[一个简单的角色][14]，可在特定目录中查找字节大于某个大小的文件。在 Tower 中这么做时，启用[回调][15]有额外的好处。想象一下，你的监控方案发现文件系统已超过 X％ 并触发 Tower 中的任务以找出是什么文件导致的。

![Managing disk space][16]

### 调试系统性能问题

[这个角色][17]相当简单：它运行一些命令并打印输出。细节在最后输出，让你 —— 系统管理员快速浏览一眼。另外可以使用 [正则表达式][18] 在输出中找到某些条件（比如说 CPU 占用率超过 80％）。

![Debugging system performance][19]

### 总结

我已经录制了这五个任务的简短视频。你也可以在 Github 上找到[所有代码][20]！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/ops-tasks-ansible

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markphttps://opensource.com/users/adminhttps://opensource.com/users/alsweigarthttps://opensource.com/users/belljennifer43
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://opensource.com/sites/default/files/uploads/00_templates.png (Job templates)
[3]: https://www.ansible.com/products/tower
[4]: https://github.com/ansible/awx
[5]: https://galaxy.ansible.com
[6]: https://galaxy.ansible.com/singleplatform-eng/users
[7]: https://opensource.com/sites/default/files/uploads/01_users_data.png (User data)
[8]: https://docs.ansible.com/ansible/latest/plugins/become.html
[9]: https://www.sudo.ws/intro.html
[10]: https://github.com/phips/ansible-demos/tree/master/roles/sudo
[11]: https://opensource.com/sites/default/files/uploads/02_sudo.png (Managing sudo)
[12]: https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#surveys
[13]: https://opensource.com/sites/default/files/uploads/03_services.png (Managing services)
[14]: https://github.com/phips/ansible-demos/tree/master/roles/disk
[15]: https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#provisioning-callbacks
[16]: https://opensource.com/sites/default/files/uploads/04_diskspace.png (Managing disk space)
[17]: https://github.com/phips/ansible-demos/tree/master/roles/gather_debug
[18]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html#regular-expression-filters
[19]: https://opensource.com/sites/default/files/uploads/05_debug.png (Debugging system performance)
[20]: https://github.com/phips/ansible-demos
