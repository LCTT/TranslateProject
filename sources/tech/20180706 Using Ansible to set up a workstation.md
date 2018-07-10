Using Ansible to set up a workstation
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/ansible-workstation-816x345.png)

Ansible is an extremely popular [open-source configuration management and software automation project][1]. While IT professionals almost certainly use Ansible on a daily basis, its influence outside the IT industry is not as wide. Ansible is a powerful and flexible tool. It is easily applied to a task common to nearly every desktop computer user: the post-installation “checklist”.

Most users like to apply one “tweak” after a new installation. Ansible’s idempotent, declarative syntax lends itself perfectly to describing how a system should be configured.

### Ansible in a nutshell

The _ansible_ program itself performs a **single task** against a set of hosts. This is roughly conceptualized as:
```
for HOST in $HOSTS; do
 ssh $HOST /usr/bin/echo "Hello World"
done

```

To perform more than one task, Ansible defines the concept of a “playbook”. A playbook is a YAML file describing the _state_ of the targeted machine. When run, Ansible inspects each host and performs only the tasks necessary to enforce the state defined in the playbook.
```
- hosts: all
 tasks:
 - name: Echo "Hello World"
 command: echo "Hello World"

```

Run the playbook using the _ansible-playbook_ command:
```
$ ansible-playbook ~/playbook.yml

```

### Configuring a workstation

Start by installing ansible:
```
dnf install ansible

```

Next, create a file to store the playbook:
```
touch ~/post_install.yml

```

Start by defining the host on which to run this playbook. In this case, “localhost”:
```
- hosts: localhost

```

Each task consists of a _name_ field and a module field. Ansible has **a lot** of [modules][2]. Be sure to browse the module index to become familiar with all Ansible has to offer.

#### The package module

Most users install additional packages after a fresh install, and many like to remove some shipped software they don’t use. The _[package][3]_ module provides a generic wrapper around the system package manager (in Fedora’s case, _dnf_ ).
```
- hosts: localhost
  tasks:
    - name: Install Builder
      become: yes
      package:
        name: gnome-builder
        state: present
    - name: Remove Rhythmbox
      become: yes
      package:
        name: rhythmbox
        state: absent
    - name: Install GNOME Music
      become: yes
      package:
        name: gnome-music
        state: present
    - name: Remove Shotwell
      become: yes
      package:
        name: shotwell
        state: absent
```

This playbook results in the following outcomes:

  * GNOME Builder and GNOME Music are installed
  * Rhythmbox is removed
  * On Fedora 28 or greater, nothing happens with Shotwell (it is not in the default list of packages)
  * On Fedora 27 or older, Shotwell is removed



This playbook also introduces the **become: yes** directive. This specifies the task must be run by a privileged user (in most cases, _root_ ).

#### The DConf Module

Ansible can do a lot more than install software. For example, GNOME includes a great color-shifting feature called Night Light. It ships disabled by default, however the Ansible _[dconf][4]_ module can very easily enable it.
```
- hosts: localhost
  tasks:
    - name: Enable Night Light
      dconf:
        key: /org/gnome/settings-daemon/plugins/color/night-light-enabled
        value: true
    - name: Set Night Light Temperature
      dconf:
        key: /org/gnome/settings-daemon/plugins/color/night-light-temperature
        value: uint32 5500
```

Ansible can also create files at specified locations with the _[copy][5]_ module. In this example, a local file is copied to the destination path.
```
- hosts: localhost
  tasks:
    - name: Enable "AUTH_ADMIN_KEEP" for pkexec
      become: yes
      copy:
        src: files/51-pkexec-auth-admin-keep.rules
        dest: /etc/polkit-1/rules.d/51-pkexec-auth-admin-keep.rules

```

#### The Command Module

Ansible can still run commands even if no specialized module exists (via the aptly named _[command][6]_ module). This playbook enables the [Flathub][7] repository and installs a few Flatpaks. The commands are crafted in such a way that they are effectively idempotent. This is an important behavior to consider; a playbook should succeed each time it is run on a machine.
```
- hosts: localhost
  tasks:
    - name: Enable Flathub repository
      become: yes
      command: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    - name: Install Fractal
      become: yes
      command: flatpak install --assumeyes flathub org.gnome.Fractal
    - name: Install Spotify
      become: yes
      command: flatpak install --assumeyes flathub com.spotify.Client
```

Combine all these tasks together into a single playbook and, in one command, ** Ansible will customize a freshly installed workstation. Not only that, but 6 months later, after making changes to the playbook, run it again to bring a “seasoned” install back to a known state.
```
$ ansible-playbook -K ~/post_install.yml

```

This article only touched the surface of what’s possible with Ansible. A follow-up article will go into more advanced Ansible concepts such as _roles,_ configuring multiple hosts with a divided set of responsibilities.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-setup-workstation/

作者：[Link Dupont][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/linkdupont/
[1]:https://ansible.com
[2]:https://docs.ansible.com/ansible/latest/modules/list_of_all_modules.html
[3]:https://docs.ansible.com/ansible/latest/modules/package_module.html#package-module
[4]:https://docs.ansible.com/ansible/latest/modules/dconf_module.html#dconf-module
[5]:https://docs.ansible.com/ansible/latest/modules/copy_module.html#copy-module
[6]:https://docs.ansible.com/ansible/latest/modules/command_module.html#command-module
[7]:https://flathub.org
