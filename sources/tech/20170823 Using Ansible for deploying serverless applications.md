Using Ansible for deploying serverless applications
============================================================

### Serverless is another step in the direction of managed services and plays nice with Ansible's agentless architecture.

![Using Ansible for deploying serverless applications](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY "Using Ansible for deploying serverless applications")
Image by : opensource.com

[Ansible][8] is designed as the simplest deployment tool that actually works. What that means is that it's not a full programming language. You write YAML templates that define tasks and list whatever tasks you need to automate your job.

Most people think of Ansible as a souped-up version of "SSH in a 'for' loop," and that's true for simple use cases. But really Ansible is about  _tasks_ , not about SSH. For a lot of use cases, we connect via SSH but also support things like Windows Remote Management (WinRM) for Windows machines, different protocols for network devices, and the HTTPS APIs that are the lingua franca of cloud services.

More on Ansible

*   [How Ansible works][1]

*   [Free Ansible eBooks][2]

*   [Ansible quick start video][3]

*   [Download and install Ansible][4]

In a cloud, Ansible can operate on two separate layers: the control plane and the on-instance resources. The control plane consists of everything  _not_  running on the OS. This includes setting up networks, spawning instances, provisioning higher-level services like Amazon's S3 or DynamoDB, and everything else you need to keep your cloud infrastructure secure and serving customers.

On-instance work is what you already know Ansible for: starting and stopping services, templating config files, installing packages, and everything else OS-related that you can do over SSH.

Now, what about [serverless][9]? Depending who you ask, serverless is either the ultimate extension of the continued rush to the public cloud or a wildly new paradigm where everything is an API call, and it's never been done before.

Ansible takes the first view. Before "serverless" was a term of art, users had to manage and provision EC2 instances, virtual private cloud (VPC) networks, and everything else. Serverless is another step in the direction of managed services and plays nice with Ansible's agentless architecture.

Before we go into a [Lambda][10] example, let's look at a simpler task for provisioning a CloudFormation stack:

```
- name: Build network
  cloudformation:
    stack_name: prod-vpc
    state: present
    template: base_vpc.yml
```

Writing a task like this takes just a couple minutes, but it brings the last semi-manual step involved in building your infrastructure—clicking "Create Stack"—into a playbook with everything else. Now your VPC is just another task you can call when building up a new region.

Since cloud providers are the real source of truth when it comes to what's really happening in your account, Ansible has a number of ways to pull that back and use the IDs, names, and other parameters to filter and query running instances or networks. Take for example the **cloudformation_facts** module that we can use to get the subnet IDs, network ranges, and other data back out of the template we just created.

```
- name: Pull all new resources back in as a variable
  cloudformation_facts:
    stack_name: prod-vpc
  register: network_stack
```

For serverless applications, you'll definitely need a complement of Lambda functions in addition to any other DynamoDB tables, S3 buckets, and whatever else. Fortunately, by using the **lambda** modules, Lambda functions can be created in the same way as the stack from the last tasks:

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

If you have another tool that you prefer for shipping the serverless parts of your application, that works as well. The open source [Serverless Framework][11] has its own Ansible module that will work just as well:

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

That's not quite everything you need, since the serverless project also must exist, and that's where you'll do the heavy lifting of defining your functions and event sources. For this example, we'll make a single function that responds to HTTP requests. The Serverless Framework uses YAML as its config language (as does Ansible), so this should look familiar.

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

At [AnsibleFest][12], I'll be covering this example and other in-depth deployment strategies to take the best advantage of the Ansible playbooks and infrastructure you already have, along with new serverless practices. Whether you're able to be there or not, I hope these examples can get you started using Ansible—whether or not you have any servers to manage.

 _AnsibleFest is a _  _day-long_  _ conference bringing together hundreds of Ansible users, developers, and industry partners. Join us for product updates, inspirational talks, tech deep dives, hands-on demos and a day of networking. Get your tickets to AnsibleFest in San Francisco on September 7\. Save 25% on [**registration**][6] with the discount code **OPENSOURCE**._

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/ansible-serverless-applications

作者：[Ryan Scott Brown ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
