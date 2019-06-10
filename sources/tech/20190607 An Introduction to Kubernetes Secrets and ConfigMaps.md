[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An Introduction to Kubernetes Secrets and ConfigMaps)
[#]: via: (https://opensource.com/article/19/6/introduction-kubernetes-secrets-and-configmaps)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

An Introduction to Kubernetes Secrets and ConfigMaps
======
Kubernetes Secrets and ConfigMaps separate the configuration of
individual container instances from the container image, reducing
overhead and adding flexibility.
![Kubernetes][1]

Kubernetes has two types of objects that can inject configuration data into a container when it starts up: Secrets and ConfigMaps. Secrets and ConfigMaps behave similarly in [Kubernetes][2], both in how they are created and because they can be exposed inside a container as mounted files or volumes or environment variables.

To explore Secrets and ConfigMaps, consider the following scenario:

> You're running the [official MariaDB container image][3] in Kubernetes and must do some configuration to get the container to run. The image requires an environment variable to be set for **MYSQL_ROOT_PASSWORD** , **MYSQL_ALLOW_EMPTY_PASSWORD** , or **MYSQL_RANDOM_ROOT_PASSWORD** to initialize the database. It also allows for extensions to the MySQL configuration file **my.cnf** by placing custom config files in **/etc/mysql/conf.d**.

You could build a custom image, setting the environment variables and copying the configuration files into it to create a bespoke container image. However, it is considered a best practice to create and use generic images and add configuration to the containers created from them, instead. This is a perfect use-case for ConfigMaps and Secrets. The **MYSQL_ROOT_PASSWORD** can be set in a Secret and added to the container as an environment variable, and the configuration files can be stored in a ConfigMap and mounted into the container as a file on startup.

Let's try it out!

### But first: A quick note about Kubectl

Make sure that your version of the **kubectl** client command is the same or newer than the Kubernetes cluster version in use.

An error along the lines of:


```
`error: SchemaError(io.k8s.api.admissionregistration.v1beta1.ServiceReference): invalid object doesn't have additional properties`
```

may mean the client version is too old and needs to be upgraded. The [Kubernetes Documentation for Installing Kubectl][4] has instructions for installing the latest client on various platforms.

If you're using Docker for Mac, it also installs its own version of **kubectl** , and that may be the issue. You can install a current client with **brew install** , replacing the symlink to the client shipped by Docker:


```
$ rm /usr/local/bin/kubectl
$ brew link --overwrite kubernetes-cli
```

The newer **kubectl** client should continue to work with Docker's Kubernetes version.

### Secrets

Secrets are a Kubernetes object intended for storing a small amount of sensitive data. It is worth noting that Secrets are stored base64-encoded within Kubernetes, so they are not wildly secure. Make sure to have appropriate [role-based access controls][5] (RBAC) to protect access to Secrets. Even so, extremely sensitive Secrets data should probably be stored using something like [HashiCorp Vault][6]. For the root password of a MariaDB database, however, base64 encoding is just fine.

#### Create a Secret manually

To create the Secret containing the **MYSQL_ROOT_PASSWORD** , choose a password and convert it to base64:


```
# The root password will be "KubernetesRocks!"
$ echo -n 'KubernetesRocks!' | base64
S3ViZXJuZXRlc1JvY2tzIQ==
```

Make a note of the encoded string. You need it to create the YAML file for the Secret:


```
apiVersion: v1
kind: Secret
metadata:
name: mariadb-root-password
type: Opaque
data:
password: S3ViZXJuZXRlc1JvY2tzIQ==
```

Save that file as **mysql-secret.yaml** and create the Secret in Kubernetes with the **kubectl apply** command:


```
$ kubectl apply -f mysql-secret.yaml
secret/mariadb-root-password created
```

#### View the newly created Secret

Now that you've created the Secret, use **kubectl describe** to see it:


```
$ kubectl describe secret mariadb-root-password
Name: mariadb-root-password
Namespace: secrets-and-configmaps
Labels: <none>
Annotations:
Type: Opaque

Data
====
password: 16 bytes
```

Note that the **Data** field contains the key you set in the YAML: **password**. The value assigned to that key is the password you created, but it is not shown in the output. Instead, the value's size is shown in its place, in this case, 16 bytes.

You can also use the **kubectl edit secret <secretname>** command to view and edit the Secret. If you edit the Secret, you'll see something like this:


```
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1
data:
password: S3ViZXJuZXRlc1JvY2tzIQ==
kind: Secret
metadata:
annotations:
kubectl.kubernetes.io/last-applied-configuration: |
{"apiVersion":"v1","data":{"password":"S3ViZXJuZXRlc1JvY2tzIQ=="},"kind":"Secret","metadata":{"annotations":{},"name":"mariadb-root-password","namespace":"secrets-and-configmaps"},"type":"Opaque"}
creationTimestamp: 2019-05-29T12:06:09Z
name: mariadb-root-password
namespace: secrets-and-configmaps
resourceVersion: "85154772"
selfLink: /api/v1/namespaces/secrets-and-configmaps/secrets/mariadb-root-password
uid: 2542dadb-820a-11e9-ae24-005056a1db05
type: Opaque
```

Again, the **data** field with the **password** key is visible, and this time you can see the base64-encoded Secret.

#### Decode the Secret

Let's say you need to view the Secret in plain text, for example, to verify that the Secret was created with the correct content. You can do this by decoding it.

It is easy to decode the Secret by extracting the value and piping it to base64. In this case, you will use the output format **-o jsonpath= <path>** to extract only the Secret value using a JSONPath template.


```
# Returns the base64 encoded secret string
$ kubectl get secret mariadb-root-password -o jsonpath='{.data.password}'
S3ViZXJuZXRlc1JvY2tzIQ==

# Pipe it to `base64 --decode -` to decode:
$ kubectl get secret mariadb-root-password -o jsonpath='{.data.password}' | base64 --decode -
KubernetesRocks!
```

#### Another way to create Secrets

You can also create Secrets directly using the **kubectl create secret** command. The MariaDB image permits setting up a regular database user with a password by setting the **MYSQL_USER** and **MYSQL_PASSWORD** environment variables. A Secret can hold more than one key/value pair, so you can create a single Secret to hold both strings. As a bonus, by using **kubectl create secret** , you can let Kubernetes mess with base64 so that you don't have to.


```
$ kubectl create secret generic mariadb-user-creds \
\--from-literal=MYSQL_USER=kubeuser\
\--from-literal=MYSQL_PASSWORD=kube-still-rocks
secret/mariadb-user-creds created
```

Note the **\--from-literal** , which sets the key name and the value all in one. You can pass as many **\--from-literal** arguments as you need to create one or more key/value pairs in the Secret.

Validate that the username and password were created and stored correctly with the **kubectl get secrets** command:


```
# Get the username
$ kubectl get secret mariadb-user-creds -o jsonpath='{.data.MYSQL_USER}' | base64 --decode -
kubeuser

# Get the password
$ kubectl get secret mariadb-user-creds -o jsonpath='{.data.MYSQL_PASSWORD}' | base64 --decode -
kube-still-rocks
```

### ConfigMaps

ConfigMaps are similar to Secrets. They can be created and shared in the containers in the same ways. The only big difference between them is the base64-encoding obfuscation. ConfigMaps are intended for non-sensitive data—configuration data—like config files and environment variables and are a great way to create customized running services from generic container images.

#### Create a ConfigMap

ConfigMaps can be created in the same ways as Secrets. You can write a YAML representation of the ConfigMap manually and load it into Kubernetes, or you can use the **kubectl create configmap** command to create it from the command line. The following example creates a ConfigMap using the latter method but, instead of passing literal strings (as with **\--from-literal= <key>=<string>** in the Secret above), it creates a ConfigMap from an existing file—a MySQL config intended for **/etc/mysql/conf.d** in the container. This config file overrides the **max_allowed_packet** setting that MariaDB sets to 16M by default.

First, create a file named **max_allowed_packet.cnf** with the following content:


```
[mysqld]
max_allowed_packet = 64M
```

This will override the default setting in the **my.cnf** file and set **max_allowed_packet** to 64M.

Once the file is created, you can create a ConfigMap named **mariadb-config** using the **kubectl create configmap** command that contains the file:


```
$ kubectl create configmap mariadb-config --from-file=max_allowed_packet.cnf
configmap/mariadb-config created
```

Just like Secrets, ConfigMaps store one or more key/value pairs in their Data hash of the object. By default, using **\--from-file= <filename>** (as above) will store the contents of the file as the value, and the name of the file will be stored as the key. This is convenient from an organization viewpoint. However, the key name can be explicitly set, too. For example, if you used **\--from-file=max-packet=max_allowed_packet.cnf** when you created the ConfigMap, the key would be **max-packet** rather than the file name. If you had multiple files to store in the ConfigMap, you could add each of them with an additional **\--from-file= <filename>** argument.

#### View the new ConfigMap and read the data

As mentioned, ConfigMaps are not meant to store sensitive data, so the data is not encoded when the ConfigMap is created. This makes it easy to view and validate the data and edit it directly.

First, validate that the ConfigMap was, indeed, created:


```
$ kubectl get configmap mariadb-config
NAME DATA AGE
mariadb-config 1 9m
```

The contents of the ConfigMap can be viewed with the **kubectl describe** command. Note that the full contents of the file are visible and that the key name is, in fact, the file name, **max_allowed_packet.cnf**.


```
$ kubectl describe cm mariadb-config
Name: mariadb-config
Namespace: secrets-and-configmaps
Labels: <none>
Annotations: <none>

Data
====
max_allowed_packet.cnf:
\----
[mysqld]
max_allowed_packet = 64M

Events: <none>
```

A ConfigMap can be edited live within Kubernetes with the **kubectl edit** command. Doing so will open a buffer with the default editor showing the contents of the ConfigMap as YAML. When changes are saved, they will immediately be live in Kubernetes. While not really the _best_ practice, it can be handy for testing things in development.

Say you want a **max_allowed_packet** value of 32M instead of the default 16M or the 64M in the **max_allowed_packet.cnf** file. Use **kubectl edit configmap mariadb-config** to edit the value:


```
$ kubectl edit configmap mariadb-config

# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1

data:
max_allowed_packet.cnf: |
[mysqld]
max_allowed_packet = 32M
kind: ConfigMap
metadata:
creationTimestamp: 2019-05-30T12:02:22Z
name: mariadb-config
namespace: secrets-and-configmaps
resourceVersion: "85609912"
selfLink: /api/v1/namespaces/secrets-and-configmaps/configmaps/mariadb-config
uid: c83ccfae-82d2-11e9-832f-005056a1102f
```

After saving the change, verify the data has been updated:


```
# Note the '.' in max_allowed_packet.cnf needs to be escaped
$ kubectl get configmap mariadb-config -o "jsonpath={.data['max_allowed_packet\\.cnf']}"

[mysqld]
max_allowed_packet = 32M
```

### Using Secrets and ConfigMaps

Secrets and ConfigMaps can be mounted as environment variables or as files within a container. For the MariaDB container, you will need to mount the Secrets as environment variables and the ConfigMap as a file. First, though, you need to write a Deployment for MariaDB so that you have something to work with. Create a file named **mariadb-deployment.yaml** with the following:


```
apiVersion: apps/v1
kind: Deployment
metadata:
labels:
app: mariadb
name: mariadb-deployment
spec:
replicas: 1
selector:
matchLabels:
app: mariadb
template:
metadata:
labels:
app: mariadb
spec:
containers:
\- name: mariadb
image: docker.io/mariadb:10.4
ports:
\- containerPort: 3306
protocol: TCP
volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1
volumes:
\- emptyDir: {}
name: mariadb-volume-1
```

This is a bare-bones Kubernetes Deployment of the official MariaDB 10.4 image from Docker Hub. Now, add your Secrets and ConfigMap.

#### Add the Secrets to the Deployment as environment variables

You have two Secrets that need to be added to the Deployment:

  1. **mariadb-root-password** (with one key/value pair)
  2. **mariadb-user-creds** (with two key/value pairs)



For the **mariadb-root-password** Secret, specify the Secret and the key you want by adding an **env** list/array to the container spec in the Deployment and setting the environment variable value to the value of the key in your Secret. In this case, the list contains only a single entry, for the variable **MYSQL_ROOT_PASSWORD**.


```
env:
\- name: MYSQL_ROOT_PASSWORD
valueFrom:
secretKeyRef:
name: mariadb-root-password
key: password
```

Note that the name of the object is the name of the environment variable that is added to the container. The **valueFrom** field defines **secretKeyRef** as the source from which the environment variable will be set; i.e., it will use the value from the **password** key in the **mariadb-root-password** Secret you set earlier.

Add this section to the definition for the **mariadb** container in the **mariadb-deployment.yaml** file. It should look something like this:


```
spec:
containers:
\- name: mariadb
image: docker.io/mariadb:10.4
env:
\- name: MYSQL_ROOT_PASSWORD
valueFrom:
secretKeyRef:
name: mariadb-root-password
key: password
ports:
\- containerPort: 3306
protocol: TCP
volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1
```

In this way, you have explicitly set the variable to the value of a specific key from your Secret. This method can also be used with ConfigMaps by using **configMapRef** instead of **secretKeyRef**.

You can also set environment variables from _all_ key/value pairs in a Secret or ConfigMap to automatically use the key name as the environment variable name and the key's value as the environment variable's value. By using **envFrom** rather than **env** in the container spec, you can set the **MYSQL_USER** and **MYSQL_PASSWORD** from the **mariadb-user-creds** Secret you created earlier, all in one go:


```
envFrom:
\- secretRef:
name: mariadb-user-creds
```

**envFrom** is a list of sources for Kubernetes to take environment variables. Use **secretRef** again, this time to specify **mariadb-user-creds** as the source of the environment variables. That's it! All the keys and values in the Secret will be added as environment variables in the container.

The container spec should now look like this:


```
spec:
containers:
\- name: mariadb
image: docker.io/mariadb:10.4
env:
\- name: MYSQL_ROOT_PASSWORD
valueFrom:
secretKeyRef:
name: mariadb-root-password
key: password
envFrom:
\- secretRef:
name: mariadb-user-creds
ports:
\- containerPort: 3306
protocol: TCP
volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1
```

_Note:_ You could have just added the **mysql-root-password** Secret to the **envFrom** list and let it be parsed as well, as long as the **password** key was named **MYSQL_ROOT_PASSWORD** instead. There is no way to manually specify the environment variable name with **envFrom** as with **env**.

#### Add the max_allowed_packet.cnf file to the Deployment as a volumeMount

As mentioned, both **env** and **envFrom** can be used to share ConfigMap key/value pairs with a container as well. However, in the case of the **mariadb-config** ConfigMap, your entire file is stored as the value to your key, and the file needs to exist in the container's filesystem for MariaDB to be able to use it. Luckily, both Secrets and ConfigMaps can be the source of Kubernetes "volumes" and mounted into the containers instead of using a filesystem or block device as the volume to be mounted.

The **mariadb-deployment.yaml** already has a volume and volumeMount specified, an **emptyDir** (effectively a temporary or ephemeral) volume mounted to **/var/lib/mysql** to store the MariaDB data:


```
<...>

volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1

<...>

volumes:
\- emptyDir: {}
name: mariadb-volume-1

<...>
```

_Note:_ This is not a production configuration. When the Pod restarts, the data in the **emptyDir** volume is lost. This is primarily used for development or when the contents of the volume don't need to be persistent.

You can add your ConfigMap as a source by adding it to the volume list and then adding a volumeMount for it to the container definition:


```
<...>

volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1
\- mountPath: /etc/mysql/conf.d
name: mariadb-config

<...>

volumes:
\- emptyDir: {}
name: mariadb-volume-1
\- configMap:
name: mariadb-config
items:
\- key: max_allowed_packet.cnf
path: max_allowed_packet.cnf
name: mariadb-config-volume

<...>
```

The **volumeMount** is pretty self-explanatory—create a volume mount for the **mariadb-config-volume** (specified in the **volumes** list below it) to the path **/etc/mysql/conf.d**.

Then, in the **volumes** list, **configMap** tells Kubernetes to use the **mariadb-config** ConfigMap, taking the contents of the key **max_allowed_packet.cnf** and mounting it to the path **max_allowed_packed.cnf**. The name of the volume is **mariadb-config-volume** , which was referenced in the **volumeMounts** above.

_Note:_ The **path** from the **configMap** is the name of a file that will contain the contents of the key's value. In this case, your key was a file name, too, but it doesn't have to be. Note also that **items** is a list, so multiple keys can be referenced and their values mounted as files. These files will all be created in the **mountPath** of the **volumeMount** specified above: **/etc/mysql/conf.d**.

### Create a MariaDB instance from the Deployment

At this point, you should have enough to create a MariaDB instance. You have two Secrets, one holding the **MYSQL_ROOT_PASSWORD** and another storing the **MYSQL_USER** , and the **MYSQL_PASSWORD** environment variables to be added to the container. You also have a ConfigMap holding the contents of a MySQL config file that overrides the **max_allowed_packed** value from its default setting.

You also have a **mariadb-deployment.yaml** file that describes a Kubernetes deployment of a Pod with a MariaDB container and adds the Secrets as environment variables and the ConfigMap as a volume-mounted file in the container. It should look like this:


```
apiVersion: apps/v1
kind: Deployment
metadata:
labels:
app: mariadb
name: mariadb-deployment
spec:
replicas: 1
selector:
matchLabels:
app: mariadb
template:
metadata:
labels:
app: mariadb
spec:
containers:
\- image: docker.io/mariadb:10.4
name: mariadb
env:
\- name: MYSQL_ROOT_PASSWORD
valueFrom:
secretKeyRef:
name: mariadb-root-password
key: password
envFrom:
\- secretRef:
name: mariadb-user-creds
ports:
\- containerPort: 3306
protocol: TCP
volumeMounts:
\- mountPath: /var/lib/mysql
name: mariadb-volume-1
\- mountPath: /etc/mysql/conf.d
name: mariadb-config-volume
volumes:
\- emptyDir: {}
name: mariadb-volume-1
\- configMap:
name: mariadb-config
items:
\- key: max_allowed_packet.cnf
path: max_allowed_packet.cnf
name: mariadb-config-volume
```

#### Create the MariaDB instance

Create a new MariaDB instance from the YAML file with the **kubectl create** command:


```
$ kubectl create -f mariadb-deployment.yaml
deployment.apps/mariadb-deployment created
```

Once the deployment has been created, use the **kubectl get** command to view the running MariaDB pod:


```
$ kubectl get pods
NAME READY STATUS RESTARTS AGE
mariadb-deployment-5465c6655c-7jfqm 1/1 Running 0 3m
```

Make a note of the Pod name (in this example, it's **mariadb-deployment-5465c6655c-7jfqm** ). Note that the Pod name will differ from this example.

#### Verify the instance is using the Secrets and ConfigMap

Use the **kubectl exec** command (with your Pod name) to validate that the Secrets and ConfigMaps are in use. For example, check that the environment variables are exposed in the container:


```
$ kubectl exec -it mariadb-deployment-5465c6655c-7jfqm env |grep MYSQL
MYSQL_PASSWORD=kube-still-rocks
MYSQL_USER=kubeuser
MYSQL_ROOT_PASSWORD=KubernetesRocks!
```

Success! All three environment variables—the one using the **env** setup to specify the Secret, and two using **envFrom** to mount all the values from the Secret—are available in the container for MariaDB to use.

Spot check that the **max_allowed_packet.cnf** file was created in **/etc/mysql/conf.d** and that it contains the expected content:


```
$ kubectl exec -it mariadb-deployment-5465c6655c-7jfqm ls /etc/mysql/conf.d
max_allowed_packet.cnf

$ kubectl exec -it mariadb-deployment-5465c6655c-7jfqm cat /etc/mysql/conf.d/max_allowed_packet.cnf
[mysqld]
max_allowed_packet = 32M
```

Finally, validate that MariaDB used the environment variable to set the root user password and read the **max_allowed_packet.cnf** file to set the **max_allowed_packet** configuration variable. Use the **kubectl exec** command again, this time to get a shell inside the running container and use it to run some **mysql** commands:


```
$ kubectl exec -it mariadb-deployment-5465c6655c-7jfqm /
bin/sh

# Check that the root password was set correctly
$ mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e 'show databases;'
+--------------------+
| Database |
+--------------------+
| information_schema |
| mysql |
| performance_schema |
+--------------------+

# Check that the max_allowed_packet.cnf was parsed
$ mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "SHOW VARIABLES LIKE 'max_allowed_packet';"
+--------------------+----------+
| Variable_name | Value |
+--------------------+----------+
| max_allowed_packet | 33554432 |
+--------------------+----------+
```

### Advantages of Secrets and ConfigMaps

This exercise explained how to create Kubernetes Secrets and ConfigMaps and how to use those Secrets and ConfigMaps by adding them as environment variables or files inside of a running container instance. This makes it easy to keep the configuration of individual instances of containers separate from the container image. By separating the configuration data, overhead is reduced to maintaining only a single image for a specific type of instance while retaining the flexibility to create instances with a wide variety of configurations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/introduction-kubernetes-secrets-and-configmaps

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes.png?itok=PqDGb6W7 (Kubernetes)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://hub.docker.com/_/mariadb
[4]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[5]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
[6]: https://www.vaultproject.io/
