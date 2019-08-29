[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing Ansible environments on MacOS with Conda)
[#]: via: (https://opensource.com/article/19/8/using-conda-ansible-administration-macos)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

Managing Ansible environments on MacOS with Conda
======
Conda corrals everything you need for Ansible into a virtual environment
and keeps it separate from your other projects.
![CICD with gears][1]

If you are a Python developer using MacOS and involved with Ansible administration, you may want to use the Conda package manager to keep your Ansible work separate from your core OS and other local projects.

Ansible is based on Python. Conda is not required to make Ansible work on MacOS, but it does make managing Python versions and package dependencies easier. This allows you to use an upgraded Python version on MacOS and keep Python package dependencies separate between your system, Ansible, and other programming projects.

There are other ways to install Ansible on MacOS. You could use [Homebrew][2], but if you are into Python development (or Ansible development), you might find managing Ansible in a Python virtual environment reduces some confusion. I find this to be simpler; rather than trying to load a Python version and dependencies into the system or in **/usr/local**, Conda helps me corral everything I need for Ansible into a virtual environment and keep it all completely separate from other projects.

This article focuses on using Conda to manage Ansible as a Python project to keep it clean and separated from other projects. Read on to learn how to install Conda, create a new virtual environment, install Ansible, and test it.

### Prelude

Recently, I wanted to learn [Ansible][3], so I needed to figure out the best way to install it.

I am generally wary of installing things into my daily use workstation. I especially dislike applying manual updates to the vendor's default OS installation (a preference I developed from years of Unix system administration). I really wanted to use Python 3.7, but MacOS packages the older 2.7, and I was not going to install any global Python packages that might interfere with the core MacOS system.

So, I started my Ansible work using a local Ubuntu 18.04 virtual machine. This provided a real level of safe isolation, but I soon found that managing it was tedious. I set out to see how to get a flexible but isolated Ansible system on native MacOS.

Since Ansible is based on Python, Conda seemed to be the ideal solution.

### Installing Conda

Conda is an open source utility that provides convenient package- and environment-management features. It can help you manage multiple versions of Python, install package dependencies, perform upgrades, and maintain project isolation. If you are manually managing Python virtual environments, Conda will help streamline and manage your work. Surf on over to the [Conda documentation][4] for all the details.

I chose the [Miniconda][5] Python 3.7 installation for my workstation because I wanted the latest Python version. Regardless of which version you select, you can always install new virtual environments with other versions of Python.

To install Conda, download the PKG format file, do the usual double-click, and select the "Install for me only" option. The install took about 158MB of space on my system.

After the installation, bring up a terminal to see what you have. You should see:

  * A new **miniconda3** directory in your **home**
  * The shell prompt modified to prepend the word "(base)"
  * **.bash_profile** updated with Conda-specific settings



Now that the base is installed, you have your first Python virtual environment. Running the usual Python version check should prove this, and your PATH will point to the new location:


```
(base) $ which python
/Users/jfarrell/miniconda3/bin/python
(base) $ python --version
Python 3.7.1
```

Now that Conda is installed, the next step is to set up a virtual environment, then get Ansible installed and running.

### Creating a virtual environment for Ansible

I want to keep Ansible separate from my other Python projects, so I created a new virtual environment and switched over to it:


```
(base) $ conda create --name ansible-env --clone base
(base) $ conda activate ansible-env
(ansible-env) $ conda env list
```

The first command clones the Conda base into a new virtual environment called **ansible-env**. The clone brings in the Python 3.7 version and a bunch of default Python modules that you can add to, remove, or upgrade as needed.

The second command changes the shell context to this new **ansible-env** environment. It sets the proper paths for Python and the modules it contains. Notice that your shell prompt changes after the **conda activate ansible-env** command.

The third command is not required; it lists what Python modules are installed with their version and other data.

You can always switch out of a virtual environment and into another with Conda's **activate** command. This will bring you back to the base: **conda activate base**.

### Installing Ansible

There are various ways to install Ansible, but using Conda keeps the Ansible version and all desired dependencies packaged in one place. Conda provides the flexibility both to keep everything separated and to add in other new environments as needed (as I'll demonstrate later).

To install a relatively recent version of Ansible, use:


```
(base) $ conda activate ansible-env
(ansible-env) $ conda install -c conda-forge ansible
```

Since Ansible is not part of Conda's default channels, the **-c** is used to search and install from an alternate channel. Ansible is now installed into the **ansible-env** virtual environment and is ready to use.

### Using Ansible

Now that you have installed a Conda virtual environment, you're ready to use it. First, make sure the node you want to control has your workstation's SSH key installed to the right user account.

Bring up a new shell and run some basic Ansible commands:


```
(base) $ conda activate ansible-env
(ansible-env) $ ansible --version
ansible 2.8.1
  config file = None
  configured module search path = ['/Users/jfarrell/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /Users/jfarrell/miniconda3/envs/ansibleTest/lib/python3.7/site-packages/ansible
  executable location = /Users/jfarrell/miniconda3/envs/ansibleTest/bin/ansible
  python version = 3.7.1 (default, Dec 14 2018, 13:28:58) [Clang 4.0.1 (tags/RELEASE_401/final)]
(ansible-env) $ ansible all -m ping -u ansible
192.168.99.200 | SUCCESS =&gt; {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

Now that Ansible is working, you can pull your playbooks out of source control and start using them from your MacOS workstation.

### Cloning the new Ansible for Ansible development

This part is purely optional; it's only needed if you want additional virtual environments to modify Ansible or to safely experiment with questionable Python modules. You can clone your main Ansible environment into a development copy with:


```
(ansible-env) $ conda create --name ansible-dev --clone ansible-env
(ansible-env) $ conda activte ansible-dev
(ansible-dev) $
```

### Gotchas to look out for

Occasionally you may get into trouble with Conda. You can usually delete a bad environment with:


```
$ conda activate base
$ conda remove --name ansible-dev --all
```

If you get errors that you cannot resolve, you can usually delete the environment directly by finding it in **~/miniconda3/envs** and removing the entire directory. If the base becomes corrupt, you can remove the entire **~/miniconda3** directory and reinstall it from the PKG file. Just be sure to preserve any desired environments you have in **~/miniconda3/envs**, or use the Conda tools to dump the environment configuration and recreate it later.

The **sshpass** program is not included on MacOS. It is needed only if your Ansible work requires you to supply Ansible with an SSH login password. You can find the current [sshpass source][6] on SourceForge.

Finally, the base Conda Python module list may lack some Python modules you need for your work. If you need to install one, the **conda install &lt;package&gt;** command is preferred, but **pip** can be used where needed, and Conda will recognize the install modules.

### Conclusion

Ansible is a powerful automation utility that's worth all the effort to learn. Conda is a simple and effective Python virtual environment management tool.

Keeping software installs separated on your MacOS environment is a prudent approach to maintain stability and sanity with your daily work environment. Conda can be especially helpful to upgrade your Python version, separate Ansible from your other projects, and safely hack on Ansible.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/using-conda-ansible-administration-macos

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: https://brew.sh/
[3]: https://docs.ansible.com/?extIdCarryOver=true&sc_cid=701f2000001OH6uAAG
[4]: https://conda.io/projects/conda/en/latest/index.html
[5]: https://docs.conda.io/en/latest/miniconda.html
[6]: https://sourceforge.net/projects/sshpass/
