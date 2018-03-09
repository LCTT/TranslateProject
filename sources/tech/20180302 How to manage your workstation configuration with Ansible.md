How to manage your workstation configuration with Ansible
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb)

Configuration management is a very important aspect of both server administration and DevOps. The "infrastructure as code" methodology makes it easy to deploy servers in various configurations and dynamically scale an organization's resources to keep up with user demands. But less attention is paid to individual administrators who want to automate the setup of their own laptops and desktops (workstations).

In this series, I'll show you how to automate your workstation setup via [Ansible][1] , which will allow you to easily restore your entire configuration if you want or need to reload your machine. In addition, if you have multiple workstations, you can use this same approach to make the configuration identical on each. In this first article, we'll set up basic configuration management for our personal or work computers and set the foundation for the rest of the series. By the end of this article, you'll have a working setup to benefit from right away. Each article will automate more things and grow in complexity.

### Why Ansible?

Many configuration management solutions are available, including Salt Stack, Chef, and Puppet. I prefer Ansible because it's lighter in terms of resource utilization, its syntax is easier to read, and when harnessed properly it can revolutionize your configuration management. Ansible's lightweight nature is especially relevant to the topic at hand, because we may not want to run an entire server just to automate the setup of our laptops and desktops. Ideally, we want something fast; something we can use to get up and running quickly should we need to restore our workstations or synchronize our configuration between multiple machines. My specific method for Ansible (which I'll demonstrate in this article) is perfect for this—there's no server to maintain. You just download your configuration and run it.

### My approach

Typically, Ansible is run from a central server. It utilizes an inventory file, which is a text file that contains a list of all the hosts and their IP addresses or domain names we want Ansible to manage. This is great for static environments, but it is not ideal for workstations. The reason being we really don't know what the status of our workstations will be at any one moment. Perhaps I powered down my desktop or my laptop may be suspended and stowed in my bag. In either case, the Ansible server would complain, as it can't reach my machines if they are offline. We need something that's more of an on-demand approach, and the way we'll accomplish that is by utilizing `ansible-pull`. The `ansible-pull` command, which is part of Ansible, allows you to download your configuration from a Git repository and apply it immediately. You won't need to maintain a server or an inventory list; you simply run the `ansible-pull` command, feed it a Git repository URL, and it will do the rest for you.

### Getting started

First, install Ansible on the computer you want it to manage. One problem is that a lot of distributions ship with an older version. I can tell you from experience you'll definitely want the latest version available. New features are introduced into Ansible quite frequently, and if you're running an older version, example syntax you find online may not be functional because it's using features that aren't implemented in the version you have installed. Even point releases have quite a few new features. One example of this is the `dconf` module, which is new to Ansible as of 2.4. If you try to utilize syntax that makes use of this module, unless you have 2.4 or newer it will fail. In Ubuntu and its derivatives, we can easily install the latest version of Ansible with the official personal package archive ([PPA][2]). The following commands will do the trick:
```
sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible

```

If you're not using Ubuntu, [consult Ansible's documentation][3] on how to obtain it for your platform.

Next, we'll need a Git repository to hold our configuration. The easiest way to satisfy this requirement is to create an empty repository on GitHub, or you can utilize your own Git server if you have one. To keep things simple, I'll assume you're using GitHub, so adjust the commands if you're using something else. Create a repository in GitHub; you'll end up with a repository URL that will be similar to this:
```
git@github.com:<your_user_name>/ansible.git

```

Clone that repository to your local working directory (ignore any message that complains that the repository is empty):
```
git clone git@github.com:<your_user_name>/ansible.git

```

Now we have an empty repository we can work with. Change your working directory to be inside the repository (`cd ./ansible` for example) and create a file named `local.yml` in your favorite text editor. Place the following configuration in that file:
```
- hosts: localhost

  become: true

  tasks:

  - name: Install htop

    apt: name=htop

```

