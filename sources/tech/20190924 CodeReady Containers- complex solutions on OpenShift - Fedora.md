[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (CodeReady Containers: complex solutions on OpenShift + Fedora)
[#]: via: (https://fedoramagazine.org/codeready-containers-complex-solutions-on-openshift-fedora/)
[#]: author: (Marc Chisinevski https://fedoramagazine.org/author/mchisine/)

CodeReady Containers: complex solutions on OpenShift + Fedora
======

![][1]

Want to experiment with (complex) solutions on [OpenShift][2] 4.1+? CodeReady Containers (CRC) on a physical Fedora server is a great choice. It lets you:

  * Configure the RAM available to CRC / OpenShift (this is key as we’ll deploy Machine Learning, Change Data Capture, Process Automation and other solutions with significant memory requirements)
  * Avoid installing anything on your laptop
  * Standardize (on Fedora 30) so that you get the same results every time



Start by installing CRC and Ansible Agnostic Deployer (AgnosticD) on a Fedora 30 physical server. Then, you’ll use AgnosticD to deploy Open Data Hub on the OpenShift 4.1 environment created by CRC. Let’s get started!

### Set up CodeReady Containers

```
$ dnf config-manager --set-enabled fedora
$ su -c 'dnf -y install git wget tar qemu-kvm libvirt NetworkManager jq libselinux-python'
$ sudo systemctl enable --now libvirtd
```

Let’s also add a user.

```
$ sudo adduser demouser
$ sudo passwd demouser
$ sudo usermod -aG wheel demouser
```

Download and extract CodeReady Containers:

```
$ su demouser
$ cd /home/demouser
$ wget https://mirror.openshift.com/pub/openshift-v4/clients/crc/1.0.0-beta.3/crc-linux-amd64.tar.xz
$ tar -xvf crc-linux-amd64.tar.xz
$ cd crc-linux-1.0.0-beta.3-amd64/
$ sudo cp ./crc /usr/bin
```

Set the memory available to CRC according to what you have on your physical server. For example, on a physical server with around 100GB you can allocate 80G to CRC as follows:

```
$ crc config set memory 81920
$ crc setup
```

You’ll need your pull secret from <https://cloud.redhat.com/openshift/install/metal/user-provisioned>.

```
$ crc start
```

That’s it — you can now login to your OpenShift environment:

```
eval $(crc oc-env) && oc login -u kubeadmin -p <password> https://api.crc.testing:6443
```

### Set up Ansible Agnostic Deployer

[github.com/redhat-cop/agnosticd][3] is a fully automated two-phase deployer. Let’s deploy it!

```
$ su demouser
$ cd /home/demouser
$ git clone https://github.com/redhat-cop/agnosticd.git
$ cd agnosticd/ansible
$ python -m pip install --upgrade --trusted-host files.pythonhosted.org -r requirements.txt
$ python3 -m pip install --upgrade --trusted-host files.pythonhosted.org -r requirements.txt
$ pip3 install kubernetes
$ pip3 install openshift
$ pip install kubernetes
$ pip install openshift
```

### Set up Open Data Hub on Code Ready Containers

[Open Data Hub][4] is a machine-learning-as-a-service platform built on OpenShift and Kafka/Strimzi. It integrates a collection of open source projects.

First, create an Ansible inventory file with the following content.

```
$ cat inventory
$ 127.0.0.1 ansible_connection=local
```

Set up the WORKLOAD environment variable so that Ansible Agnostic Deployer knows that we want to deploy Open Data Hub.

```
$ export WORKLOAD="ocp4-workload-open-data-hub"
$ sudo cp /usr/local/bin/ansible-playbook /usr/bin/ansible-playbook
```

We are only deploying one Open Data Hub project, so set _user_count_ to 1. You can set up workshops for many students by setting _user_count_.

An OpenShift project (with Open Data Hub in our case) will be created for each student.

```
$ eval $(crc oc-env) && oc login -u kubeadmin -p <password> https://api.crc.testing:6443
$ ansible-playbook -i inventory  ./configs/ocp-workloads/ocp-workload.yml -e"ocp_workload=${WORKLOAD}" -e"ACTION=create" -e"user_count=1" -e"ocp_username=kubeadmin" -e"ansible_become_pass=<password>" -e"silent=False"
$ oc project open-data-hub-user1
$ oc get route
NAME         HOST/PORT                                         PATH   SERVICES     PORT       TERMINATION     WILDCARD
jupyterhub   jupyterhub-open-data-hub-user1.apps-crc.testing          jupyterhub   8080-tcp   edge/Redirect   None
```

On your laptop, add _jupyterhub-open-data-hub-user1.apps-crc.testing_ to your _/etc/hosts_ file. For example:

```
127.0.0.1 localhost fedora30 console-openshift-console.apps-crc.testing oauth-openshift.apps-crc.testing mapit-app-management.apps-crc.testing mapit-spring-pipeline-demo.apps-crc.testing jupyterhub-open-data-hub-user1.apps-crc.testing jupyterhub-open-data-hub-user1.apps-crc.testing
```

On your laptop:

```
$ sudo ssh marc@fedora30 -L 443:jupyterhub-open-data-hub-user1.apps-crc.testing:443
```

You can now browse to [https://jupyterhub-open-data-hub-user1.apps-crc.testing][5].

Now that we have Open Data Hub ready, you could deploy something interesting on it. For example, you could deploy IBM’s Qiskit open source framework for quantum computing. For more information, refer to Video no. 9 at [this YouTube playlist][6], and the [Github repo here][7].

You could also deploy plenty of other useful tools for Process Automation, Change Data Capture, Camel Integration, and 3scale API Management. You don’t have to wait for articles on these, though. Step-by-step short videos are already [available on YouTube][6].

The corresponding step-by-step instructions are [also on YouTube][6]. You can also follow along with this article using the [GitHub repo][8].

* * *

_Photo by _[_Marta Markes_][9]_ on _[_Unsplash_][10]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/codeready-containers-complex-solutions-on-openshift-fedora/

作者：[Marc Chisinevski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mchisine/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/codeready-containers-816x345.jpg
[2]: https://fedoramagazine.org/run-openshift-locally-minishift/
[3]: https://github.com/redhat-cop/agnosticd
[4]: https://opendatahub.io/
[5]: https://jupyterhub-open-data-hub-user1.apps-crc.testing/
[6]: https://www.youtube.com/playlist?list=PLg1pvyPzFye2UtQjZTSjoXhFdqkGK6exw
[7]: https://github.com/marcredhat/crcdemos/blob/master/IBMQuantum-qiskit
[8]: https://github.com/marcredhat/crcdemos/tree/master/fedora
[9]: https://unsplash.com/@vnevremeni?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]: https://unsplash.com/s/photos/container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
