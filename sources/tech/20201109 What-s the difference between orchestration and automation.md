[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's the difference between orchestration and automation?)
[#]: via: (https://opensource.com/article/20/11/orchestration-vs-automation)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

What's the difference between orchestration and automation?
======
Both terms imply that things happen without your direct intervention.
But the way you get to those results, and the tools you use to make them
happen, differ.
![doodles of arrows moving in different directions][1]

For the longest time, it seemed the only thing any sysadmin cared about was automation. Recently, though, the mantra seems to have changed from automation to orchestration, leading many puzzled admins to wonder: "What's the difference?"

The difference between automation and orchestration is primarily in intent and tooling. Technically, automation can be considered a subset of orchestration. While orchestration suggests many moving parts, automation usually refers to a singular task or a small number of strongly related tasks. Orchestration works at a higher level and is expected to make decisions based on changing conditions and requirements.

However, this view shouldn't be taken too literally because both terms—_automation_ and _orchestration_—do have implications when they're used. The results of both are functionally the same: things happen without your direct intervention. But the way you get to those results, and the tools you use to make them happen, are different, or at least the terms are used differently depending on what tools you've used.

For instance, automation usually involves scripting, often in Bash or Python or similar, and it often suggests scheduling something to happen at either a precise time or upon a specific event. However, orchestration often begins with an application that's purpose-built for a set of tasks that may happen irregularly, on demand, or as a result of any number of trigger events, and the exact results may even depend on a variety of conditions.

### Decisionmaking and IT orchestration

Automation suggests that a sysadmin has invented a system to cause a computer to do something that would normally have to be done manually. In automation, the sysadmin has already made most of the decisions on what needs to be done, and all the computer must do is execute a "recipe" of tasks.

Orchestration suggests that a sysadmin has set up a system to do something on its own based on a set of rules, parameters, and observations. In orchestration, the sysadmin knows the desired end result but leaves it up to the computer to decide what to do.

Consider Ansible and Bash. Bash is a popular shell and scripting language used by sysadmins to accomplish practically everything they do during a given workday. Automating with Bash is straightforward: Instead of typing commands into an interactive session, you type them into a text document and save the file as a shell script. Bash runs the shell script, executing each command in succession. There's room for some conditional decisionmaking, but usually, it's no more complex than simple if-then statements, each of which must be coded into the script.

Ansible, on the other hand, uses playbooks in which a sysadmin describes the desired state of the computer. It lists requirements that must be met before Ansible can consider the job done. When Ansible runs, it takes action based on the current state of the computer compared to the desired state, based on the computer's operating system, and so on. A playbook doesn't contain specific commands, instead leaving those decisions up to Ansible itself.

Of course, it's particularly revealing that Ansible is referred to as an automation—not an orchestration—tool. The difference can be subtle, and the terms definitely overlap.

### Orchestration and the cloud

Say you need to convert a file type that's regularly uploaded to your server by your users.

The manual solution would be to check a directory for uploaded content every morning, open the file, and then save it in a different format. This solution is slow, inefficient, and probably could happen only once every 24 hours because you're a busy person.

**[Read next: [How to explain orchestration][2]]**

You could automate the task. Were you to do that, you might write a PHP or a Node.js script to detect when a file has been uploaded. The script would perform the conversion and send an alert or make a log entry to confirm the conversion was successful. You could improve the script over time to allow users to interact with the upload and conversion process.

Were you to orchestrate the process, you might instead start with an application. Your custom app would be designed to accept and convert files. You might run the application in a container on your cloud, and using OpenShift, you could launch additional instances of your app when the traffic or workload increases beyond a certain threshold.

### Learning automation and orchestration

There isn't just one discipline for automation or orchestration. These are broad practices that are applied to many different tasks across many different industries. The first step to learning, though, is to become proficient with the technology you're meant to orchestrate and automate. It's difficult to orchestrate (safely) the scaling a series of web servers if you don't understand how a web server works, or what ports need to be open or closed, or what a port is. In practice, you may not be the person opening ports or configuring the server; you could be tasked with administrating OpenShift without really knowing or caring what's inside a container. But basic concepts are important because they broadly apply to usability, troubleshooting, and security.

You also need to get familiar with the most common tools of the orchestration and automation world. Learn some [Bash][3], start using [Git][4] and design some [Git hooks][5], learn some Python, get comfortable with [YAML][6] and [Ansible][7], and try out Minikube, [OKD][8], and [OpenShift][9].

Orchestration and automation are important skills, both to make your work more efficient and as something to bring to your team. Invest in it today, and get twice as much done tomorrow.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/orchestration-vs-automation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arrows_operation_direction_system_orchestrate.jpg?itok=NUgoZYY1 (doodles of arrows moving in different directions)
[2]: https://enterprisersproject.com/article/2020/8/orchestration-explained-plain-english
[3]: https://www.redhat.com/sysadmin/using-bash-automation
[4]: https://opensource.com/life/16/7/stumbling-git
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://www.redhat.com/sysadmin/understanding-yaml-ansible
[7]: https://opensource.com/downloads/ansible-k8s-cheat-sheet
[8]: https://www.redhat.com/sysadmin/learn-openshift-minishift
[9]: http://openshift.io
