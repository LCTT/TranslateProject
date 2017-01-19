translating---geekpi

[Use Docker remotely on Atomic Host][1]
---------------------

 ![remote-atomic-docker](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/remote-atomic-docker-945x400.jpg) 

Atomic Host from [Project Atomic][2] is a lightweight container based OS that can run Linux containers. It’s been optimized to use as a container run-time system for cloud environments. For instance, it can host a Docker daemon and containers. At times, you may want to run docker commands on that host and manage the server from elsewhere. This article shows you how to remotely access the [Docker][3] daemon of the Fedora Atomic Host, [which you can download here.][4] The entire process is automated by [Ansible][5] — which is a great tool when it comes to automating everything.

### A note on security

We’ll secure the Docker daemon with [TLS][6], since we’re connecting via the network. This process requires a client certificate and server certificate. The OpenSSL package is used to to create the certificate keys for establishing a TLS connection. Here, the Atomic Host is running the daemon, and our local [Fedora Workstation][7] acts as a client.

Before you follow these steps, note that _any_ process on the client that can access the TLS certs now has **full root access on the server.** Thus, the client can do anything it wants to do on the server. Therefore, we need to give cert access only to the specific client host that can be trusted. You should copy the client certificates only to a client host completely under your control. Even in that case, client machine security is critical.

However, this method is only one way to remotely access the daemon. Orchestration tools often provide more secure controls. The simple method below works for personal experimenting, but may not be appropriate for an open network.

### Getting the Ansible role

[Chris Houseknecht][8] wrote an Ansible role that creates all the certs required. This way you don’t need to run _openssl_commands manually. These are provided in an [Ansible role repository][9]. Clone it to your present working host.

```
$ mkdir docker-remote-access
$ cd docker-remote-access
$ git clone https://github.com/ansible/role-secure-docker-daemon.git
```

### Create config files

Next, you must create an Ansible configuration file, inventory and playbook file to setup the client and daemon. The following instructions create client and server certs on the Atomic Host. Then, they fetch the client certs to the local machine. Finally, they configure the daemon and client so they talk to each other.

Here is the directory structure you need. Create each of the files below as shown.

```
$ tree docker-remote-access/
docker-remote-access/
├── ansible.cfg
├── inventory
├── remote-access.yml
└── role-secure-docker-daemon
```

### _ansible.cfg_

```
 $ vim ansible.cfg
[defaults]
inventory=inventory
```

### _inventory_

```
 $ vim inventory
[daemonhost]
'IP_OF_ATOMIC_HOST' ansible_ssh_private_key_file='PRIVATE_KEY_FILE'
```

Replace _IP_OF_ATOMIC_HOST_ in the inventory file with the IP of your Atomic Host. Replace _PRIVATE_KEY_FILE_ with the location of the SSH private key file on your local system.

### _remote-access.yml_

```
$ vim remote-access.yml
---
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

### Access the remote Atomic Host

Now, run the Ansible playbook:

```
$ ansible-playbook remote-access.yml
```

Make sure that the tcp port 2376 is opened on your Atomic Host. If you’re using Openstack, add TCP port 2376 in your security rule. If you’re using AWS, add it to your security group.

Now, a _docker_ command run as a regular user on your workstation talks to the daemon of the Atomic host, and executes the command there. You don’t need to manually _ssh_ or issue a command on your Atomic host. This allows you to launch containerized applications remotely and easily, yet securely.

If you want to clone the playbook and the config file, there is [a git repository available here][10].

[
 ![docker-daemon](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/docker-daemon.jpg) 
][11]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-docker-remotely-atomic-host/

作者：[Trishna Guha][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
