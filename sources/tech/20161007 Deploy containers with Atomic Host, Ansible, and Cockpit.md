translating by  Bestony
Deploy containers with Atomic Host, Ansible, and Cockpit
====

![atomic-ansible-cockpit-containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/atomic-ansible-cockpit-containers.jpg?fit=945%2C400&ssl=1)

In the course of my job at [Red Hat](https://www.redhat.com/), I work with [Docker](https://www.docker.com/) containers on [Fedora Atomic host](https://getfedora.org/en/cloud/download/atomic.html) every day. The Atomic Host from [Project Atomic](http://www.projectatomic.io/) is a lightweight container OS that can run Linux containers in Docker format. It’s been modified for efficiency, making it optimal to use as a Docker run-time system for cloud environments.

Fortunately I’ve found a great way to manage containers running on the host: [Cockpit](http://cockpit-project.org/). Cockpit is a remote manager for GNU/Linux servers with a nice Web UI. It lets me manage servers and containers running on the host. You can read more about Cockpit in [this overview article](https://fedoramagazine.org/cockpit-overview/) previously published here. However, I also wanted to automate running containers on the host, which I’ve done using [Ansible](https://www.ansible.com/).

Note that we cannot use the dnf command on the Atomic Host. The host is designed not as a general purpose OS, but to be more fit for containers and other purposes. But it’s still very easy to set up applications and services on the Atomic Host. This post shows you how to automate and simplify this process.

### Setting up the components

Before getting started, make sure you have Ansible installed on your system.

```
sudo dnf -y install ansible
```

```
$ git clone https://github.com/trishnaguha/fedora-cloud-ansible.git

```

```
$ cd fedora-cloud-ansible
$ cd cockpit
$ vim inventory

```

1.  Replace IP_ADDRESS_OF_HOST with the IP address of your Atomic host.
2.  Replace PRIVATE_KEY_FILE in the line ansible_ssh_private_key_file=’PRIVATE_KEY_FILE’ with your SSH private key file.

Now save and exit the inventory file.

Next, edit the ansible configuration file:

```
$ vim ansible.cfg

```

### Putting it all together

Now it’s time to run the playbook. This command starts running the Cockpit container on the Atomic host:

```
$ ansible-playbook cockpit.yml

```

[![Cockpit login screen](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-02-27.jpg?resize=676%2C321&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-02-27.jpg?ssl=1)

### Managing your containers

Login with the credentials of your Atomic host or as root. Then visit the Containers section on the Cockpit manager to see the containers running on your Atomic host. In the example below, you’ll see I also set up others like [httpd](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/httpd) and [redis](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/redis):

[![Cockpit panel for managing containers](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-13-05.jpg?resize=676%2C284&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-13-05.jpg?ssl=1)

Notice the interface lets you start and stop containers directly in the Cockpit manager using the Run and Stop buttons. You can also manage your Atomic host using the Cockpit manager. Go to Tools -> Terminals. There you can use the terminal of the Atomic host:

[![Cockpit terminal panel](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-10-19.jpg?resize=676%2C279&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-10-19.jpg?ssl=1)

If you plan to deploy your containerized application on Atomic host, you can simply write a playbook for it. Then you can deploy using the ansible-playbook command and manage the containers using Cockpit.

[![Running ansible-playbook to deploy multiple containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/FotoFlexer_Photo51.jpg?resize=650%2C663&ssl=1)](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/FotoFlexer_Photo51.jpg?ssl=1)

Feel free to fork or add playbooks for containers in the repository [https://github.com/trishnaguha/fedora-cloud-ansible](https://github.com/trishnaguha/fedora-cloud-ansible).

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/deploy-containers-atomic-host-ansible-cockpit/

作者：[trishnag][a]

译者：[Bestony](https://github.com/Bestony)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/trishnag/
