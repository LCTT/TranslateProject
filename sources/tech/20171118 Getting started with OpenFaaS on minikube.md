Getting started with OpenFaaS on minikube
============================================================

This is a guide on how to setup OpenFaaS —  _Serverless Functions Made Simple_ on Kubernetes 1.8 with [minikube][4]. minikube is a [Kubernetes][5] distribution which lets you run a Kubernetes cluster on your laptop — it’s available for Mac and Linux, but is most commonly used with MacOS.

> This post is based upon our [Official Kubernetes Deployment guide][6]

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*C9845SlyaaT1_xrAGOBURg.png)

### Getting set up with Minikube

1.  Install the [xhyve driver][1] or [VirtualBox][2] which will be used to create a Linux VM for minikube. I find the VirtualBox option to be the most reliable.

2.  Setup minikube using the [official docs][3]

3.  Install `faas-cli` using `brew` or `curl -sL cli.openfaas.com | sudo sh`

4.  Install the `helm` CLI via brew: `brew install kubernetes-helm`

5.  Start minikube: `minikube start`

> Docker Captain’s tip: look out for when Docker Inc starts to ship Kubernetes built-into Docker for Mac and Windows. This will let you use Kubernetes without having to install additional software.

### Deploy OpenFaaS to minikube

1.  Create a service account for Helm’s server component (tiller): `kubectl -n kube-system create sa tiller \
     && kubectl create clusterrolebinding tiller \
     --clusterrole cluster-admin \
     --serviceaccount=kube-system:tiller`

2.  Install `tiller` which is Helm’s server-side component: `helm init --skip-refresh --upgrade --service-account tiller`

3.  Clone faas-netes (Kubernetes driver for OpenFaaS): `git clone https://github.com/openfaas/faas-netes && cd faas-netes`

4.  Minikube is not configured for RBAC, so we’ll pass an additional flag to turn it off: `helm upgrade --install --debug --reset-values --set async=false --set rbac=false openfaas openfaas/`

You’ll now see the OpenFaaS pods being installed on your minikube cluster. Type in `kubectl get pods` to see them:

```
NAME                            READY     STATUS    RESTARTS   AGE
```

```
alertmanager-6dbdcddfc4-fjmrf   1/1       Running   0          1m
```

```
faas-netesd-7b5b7d9d4-h9ftx     1/1       Running   0          1m
```

```
gateway-965d6676d-7xcv9         1/1       Running   0          1m
```

```
prometheus-64f9844488-t2mvn     1/1       Running   0          1m
```

30,000ft:

The API Gateway contains a [minimal UI for testing functions][7] and exposes a [RESTful API][8] for function management. The faas-netesd daemon is a Kubernetes controller which connects to the Kubernetes API server to manage Services, Deployments and Secrets.

Prometheus and AlertManager work in tandem to enable auto-scaling of functions to match demand. Prometheus metrics give you operational oversight and allow you to build powerful dashboards.

Prometheus dashboard example:

