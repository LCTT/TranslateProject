[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Demystifying Kubernetes)
[#]: via: (https://opensourceforu.com/2019/11/demystifying-kubernetes/)
[#]: author: (Abhinav Nath Gupta https://opensourceforu.com/author/abhinav-gupta/)

Demystifying Kubernetes
======

[![][1]][2]

_Kubernetes is a production grade open source system for automating deployment, scaling, and the management of containerised applications. This article is about managing containers with Kubernetes._

‘Containers’ has become one of the latest buzz words. But what does the term imply? Often associated with Docker, a container is defined as a standardised unit of software. Containers encapsulate the software and the environment required to run the software into a single unit that is easily shippable.
A container is a standard unit of software that packages the code and all its dependencies so that the application runs quickly and reliably from one computing environment to another. The container does this by creating something called an image, which is akin to an ISO image. A container image is a lightweight, standalone, executable package of software that includes everything needed to run an application — code, runtime, system tools, system libraries and settings.

Container images become containers at runtime and, in the case of Docker containers, images become containers when they run on a Docker engine. Containers isolate software from the environment and ensure that it works uniformly despite differences in instances across environments.

**What is container management?**
Container management is the process of organising, adding or replacing large numbers of software containers. Container management uses software to automate the process of creating, deploying and scaling containers. This gives rise to the need for container orchestration—a tool that automates the deployment, management, scaling, networking and availability of container based applications.

**Kubernetes**
Kubernetes is a portable, extensible, open source platform for managing containerised workloads and services, and it facilitates both configuration and automation. It was originally developed by Google. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

Google open sourced the Kubernetes project in 2014. Kubernetes builds upon a decade and a half of experience that Google had with running production workloads at scale, combined with best-of-breed ideas and practices from the community, as well as the usage of declarative syntax.

Some of the common terminologies associated with the Kubernetes ecosystem are listed below.
_**Pods:**_ A pod is the basic execution unit of a Kubernetes application – the smallest and simplest unit in the Kubernetes object model that you create or deploy. A pod represents processes running on a Kubernetes cluster.

A pod encapsulates the running container, storage, network IP (unique) and commands that govern how the container should run. It represents the single unit of deployment within the Kubernetes ecosystem, a single instance of an application which might consist of one or many containers running with tight coupling and shared resources.

Pods in a Kubernetes cluster can be used in two main ways. The first is pods that run a single container. The ‘one-container-per-pod’ model is the most common Kubernetes use case. The second method involves pods that run multiple containers that need to work together.

A pod might encapsulate an application composed of multiple co-located containers that are tightly coupled and need to share resources.

_**ReplicaSet:**_ The purpose of a ReplicaSet is to maintain a stable set of replica pods running at any given time. A ReplicaSet contains information about how many copies of a particular pod should be running. To create multiple pods to match the ReplicaSet criteria, Kubernetes uses the pod template. The link a ReplicaSet has to its pods is via the latter’s metadata.ownerReferences field, which specifies which resource owns the current object.

_**Services:**_ Services are an abstraction to expose the functionality of a set of pods. With Kubernetes, you don’t need to modify your application to use an unfamiliar service discovery mechanism. Kubernetes gives pods their own IP addresses and a single DNS name for a set of pods, and can load-balance across them.

One major problem that services solve is the integration of the front-end and back-end of a Web application. Since Kubernetes provides IP addresses behind the scenes to pods, when the latter are killed and resurrected, the IP addresses are changed. This creates a big problem on the front-end side to connect a given back-end IP address to the corresponding front-end IP address. Services solve this problem by providing an abstraction over the pods — something akin to a load balancer.

_**Volumes:**_ A Kubernetes volume has an explicit lifetime — the same as the pod that encloses it. Consequently, a volume outlives any container that runs within the pod and the data is preserved across container restarts. Of course, when a pod ceases to exist, the volume will cease to exist, too. Perhaps more important than this is that Kubernetes supports many types of volumes, and a pod can use any number of them simultaneously.

At its core, a volume is just a directory, possibly with some data in it, which is accessible to the containers in a pod. How that directory comes to be, the medium that backs it and its contents are determined by the particular volume type used.

**Why Kubernetes?**
Containers are a good way to bundle and run applications. In a production environment, you need to manage the containers that run the applications and ensure that there is no downtime. For example, if one container goes down, another needs to start. Wouldn’t it be nice if this could be automated by a system?
That’s where Kubernetes comes to the rescue! It provides a framework to run distributed systems resiliently. It takes care of scaling requirements, failover, deployment patterns, and more. For example, Kubernetes can easily manage a canary deployment for your system.

Kubernetes provides users with:
1\. Service discovery and load balancing
2\. Storage orchestration
3\. Automated roll-outs and roll-backs
4\. Automatic bin packing
5\. Self-healing
6\. Secret and configuration management

**What can Kubernetes do?**
In this section we will look at some code examples of how to use Kubernetes when building a Web application from scratch. We will create a simple back-end server using Flask in Python.
There are a few prerequisites for those who want to build a Web app from scratch. These are:
1\. Basic understanding of Docker, Docker containers and Docker images. A quick refresher can be found at _<https://www.docker.com/sites/default/files/Docker\_CheatSheet\_08.09.2016\_0.pdf>_.
2\. Docker should be installed in the system.
3\. Kubernetes should be installed in the system. Instructions on how to do so on a local machine can be found at _<https://kubernetes.io/docs/setup/learning-environment/minikube/>_.
Now, create a simple directory, as shown in the code snippet below:

```
mkdir flask-kubernetes/app && cd flask-kubernetes/app
```

Next, inside the _flask-kubernetes/app_ directory, create a file called main.py, as shown in the code snippet below:

```
touch main.py
```

In the newly created _main.py,_ paste the following code:

```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
return "Hello from Kubernetes!"

if __name__ == "__main__":
app.run(host='0.0.0.0')
```

Install Flask in your local using the command below:

```
pip install Flask==0.10.1
```

After installing Flask, run the following command:

```
python app.py
```

This should run the Flask server locally on port 5000, which is the default port for the Flask app, and you can see the output ‘Hello from Kubernetes!’ on *<http://localhost:500*0>.
Once the server is running locally, we will create a Docker image to be used by Kubernetes.
Create a file with the name Dockerfile and paste the following code snippet in it:

```
FROM python:3.7

RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "/app/main.py"]
```

The instructions in _Dockerfile_ are explained below:

1\. Docker will fetch the Python 3.7 image from the Docker hub.
2\. It will create an app directory in the image.
3\. It will set an app as the working directory.
4\. Copy the contents from the app directory in the host to the image app directory.
5\. Expose Port 5000.
6\. Finally, it will run the command to start the Flask server.
In the next step, we will create the Docker image, using the command given below:

```
docker build -f Dockerfile -t flask-kubernetes:latest .
```

After creating the Docker image, we can test it by running it locally using the following command:

```
docker run -p 5001:5000 flask-kubernetes
```

Once we are done testing it locally by running a container, we need to deploy this in Kubernetes.
We will first verify that Kubernetes is running using the _kubectl_ command. If there are no errors, then it is working. If there are errors, do refer to _<https://kubernetes.io/docs/setup/learning-environment/minikube/>_.

Next, let’s create a deployment file. This is a yaml file containing the instruction for Kubernetes about how to create pods and services in a very declarative fashion. Since we have a Flask Web application, we will create a _deployment.yaml_ file with both the pods and services declarations inside it.

Create a file named deployment.yaml and add the following contents to it, before saving it:

```
apiVersion: v1
kind: Service
metadata:
name: flask-kubernetes -service
spec:
selector:
app: flask-kubernetes
ports:
- protocol: "TCP"
port: 6000
targetPort: 5000
type: LoadBalancer


---
apiVersion: apps/v1
kind: Deployment
metadata:
name: flask-kubernetes
spec:
replicas: 4
template:
metadata:
labels:
app: flask-kubernetes
spec:
containers:
- name: flask-kubernetes
image: flask-kubernetes:latest
imagePullPolicy: Never
ports:
- containerPort: 5000
```

Use _kubectl_ to send the _yaml_ file to Kubernetes by running the following command:

```
kubectl apply -f deployment.yaml
```

You can see the pods are running if you execute the following command:

```
kubectl get pods
```

Now navigate to _<http://localhost:6000>_, and you should see the ‘Hello from Kubernetes!’ message.
That’s it! The application is now running in Kubernetes!

**What Kubernetes cannot do**
Kubernetes is not a traditional, all-inclusive PaaS (Platform as a Service) system. Since Kubernetes operates at the container level rather than at the hardware level, it provides some generally applicable features common to PaaS offerings, such as deployment, scaling, load balancing, logging, and monitoring. Kubernetes provides the building blocks for developer platforms, but preserves user choice and flexibility where it is important.

  * Kubernetes does not limit the types of applications supported. If an application can run in a container, it should run great on Kubernetes.
  * It does not deploy and build source code.
  * It does not dictate logging, monitoring, or alerting solutions.
  * It does not provide or mandate a configuration language/system. It provides a declarative API for everyone’s use.
  * It does not provide or adopt any comprehensive machine configuration, maintenance, management, or self-healing systems.



![Avatar][3]

[Abhinav Nath Gupta][4]

The author is a software development engineer at Cleo Software India Pvt Ltd, Bengaluru. He is interested in cryptography, data security, cryptocurrency and cloud computing. He can be reached at [abhi.aec89@gmail.com][5].

[![][6]][7]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/demystifying-kubernetes/

作者：[Abhinav Nath Gupta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/abhinav-gupta/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Gear-kubernetes.jpg?resize=696%2C457&ssl=1 (Gear kubernetes)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Gear-kubernetes.jpg?fit=800%2C525&ssl=1
[3]: https://secure.gravatar.com/avatar/f65917facf5f28936663731fedf545c4?s=100&r=g
[4]: https://opensourceforu.com/author/abhinav-gupta/
[5]: mailto:abhi.aec89@gmail.com
[6]: http://opensourceforu.com/wp-content/uploads/2013/10/assoc.png
[7]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
