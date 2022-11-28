[#]: subject: (Get started with Argo CD)
[#]: via: (https://opensource.com/article/21/8/argo-cd)
[#]: author: (Ayush Sharma https://opensource.com/users/ayushsharma)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with Argo CD
======
Argo CD is a simple pull-based GitOps deployment tool that syncs
Kubernetes manifest files with a cluster for easy, no-nonsense
deployments.
![Plumbing tubes in many directions][1]

In a typical push-based deployment, tools like Ansible and Jenkins connect directly to the server or cluster and execute the provisioning commands. This approach works well when the cluster is accessible on the network and there is direct connectivity between your deployment server and the destination server. For compliance or security reasons, connectivity between the deployment tool and the cluster may not be possible.

[Argo CD][2] is a pull-based deployment tool. It watches a remote Git repository for new or updated manifest files and synchronizes those changes with the cluster. By managing manifests in Git and syncing them with the cluster, you get all the advantages of a Git-based workflow (version control, pull-request reviews, transparency in collaboration, etc.) and a one-to-one mapping between what is in the Git repo and what is deployed in the cluster. This method is called GitOps.

In this tutorial, you will:

  1. Install Argo CD on a Minikube installation
  2. Create a sample Argo CD application called `ayush-test-application` and link it with [my repo `ayush-sharma/example-assets`][3]
  3. Create an [Nginx deployment with three replicas][4]
  4. Ensure the new application shows up on the Argo CD dashboard and verify it using `kubectl`



### Install Argo CD

This tutorial uses Minikube version v1.21.0. If you don't have it, [download and install Minikube][5].

With Minikube up and running, you can install Argo CD. The Argo CD documentation contains detailed steps on how to [install and configure it for any cluster][6]. Once you've executed those steps, run `minikube tunnel` in a separate terminal window to ensure Minikube exposes the Argo CD server's load balancer endpoint on your local system. To verify this, run `kubectl get po -n argocd` and check if the `argo-server` service has an `EXTERNAL-IP:`


```
user@system ~ kubectl get svc -n argocd
NAME                    TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                      AGE
argocd-dex-server       ClusterIP      10.110.2.52     &lt;none&gt;          5556/TCP,5557/TCP,5558/TCP   3h32m
argocd-metrics          ClusterIP      10.100.73.57    &lt;none&gt;          8082/TCP                     3h32m
argocd-redis            ClusterIP      10.104.11.24    &lt;none&gt;          6379/TCP                     3h32m
argocd-repo-server      ClusterIP      10.100.132.53   &lt;none&gt;          8081/TCP,8084/TCP            3h32m
argocd-server           LoadBalancer   10.98.182.198   10.98.182.198   80:32746/TCP,443:31353/TCP   3h32m
argocd-server-metrics   ClusterIP      10.105.182.52   &lt;none&gt;          8083/TCP                     3h32m
```

Once the installation is complete and the load balancer is working, the Argo CD user interface (UI) will be accessible at the `EXTERNAL IP`.

![Argo CD home page][7]

(Ayush Sharma, [CC BY-SA 4.0][8])

### Create your first application

Before talking about Argo CD deployments, you need a Git repo with a Kubernetes (k8s) manifest file ready to deploy. I'm using my [public repo `example-assets`][3] with an Nginx deployment [manifest file in `/argocd/getting-started`][4].

The goal is to get Argo CD to listen to the k8s manifest file for changes and then sync them with the cluster it is deployed in (in this case, Minikube). You do this by creating an application containing information about the manifest files' source repo, destination cluster details, and synchronization policies.

Click `New App` on the top left to configure a new application. Since my destination Kubernetes server is the one Argo CD is installed on (Minikube), I left the server defaults as-is. These are the values I configured:

  1. Application name: `ayush-test-application`
  2. Project: `default`
  3. Sync policy: `automated`
  4. Sync options: `prune: true; selfHeal: true`
  5. Source repository URL: `https://gitlab.com/ayush-sharma/example-assets.git`
  6. Source revision: `HEAD`
  7. Source path: `argocd/getting-started`
  8. Destination cluster URL: `https://kubernetes.default.svc`
  9. Destination namespace: `default`



To make things easier, you can click `EDIT AS YAML` on the top right and paste in:


```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ayush-test-application
spec:
  destination:
    name: 'default'
    namespace: default
    server: '<https://kubernetes.default.svc>'
  source:
    path: argocd/getting-started
    repoURL: '<https://gitlab.com/ayush-sharma/example-assets.git>'
    targetRevision: HEAD
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

Your configuration should look like this:

![Argo CD application configuration][9]

(Ayush Sharma, [CC BY-SA 4.0][8])

After saving the configuration, your application should show up as a card on the home page. Since you specified the sync policy as `Automated`, your new application will begin syncing with the repo immediately.

![Argo CD application syncing][10]

(Ayush Sharma, [CC BY-SA 4.0][8])

### Create the Nginx deployment

In this tutorial, the manifest file is a standard Nginx deployment with three replicas. Once `ayush-test-application` completes syncing, Argo CD will display a nice graphical view of the deployment.

![Argo CD application deployment][11]

(Ayush Sharma, [CC BY-SA 4.0][8])

Verify the deployment using `kubectl get po`:


```
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-585449566-584cj   1/1     Running   0          5m
nginx-deployment-585449566-6qn2z   1/1     Running   0          5m
nginx-deployment-585449566-d9fm2   1/1     Running   0          5m
```

### Argo CD's advantages

Argo CD is a relatively lightweight approach to k8s deployments. I'm especially fond of the one-to-one relationship between what's in the repo and what's in the cluster, making incident management a lot simpler.

Another big advantage is that since the Git repo contains everything Argo CD requires, you could delete the entire Argo CD installation and set things up from scratch. This means bringing up a second identical cluster with your entire workload deployed is now more feasible and practical in the event of a catastrophic outage.

A third big advantage is fewer open ports. Argo CD pulls changes from a remote Git repo, so there's no need to define firewall rules and virtual private cloud (VPC) peering connections to get your deployment servers to connect with your cluster, which is one less point of entry. This reduces the attack surface area for your development, quality assurance (QA), and production servers significantly.

Since the Git repo and branch name are configurable, you can get creative with deployment models. For example, you could have two different Argo CDs running on two different QA and production clusters listening to the same repo's branch. This guarantees that the same manifest file is deployed on both clusters, ensuring QA and production environments contain the same codebase. Also, a single Argo CD is capable of targeting multiple servers, meaning a hub-and-spoke deployment model is possible, where one master Argo CD orchestrates deployments across multiple development, QA, and production clusters in different regions or environments.

Get creative with Argo CD, and don't forget to share your experiments with others.

* * *

_This article originally appeared on [Ayush Sharma's blog][12] under a [CC BY-SA 4.0][8] license._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/argo-cd

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://argoproj.github.io/cd/
[3]: https://gitlab.com/ayush-sharma/example-assets/-/tree/main/argocd/getting-started
[4]: https://gitlab.com/ayush-sharma/example-assets/-/blob/main/argocd/getting-started/nginx-manifest.yml
[5]: https://minikube.sigs.k8s.io/docs/start/
[6]: https://argoproj.github.io/argo-cd/getting_started/
[7]: https://opensource.com/sites/default/files/uploads/getting-started-with-argocd-application-page.png (Argo CD home page)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/getting-started-with-argocd-creating-the-application.png (Argo CD application configuration)
[10]: https://opensource.com/sites/default/files/uploads/getting-started-with-argocd-creating-ayush-test-application.png (Argo CD application syncing)
[11]: https://opensource.com/sites/default/files/uploads/getting-started-with-argocd-successful-nginx-deployment.png (Argo CD application deployment)
[12]: https://notes.ayushsharma.in/2021/07/getting-started-with-argocd
