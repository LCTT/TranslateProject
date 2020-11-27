[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create your first Knative app)
[#]: via: (https://opensource.com/article/20/11/knative)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

Create your first Knative app
======
Knative is a great way to get started quickly on serverless development
with Kubernetes.
![Working from home at a laptop][1]

[Knative][2] is an open source community project that adds components to [Kubernetes][3] for deploying, running, and managing [serverless, cloud-native][4] applications. It enables more productive development with less interaction with Kubernetes' infrastructure.

There is a large amount of information out there about Knative, networking, and serverless deployments, and this introductory tutorial covers just a bite-size amount of it. In this walkthrough, I'll use Knative with [Minikube][5] to create a Knative app—a simple container that prints messages in response to a `curl` command or in a web browser at a link provided by the deployment.

### First, some background

Knative uses custom resource definitions (CRDs), a network layer, and a service core. For this walkthrough, I used Ubuntu 18.04, Kubernetes 1.19.0, Knative 0.17.2, and [Kourier][6] 0.17.0 as the Knative networking layer, as well as the Knative command-line interface (CLI).

A CRD is a custom resource definition within Kubernetes. A resource is an endpoint in the Kubernetes API that stores a collection of API objects of a certain kind; for example, the built-in pod's resource contains a collection of pod objects. This allows an expansion of the Kubernetes API with new definitions. One example is the Knative serving core, which is defined to have internal autoscaling and rapid deployment of pods with the correct roles and access predefined.

Kourier is an [Ingress][7] (a service to let in external network traffic) for Knative serving and a lightweight alternative for the [Istio][8] ingress. Its deployment consists only of an [Envoy proxy][9] and a control plane for it.

To understand the concepts in this tutorial, I recommend you are somewhat familiar with:

  * Serverless, cloud-native applications
  * Ingress with Envoy proxies, i.e., Istio
  * DNS in Kubernetes
  * Kubernetes patching configurations
  * Custom resource definitions in Kubernetes
  * Configuring YAML files for Kubernetes



### Set up and installation

There are some prerequisites you must do before you can use Knative.

#### Configure Minikube

Before doing anything else, you must configure Minikube to run Knative locally in your homelab. Below are the configurations I suggest and the commands to set them:


```
$ minikube config set kubernetes-version v1.19.0
$ minikube config set memory 4000
$ minikube config set cpus 4
```

To make sure those configurations are set up correctly in your environment, run the Minikube commands to delete and start your cluster:


```
$ minikube delete
$ minikube start
```

#### Install the Knative CLI

You need the Knative CLI to make a deployment, and you need [Go v1.14][10] or later to work with the CLI. I created a separate directory to make it easier to find and install these tools. Use the following commands to set up the command line:


```
$ mkdir knative
$ cd knative/
$ git clone <https://github.com/knative/client.git>
$ cd client/
$ hack/build.sh -f
$ sudo cp kn /usr/local/bin
$ kn version
Version:        v20201018-local-40a84036
Build Date:   2020-10-18 20:00:37
Git Revision: 40a84036
Supported APIs:
* Serving
  - serving.knative.dev/v1 (knative-serving v0.18.0)
* Eventing
  - sources.knative.dev/v1alpha2 (knative-eventing v0.18.0)
  - eventing.knative.dev/v1beta1 (knative-eventing v0.18.0)
```

Once the CLI is installed, you can configure Knative in the Minikube cluster.

#### Install Knative

Since Knative is composed of CRDs, much of its installation uses YAML files with `kubectl` commands. To make this easier, set up some environment variables in the terminal so that you can get the needed YAML files a little faster and in the same version:


```
`$ export KNATIVE="0.17.2"`
```

First, apply the service resource definitions:


```
`$ kubectl apply -f https://github.com/knative/serving/releases/download/v$KNATIVE/serving-crds.yaml`
```

Then apply the core components to Knative:


```
`$ kubectl apply -f https://github.com/knative/serving/releases/download/v$KNATIVE/serving-core.yaml`
```

This deploys the services and deployments to the namespace `knative-serving`. You may have to wait a couple of moments for the deployment to finish.

To confirm the deployment finished, run the `kubectl` command to get the deployments from the namespace:


```
$ kubectl get deployments -n knative-serving
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
3scale-kourier-control   1/1    1               1               107m
activator               1/1     1               1               108m
autoscaler              1/1     1               1               108m
controller              1/1     1               1               108m
webhook                 1/1     1               1               108m
```

#### Install Kourier

Because you want to use a specific version and collect the correct YAML file, use another environment variable:


```
`$ export KOURIER="0.17.0"`
```

Then apply your networking layer YAML file:


```
`$ kubectl apply -f https://github.com/knative/net-kourier/releases/download/v$KOURIER/kourier.yaml`
```

You will find the deployment in the `kourier-system` namespace. To confirm the deployment is correctly up and functioning, use the `kubectl` command to get the deployments:


```
$ kubectl get deployments -n kourier-system
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
3scale-kourier-gateway   1/1    1               1               110m
```

Next, configure the Knative serving to use Kourier as default. If you don't set this, the external networking traffic will not function. Set it with this `kubectl patch` command:


```
$ kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'
```

#### Configure the DNS

Before you can access the load balancer, you need to run the `minikube tunnel` command in a separate terminal window. This command creates a route to services deployed with type `LoadBalancer` and sets their Ingress to their `ClusterIP`. Without this command, you will never get an `External-IP` from the load balancer. Your output will look like this:


```
Status:    
    machine: minikube
    pid: 57123
    route: 10.96.0.0/12 -&gt; 192.168.39.67
    minikube: Running
    services: [kourier]
        errors:
         minikube: no errors
         router: no errors
         loadbalancer emulator: no errors
Status:    
    machine: minikube
    pid: 57123
    route: 10.96.0.0/12 -&gt; 192.168.39.67
    minikube: Running
    services: [kourier]
        errors:
         minikube: no errors
         router: no errors
         loadbalancer emulator: no errors
```

Now that the services and deployments are complete, configure the DNS for the cluster. This enables your future deployable application to support DNS web addresses. To configure this, you need to get some information from your Kourier service by using the `kubectl get` command:


```
$ kubectl get service kourier -n kourier-system
NAME    TYPE            CLUSTER-IP      EXTERNAL-IP     PORT(S)                        
kourier   LoadBalancer   10.103.12.15   10.103.12.15   80:32676/TCP,443:30558/TCP
```

Get the `CLUSTER-IP` address and save it for the next step. Next, configure the domain to determine your internal website on local DNS. (I ended mine in `nip.io`, and you can also use `xip.io`.) This requires another `kubectl patch` command:


```
`$ kubectl patch configmap -n knative-serving config-domain -p "{\"data\": {\"10.103.12.15.nip.io\": \"\"}}"`
```

Once it's patched, you will see this output:


```
`configmap/config-domain patched`
```

### Use the Knative CLI

Now that your configurations are done, you can create an example application to see what happens.

#### Deploy a service

Earlier in this walkthrough, you installed the Knative CLI, which is used for Serving and Eventing resources in a Kubernetes cluster. This means you can deploy a sample application and manage services and routes. To bring up the command-line menu, type `kn`. Here is a snippet of the output:


```
$ kn
kn is the command line interface for managing Knative Serving and Eventing resources

 Find more information about Knative at: <https://knative.dev>

Serving Commands:
  service       Manage Knative services
  revision      Manage service revisions
  route         List and describe service routes
```

Next, use the Knative CLI to deploy a basic "hello world" application with a web frontend. Knative provides some examples you can use; this one does a basic deployment:


```
`kn service create hello --image gcr.io/knative-samples/helloworld-go`
```

Your output should look something like this:


```
$ kn service create hello --image gcr.io/knative-samples/helloworld-go
Creating service 'hello' in namespace 'default':

  0.032s The Configuration is still working to reflect the latest desired specification.
  0.071s The Route is still working to reflect the latest desired specification.
  0.116s Configuration "hello" is waiting for a Revision to become ready.
 34.908s ...
 34.961s Ingress has not yet been reconciled.
 35.020s unsuccessfully observed a new generation
 35.208s Ready to serve.

Service 'hello' created to latest revision 'hello-dydlw-1' is available at URL:
<http://hello.default.10.103.12.15.nip.io>
```

This shows that the service was deployed with a URL into the namespace default. You can deploy to another namespace by running something like the following, then look at the output:


```
$ kn service create hello --image gcr.io/knative-samples/helloworld-go --namespace hello
Creating service 'hello' in namespace 'hello':

  0.015s The Configuration is still working to reflect the latest desired specification.
  0.041s The Route is still working to reflect the latest desired specification.
  0.070s Configuration "hello" is waiting for a Revision to become ready.
  5.911s ...
  5.958s Ingress has not yet been reconciled.
  6.043s unsuccessfully observed a new generation
  6.213s Ready to serve.

Service 'hello' created to latest revision 'hello-wpbwj-1' is available at URL:
<http://hello.hello.10.103.12.15.nip.io>
```

#### Test your new deployment

Check to see if the new service you deployed is up and running. There are two ways to check:

  1. Check your web address in a browser
  2. Run a `curl` command to see what returns



If you check the address in a web browser, you should see something like this:

![Checking Knative deployment][11]

(Jess Cherry, [CC BY-SA 4.0][12])

Good! It looks like your application's frontend is up!

Next, test the `curl` command to confirm everything works from the command line. Here is an example of a `curl` to my application and the output:


```
$ curl <http://hello.default.10.103.12.15.nip.io>
Hello World!
```

#### Interact with the Knative app

From here, you can use the Knative CLI to make some basic changes and test the functionality. Describe the service and check the output:


```
$ kn service describe hello
Name:           hello
Namespace:  default
Age:            12h
URL:            <http://hello.default.10.103.12.15.nip.io>

Revisions:  
  100%  @latest (hello-dydlw-1) [1] (12h)
        Image:  gcr.io/knative-samples/helloworld-go (pinned to 5ea96b)

Conditions:  
  OK TYPE                       AGE REASON
  ++ Ready                      12h
  ++ ConfigurationsReady        12h
  ++ RoutesReady                12h
```

It looks like everything is up and ready as you configured it. Some other things you can do with the Knative CLI (which won't show up now due to the minimal configuration in this example) are to describe and list the routes with the app:


```
$ kn route describe hello
Name:           hello
Namespace:  default
Age:            12h
URL:            <http://hello.default.10.103.12.15.nip.io>
Service:        hello

Traffic Targets:  
  100%  @latest (hello-dydlw-1)

Conditions:  
  OK TYPE                       AGE REASON
  ++ Ready                      12h
  ++ AllTrafficAssigned         12h
  ++ CertificateProvisioned     12h TLSNotEnabled
  ++ IngressReady               12h
jess@Athena:~/knative/client$ kn route list hello
NAME    URL                                     READY
hello   <http://hello.default.10.103.12.15.nip.io>   True
```

This can come in handy later when you need to troubleshoot issues with your deployments.

#### Clean up

Just as easily as you deployed your application, you can clean it up:


```
$ kn service delete hello
Service 'hello' successfully deleted in namespace 'default'.

jess@Athena:~/knative/client$ kn service delete hello --namespace hello
Service 'hello' successfully deleted in namespace 'hello'.
```

### Make your own app

This walkthrough used an existing Knative example, but you are probably wondering about making something that _you_ want. You are right, so I'll provide this example YAML then explain how you can apply it with kubectl and manage it with the Knative CLI.

**Example YAML**


```
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld
  namespace: default
spec:
 template:
  spec:
   containers:
     - image: gcr.io/knative-samples/helloworld-go
       ports:
             - containerPort: 8080
       env:
        - name: TARGET
          value: "This is my app"
```

Save this to `apps.yaml`, and then you can make changes to some things. For example, you can change your `metadata`, `name`, and `namespace`. You can also change the value of the target (which I set to `This is my app`) so that, rather than `Hello World`, you'll see a new message that says `Hello ${TARGET} !` when you deploy the file.

To deploy a file like this, you will have to use `kubectl apply -f apps.yaml`.

First, deploy your new service using the `apply` command:


```
$ kubectl apply -f apps.yaml
service.serving.knative.dev/helloworld created
```

Next, you can describe your new deployment, which is the name provided in the YAML file:


```
$ kn service describe helloworld
Name:           helloworld
Namespace:  default
Age:            50s
URL:            <http://helloworld.default.10.103.12.15.nip.io>

Revisions:  
  100%  @latest (helloworld-qfr9s) [1] (50s)
        Image:  gcr.io/knative-samples/helloworld-go (at 5ea96b)

Conditions:  
  OK TYPE                       AGE REASON
  ++ Ready                      43s
  ++ ConfigurationsReady        43s
  ++ RoutesReady                43s
```

Run a `curl` command to confirm it produces the new output you defined in your YAML file:


```
$ curl  <http://helloworld.default.10.103.12.15.nip.io>
Hello This is my app!
```

Double-check by going to the simple web frontend.

![Checking Knative deployment][13]

(Jess Cherry, [CC BY-SA 4.0][12])

This proves your application is running! Congratulations!

### Final thoughts

Knative is a great way for developers to move quickly on serverless development with networking services that allow users to see changes in apps immediately. It is fun to play with and lets you take a deeper dive into serverless and other exploratory uses of Kubernetes!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/knative

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://knative.dev/
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://en.wikipedia.org/wiki/Cloud_native_computing
[5]: https://minikube.sigs.k8s.io/docs/
[6]: https://github.com/knative-sandbox/net-kourier
[7]: https://kubernetes.io/docs/concepts/services-networking/ingress/
[8]: https://istio.io/
[9]: https://www.envoyproxy.io/
[10]: https://golang.org/doc/install
[11]: https://opensource.com/sites/default/files/uploads/knative_browser-check.png (Checking Knative deployment)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/knativebrowser2.png (Checking Knative deployment)
