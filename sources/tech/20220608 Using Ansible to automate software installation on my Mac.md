[#]: subject: "Using Ansible to automate software installation on my Mac"
[#]: via: "https://opensource.com/article/22/6/install-software-macos-ansible-homebrew"
[#]: author: "Servesha Dudhgaonkar https://opensource.com/users/serveshadudhgaonkar"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Ansible to automate software installation on my Mac
======
In this demo, I install one of my must-have writing tools, Asciidoctor, on macOS using Ansible.

![Getting started with Perlbrew][1]

Image by: freephotocc via Pixabay CC0

On most systems, there are several ways to install software. Which one you use depends on the source of the application you're installing. Some software comes as a downloadable wizard to walk you through an install process, while others are files you just download and run immediately.

On macOS, a whole library of open source applications is available from Unix commands like [Homebrew][2] and [MacPorts][3]. The advantage of using commands for software installation is that you can automate them, and my favorite tool for automation is Ansible. Combining Ansible with Homebrew is an efficient and reproducible way to install your favorite open source applications.

This article demonstrates how to install one of my must-have writing tools, Asciidoctor, on macOS using Ansible. Asciidoctor is an open source text processor, meaning that it takes text written in a specific format (in this case, Asciidoc) and transforms it into other popular formats (such as HTML, PDF, and so on) for publishing. Ansible is an open source, agentless, and easy-to-understand automation tool. By using Ansible, you can simplify and automate your day-to-day tasks.

Note: While this example uses macOS, the information applies to all kinds of open source software on all platforms compatible with Ansible (including Linux, Windows, Mac, and BSD).

### Installing Ansible

You can install Ansible using `pip`, the Python package manager. First, install `pip` :

```
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ python ./get-pip.py
```

Next, install Ansible using `pip` :

```
$ sudo python -m pip install --user ansible
```

#### Installing Ansible using Homebrew

Alternately, you can install Ansible using the [Homebrew package manager][4]. If you've already installed Ansible with `pip`, skip this step because you've already achieved the same result!

```
$ brew install ansible
```

### Configuring Ansible

To set up Ansible, you first must create an inventory file specifying which computer or computers you want your Ansible script (called a playbook) to operate on.

Create an inventory file in a terminal or using your favorite text editor. In a terminal, type the following, replacing `your-host-name` with the name of your computer:

```
$ cat << EOF >> inventory
[localhost\]
your-host-name
EOF
```

If you don't know your computer's hostname, you can get it using the `hostname` command. Alternately, go to the Apple menu, open System Preferences, then click Sharing. Your computer's hostname is beneath the computer name at the top of Sharing preference pane.

### Installing Asciidoctor using Ansible

In this example, I'm only installing applications on the computer I'm working on, which is also known by the term localhost. To start, create a `playbook.yml` file and copy the following content:

```
- name: Install software
  hosts: localhost 
  become: false 
  vars:
    Brew_packages: 
      - asciidoctor 
    install_homebrew_if_missing: false
```

In the first [YAML sequence][5], you name the playbook (`Install software` ), provide the target (`localhost` ), and confirm that administrative privileges are not required. You also create two variables that you can use later in the playbook: `Brew_packages` and`install_homebrew_if_missing`.

Next, create a YAML mapping called `pre_tasks`, containing the logic to ensure that Homebrew itself is installed on the computer where you're running the playbook. Normally, Ansible can verify whether an application is installed or not, but when that application is the package manager that helps Ansible make that determination in the first place, you have to do it manually:

```
pre_tasks:
  - name: Ensuring Homebrew Is Installed
    stat:
    path: /usr/local/bin/brew
    register: homebrew_check

  - name: Fail If Homebrew Is Not Installed and install_homebrew_if_missing Is False
    fail:
      msg: Homebrew is missing, install from http://brew.sh
    when:
      - not homebrew_check.stat.exists
      - not install_homebrew_if_missing

  - name: Installing Homebrew
    shell: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    when:
      - not homebrew_check.stat.exists
      - install_homebrew_if_missing
```

Finally, create a YAML mapping called `tasks` containing a call to the Homebrew module (it's a built-in module from Ansible) to install Asciidoctor in the event that it's not already present:

```
tasks:
  - name: Install Asciidoctor
    homebrew: 
    name: asciidoctor
    state: present
```

### Running an Ansible playbook

You run an Ansible playbook using the `ansible-playbook` command:

```
$ ansible-playbook -i inventory playbook.yml
```

The `-i` option specifies the `inventory` file you created when setting up Ansible. You can optionally add `-vvvv` to direct Ansible to be extra verbose when running the playbook, which can be useful when troubleshooting.

After the playbook has run, verify that Ansible has successfully installed Asciidoctor on your host:

```
$ asciidoctor -v
Asciidoctor X.Y.Z https://asciidoctor.org
Runtime Environment (ruby 2.6.8p205 (2021-07-07 revision 67951)...
```

### Adapt for automation

You can add more software to the `Brew_packages` variable in this article's example playbook. As long as there's a Homebrew package available, Ansible installs it. Ansible only takes action when required, so you can leave all the packages you install in the playbook, effectively building a manifest of all the packages you have come to expect on your computer.

Should you find yourself on a different computer, perhaps because you're at work or you've purchased a new one, you can quickly install all the same applications in one go. Better still, should you switch to Linux, the Ansible playbook is still valid either by using Homebrew for Linux or by making a few simple updates to switch to a different package manager.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/install-software-macos-ansible-homebrew

作者：[Servesha Dudhgaonkar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/serveshadudhgaonkar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_cafe_brew_laptop_desktop.jpg
[2]: https://opensource.com/article/20/6/homebrew-mac
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://www.redhat.com/sysadmin/yaml-beginners
