[#]: subject: (Test Kubernetes cluster failures and experiments in your terminal)
[#]: via: (https://opensource.com/article/21/6/kubernetes-litmus-chaos)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Test Kubernetes cluster failures and experiments in your terminal
======
Litmus is an effective tool to cause chaos to test how your system will
respond to failure.
![Science lab with beakers][1]

Do you know how your system will respond to an arbitrary failure? Will your application fail? Will anything survive after a loss? If you're not sure, it's time to see if your system passes the [Litmus][2] test, a detailed way to cause chaos at random with many experiments.

In the first article in this series, I explained [what chaos engineering is][3], and in the second article, I demonstrated how to get your [system's steady state][4] so that you can compare it against a chaos state. This third article will show you how to install and use Litmus to test arbitrary failures and experiments in your Kubernetes cluster. In this walkthrough, I'll use Pop!_OS 20.04, Helm 3, Minikube 1.14.2, and Kubernetes 1.19.

### Configure Minikube

If you haven't already, [install Minikube][5] in whatever way makes sense for your environment. If you have enough resources, I recommend giving your virtual machine a bit more than the default memory and CPU power:


```
$ minikube config set memory 8192
❗  These changes will take effect upon a minikube delete and then a minikube start
$ minikube config set cpus 6
❗  These changes will take effect upon a minikube delete and then a minikube start
```

Then start and check your system's status:


```
$ minikube start
😄  minikube v1.14.2 on Debian bullseye/sid
🎉  minikube 1.19.0 is available! Download it: <https://github.com/kubernetes/minikube/releases/tag/v1.19.0>
💡  To disable this notice, run: 'minikube config set WantUpdateNotification false'

✨  Using the docker driver based on user configuration
👍  Starting control plane node minikube in cluster minikube
🔥  Creating docker container (CPUs=6, Memory=8192MB) ...
🐳  Preparing Kubernetes v1.19.0 on Docker 19.03.8 ...
🔎  Verifying Kubernetes components...
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" by default
jess@Athena:~$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### Install Litmus

As outlined on [Litmus' homepage][6], the steps to install Litmus are: add your repo to Helm, create your Litmus namespace, then install your chart:


```
$ helm repo add litmuschaos <https://litmuschaos.github.io/litmus-helm/>
"litmuschaos" has been added to your repositories

$ kubectl create ns litmus
namespace/litmus created

$ helm install chaos litmuschaos/litmus --namespace=litmus
NAME: chaos
LAST DEPLOYED: Sun May  9 17:05:36 2021
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
```

### Verify the installation

You can run the following commands if you want to verify all the desired components are installed correctly.

Check if **api-resources** for chaos are available: 


```
root@demo:~# kubectl api-resources | grep litmus
chaosengines                                   litmuschaos.io                 true         ChaosEngine
chaosexperiments                               litmuschaos.io                 true         ChaosExperiment
chaosresults                                   litmuschaos.io                 true         ChaosResult
```

Check if the Litmus chaos operator deployment is running successfully:


```
root@demo:~# kubectl get pods -n litmus
NAME                      READY   STATUS    RESTARTS   AGE
litmus-7d998b6568-nnlcd   1/1     Running   0          106s
```

### Start running chaos experiments 

With this out of the way, you are good to go! Refer to Litmus' [chaos experiment documentation][7] to start executing your first experiment.

To confirm your installation is working, check that the pod is up and running correctly:


```
jess@Athena:~$ kubectl get pods -n litmus
NAME                      READY   STATUS    RESTARTS   AGE
litmus-7d6f994d88-2g7wn   1/1     Running   0          115s
```

Confirm the Custom Resource Definitions (CRDs) are also installed correctly:


```
jess@Athena:~$ kubectl get crds | grep chaos
chaosengines.litmuschaos.io       2021-05-09T21:05:33Z
chaosexperiments.litmuschaos.io   2021-05-09T21:05:33Z
chaosresults.litmuschaos.io       2021-05-09T21:05:33Z
```

Finally, confirm your API resources are also installed:


```
jess@Athena:~$ kubectl api-resources | grep chaos
chaosengines                                   litmuschaos.io                 true         ChaosEngine
chaosexperiments                               litmuschaos.io                 true         ChaosExperiment
chaosresults                                   litmuschaos.io                 true         ChaosResult
```

That's what I call easy installation and confirmation. The next step is setting up deployments for chaos.

### Prep for destruction

To test for chaos, you need something to test against. Add a new namespace:


```
$ kubectl create namespace more-apps
namespace/more-apps created
```

Then add a deployment to the new namespace:


```
$ kubectl create deployment ghost --namespace more-apps --image=ghost:3.11.0-alpine
deployment.apps/ghost created
```

Finally, scale your deployment up so that you have more than one pod in your deployment to test against:


```
$ kubectl scale deployment/ghost --namespace more-apps --replicas=4
deployment.apps/ghost scaled
```

For Litmus to cause chaos, you need to add an [annotation][8] to your deployment to mark it ready for chaos. Currently, annotations are available for deployments, StatefulSets, and DaemonSets. Add the annotation `chaos=true` to your deployment:


```
$ kubectl annotate deploy/ghost litmuschaos.io/chaos="true" -n more-apps
deployment.apps/ghost annotated
```

Make sure the experiments you will install have the correct permissions to work in the "more-apps" namespace.

Make a new **rbac.yaml** file for the prepper bindings and permissions:


```
`$ touch rbac.yaml`
```

Then add permissions for the generic testing by copying and pasting the code below into your **rbac.yaml** file. These are just basic, minimal permissions to kill pods in your namespace and give Litmus permissions to delete a pod for a namespace you provide:


```
\---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: pod-delete-sa
  namespace: more-apps
  labels:
    name: pod-delete-sa
\---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-delete-sa
  namespace: more-apps
  labels:
    name: pod-delete-sa
rules:
\- apiGroups: [""]
  resources: ["pods","events"]
  verbs: ["create","list","get","patch","update","delete","deletecollection"]
\- apiGroups: [""]
  resources: ["pods/exec","pods/log","replicationcontrollers"]
  verbs: ["create","list","get"]
\- apiGroups: ["batch"]
  resources: ["jobs"]
  verbs: ["create","list","get","delete","deletecollection"]
\- apiGroups: ["apps"]
  resources: ["deployments","statefulsets","daemonsets","replicasets"]
  verbs: ["list","get"]
\- apiGroups: ["apps.openshift.io"]
  resources: ["deploymentconfigs"]
  verbs: ["list","get"]
\- apiGroups: ["argoproj.io"]
  resources: ["rollouts"]
  verbs: ["list","get"]
\- apiGroups: ["litmuschaos.io"]
  resources: ["chaosengines","chaosexperiments","chaosresults"]
  verbs: ["create","list","get","patch","update"]
\---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-delete-sa
  namespace: more-apps
  labels:
    name: pod-delete-sa
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: pod-delete-sa
subjects:
\- kind: ServiceAccount
  name: pod-delete-sa
  namespace: more-apps
```

Apply the **rbac.yaml** file:


```
$ kubectl apply -f rbac.yaml
serviceaccount/pod-delete-sa created
role.rbac.authorization.k8s.io/pod-delete-sa created
rolebinding.rbac.authorization.k8s.io/pod-delete-sa created
```

The next step is to prepare your chaos engine to delete pods. The chaos engine will connect the experiment you need to your application instance by creating a **chaosengine.yaml** file and copying the information below into the .yaml file. This will connect your experiment to your namespace and the service account with the role bindings you created above.

This chaos engine file only specifies the pod to delete during chaos testing:


```
apiVersion: litmuschaos.io/v1alpha1
kind: ChaosEngine
metadata:
  name: moreapps-chaos
  namespace: more-apps
spec:
  appinfo:
    appns: 'more-apps'
    applabel: 'app=ghost'
    appkind: 'deployment'
  # It can be true/false
  annotationCheck: 'true'
  # It can be active/stop
  engineState: 'active'
  #ex. values: ns1:name=percona,ns2:run=more-apps
  auxiliaryAppInfo: ''
  chaosServiceAccount: pod-delete-sa
  # It can be delete/retain
  jobCleanUpPolicy: 'delete'
  experiments:
    - name: pod-delete
      spec:
        components:
          env:
           # set chaos duration (in sec) as desired
            - name: TOTAL_CHAOS_DURATION
              value: '30'

            # set chaos interval (in sec) as desired
            - name: CHAOS_INTERVAL
              value: '10'

            # pod failures without '--force' &amp; default terminationGracePeriodSeconds
            - name: FORCE
              value: 'false'
```

Don't apply this file until you install the experiments in the next section.

### Add new experiments for causing chaos

Now that you have an entirely new environment with deployments, roles, and the chaos engine to test against, you need some experiments to run. Since Litmus has a large community, you can find some great experiments in the [Chaos Hub][9].

In this walkthrough, I'll use the generic experiment of [killing a pod][10].

Run a kubectl command to install the generic experiments into your cluster. Install this in your `more-apps` namespace; you will see the tests created when you run it:


```
$ kubectl apply -f <https://hub.litmuschaos.io/api/chaos/1.13.3?file=charts/generic/experiments.yaml> -n more-apps
chaosexperiment.litmuschaos.io/pod-network-duplication created
chaosexperiment.litmuschaos.io/node-cpu-hog created
chaosexperiment.litmuschaos.io/node-drain created
chaosexperiment.litmuschaos.io/docker-service-kill created
chaosexperiment.litmuschaos.io/node-taint created
chaosexperiment.litmuschaos.io/pod-autoscaler created
chaosexperiment.litmuschaos.io/pod-network-loss created
chaosexperiment.litmuschaos.io/node-memory-hog created
chaosexperiment.litmuschaos.io/disk-loss created
chaosexperiment.litmuschaos.io/pod-io-stress created
chaosexperiment.litmuschaos.io/pod-network-corruption created
chaosexperiment.litmuschaos.io/container-kill created
chaosexperiment.litmuschaos.io/node-restart created
chaosexperiment.litmuschaos.io/node-io-stress created
chaosexperiment.litmuschaos.io/disk-fill created
chaosexperiment.litmuschaos.io/pod-cpu-hog created
chaosexperiment.litmuschaos.io/pod-network-latency created
chaosexperiment.litmuschaos.io/kubelet-service-kill created
chaosexperiment.litmuschaos.io/k8-pod-delete created
chaosexperiment.litmuschaos.io/pod-delete created
chaosexperiment.litmuschaos.io/node-poweroff created
chaosexperiment.litmuschaos.io/k8-service-kill created
chaosexperiment.litmuschaos.io/pod-memory-hog created
```

Verify the experiments installed correctly:


```
$ kubectl get chaosexperiments -n more-apps
NAME                      AGE
container-kill            72s
disk-fill                 72s
disk-loss                 72s
docker-service-kill       72s
k8-pod-delete             72s
k8-service-kill           72s
kubelet-service-kill      72s
node-cpu-hog              72s
node-drain                72s
node-io-stress            72s
node-memory-hog           72s
node-poweroff             72s
node-restart              72s
node-taint                72s
pod-autoscaler            72s
pod-cpu-hog               72s
pod-delete                72s
pod-io-stress             72s
pod-memory-hog            72s
pod-network-corruption    72s
pod-network-duplication   72s
pod-network-latency       72s
pod-network-loss          72s
```

### Run the experiments

Now that everything is installed and configured, use your **chaosengine.yaml** file to run the pod-deletion experiment you defined. Apply your chaos engine file:


```
$ kubectl apply -f chaosengine.yaml
chaosengine.litmuschaos.io/more-apps-chaos created
```

Confirm the engine started by getting all the pods in your namespace; you should see `pod-delete` being created:


```
$ kubectl get pods -n more-apps
NAME                      READY   STATUS              RESTARTS   AGE
ghost-5bdd4cdcc4-blmtl    1/1     Running             0          53m
ghost-5bdd4cdcc4-z2lnt    1/1     Running             0          53m
ghost-5bdd4cdcc4-zlcc9    1/1     Running             0          53m
ghost-5bdd4cdcc4-zrs8f    1/1     Running             0          53m
moreapps-chaos-runner     1/1     Running             0          17s
pod-delete-e443qx-lxzfx   0/1     ContainerCreating   0          7s
```

Next, you need to be able to observe your experiments using Litmus. The following command uses the ChaosResult CRD and provides a large amount of output:


```
$ kubectl describe chaosresult moreapps-chaos-pod-delete -n more-apps
Name:         moreapps-chaos-pod-delete
Namespace:    more-apps
Labels:       app.kubernetes.io/component=experiment-job
              app.kubernetes.io/part-of=litmus
              app.kubernetes.io/version=1.13.3
              chaosUID=a6c9ab7e-ff07-4703-abe4-43e03b77bd72
              controller-uid=601b7330-c6f3-4d9b-90cb-2c761ac0567a
              job-name=pod-delete-e443qx
              name=moreapps-chaos-pod-delete
Annotations:  &lt;none&gt;
API Version:  litmuschaos.io/v1alpha1
Kind:         ChaosResult
Metadata:
  Creation Timestamp:  2021-05-09T22:06:19Z
  Generation:          2
  Managed Fields:
    API Version:  litmuschaos.io/v1alpha1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:labels:
          .:
          f:app.kubernetes.io/component:
          f:app.kubernetes.io/part-of:
          f:app.kubernetes.io/version:
          f:chaosUID:
          f:controller-uid:
          f:job-name:
          f:name:
      f:spec:
        .:
        f:engine:
        f:experiment:
      f:status:
        .:
        f:experimentStatus:
        f:history:
    Manager:         experiments
    Operation:       Update
    Time:            2021-05-09T22:06:53Z
  Resource Version:  8406
  Self Link:         /apis/litmuschaos.io/v1alpha1/namespaces/more-apps/chaosresults/moreapps-chaos-pod-delete
  UID:               08b7e3da-d603-49c7-bac4-3b54eb30aff8
Spec:
  Engine:      moreapps-chaos
  Experiment:  pod-delete
Status:
  Experiment Status:
    Fail Step:                 N/A
    Phase:                     Completed
    Probe Success Percentage:  100
    Verdict:                   Pass
  History:
    Failed Runs:   0
    Passed Runs:   1
    Stopped Runs:  0
Events:
  Type    Reason   Age    From                     Message
  ----    ------   ----   ----                     -------
  Normal  Pass     104s   pod-delete-e443qx-lxzfx  experiment: pod-delete, Result: Pass
```

You can see the pass or fail output from your testing as you run the chaos engine definitions.

Congratulations on your first (and hopefully not last) chaos engineering test! Now you have a powerful tool to use and help your environment grow.

### Final thoughts

You might be thinking, "I can't run this manually every time I want to run chaos. How far can I take this, and how can I set it up for the long term?"

Litmus' best part (aside from the Chaos Hub) is its [scheduler][11] function. You can use it to define times and dates, repetitions or sporadic, to run experiments. This is a great tool for detailed admins who have been working with Kubernetes for a while and are ready to create some chaos. I suggest staying up to date on Litmus and how to use this tool for regular chaos engineering. Happy pod hunting!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/kubernetes-litmus-chaos

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://github.com/litmuschaos/litmus
[3]: https://opensource.com/article/21/5/11-years-kubernetes-and-chaos
[4]: https://opensource.com/article/21/5/get-your-steady-state-chaos-grafana-and-prometheus
[5]: https://minikube.sigs.k8s.io/docs/start/
[6]: https://litmuschaos.io/
[7]: https://docs.litmuschaos.io
[8]: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
[9]: https://hub.litmuschaos.io/
[10]: https://docs.litmuschaos.io/docs/pod-delete/
[11]: https://docs.litmuschaos.io/docs/scheduling/