The file you just created is known as a **playbook** , and the instruction to install `htop` (a package I arbitrarily picked to serve as an example) is known as a **play**. The playbook itself is a file in the YAML format, which is a simple to read markup language. A full walkthrough of YAML is beyond the scope of this article, but you don't need to have an expert understanding of it to be proficient with Ansible. The configuration is easy to read; by simply looking at this file, you can easily glean that we're installing the `htop` package. Pay special attention to the `apt` module on the last line, which will only work on Debian-based systems. You can change this to `yum` instead of `apt` if you're using a Red Hat platform or change it to `dnf` if you're using Fedora. The `name` line simply gives information regarding our task and will be shown in the output. Therefore, you'll want to make sure the name is descriptive so it's easy to find if you need to troubleshoot multiple plays.

Next, let's commit our new file to our repository:
```
git add local.yml

git commit -m "initial commit"

git push origin master

```

Now our new playbook should be present in our repository on GitHub. We can apply the playbook we created with the following command:
```
sudo ansible-pull -U https://github.com/<your_user_name>/ansible.git

```

If executed properly, the `htop` package should be installed on your system. You might've seen some warnings near the beginning that complain about the lack of an inventory file. This is fine, as we're not using an inventory file (nor do we need to for this use). At the end of the output, it will give you an overview of what it did. If `htop` was installed properly, you should see `changed=1` on the last line of the output.

How did this work? The `ansible-pull` command uses the `-U` option, which expects a repository URL. I gave it the `https` version of the repository URL for security purposes because I don't want any hosts to have write access back to the repository (`https` is read-only by default). The `local.yml` playbook name is assumed, so we didn't need to provide a filename for the playbook—it will automatically run a playbook named `local.yml` if it finds it in the repository's root. Next, we used `sudo` in front of the command since we are modifying the system.

Let's go ahead and add additional packages to our playbook. I'll add two additional packages so that it looks like this:
```
- hosts: localhost

  become: true

  tasks:

  - name: Install htop

    apt: name=htop



  - name: Install mc

    apt: name=mc

   

  - name: Install tmux

    apt: name=tmux

```

I added additional plays (tasks) for installing two other packages, `mc` and `tmux`. It doesn't matter what packages you choose to have this playbook install; I just picked these arbitrarily. You should install whichever packages you want all your systems to have. The only caveat is that you have to know that the packages exist in the repository for your distribution ahead of time.

Before we commit and apply this updated playbook, we should clean it up. It will work fine as it is, but (to be honest) it looks kind of messy. Let's try installing all three packages in just one play. Replace the contents of your `local.yml` with this:
```
- hosts: localhost

  become: true

  tasks:

  - name: Install packages

    apt: name={{item}}

    with_items:

      - htop

      - mc

      - tmux

```

Now that looks cleaner and more efficient. We used `with_items` to consolidate our package list into one play. If we want to add additional packages, we simply add another line with a hyphen and a package name. Consider `with_items` to be similar to a `for` loop. Every package we list will be installed.

Commit our new changes back to the repository:
```
git add local.yml

git commit -m "added additional packages, cleaned up formatting"

git push origin master

```

Now we can run our playbook to benefit from the new configuration:
```
sudo ansible-pull -U https://github.com/<your_user_name>/ansible.git

```

Admittedly, this example doesn't do much yet; all it does is install a few packages. You could've installed these packages much faster just using your package manager. However, as this series continues, these examples will become more complex and we'll automate more things. By the end, the Ansible configuration you'll create will automate more and more tasks. For example, the one I use automates the installation of hundreds of packages, sets up `cron` jobs, handles desktop configuration, and more.

From what we've accomplished so far, you can probably already see the big picture. All we had to do was create a repository, put a playbook in that repository, then utilize the `ansible-pull` command to pull down that repository and apply it to our machine. We didn't need to set up a server. In the future, if we want to change our config, we can pull down the repo, update it, then push it back to our repository and apply it. If we're setting up a new machine, we only need to install Ansible and apply the configuration.

In the next article, we'll automate this even further via `cron` and some additional items. In the meantime, I've copied the code for this article into [my GitHub repository][4] so you can check your syntax against mine. I'll update the code as we go along.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/manage-workstation-ansible

作者：[Jay LaCroix][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://www.ansible.com/
[2]:https://launchpad.net/ubuntu/+ppas
[3]:http://docs.ansible.com/ansible/latest/intro_installation.html
[4]:https://github.com/jlacroix82/ansible_article
