[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to Terraform for Kubernetes beginners)
[#]: via: (https://opensource.com/article/20/7/terraform-kubernetes)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

A guide to Terraform for Kubernetes beginners
======
Learn how to make a Minikube cluster and deploy to it with Terraform.
![A person programming][1]

When I build infrastructure, I do it as code. The movement toward [infrastructure as code][2] means that every change is visible, whether it's through configuration management files or full-blown [GitOps][3].

[Terraform][4] is a tool for building, upgrading, and maintaining your infrastructure as code. As its [GitHub page][5] explains:

> "Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open source tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned."

The best part is you can import your existing infrastructure into a Terraform configuration state, and all future changes will be tracked. That tracking provides a complete understanding of your production environment (and any other environments), which can be backed up to a local or remote Git repository to version-control the entire infrastructure.

In this article, I will explain how to use Terraform to manage state in a Minikube Kubernetes cluster.

### Prerequisites

Terraform is cloud-agnostic, so you can run about any type of Kubernetes cluster in any cloud by using the associated providers. A [provider][6] is the core of Terraform's plugin architecture, and each provider is "responsible for understanding API interactions and exposing resources" so that the main Terraform project can remain lean, but the project can expand to any system.

In this example, I'll use [Terraform 11][7] on a Linux desktop. To follow along, you will also need [Helm 2.16.7][8], [Minikube][9], and [kubectl][10]:

  * Download and configure Minikube by following this [documentation][11].
  * Download and configure Helm [using your package manager][12] or do it manually from the [releases][13].
  * Download and install kubectl by following [these steps][10].
  * Install Terraform by downloading the [Linux .tar file][14], untar the file, and move it to `/usr/local/bin/terraform`.



Before running a build, find out what the command-line utility offers. Run `terraform`, and the output will show the execution plan and apply commands. At the bottom, there is an upgrade checklist that will come in handy if you are on an older version of Terraform. The developers have built in a great command to check compatibility between versions.

### Getting started

To build something in Terraform, you need to create [modules][15], which are folders with a set of configuration files that can gather information and execute the action you need to complete. Terraform files always end in the file extension `.tf`. Start with one `main.tf` file, such as:


```
`jess@Athena:~/terraform_doc$ touch main.tf`
```

You also need to know some basic Terraform commands and requirements before you can start making anything within the cluster:

  * `terraform init`: Initializes a Terraform working directory
– It must be within the same directory as the `.tf` files or nothing will happen.
  * `terraform validate`: Confirms the Terraform file's syntax is correct
– Always run this to confirm the code is built correctly and will not have errors.
  * `terraform plan`: Generates and shows what will change when you run `terraform apply`
– Run this before `apply` to confirm the results are as you intend.
  * `terraform apply`: Builds or changes infrastructure
– It will show the execution plan and requires a yes or no to execute unless you use the `--auto-approve` flag, which will make it execute automatically.
  * `Terraform refresh`: Updates the local state file against real resources
– This ensures Terraform has an accurate view of what is in the current environment.
  * `terraform destroy`: Deletes and removes Terraform-managed infrastructure
– This will permanently remove anything created and stored in the state file from the cluster.



For the configuration in this example, everything controlled by Terraform is held in a local state file. According to Terraform's [docs][16]:

> "This state is stored by default in a local file named `terraform.tfstate`, but it can also be stored remotely, which works better in a team environment. Terraform uses this local state to create plans and make changes to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure."

Now that you have this background information, you can move on and edit your `main.tf` file, check your cluster, and work towards adding configurations with Terraform.

### Prep and build Minikube

Before getting started with Terraform, you must create a Minikube cluster. This example uses Minikube version v1.9.2. Run `minikube start`:


```
jess@Athena:~/terraform_doc$ minikube start
🎉  minikube 1.11.0 is available! Download it: <https://github.com/kubernetes/minikube/releases/tag/v1.11.0>
💡  To disable this notice, run: 'minikube config set WantUpdateNotification false'

🙄  minikube v1.9.2 on Ubuntu 18.04
✨  Using the kvm2 driver based on existing profile
👍  Starting control plane node m01 in cluster minikube
🔄  Restarting existing kvm2 VM for "minikube" ...
🐳  Preparing Kubernetes v1.18.0 on Docker 19.03.8 ...
🌟  Enabling addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube"
```

### Check your new cluster and add a namespace

Check your new Minikube cluster with your trusty `kubectl` commands:


```
jess@Athena:~/terraform_doc$ kubectl get nodes
NAME    STATUS   ROLES  AGE     VERSION
minikube   Ready        master   4m5s   v1.18.0
```

The cluster is up and running, so add configurations to your `main.tf` file. First, you'll need a [provider][6], which "is responsible for understanding API interactions and exposing resources." The provider in this example will be (aptly) named [Kubernetes][17]. Edit your `main.tf` file and add the provider:


```
provider "kubernetes" {
  config_context_cluster   = "minikube"
}
```

This syntax tells Terraform that the cluster is running in Minikube.

Now you will need a definition of a resource block. A resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.

Add one Kubernetes namespace to the cluster:


```
resource "kubernetes_namespace" "1-minikube-namespace" {
  metadata {
        name = "my-first-terraform-namespace"
  }
}
```

Next, run the `terraform init` command to check your provider version and initialize Terraform:


```
jess@Athena:~/terraform_doc$ terraform init

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.kubernetes: version = "~&gt; 1.11"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Run your plan to see what will be executed:


```
jess@Athena:~/terraform_doc$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

\------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 + create

Terraform will perform the following actions:

  + kubernetes_namespace.1-minikube-namespace
        id:                            &lt;computed&gt;
        metadata.#:                     "1"
        metadata.0.generation:         &lt;computed&gt;
        metadata.0.name:               "my-first-terraform-namespace"
        metadata.0.resource_version: &lt;computed&gt;
        metadata.0.self_link:          &lt;computed&gt;
        metadata.0.uid:                &lt;computed&gt;

Plan: 1 to add, 0 to change, 0 to destroy.

\------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Now that you know what Terraform will do, apply your configuration:


```
jess@Athena:~/terraform_doc$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 + create

Terraform will perform the following actions:

  + kubernetes_namespace.1-minikube-namespace
        id:                            &lt;computed&gt;
        metadata.#:                     "1"
        metadata.0.generation:         &lt;computed&gt;
        metadata.0.name:               "my-first-terraform-namespace"
        metadata.0.resource_version: &lt;computed&gt;
        metadata.0.self_link:          &lt;computed&gt;
        metadata.0.uid:                &lt;computed&gt;

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

\-----------------------------------

kubernetes_namespace.1-minikube-namespace: Creating...
  metadata.#:                   "" =&gt; "1"
  metadata.0.generation:       "" =&gt; "&lt;computed&gt;"
  metadata.0.name:             "" =&gt; "my-first-terraform-namespace"
  metadata.0.resource_version: "" =&gt; "&lt;computed&gt;"
  metadata.0.self_link:        "" =&gt; "&lt;computed&gt;"
  metadata.0.uid:              "" =&gt; "&lt;computed&gt;"
kubernetes_namespace.1-minikube-namespace: Creation complete after 0s (ID: my-first-terraform-namespace)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Finally, confirm that your new namespace exists by running `kubectl get ns`:


```
jess@Athena:~/terraform_doc$ kubectl get ns
NAME                            STATUS   AGE
default                         Active   28d
kube-node-lease                 Active   28d
kube-public                     Active   28d
kube-system                     Active   28d
my-first-terraform-namespace   Active   2m19s
```

### Run it through a Helm chart

The ability to manually write a Terraform configuration file, run it, and see results in Kubernetes is nice. What's even nicer? Being able to rerun the same commands through a Helm chart.

Run the `helm create <name>` command to generate a chart:


```
$ helm create buildachart
Creating buildachart
```

You need another provider block for this exercise. There is a specific Helm provider, and it requires a Kubernetes cluster name so that Helm knows where to install its chart. Add the new provider, which is shown below, to your existing `main.tf` file:


```
provider "helm" {
  kubernetes {
        config_context_cluster   = "minikube"
       
  }
}
```

Now that Helm is configured, you need to add a Helm chart for this terraform module to install. To keep things simple, keep the Helm chart in the same folder you're using for your Terraform state:


```
jess@Athena:~/terraform_doc$ ls
buildachart  main.tf  terraform.tfstate
```

Add the new Helm resource so that the chart can be installed and tracked through your Terraform state by using the `helm_release` resource. I named this resource `local` and imported my chart name and my chart location:


```
resource "helm_release" "local" {
  name          = "buildachart"
  chart         = "./buildachart"
}
```

Now that you've added these pieces, run Terraform's initialization command again. It will update the state based on your changes, including downloading a new provider:


```
jess@Athena:~/terraform_doc$ terraform init

Initializing provider plugins...
\- Checking for available provider plugins on <https://releases.hashicorp.com>...
\- Downloading plugin for provider "helm" (1.2.2)...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.helm: version = "~&gt; 1.2"
* provider.kubernetes: version = "~&gt; 1.11"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Then plan your new configurations:


```
jess@Athena:~/terraform_doc$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace)

\------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + helm_release.local
        id:                             &lt;computed&gt;
        atomic:                         "false"
        chart:                          "./buildachart"
        cleanup_on_fail:                "false"
        create_namespace:               "false"
        dependency_update:              "false"
        disable_crd_hooks:              "false"
        disable_openapi_validation: "false"
        disable_webhooks:               "false"
        force_update:                   "false"
        lint:                           "false"
        max_history:                    "0"
        metadata.#:                     &lt;computed&gt;
        name:                           "buildachart"
        namespace:                      "default"
        recreate_pods:                  "false"
        render_subchart_notes:          "true"
        replace:                        "false"
        reset_values:                   "false"
        reuse_values:                   "false"
        skip_crds:                      "false"
        status:                         "deployed"
        timeout:                        "300"
        verify:                         "false"
        version:                        "0.1.0"
        wait:                           "true"

Plan: 1 to add, 0 to change, 0 to destroy.

\------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Apply your configuration, only this time add the `--auto-approve` flag so it will execute without confirmation:


```
jess@Athena:~/terraform_doc$ terraform apply --auto-approve
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace)
helm_release.local: Creating...
  atomic:                      "" =&gt; "false"
  chart:                       "" =&gt; "./buildachart"
  cleanup_on_fail:             "" =&gt; "false"
  create_namespace:            "" =&gt; "false"
  dependency_update:           "" =&gt; "false"
  disable_crd_hooks:           "" =&gt; "false"
  disable_openapi_validation: "" =&gt; "false"
  disable_webhooks:            "" =&gt; "false"
  force_update:                "" =&gt; "false"
  lint:                        "" =&gt; "false"
  max_history:                 "" =&gt; "0"
  metadata.#:                   "" =&gt; "&lt;computed&gt;"
  name:                        "" =&gt; "buildachart"
  namespace:                   "" =&gt; "default"
  recreate_pods:               "" =&gt; "false"
  render_subchart_notes:       "" =&gt; "true"
  replace:                     "" =&gt; "false"
  reset_values:                "" =&gt; "false"
  reuse_values:                "" =&gt; "false"
  skip_crds:                   "" =&gt; "false"
  status:                      "" =&gt; "deployed"
  timeout:                     "" =&gt; "300"
  verify:                      "" =&gt; "false"
  version:                     "" =&gt; "0.1.0"
  wait:                        "" =&gt; "true"
