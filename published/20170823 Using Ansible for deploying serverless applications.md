使用 Ansible 部署无服务（serverless）应用
============================================================

> <ruby>无服务<rt>serverless</rt></ruby>是<ruby>托管服务<rt>managed service</rt></ruby>发展方向的又一步，并且与 Ansible 的无代理体系结构相得益彰。

![Using Ansible for deploying serverless applications](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY "Using Ansible for deploying serverless applications")

[Ansible][8] 被设计为实际工作中的最简化的部署工具。这意味着它不是一个完整的编程语言。你需要编写定义任务的 YAML 模板，并列出任何需要自动完成的任务。

大多数人认为 Ansible 是一种更强大的“处于 for 循环中的 SSH”，在简单的使用场景下这是真的。但其实 Ansible 是_任务_，而非 SSH。在很多情况下，我们通过 SSH 进行连接，但它也支持 Windows 机器上的 Windows 远程管理（WinRM），以及作为云服务的通用语言的 HTTPS API 之类的东西。

在云中，Ansible 可以在两个独立的层面上操作：<ruby>控制面<rt>control plane</rt></ruby>和<ruby>实例资源<rt>on-instance resource</rt></ruby>。控制面由所有_没有_运行在操作系统上的东西组成。包括设置网络、新建实例、供给更高级别的服务，如亚马逊的 S3 或 DynamoDB，以及保持云基础设施安全和服务客户​​所需的一切。

实例上的工作是你已经知道 Ansible 可以做的：启动和停止服务、配置文件<ruby>模版化<rt>templating</rt></ruby>、安装软件包以及通过 SSH 执行的所有与操作系统相关的操作。

现在，什么是<ruby>[无服务][9]<rt>serverless</rt></ruby>呢？这要看你问谁，无服务要么是对公有云的无限延伸，或者是一个全新的范例，其中所有的东西都是 API 调用，以前从来没有这样做过。

Ansible 采取第一种观点。在 “无服务” 是专门术语之前，用户不得不管理和配置 EC2 实例、虚拟私有云 （VPC） 网络以及其他所有内容。无服务是托管服务方向迈出的另一步，并且与 Ansible 的无代理体系结构相得益彰。

在我们开始 [Lambda][10] 示例之前，让我们来看一个简单的配置 CloudFormation 栈任务：

```
- name: Build network
  cloudformation:
    stack_name: prod-vpc
    state: present
    template: base_vpc.yml
```

编写这样的任务只需要几分钟，但它是构建基础架构所涉及的最后的半手动步骤 - 点击 “Create Stack” - 这将 playbook 与其他放在一起。现在你的 VPC 只是在建立新区域时可以调用的另一项任务了。

由于云提供商是你帐户中发生些什么的真相来源，因此 Ansible 有许多方法来取回并使用 ID、名称和其他参数来过滤和查询运行的实例或网络。以 `cloudformation_facts` 模块为例，我们可以从我们刚刚创建的模板中得到子网 ID、网络范围和其他数据。

```
- name: Pull all new resources back in as a variable
  cloudformation_facts:
    stack_name: prod-vpc
  register: network_stack
```

对于无服务应用，除了 DynamoDB 表，S3 bucket 和其他任何其他功能之外，你肯定还需要一个 Lambda 函数的补充。幸运的是，通过使用 `lambda` 模块， Lambda 函数可以以上次任务的堆栈相同的方式创建：

```
- lambda:
    name: sendReportMail
    zip_file: "{{ deployment_package }}"
    runtime: python3.6
    handler: report.send
    memory_size: 1024
    role: "{{ iam_exec_role }}"
  register: new_function
```

如果你有其他想用来交付无服务应用的工具，这也是可以的。开源的[无服务框架][11]有自己的 Ansible 模块，它也可以工作：

```
- serverless:
    service_path: '{{ project_dir }}'
    stage: dev
  register: sls
- name: Serverless uses CloudFormation under the hood, so you can easily pull info back into Ansible
  cloudformation_facts:
    stack_name: "{{ sls.service_name }}"
  register: sls_facts
```

这不是你需要的全部，因为无服务项目也必须存在，你将在那里大量的定义你的函数和事件源。对于此例，我们将制作一个响应 HTTP 请求的函数。无服务框架使用 YAML 作为其配置语言（和 Ansible 一样），所以这应该看起来很熟悉。

```
# serverless.yml
service: fakeservice

provider:
  name: aws
  runtime: python3.6

functions:
  main:
    handler: test_function.handler
    events:
      - http:
          path: /
          method: get
```

在 [AnsibleFest][12] 中，我将介绍这个例子和其他深入的部署策略，以最大限度地利用你已经拥有的 playbook 和基础设施，还有新的无服务实践。无论你是否能到，我希望这些例子可以让你开始使用 Ansible，无论你是否有任何服务要管理。

_AnsibleFest 是一个单日会议，汇集了数百名 Ansible 用户、开发人员和行业合作伙伴。加入我们吧，这里有产品更新、鼓舞人心的交谈、技术深度潜水，动手演示和整天的网络。_

（题图： opensource.com）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/ansible-serverless-applications

作者：[Ryan Scott Brown][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ryansb
[1]:https://www.ansible.com/how-ansible-works?intcmp=701f2000000h4RcAAI
[2]:https://www.ansible.com/ebooks?intcmp=701f2000000h4RcAAI
[3]:https://www.ansible.com/quick-start-video?intcmp=701f2000000h4RcAAI
[4]:https://docs.ansible.com/ansible/latest/intro_installation.html?intcmp=701f2000000h4RcAAI
[5]:https://opensource.com/article/17/8/ansible-serverless-applications?rate=zOgBPQUEmiTctfbajpu_TddaH-8b-ay3pFCK0b43vFw
[6]:https://www.eventbrite.com/e/ansiblefest-san-francisco-2017-tickets-34008433139
[7]:https://opensource.com/user/12043/feed
[8]:https://www.ansible.com/
[9]:https://en.wikipedia.org/wiki/Serverless_computing
[10]:https://aws.amazon.com/lambda/
[11]:https://serverless.com/
[12]:https://www.ansible.com/ansiblefest?intcmp=701f2000000h4RcAAI
[13]:https://opensource.com/users/ryansb
[14]:https://opensource.com/users/ryansb
