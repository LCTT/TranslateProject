How to create AWS ec2 key using Ansible
======

I wanted to create Amazon EC2 Key pair using Ansible tool. I do not want to use AWS CLI. Is it possible to create AWS ec2 key using Ansible?

You need to use ec2_key module of Ansible. This module has a dependency on python-boto version 2.5 or above. boto is nothing but a python interface to Amazon Web Services using API. You can use boto for services like Amazon S3, Amazon EC2 and others. In short, you need ansible installed along with boto module. Let us see how to install boto and use it with Ansbile.

### Step 1 – [Install latest version of Ansible on Ubuntu Linux][1]

You must [configure the PPA on your system to install the latest version of ansible][2]. To manage the repositories that you install software from various PPA (Personal Package Archives). It allow you to upload Ubuntu source packages to be built and published as an apt repository by Launchpad. Type the following [apt-get command][3] or [apt command][4]:
```
$ sudo apt update 
$ sudo apt upgrade 
$ sudo apt install software-properties-common
```
Next add ppa:ansible/ansible to your system’s Software Source:
```
$ sudo apt-add-repository ppa:ansible/ansible
```
Update your repos and install ansible:
```
$ sudo apt update 
$ sudo apt install ansible
```
Install boto:
```
$ pip3 install boto3
```

#### A note about installing Ansible on CentOS/RHEL 7.x

You [need to setup EPEL repo on a CentOS and RHEL 7.x][5] along with the [yum command][6]:
```
$ cd /tmp 
$ wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
$ ls *.rpm 
$ sudo yum install epel-release-latest-7.noarch.rpm 
$ sudo yum install ansible
```
Install boto:
```
$ pip install boto3
```

### Step 2 – Configure boto

You need to setup AWS credentials/API keys. See “[AWS Security Credentials][7]” documents on how to create a programmatic API key. Create a directory called ~/.aws using the mkdir command and setup API keys:
```
$ mkdir -pv ~/.aws/ 
$ vi ~/.aws/credentials
```
```
[default]
aws_access_key_id = YOUR-ACCESS-KEY-HERE
aws_secret_access_key = YOUR-SECRET-ACCESS-KEY-HERE
```

Also setup default [AWS region][8]:
`$ vi ~/.aws/config`
Sample outputs:
```
[default]
region = us-west-1
```

Test your boto setup with API by creating a simple python program named test-boto.py:
```
#!/usr/bin/python3
# A simple program to test boto and print s3 bucket names
import boto3
t = boto3.resource('s3')
for b in t.buckets.all():
 print(b.name)
```

Run it as follows:
`$ python3 test-boto.py`
Sample outputs:
```
nixcraft-images
nixcraft-backups-cbz
nixcraft-backups-forum

```

The output confirmed that Python-boto working correctly using AWS API.

### Step 3 – Create AWS ec2 key using Ansible

Create a playbook named ec2.key.yml as follows:
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

Where,

  * ec2_key: – Maintains ec2 key pair.
  * name: nixcraft_key – Name of the key pair.
  * region: us-west-1 – The AWS region to use.
  * register: ec2_key_result : Save result of generated key to ec2_key_result variable.
  * copy: content="{{ ec2_key_result.key.private_key }}" dest="./aws.nixcraft.pem" mode=0600 : Sets the contents of ec2_key_result.key.private_key to a file named aws.nixcraft.pem in the current directory. Set mode of the file to 0600 (unix file permissions).
  * when: ec2_key_result.changed : Only save when ec2_key_result changed is set to true. We don’t want to overwrite our key file.



You must create hosts file as follows too:
```
[local]
localhost

```

Run your playbook as follows:
`$ ansible-playbook -i hosts ec2.key.yml`
![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-create-AWS-ec2-key-using-Ansible.jpg)
At the end you should have a private key named aws.nixcraft.pem that you can use with AWS EC2. To view your key use the [cat command][9]:
```
$ cat aws.nixcraft.pem
```
If you have EC2 VM, use it as follows:
```
$ ssh -i aws.nixcraft.pem user@ec2-vm-dns-name
```

#### Finding out info about python data structure variable names such as ec2_key_result.changed and ec2_key_result.key.private_key

You must be wondering how come I am using variable names such as ec2_key_result.changed and ec2_key_result.key.private_key. Are they defined somewhere? Values are returned from API calls. Simply run the ansible-playbook command with the -v option to see such info:
`$ ansible-playbook -v -i hosts ec2.key.yml`
![](https://www.cyberciti.biz/media/new/faq/2018/02/ansible-verbose-output.jpg)

### How do I delete a key?

Use the following ec2-key-delete.yml:
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

Run it as follows:
`$ ansible-playbook -i hosts ec2-key-delete.yml`


### about the author

The author is the creator of nixCraft and a seasoned sysadmin, DevOps engineer, and a trainer for the Linux operating system/Unix shell scripting. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[RSS/XML feed][10]** or [weekly email newsletter][11].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-create-aws-ec2-key-using-ansible/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