helm_release.local: Creation complete after 8s (ID: buildachart)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Although it says the chart deployed, it's always nice to double-check and confirm that the new Helm chart is in place. Check to see if your pod made it by using a `kubectl` command:


```
jess@Athena:~/terraform_doc$ kubectl get pods
NAME                            READY   STATUS  RESTARTS   AGE
buildachart-68c86ccf5f-lchc5   1/1      Running   0             43s
```

This confirms your pod is running, which means your chart deployed! You also have a new backup state file:


```
jess@Athena:~/terraform_doc$ ls
buildachart  main.tf  terraform.tfstate  terraform.tfstate.backup
```

Terraform is protective of state, which is a great feature. It automatically generates a previous-state file after each update. This allows version control of your infrastructure, and you can always save the current and most recent state. Since this is a local build, stick with the current and previous states without version control.

### Rollback a change and import something

As you run Terraform commands, the backup state file is generated and updated, which means you can roll back previous changes exactly once unless you are holding state files in storage somewhere else (e.g., a database) with other configurations to manage the files.

In this example, you need to roll back your Helm chart deployment. Why? Well, because you can.

Before you do anything, take a minute to run the `terraform refresh` command to see if there is anything different between the cluster and the current state:


```
jess@Athena:~/terraform_doc$ terraform refresh
helm_release.local: Refreshing state... (ID: buildachart)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace)
```

