[#]: collector: (lujun9972)
[#]: translator: (hj24)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Ansible to organize your SSH keys in AWS)
[#]: via: (https://fedoramagazine.org/using-ansible-to-organize-your-ssh-keys-in-aws/)
[#]: author: (Daniel Leite de Abreu https://fedoramagazine.org/author/dabreu/)

在 AWS 中使用 Ansible 来管理你的 SSH keys
======

![][1]

如果你长期使用亚马逊Web服务（AWS）中的实例，你可能会遇到下面这个常见的问题，它不是因为技术性的原因导致的，更多的是因为人类追求方便舒适的天性：当你登录一台你最近没有使用的区域的实例，你最终就会创建一个新的SSH密钥对，久而久之这最终就会造成个人拥有太多密钥，导致管理起来复杂混乱。

本文将会介绍一种在所有区域中使用你的公钥的方法。最近，一篇[Fedora Magazine article][2]介绍了另一种解决方案。但本文中的解决方案可以进一步的以更简洁和可扩展的方式实现自动化。

假设你有一个Fedora 30或31系统，其中存储了你的密钥，并且还安装了Ansible。当这两件事同时满足时，就提供了解决这个问题的办法，甚至它还能做到更多。

使用Ansible的[ec2_key 模块][3]，你可以创建一个简单的playbook来在所有区域中维护你的SSH密钥对。如果你需要增加或者删除密钥，在ansible中这就像从文件中添加和删除行一样简单。

### 设置和运行 playbook

如果要使用playbook，首先需要安装 _ec2_key_ 模块的必要依赖项：

```
$ sudo dnf install python3-boto python3-boto3
```

playbook很简单：你只需要像下面的例子一样，修改其中的密钥及其对应的名称。然后，运行playbook，它会帮你遍历所有列出的公共AWS区域。该示例还包括一些受限区域，以防你有访问权限，只需根据需要来取消对应行的注释，然后，保存文件重新运行playbook即可。

```
---
- name: Maintain an ssh key pair in ec2
  hosts: localhost
  connection: local
  gather_facts: no
  vars:
    ansible_python_interpreter: python
  tasks:
    - name: Make available your ssh public key in ec2 for new instances
      ec2_key:
        name: "YOUR KEY NAME GOES HERE"
        key_material: 'YOUR KEY GOES HERE'
        state: present
        region: "{{ item }}"
      with_items:
        - us-east-2   #US East (Ohio)
        - us-east-1   #US East (N. Virginia)
        - us-west-1   #US West (N. California)
        - us-west-2   #US West (Oregon)
        - ap-east-1   #Asia Pacific (Hong Kong)
        - ap-south-1   #Asia Pacific (Mumbai)
        - ap-northeast-2  #Asia Pacific (Seoul)
        - ap-southeast-1  #Asia Pacific (Singapore)
        - ap-southeast-2  #Asia Pacific (Sydney)
        - ap-northeast-1  #Asia Pacific (Tokyo)
        - ca-central-1   #Canada (Central)
        - eu-central-1   #EU (Frankfurt)
        - eu-west-1   #EU (Ireland)
        - eu-west-2   #EU (London)
        - eu-west-3   #EU (Paris)
        - eu-north-1   #EU (Stockholm)
        - me-south-1   #Middle East (Bahrain)
        - sa-east-1   #South America (Sao Paulo)
  #      - us-gov-east-1  #AWS GovCloud (US-East)
  #      - us-gov-west-1  #AWS GovCloud (US-West)
  #      - ap-northeast-3 #Asia Pacific (Osaka-Local)
  #      - cn-north-1   #China (Beijing)
  #      - cn-northwest-1 #China (Ningxia)
```

这个playbook需要通过API访问AWS，为此，请使用环境变量，如下所示：

```
$ AWS_ACCESS_KEY="aws-access-key-id" AWS_SECRET_KEY="aws-secret-key-id" ansible-playbook ec2-playbook.yml
```

另一个选项是安装aws cli工具并添加凭据，如以前的一篇[Fedora Magazine article][4]文章所述。如果你在线存储它们，这些参数将不建议插入到playbook中！你可以在[GitHub][5]中找到本文的playbook代码。

完成playbook之后，请确认你的密钥在AWS控制台上可用。为此，可以做如下操作：
  1. 登录你的AWS控制台
  2. 转到 **EC2 &gt; Key Pairs**
  3. 您应该会看到列出的密钥。唯一的限制是你必须使用此方法逐个区域来检查。

另一种方法是在shell中使用一个快速命令来为你做这些检查。

首先在playbook上创建一个包含所有区域的变量：

```
AWS_REGION="us-east-1 us-west-1 us-west-2 ap-east-1 ap-south-1 ap-northeast-2 ap-southeast-1 ap-southeast-2 ap-northeast-1 ca-central-1 eu-central-1 eu-west-1 eu-west-2 eu-west-3 eu-north-1 me-south-1 sa-east-1"
```

然后，执行如下循环，你就可以从aws的API获得结果：

```
for each in ${AWS_REGION} ; do aws ec2 describe-key-pairs --key-name <YOUR KEY GOES HERE> ; done
```

请记住，要执行上述操作，您需要安装 aws cli。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-to-organize-your-ssh-keys-in-aws/

作者：[Daniel Leite de Abreu][a]
选题：[lujun9972][b]
译者：[hj24](https://github.com/hj24)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dabreu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/ansible-aws-keys-816x345.jpg
[2]: https://fedoramagazine.org/ssh-key-aws-regions/
[3]: https://docs.ansible.com/ansible/latest/modules/ec2_key_module.html
[4]: https://fedoramagazine.org/aws-tools-fedora/
[5]: https://github.com/dlabreu/aws
