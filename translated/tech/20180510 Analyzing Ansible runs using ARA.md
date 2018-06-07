使用 ARA 分析 Ansible 运行
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)
[Ansible][1] 是一个多功能平台，它已经成为管理服务器和服务器配置的流行平台。如今，Ansible 大量用于通过持续集成 （CI） 进行部署和测试。

在自动化持续集成的世界中，每天都有数百个甚至数千个作业运行测试、构建、编译、部署等等，这并不罕见。

### Ansible 运行分析 （ARA） 工具

Ansible 运行生成大量控制台数据，在 CI 的环境下跟上大量的 Ansible 输出是具有挑战性的。Ansible Run Analysis（ARA） 工具使此详细输出可读并且使作业状态和调试信息更有代表性。ARA 组织记录的 playbook 数据，以便你尽可能快速和容易地搜索并找到你感兴趣的内容。

请注意，ARA 不会运行你的 playbook。相反，无论在哪它都它作为回调插件与 Ansible 集成。回调插件可以在响应事件时向 Ansible 添加新行为。它可以根据 Ansible 事件执行自定义操作，例如在主机开始执行或任务完成时执行。

与 [AWX][2] 和 [Tower][3] 相比，它们是控制整个工作流程的工具，具有仓库管理、playbook 执行，编辑功能等功能，ARA 的范围相对较窄：记录数据并提供直观的界面。这是一个相对简单的程序，易于安装和配置。

#### 安装

在系统上安装 ARA 有两种方法：

  * 使用托管在[ GitHub 帐户][4] 上的 Ansible 角色。克隆仓库并：


```
ansible-playbook Playbook.yml

```

如果 playbook 执行成功，你将看到：
```
TASK [ara : Display ara UI URL] ************************

   ok: [localhost] =&gt; {}

   "msg": "Access playbook records at http://YOUR_IP:9191"

```

注意：它从 Ansible 收集的 `ansible_default_ipv4` fact 中选择 IP 地址。如果没有收集这些 fact，请用 `roles/ara/tasks/` 文件夹中 `main.yml` 文件中的 IP 替换它。

  * ARA 是一个在 [GitHub][5] 上以 Apache v2 许可证授权的开源项目。安装说明在快速入门章节。[文档][6]和 [FAQ][7] 可在 [readthedocs.io][6] 上找到。



#### ARA 能做些什么？

下图显示了从浏览器启动 ARA 登录页面：


![ara landing page][9]

ARA 登录页面

它提供了每个主机或每个 playbook 的任务结果摘要：


![task summaries][11]

ARA 显示任务摘要

它允许你通过 playbook，play，主机、任务或状态来过滤任务结果：


![playbook runs filtered by hosts][13]

通过主机过滤 playbook 运行

借助 ARA，你可以在摘要视图中轻松查看你感兴趣的结果，无论是特定的主机还是特定的任务：


![summary of each task][15]

每项任务的详细摘要

ARA 支持在同一数据库中记录和查看多个运行。


![show gathered facts][17]

显示收集的 fact

#### 总结

ARA 是一个已经帮助我从 Ansible 运行日志和输出中了解更多的有用资源。我强烈推荐给所有的 Ansible 使用者。

请随意分享，并请在评论中告诉我你使用 ARA 的经历。

**[参见我们的相关文章，[成功使用 Ansible 的秘诀][18]]。**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/analyzing-ansible-runs-using-ara

作者：[Ajinkya Bapat][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/iamajinkya
[1]:https://www.ansible.com/
[2]:https://www.ansible.com/products/awx-project
[3]:https://www.ansible.com/products/tower
[4]:https://github.com/AjinkyaBapat/Ansible-Run-Analyser
[5]:https://github.com/dmsimard/ara
[6]:http://ara.readthedocs.io/en/latest/
[7]:http://ara.readthedocs.io/en/latest/faq.html
[8]:/file/395716
[9]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/ara_landing_page.png?itok=PoB7KfhB (ara landing page)
[10]:/file/395726
[11]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/task_summaries.png?itok=8EBP9sTG (task summaries)
[12]:/file/395731
[13]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/playbook_filtered_by_hosts.png?itok=Lol0K_My (playbook runs filtered by hosts)
[14]:/file/395736
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/summary_of_each_task.png?itok=KJnLHEZC (summary of each task)
[16]:/file/395741
[17]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/showing_gathered_facts.png?itok=FVDc6oA0 (show gathered facts)
[18]:/article/18/2/tips-success-when-getting-started-ansible
