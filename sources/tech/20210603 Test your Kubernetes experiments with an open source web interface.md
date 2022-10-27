[#]: subject: (Test your Kubernetes experiments with an open source web interface)
[#]: via: (https://opensource.com/article/21/6/chaos-mesh-kubernetes)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Test your Kubernetes experiments with an open source web interface
======
Chaos Mesh enables chaos engineering with a web frontend. Learn more in
the fourth article in this series.
![Digital creative of a browser on the internet][1]

Have you wanted to cause chaos to test your systems but prefer to use visual tools rather than the terminal? Well, this article is for you, my friend. In the first article in this series, I explained [what chaos engineering is][2]; in the second article, I demonstrated how to get your [system's steady state][3] so that you can compare it against a chaos state; and in the third, I showed how to [use Litmus to test][4] arbitrary failures and experiments in your Kubernetes cluster.

The fourth article introduces [Chaos Mesh][5], an open source chaos orchestrator with a web user interface (UI) that anyone can use. It allows you to create experiments and display statistics in a web UI for presentations or visual storytelling. The [Cloud Native Computing Foundation][6] hosts the Chaos Mesh project, which means it is a good choice for Kubernetes. So let's get started! In this walkthrough, I'll use Pop!_OS 20.04, Helm 3, Minikube 1.14.2, and Kubernetes 1.19.

### Configure Minikube

If you haven't already, [install Minikube][7] in whatever way that makes sense for your environment. If you have enough resources, I recommend giving your virtual machine a bit more than the default memory and CPU power:


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

#### Install Chaos Mesh

Start installing Chaos Mesh by adding the repository to Helm:


```
$ helm repo add chaos-mesh <https://charts.chaos-mesh.org>
"chaos-mesh" has been added to your repositories
```

Then search for your Helm chart:


```
$ helm search repo chaos-mesh
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                      
chaos-mesh/chaos-mesh   v0.5.0          v1.2.0          Chaos Mesh® is a cloud-native Chaos Engineering...
```

Once you find your chart, you can begin the installation steps, starting with creating a `chaos-testing` namespace:


```
$ kubectl create ns chaos-testing
namespace/chaos-testing created
```

Next, install your Chaos Mesh chart in this namespace and name it `chaos-mesh`:


```
$ helm install chaos-mesh chaos-mesh/chaos-mesh --namespace=chaos-testing
NAME: chaos-mesh
LAST DEPLOYED: Mon May 10 10:08:52 2021
NAMESPACE: chaos-testing
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1\. Make sure chaos-mesh components are running
   kubectl get pods --namespace chaos-testing -l app.kubernetes.io/instance=chaos-mesh
```

As the output instructs, check that the Chaos Mesh components are running:


```
$ kubectl get pods --namespace chaos-testing -l app.kubernetes.io/instance=chaos-mesh
NAME                                       READY   STATUS    RESTARTS   AGE
chaos-controller-manager-bfdcb99fd-brkv7   1/1     Running   0          85s
chaos-daemon-4mjq2                         1/1     Running   0          85s
chaos-dashboard-865b778d79-729xw           1/1     Running   0          85s
```

Now that everything is running correctly, you can set up the services to see the Chaos Mesh dashboard and make sure the `chaos-dashboard` service is available:


```
$ kubectl get svc -n chaos-testing
NAME                            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                       AGE
chaos-daemon                    ClusterIP   None            &lt;none&gt;        31767/TCP,31766/TCP           3m42s
chaos-dashboard                 NodePort    10.99.137.187   &lt;none&gt;        2333:30029/TCP                3m42s
chaos-mesh-controller-manager   ClusterIP   10.99.118.132   &lt;none&gt;        10081/TCP,10080/TCP,443/TCP   3m42s
```

Now that you know the service is running, go ahead and expose it, rename it, and open the dashboard using `minikube service`:


```
$ kubectl expose service chaos-dashboard --namespace chaos-testing --type=NodePort --target-port=2333 --name=chaos
service/chaos exposed

$ minikube service chaos --namespace chaos-testing
|---------------|-------|-------------|---------------------------|
|   NAMESPACE   | NAME  | TARGET PORT |            URL            |
|---------------|-------|-------------|---------------------------|
| chaos-testing | chaos |        2333 | <http://192.168.49.2:32151> |
|---------------|-------|-------------|---------------------------|
🎉  Opening service chaos-testing/chaos in default browser...
```

When the browser opens, you'll see a token generator window. Check the box next to **Cluster scoped**, and follow the directions on the screen.

![Token generator][8]

(Jess Cherry, [CC BY-SA 4.0][9])

Then you can log into Chaos Mesh and see the Dashboard.

![Chaos Mesh Dashboard][10]

(Jess Cherry, [CC BY-SA 4.0][9])

You have installed your Chaos Mesh instance and can start working towards chaos testing!

### Get meshy in your cluster

Now that everything is up and running, you can set up some new experiments to try. The documentation offers some predefined experiments, and I'll choose [StressChaos][11] from the options. In this walkthrough, you will create something in a new namespace to stress against and scale it up so that it can stress against more than one thing.

Create the namespace:


```
$ kubectl create ns app-demo
namespace/app-demo created
```

Then create the deployment in your new namespace:


```
$ kubectl create deployment nginx --image=nginx --namespace app-demo
deployment.apps/nginx created
```

Scale the deployment up to eight pods:


```
$ kubectl scale deployment/nginx --replicas=8 --namespace app-demo
deployment.apps/nginx scaled
```

Finally, confirm everything is up and working correctly by checking your pods in the namespace:


```
$ kubectl get pods -n app-demo
NAME                     READY   STATUS    RESTARTS   AGE
nginx-6799fc88d8-7kphn   1/1     Running   0          69s
nginx-6799fc88d8-82p8t   1/1     Running   0          69s
nginx-6799fc88d8-dfrlz   1/1     Running   0          69s
nginx-6799fc88d8-kbf75   1/1     Running   0          69s
nginx-6799fc88d8-m25hs   1/1     Running   0          2m44s
nginx-6799fc88d8-mg4tb   1/1     Running   0          69s
nginx-6799fc88d8-q9m2m   1/1     Running   0          69s
nginx-6799fc88d8-v7q4d   1/1     Running   0          69s
```

Now that you have something to test against, you can begin working on the definition for your experiment. Start by creating `chaos-test.yaml`:


```
`$ touch chaos-test.yaml`
```

Next, create the definition for the chaos test. Just copy and paste this experiment definition into your `chaos-test.yaml` file:


```
apiVersion: chaos-mesh.org/v1alpha1
kind: StressChaos
metadata:
  name: burn-cpu
  namespace: chaos-testing
spec:
  mode: one
  selector:
    namespaces:
     - app-demo
    labelSelectors:
      app: "nginx"
  stressors:
    cpu:
      workers: 1
  duration: '30s'
  scheduler:
    cron: '@every 2m'
```

This test will burn 1 CPU for 30 seconds every 2 minutes on pods in the `app-demo` namespace. Finally, apply the YAML file to start the experiment and view what happens in your dashboard.

Apply the experiment file:


```
$ kubectl apply -f chaos-test.yaml
stresschaos.chaos-mesh.org/burn-cpu created
```

Then go to your dashboard and click **Experiments** to see the stress test running. You can pause the experiment by pressing the **Pause** button on the right-hand side of the experiment.

![Chaos Mesh Experiments interface][12]

(Jess Cherry, [CC BY-SA 4.0][9])

Click **Dashboard** to see the state with a count of total experiments, the state graph, and a timeline of running events or previously run tests.

![Chaos Mesh Dashboard][13]

(Jess Cherry, [CC BY-SA 4.0][9])

Choose **Events** to see the timeline and the experiments below it with details.

![Chaos Mesh Events interface][14]

(Jess Cherry, [CC BY-SA 4.0][9])

![Chaos Mesh Events timeline details][15]

(Jess Cherry, [CC BY-SA 4.0][9])

Congratulations on completing your first test! Now that you have this working, I'll share more details about what else you can do with your experiments.

### But wait, there's more

Other things you can do with this experiment using the command line include:

  * Updating the experiment to change how it works
  * Pausing the experiment if you need to return the cluster to a steady state
  * Resuming the experiment to continue testing
  * Deleting the experiment if you no longer need it for testing



#### Updating the experiment

As an example, update the experiment in your cluster to increase the duration between tests. Go back to your `cluster-test.yaml` and edit the scheduler to change 2 minutes to 20 minutes:

Before:


```
 scheduler:
    cron: '@every 2m'
```

After:


```
 scheduler:
    cron: '@every 20m'
```

Save and reapply your file; the output should show the new stress test configuration:


```
$ kubectl apply -f chaos-test.yaml
stresschaos.chaos-mesh.org/burn-cpu configured
```

If you look in the Dashboard, the experiment should show the new cron configuration.

![New cron configuration][16]

(Jess Cherry, [CC BY-SA 4.0][9])

#### Pausing and resuming the experiment

Manually pausing the experiment on the command line will require adding an [annotation][17] to the experiment. Resuming the experiment will require removing the annotation.

To add the annotation, you will need the kind, name, and namespace of the experiment from your YAML file.

**Pause an experiment:**


```
$ kubectl annotate stresschaos burn-cpu experiment.chaos-mesh.org/pause=true  -n chaos-testing

stresschaos.chaos-mesh.org/burn-cpu annotated
```

The web UI shows it is paused.

![Paused experiment][18]

(Jess Cherry, [CC BY-SA 4.0][9])

**Resume an experiment**

You need the same information to resume your experiment. However, rather than the word `true`, you use a dash to remove the pause.


```
$ kubectl annotate stresschaos burn-cpu experiment.chaos-mesh.org/pause-  -n chaos-testing

stresschaos.chaos-mesh.org/burn-cpu annotated
```

Now you can see the experiment has resumed in the web UI.

![Resumed experiment][19]

(Jess Cherry, [CC BY-SA 4.0][9])

#### Remove an experiment

Removing an experiment altogether requires a simple `delete` command with the file name:


```
$ kubectl delete -f chaos-test.yaml

stresschaos.chaos-mesh.org "burn-cpu" deleted
```

Once again, you should see the desired result in the web UI.

![All experiments deleted][20]

(Jess Cherry, [CC BY-SA 4.0][9])

Many of these tasks were done with the command line, but you can also create your own experiments using the UI or import experiments you created as YAML files. This helps many people become more comfortable with creating new experiments. There is also a Download button for each experiment, so you can see the YAML file you created by clicking a few buttons.

### Final thoughts

Now that you have this new tool, you can get meshy with your environment. Chaos Mesh allows more user-friendly interaction, which means more people can join the chaos team. I hope you've learned enough here to expand on your chaos engineering. Happy pod hunting!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/chaos-mesh-kubernetes

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/21/5/11-years-kubernetes-and-chaos
[3]: https://opensource.com/article/21/5/get-your-steady-state-chaos-grafana-and-prometheus
[4]: https://opensource.com/article/21/5/total-chaos-litmus
[5]: https://chaos-mesh.org/
[6]: https://www.cncf.io/
[7]: https://minikube.sigs.k8s.io/docs/start/
[8]: https://opensource.com/sites/default/files/uploads/tokengenerator.png (Token generator)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/chaosmesh_dashboard.png (Chaos Mesh Dashboard)
[11]: https://chaos-mesh.org/docs/chaos_experiments/stresschaos_experiment
[12]: https://opensource.com/sites/default/files/uploads/chaosmesh_experiments.png (Chaos Mesh Experiments interface)
[13]: https://opensource.com/sites/default/files/uploads/chaosmesh_experiment-dashboard.png (Chaos Mesh Dashboard)
[14]: https://opensource.com/sites/default/files/uploads/chaosmesh_events.png (Chaos Mesh Events interface)
[15]: https://opensource.com/sites/default/files/uploads/chaosmesh_event-details.png (Chaos Mesh Events timeline details)
[16]: https://opensource.com/sites/default/files/uploads/newcron.png (New cron configuration)
[17]: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
[18]: https://opensource.com/sites/default/files/uploads/pausedexperiment.png (Paused experiment)
[19]: https://opensource.com/sites/default/files/uploads/resumedexperiment.png (Resumed experiment)
[20]: https://opensource.com/sites/default/files/uploads/deletedexperiment.png (All experiments deleted)
