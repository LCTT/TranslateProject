[#]: subject: (Test arbitrary pod failures on Kubernetes with kube-monkey)
[#]: via: (https://opensource.com/article/21/6/chaos-kubernetes-kube-monkey)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Test arbitrary pod failures on Kubernetes with kube-monkey
======
Kube-monkey offers an easy way to stress-test your systems by scheduling
random termination pods in your cluster.
![Parts, modules, containers for software][1]

I have covered multiple chaos engineering tools in this series. The first article in this series explained [what chaos engineering is][2]; the second demonstrated how to get your [system's steady state][3] so that you can compare it against a chaos state; the third showed how to [use Litmus to test][4] arbitrary failures and experiments in your Kubernetes cluster; and the fourth article got into [Chaos Mesh][5], an open source chaos orchestrator with a web user interface.

In this fifth article, I want to talk about arbitrary pod failure. [Kube-monkey][6] offers an easy way to stress-test your systems by scheduling random termination pods in your cluster. This aims to encourage and validate the development of failure-resilient services. As in the previous walkthroughs, I'll use Pop!_OS 20.04, Helm 3, Minikube 1.14.2, and Kubernetes 1.19.

### Configure Minikube

If you haven't already, [install Minikube][7] in whatever way makes sense for your environment. If you have enough resources, I recommend giving your virtual machine a bit more than the default memory and CPU power:


```
$ minikube config set memory 8192
❗  These changes will take effect upon a minikube delete and then a minikube start
$ minikube config set cpus 6
❗  These changes will take effect upon a minikube delete and then a minikube start
```

Then start and check the status of your system:


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
$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### Preconfiguring with deployments

Start by adding some small deployments to run chaos against. These deployments will need some special labels, so you need to create a new Helm chart. The following labels will help kube-monkey determine what to kill if the app is opted-in to doing chaos and understand what details are behind the chaos:

  * **kube-monkey/enabled**: This setting opts you in to starting the chaos.
  * **kube-monkey/mtbf**: This stands for mean time between failure (in days). For example, if it's set to 3, the Kubernetes (K8s) app expects to have a pod killed approximately every third weekday.
  * **kube-monkey/identifier**: This is a unique identifier for the K8s apps; in this example, it will be "nginx."
  * **kube-monkey/kill-mode**: The kube-monkey's default behavior is to kill only one pod in the cluster, but you can change it to add more:
    * **kill-all:** Kill every pod, no matter what is happening with a pod
    * **fixed:** Pick a number of pods you want to kill
    * **fixed-percent:** Kill a fixed percent of pods (e.g., 50%)
  * **kube-monkey/kill-value**: This is where you can specify a value for kill-mode
    * **fixed:** The number of pods to kill
    * **random-max-percent:** The maximum number from 0–100 that kube-monkey can kill
    * **fixed-percent:** The percentage, from 0–100 percent, of pods to kill



Now that you have this background info, you can start [creating a basic Helm chart][8].

I named this Helm chart `nginx`. I'll show only the changes to the Helm chart deployment labels below. You need to change the deployment YAML file, which is `nginx/templates` in this example:


```
$ /chaos/kube-monkey/helm/nginx/templates$ ls -la
total 40
drwxr-xr-x 3 jess jess 4096 May 15 14:46 .
drwxr-xr-x 4 jess jess 4096 May 15 14:46 ..
-rw-r--r-- 1 jess jess 1826 May 15 14:46 deployment.yaml
-rw-r--r-- 1 jess jess 1762 May 15 14:46 _helpers.tpl
-rw-r--r-- 1 jess jess  910 May 15 14:46 hpa.yaml
-rw-r--r-- 1 jess jess 1048 May 15 14:46 ingress.yaml
-rw-r--r-- 1 jess jess 1735 May 15 14:46 NOTES.txt
-rw-r--r-- 1 jess jess  316 May 15 14:46 serviceaccount.yaml
-rw-r--r-- 1 jess jess  355 May 15 14:46 service.yaml
drwxr-xr-x 2 jess jess 4096 May 15 14:46 tests
```

In your `deployment.yaml` file, find this section:


```
 template:
    metadata:
     {{- with .Values.podAnnotations }}
      annotations:
       {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
       {{- include "nginx.selectorLabels" . | nindent 8 }}
```

And make these changes:


```
 template:
    metadata:
     {{- with .Values.podAnnotations }}
      annotations:
       {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
       {{- include "nginx.selectorLabels" . | nindent 8 }}
        kube-monkey/enabled: enabled
        kube-monkey/identifier: monkey-victim
        kube-monkey/mtbf: '2'
        kube-monkey/kill-mode: "fixed"
        kube-monkey/kill-value: '1'
```

Move back one directory and find the `values` file:


```
$ /chaos/kube-monkey/helm/nginx/templates$ cd ../
$ /chaos/kube-monkey/helm/nginx$ ls
charts  Chart.yaml  templates  values.yaml
```

You need to change one line in the values file, from:


```
`replicaCount: 1`
```

to:


```
`replicaCount: 8`
```

This will give you eight different pods to test chaos against.

Move back one more directory and install the new Helm chart:


```
$ /chaos/kube-monkey/helm/nginx$ cd ../
$ /chaos/kube-monkey/helm$ helm install nginxtest nginx
NAME: nginxtest
LAST DEPLOYED: Sat May 15 14:53:47 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1\. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=nginx,app.kubernetes.io/instance=nginxtest" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit <http://127.0.0.1:8080> to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
```

Then check the labels in your Nginx pods:


```
$ /chaos/kube-monkey/helm$ kubectl get pods -n default
NAME                                 READY   STATUS    RESTARTS   AGE
nginxtest-8f967857-88zv7             1/1     Running   0          80s
nginxtest-8f967857-8qb95             1/1     Running   0          80s
nginxtest-8f967857-dlng7             1/1     Running   0          80s
nginxtest-8f967857-h7mmc             1/1     Running   0          80s
nginxtest-8f967857-pdzpq             1/1     Running   0          80s
nginxtest-8f967857-rdpnb             1/1     Running   0          80s
nginxtest-8f967857-rqv2w             1/1     Running   0          80s
nginxtest-8f967857-tr2cn             1/1     Running   0          80s
```

Chose the first pod to describe and confirm the labels are in place:


```
$ /chaos/kube-monkey/helm$ kubectl describe pod nginxtest-8f967857-88zv7 -n default
Name:         nginxtest-8f967857-88zv7
Namespace:    default
Priority:     0
Node:         minikube/192.168.49.2
Start Time:   Sat, 15 May 2021 15:11:37 -0400
Labels:       app.kubernetes.io/instance=nginxtest
              app.kubernetes.io/name=nginx
              kube-monkey/enabled=enabled
              kube-monkey/identifier=monkey-victim
              kube-monkey/kill-mode=fixed
              kube-monkey/kill-value=1
              kube-monkey/mtbf=2
              pod-template-hash=8f967857
```

### Configure and install kube-monkey

To install kube-monkey using Helm, you first need to run `git clone on `the [kube-monkey repository][6]:


```
$ /chaos$ git clone <https://github.com/asobti/kube-monkey>
Cloning into 'kube-monkey'...
remote: Enumerating objects: 14641, done.
remote: Counting objects: 100% (47/47), done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 14641 (delta 18), reused 22 (delta 8), pack-reused 14594
Receiving objects: 100% (14641/14641), 30.56 MiB | 39.31 MiB/s, done.
Resolving deltas: 100% (6502/6502), done.
```

Change to the `kube-monkey/helm` directory:


```
$ /chaos$ cd kube-monkey/helm/
$ /chaos/kube-monkey/helm$
```

Then go into the Helm chart and find the `values.yaml` file:


```
$ /chaos/kube-monkey/helm$ cd kubemonkey/
$ /chaos/kube-monkey/helm/kubemonkey$ ls
Chart.yaml  README.md  templates  values.yaml
```

Below, I will show just the sections of the `values.yaml` file you need to change. They disable dry-run mode by changing it in the config section to `false`, then add the default namespace to the whitelist so that it can kill the pods you deployed. You must keep the `blacklistedNamespaces` value or you will cause severe damage to your system.

Change this:


```
config:
  dryRun: true  
  runHour: 8
  startHour: 10
  endHour: 16
  blacklistedNamespaces:
   - kube-system
  whitelistedNamespaces: []
```

To this:


```
config:
  dryRun: false  
  runHour: 8
  startHour: 10
  endHour: 16
  blacklistedNamespaces:
    - kube-system
  whitelistedNamespaces:  ["default"]
```

In the debug section, set `enabled` and `schedule_immediate_kill` to `true`. This will show the pods being killed.

Change this:


```
 debug:
   enabled: false
   schedule_immediate_kill: false
```

To this:


```
 debug:
   enabled: true
   schedule_immediate_kill: true
```

Run a `helm install`:


```
$ /chaos/kube-monkey/helm$ helm install chaos kubemonkey
NAME: chaos
LAST DEPLOYED: Sat May 15 13:51:59 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1\. Wait until the application is rolled out:
  kubectl -n default rollout status deployment chaos-kube-monkey
2\. Check the logs:
  kubectl logs -f deployment.apps/chaos-kube-monkey -n default
```

Check the kube-monkey logs and see that the pods are being terminated:


```
 $ /chaos/kube-monkey/helm$ kubectl logs -f deployment.apps/chaos-kube-monkey -n default

        ********** Today's schedule **********
        k8 Api Kind     Kind Name               Termination Time
        -----------     ---------               ----------------
        v1.Deployment   nginxtest               05/15/2021 15:15:22 -0400 EDT
        ********** End of schedule **********
I0515 19:15:22.343202       1 kubemonkey.go:70] Termination successfully executed for v1.Deployment nginxtest
I0515 19:15:22.343216       1 kubemonkey.go:73] Status Update: 0 scheduled terminations left.
I0515 19:15:22.343220       1 kubemonkey.go:76] Status Update: All terminations done.
I0515 19:15:22.343278       1 kubemonkey.go:19] Debug mode detected!
I0515 19:15:22.343283       1 kubemonkey.go:20] Status Update: Generating next schedule in 30 sec
```

You can also use [K9s][9] and watch the pods die.

![Pods dying in K9s][10]

(Jess Cherry, [CC BY-SA 4.0][11])

Congratulations! You now have a running chaos test with arbitrary failures. Anytime you want, you can change your applications to test at a certain day of the week and time of day.

### Final thoughts

While kube-monkey is a great chaos engineering tool, it does require heavy configurations. Therefore, it isn't the best starter chaos engineering tool for someone new to Kubernetes. Another drawback is you have to edit your application's Helm chart for chaos testing to run.

This tool would be best positioned in a staging environment to watch how applications respond to arbitrary failure regularly. This gives you a long-term way to keep track of unsteady states using cluster monitoring tools. It also keeps notes that you can use for recovery of your internal applications in production.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/chaos-kubernetes-kube-monkey

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/21/5/11-years-kubernetes-and-chaos
[3]: https://opensource.com/article/21/5/get-your-steady-state-chaos-grafana-and-prometheus
[4]: https://opensource.com/article/21/5/total-chaos-litmus
[5]: https://opensource.com/article/21/5/get-meshy-chaos-mesh
[6]: https://github.com/asobti/kube-monkey
[7]: https://minikube.sigs.k8s.io/docs/start/
[8]: https://opensource.com/article/20/5/helm-charts
[9]: https://opensource.com/article/20/5/kubernetes-administration
[10]: https://opensource.com/sites/default/files/uploads/podsdying.png (Pods dying in K9s)
[11]: https://creativecommons.org/licenses/by-sa/4.0/
