An introduction to Ansible Operators in Kubernetes
======
The new Operator SDK makes it easy to create a Kubernetes controller to deploy and manage a service or application in a cluster.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_barnraising_2.png?itok=JOBMbjTM)

For years, Ansible has been a go-to choice for infrastructure automation. As Kubernetes adoption has skyrocketed, Ansible has continued to shine in the emerging container orchestration ecosystem.

Ansible fits naturally into a Kubernetes workflow, using YAML to describe the desired state of the world. Multiple projects, including the [Automation Broker][1], are adapting Ansible for use behind specific APIs. This article will focus on a new technique, created through a joint effort by the Ansible core team and the developers of Automation Broker, that uses Ansible to create Operators with minimal effort.

### What is an Operator?

An [Operator][2] is a Kubernetes controller that deploys and manages a service or application in a cluster. It automates human operation knowledge and best practices to keep services running and healthy. Input is received in the form of a custom resource. Let's walk through that using a Memcached Operator as an example.

The [Memcached Operator][3] can be deployed as a service running in a cluster, and it includes a custom resource definition (CRD) for a resource called Memcached. The end user creates an instance of that custom resource to describe how the Memcached Deployment should look. The following example requests a Deployment with three Pods.

```
apiVersion: "cache.example.com/v1alpha1"
kind: "Memcached"
metadata:
  name: "example-memcached"
spec:
  size: 3
```

The Operator's job is called reconciliation—continuously ensuring that what is specified in the "spec" matches the real state of the world. This sample Operator delegates Pod management to a Deployment controller. So while it does not directly create or delete Pods, if you change the size, the Operator's reconciliation loop ensures that the new value is applied to the Deployment resource it created.

A mature Operator can deploy, upgrade, back up, repair, scale, and reconfigure an application that it manages. As you can see, not only does an Operator provide a simple way to deploy arbitrary services using only native Kubernetes APIs; it enables full day-two (post-deployment, such as updates, backups, etc.) management, limited only by what you can code.

### Creating an Operator

The [Operator SDK][4] makes it easy to get started. It lays down the skeleton of a new Operator with many of the complex pieces already handled. You can focus on defining your custom resources and coding the reconciliation logic in Go. The SDK saves you a lot of time and ongoing maintenance burden, but you will still end up owning a substantial software project.

Ansible was recently introduced to the Operator SDK as an even simpler way to make an Operator, with no coding required. To create an Operator, you merely:

  * Create a CRD in the form of YAML
  * Define what reconciliation should do by creating an Ansible role or playbook



It's YAML all the way down—a familiar experience for Kubernetes users.

### How does it work?

There is a preexisting Ansible Operator base container image that includes Ansible, [ansible-runner][5], and the Operator's executable service. The SDK helps to build a layer on top that adds one or more CRDs and associates each with an Ansible role or playbook.

When it's running, the Operator uses a Kubernetes feature to "watch" for changes to any resource of the type defined. Upon receiving such a notification, it reconciles the resource that changed. The Operator runs the corresponding role or playbook, and information about the resource is passed to Ansible as [extra-vars][6].

### Using Ansible with Kubernetes

Following several iterations, the Ansible community has produced a remarkably easy-to-use module for working with Kubernetes. Especially if you have any experience with a Kubernetes module prior to Ansible 2.6, you owe it to yourself to have a look at the [k8s module][7]. Creating, retrieving, and updating resources is a natural experience that will feel familiar to any Kubernetes user. It makes creating an Operator that much easier.

### Give it a try

If you need to build a Kubernetes Operator, doing so with Ansible could save time and complexity. To learn more, head over to the Operator SDK documentation and work through the [Getting Started Guide][8] for Ansible-based Operators. Then join us on the [Operator Framework mailing list][9] and let us know what you think.

Michael Hrivnak will present [Automating Multi-Service Deployments on Kubernetes][10] at [LISA18][11], October 29-31 in Nashville, Tennessee, USA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/ansible-operators-kubernetes

作者：[Michael Hrivnak][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhrivnak
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/2/automated-provisioning-kubernetes
[2]: https://coreos.com/operators/
[3]: https://github.com/operator-framework/operator-sdk-samples/tree/master/memcached-operator
[4]: https://github.com/operator-framework/operator-sdk/
[5]: https://github.com/ansible/ansible-runner
[6]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#passing-variables-on-the-command-line
[7]: https://docs.ansible.com/ansible/2.6/modules/k8s_module.html
[8]: https://github.com/operator-framework/operator-sdk/blob/master/doc/ansible/user-guide.md
[9]: https://groups.google.com/forum/#!forum/operator-framework
[10]: https://www.usenix.org/conference/lisa18/presentation/hrivnak
[11]: https://www.usenix.org/conference/lisa18
