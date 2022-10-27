[#]: subject: "Deploy Quarkus applications to Kubernetes using a Helm chart"
[#]: via: "https://opensource.com/article/21/10/quarkus-helm-chart"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Deploy Quarkus applications to Kubernetes using a Helm chart
======
A developer's guide to serverless function deployment with Quarkus Helm
chart.
![Ships at sea on the web][1]

Serverless functions are driving the fast adoption of DevOps development and deployment practices today. [Knative][2] on [Kubernetes][3] is one of the most popular serverless platforms to adopt serverless function architectures successfully. But developers must understand how serverless capabilities are specified using a combination of Kubernetes APIs, Knative resources, and function-oriented programming. DevOps teams also need to standardize runtime stacks (that is, application runtime, builder image, deployment configuration, and health check) to execute the functions on Kubernetes. What if you, a developer, could set this up with familiar technology and practice?

This article guides you on the way developers can get started with serverless function deployment with the [Quarkus][4] [Helm][5] chart on Kubernetes. Furthermore, developers can avoid the extra work of developing a function from scratch, optimizing the application, and deploying it to Kubernetes.

If you haven't experienced using Helm for cloud-native application deployments on Kubernetes, I will tell you what Helm is and what benefits you have with it. Helm is one of the most popular package managers for Kubernetes. Helm provides a chart that simplifies Kubernetes resources within a single package file for an application build and deployment. Developers can install the chart to Kubernetes using the Helm command-line interface or graphical dashboard.

### Install Quarkus Helm chart

In this article, you'll use [OpenShift Kubernetes Distribution][6] (OKD) built on Kubernetes with application lifecycle management functionality and DevOps tooling. If you haven't installed the Helm feature on your OKD cluster yet, follow the [installation document][7].

Before building a Quarkus application using a Quarkus Helm chart, you need to create pull and push secrets in your OKD cluster. You use the secrets to pull a builder image from an external container registry and then push it to the registry. 

**Note:** You can skip this step if you don't need to use an external container registry during application build or deploy the application to the OKD cluster.

Create a pull secret using the following [oc command][8]:


```
$ oc create secret docker-registry my-pull-secret \
\--docker-server=$SERVER_URL \
\--docker-username=$USERNAME \
\--docker-password=$PASSWORD \
\--docker-email=$EMAIL
```

Then, create a push secret using the following command:


```
$ oc create secret docker-registry my-push-secret \
\--docker-server=$SERVER_URL \
\--docker-username=$USERNAME \
\--docker-password=$PASSWORD \
\--docker-email=$EMAIL
```

Install the Quarkus Helm chart:


```
$ helm repo add quarkus \
<https://github.com/redhat-developer/redhat-helm-charts>
```

### Build and deploy Quarkus application using Helm chart

Go to the **Developer** console in the OKD cluster, click on Helm chart in **+Add** menu. Then type in _quarkus_ in the search box. Click on the **Quarkus v0.0.3** helm chart, as shown below.

**Note:** You'll need to create a _quarkus-helm project_ (namespace) to install a Quarkus Helm chart in your OKD cluster.

![Search Quarkus Helm chart][9]

(Daniel Oh, [CC BY-SA 4.0][10])

Click on **Install Helm Chart**, as shown below.

![Install Helm chart][11]

(Daniel Oh, [CC BY-SA 4.0][10])

Switch the editor to **YAML** view, then paste the following build and deploy configurations:


```
build:
  uri: <https://github.com/redhat-mw-demos/todo-demo-app.git>
  ref: master
  env:
    - name: S2I_SOURCE_DEPLOYMENTS_FILTER
      value: "*-runner.jar lib*"
deploy:
  readinessProbe:
    httpGet:
      path: /health/ready
      port: http
    tcpSocket: null
  livenessProbe:
    httpGet:
      path: /health/live
      port: http
    tcpSocket: null
```

Then, click on the **Install** button, as shown below.

![YAML editor][12]

(Daniel Oh, [CC BY-SA 4.0][10])

Find more values to configure the Quarkus helm chart [here][13].

Once the chart gets installed successfully, you'll see the following Quarkus pod in the Topology view, as shown below.

![Topology view][14]

(Daniel Oh, [CC BY-SA 4.0][10])

**Note:** You might see _ErrImagePull_ and _ImagePullBackOff_ in **Deployments** while the build is processing. Once the build completes, your image gets automatically rolled out.

Click on the **Open URL** icon. It brings you to the **todos** application. Let's try to add a few items for fun, as shown below.

![Todos applications][15]

(Daniel Oh, [CC BY-SA 4.0][10])

### Conclusion

You've learned the way developers can build Quarkus applications and deploy them to Kubernetes/OpenShift cluster in a few minutes using a Helm chart. The developers can manage the application runtime stack in terms of upgrade, rollback, uninstall, and add new configurations such as application health check, replication without changing the application source code or developing new Kubernetes manifestos with YAML files. This minimizes developers' burden to keep leveraging application runtimes other than implementing business logic on Kubernetes. For more information to follow on Quarkus journey here:

  * [A Java developer's guide to Quarkus][16]
  * [3 reasons Quarkus 2.0 improves developer productivity on Linux][17]
  * [Optimize Java serverless functions in Kubernetes][18]



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/quarkus-helm-chart

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://knative.dev/docs/
[3]: https://opensource.com/article/19/6/reasons-kubernetes
[4]: https://quarkus.io/
[5]: https://helm.sh/
[6]: https://www.okd.io/
[7]: https://docs.okd.io/latest/applications/working_with_helm_charts/installing-helm.html
[8]: https://docs.okd.io/latest/cli_reference/openshift_cli/getting-started-cli.html
[9]: https://opensource.com/sites/default/files/uploads/search-quarkus-helm-chart.png (Search Quarkus Helm chart)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/uploads/install-hel-chart.png (Install Helm chart)
[12]: https://opensource.com/sites/default/files/uploads/yaml-editor.png (YAML editor)
[13]: https://github.com/redhat-developer/redhat-helm-charts/tree/master/alpha/quarkus-chart#values
[14]: https://opensource.com/sites/default/files/uploads/topology-view.png (Topology view)
[15]: https://opensource.com/sites/default/files/uploads/todos-applications.png (Todos applications)
[16]: https://opensource.com/article/21/8/java-quarkus-ebook
[17]: https://opensource.com/article/21/7/developer-productivity-linux
[18]: https://opensource.com/article/21/6/java-serverless-functions-kubernetes
