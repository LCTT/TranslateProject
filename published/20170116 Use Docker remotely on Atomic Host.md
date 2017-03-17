在 Atomic 主机上远程使用 Docker
==========

![remote-atomic-docker](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/remote-atomic-docker-945x400.jpg) 

来自 [Atomic 项目][2] 的 Atomic 主机是一个轻量级的容器基于的操作系统，它可以运行 Linux 容器。它已被优化为用作云环境的容器运行时系统。例如，它可以托管 Docker 守护进程和容器。有时，你可能需要在该主机上运行 docker 命令，并从其他地方管理服务器。本文介绍如何远程访问 Fedora Atomic 主机（[你可以在这里下载到它][4]）上的 [Docker][3] 守护进程。整个过程由 [Ansible][5] 自动完成 - 在涉及到自动化的一切上，这真是一个伟大的工具！

### 安全备忘录

由于我们通过网络连接，所以我们使用 [TLS][6] 保护 Docker 守护进程。此过程需要客户端证书和服务器证书。OpenSSL 包用于创建用于建立 TLS 连接的证书密钥。这里，Atomic 主机运行守护程序，我们的本地的 [Fedora Workstation][7] 充当客户端。

在你按照这些步骤进行之前，请注意，_任何_在客户端上可以访问 TLS 证书的进程在服务器上具有**完全的 root 访问权限**。 因此，客户端可以在服务器上做任何它想做的事情。我们需要仅向可信任的特定客户端主机授予证书访问权限。你应该将客户端证书仅复制到完全由你控制的客户端主机。但即使在这种情况下，客户端机器的安全也至关重要。

不过，此方法只是远程访问守护程序的一种方法。编排工具通常提供更安全的控制。下面的简单方法适用于个人实验，可能不适合开放式网络。

### 获取 Ansible role

[Chris Houseknecht][8] 写了一个 Ansible role，它会创造所需的所有证书。这样，你不需要手动运行 `openssl` 命令了。 这些在 [Ansible role 仓库][9]中提供。将它克隆到你当前的工作主机。

```
$ mkdir docker-remote-access
$ cd docker-remote-access
$ git clone https://github.com/ansible/role-secure-docker-daemon.git
```

### 创建配置文件

接下来，你必须创建 Ansible 配置文件、清单（inventory）和剧本（playbook）文件以设置客户端和守护进程。以下说明在 Atomic 主机上创建客户端和服务器证书。然后，获取客户端证书到本地。最后，它们会配置守护进程以及客户端，使它们能彼此交互。

这里是你需要的目录结构。如下所示，创建下面的每个文件。

```
$ tree docker-remote-access/
docker-remote-access/
├── ansible.cfg
├── inventory
├── remote-access.yml
└── role-secure-docker-daemon
```

`ansible.cfg`：

```
$ vim ansible.cfg
```
```
[defaults]
inventory=inventory
```

清单文件（`inventory`）：

```
$ vim inventory
```
```
[daemonhost]
'IP_OF_ATOMIC_HOST' ansible_ssh_private_key_file='PRIVATE_KEY_FILE'
```

将清单文件（`inventory`） 中的 `IP_OF_ATOMIC_HOST` 替换为 Atomic 主机的 IP。将 `PRIVATE_KEY_FILE` 替换为本地系统上的 SSH 私钥文件的位置。

剧本文件（`remote-access.yml`）：

```
$ vim remote-access.yml
```
```
- name: Docker Client Set up
  hosts: daemonhost
  gather_facts: no
  tasks:
    - name: Make ~/.docker directory for docker certs
      local_action: file path='~/.docker' state='directory'

    - name: Add Environment variables to ~/.bashrc
      local_action: lineinfile dest='~/.bashrc' line='export DOCKER_TLS_VERIFY=1\nexport DOCKER_CERT_PATH=~/.docker/\nexport DOCKER_HOST=tcp://{{ inventory_hostname }}:2376\n' state='present'

    - name: Source ~/.bashrc file
      local_action: shell source ~/.bashrc

- name: Docker Daemon Set up
  hosts: daemonhost
  gather_facts: no
  remote_user: fedora
  become: yes
  become_method: sudo
  become_user: root
  roles:
    - role: role-secure-docker-daemon
      dds_host: "{{ inventory_hostname }}"
      dds_server_cert_path: /etc/docker
      dds_restart_docker: no
  tasks:
    - name: fetch ca.pem from daemon host
      fetch:
        src: /root/.docker/ca.pem
        dest: ~/.docker/
        fail_on_missing: yes
        flat: yes
    - name: fetch cert.pem from daemon host
      fetch:
        src: /root/.docker/cert.pem
        dest: ~/.docker/
        fail_on_missing: yes
        flat: yes
    - name: fetch key.pem from daemon host
      fetch:
        src: /root/.docker/key.pem
        dest: ~/.docker/
        fail_on_missing: yes
        flat: yes
    - name: Remove Environment variable OPTIONS from /etc/sysconfig/docker
      lineinfile:
        dest: /etc/sysconfig/docker
        regexp: '^OPTIONS'
        state: absent

    - name: Modify Environment variable OPTIONS in /etc/sysconfig/docker
      lineinfile:
        dest: /etc/sysconfig/docker
        line: "OPTIONS='--selinux-enabled --log-driver=journald --tlsverify --tlscacert=/etc/docker/ca.pem --tlscert=/etc/docker/server-cert.pem --tlskey=/etc/docker/server-key.pem -H=0.0.0.0:2376 -H=unix:///var/run/docker.sock'"
        state: present

    - name: Remove client certs from daemon host
      file:
        path: /root/.docker
        state: absent

    - name: Reload Docker daemon
      command: systemctl daemon-reload
    - name: Restart Docker daemon
      command: systemctl restart docker.service
```

### 访问 Atomic 主机

现在运行 Ansible 剧本：

```
$ ansible-playbook remote-access.yml
```

确保 tcp 端口 2376 在你的 Atomic 主机上打开了。如果你在使用 Openstack，请在安全规则中添加 TCP 端口 2376。 如果你使用 AWS，请将其添加到你的安全组。

现在，在你的工作站上作为普通用户运行的 `docker` 命令与 Atomic 主机的守护进程通信，并在那里执行命令。你不需要手动 `ssh` 或在 Atomic 主机上发出命令。这可以让你远程、轻松、安全地启动容器化应用程序。

如果你想克隆 Ansible 剧本和配置文件，这里是 [git 仓库][10]。

[
 ![docker-daemon](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/docker-daemon.jpg) 
][11]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-docker-remotely-atomic-host/

作者：[Trishna Guha][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://trishnag.id.fedoraproject.org/
[1]:https://fedoramagazine.org/use-docker-remotely-atomic-host/
[2]:http://www.projectatomic.io/
[3]:https://www.docker.com/
[4]:https://getfedora.org/atomic/
[5]:https://www.ansible.com/
[6]:https://en.wikipedia.org/wiki/Transport_Layer_Security
[7]:https://getfedora.org/en/workstation/
[8]:https://twitter.com/CHouseknecht
[9]:https://github.com/ansible/role-secure-docker-daemon
[10]:https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/docker-remote-access
[11]:https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/docker-daemon.jpg
