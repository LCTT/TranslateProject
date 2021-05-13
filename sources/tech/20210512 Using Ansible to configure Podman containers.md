[#]: subject: (Using Ansible to configure Podman containers)
[#]: via: (https://fedoramagazine.org/using-ansible-to-configure-podman-containers/)
[#]: author: (mahesh1b https://fedoramagazine.org/author/mahesh1b/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Using Ansible to configure Podman containers
======

![][1]

Photo by [Marta Markes][2] on [Unsplash][3]

In complex IT infrastructure, there are many repetitive tasks. Running those tasks successfully is not easy. Human error always presents a chance of failure. With the help of Ansible, you can perform all of the tasks through a remote host executed with playbooks, and those playbooks can be reused as many times as you need. In this article you will learn how to install and configure Ansible on Fedora Linux, and how to use it to manage and configure Podman containers. 

### Ansible

[Ansible][4] is an open source infrastructure automation tool sponsored by Red Hat. It can deal with all the problems that come with large infrastructure, like installing &amp; updating packages, taking backups, ensuring specific services are always running, and much more. You do this with a playbook which is written in YAML. Ansible playbooks can be used again and again, making the system administrator’s job less complex. Playbooks also eliminate repetitive tasks and can be easily modified. But we have many automation tools like Ansible, why use it? Unlike some other configuration management tools, Ansible is agentless: you don’t have to install anything on managed nodes. For more information about Ansible, see the [Ansible tag in Fedora Magazine][5].

### Podman

[Podman][6] is an open source container engine which is used for developing, managing and running container images. But what is a container? Every time you create any new application and deploy it either on physical servers, cloud servers or virtual machines, the most common problems which you face are portability and compatibility. This is where containers come into the picture. Containers virtualize at the OS level so they only contain required libraries and app services. The benefits of containers include:

  * portabilty 
  * isolation
  * scaling
  * light weight
  * fast boot up
  * smaller disk and memory requirements



In a nutshell: when you build a container image for any application, all of the required dependencies are packed into the container. You can now run that container on any host OS without any portability and compatibility issues.

The key highlight of Podman is that it is daemon-less, and so does not require root privileges to run containers. You can build the container images with the help of a Dockerfile or pull images from Docker Hub, [fedoraproject.org][7] or [Quay][8]. For more information about Podman, see the [Podman tag in Fedora Magazine][9].

### Why configure Podman with Ansible?

Ansible provides a way to easily run repetitive tasks many times. It also has tons of modules for cloud providers like AWS, GCP, and Azure, for container management tools like Docker and Podman, and also for database management. Ansible also has a community ([Ansible Galaxy][10]) where you can find tons of Ansible roles created by contributors from all over the world. All of this makes Ansible a great tool for DevOps engineers and system administrators.

With DevOps, the development of applications is fast-paced. Developing applications which can run on any operating system is essential. This is where Podman comes into picture.

### Installing ansible

First, install Ansible:

```
$ sudo dnf install ansible -y
```

### Configuring ansible

Ansible needs ssh to work on managed nodes, so first generate a key pair.

```
$ ssh-keygen
```

Once the key is generated, copy the key to the managed node.

Enter yes and enter the password of the managed node. Now your managed host can be accessed remotely.

For ansible to access managed nodes, you need to store all hostnames or IP addresses in an inventory file. By default, this is in _~/etc/ansible/hosts_.

This is what the inventory file looks like. Here square brackets are used to assign groups to some specific nodes.

```
[group1]
green.example.com
blue.example.com
[group2]
192.168.100.11
192.168.100.10
```

Check that all managed nodes can be reached.

```
$ ansible all -m ping
```

You should see output like this:

```
[mahesh@fedora new] $ ansible all -m ping
fedora.example.com I SUCCESS {
    "ansibe_facts": {
       "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
[mahesh@fedora new] $
```

Now create your first playbook which will install Podman on managed nodes. First create a file with any name with .yml extension.

```
$ vim name_of_playbook.yml
```

The playbook should look something like below. The first field is name for the playbook. The hosts field is used to mention hostname or group name mentioned in inventory. _become: yes_ indicates escalating privileges and tasks contain all the tasks that are going to execute, here name specifies task name, yum is module to install packages, below that specify name of package in name field and state is for installing or removing the package.

—
– name: First playbook
   hosts: fedora.example.com
   become: yes
  tasks:
    – name: Installing podman.
      yum:
        name: podman
       state: present
---

Check for any syntax errors in the file.

```
$ ansible-playbook filename --syntax-check
```

Now run the playbook.

```
$ ansible-playbook filename
```

You should get output like this:

```
[mahesh@fedora new] $ ansible-playbook podman_installation.yml
PLAY [First playbook] *************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
0k: [fedora.example.com]

TASK [Installing podman] ************************************************************************************************
changed: [fedora.example.com]

PLAY RECAP *************************************************************************************************
fedora.example.com    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
[mahesh@fedora new] $
```

Now create a new playbook which pulls an image from Docker Hub. You’ll use the podman_image module to pull the httpd image of version 2-alpine from Docker Hub.

```
---
 - name: Playbook for podman.
    hosts: fedora.example.com
    tasks:
     - name: Pull httpd:2-alpine image from dockerhub.
       podman_image:
         name: docker.io/httpd
         tag: 2-alpine
```

Now check the pulled image.

```
[mahesh@fedora new] $ podman images
REPOSITORY                           TAG                  IMAGE ID           CREATED             SIZE
docker.io/library/httpd       2-alpine         fa848876521a    11 days ago        57 MB

[mahesh@fedora new] $
```

Create a new playbook to run the httpd image. See the [podman_container][11] module documentation for more information.

```
---
 - name: Playbook for podman.
   hosts: fedora.example.com
   tasks:
     - name: Running httpd image.
        containers.podman.podman_container:
          name: my-first-container
          image:  docker.io/httpd:2-alpine
          state: started
```

Check that the container is running.

```
[mahesh@fedora new] $ podman ps
CONTAINER ID        IMAGE    COMMAND   CREATED      STATUS         PORTS         NAMES
45d966eOe207     docker.io/library/httpd:2-alpine    httpd-foreground    13 seconds ago    Up 13 seconds ago       my-first-container

[mahesh@fedora new] $
```

Now to stop the running container, change the state value from _started_ to _absent_.

```
- name: Stopping httpd container.
       containers.podman.podman_container:
         name: my-first-container
         image:  docker.io/httpd:2-alpine
         state: absent
```

When you run the _podman ps_ command, you won’t see any containers running.

```
[mahesh@fedora new] $ podman ps
CONTAINER ID    IMAGE    COMMAND    CREATED    STATUS    PORTS    NAMES

[mahesh@fedora new] $
```

There are so many things that are possible with podman_container like recreating containers, restarting containers, checking whether container is running or not and many more. See the [documentation][11] for information on performing these actions.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-to-configure-podman-containers/

作者：[mahesh1b][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mahesh1b/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/ansible-podman-1-816x345.jpg
[2]: https://unsplash.com/@vnevremeni?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.ansible.com/
[5]: https://fedoramagazine.org/tag/ansible/
[6]: https://podman.io/
[7]: https://registry.fedoraproject.org/
[8]: https://www.projectquay.io/
[9]: https://fedoramagazine.org/tag/podman/
[10]: https://galaxy.ansible.com/
[11]: https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html
