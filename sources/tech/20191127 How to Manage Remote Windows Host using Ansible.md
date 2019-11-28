[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Manage Remote Windows Host using Ansible)
[#]: via: (https://www.linuxtechi.com/manage-windows-host-using-ansible/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to Manage Remote Windows Host using Ansible
======

**Ansible** is increasingly becoming the go-to platform for application deployment, and software provisioning among developers owing to its ease of use and flexibility. Furthermore, it is easy to set up and no agent is required to be installed on remote nodes, instead, Ansible uses password less SSH authentication to manage remote Unix/Linux hosts. In this topic, however, we are going to see how you can manage Windows Host using Ansible.

[![Manage-Windows-Hosts-using-Ansible][1]][2]

**Lab setup**

We shall use the setup below to accomplish our objective

  * Ansible Control node   –    CentOS 8          –     IP: 192.168.43.13
  * Windows 10 node         –    Windows 10     –     IP: 192.168.43.147



### Part 1: Installing Ansible on the Control node (CentOS 8)

Before anything else, we need to get Ansible installed on the Control node which is the CentOS 8 system.

#### Step 1: Verify that Python3 is installed on Ansible control node

Firstly, we need to confirm if Python3 is installed. CentOS 8 ships with Python3 but if it’s missing for any reason, install using the command:

```
# sudo dnf install python3
```

Next, make Python3 the default Python version by running:

```
# sudo alternatives --set python /usr/bin/python3
```

To verify if python3 is installed, run the command:

```
# python --version
```

**![check-python-version][1] **

**Read Also :** **[How to Install Ansible (Automation Tool) on CentOS 8/RHEL 8][3]**

#### Step 2: Install a virtual environment for running Ansible

For this exercise, an isolated environment for running and testing Ansible is preferred. This will keep at bay issues such as dependency problems and package conflicts. The isolated environment we are going to create is called a virtual environment.

Firstly, let’s begin with the installation of the virtual environment on CentOS 8.

```
# sudo dnf install python3-virtualenv
```

![install-python3-virtualenv][1]

After the installation of the virtual environment, create a virtual workspace by running:

```
# virtualenv env
```

![virtualenv-env-ansible][1]

```
# source env/bin/activate
```

![source-env-bin-activate-ansible][1]

Great! Observer that the prompt has now changed to (env).

#### Step 3: Install Ansible

After the creation of the virtual environment, proceed and install Ansible automation tool using pip as shown:

```
# pip install ansible
```

![pip-install-Ansible][1]

You can later confirm the installation of Ansible using the command:

```
# ansible --version
```

![check-ansible-version][1]

To test Ansible and see if it’s working on our Ansible Control server run:

```
# ansible localhost -m ping
```

![Test-ansible-for-connectivity][1]

Great! Next, we need to define the Windows host or system on a host file on the Ansible control node. Therefore, open the default hosts file

```
# vim /etc/ansible/hosts
```

Define the Windows hosts as shown below.

![Ansible-hosts-file][1]

**Note:** The username and password point to the user on the Windows host system.

Next, save and exit the configuration file.

#### Step 4: Install Pywinrm

Unlike in Unix systems where Ansible uses SSH to communicate with remote hosts, with Windows it’s a different story altogether. To communicate with Windows hosts, you need to install Winrm.

To install winrm, once again, use pip tool as shown:

```
# pip install pywinrm
```

![install-pywinrm][1]

### Part 2: Configuring Windows Host

In this section, we are going to configure our Windows 10 remote host system to connect with the Ansible Control node. We are going to install the **WinRM listener-** short for **Windows Remote** – which will allow the connection between the Windows host system and the Ansible server.

But before we do so, your Windows host system needs to fulfill a few requirements for the installation to succeed:

  * Your Windows host system should be **Windows 7 or later**. For Servers, ensure that you are using **Windows Server 2008** and later versions.
  * Ensure your system is running **.NET Framework 4.0** and later.
  * Windows **PowerShell** should be Version 3.0 &amp; later



With all the requirements met, now follow the steps stipulated below:

#### Step 1: Download the WinRM script on Windows 10 host

WinRM can be installed using a script that you can download from this [link][4]. Copy the entire script and paste it onto the notepad editor. Thereafter, ensure you save the WinRM script at the most convenient location. In our case, we have saved the file on the Desktop under the name  ConfigureRemotingForAnsible.ps1

#### Step 2: Run the WinRM script on Windows 10 host

Next, run PowerShell as the Administrator

![Run-PowerShell-as-Administrator][1]

Navigate to the script location and run it. In this case, we have navigated to the Desktop location where we saved the script. Next, proceed and execute the WinRM script on the WIndows host:

```
.\ConfigureRemotingForAnsible.ps1
```

This takes about a minute and you should get the output shown below. The output shows that WinRM has successfully been installed.

![set-up-WinRM-on-Windows10][1]

### Part 3: Connecting to Windows Host from Ansible Control Node

To test connectivity to the Windows 10 host, run the command:

```
# ansible winhost -m win_ping
```

![Ansible-ping-windows-host-machine][1]

The output shows that we have indeed established a connection to the remote Windows 10 host from the Ansible Control node. This implies that we can now manage the remote Windows host using Ansible Playbooks. Let’s create a sample playbook for the Windows host system.

### Part 4: Creating and running a playbook for Windows 10 host

In this final section, we shall create a playbook and create a task that will install Chocolatey on the remote host. Chocolatey is a package manager for Windows system. The play is defined as shown:

```
# vim chocolatey.yml
---
- host: winhost
  gather_facts: no
  tasks:
   - name: Install Chocolatey on Windows10
     win_chocolatey: name=procexp  status=present
```

![Ansible-Playbook-install-chocolatey][1]

Save and close the yml file. Next, execute the playbook as shown

```
# ansible-playbook chocolatey.yml
```

![Ansible-playBook-succeeded][1]

The output is a pointer that all went well. And this concludes this topic on how you can manage Windows host using Ansible.

  * [Facebook][5]
  * [Twitter][6]
  * [LinkedIn][7]
  * [Reddit][8]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/manage-windows-host-using-ansible/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.linuxtechi.com/wp-content/uploads/2019/11/Manage-Windows-Hosts-using-Ansible.jpg
[3]: http://www.linuxtechi.com/install-ansible-centos-8-rhel-8/
[4]: https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
[5]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Fmanage-windows-host-using-ansible%2F&t=How%20to%20Manage%20Remote%20Windows%20Host%20using%20Ansible
[6]: http://twitter.com/share?text=How%20to%20Manage%20Remote%20Windows%20Host%20using%20Ansible&url=https%3A%2F%2Fwww.linuxtechi.com%2Fmanage-windows-host-using-ansible%2F&via=Linuxtechi
[7]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Fmanage-windows-host-using-ansible%2F&title=How%20to%20Manage%20Remote%20Windows%20Host%20using%20Ansible
[8]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Fmanage-windows-host-using-ansible%2F&title=How%20to%20Manage%20Remote%20Windows%20Host%20using%20Ansible
