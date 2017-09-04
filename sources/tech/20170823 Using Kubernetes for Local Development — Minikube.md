translating----geekpi

Using Kubernetes for Local Development — Minikube
============================================================

If you ops team are using Docker and Kubernetes, it is recommended to adopt the same or similar technologies in development. This will reduce the number of incompatibility and portability problems and makes everyone consider the application container a common responsibility of both Dev and Ops teams.



![](https://cdn-images-1.medium.com/max/1000/1*3RHSw_mAFsUhObmbHyjVOg.jpeg)

This blog post introduces the usage of Kubernetes in development mode and it is inspired from a screencast that you can find in [Painless Docker Course][10].

![](https://cdn-images-1.medium.com/max/800/1*a02rarYYYvd7GalkyQ3AXg.jpeg)][1] 

Minikube is a tool that makes developers’ life easy by allowing them to use and run a Kubernetes cluster in a local machine.

In this blog post, for the examples that I tested, I am using Linux Mint 18, but it doesn’t change nothing apart the installation part.

```
cat /etc/lsb-release 
```

```
DISTRIB_ID=LinuxMint
DISTRIB_RELEASE=18.1
DISTRIB_CODENAME=serena
DISTRIB_DESCRIPTION=”Linux Mint 18.1 Serena”
```


![](https://cdn-images-1.medium.com/max/800/1*DZzICImnejKbNV-NCa3gEg.png)

#### Prerequisites

In order to work with Minkube, we should have Kubectl and Minikube installed + some virtualization drivers.

*   For OS X, install [xhyve driver][2], [VirtualBox][3], or [VMware Fusion][4], then Kubectl and Minkube

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
```

```
chmod +x ./kubectl
```

```
sudo mv ./kubectl /usr/local/bin/kubectl
```

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

*   For Windows, install [VirtualBox][6] or [Hyper-V][7] then Kubectl and Minkube

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/windows/amd64/kubectl.exe
```

Add the binary to your PATH (This [article][11] explains how to modify the PATH)

Download the `minikube-windows-amd64.exe` file, rename it to `minikube.exe`and add it to your path.

Find the last release [here][12].

*   For Linux, install [VirtualBox][8] or [KVM][9] then Kubectl and Minkube

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
```

```
chmod +x ./kubectl
```

```
sudo mv ./kubectl /usr/local/bin/kubectl
```

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

#### Using Minikube

Let’s start by creating an image from this Dockerfile:

```
FROM busybox
ADD index.html /www/index.html
EXPOSE 8000
CMD httpd -p 8000 -h /www; tail -f /dev/null
```

Add something you’d like to see in the index.html page.

Build the image:

```
docker build -t eon01/hello-world-web-server .
```

Let’s run the container to test it:

```
docker run -d --name webserver -p 8000:8000 eon01/hello-world-web-server
```

This is the output of docker ps:

```
docker ps
```

```

CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS              PORTS                    NAMES
2ad8d688d812        eon01/hello-world-web-server   "/bin/sh -c 'httpd..."   3 seconds ago       Up 2 seconds        0.0.0.0:8000->8000/tcp   webserver
```

Let’s commit the image and upload it to the public Docker Hub. You can use your own private registry:

```
docker commit webserver
docker push eon01/hello-world-web-server
```

Remove the container since we will use it with Minikube

```
docker rm -f webserver
```

Time to start Minikube:

```
minkube start
```

Check the status:

```
minikube status
```

We are running a single node:

```
kubectl get node
```

Run the webserver:

```
kubectl run webserver --image=eon01/hello-world-web-server --port=8000
```

A webserver should have it’s port exposed:

```
kubectl expose deployment webserver --type=NodePort
```

In order to get the service url type:

```
minikube service webserver --url
```

We can see the content of the web page using :

```
curl $(minikube service webserver --url)
```

To show a summary of the running cluster run:

```
kubectl cluster-info
```

For more details:

```
kubectl cluster-info dump
```

We can also list the pods using:

```
kubectl get pods
```

And to access to the dashboard use:

```
minikube dashboard
```

If you would like to access the frontend of the web application type:

```
kubectl proxy
```

If we want to execute a command inside the container, get the pod id using:

```
kubetctl get pods
```

Then use it like :

```
kubectl exec webserver-2022867364-0v1p9 -it -- /bin/sh
```

To finish, delete all deployments:

```
kubectl delete deployments --all
```

Delete all pods:

```
kubectl delete pods --all
```

And stop Minikube

```
minikube stop
```

I hope you enjoyed this introduction.

### Connect Deeper

If you resonated with this article, you can find more interesting contents in [Painless Docker Course][13].

We, [Eralabs][14], will be happy to help you on your Docker and Cloud Computing projects, [contact us][15] and we will be happy to hear about your projects.

Please subscribe to [DevOpsLinks][16] : An Online Community Of Thousands Of IT Experts & DevOps Enthusiast From All Over The World.

You may be also interested in joining our newsletter [Shipped][17], a newsletter focused on containers, orchestration and serverless technologies.

You can find me on [Twitter][18], [Clarity][19] or my [website][20] and you can also check my books: [SaltStack For DevOps][21].

Don’t forget to join my last project [Jobs For DevOps][22] !

If you liked this post, please recommend it and share it with your followers.

--------------------------------------------------------------------------------

作者简介：

Aymen El Amri
Cloud & Software Architect, Entrepreneur, Author, CEO www.eralabs.io, Founder www.devopslinks.com, Personal Page : www.aymenelamri.com

-------------------


via: https://medium.com/devopslinks/using-kubernetes-minikube-for-local-development-c37c6e56e3db

作者：[Aymen El Amri ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@eon01
[1]:http://painlessdocker.com/
[2]:https://git.k8s.io/minikube/docs/drivers.md#xhyve-driver
[3]:https://www.virtualbox.org/wiki/Downloads
[4]:https://www.vmware.com/products/fusion
[5]:https://storage.googleapis.com/kubernetes-release/release/stable.txt%29/bin/darwin/amd64/kubectl
[6]:https://www.virtualbox.org/wiki/Downloads
[7]:https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install
[8]:https://www.virtualbox.org/wiki/Downloads
[9]:http://www.linux-kvm.org/
[10]:http://painlessdocker.com/
[11]:https://www.windows-commandline.com/set-path-command-line/
[12]:https://github.com/kubernetes/minikube/releases
[13]:http://painlessdocker.com/
[14]:http://eralabs.io/
[15]:http://eralabs.io/
[16]:http://devopslinks.com/
[17]:http://shipped.devopslinks.com/
[18]:https://twitter.com/eon01
[19]:https://clarity.fm/aymenelamri/
[20]:http://aymenelamri.com/
[21]:http://saltstackfordevops.com/
[22]:http://jobsfordevops.com/
