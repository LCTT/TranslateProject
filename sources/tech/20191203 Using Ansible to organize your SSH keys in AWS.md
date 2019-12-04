[#]: collector: (lujun9972)
[#]: translator: (hj24)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Ansible to organize your SSH keys in AWS)
[#]: via: (https://fedoramagazine.org/using-ansible-to-organize-your-ssh-keys-in-aws/)
[#]: author: (Daniel Leite de Abreu https://fedoramagazine.org/author/dabreu/)

Using Ansible to organize your SSH keys in AWS
======

![][1]

If you’ve worked with instances in Amazon Web Services (AWS) for a long time, you may run into this common issue. It’s not technical, but more to do with the human nature of getting too comfortable. When you launch a new instance in a region you haven’t used recently, you may end up creating a new SSH key pair. This leads to having too many keys, which can become complicated and disordered.

This article shows you a way to have your public key in all regions. A recent [Fedora Magazine article][2] includes one solution. But the solution in this article is automated even further, and in a more concise and scalable way.

Say you have a Fedora 30 or 31 desktop system where your key is stored, and Ansible is installed as well. These two things together provide the solution to this problem and many more.

With Ansible’s [ec2_key module][3], you can create a simple playbook that will maintain your SSH key pair in all regions. If you need to add or remove keys, it’s as simple as adding and removing lines from a file.

### Setting up and running the playbook

To use the playbook, first install necessary dependencies for the _ec2_key_ module:

```
$ sudo dnf install python3-boto python3-boto3
```

The playbook is simple: you need only to change your key and its name as in the example below. After that, run the playbook and it iterates over all the public AWS regions listed. The example also includes the restricted regions in case you have access. To include them, uncomment each line as needed, save the file, and then run the playbook again.

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

This playbook requires AWS access via API, as well. To do this, use environment variables as follows:

```
$ AWS_ACCESS_KEY="aws-access-key-id" AWS_SECRET_KEY="aws-secret-key-id" ansible-playbook ec2-playbook.yml
```

Another option is to install the aws cli tools and add the credentials as explained in a [previous Fedora Magazine article][4]. It is **not recommended** to insert these values in the playbook if you store it anywhere online! You can find this playbook code on [GitHub][5].

After the playbook finishes, confirm that your key is available on the AWS console. To do that:

  1. Log into your AWS console
  2. Go to **EC2 &gt; Key Pairs**
  3. You should see your key listed. The only limitation is that you have to check region-by-region with this method.



Another way is to use a quick command in a shell to do this check for you.

First create a variable with all regions on the playbook:

```
AWS_REGION="us-east-1 us-west-1 us-west-2 ap-east-1 ap-south-1 ap-northeast-2 ap-southeast-1 ap-southeast-2 ap-northeast-1 ca-central-1 eu-central-1 eu-west-1 eu-west-2 eu-west-3 eu-north-1 me-south-1 sa-east-1"
```

Then do a for loop and you will get the result from aws API:

```
for each in ${AWS_REGION} ; do aws ec2 describe-key-pairs --key-name <YOUR KEY GOES HERE> ; done
```

Keep in mind that to do the above you need to have the aws cli installed.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-to-organize-your-ssh-keys-in-aws/

作者：[Daniel Leite de Abreu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dabreu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/ansible-aws-keys-816x345.jpg
[2]: https://fedoramagazine.org/ssh-key-aws-regions/
[3]: https://docs.ansible.com/ansible/latest/modules/ec2_key_module.html
[4]: https://fedoramagazine.org/aws-tools-fedora/
[5]: https://github.com/dlabreu/aws
