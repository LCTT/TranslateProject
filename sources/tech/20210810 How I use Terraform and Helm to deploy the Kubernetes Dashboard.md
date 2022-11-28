[#]: subject: "How I use Terraform and Helm to deploy the Kubernetes Dashboard"
[#]: via: "https://opensource.com/article/21/8/terraform-deploy-helm"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use Terraform and Helm to deploy the Kubernetes Dashboard
======
Terraform can deploy Helm Charts. Is it right for you?
![Ship captain sailing the Kubernetes seas][1]

When I'm working on projects that require provisioning cloud infrastructure, my workflow has two disparate components: one is infrastructure orchestration, which includes Terraform to bring up the infrastructure (for instance, new EKS clusters), and the second is the provisioning component, which includes Ansible or Bash scripts to instantiate and initialize that infrastructure to accept new deployments (for instance, installing Cluster Autoscaler, kube-state-metrics, and so on.)

The reason for this is simple: very few tools can cross over and handle both the orchestration and the provisioning side. When I stumbled on the Helm provider for Terraform, I wanted to explore the possibility of using one tool to handle both sides: using Terraform to bring up a new EKS cluster and provision it with Prometheus, Loki, Grafana, Cluster Autoscaler, and others, all in one neat and clean deployment. But that's not happening until I figure out how to use this thing, so below is my experience using Terraform and Helm for something simple: deploying the Kubernetes Dashboard.

### The Helm provider

The Helm provider works like the other cloud providers. You can specify the path of the `KUBECONFIG` or other credentials, run `terraform init`, and the Helm provider gets initialized.

### Deploying the Kubernetes Dashboard

I'm going to use [Minikube for this test][2].

My `main.tf` file contains the following:


```
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my-kubernetes-dashboard" {

  name = "my-kubernetes-dashboard"

  repository = "<https://kubernetes.github.io/dashboard/>"
  chart      = "kubernetes-dashboard"
  namespace  = "default"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "protocolHttp"
    value = "true"
  }

  set {
    name  = "service.externalPort"
    value = 80
  }

  set {
    name  = "replicaCount"
    value = 2
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = "true"
  }
}
```

In the above Terraform, I'm deploying the `kubernetes-dashboard` Chart from `https://kubernetes.github.io/dashboard/` into the namespace `default`. I'm also using the `set` variable to override the Chart's defaults:

  1. `service.type`: I'm changing this to `LoadBalancer` to review my changes locally. Remember to run `minikube tunnel` in a separate window, or this won't work.
  2. `protocolHttp`: I'm deploying the non-secure version to suppress HTTPS warnings on `localhost`.
  3. `service.externalPort`: This needs to be 80 for non-secure.
  4. `replicaCount`: I'm changing this to 2 to see if these changes even work :)
  5. `rbac.clusterReadOnlyRole`: This should be `true` for the Dashboard to have the correct permissions.



### Executing our Terraform

Let's start by initializing Terraform with `terraform init`:


```
Initializing the backend...

Initializing provider plugins...
\- Finding latest version of hashicorp/helm...
\- Installing hashicorp/helm v2.2.0...
\- Installed hashicorp/helm v2.2.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

So far, so good. Terraform successfully initialized the Helm provider. And now for `terraform apply`:


```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # helm_release.my-kubernetes-dashboard will be created
  + resource "helm_release" "my-kubernetes-dashboard" {
      + atomic                     = false
      + chart                      = "kubernetes-dashboard"
      + cleanup_on_fail            = false
      [...]
      + set {
          + name  = "service.type"
          + value = "LoadBalancer"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

helm_release.my-kubernetes-dashboard: Creating...
helm_release.my-kubernetes-dashboard: Still creating... [10s elapsed]
helm_release.my-kubernetes-dashboard: Creation complete after 14s [id=my-kubernetes-dashboard]
```

(Remember to run `minikube tunnel` in another terminal window, otherwise the `apply` won't work).

### Verifying our changes

Let's check if our pods are up using `kubectl get po` and `kubectl get svc`:


```
~ kubectl get po
NAME                                       READY   STATUS    RESTARTS   AGE
my-kubernetes-dashboard-7bc7ccfbd9-56w56   1/1     Running   0          18m
my-kubernetes-dashboard-7bc7ccfbd9-f6jc4   1/1     Running   0          18m

~ kubectl get svc
NAME                      TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)        AGE
kubernetes                ClusterIP      10.96.0.1        &lt;none&gt;           443/TCP        20m
my-kubernetes-dashboard   LoadBalancer   10.104.144.125   10.104.144.125   80:32066/TCP   19m
```

Our pods are deployed, and the load balancer is working. Now check the UI: 

![Kubernetes Workloads dashboard][3]

Figure 2: Kubernetes Workloads dashboard

### Conclusion

You can [find the examples from this article in my Gitlab repo][4].

With Helm provisioning now a part of Terraform, my work life is that much easier. I do realize that the separation between Infrastructure and Provisioning served a different purpose: Infrastructure changes were usually one-off or didn't require frequent updates, maybe a few times when governance or security rules for my org changed. Provisioning changes, on the other hand, frequently occurred, sometimes with every release. So having Terraform (Infrastructure) and Helm Charts (Provisioning) in two different repos with two different tools and two different review workflows made sense. I'm not sure merging them using a single tool is the best idea, but one less tool in the toolchain is always a huge win. I think the pros and cons of this will vary from one project to another and one team to another.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/terraform-deploy-helm

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/18/10/getting-started-minikube
[3]: https://opensource.com/sites/default/files/2021-07-12-terraform-plus-helm-a-match-made-in-heaven-hell-dashboard.png
[4]: https://gitlab.com/ayush-sharma/example-assets/-/tree/main/kubernetes/tf_helm
