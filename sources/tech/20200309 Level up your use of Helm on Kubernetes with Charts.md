[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Level up your use of Helm on Kubernetes with Charts)
[#]: via: (https://opensource.com/article/20/3/helm-kubernetes-charts)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

Level up your use of Helm on Kubernetes with Charts
======
Configuring known apps using the Helm package manager.
![Ships at sea on the web][1]

Applications are complex collections of code and configuration that have a lot of nuance to how they are installed. Like all open source software, they can be installed from source code, but most of the time users want to install something simply and consistently. That’s why package managers exist in nearly every operating system, which manages the installation process.

Similarly, Kubernetes depends on package management to simplify the installation process. In this article, we’ll be using the Helm package manager and its concept of stable charts to create a small application.

### What is Helm package manager?

[Helm][2] is a package manager for applications to be deployed to and run on Kubernetes. It is maintained by the [Cloud Native Computing Foundation][3] (CNCF) with collaboration with the largest companies using Kubernetes. Helm can be used as a command-line utility, which [I cover how to use here][4].

#### Installing Helm

Installing Helm is quick and easy for Linux and macOS. There are two ways to do this, you can go to the release [page][5], download your preferred version, untar the file, and move the Helm executable to your** /usr/local/bin** or your **/usr/bin** whichever you are using.

Alternatively, you can use your operating system package manage (**dnf**, **snap**, **brew**, or otherwise) to install it. There are instructions on how to install on each OS on this [GitHub page][6].

### What are Helm Charts?

We want to be able to repeatably install applications, but also to customize them to our environment. That’s where Helm Charts comes into play. Helm coordinates the deployment of applications using standardized templates called Charts. Charts are used to define, install, and upgrade your applications at any level of complexity.

> A _Chart_ is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster. Think of it like the Kubernetes equivalent of a Homebrew formula, an Apt dpkg, or a Yum RPM file.
>
> [Using Helm][7]

Charts are quick to create, and I find them straightforward to maintain. If you have one that is accessible from a public version control site, you can publish it to the [stable repository][8] to give it greater visibility. In order for a Chart to be added to stable, it must meet a number of [technical requirements][9]. In the end, if it is considered properly maintained by the Helm maintain, it can then be published to [Helm Hub][10].

Since we want to use the community-curated stable charts, we will make that easier by adding a shortcut: 


```
$ helm repo add stable <https://kubernetes-charts.storage.googleapis.com>
"stable" has been added to your repositories
```

### Running our first Helm Chart

Since I’ve already covered the basic Helm usage in [this article][11], I’ll focus on how to edit and use charts in this article. To follow along, you’ll need Helm installed and access to some Kubernetes environment, like minikube (which you can walk through [here][12] or [here][13]).

Starting I will be picking one chart. Usually, in my article I use Jenkins as my example, and I would gladly do this if the chart wasn’t really complex. This time I’ll be using a basic chart and will be creating a small wiki, using [mediawiki and its chart][14].  

So how do I get this chart? Helm makes that as easy as a pull.

By default, charts are compressed in a .tgz file, but we can unpack that file to customize our wiki by using the **\--untar** flag.


```
$ helm pull stable/mediawiki --untar
$ ls
mediawiki/
$ cd mediawiki/
$ ls
Chart.yaml         README.md          requirements.lock  templates/
OWNERS             charts/            requirements.yaml  values.yaml
```

Now that we have this we can begin customizing the chart.

### Editing your Helm Chart

When the file was untared there was a massive amount of files that came out. While it does look frightening, there really is only one file we should be working with and that's the **values.yaml** file.

Everything that was unpacked was a list of template files that has all the information for the basic application configurations. All the template files actually depend on what is configured in the values.yaml file. Most of these templates and chart files actually are for creating service accounts in the cluster and the various sets of required application configurations that would usually be put together if you were to build this application on a regular server.

But on to the values.yaml file and what we should be changing in it. Open it in your favorite text editor or IDE. We see a [YAML][15] file with a ton of configuration. If we zoom in just on the container image file, we see its repository, registry, and tags amongst other details.


```
## Bitnami DokuWiki image version
## ref: <https://hub.docker.com/r/bitnami/mediawiki/tags/>
##
image:
  registry: docker.io
  repository: bitnami/mediawiki
  tag: 1.34.0-debian-10-r31
  ## Specify a imagePullPolicy
  ## Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'
  ## ref: <http://kubernetes.io/docs/user-guide/images/\#pre-pulling-images>
  ##
  pullPolicy: IfNotPresent
  ## Optionally specify an array of imagePullSecrets.
  ## Secrets must be manually created in the namespace.
  ## ref: <https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/>
  ##
  # pullSecrets:
  #   - myRegistryKeySecretName
```

As you can see in the file each configuration for the values is well-defined. Our pull policy is set to **IfNotPresent**. This means if I run a **helm pull** command, it will not overwrite my existing version. If it’s set to always, the image will default to the latest version of the image on every pull. I’ll be using the default in this case, as in the past I have run into images being broken if it goes to the latest version without me expecting it (remember to version control your software, folks).

### Customizing our Helm Chart

So let’s configure this values file with some basic changes and make it our own. I’ll be changing some naming conventions, the wiki username, and the mediawiki site name. _Note: This is another snippet from values.yaml. All of this customization happens in that one file._


```
## User of the application
## ref: <https://github.com/bitnami/bitnami-docker-mediawiki\#environment-variables>
##
mediawikiUser: cherrybomb

## Application password
## Defaults to a random 10-character alphanumeric string if not set
## ref: <https://github.com/bitnami/bitnami-docker-mediawiki\#environment-variables>
##
# mediawikiPassword:

## Admin email
## ref: <https://github.com/bitnami/bitnami-docker-mediawiki\#environment-variables>
##
mediawikiEmail: [root@example.com][16]

## Name for the wiki
## ref: <https://github.com/bitnami/bitnami-docker-mediawiki\#environment-variables>
##
mediawikiName: Jess's Home of Helm
```

After this, I’ll make some small modifications to our database name and user account. I changed the defaults to "jess" so you can see where changes were made.


```
externalDatabase:
 ## Database host
  host:

  ## Database port
  port: 3306

  ## Database user
  user: jess_mediawiki

  ## Database password
  password:

  ## Database name
  database: jess_mediawiki

##
## MariaDB chart configuration
##
## <https://github.com/helm/charts/blob/master/stable/mariadb/values.yaml>
##
mariadb:
 ## Whether to deploy a mariadb server to satisfy the applications database requirements. To use an external database set this to false and configure the externalDatabase parameters
  enabled: true
  ## Disable MariaDB replication
  replication:
    enabled: false

  ## Create a database and a database user
  ## ref: <https://github.com/bitnami/bitnami-docker-mariadb/blob/master/README.md\#creating-a-database-user-on-first-run>
  ##
  db:
    name: jess_mediawiki
    user: jess_mediawiki
```

And finally, I’ll be adding some ports in our load balancer to allow traffic from the local host. I'm running on minikube and find the **LoadBalancer** option works well.


```
service:
 ## Kubernetes svc type
  ## For minikube, set this to NodePort, elsewhere use LoadBalancer
  ##
  type: LoadBalancer
  ## Use serviceLoadBalancerIP to request a specific static IP,
  ## otherwise leave blank
  ##
  # loadBalancerIP:
  # HTTP Port
  port: 80
  # HTTPS Port
  ## Set this to any value (recommended: 443) to enable the https service port
  # httpsPort: 443
  ## Use nodePorts to requets some specific ports when usin NodePort
  ## nodePorts:
  ##   http: &lt;to set explicitly, choose port between 30000-32767&gt;
  ##   https: &lt;to set explicitly, choose port between 30000-32767&gt;
  ##
  # nodePorts:
  #  http: "30000"
  #  https: "30001"
  ## Enable client source IP preservation
  ## ref <http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/\#preserving-the-client-source-ip>
  ##
  externalTrafficPolicy: Cluster
```

Now that we have made the configurations to allow traffic and create the database, we know that we can go ahead and deploy our chart.

### Deploy and enjoy!

Now that we have our custom version of the wiki, it's time to create a deployment. Before we get into that, let’s first confirm that nothing else is installed with Helm, to make sure my cluster has available resources to run our wiki.


```
$ helm ls
NAME    NAMESPACE       REVISION        UPDATED STATUS  CHART   APP VERSION
```

There are no other deployments through Helm right now, so let's proceed with ours. 


```
$ helm install jesswiki -f values.yaml stable/mediawiki
NAME: jesswiki
LAST DEPLOYED: Thu Mar  5 12:35:31 2020
NAMESPACE: default
STATUS: deployed
REVISION: 2
NOTES:
1\. Get the MediaWiki URL by running:

  NOTE: It may take a few minutes for the LoadBalancer IP to be available.
        Watch the status with: 'kubectl get svc --namespace default -w jesswiki-mediawiki'

  export SERVICE_IP=$(kubectl get svc --namespace default jesswiki-mediawiki --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo "Mediawiki URL: http://$SERVICE_IP/"

2\. Get your MediaWiki login credentials by running:

    echo Username: user
    echo Password: $(kubectl get secret --namespace default jesswiki-mediawiki -o jsonpath="{.data.mediawiki-password}" | base64 --decode)
$
```

Perfect! Now we will navigate to the wiki, which is accessible at the cluster IP address. To confirm that address:


```
kubectl get svc --namespace default -w jesswiki-mediawiki
NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
jesswiki-mediawiki   LoadBalancer   10.103.180.70   &lt;pending&gt;     80:30220/TCP   17s
```

Now that we have the IP, we go ahead and check to see if it’s up: 

![A working wiki installed through helm charts][17]

Now we have our new wiki up and running, and we can enjoy our new application with our personal edits. Use the command from the output above to get the password and start to fill in your wiki.

### Conclusion

Helm is a powerful package manager that makes installing and uninstalling applications on top of Kubernetes as simple as a single command. Charts add to the experience by giving us curated and tested templates to install applications with our unique customizations. Keep exploring what Helm and Charts have to offer and let me know what you do with them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/helm-kubernetes-charts

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://www.google.com/url?q=https://helm.sh/&sa=D&ust=1583425787800000
[3]: https://www.google.com/url?q=https://www.cncf.io/&sa=D&ust=1583425787800000
[4]: https://www.google.com/url?q=https://opensource.com/article/20/2/kubectl-helm-commands&sa=D&ust=1583425787801000
[5]: https://www.google.com/url?q=https://github.com/helm/helm/releases/tag/v3.1.1&sa=D&ust=1583425787801000
[6]: https://www.google.com/url?q=https://github.com/helm/helm&sa=D&ust=1583425787802000
[7]: https://helm.sh/docs/intro/using_helm/
[8]: https://www.google.com/url?q=https://github.com/helm/charts&sa=D&ust=1583425787803000
[9]: https://github.com/helm/charts/blob/master/CONTRIBUTING.md#technical-requirements
[10]: https://www.google.com/url?q=https://hub.helm.sh/&sa=D&ust=1583425787803000
[11]: https://www.google.com/url?q=https://opensource.com/article/20/2/kubectl-helm-commands&sa=D&ust=1583425787803000
[12]: https://www.google.com/url?q=https://opensource.com/article/18/10/getting-started-minikube&sa=D&ust=1583425787804000
[13]: https://www.google.com/url?q=https://opensource.com/article/19/7/security-scanning-your-devops-pipeline&sa=D&ust=1583425787804000
[14]: https://www.google.com/url?q=https://github.com/helm/charts/tree/master/stable/mediawiki&sa=D&ust=1583425787805000
[15]: https://en.wikipedia.org/wiki/YAML
[16]: mailto:root@example.com
[17]: https://opensource.com/sites/default/files/uploads/lookitworked.png (A working wiki installed through helm charts)
