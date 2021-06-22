[#]: subject: (Migrate virtual machines to Kubernetes with this new tool)
[#]: via: (https://opensource.com/article/21/6/migrate-vms-kubernetes-forklift)
[#]: author: (Miguel Perez Colino https://opensource.com/users/mperezco)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Migrate virtual machines to Kubernetes with this new tool
======
Transition your virtualized workloads to Kubernetes with Forklift.
![Containers on a ship on the ocean][1]

In 2017, the [KubeVirt][2] team [launched][3] the project to manage virtual machines (VMs) alongside containers in [Kubernetes][4]. The open source project's intent was to make VMs first-class citizens in this environment.

Since its introduction at [Open Source Summit 2018][5], KubeVirt has continued maturing and growing. It's reached more than 200 stars on GitHub and even introduced its own event, [KubeVirt Summit][6], in February 2021.

![KubeVirt architecture][7]

KubeVirt architecture (© 2020, [Red Hat OpenShift][8])

KubeVirt is the foundation underneath [OpenShift Virtualization][9], which helps developers bring VMs into containerized workflows.

### Leveraging VMs in Kubernetes

KubeVirt enables you to use Kubernetes natives on VMs. This means they can connect to pod networks that are accessible using standard Kubernetes methods, including Service, Route, Pipelines, etc. Network policies apply to VM pods the same way they apply to application pods, providing a consistent model to manage VM-to-pod (and vice-versa) communication.

A real-world example of this is the way an aeronautical company leveraged old simulator software. It injected models with artificial intelligence and machine learning (AI/ML), then automatically deployed and tested them on a VM-based simulator. This allowed it to fully automate obtaining test results and new telemetry training data using Kubernetes and [Kubeflow][10].

![VM-creation workflow][11]

(Konveyor, [CC BY-SA 4.0][12])

[Konveyor.io][13] is an open source project that helps transition existing workloads (development, test, and production) to Kubernetes. Its tools include [Crane][14], to move containers from one Kubernetes platform to another; [Move2Kube][15], to bring workloads from Cloud Foundry to Kubernetes; and [Tackle][16], to analyze Java applications to modernize them by making them more standard and portable for the runtimes available in containerized platforms like Kubernetes.

These tools are useful in transformation patterns, but many projects want to utilize Kubernetes at earlier stages to become more agile and productive. On the infrastructure side, these benefits can include blue/green load balancing, route management, declarative deployments, or (depending on how you deploy) easier upgrades due to immutable infrastructure. On the development side, they may include integrating continuous integration/continuous development (CI/CD) pipelines with the platform, getting apps to production faster, self-provisioning resources, or integrating health checks and monitoring.

KubeVirt can help you by running workloads as VMs in a Kubernetes environment. It enables you to onboard your workloads to Kubernetes quickly, enjoy its benefits, and steadily modernize your workloads over time. But, you still have the issue of bringing your VMs from your traditional virtualization platform to the modern Kubernetes platform. This is where Konveyor's [Forklift][17] project comes in.

### About Forklift

Forklift migrates virtualized workloads from different sources to Kubernetes using KubeVirt. It is designed to make the task simple so that you can migrate anything from one or two machines to hundreds of them.

Migration is a simple, three-stage process:

  1. Connect to an existing virtualization platform (known as a "source provider") and to a Kubernetes environment (a "target provider").
  2. Map network and storage resources from the source provider to the target provider, looking for equivalent resources in both.
  3. Select virtual machines to migrate and assign the network and storage mappings to formulate a migration plan. Then run it.



### How to get started

To get started with Forklift, first, you need a compatible source provider. You also need a Kubernetes environment with KubeVirt 0.40 or newer and bare-metal nodes (although for testing, you can use nested virtualization). Configure your storage classes with read-write-execute (RWX) capabilities, and use [Multus][18] to configure your networks to match the ones your VMs are using in the source provider. (If you can't do this, no worries; you also have the option to rearrange IP addressing.)

Finally, [install Forklift][19] on your Kubernetes using the provided operator, and access the user interface to start running your first test migrations.

Forklift is the upstream version of Red Hat's [Migration Toolkit for Virtualization][20]. Therefore, if you want to use it in a production environment, you may wish to consider using that supported version of the tool.

Happy migrating!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/migrate-vms-kubernetes-forklift

作者：[Miguel Perez Colino][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mperezco
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-1-osdc-lead.png?itok=VEB4zwza (Containers on a ship on the ocean)
[2]: http://kubevirt.io/
[3]: https://kubevirt.io/2017/This-Week-in-Kube-Virt-1.html
[4]: https://opensource.com/resources/what-is-kubernetes
[5]: https://ossna18.sched.com/event/FAOR/kubevirt-cats-and-dogs-living-together-stephen-gordon-red-hat
[6]: https://kubevirt.io/summit/
[7]: https://opensource.com/sites/default/files/uploads/image1_1.png (KubeVirt architecture)
[8]: https://www.openshift.com/learn/topics/virtualization/
[9]: https://openshift.com/virtualization/
[10]: https://www.kubeflow.org/
[11]: https://opensource.com/sites/default/files/uploads/image2_0_6.png (VM-creation workflow)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://www.konveyor.io/
[14]: https://www.konveyor.io/crane
[15]: https://move2kube.konveyor.io/
[16]: https://www.konveyor.io/tackle
[17]: https://www.konveyor.io/forklift
[18]: https://github.com/k8snetworkplumbingwg/multus-cni
[19]: https://www.youtube.com/watch?v=RnoIP3QjHww&t=1693s
[20]: https://access.redhat.com/documentation/en-us/migration_toolkit_for_virtualization/2.0/