There is a weird workaround to roll back changes: You can overwrite your state file with the backup file, or you can comment the code changes you rolled out through Terraform files and allow Terraform to destroy them.

In this example, I'll comment-out code and rerun Terraform, so the Helm chart will be deleted. Comments begin with `//` in Terraform files:


```
jess@Athena:~/terraform_doc$ cat main.tf
provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_namespace" "1-minikube-namespace" {
  metadata {
        name = "my-first-terraform-namespace"
  }
}

//provider "helm" {
//  kubernetes {
//      config_context_cluster   = "minikube"
//  }
//}
//resource "helm_release" "local" {
//  name        = "buildachart"
//  chart       = "./buildachart"
//}
```

After you comment everything out, run `terraform apply`:


```
jess@Athena:~/terraform_doc$ terraform apply
helm_release.local: Refreshing state... (ID: buildachart)
null_resource.minikube: Refreshing state... (ID: 4797320155365789412)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-terraform-namespace)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 - destroy

Terraform will perform the following actions:

  - helm_release.local

Plan: 0 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

helm_release.local: Destroying... (ID: buildachart)
helm_release.local: Destruction complete after 0s

Apply complete! Resources: 0 added, 0 changed, 1 destroyed.
```

To see what overwriting the file looks like, reapply the Helm chart and overwrite the state file. Here is a snippet of the chart being recreated (this text output can be pretty long):


