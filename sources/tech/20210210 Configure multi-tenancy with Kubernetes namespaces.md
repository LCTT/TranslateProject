[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Configure multi-tenancy with Kubernetes namespaces)
[#]: via: (https://opensource.com/article/21/2/kubernetes-namespaces)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Configure multi-tenancy with Kubernetes namespaces
======
Namespaces provide basic building blocks of access control for
applications, users, or groups of users.
![shapes of people symbols][1]

Most enterprises want a multi-tenancy platform to run their cloud-native applications because it helps manage resources, costs, and operational efficiency and control [cloud waste][2].

[Kubernetes][3] is the leading open source platform for managing containerized workloads and services. It gained this reputation because of its flexibility in allowing operators and developers to establish automation with declarative configuration. But there is a catch: Because Kubernetes grows rapidly, the old problem of velocity becomes an issue. The bigger your adoption, the more issues and resource waste you discover.

### An example of scale

Imagine your company started small with its Kubernetes adoption by deploying a variety of internal applications. It has multiple project streams running with multiple developers dedicated to each project stream.

In a scenario like this, you need to make sure your cluster administrator has full control over the cluster to manage its resources and implement cluster policy and security standards. In a way, the admin is herding the cluster's users to use best practices. A namespace is very useful in this instance because it enables different teams to share a single cluster where computing resources are subdivided into multiple teams.

While namespaces are your first step to Kubernetes multi-tenancy, they are not good enough on their own. There are a number of Kubernetes primitives you need to consider so that you can administer your cluster properly and put it into a production-ready implementation.

The Kubernetes primitives for multi-tenancy are:

  1. **RBAC:** Role-based access control for Kubernetes
  2. **Network policies:** To isolate traffic between namespaces
  3. **Resource quotas:** To control fair access to cluster resources



This article explores how to use Kubernetes namespaces and some basic RBAC configurations to partition a single Kubernetes cluster and take advantage of this built-in Kubernetes tooling.

### What is a Kubernetes namespace?

Before digging into how to use namespaces to prepare your Kubernetes cluster to become multi-tenant-ready, you need to know what namespaces are.

A [namespace][4] is a Kubernetes object that partitions a Kubernetes cluster into multiple virtual clusters. This is done with the aid of [Kubernetes names and IDs][5]. Namespaces use the Kubernetes name object, which means that each object inside a namespace gets a unique name and ID across the cluster to allow virtual partitioning.

### How namespaces help in multi-tenancy

Namespaces are one of the Kubernetes primitives you can use to partition your cluster into multiple virtual clusters to allow multi-tenancy. Each namespace is isolated from every other user's, team's, or application's namespace. This isolation is essential in multi-tenancy so that updates and changes in applications, users, and teams are contained within the specific namespace. (Note that namespace does not provide network segmentation.)

Before moving ahead, verify the default namespace in a working Kubernetes cluster:


```
[root@master ~]# kubectl get namespace
NAME              STATUS   AGE
default           Active   3d
kube-node-lease   Active   3d
kube-public       Active   3d
kube-system       Active   3d
```

Then create your first namespace, called **test**:


```
[root@master ~]# kubectl create namespace test
namespace/test created
```

Verify the newly created namespace:


```
[root@master ~]# kubectl get namespace
NAME              STATUS   AGE
default           Active   3d
kube-node-lease   Active   3d
kube-public       Active   3d
kube-system       Active   3d
test              Active   10s
[root@master ~]#
```

Describe the newly created namespace:


```
[root@master ~]# kubectl describe namespace test
Name:         test
Labels:       <none>
Annotations:  <none>
Status:       Active
No resource quota.
No LimitRange resource.
```

To delete a namespace:


```
[root@master ~]# kubectl delete namespace test
namespace "test" deleted
```

Your new namespace is active, but it doesn't have any labels, annotations, or quota-limit ranges defined. However, now that you know how to create and describe and delete a namespace, I'll show how you can use a namespace to virtually partition a Kubernetes cluster.

### Partitioning clusters using namespace and RBAC

Deploy the following simple application to learn how to partition a cluster using namespace and isolate an application and its related objects from "other" users.

First, verify the namespace you will use. For simplicity, use the **test** namespace you created above:


```
[root@master ~]# kubectl get namespaces
NAME              STATUS   AGE
default           Active   3d
kube-node-lease   Active   3d
kube-public       Active   3d
kube-system       Active   3d
test              Active   3h
```

Then deploy a simple application called **test-app** inside the test namespace by using the following configuration:


```
apiVersion: v1
kind: Pod
metadata:
  name: test-app                 ⇒ name of the application
  namespace: test                ⇒ the namespace where the app runs
  labels:
     app: test-app                      ⇒ labels for the app
spec:
  containers:
  - name: test-app
    image: nginx:1.14.2         ⇒ the image we used for the app.
    ports:
    - containerPort: 80
```

Deploy it:


```
$ kubectl create -f test-app.yaml
    pod/test-app created
```

Then verify the application pod was created:


```
$ kubectl get pods -n test
  NAME       READY   STATUS    RESTARTS   AGE
  test-app   1/1     Running   0          18s
```

Now that the running application is inside the **test** namespace, test a use case where:

  * **auth-user** can edit and view all the objects inside the test namespace
  * **un-auth-user** can only view the namespace



I pre-created the users for you to test. If you want to know how I created the users inside Kubernetes, view the commands [here][6].


```
$ kubectl config view -o jsonpath='{.users[*].name}'
  auth-user
  kubernetes-admin
  un-auth-user
```

With this set up, create a Kubernetes [Role and RoleBindings][7] to isolate the target namespace **test** to allow **auth-user** to view and edit objects inside the namespace and not allow **un-auth-user** to access or view the objects inside the **test** namespace.

Start by creating a ClusterRole and a Role. These objects are a list of verbs (action) permitted on specific resources and namespaces.

Create a ClusterRole:


```
$ cat clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: list-deployments
  namespace: test
rules:
  - apiGroups: [ apps ]
    resources: [ deployments ]
    verbs: [ get, list ]
```

Create a Role:


```
$ cat role.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: Role
metadata:
  name: list-deployments
  namespace: test
rules:
  - apiGroups: [ apps ]
    resources: [ deployments ]
    verbs: [ get, list ]
```

Apply the Role:


```
$ kubectl create -f role.yaml
roles.rbac.authorization.k8s.io "list-deployments" created
```

Use the same command to create a ClusterRole:


```
$ kubectl create -f clusterrole.yaml

$ kubectl get role -n test
  NAME               CREATED AT
  list-deployments   2021-01-18T00:54:00Z
```

Verify the Roles:


```
$ kubectl describe roles -n test
  Name:         list-deployments
  Labels:       <none>
  Annotations:  <none>
  PolicyRule:
    Resources         Non-Resource URLs  Resource Names  Verbs
    ---------         -----------------  --------------  -----
    deployments.apps  []                 []              [get list]
```

Remember that you must create RoleBindings by namespace, not by user. This means you need to create two role bindings for user **auth-user**.

Here are the sample RoleBinding YAML files to permit **auth-user** to edit and view.

**To edit:**


```
$ cat rolebinding-auth-edit.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: auth-user-edit
  namespace: test
subjects:
\- kind: User
  name: auth-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: edit
  apiGroup: rbac.authorization.k8s.io
```

**To view:**


```
$ cat rolebinding-auth-view.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: auth-user-view
  namespace: test
subjects:
\- kind: User
  name: auth-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: view
  apiGroup: rbac.authorization.k8s.io
```

Create these YAML files:


```
$ kubectl create rolebinding-auth-view.yaml
$ kubectl create rolebinding-auth-edit.yaml
```

Verify if the RoleBindings were successfully created:


```
$ kubectl get rolebindings -n test
NAME             ROLE               AGE
auth-user-edit   ClusterRole/edit   48m
auth-user-view   ClusterRole/view   47m
```

With the requirements set up, test the cluster partitioning:


```
[root@master]$ sudo su un-auth-user
[un-auth-user@master ~]$ kubect get pods -n test
[un-auth-user@master ~]$ kubectl get pods -n test
Error from server (Forbidden): pods is forbidden: User "un-auth-user" cannot list resource "pods" in API group "" in the namespace "test"
```

Log in as **auth-user**:


```
[root@master ]# sudo su auth-user
[auth-user@master auth-user]$ kubectl get pods -n test
NAME       READY   STATUS    RESTARTS   AGE
test-app   1/1     Running   0          3h8m
[auth-user@master un-auth-user]$

[auth-user@master auth-user]$ kubectl edit pods/test-app -n test
Edit cancelled, no changes made.
```

You can view and edit the objects inside the **test** namespace. How about viewing the cluster nodes?


```
[auth-user@master auth-user]$ kubectl get nodes
Error from server (Forbidden): nodes is forbidden: User "auth-user" cannot list resource "nodes" in API group "" at the cluster scope
[auth-user@master auth-user]$
```

You can't because the role bindings for user **auth-user** dictate they have access to view or edit objects only inside the **test** namespace.

### Enable access control with namespaces

Namespaces provide basic building blocks of access control using RBAC and isolation for applications, users, or groups of users. But using namespaces alone as your multi-tenancy solution is not enough in an enterprise implementation. It is recommended that you use other Kubernetes multi-tenancy primitives to attain further isolation and implement proper security.

Namespaces can provide some basic isolation in your Kubernetes cluster; therefore, it is important to consider them upfront, especially when planning a multi-tenant cluster. Namespaces also allow you to logically segregate and assign resources to individual users, teams, or applications.

By using namespaces, you can increase resource efficiencies by enabling a single cluster to be used for a diverse set of workloads.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/kubernetes-namespaces

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Open%20Pharma.png?itok=GP7zqNZE (shapes of people symbols)
[2]: https://devops.com/the-cloud-is-booming-but-so-is-cloud-waste/
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
[5]: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/
[6]: https://www.adaltas.com/en/2019/08/07/users-rbac-kubernetes/
[7]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
