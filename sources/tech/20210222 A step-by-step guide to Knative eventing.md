[#]: subject: "A step-by-step guide to Knative eventing"
[#]: via: "https://opensource.com/article/21/2/knative-eventing"
[#]: author: "Jessica Cherry https://opensource.com/users/cherrybomb"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A step-by-step guide to Knative eventing
======
Knative eventing is a way to create, send, and verify events in your cloud-native environment.

![Computer laptop in space][1]

Image by: Opensource.com

In a previous article, I covered [how to create a small app with Knative][2], which is an open source project that adds components to [Kubernetes][3] for deploying, running, and managing [serverless, cloud-native][4] applications. In this article, I'll explain Knative eventing, a way to create, send, and verify events in your cloud-native environment.

Events can be generated from many sources in your environment, and they can be confusing to manage or define. Since Knative follows the [CloudEvents][5] specification, it allows you to have one common abstraction point for your environment, where the events are defined to one specification.

This article explains how to install Knative eventing version 0.20.0 and create, trigger, and verify events. Because there are many steps involved, I suggest you look at my [GitHub repo][6] to walk through this article with the files.

### Set up your configuration

This walkthrough uses [Minikube][7] with Kubernetes 1.19.0. It also makes some configuration changes to the Minikube environment.

**Minikube pre-configuration commands:**

```
$ minikube config set kubernetes-version v1.19.0
$ minikube config set memory 4000
$ minikube config set cpus 4
```

Before starting Minikube, run the following commands to make sure your configuration stays and start Minikube:

```
$ minikube delete
$ minikube start
```

### Install Knative eventing

Install the Knative eventing custom resource definitions (CRDs) using kubectl. The following shows the command and a snippet of the output:

```
$ kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.20.0/eventing-crds.yaml

customresourcedefinition.apiextensions.k8s.io/apiserversources.sources.knative.dev created
customresourcedefinition.apiextensions.k8s.io/brokers.eventing.knative.dev created
customresourcedefinition.apiextensions.k8s.io/channels.messaging.knative.dev created
customresourcedefinition.apiextensions.k8s.io/triggers.eventing.knative.dev created
```

Next, install the core components using kubectl:

```
$ kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.20.0/eventing-core.yaml
namespace/knative-eventing created
serviceaccount/eventing-controller created
clusterrolebinding.rbac.authorization.k8s.io/eventing-controller created
```

Since you're running a standalone version of the Knative eventing service, you must install the in-memory channel to pass events. Using kubectl, run:

```
$ kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.20.0/in-memory-channel.yaml
```

Install the broker, which utilizes the channels and runs the event routing:

```
$ kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.20.0/mt-channel-broker.yaml
clusterrole.rbac.authorization.k8s.io/knative-eventing-mt-channel-broker-controller created
clusterrole.rbac.authorization.k8s.io/knative-eventing-mt-broker-filter created
```

Next, create a namespace and add a small broker to it; this broker routes events to triggers. Create your namespace using kubectl:

```
$ kubectl create namespace eventing-test
namespace/eventing-test created
```

Now create a small broker named `default` in your namespace. The following is the YAML from my **broker.yaml** file (which can be found in my GitHub repository):

```
apiVersion: eventing.knative.dev/v1
kind: broker
metadata:
  name: default
  namespace: eventing-test
```

Then apply your broker file using kubectl:

```
$ kubectl create -f broker.yaml
   broker.eventing.knative.dev/default created
```

Verify that everything is up and running (you should see the confirmation output) after you run the command:

```
$ kubectl -n eventing-test get broker default                                                              
NAME      URL                                                                              AGE    READY   REASON
default   http://broker-ingress.knative-eventing.svc.cluster.local/eventing-test/default   3m6s   True
```

You'll need this URL from the broker output later for sending events, so save it.

### Create event consumers

Now that everything is installed, you can start configuring the components to work with events.

First, you need to create event consumers. You'll create two consumers in this walkthrough: **hello-display** and **goodbye-display**. Having two consumers allows you to see how to target a consumer per event message.

**The hello-display YAML code:**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-display
spec:
  replicas: 1
  selector:
    matchLabels: &labels
      app: hello-display
  template:
    metadata:
      labels: *labels
    spec:
      containers:
        - name: event-display
          image: gcr.io/knative-releases/knative.dev/eventing-contrib/cmd/event_display

---

kind: Service
apiVersion: v1
metadata:
  name: hello-display
spec:
  selector:
    app: hello-display
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

**The goodbye-display YAML code:**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: goodbye-display
spec:
  replicas: 1
  selector:
    matchLabels: &labels
      app: goodbye-display
  template:
    metadata:
      labels: *labels
    spec:
      containers:
        - name: event-display
          # Source code: https://github.com/knative/eventing-contrib/tree/master/cmd/event_display
          image: gcr.io/knative-releases/knative.dev/eventing-contrib/cmd/event_display

---

kind: Service
apiVersion: v1
metadata:
  name: goodbye-display
spec:
  selector:
    app: goodbye-display
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

The differences in the YAML between the two consumers are in the `app` and `metadata name` sections. While both consumers are on the same ports, you can target one when generating an event. Create the consumers using kubectl:

```
$ kubectl -n eventing-test apply -f hello-display.yaml
deployment.apps/hello-display created
service/hello-display created

$ kubectl -n eventing-test apply -f goodbye-display.yaml
deployment.apps/goodbye-display created
service/goodbye-display created
```

Check to make sure the deployments are running after you've applied the YAML files:

```
$ kubectl -n eventing-test get deployments hello-display goodbye-display
NAME              READY   UP-TO-DATE   AVAILABLE   AGE
hello-display     1/1     1            1           2m4s
goodbye-display   1/1     1            1           34s
```

### Create triggers

Now, you need to create the triggers, which define the events the consumer receives. You can define triggers to use any filter from your cloud events. The broker receives events from the trigger and sends the events to the correct consumer. This set of examples creates two triggers with different definitions. For example, you can send events with the attribute type `greeting` to the `hello-display` consumer.

**The greeting-trigger.yaml code:**

```
apiVersion: eventing.knative.dev/v1
kind: Trigger
metadata:
  name: hello-display
spec:
  broker: default
  filter:
    attributes:
      type: greeting
  subscriber:
    ref:
     apiVersion: v1
     kind: Service
     name: hello-display
```

To create the first trigger, apply your YAML file:

```
$ kubectl -n eventing-test apply -f greeting-trigger.yaml
trigger.eventing.knative.dev/hello-display created
```

Next, make the second trigger using **sendoff-trigger.yaml**. This sends anything with the attribute `source sendoff` to your `goodbye-display` consumer.

**The sendoff-trigger.yaml code:**

```
apiVersion: eventing.knative.dev/v1
kind: Trigger
metadata:
  name: goodbye-display
spec:
  broker: default
  filter:
    attributes:
      source: sendoff
  subscriber:
    ref:
      apiVersion: v1
      kind: Service
      name: goodbye-display
```

Next, apply your second trigger definition to the cluster:

```
$ kubectl -n eventing-test apply -f sendoff-trigger.yaml
trigger.eventing.knative.dev/goodbye-display created
```

Confirm everything is correctly in place by getting your triggers from the cluster using kubectl:

```
$ kubectl -n eventing-test get triggers
NAME              BROKER    SUBSCRIBER_URI                                            AGE   READY   
goodbye-display   default   http://goodbye-display.eventing-test.svc.cluster.local/   24s   True    
hello-display     default   http://hello-display.eventing-test.svc.cluster.local/     46s   True
```

### Create an event producer

Create a pod you can use to send events. This is a simple pod deployment with curl and SSH access for you to [send events using curl][8]. Because the broker can be accessed only from inside the cluster where Knative eventing is installed, the pod needs to be in the cluster; this is the only way to send events into the cluster. Use the **event-producer.yaml** file with this code:

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: curl
  name: curl
spec:
  containers:
    - image: radial/busyboxplus:curl
      imagePullPolicy: IfNotPresent
      name: curl
      resources: {}
      stdin: true
      terminationMessagePath: /dev/termination-log
      terminationMessagePolicy: File
      tty: true
```

Next, deploy the pod by using kubectl:

```
$ kubectl -n eventing-test apply -f event-producer.yaml
pod/curl created
```

To verify, get the deployment and make sure the pod is up and running:

```
$ kubectl get pods -n eventing-test
NAME                               READY   STATUS    RESTARTS   AGE
curl                               1/1     Running   0          8m13s
```

### Send some events

Since this article has been so configuration-heavy, I imagine you'll be happy to finally be able to send some events and test out your services. Events have to be passed internally in the cluster. Usually, events would be defined around applications internal to the cluster and come from those applications. But this example will manually send events from your pod named **curl**.

Begin by logging into the pod:

```
$ kubectl -n eventing-test attach curl -it
```

Once logged in, you'll see output similar to:

```
Defaulting container name to curl.
Use 'kubectl describe pod/curl -n eventing-test' to see all of the containers in this pod.
If you don't see a command prompt, try pressing enter.
[ root@curl:/ ]$
```

Now, generate an event using curl. This needs some extra definitions and requires the broker URL generated during the installation. This example sends a greeting to the broker:

```
curl -v "http://broker-ingress.knative-eventing.svc.cluster.local/eventing-test/default" \
  -X POST \
  -H "Ce-Id: say-hello" \
  -H "Ce-Specversion: 1.0" \
  -H "Ce-Type: greeting" \
  -H "Ce-Source: not-sendoff" \
  -H "Content-Type: application/json" \
  -d '{"msg":"Hello Knative!"}'
```

`Ce` is short for CloudEvent, which is the [standardized CloudEvents specification][9] that Knative follows. You also need to know the event ID (this is useful to verify it was delivered), the type, the source (which must specify that it is not a `sendoff` so that it doesn't go to the source defined in the sendoff trigger), and a message.

When you run the command, this should be the output (and you should receive a [202 Accepted][10] response):

```
> POST /eventing-test/default HTTP/1.1
> User-Agent: curl/7.35.0
> Host: broker-ingress.knative-eventing.svc.cluster.local
> Accept: */*
> Ce-Id: say-hello
> Ce-Specversion: 1.0
> Ce-Type: greeting
> Ce-Source: not-sendoff
> Content-Type: application/json
> Content-Length: 24
>
< HTTP/1.1 202 Accepted
< Date: Sun, 24 Jan 2021 22:25:25 GMT
< Content-Length: 0
```

The 202 means the trigger sent it to the **hello-display** consumer (because of the definition.)

Next, send a second definition to the **goodbye-display** consumer with this new curl command:

```
curl -v "http://broker-ingress.knative-eventing.svc.cluster.local/eventing-test/default" \
  -X POST \
  -H "Ce-Id: say-goodbye" \
  -H "Ce-Specversion: 1.0" \
  -H "Ce-Type: not-greeting" \
  -H "Ce-Source: sendoff" \
  -H "Content-Type: application/json" \
  -d '{"msg":"Goodbye Knative!"}'
```

This time, it is a `sendoff` and not a greeting based on the previous setup section's trigger definition. It is directed to the **goodbye-display** consumer.

Your output should look like this, with another 202 returned:

```
> POST /eventing-test/default HTTP/1.1
> User-Agent: curl/7.35.0
> Host: broker-ingress.knative-eventing.svc.cluster.local
> Accept: */*
> Ce-Id: say-goodbye
> Ce-Specversion: 1.0
> Ce-Type: not-greeting
> Ce-Source: sendoff
> Content-Type: application/json
> Content-Length: 26
>
< HTTP/1.1 202 Accepted
< Date: Sun, 24 Jan 2021 22:33:00 GMT
< Content-Length: 0
```

Congratulations, you sent two events!

Before moving on to the next section, exit the pod by typing **exit**.

### Verify the events

Now that the events have been sent, how do you know that the correct consumers received them? By going to each consumer and verifying it in the logs.

Start with the **hello-display** consumer::

```
$ kubectl -n eventing-test logs -l app=hello-display --tail=100
```

There isn't much running in this example cluster, so you should see only one event:

```
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: greeting
  source: not-sendoff
  id: say-hello
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T22:25:25.760867793Z
Data,
  {
    "msg": "Hello Knative!"
  }
```

You've confirmed the **hello-display** consumer received the event! Now check the **goodbye-display** consumer and make sure the other message made it.

Start by running the same command but with **goodbye-display**:

```
$ kubectl -n eventing-test logs -l app=goodbye-display --tail=100
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: not-greeting
  source: sendoff
  id: say-goodbye
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T22:33:00.515716701Z
Data,
  {
    "msg": "Goodbye Knative!"
  }
```

It looks like both events made it to their proper locations. Congratulations—you have officially worked with Knative eventing!

### Bonus round: Send an event to multiple consumers

So you sent events to each consumer using curl, but what if you want to send an event to both consumers? This uses a similar curl command but with some interesting changes. In the previous triggers, each one was defined with a different attribute. The greeting trigger had attribute `type`, and sendoff trigger had attribute `source`. This means you can make a curl call and send it to both consumers.

Here is a curl example of a definition for sending an event to both consumers:

```
curl -v "http://broker-ingress.knative-eventing.svc.cluster.local/eventing-test/default" \
  -X POST \
  -H "Ce-Id: say-hello-goodbye" \
  -H "Ce-Specversion: 1.0" \
  -H "Ce-Type: greeting" \
  -H "Ce-Source: sendoff" \
  -H "Content-Type: application/json" \
  -d '{"msg":"Hello Knative! Goodbye Knative!"}'
```

As you can see, the definition of this curl command changed to set the `source` for **goodbye-display** and the `type` for **hello-display**.

Here is sample output of what the events look like after they are sent.

**Output of the event being sent:**

```
> POST /eventing-test/default HTTP/1.1
> User-Agent: curl/7.35.0
> Host: broker-ingress.knative-eventing.svc.cluster.local
> Accept: */*
> Ce-Id: say-hello-goodbye
> Ce-Specversion: 1.0
> Ce-Type: greeting
> Ce-Source: sendoff
> Content-Type: application/json
> Content-Length: 41
>
< HTTP/1.1 202 Accepted
< Date: Sun, 24 Jan 2021 23:04:15 GMT
< Content-Length: 0
```

**Output of hello-display (showing two events):**

```
$ kubectl -n eventing-test logs -l app=hello-display --tail=100
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: greeting
  source: not-sendoff
  id: say-hello
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T22:25:25.760867793Z
Data,
  {
    "msg": "Hello Knative!"
  }
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: greeting
  source: sendoff
  id: say-hello-goodbye
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T23:04:15.036352685Z
Data,
  {
    "msg": "Hello Knative! Goodbye Knative!"
  }
```

**Output of goodbye-display (also with two events):**

```
$ kubectl -n eventing-test logs -l app=goodbye-display --tail=100
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: not-greeting
  source: sendoff
  id: say-goodbye
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T22:33:00.515716701Z
Data,
  {
    "msg": "Goodbye Knative!"
  }
☁️  cloudevents.Event
Validation: valid
Context Attributes,
  specversion: 1.0
  type: greeting
  source: sendoff
  id: say-hello-goodbye
  datacontenttype: application/json
Extensions,
  knativearrivaltime: 2021-01-24T23:04:15.036352685Z
Data,
  {
    "msg": "Hello Knative! Goodbye Knative!"
  }
```

As you can see, the event went to both consumers based on your curl definition. If an event needs to be sent to more than one place, you can write definitions to send it to more than one consumer.

### Give it a try!

Internal eventing in cloud events is pretty easy to track if it's going to a predefined location of your choice. Enjoy seeing how far you can go with eventing in your cluster!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/knative-eventing

作者：[Jessica Cherry][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_space_graphic_cosmic.png
[2]: https://opensource.com/article/20/11/knative
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://en.wikipedia.org/wiki/Cloud_native_computing
[5]: https://cloudevents.io/
[6]: https://github.com/Alynder/knative_eventing
[7]: https://minikube.sigs.k8s.io/docs/
[8]: https://www.redhat.com/sysadmin/use-curl-api
[9]: https://github.com/cloudevents/spec
[10]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/202