```
helm_release.local: Still creating... (10s elapsed)
helm_release.local: Creation complete after 15s (ID: buildachart)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Here’s the file overwrite and the plan showing that the helm chart needs to be rerun.
jess@Athena:~/terraform_doc$ cp terraform.tfstate.backup terraform.tfstate
jess@Athena:~/terraform_doc$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

null_resource.minikube: Refreshing state... (ID: 4797320155365789412)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-terraform-namespace)

\------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 + create

Terraform will perform the following actions:

  + helm_release.local
        id:                            &lt;computed&gt;
        atomic:                        "false"
        chart:                         "./buildachart"
        cleanup_on_fail:               "false"
        create_namespace:              "false"
        dependency_update:             "false"
        disable_crd_hooks:             "false"
        disable_openapi_validation: "false"
        disable_webhooks:              "false"
        force_update:                  "false"
        max_history:                   "0"
        metadata.#:                     &lt;computed&gt;
        name:                          "buildachart"
        namespace:                     "default"
        recreate_pods:                 "false"
        render_subchart_notes:         "true"
        replace:                       "false"
        reset_values:                  "false"
        reuse_values:                  "false"
        skip_crds:                     "false"
        status:                        "deployed"
        timeout:                       "300"
        verify:                        "false"
        version:                       "0.1.0"
        wait:                          "true"

Plan: 1 to add, 0 to change, 0 to destroy.

\------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Be aware that you will run into a problem if you do not clean up the environment when overwriting your state files. That problem shows up in the name usage:


```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

helm_release.local: Creating...
  atomic:                      "" =&gt; "false"
  chart:                       "" =&gt; "./buildachart"
  cleanup_on_fail:             "" =&gt; "false"
  create_namespace:            "" =&gt; "false"
  dependency_update:           "" =&gt; "false"
  disable_crd_hooks:           "" =&gt; "false"
  disable_openapi_validation: "" =&gt; "false"
  disable_webhooks:            "" =&gt; "false"
  force_update:                "" =&gt; "false"
  max_history:                 "" =&gt; "0"
  metadata.#:                   "" =&gt; "&lt;computed&gt;"
  name:                        "" =&gt; "buildachart"
  namespace:                   "" =&gt; "default"
  recreate_pods:               "" =&gt; "false"
  render_subchart_notes:       "" =&gt; "true"
  replace:                     "" =&gt; "false"
  reset_values:                "" =&gt; "false"
  reuse_values:                "" =&gt; "false"
  skip_crds:                   "" =&gt; "false"
  status:                      "" =&gt; "deployed"
  timeout:                     "" =&gt; "300"
  verify:                      "" =&gt; "false"
  version:                     "" =&gt; "0.1.0"
  wait:                        "" =&gt; "true"

