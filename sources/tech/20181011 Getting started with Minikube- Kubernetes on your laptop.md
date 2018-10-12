translating by Flowsnow

Getting started with Minikube: Kubernetes on your laptop
======
A step-by-step guide for running Minikube.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ)

Minikube is advertised on the [Hello Minikube][1] tutorial page as a simple way to run Kubernetes for Docker. While that documentation is very informative, it is primarily written for MacOS. You can dig deeper for instructions for Windows or a Linux distribution, but they are not very clear. And much of the documentation—like one on [installing drivers for Minikube][2]—is targeted at Debian/Ubuntu users.

### Prerequisites

  1. You have [installed Docker][3].

  2. Your computer is an RHEL/CentOS/Fedora-based workstation.

  3. You have [installed a working KVM2 hypervisor][4].

  4. You have a working **docker-machine-driver-kvm2**. The following commands will install the driver:

```
   curl -Lo docker-machine-driver-kvm2 https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 \
    chmod +x docker-machine-driver-kvm2 \
    && sudo cp docker-machine-driver-kvm2 /usr/local/bin/ \
    && rm docker-machine-driver-kvm2
```

### Download, install, and start Minikube

  1. Create a directory for the two files you will download: [minikube][5] and [kubectl][6].


  2. Open a terminal window and run the following command to install minikube.

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

```

Note that the minikube version (e.g., minikube-linux-amd64) may differ based on your computer's specs.



  3. **chmod** to make it writable.

```
chmod +x minikube

```



  4. Move the file to the **/usr/local/bin** path so you can run it as a command.

```
mv minikube /usr/local/bin

```



  5. Install kubectl using the following command (similar to the minikube installation process).

```
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

```

Use the **curl** command to determine the latest version of Kubernetes.



  6. **chmod** to make kubectl writable.

```
chmod +x kubectl

```



  7. Move kubectl to the **/usr/local/bin** path to run it as a command.

```
mv kubectl /usr/local/bin

```



  8. Run **minikube start**. To do so, you need to have a hypervisor available. I used KVM2, and you can also use Virtualbox. Make sure to run the following command as a user instead of root so the configuration will be stored for the user instead of root.

```
minikube start --vm-driver=kvm2

```

It can take quite a while, so wait for it.



  9. Minikube should download and start. Use the following command to make sure it was successful.

```
cat ~/.kube/config

```



  10. Execute the following command to run Minikube as the context. The context is what determines which cluster kubectl is interacting with. You can see all your available contexts in the ~/.kube/config file.

```
kubectl config use-context minikube

```



  11. Run the **config** file command again to check that context Minikube is there.

```
cat ~/.kube/config

```



  12. Finally, run the following command to open a browser with the Kubernetes dashboard.
  
```
minikube dashboard

```




This guide aims to make things easier for RHEL/Fedora/CentOS-based operating system users.

Now that Minikube is up and running, read [Running Kubernetes Locally via Minikube][7] to start using it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/getting-started-minikube

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://kubernetes.io/docs/tutorials/hello-minikube
[2]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md
[3]: https://docs.docker.com/install
[4]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#kvm2-driver
[5]: https://github.com/kubernetes/minikube/releases
[6]: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-using-curl
[7]: https://kubernetes.io/docs/setup/minikube
