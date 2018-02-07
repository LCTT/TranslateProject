Running a Python application on Kubernetes
============================================================

### This step-by-step tutorial takes you through the process of deploying a simple Python application on Kubernetes.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag)
Image by : opensource.com

Kubernetes is an open source platform that offers deployment, maintenance, and scaling features. It simplifies management of containerized Python applications while providing portability, extensibility, and self-healing capabilities.

Whether your Python applications are simple or more complex, Kubernetes lets you efficiently deploy and scale them, seamlessly rolling out new features while limiting resources to only those required.

In this article, I will describe the process of deploying a simple Python application to Kubernetes, including:

*   Creating Python container images

*   Publishing the container images to an image registry

*   Working with persistent volume

*   Deploying the Python application to Kubernetes

### Requirements

You will need Docker, kubectl, and this [source code][10].

Docker is an open platform to build and ship distributed applications. To install Docker, follow the [official documentation][11]. To verify that Docker runs your system:

```
$ docker info
Containers: 0
Images: 289
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Dirs: 289
Execution Driver: native-0.2
Kernel Version: 3.16.0-4-amd64
Operating System: Debian GNU/Linux 8 (jessie)
WARNING: No memory limit support
WARNING: No swap limit support
```

kubectl is a command-line interface for executing commands against a Kubernetes cluster. Run the shell script below to install kubectl:

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
```

Deploying to Kubernetes requires a containerized application. Let's review containerizing Python applications.

### Containerization at a glance

Containerization involves enclosing an application in a container with its own operating system. This full machine virtualization option has the advantage of being able to run an application on any machine without concerns about dependencies.

Roman Gaponov's [article][12] serves as a reference. Let's start by creating a container image for our Python code.

### Create a Python container image

To create these images, we will use Docker, which enables us to deploy applications inside isolated Linux software containers. Docker is able to automatically build images using instructions from a Docker file.

This is a Docker file for our Python application:

```
FROM python:3.6
MAINTAINER XenonStack

# Creating Application Source Code Directory
RUN mkdir -p /k8s_python_sample_code/src

# Setting Home Directory for containers
WORKDIR /k8s_python_sample_code/src

# Installing python dependencies
COPY requirements.txt /k8s_python_sample_code/src
RUN pip install --no-cache-dir -r requirements.txt

# Copying src code to Container
COPY . /k8s_python_sample_code/src/app

# Application Environment variables
ENV APP_ENV development

# Exposing Ports
EXPOSE 5035

# Setting Persistent data
VOLUME ["/app-data"]

# Running Python Application
CMD ["python", "app.py"]
```

This Docker file contains instructions to run our sample Python code. It uses the Python 3.5 development environment.

### Build a Python Docker image

We can now build the Docker image from these instructions using this command:

```
docker build -t k8s_python_sample_code .
```

This command creates a Docker image for our Python application.

### Publish the container images

We can publish our Python container image to different private/public cloud repositories, like Docker Hub, AWS ECR, Google Container Registry, etc. For this tutorial, we'll use Docker Hub.

Before publishing the image, we need to tag it to a version:

```
docker tag k8s_python_sample_code:latest k8s_python_sample_code:0.1
```

### Push the image to a cloud repository

Using a Docker registry other than Docker Hub to store images requires you to add that container registry to the local Docker daemon and Kubernetes Docker daemons. You can look up this information for the different cloud registries. We'll use Docker Hub in this example.

Execute this Docker command to push the image:

```
docker push k8s_python_sample_code
```

### Working with CephFS persistent storage

Kubernetes supports many persistent storage providers, including AWS EBS, CephFS, GlusterFS, Azure Disk, NFS, etc. I will cover Kubernetes persistence storage with CephFS.

To use CephFS for persistent data to Kubernetes containers, we will create two files:

persistent-volume.yml

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: app-disk1
  namespace: k8s_python_sample_code
spec:
  capacity:
  storage: 50Gi
  accessModes:
  - ReadWriteMany
  cephfs:
  monitors:
    - "172.17.0.1:6789"
  user: admin
  secretRef:
    name: ceph-secret
  readOnly: false
```

persistent_volume_claim.yaml

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: appclaim1
  namespace: k8s_python_sample_code
spec:
  accessModes:
  - ReadWriteMany
  resources:
  requests:
    storage: 10Gi
```

We can now use kubectl to add the persistent volume and claim to the Kubernetes cluster:

```
$ kubectl create -f persistent-volume.yml
$ kubectl create -f persistent-volume-claim.yml
```

We are now ready to deploy to Kubernetes.

### Deploy the application to Kubernetes

To manage the last mile of deploying the application to Kubernetes, we will create two important files: a service file and a deployment file.

Create a file and name it `k8s_python_sample_code.service.yml` with the following content:

```
apiVersion: v1
kind: Service
metadata:
  labels:
  k8s-app: k8s_python_sample_code
  name: k8s_python_sample_code
  namespace: k8s_python_sample_code
spec:
  type: NodePort
  ports:
  - port: 5035
  selector:
  k8s-app: k8s_python_sample_code
```

Create a file and name it `k8s_python_sample_code.deployment.yml` with the following content:

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: k8s_python_sample_code
  namespace: k8s_python_sample_code
spec:
  replicas: 1
  template:
  metadata:
    labels:
    k8s-app: k8s_python_sample_code
  spec:
    containers:
    - name: k8s_python_sample_code
      image: k8s_python_sample_code:0.1
      imagePullPolicy: "IfNotPresent"
      ports:
      - containerPort: 5035
      volumeMounts:
        - mountPath: /app-data
          name: k8s_python_sample_code
     volumes: 
         - name: <name of application>
           persistentVolumeClaim:
             claimName: appclaim1
```

Finally, use kubectl to deploy the application to Kubernetes:

```
$ kubectl create -f k8s_python_sample_code.deployment.yml $ kubectl create -f k8s_python_sample_code.service.yml
```

Your application was successfully deployed to Kubernetes.

You can verify whether your application is running by inspecting the running services:

```
kubectl get services
```

May Kubernetes free you from future deployment hassles!

 _Want to learn more about Python? Nanjekye's book, [Python 2 and 3 Compatibility][7]offers clean ways to write code that will run on both Python 2 and 3, including detailed examples of how to convert existing Python 2-compatible code to code that will run reliably on both Python 2 and 3._ 


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/joannah-nanjekye.jpg?itok=F4RqEjoA)][13] Joannah Nanjekye - Straight Outta 256 , I choose Results over Reasons, Passionate Aviator, Show me the code.[More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/running-python-application-kubernetes

作者：[Joannah Nanjekye ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nanjekyejoannah
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://opensource.com/article/18/1/running-python-application-kubernetes?rate=D9iKksKbd9q9vOVb92Mg-v0Iyqn0QVO5fbIERTbSHz4
[7]:https://www.apress.com/gp/book/9781484229545
[8]:https://opensource.com/users/nanjekyejoannah
[9]:https://opensource.com/user/196386/feed
[10]:https://github.com/jnanjekye/k8s_python_sample_code/tree/master
[11]:https://docs.docker.com/engine/installation/
[12]:https://hackernoon.com/docker-tutorial-getting-started-with-python-redis-and-nginx-81a9d740d091
[13]:https://opensource.com/users/nanjekyejoannah
[14]:https://opensource.com/users/nanjekyejoannah
[15]:https://opensource.com/users/nanjekyejoannah
[16]:https://opensource.com/tags/python
[17]:https://opensource.com/tags/kubernetes