[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to upgrade to Terraform 0.12)
[#]: via: (https://opensource.com/article/20/11/update-terraform)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

How to upgrade to Terraform 0.12
======
Updating your environment to Terraform 0.12 is not for the faint of
heart, but this how-to will make it less painful.
![Green graph of measurements][1]

In [getting started with Terraform][2], I used Terraform version 0.11. As some readers pointed out, this version lacks some significant features, so in this article, I'll explain how to update Terraform to the more feature-rich version 0.12.

You may be surprised to learn that many people still use Terraform 0.11, including large organizations and stubborn users who like to stay on tried-and-true technology. Converting from Terraform 0.11 to 0.12 can be very complex. If you want to take advantage of the newer features but think you're not ready to update, this article should help make the conversion easier.

In this article, I'll use the code from my "getting started" article and the [tfenv][3] tool, which enables you to use different versions of Terraform on the same machine. I'll also assume that you're familiar with two versions of Terraform (the one you're using, and the one you're migrating to), and how to use the `terraform` command in general.

### Code changes needed for version 12

Some things work in Terraform version 0.11 that do not work in version 0.12. Here is an example of code I used in my previous article:


```
resource "kubernetes_namespace" "1-minikube-namespace" {
  metadata {
        name = "my-first-terraform-namespace"
  }
}
```

As one reader pointed out, this code block does not work in version 0.12 due to changes in the way the latest Terraform works. This is a simple example, and it gets more complicated. Here are some examples of how much things may need to change in a production environment.

The new Terraform needs slightly different syntax and structure. For starters, add a `vars.tf` file:


```
variable "namespace" {
  type = "string"
  default = "helloworld"
}

variable "cluster" {
  type = "string"
  default = "minikube"
}
```

Then, change parts of the `main.tf` file to incorporate the new `vars.tf` file. The Kubernetes provider now looks like this:


```
provider "kubernetes" {
  config_context_cluster   = "${var.cluster}"
}
```

Here is the revised namespace resource:


```
resource "kubernetes_namespace" "1-minikube-namespace" {
  metadata {
        name = "${var.namespace}"
  }
}
```

Finally, the changed [Helm provider][4]:


```
provider "helm" {
  kubernetes {
        config_context_cluster   = "${var.cluster}"
  }
}
```

Beware! These small changes will matter when switching between versions.

### Deploy before conversion

Before moving forward, [set up tfenv][5] to use the correct version of Terraform:


```
jess@Athena:~/terraform_doc$ tfenv list
  0.12.29
  0.11.15-oci
jess@Athena:~/terraform_doc$ tfenv use 0.11.15-oci
Switching default version to v0.11.15-oci
Switching completed
jess@Athena:~/terraform_doc$ terraform --version
Terraform v0.11.15-oci
\+ provider.helm v1.2.2
\+ provider.kubernetes v1.11.2

Your version of Terraform is out of date! The latest version
is 0.xx.y. You can update by downloading from [www.terraform.io/downloads.html][6]
```

If you (like me) have done other work with Terraform after using the code in my previous Terraform article, you need to redeploy everything. Set up the Minikube cluster for this Terraform deployment by starting a new, clean cluster:


```
$ minikube delete
🔥  Deleting "minikube" in kvm2 ...
💀  Removed all traces of the "minikube" cluster.
jess@Athena:~/terraform_doc$ minikube start
😄  minikube v1.14.0 on Ubuntu 18.04
```

After the cluster is set up, you can deploy your modified Terraform code. Start with the `init` command:


```
$ terraform init

Initializing provider plugins...

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
should now work. [...]
```

Next, run your plan:


```
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
helm_release.local: Refreshing state... (ID: buildachart)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace) [...]

Terraform will perform the following actions:

  + helm_release.local
        id:                            &lt;computed&gt;
        atomic:                        "false"
        chart:                         "./buildachart"
        cleanup_on_fail:               "false"
        create_namespace:              "false"
        dependency_update:             "false"
        disable_crd_hooks:             "false"
        disable_openapi_validation: "false"
        [...]
  + kubernetes_namespace.1-minikube-namespace
        id:                            &lt;computed&gt;
        metadata.#:                     "1"
        [...]

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Finally, apply the Terraform:


```
$ terraform apply --auto-approve
helm_release.local: Refreshing state... (ID: buildachart)
kubernetes_namespace.1-minikube-namespace: Refreshing state... (ID: my-first-terraform-namespace)
kubernetes_namespace.1-minikube-namespace: Creating...
  metadata.#:                   "" =&gt; "1"
  metadata.0.generation:       "" =&gt; "&lt;computed&gt;"
  [...]
helm_release.local: Creating...
  atomic:                      "" =&gt; "false"
  chart:                       "" =&gt; "./buildachart"
  cleanup_on_fail:             "" =&gt; "false"
  create_namespace:            "" =&gt; "false"
 [...]
  version:                     "" =&gt; "0.1.0"
  wait:                        "" =&gt; "true"
kubernetes_namespace.1-minikube-namespace: Creation complete after 1s (ID: helloworld)
helm_release.local: Still creating... (10s elapsed)
helm_release.local: Creation complete after 13s (ID: buildachart)

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

Now you have a local backup of the Terraform state:


```
$ ls -lrt

drwxr-xr-x 6 jess jess 4096 May 16 14:15 buildachart
-rw-r--r-- 1 jess jess  363 Oct 24 13:06 main.tf
-rw-rw-r-- 1 jess jess  132 Oct 24 13:17 vars.tf
-rw-rw-r-- 1 jess jess 3897 Oct 24 13:20 terraform.tfstate.backup
-rw-rw-r-- 1 jess jess 3821 Oct 24 13:21 terraform.tfstate
```

### Convert from Terraform 0.11 to 0.12

Once everything is deployed using Terraform 0.11, you must work through the conversion process without damaging what you have in your new production cluster. First, change your Terraform version to 0.12 using tfenv:


```
$ tfenv list
  0.12.29
* 0.11.15-oci (set by /home/jess/.tfenv/version)
jess@Athena:~/terraform_doc$ tfenv use 0.12.29
Switching default version to v0.12.29
Switching completed
jess@Athena:~/terraform_doc$ terraform --version
Terraform v0.12.29
\+ provider.helm v1.2.2
\+ provider.kubernetes v1.11.2
```

Now that you're on Terraform 0.12, you're ready to convert. Luckily, Terraform has a built-in command for this, as shown in this snippet from the Terraform command list:


```
All other commands:
        0.12upgrade     Rewrites pre-0.12 module source code for v0.12
```

Test the `upgrade` command to see what will be rewritten, then enter `yes` to do the upgrade:


```
$ terraform 0.12upgrade

This command will rewrite the configuration files in the given directory so
that they use the new syntax features from Terraform v0.12, and will identify
any constructs that may need to be adjusted for correct operation with
Terraform v0.12.
[...]
Would you like to upgrade the module in the current directory?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

\-----------------------------------------------------------------------------

Upgrade complete!

The configuration files were upgraded successfully. Use your version control
system to review the proposed changes, make any necessary adjustments, and
then commit.
```

It seems to have gone well. It may have rewritten some things, but that will not account for everything that needs to be changed with the Terraform files. However, it does a great job of making notes within the files. Here are the changes it made to the `vars.tf` file:


```
variable "namespace" {
  type  = string
  default = "helloworld"
}

variable "cluster" {
  type  = string
  default = "minikube"
}
```

The `type` changed to remove quotes around the word `string` (quoting in Terraform files has changed over time). Next, look at the `main.tf` file:


```
provider "kubernetes" {
  config_context_cluster = var.cluster
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: <https://www.terraform.io/docs/commands/state/mv.html>
resource "kubernetes_namespace" "1-minikube-namespace" {
  metadata {
        name = var.namespace
  }
}

provider "helm" {
  kubernetes {
        config_context_cluster = var.cluster
  }
}

resource "helm_release" "local" {
  name  = "buildachart"
  chart = "./buildachart"
}
```

The quotes changed here, too, and variables are no longer wrapped in `${}` characters. The biggest section is a large TODO note that the conversion command placed in the code to show what needs to change in the resource name to be acceptable in version 0.12. Even better, it explains how to fix this issue and the command you need to run. The other major changes are the new `versions.tf` file and a new backup file:


```
$ ls -lrt
drwxr-xr-x 6 jess jess 4096 May 16 14:15 buildachart
-rw-rw-r-- 1 jess jess 3897 Oct 24 13:20 terraform.tfstate.backup
-rw-r--r-- 1 jess jess   46 Oct 24 13:28 versions.tf
-rw-rw-r-- 1 jess jess  140 Oct 24 13:55 vars.tf
-rw-r--r-- 1 jess jess  369 Oct 24 13:56 main.tf
-rw-rw-r-- 1 jess jess 3821 Oct 24 13:56 terraform.tfstate.1603562212.backup
-rw-rw-r-- 1 jess jess 3827 Oct 24 13:56 terraform.tfstate
```

To update your production cluster, start with a different name that is better suited for this version:


```
resource "kubernetes_namespace" "upgrade-minikube-namespace" {
  metadata {
        name = var.namespace
  }
}
```

#### Smoothing the rough edges

After that change, you must run the `terraform state mv` command (as referenced in the large TODO note). But first, run `state list` to see what you're working with:


```
$ terraform state list
helm_release.local
Kubernetes_namespace.1-minikube-namespace
```

The namespace is still set in the state as `1-minikube-namespace`, and that's the state you need to move. This can be done by ensuring you have the new and old resource names, then running the `terraform state mv` command. But before that, you must switch back to 0.11, using tfenv to make those changes, because this was deployed using Terraform 0.11, and 0.12 doesn't recognize the numbers at the start of the resource name (as the TODO says). You'll have to revert all the code changes the Terraform upgrade made except for the resource name change:

**main.tf**


```
provider "kubernetes" {
  config_context_cluster   = "${var.cluster}"
}

resource "kubernetes_namespace" "upgrade-minikube-namespace" {
  metadata {
        name = "${var.namespace}"
  }
}

provider "helm" {
  kubernetes {
        config_context_cluster   = "${var.cluster}"
  }
}
resource "helm_release" "local" {
  name          = "buildachart"
  chart         = "./buildachart"
}
```

**Vars.tf**


```
variable "namespace" {
  type  = "string"
  default = "helloworld"
}

variable "cluster" {
  type  = "string"
  default = "minikube"
}
```

Once the changes are back in place, switch tfenv back to version 0.11, and run the `state mv` command:


```
$ tfenv use 0.11.15-oci
Switching default version to v0.11.15-oci
Switching completed
jess@Athena:~/terraform_doc$ terraform state mv 'kubernetes_namespace.1-minikube-namespace' 'kubernetes_namespace.upgrade-minikube-namespace'
Moved kubernetes_namespace.1-minikube-namespace to kubernetes_namespace.upgrade-minikube-namespace
```

### Final steps

After this is complete, change tfenv back to version 0.12, and then remove your `versions.tf` file to make sure the conversion completes. If you don't remove this file, you'll get an error message:


```
$ terraform 0.12upgrade
Error: Module already upgraded

  on versions.tf line 3, in terraform:
   3:  required_version = "&gt;= 0.12"

The module in directory . has a version constraint that suggests it has
already been upgraded for v0.12. If this is incorrect, either remove this
constraint or override this heuristic with the -force argument. Upgrading a
module that was already upgraded may change the meaning of that module.
```

Remove the file and run the command:


```
$ terraform 0.12upgrade

This command will rewrite the configuration files in the given directory so
that they use the new syntax features from Terraform v0.12, and will identify
any constructs that may need to be adjusted for correct operation with
Terraform v0.12. [...]

Would you like to upgrade the module in the current directory?
  Enter a value: yes

\-----------------------------------------------------------------------------

Upgrade complete!
```

#### Test the conversion with another deployment

Test your new conversion by re-running your `init`, `plan`, and `apply` commands (I omitted chunks of the output in these snippets):


```
$ terraform init

Initializing the backend...
Initializing provider plugins...
[...]
Terraform has been successfully initialized!

$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

helm_release.local: Refreshing state... [id=buildachart]
kubernetes_namespace.upgrade-minikube-namespace: Refreshing state... [id=helloworld]

\------------------------------------------------------------------------

No changes. Infrastructure is up-to-date

$ terraform apply
helm_release.local: Refreshing state... [id=buildachart]
kubernetes_namespace.upgrade-minikube-namespace: Refreshing state... [id=helloworld]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

As this shows, once everything was preconfigured and the state moved and reapplied during the conversion, no other changes were made because the infrastructure is in place.

### Final thoughts

Code and application upgrades are hard to do, especially in a live production environment. This is very true when converting from Terraform 0.11 to 0.12. I've done this on a large scale, and it involved extensive planning over a two-week timeframe.

If you're going to do this in your production environment, make sure you:

  * Start by removing any resources or modules with prepended numbers.
  * Move the state before running the upgrade.
  * Keep your upgraded Terraform files in a forked repo for safety.



I hope this article helps you move forward more quickly and easily than I did.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/update-terraform

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/article/20/7/terraform-kubernetes
[3]: https://github.com/tfutils/tfenv
[4]: https://opensource.com/article/20/3/helm-kubernetes-charts
[5]: https://opensource.com/article/20/11/tfenv
[6]: http://www.terraform.io/downloads.html
