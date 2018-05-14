Analyzing Ansible runs using ARA
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)
[Ansible][1] is a versatile platform that has become popular for managing servers and server configurations. Today, Ansible is used heavily to deploy and test through continuous integration (CI).

In the world of automated continuous integration, it’s not uncommon to have hundreds, if not thousands, of jobs running every day for testing, building, compiling, deploying, and more.

### The Ansible Run Analysis (ARA) tool

Ansible runs generate a large amount of console data, and keeping up with high volumes of Ansible output in the context of CI is challenging. The Ansible Run Analysis (ARA) tool makes this verbose output readable and more representative of the job status and debug information. ARA organizes recorded playbook data so you can search and find what you’re interested in as quickly and as easily as possible.

Note that ARA doesn't run your playbooks for you; rather, it integrates with Ansible as a callback plugin wherever it is. A callback plugin enables adding new behaviors to Ansible when responding to events. It can perform custom actions in response to Ansible events such as a play starting or a task completing on a host.

Compared to [AWX][2] and [Tower][3], which are tools that control the entire workflow, with features like inventory management, playbook execution, editing features, and more, the scope of ARA is comparatively narrow: It records data and provides an intuitive interface. It is a relatively simple application that is easy to install and configure.

#### Installation

There are two ways to install ARA on your system:

  * Using the Ansible role hosted on your [GitHub account][4]. Clone the repo and do:


```
ansible-playbook Playbook.yml

```

If the playbook run is successful, you will get:
```
TASK [ara : Display ara UI URL] ************************

   ok: [localhost] =&gt; {}

   "msg": "Access playbook records at http://YOUR_IP:9191"

```

Note: It picks the IP address from `ansible_default_ipv4` fact gathered by Ansible. If there is no such fact gathered, replace it with your IP in `main.yml` file in the `roles/ara/tasks/` folder.

  * ARA is an open source project available on [GitHub][5] under the Apache v2 license. Installation instructions are in the Quickstart chapter. The [documentation][6] and [FAQs][7] are available on [readthedocs.io][6].



#### What can ARA do?

The image below shows the ARA landing page launched from the browser:


![ara landing page][9]

The ARA landing page

It provides summaries of task results per host or per playbook:


![task summaries][11]

ARA displays task summaries

It allows you to filter task results by playbook, play, host, task, or status:


![playbook runs filtered by hosts][13]

Playbook runs, filtered by host

With ARA, you can easily drill down from the summary view to find the results you’re interested in, whether it’s a particular host or a specific task:


![summary of each task][15]

A detailed summary of each task

ARA supports recording and viewing multiple runs in the same database.


![show gathered facts][17]

Displaying gathered facts

#### Wrapping up

ARA is a useful resource that has helped me get more out of Ansible run logs and outputs. I highly recommend it to all Ansible ninjas out there.

Feel free to share this, and please let me know about your experience using ARA in the comments.

**[See our related story,[Tips for success when getting started with Ansible][18].]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/analyzing-ansible-runs-using-ara

作者：[Ajinkya Bapat][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
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
