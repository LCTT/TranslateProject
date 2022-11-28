[#]: subject: "Automatically create multiple applications in Argo CD"
[#]: via: "https://opensource.com/article/21/7/automating-argo-cd"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Automatically create multiple applications in Argo CD
======
In this tutorial, I will show you how to automatically create multiple
applications in Argo CD using Argo CD.
![gears and lightbulb to represent innovation][1]

In a previous article, I demonstrated how [Argo CD makes pull-based GitOps deployments simple][2]. In this tutorial, I’ll show you how to automatically create multiple applications in Argo CD using Argo CD itself.

Since Argo CD’s job is to listen to a repo and apply the Manifest files it finds to the cluster, you can use this approach to configure Argo CD internals as well. In my previous example, I used the GUI to create a sample Nginx application with three replicas. This time, I use the same approach as before, but I create an application from the GUI to deploy three separate applications: `app-1`, `app-2`, and `app-3`.

### Configuring our child applications

First, start by creating the Manifest files for your three applications. In my `example-assets` [repository][3], I have [created three applications][4] under `argocd/my-apps`. All three applications are Nginx with three replicas. Be sure to create each application in its own folder.

Create a [YAML file][5] to define the first application and save it as `my-apps/app-1/app.yml`:


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app-1
  labels:
    app: nginx-app-1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app-1
  template:
    metadata:
      labels:
        app: nginx-app-1
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

Create another one for your second application and save it as `my-apps/app-2/app.yml`:


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app-2
  labels:
    app: nginx-app-2
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app-2
  template:
    metadata:
      labels:
        app: nginx-app-2
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

Create a third for your final app and save it as `my-apps/app-3/app.yml`:


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app-3
  labels:
    app: nginx-app-3
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app-3
  template:
    metadata:
      labels:
        app: nginx-app-3
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

Now that your Manifest files are ready, you must create Argo CD Applications pointing to those Manifests.

Argo CD can be configured in three different ways: using the GUI, using the CLI, or using Kubernetes Manifest files. In this article, I use the third method.

Create the following Manifest files in a new folder `argocd/argo-apps`. This is `argocd-apps/app-1.yml`:


```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app-1
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: argocd
    server: <https://kubernetes.default.svc>
  project: default
  source:
    path: argocd/my-apps/app-1
    repoURL: <https://gitlab.com/ayush-sharma/example-assets.git>
    targetRevision: HEAD
```

This is `argocd-apps/app-2.yml`:


```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app-2
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: argocd
    server: <https://kubernetes.default.svc>
  project: default
  source:
    path: argocd/my-apps/app-2
    repoURL: <https://gitlab.com/ayush-sharma/example-assets.git>
    targetRevision: HEAD
```

And this is `argocd-apps/app-3.yml`:


```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app-3
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: argocd
    server: <https://kubernetes.default.svc>
  project: default
  source:
    path: argocd/my-apps/app-3
    repoURL: <https://gitlab.com/ayush-sharma/example-assets.git>
    targetRevision: HEAD
```

As you can see, you are creating a Kubernetes object called `Application` in the `argocd` namespace. This object contains the source Git repository and destination server details. Your Applications are pointing to the Nginx manifest files you created earlier.

### Configuring our main application

Now you need some way to tell Argo CD how to find your three Nginx applications. Do this by creating yet another Application. This pattern is called the `App of Apps` pattern, where one Application contains the instructions to deploy multiple child Applications.

Create a new Application from the GUI called `my-apps` with the following configuration:


```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-apps
spec:
  destination:
    namespace: default
    server: '<https://kubernetes.default.svc>'
  source:
    path: argocd/argocd-apps
    repoURL: '<https://gitlab.com/ayush-sharma/example-assets.git>'
    targetRevision: HEAD
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

Once it has been created, `my-apps` begins syncing in the GUI:

![Automating ArgoCD with ArgoCD! - Main app.][6]

Figure 1: Automating ArgoCD with ArgoCD! - Main app.

After the sync is complete, your three Nginx applications appear in the GUI as well:

![Automating ArgoCD with ArgoCD! - Dashboard.][7]

Figure 2: Automating ArgoCD with ArgoCD! - Dashboard.

Since you didn't enable `AutoSync`, manually sync `app-1`, `app-2`, and `app-3`. Once synced, your Nginx replicas are deployed for all three apps.

![Automating ArgoCD with ArgoCD! - Deployment.][8]

Figure 3: Automating ArgoCD with ArgoCD! - Deployment.

### Conclusion

Mastering the `App of Apps` pattern is critical to leveraging the full power of Argo CD. This method allows you to manage groups of applications cleanly. For example, deploying Prometheus, Grafana, Loki, and other vital services could be managed by a DevOps Application, while deploying frontend code could be managed by a Frontend Application. Configuring different sync options and repo locations for each gives you precise control over different application groups.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/automating-argo-cd

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://opensource.com/article/21/8/argo-cd
[3]: https://gitlab.com/ayush-sharma/example-assets
[4]: https://gitlab.com/ayush-sharma/example-assets/-/tree/main/argocd/my-apps
[5]: https://www.redhat.com/sysadmin/yaml-beginners
[6]: https://opensource.com/sites/default/files/1automating-argocd-with-argocd-main-app_0.png
[7]: https://opensource.com/sites/default/files/2automating-argocd-with-argocd-dashboard.png
[8]: https://opensource.com/sites/default/files/3automating-argocd-with-argocd-deployment.png
