[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate your container orchestration with Ansible modules for Kubernetes)
[#]: via: (https://opensource.com/article/20/9/ansible-modules-kubernetes)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Automate your container orchestration with Ansible modules for Kubernetes
======
Combine Ansible with Kubernetes for cloud automation. Plus, get our
cheat sheet for using the Ansible k8s module.
![Ship captain sailing the Kubernetes seas][1]

[Ansible][2] is one of the best tools for automating your work. [Kubernetes][3] is one of the best tools for orchestrating containers. What happens when you combine the two? As you might expect, Ansible combined with Kubernetes lets you automate your container orchestration. 

### Ansible modules

On its own, Ansible is basically just a framework for interpreting YAML files. Its true power comes from its [many modules][4]. Modules are what enable you to invoke external applications with just a few simple configuration settings in a playbook.

There are a few modules that deal directly with Kubernetes, and a few that handle related technology like [Docker][5] and [Podman][6]. Learning a new module is often similar to learning a new terminal command or a new API. You get familiar with a module from its documentation, you learn what arguments it accepts, and you equate its options to how you might use the application it interfaces with.

### Access a Kubernetes cluster

To try out Kubernetes modules in Ansible, you must have access to a Kubernetes cluster. If you don't have that, then you might try to open a trial account online, but most of those are short term. Instead, you can install [Minikube][7], as described on the Kubernetes website or in Bryant Son's excellent article on [getting started with Minikube][8]. Minikube provides a local instance of a single-node Kubernetes install, allowing you to configure and interact with it as you would a full cluster.

**[Download the [Ansible k8s cheat sheet][9]]**

Before installing Minikube, you must ensure that your environment is ready to serve as a virtualization backend. You may need to install `libvirt` and grant yourself permission to the `libvirt` group:


```
$ sudo dnf install libvirt
$ sudo systemctl start libvirtd
$ sudo usermod --append --groups libvirt `whoami`
$ newgrp libvirt
```

#### Install Python modules

To prepare for using Kubernetes-related Ansible modules, you should also install a few helper Python modules:


```
$ pip3.6 install kubernetes --user
$ pip3.6 install openshift --user
```

#### Start Kubernetes

If you're using Minikube instead of a Kubernetes cluster, use the `minikube` command to start up a local, miniaturized Kubernetes instance on your computer:


```
`$ minikube start --driver=kvm2 --kvm-network default`
```

Wait for Minikube to initialize. Depending on your internet connection, this could take several minutes.

### Get information about your cluster

Once you've started your cluster successfully, you can get information about it with the `cluster-info` option:


```
$ kubectl cluster-info
Kubernetes master is running at <https://192.168.39.190:8443>
KubeDNS is running at <https://192.168.39.190:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy>

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

### Use the k8s module

The entry point for using Kubernetes through Ansible is the `k8s` module, which enables you to manage Kubernetes objects from your playbooks. This module describes states resulting from `kubectl` instructions. For instance, here's how you would create a new [namespace][10] with `kubectl`:


```
`$ kubectl create namespace my-namespace`
```

It's a simple action, and the YAML representation of the same result is similarly terse:


```
\- hosts: localhost
  tasks:
    - name: create namespace
      k8s:
        name: my-namespace
        api_version: v1
        kind: Namespace
        state: present
```

In this case, the host is defined as `localhost`, under the assumption that you're running this against Minikube. Notice that the module in use defines the syntax of the parameters available (such as `api_version` and `kind`).

Before using this playbook, verify it with `yamllint`:


```
`$ yamllint example.yaml`
```

Correct any errors, and then run the playbook:


```
`$ ansible-playbook ./example.yaml`
```

Verify that the new namespace has been created:


```
$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   37h
kube-node-lease   Active   37h
kube-public       Active   37h
kube-system       Active   37h
demo              Active   11h
my-namespace      Active   3s
```

### Pull a container image with Podman

Containers are Linux systems, almost impossibly minimal in scope, that can be managed by Kubernetes. Much of the container specifications have been defined by the [LXC project][11] and Docker. A recent addition to the container toolset is Podman, which is popular because it runs without requiring a daemon.

With Podman, you can pull a container image from a repository, such as Docker Hub or Quay.io. The Ansible syntax for this is simple, and all you need to know is the location of the container, which is available from the repository's website:


```
   - name: pull an image
      podman_image:
        name: quay.io/jitesoft/nginx
```

Verify it with `yamllint`:


```
`$ yamllint example.yaml`
```

And then run the playbook:


```
$ ansible-playbook ./example.yaml
[WARNING]: provided hosts list is empty, only localhost is available.
Note that the implicit localhost does not match 'all'

PLAY [localhost] ************************

TASK [Gathering Facts] ************************
ok: [localhost]

TASK [create k8s namespace] ************************
ok: [localhost]

TASK [pull an image] ************************
changed: [localhost]

PLAY RECAP ************************
localhost: ok=3 changed=1 unreachable=0 failed=0
           skipped=0 rescued=0 ignored=0
```

### Deploy with Ansible

You're not limited to small maintenance tasks with Ansible. Your playbook can interact with Ansible in much the same way a configuration file does with `kubectl`. In fact, in many ways, the YAML you know by using Kubernetes translates to your Ansible plays. Here's a configuration you might pass directly to `kubectl` to deploy an image (in this example, a web server):


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-webserver
spec:
  selector:
    matchLabels:
      run: my-webserver
  replicas: 1
  template:
    metadata:
      labels:
        run: my-webserver
    spec:
      containers:
      - name: my-webserver
        image: nginx
        ports:
        - containerPort: 80
```

If you know these parameters, then you mostly know the parameters required to accomplish the same with Ansible. You can, with very little modification, move that YAML into a `definition` element in your Ansible playbook:


```
   - name: deploy a web server
      k8s:
        api_version: v1
        namespace: my-namespace
        definition:
          kind: Deployment
          metadata:
            labels:
              app: nginx
            name: nginx-deploy
          spec:
            replicas: 1
            selector:
              matchLabels:
                app: nginx
            template:
              metadata:
                labels:
                  app: nginx
              spec:
                containers:
                  - name: my-webserver
                    image: quay.io/jitesoft/nginx
                    ports:
                      - containerPort: 80
                        protocol: TCP
```

After running this, you can see the deployment with `kubectl`, as usual:


```
$ kubectl -n my-namespace get pods
NAME                      READY  STATUS
nginx-deploy-7fdc9-t9wc2  1/1    Running
```

### Modules for the cloud

As more development and deployments move to the cloud, it's important to understand how to automate the important aspects of your cloud. The `k8s` and `podman_image` modules are only two examples of modules related to Kubernetes and a mere fraction of modules developed for the cloud. Take a look at your workflow, find the tasks you want to track and automate, and see how Ansible can help you do more by doing less.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ansible-modules-kubernetes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/resources/what-ansible
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://docs.ansible.com/ansible/latest/modules/modules_by_category.html
[5]: https://opensource.com/resources/what-docker
[6]: http://podman.io
[7]: https://kubernetes.io/docs/tasks/tools/install-minikube
[8]: https://opensource.com/article/18/10/getting-started-minikube
[9]: https://opensource.com/downloads/ansible-k8s-cheat-sheet
[10]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[11]: https://www.redhat.com/sysadmin/exploring-containers-lxc