![](https://cdn-images-1.medium.com/max/1600/1*b0RnaFIss5fOJXkpIJJgMw.jpeg)

### Build/ship/run

OpenFaaS uses the Docker image format for the creation and versioning of functions which means that unlike many other FaaS projects you can use this in production to do:

*   vulnerability scanning

*   CI/CD

*   rolling upgrades

You can also deploy OpenFaaS to your existing production cluster and make use of spare capacity. The core services require around 10–30MB of RAM each.

> A key advantage of OpenFaaS is that it works with the container orchestration platform’s API, which means we integrate natively with both Kubernetes and Docker Swarm. Also, since our functions are properly versioned within a Docker registry, we can scale our functions on demand without any additional latency associated with frameworks that build functions on demand.

### Scaffold a new function

`faas-cli new --lang python hello`

This will create `hello.yml` along with a `handler` folder containing your handler.py file and requirements.txt for any pip modules you may need. You can edit these at any time without worrying about maintaining a Dockerfile — we do that and use best practices:

*   multi-stage builds

*   non-root users

*   Official Docker Alpine Linux builds for the base (this is swappable)

### Build your function

Your function will be built on your local machine and then pushed to a Docker registry. Let’s use the Docker Hub — just edit the `hello.yml` file and enter your user account name:

```
provider:
```

```
  name: faas
```

```
  gateway: http://localhost:8080
```

```
functions:
```

```
  hello:
```

```
    lang: python
```

```
    handler: ./hello
```

```
    image: alexellis2/hello
```

Now invoke a build. You will need Docker on your local system.

`faas-cli build -f hello.yml`

Push the versioned Docker image which contains your function up to the Docker Hub. If you’ve not logged into the Docker hub then type in `docker login` before carrying on.

`faas-cli push -f hello.yml`

Once you have multiple functions you can use the `--parallel=N` flag to build or push with multiple cores at once. The CLI also supports options such as `--no-cache` and `--squash`.

### Deploy and test your function

Now you can deploy your function, see it listed and invoke it. Each time you invoke the function we collect metrics which are made available through Prometheus.

```
$ export gw=http://$(minikube ip):31112
```

```
$ faas-cli deploy -f hello.yml --gateway $gw
Deploying: hello.
```

```
No existing function to remove
```

```
Deployed.
```

```
URL: http://192.168.99.100:31112/function/hello
```

You are given a standard route for invoking the function in the deployment message, but can also use the CLI to save on typing:

```
$ echo test | faas-cli invoke hello --gateway $gw
```

Now list the functions deployed and you will see the invocation count has gone up.

```
$ faas-cli list --gateway $gw
Function                       Invocations     Replicas
```

```
hello                          1               1
```

 _Note: this command also accepts a _  `_--verbose_`  _ flag for more information._ 

Since we are running OpenFaaS on a remote cluster (a Linux VM) we set up a `--gateway` override environmental variable. This could also be a remote host on a cloud platform. The alternative is to update the gateway value in your .yml file.

### Moving beyond minikube

Once you are familiar with OpenFaaS on minikube you can deploy to any Kubernetes cluster running on Linux hosts. Here’s an example of OpenFaaS running on Kubernetes on Google’s GKE platform by Stefan Prodan of WeaveWorks demonstrating the built-in auto-scaling capabilities:


### Keep learning

We have dozens of guides and blog available to get you up and running on the “FaaS Train” — head over to GitHub and bookmark our guides:

[openfaas/faas
faas - OpenFaaS - Serverless Functions Made Simple for Docker & Kubernetesgithub.com][9][][10]

I’ve included a short 15min video from Dockercon 2017 in Copenhagen where I gave an overview of Serverless and OpenFaaS at the Moby Summit.

Make sure to follow [OpenFaaS on Twitter][11] for all the latest Cool Hacks, demos and news.

--------------------------------------------------------------------------------

via: https://medium.com/@alexellisuk/getting-started-with-openfaas-on-minikube-634502c7acdf

作者：[Alex Ellis ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@alexellisuk?source=post_header_lockup
[1]:https://git.k8s.io/minikube/docs/drivers.md#xhyve-driver
[2]:https://www.virtualbox.org/wiki/Downloads
[3]:https://kubernetes.io/docs/tasks/tools/install-minikube/
[4]:https://kubernetes.io/docs/getting-started-guides/minikube/
[5]:https://kubernetes.io/
[6]:https://github.com/openfaas/faas/blob/master/guide/deployment_k8s.md
[7]:https://github.com/openfaas/faas/blob/master/TestDrive.md
[8]:https://github.com/openfaas/faas/tree/master/api-docs
[9]:https://github.com/openfaas/faas/tree/master/guide
[10]:https://github.com/openfaas/faas/tree/master/guide
[11]:https://twitter.com/openfaas
