[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to run PostgreSQL on Kubernetes)
[#]: via: (https://opensource.com/article/19/3/how-run-postgresql-kubernetes)
[#]: author: (Jonathan S. Katz https://opensource.com/users/jkatz05)

How to run PostgreSQL on Kubernetes
======
Create uniformly managed, cloud-native production deployments with the
flexibility to deploy a personalized database-as-a-service.
![cubes coming together to create a larger cube][1]

By running a [PostgreSQL][2] database on [Kubernetes][3], you can create uniformly managed, cloud-native production deployments with the flexibility to deploy a personalized database-as-a-service tailored to your specific needs.

Using an Operator allows you to provide additional context to Kubernetes to [manage a stateful application][4]. An Operator is also helpful when using an open source database like PostgreSQL to help with actions including provisioning, scaling, high availability, and user management.

Let's explore how to get PostgreSQL up and running on Kubernetes.

### Set up the PostgreSQL operator

The first step to using PostgreSQL with Kubernetes is installing an Operator. You can get up and running with the open source [Crunchy PostgreSQL Operator][5] on any Kubernetes-based environment with the help of Crunchy's [quickstart script][6] for Linux.

The quickstart script has a few prerequisites:

  * The [Wget][7] utility installed
  * [kubectl][8] installed
  * A [StorageClass][9] defined on your Kubernetes cluster
  * Access to a Kubernetes user account with cluster-admin privileges. This is required to install the Operator [RBAC][10] rules
  * A [namespace][11] to hold the PostgreSQL Operator



Executing the script will give you a default PostgreSQL Operator deployment that assumes [dynamic storage][12] and a StorageClass named **standard**. User-provided values are allowed by the script to override these defaults.

You can download the quickstart script and set it to be executable with the following commands:

```
wget <https://raw.githubusercontent.com/CrunchyData/postgres-operator/master/examples/quickstart.sh>
chmod +x ./quickstart.sh
```

Then you can execute the quickstart script:

```
./examples/quickstart.sh
```

After the script prompts you for some basic information about your Kubernetes cluster, it performs the following operations:

  * Downloads the Operator configuration files
  * Sets the **$HOME/.pgouser** file to default settings
  * Deploys the Operator as a Kubernetes [Deployment][13]
  * Sets your **.bashrc** to include the Operator environmental variables
  * Sets your **$HOME/.bash_completion** file to be the **pgo bash_completion** file



During the quickstart's execution, you'll be prompted to set up the RBAC rules for your Kubernetes cluster. In a separate terminal, execute the command the quickstart command tells you to use.

Once the script completes, you'll get information on setting up a port forward to the PostgreSQL Operator pod. In a separate terminal, execute the port forward; this will allow you to begin executing commands to the PostgreSQL Operator! Try creating a cluster by entering:

```
pgo create cluster mynewcluster
```

You can test that your cluster is up and running with by entering:

```
pgo test mynewcluster
```

You can now manage your PostgreSQL databases in your Kubernetes environment! You can find a full reference to commands, including those for scaling, high availability, backups, and more, in the [documentation][14].

* * *

_Parts of this article are based on[Get Started Running PostgreSQL on Kubernetes][15] that the author wrote for the Crunchy blog._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-run-postgresql-kubernetes

作者：[Jonathan S. Katz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkatz05
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://www.postgresql.org/
[3]: https://kubernetes.io/
[4]: https://opensource.com/article/19/2/scaling-postgresql-kubernetes-operators
[5]: https://github.com/CrunchyData/postgres-operator
[6]: https://crunchydata.github.io/postgres-operator/stable/installation/#quickstart-script
[7]: https://www.gnu.org/software/wget/
[8]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[9]: https://kubernetes.io/docs/concepts/storage/storage-classes/
[10]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
[11]: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
[12]: https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/
[13]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[14]: https://crunchydata.github.io/postgres-operator/stable/#documentation
[15]: https://info.crunchydata.com/blog/get-started-runnning-postgresql-on-kubernetes
