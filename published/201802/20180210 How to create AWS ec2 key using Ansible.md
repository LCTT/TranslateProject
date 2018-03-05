如何使用 Ansible 创建 AWS ec2 密钥
======

**我想使用 Ansible 工具创建 Amazon EC2 密钥对。不想使用 AWS CLI 来创建。可以使用 Ansible 来创建 AWS ec2 密钥吗？**

你需要使用 Ansible 的 ec2_key 模块。这个模块依赖于 python-boto 2.5 版本或者更高版本。 boto 是亚马逊 Web 服务的一个 Python API。你可以将 boto 用于 Amazon S3、Amazon EC2 等其他服务。简而言之，你需要安装 Ansible 和 boto 模块。我们一起来看下如何安装 boto 并结合 Ansible 使用。

### 第一步 - 在 Ubuntu 上安装最新版本的 Ansible

你必须[给你的系统配置 PPA 来安装最新版的 Ansible][2]。为了管理你从各种 PPA（Personal Package Archives）安装软件的仓库，你可以上传 Ubuntu 源码包并编译，然后通过 Launchpad 以 apt 仓库的形式发布。键入如下命令 [apt-get 命令][3]或者 [apt 命令][4]：

```
$ sudo apt update 
$ sudo apt upgrade 
$ sudo apt install software-properties-common
```

接下来给你的系统的软件源中添加 `ppa:ansible/ansible`。

```
$ sudo apt-add-repository ppa:ansible/ansible
```

更新你的仓库并安装 Ansible：

```
$ sudo apt update 
$ sudo apt install ansible
```

安装 boto：

```
$ pip3 install boto3
```

#### 关于在CentOS/RHEL 7.x上安装 Ansible 的注意事项

你[需要在 CentOS 和 RHEL 7.x 上配置 EPEL 源][5]和 [yum命令][6]

```
$ cd /tmp 
$ wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
$ ls *.rpm 
$ sudo yum install epel-release-latest-7.noarch.rpm 
$ sudo yum install ansible
```

安装 boto：

```
$ pip install boto3
```

### 第二步 2 – 配置 boto

你需要配置 AWS credentials/API 密钥。参考 “[AWS Security Credentials][7]” 文档如何创建 API key。用 `mkdir` 命令创建一个名为 `~/.aws` 的目录，然后配置 API key：

```
$ mkdir -pv ~/.aws/ 
$ vi ~/.aws/credentials
```
```
[default]
aws_access_key_id = YOUR-ACCESS-KEY-HERE
aws_secret_access_key = YOUR-SECRET-ACCESS-KEY-HERE
```

还需要配置默认 [AWS 区域][8]：

```
$ vi ~/.aws/config
```

输出样例如下：

```
[default]
region = us-west-1
```

通过创建一个简单的名为 `test-boto.py` 的 Python 程序来测试你的 boto 配置是否正确：

```
#!/usr/bin/python3
# A simple program to test boto and print s3 bucket names
import boto3
t = boto3.resource('s3')
for b in t.buckets.all():
 print(b.name)
``` 

按下面方式来运行该程序：

```
$ python3 test-boto.py
```

输出样例：

```
nixcraft-images
nixcraft-backups-cbz
nixcraft-backups-forum
```

上面输出可以确定 Python-boto 可以使用 AWS API 正常工作。

### 步骤 3 - 使用 Ansible 创建 AWS ec2 密钥

创建一个名为 `ec2.key.yml` 的剧本，如下所示：

```
---
- hosts: local
  connection: local
  gather_facts: no
  tasks:
 
 - name: Create a new EC2 key
   ec2_key:
   name: nixcraft-key
   region: us-west-1
   register: ec2_key_result
 
 - name: Save private key
   copy: content="{{ ec2_key_result.key.private_key }}" dest="./aws.nixcraft.pem" mode=0600
   when: ec2_key_result.changed
```

其中，

  * `ec2_key:` – ec2 密钥对。
  * `name: nixcraft_key` – 密钥对的名称。
  * `region: us-west-1` – 使用的 AWS 区域。
  * `register: ec2_key_result` – 保存生成的密钥到 ec2_key_result 变量。
  * `copy: content="{{ ec2_key_result.key.private_key }}" dest="./aws.nixcraft.pem" mode=0600` – 将 `ec2_key_result.key.private_key` 的内容保存到当前目录的一个名为 `aws.nixcraft.pem` 的文件中。设置该文件的权限为 `0600` （unix 文件权限）。
  * `when: ec2_key_result.changed` – 仅仅在 `ec2_key_result` 改变时才保存。我们不想覆盖你的密钥文件。

你还必须创建如下 `hosts` 文件：

```
[local]
localhost
```

如下运行你的剧本：

```
$ ansible-playbook -i hosts ec2.key.yml
```

![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-create-AWS-ec2-key-using-Ansible.jpg)

最后你应该有一个名为 `aws.nixcraft.pem 私钥，该私钥可以和 AWS EC2 一起使用。使用 [cat 命令][9]查看你的密钥：

```
$ cat aws.nixcraft.pem
```

如果你有 EC2 虚拟机，请按如下方式使用：

```
$ ssh -i aws.nixcraft.pem user@ec2-vm-dns-name
```

**查看有关 python 数据结构变量名的信息，比如 ec2_key_result.changed 和 ec2_key_result.key.private_key**

你一定在想我是如何使用变量名的，比如 `ec2_key_result.changed` 和 `ec2_key_result.key.private_key`。它们在哪里定义过吗？变量的值是通过 API 调用返回的。简单地使用 `-v` 选项运行 `ansible-playbook` 命令来查看这样的信息：

```
$ ansible-playbook -v -i hosts ec2.key.yml
```

![](https://www.cyberciti.biz/media/new/faq/2018/02/ansible-verbose-output.jpg)

### 我该如何删除一个密钥？

使用如下 `ec2-key-delete.yml`：

```
---
- hosts: local
  connection: local
  gather_facts: no
  tasks:
 
 - name: Delete a EC2 key
   ec2_key:
   name: nixcraft-key
   region: us-west-1
# absent means delete keypair
   state: absent
```

按照如下方式运行：

```
$ ansible-playbook -i hosts ec2-key-delete.yml
```

### 关于作者

作者是 nixCraft 的创始人，是一个经验丰富的系统管理员，DevOps 工程师，同时是一个 Linux 操作系统/Unix shell 脚本培训师。**通过 [RSS/XML 提要][10]或[每周邮件简讯][11]获得关于系统管理，Linux/Unix和开放源码主题的最新教程。**

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-create-aws-ec2-key-using-ansible/

作者：[Vivek Gite][a]
译者：[qianghaohao](https://github.com/qianghaohao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/how-to-install-and-configure-latest-version-of-ansible-on-ubuntu-linux/
[2]:https://www.cyberciti.biz/faq/ubuntu-sudo-add-apt-repository-command-not-found-error/
[3]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[4]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[7]:https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html
[8]:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
[9]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[10]:https://www.cyberciti.biz/atom/atom.xml
[11]:https://www.cyberciti.biz/subscribe-to-weekly-linux-unix-newsletter-for-sysadmin/
