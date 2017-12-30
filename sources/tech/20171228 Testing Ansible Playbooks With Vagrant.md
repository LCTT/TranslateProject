translating by lujun9972
Testing Ansible Playbooks With Vagrant
======
I use Ansible to automate the deployments of my websites ([LinuxJobs.fr][1], [Journal du hacker][2]) and my applications ([Feed2toot][3], [Feed2tweet][4]). I'll describe in this blog post my setup in order to test my Ansible Playbooks locally on my laptop.

![ansible](https://carlchenet.com/wp-content/uploads/2017/12/ansible-300x300.png)

### Why testing the Ansible Playbooks

I need a simple and a fast way to test the deployments of my Ansible Playbooks locally on my laptop, especially at the beginning of writing a new Playbook, because deploying directly on the production server is both reeeeally slow… and risky for my services in production.

Instead of deploying on a remote server, I'll deploy my Playbooks on a [VirtualBox][5] using [Vagrant][6]. This allows getting quickly the result of a new modification, iterating and fixing as fast as possible.

Disclaimer: I am not a profesionnal programmer. There might exist better solutions and I'm only describing one solution of testing Ansible Playbooks I find both easy and efficient for my own use cases.

### My process

  1. Begin writing the new Ansible Playbook
  2. Launch a fresh virtual machine (VM) and deploy the playbook on this VM using Vagrant
  3. Fix the issues either from the playbook either from the application deployed by Ansible itself
  4. Relaunch the deployment on the VM
  5. If more errors, go back to step 3. Otherwise destroy the VM, recreate it and deploy to test a last time with a fresh install
  6. If no error remains, tag the version of your Ansible Playbook and you're ready to deploy in production



### What you need

First, you need Virtualbox. If you use the [Debian][7] distribution, [this link][8] describes how to install it, either from the Debian repositories either from the upstream.

[![][9]][5]

Second, you need Vagrant. Why Vagrant? Because it's a kind of middleware between your development environment and your virtual machine, allowing programmatically reproducible operations and easy linking your deployments and the virtual machine. Install it with the following command:
```
# apt install vagrant
```

[![][10]][6]

### Setting up Vagrant

Everything about Vagrant lies in the file Vagrantfile. Here is mine:
```
Vagrant.require_version ">= 2.0.0"

Vagrant.configure(1) do |config|

 config.vm.box = "debian/stretch64"
 config.vm.provision "shell", inline: "apt install --yes git python3-pip"
 config.vm.provision "ansible" do |ansible|
 ansible.verbose = "v"
 ansible.playbook = "site.yml"
 ansible.vault_password_file = "vault_password_file"
 end
end

```
  1. The 1st line defines what versions of Vagrant should execute your Vagrantfile.
  2. The first loop of the file, you could define the following operations for as many virtual machines as you wish (here just 1).
  3. The 3rd line defines the official Vagrant image we'll use for the virtual machine.
  4. The 4th line is really important: those are the missing apps we miss on the VM. Here we install git and python3-pip with apt.
  5. The next line indicates the start of the Ansible configuration.
  6. On the 6th line, we want a verbose output of Ansible.
  7. On the 7th line, we define the entry point of your Ansible Playbook.
  8. On the 8th line, if you use Ansible Vault to encrypt some files, just define here the file with your Ansible Vault passphrase.



When Vagrant launches Ansible, it's going to launch something like:
```
$  ansible-playbook --inventory-file=/home/me/ansible/test-ansible-playbook/.vagrant/provisioners/ansible/inventory -v --vault-password-file=vault_password_file site.yml
```

### Executing Vagrant

After writing your Vagrantfile, you need to launch your VM. It's as simple as using the following command:
```
$ vagrant up
```

That's a slow operation, because the VM will be launched, the additionnal apps you defined in the Vagrantfile will be installed and finally your Playbook will be deployed on it. You should sparsely use it.

Ok, now we're really ready to iterate fast. Between your different modifications, in order to test your deployments fast and on a regular basis, just use the following command:
```
$ vagrant provision
```

Once your Ansible Playbook is finally ready, usually after lots of iterations (at least that's my case), you should test it on a fresh install, because your different iterations may have modified your virtual machine and could trigger unexpected results.

In order to test it from a fresh install, use the following command:
```
$ vagrant destroy && vagrant up
```

That's again a slow operation. You should use it when you're pretty sure your Ansible Playbook is almost finished. After testing your deployment on a fresh VM, you're now ready to deploy in production.Or at least better prepared :p

### Possible improvements? Let me know

I find the setup described in this blog post quite useful for my use cases. I can iterate quite fast especially when I begin writing a new playbook, not only on the playbook but sometimes on my own latest apps, not yet ready to be deployed in production. Deploying on a remote server would be both slow and dangerous for my services in production.

I could use a continous integration (CI) server, but that's not the topic of this blog post. As said before, the goal is to iterate as fast as possible in the beginning of writing a new Ansible Playbook.

Commiting, pushing to your Git repository and waiting for the execution of your CI tests is overkill at the beginning of your Ansible Playbook, when it's full of errors waiting to be debugged one by one. I think CI is more useful later in the life of the Ansible Playbooks, especially when different people work on it and you have a set or code quality rules to enforce. That's only my opinion and it's open to discussion, one more time I'm not a professionnal programmer.

If you have better solutions to test Ansible Playbooks or to improve the one describe here, let me know by writing a comment or by contacting me through my accounts on social networks below, I'll be delighted to listen to your improvements.




--------------------------------------------------------------------------------

via: https://carlchenet.com/testing-ansible-playbooks-with-vagrant/

作者：[Carl Chenet][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://carlchenet.com
[1]:https://www.linuxjobs.fr
[2]:https://www.journalduhacker.net
[3]:https://gitlab.com/chaica/feed2toot
[4]:https://gitlab.com/chaica/feed2tweet
[5]:https://www.virtualbox.org/
[6]:https://www.vagrantup.com/
[7]:https://www.debian.org
[8]:https://wiki.debian.org/VirtualBox
[9]:https://carlchenet.com/wp-content/uploads/2017/12/virtualbox-150x150.png
[10]:https://carlchenet.com/wp-content/uploads/2017/12/vagrant-300x98.png