Error: Error applying plan:

1 error occurred:
    * helm_release.local: 1 error occurred:
    * helm_release.local: cannot re-use a name that is still in use

Terraform does not automatically rollback in the face of errors.
Instead, your Terraform state file has been partially updated with
any resources that successfully completed. Please address the error
above and apply again to incrementally change your infrastructure.
```

This creates a reuse issue due to commenting out and bringing back a resource. To fix this, do a state import, which allows you to take something that is already out in the environment and let Terraform start to track it again.

For this, you need the namespace and chart name you want to import along with the module name you are importing. The module in this case is `helm.local`, and it is generated from your resource code in the resource that begins with `"helm_release" "local"`.

For the reimport, you will need the namespace where the resource is currently deployed, so the import will look like `default/buildachart`. This format is required for anything involving a namespace:


```
jess@Athena:~/terraform_doc$ terraform import helm_release.local default/buildachart
helm_release.local: Importing from ID "default/buildachart"...
helm_release.local: Import complete!
  Imported helm_release (ID: buildachart)
helm_release.local: Refreshing state... (ID: buildachart)

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

This process of reimporting can be tricky, but it's important for state management.

### Clean up

What's so nice about Terraform is that you can quickly clean up after yourself when you're testing. The `follow` command is another great way to ruin your day if you aren't careful about where you run it:


```
jess@Athena:~/terraform_doc$ terraform destroy
helm_release.local: Refreshing state... (ID: buildachart)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 - destroy

Terraform will perform the following actions:

  - helm_release.local
  - kubernetes_namespace.1-minikube-namespace

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

helm_release.local: Destroying... (ID: buildachart)
kubernetes_namespace.1-minikube-namespace: Destroying... (ID: my-first-terraform-namespace)
helm_release.local: Destruction complete after 1s
kubernetes_namespace.1-minikube-namespace: Destruction complete after 7s

Destroy complete! Resources: 2 destroyed.
```

One run of `terraform destroy` removed your pods and namespace, but your cluster remains. You are back to square one:


```
jess@Athena:~/terraform_doc$ kubectl get pods
No resources found in default namespace.

jess@Athena:~/terraform_doc$ kubectl get ns
NAME            STATUS   AGE
default         Active   28d
kube-node-lease   Active   28d
kube-public     Active   28d
kube-system     Active   28d

jess@Athena:~/terraform_doc$ minikube status
m01
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### Final notes

To say you can make anything with Terraform is an understatement. It's a tool that can manage every aspect of environment creation and destruction. It has a powerful and simple concept of state management that can allow teams to stay in sync with the organization's intended infrastructure.

However, if you are not careful, this tool can be rather unforgiving. If you are moving state files and not paying attention, you can cause a bit of an issue with what Terraform believes it needs to manage. When you are using this tool, be careful not to overextend yourself or write too much at once, as you can code yourself into a corner if you aren't paying attention.

Terraform is best when it's used for infrastructure provisioning. It minimizes what problems happen when managing state, and allows tools designed for configuration and deployment to complement its features.

What have you done with Terraform and Kubernetes? Share your experience in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/terraform-kubernetes

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://opensource.com/article/19/7/infrastructure-code
[3]: https://thenewstack.io/what-is-gitops-and-why-it-might-be-the-next-big-thing-for-devops/
[4]: https://www.terraform.io/
[5]: https://github.com/hashicorp/terraform
[6]: https://www.terraform.io/docs/providers/index.html
[7]: https://releases.hashicorp.com/terraform/0.11.14/
[8]: https://github.com/helm/helm/releases/tag/v2.16.7
[9]: https://opensource.com/article/18/10/getting-started-minikube
[10]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[11]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[12]: https://github.com/helm/helm#install
[13]: https://github.com/helm/helm/releases
[14]: https://releases.hashicorp.com/terraform/
[15]: https://www.terraform.io/docs/configuration/modules.html
[16]: https://www.terraform.io/docs/state/index.html
[17]: https://registry.terraform.io/providers/hashicorp/kubernetes
