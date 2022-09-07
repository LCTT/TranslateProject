[#]: subject: "How to Run a Kubernetes Cluster Locally with Kind"
[#]: via: "https://www.opensourceforu.com/2022/09/how-to-run-a-kubernetes-cluster-locally-with-kind/"
[#]: author: "Sibi Prabakaran https://www.opensourceforu.com/author/sibi-prabakaran/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Run a Kubernetes Cluster Locally with Kind
======
*Kind is a tool used for running Kubernetes (k8s) locally using Docker container ‘nodes’. Its primary purpose is to test k8s, but it can also be used in your CI system or for local development.*

Kind serves various purposes in the Kubernetes ecosystem depending upon your use case. It can be used to learn Kubernetes, to make sure that your Kubernetes application manifests are correct, or to test your deployments locally. In this article, we will see how to use Kind to create a Kubernetes cluster locally and run a Web application using it.

Let’s invoke the Kind executable to see what are the available options:

```
> kind
kind creates and manages local Kubernetes clusters using Docker container ‘nodes’

Usage:
  kind [command]

Available Commands:
  build       Build one of [node-image]
  completion  Output shell completion code for the specified shell (bash, zsh or fish)
  create      Creates one of [cluster]
  delete      Deletes one of [cluster]
  export      Exports one of [kubeconfig, logs]
  get         Gets one of [clusters, nodes, kubeconfig]
  help        Help about any command
  load        Loads images into nodes
  version     Prints the kind CLI version

Flags:
  -h, --help              help for kind
      --loglevel string   DEPRECATED: see -v instead
  -q, --quiet             silence all stderr output
  -v, --verbosity int32   info log verbosity
      --version           version for kind

Use “kind [command] --help” for more information about a command.
```

### Cluster creation and interaction

Now let’s create a Kubernetes cluster locally and interact with it:

```
> kind create cluster
Creating cluster “kind” ...
 > Ensuring node image (kindest/node:v1.21.1) >
 > Preparing nodes >
 > Writing configuration >
 > Starting control-plane >
 > Installing CNI >
 > Installing StorageClass >
Set kubectl context to “kind-kind”
```

You can now use your cluster with:

```
kubectl cluster-info --context kind-kind
```

Not sure what to do next? Check out *https://kind.sigs.k8s.io/docs/user/quick-start/*

The above command will bootstrap a k8s cluster using a pre-built node image. In fact, once the above command completes, you can use Docker to verify that a new image has indeed been downloaded:

```
> docker images | rg kind
kindest/node                                      <none>                                         32b8b755dee8   8 months ago    1.12GB
```

The default cluster name is *kind*. And you can confirm it using the following command:

```
> kind get clusters
kind
```

You can also get it’s *kubeconfig* via the following command:

```
> kind get kubeconfig | head
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FUR S0tLS0tCk1JSUM1ekNDQWMrZ0F3 SUJBZ0lCQURBTkJna3Foa2l HOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcm RXSmwKY201bGRHVnpNQjRYRF RJeU1ESXdOREUxTlRNeU1sb1hEVE15TURJd01qRTFOV<Snipped>
OG9QRDNoYnRraFJ4MQotLS0tL UVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://127.0.0.1:38471
  name: kind-kind
contexts:
- context:
    cluster: kind-kind
    user: kind-kind
```

You can use the*–wait* flag if you want to wait till the control plane is in a reachable state. Since Kind is mostly used for testing, you cannot actually update it. Let’s say we want to have a declarative setup with this configuration for our Kind cluster:

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: “ingress-ready=true”
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
```

The above configuration creates a Kind cluster with extraPortMappings and node-labels. The port mappings are required to allow localhost to make requests to the Ingress controller. Let’s try to apply the above manifest (but note that it’s going to fail):

```
> kind create cluster --config ./cluster.yaml
ERROR: failed to create cluster: node(s) already exist for a cluster with the name “kind”
```

So we have to delete and create a new one. Let’s delete it first:

```
❯ kind delete cluster
Deleting cluster “kind” ...
```

Let’s create the cluster using our declarative setup now:

```
> kind create cluster --config ./cluster.yaml
Creating cluster “kind” ...
 > Ensuring node image (kindest/node:v1.21.1) >
 > Preparing nodes >
 > Writing configuration >
 > Starting control-plane >
 > Installing CNI >
 > Installing StorageClass >
Set kubectl context to “kind-kind”
```

You can now use your cluster with:

```
kubectl cluster-info --context kind-kind
```

You can also specify your k8s version in the above manifest by specifying the proper Docker image, which you can find in its GitHub release page:

```
- role: control-plane
  image: kindest/node:v1.21.1@sha256:69860bda5563ac81e3c0057d654b5253219618a22ec3a346306239bba8cfa1a6
```

### Cluster interaction

We need to interact with the cluster to get the actual job done. This could be deploying your application or doing maintenance operations on your node. You can use the usual kubectl to interact with your cluster:

```
> kubectl get nodes
NAME             STATUS   ROLES          AGE   	VERSION
kind-control-plane  Ready   control-plane,master 95s  v1.21.1
```

Now let’s check the various name spaces present:

```
> kubectl get namespaces -A
NAME                 STATUS   AGE
default              Active   3m1s
kube-node-lease      Active   3m2s
kube-public          Active   3m2s
kube-system          Active   3m2s
local-path-storage   Active   2m58s
```

And let’s check the various logs that are running:

```
> kubectl get pods -A
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-558bd4d5db-7pzbj                     1/1     Running   0          3m25s
kube-system          coredns-558bd4d5db-vgf9l                     1/1     Running   0          3m25s
kube-system          etcd-kind-control-plane                      1/1     Running   0          3m28s
kube-system          kindnet-jq54g                                1/1     Running   0          3m25s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          3m28s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          3m28s
kube-system          kube-proxy-bkxql                             1/1     Running   0          3m25s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          3m28s
local-path-storage   local-path-provisioner-547f784dff-2vkf4      1/1     Running   0          3m25s
```

*Loading a Docker image:* To load a Docker image, give the following command:

```
kind load docker-image image_1 image_2
```

Note that once you load the image, you still have to create the Deployment k8s resource, which will typically reference the loaded image and then do kubectl apply of the resource.

*NGINX Ingress controller:* Now let’s deploy Ingress NGINX to our cluster:

```
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```

Next, let’s inspect our NGINX pods:

```
> kubectl get pods -n ingress-nginx
NAME               READY   STATUS              RESTARTS   AGE
ingress-nginx-admission-create-hrmn5        0/1     Completed           0          47s
ingress-nginx-admission-patch-7ds99         0/1     Completed           1          47s
ingress-nginx-controller-674cb6ff57-tmjbc   0/1     ContainerCreating   0          47s
```

Let’s check the service of the NGINX controller:

```
❯ kubectl get services -n ingress-nginx
NAME                                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
ingress-nginx-controller             NodePort    10.96.65.28    <none>        80:32544/TCP,443:30304/TCP   116s
ingress-nginx-controller-admission   ClusterIP   10.96.207.79   <none>        443/TCP                      116s
```

You can see the NGINX controller is listening on both port 80 and 443. Now let’s check what our Ingress class is:

```
❯ kubectl get ingressclass -A
NAME    CONTROLLER             PARAMETERS   AGE
nginx   k8s.io/ingress-nginx   <none>       8m26s
```

### Deploying an application

Let’s deploy the *https://httpbin.org/ application inside our Kind cluster*. I have the manifest for the application in the app_k8s repository: *https://github.com/psibi/app_k8s*.

Rendering the resource for the application will result in this:

```
❯ kustomize build overlays/app_nginx
apiVersion: v1
kind: Namespace
metadata:
  name: base-app
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: httpbin
  name: httpbin
  namespace: base-app
spec:
  ports:
  - name: http
    port: 8000
    targetPort: 80
  selector:
    app: httpbin
  type: ClusterIP
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpbin
  namespace: base-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpbin
      version: v1
  template:
    metadata:
      labels:
        app: httpbin
        version: v1
    spec:
      containers:
      - image: docker.io/kennethreitz/httpbin
        imagePullPolicy: IfNotPresent
        name: httpbin
        ports:
        - containerPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-httpbin
  namespace: base-app
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - backend:
          service:
            name: httpbin
            port:
              number: 8000
        path: /
        pathType: Prefix

Once done, apply the above application:

❯ kubectl apply -f application.yaml
namespace/base-app created
service/httpbin created
deployment.apps/httpbin created
ingress.networking.k8s.io/ingress-httpbin created
```

Once done, apply the above application:

```
❯ kubectl apply -f application.yaml
namespace/base-app created
service/httpbin created
deployment.apps/httpbin created
ingress.networking.k8s.io/ingress-httpbin created
```

Now let’s check the Ingress:

```
❯ kubectl get ingress -n base-app
NAME              CLASS   HOSTS   ADDRESS     PORTS   AGE
ingress-httpbin   nginx   *       localhost   80      3m17s
```

Let’s check that the application is indeed working:

```
❯ curl -s http://localhost | head
<!DOCTYPE html>
<html lang=”en”>

<head>
    <meta charset=”UTF-8”>
    <title>httpbin.org</title>
    <link href=”https://fonts.googleapis.com/css?family=Open+Sans:400,700|Source+Code+Pro:300,600|Titillium+Web:400,600,700”
        rel=”stylesheet”>
    <link rel=”stylesheet” type=”text/css” href=”/flasgger_static/swagger-ui.css”>
    <link rel=”icon” type=”image/png” href=”/static/favicon.ico” sizes=”64x64 32x32 16x16” />
```

This summarises how to use Kind to create a Kubernetes cluster, deploy a NGINX controller, and then use that to deploy a Web application on it.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/how-to-run-a-kubernetes-cluster-locally-with-kind/

作者：[Sibi Prabakaran][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/sibi-prabakaran/
[b]: https://github.com/lkxed
