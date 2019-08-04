[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Joe Doss: How Do You Fedora?)
[#]: via: (https://fedoramagazine.org/joe-doss-how-do-you-fedora/)
[#]: author: (Charles Profitt https://fedoramagazine.org/author/cprofitt/)

Joe Doss: How Do You Fedora?
======

![Joe Doss][1]

We recently interviewed Joe Doss on how he uses Fedora. This is part of a [series][2] on the Fedora Magazine. The series profiles Fedora users and how they use Fedora to get things done. Contact us on the [feedback form][3] to express your interest in becoming a interviewee.

### Who is Joe Doss?

Joe Doss lives in Chicago, Illinois USA and his favorite food is pizza. He is the Director of Engineering Operations and Kenna Security, Inc. Doss describes his employer this way: “Kenna uses data science to help enterprises combine their infrastructure and application vulnerability data with exploit intelligence to measure risk, predict attacks and prioritize remediation.”

His first Linux distribution was Red Hat Linux 5. A friend of his showed him a computer that wasn’t running Windows. Doss thought it was just a program to install on Windows when his friend gave him a Red Hat Linux 5 install disk. “I proceeded to install this Linux ‘program’ on my Father’s PC,” he says. Luckily for Doss, his father supported his interest in computers. “I ended up totally wiping out the Windows 95 install as a result and this was how I got my first computer.”

At Kenna, Doss’ group makes use of Fedora and [Ansible][4]: “We run Fedora Cloud in multiple VPC deployments in AWS and Google Compute with over 200 virtual machines. We use Ansible to automate everything we do with Fedora.”

Doss brews beer at home and contributes to open source in his free time. He also has a cat named Tibby. “I rescued Tibby off the street the Hyde Park neighborhood of Chicago when she was 7 months old. She is not very smart, but she makes up for that with cuteness.” His favorite place to visit is his childhood home of Michigan, but Doss says, “anywhere with a warm beach, a cool drink, and the ocean is pretty nice too.”

![Tibby the cute cat!][5]

### The Fedora community

Doss became involved with Fedora and the Fedora community through his job at Kenna Security. When he first joined the company they were using Ubuntu and Chef in production. There was a desire to make the infrastructure more reproducible and reliable, and he says, “I was able to greenfield our deployments with Fedora Cloud and Ansible.” This project got him involved in the Fedora Cloud release.

When asked about his first impression of the Fedora community, Doss said, “Overwhelming to be honest. There is so much going on and it is hard to figure out who are the stakeholders of each part of Fedora.” Once he figured out who he needed to talk to he found the community very welcoming and super supportive.

One of the ideas he had to improve the community was to unite the various projects and team under on bug tracking tool and community resource. “Pagure, Bugzilla, Github, Fedora Forums, Discourse Forums, Mailing lists… it is all over the place and hard to navigate at first.” Despite the initial complexity of becoming familiar with the Fedora Project, Doss feels it is amazingly rewarding to be involved. “It feels awesome it to be apart of a Linux distro that impacts so many people in very positive ways. You can make a difference.”

Doss called out Dusty Mabe at Red Hat for helping him become involved, saying Dusty “has been an amazing mentor and resource for enabling me to contribute back to Fedora.”

Doss has an interesting way of explaining to non-technical friends what he does. “Imagine changing the tires on a very large bus while it is going down the highway at 70 MPH and sometimes you need to get involved with the tire manufacturer to help make this process work well.” This metaphor helps people understand what replacing 200-plus VMs across more than five production VPCs in AWS and Google Compute with every Fedora release.

Doss drew my attention to one specific incident with Fedora 29 and Vagrant. “Recently we encountered an issue where Vagrant wouldn’t set the hostname on a Fresh Fedora 29 Beta VM. This was due to Fedora 29 Cloud no longer shipping the network service stub in favor of NetworkManager. This led to me working with a colleague at Kenna Security to send a patch upstream to the Vagrant project to help their developers produce a fix for Fedora 29. Vagrant usage with Fedora is a very large part of our development cycle at Kenna, and having this broken before the Fedora 29 release would have impacted us a lot.” As Doss said, “Sometimes you need to help make the tires before they go on the bus.”

Doss is the [COPR][6] Fedora, RHEL, and CentOS package maintainer for [WireGuard VPN][7]. “The CentOS repo just went over 60 thousand downloads last month which is pretty awesome.”

### What Hardware?

Doss uses Fedora 29 cloud in the over five VPC deployments in AWS and Google computer. At home he has a SuperMicro SYS-5019A-FTN4 1U Server that runs Fedora 29 Server with Openshift OKD installed on it. His laptops are all Lenovo. “For Laptops I use a ThinkPad T460s for work and a ThinkPad 25 at home. Both have Fedora 29 installed. ThinkPads are the best with Fedora.”

### What Software?

Doss used GNOME 3 as his preferred desktop on Fedora Workstation. “I use Sublime Text 3 for my text editor on the desktop or vim on servers.” For development and testing he uses Vagrant. “Ansible is what I use for any kind of automation with Fedora. I maintain an [Ansible playbook][8] for setting up my workstation.”

### Ansible

I asked Doss if he had advice for people trying to learn Ansible.

“Start small. Automate the stuff that makes your life easier, but don’t over complicate it. [Ansible Galaxy][9] is a great resource to get things done quickly, but if you truly want to learn how to use Ansible, writing your own roles and playbooks the path I would take.

“I have helped a lot of my coworkers that have joined my Operations team at Kenna get up to speed on using Ansible by buying them a copy of [Ansible for Devops][10] by Jeff Geerling. This book will give anyone new to Ansible the foundation they need to start using it everyday. #ansible on Freenode is a great resource as well along with the [official Ansible docs][11].”

Doss also said, “Knowing what to automate is most likely the most difficult thing to master without over complicating things. Debugging complex playbooks and roles is a close second.”

### Home lab

He recommended setting up a home lab. “At Kenna and at home I use [Vagrant][12] with the [Vagrant-libvirt plugin][13] for developing Ansible roles and playbooks. You can iterate quickly to build your roles and playbooks on your laptop with your favorite editor and run _vagrant provision_ to run your playbook. Quick feedback loop and the ability to burn down your Vagrant VM and start over quickly is an amazing workflow. Below is a sample Vagrant file that I keep handy to spin up a Fedora VM to test my playbooks.”

```
-- mode: ruby --
 vi: set ft=ruby :
 Vagrant.configure(2) do |config|
 config.vm.provision "shell", inline: "dnf install nfs-utils rpcbind @development-tools @ansible-node redhat-rpm-config gcc-c++ -y"
 config.ssh.forward_agent = true
 config.vm.define "f29", autostart: false do |f29|
     f29.vm.box = "fedora/29-cloud-base"
     f29.vm.hostname = "f29.example.com"
     f29.vm.provider "libvirt" do |vm|
       vm.memory = 2048
       vm.cpus = 2
       vm.driver = "kvm"
       vm.nic_model_type = "e1000"
     end
config.vm.synced_folder '.', '/vagrant', disabled: true

config.vm.provision "ansible" do |ansible|
   ansible.groups = {
   }
    ansible.playbook = "playbooks/main.yml"
    ansible.inventory_path = "inventory/development"
    ansible.extra_vars = {
      ansible_python_interpreter: "/usr/bin/python3"
    }
# ansible.verbose = 'vvv' end
end
end
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/joe-doss-how-do-you-fedora/

作者：[Charles Profitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cprofitt/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/IMG_20181029_121944-816x345.jpg
[2]: https://fedoramagazine.org/tag/how-do-you-fedora/
[3]: https://fedoramagazine.org/submit-an-idea-or-tip/
[4]: https://ansible.com
[5]: https://fedoramagazine.org/wp-content/uploads/2019/04/IMG_20181231_110920_fixed.jpg
[6]: https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
[7]: https://www.wireguard.com/install/
[8]: https://github.com/jdoss/fedora-workstation
[9]: https://galaxy.ansible.com/
[10]: https://www.ansiblefordevops.com/
[11]: https://docs.ansible.com/ansible/latest/index.html
[12]: http://www.vagrantup.com/
[13]: https://github.com/vagrant-libvirt/vagrant-libvirt%20plugin
