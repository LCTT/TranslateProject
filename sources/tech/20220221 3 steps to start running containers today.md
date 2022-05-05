[#]: subject: "3 steps to start running containers today"
[#]: via: "https://opensource.com/article/22/2/start-running-containers"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 steps to start running containers today
======
In this tutorial, you will learn how to run two containers in a pod to
host a WordPress site.
![Shipping containers stacked][1]

Whether you're interested in them as part of your job, for future job opportunities, or just out of interest in new technology, containers can seem pretty overwhelming to even an experienced systems administrator. So how do you actually get started with containers? And what's the path from containers to [Kubernetes][2]? Also, why is there a path from one to the other at all? As you might expect, the best place to start is the beginning.

### 1\. Understanding containers

On second thought, starting at the beginning arguably dates back to early BSD and their special chroot jails, so skip ahead to the middle instead.

Not so very long ago, the Linux kernel introduced _cgroups_, which enables you to "tag" processes with something called a _namespace_. When you group processes together into a namespace, those processes act as if nothing outside that namespace exists. It's as if you've put those processes into a sort of container. Of course, the container is virtual, and it exists inside your computer. It runs on the same kernel, RAM, and CPU that the rest of your operating system is running on, but you've contained the processes.

Pre-made containers get distributed with just what's necessary to run the application it contains. With a container engine, like [Podman][3], Docker, or CRI-O, you can run a containerized application without installing it in any traditional sense. Container engines are often cross-platform, so even though containers run Linux, you can launch containers on Linux, macOS, or Windows.

More importantly, you can run more than one container of the same application when there's high demand for it.

Now that you know what a container is. The next step is to run one.

**[ Get the cheat sheet: [What’s the difference between a pod, a cluster, and a container?][4] ]**

### 2\. Run a container

Before running a container, you should have a reason for running a container. You can make up a reason, but it's helpful for that reason to interest you, so you're inspired actually to use the container you run. After all, running a container but never using the application it provides only proves that you're not noticing any failures, but using the container demonstrates that it works.

I recommend WordPress as a start. It's a popular web application that's easy to use, so you can test drive the app once you've got the container running. While you can easily set up a WordPress container, there are many configuration options, which can lead you to discover more container options (like running a database container) and how containers communicate.

I use Podman, which is a friendly, convenient, and daemonless container engine. If you don't have Podman available, you can use the Docker command instead. Both are great open source container engines, and their syntax is identical (just type `docker` instead of `podman`). Because Podman doesn't run a daemon, it requires more setup than Docker, but the ability to run rootless daemonless containers is worth it.

If you're going with Docker, you can skip down to the [WordPress subheading][5]. Otherwise, open a terminal to install and configure Podman:


```
`$ sudo dnf install podman`
```

Containers spawn many processes, and normally only the root user has permission to create thousands of process IDs. Add some extra process IDs to your user by creating a file called `/etc/subuid` and defining a suitably high start UID with a suitable large number of permitted PIDs:


```
`seth:200000:165536`
```

Do the same for your group in a file called `/etc/subgid`. In this example, my primary group is `staff` (it may be `users` for you, or the same as your username, depending on how you've configured your system.)


```
`staff:200000:165536`
```

Finally, confirm that your user is also permitted to manage thousands of namespaces:


```


$ sysctl --all --pattern user_namespaces
user.max_user_namespaces = 28633

```

If your user doesn't have permission to manage at least 28,000 namespaces, increase the number by creating the file `/etc/sysctl.d/userns.conf` and enter:


```
`user.max_user_namespaces=28633`
```

#### Running WordPress as a container

Now, whether you're using Podman or Docker, you can pull a WordPress container from a container registry online and run it. You can do all this with a single Podman command:


```


$ podman run --name mypress \
-p 8080:80 -d wordpress

```

Give Podman a few moments to find the container, copy it from the internet, and start it up.

Start a web browser once you get a terminal prompt back and navigate to `localhost:8080`. WordPress is running, waiting for you to set it up.

![WordPress running in a container][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

It doesn't take long to reach your next hurdle, though. WordPress uses a database to keep track of data, so you need to provide it with a database where it can store its information.

Before continuing, stop and remove the WordPress container:


```


$ podman stop mypress
$ podman rm mypress

```

### 3\. Run containers in a pod

Containers are, by design and, as their name suggests, self-contained. An application running in a container isn't supposed to interact with applications or infrastructure outside of its container. So when one container requires another container to function, one solution is to put those two containers inside a bigger container called a _pod_. A pod ensures that its containers can share important namespaces to communicate with one another.

Create a new pod, providing a name for the pod and which ports you want to be able to access:


```


$ podman pod create \
\--name wp_pod \
\--publish 8080:80

```

Confirm that the pod exists:


```


$ podman pod list
POD ID        NAME     STATUS    INFRA ID      # OF CONTAINERS
100e138a29bd  wp_pod   Created   22ace92df3ef   1

```

#### Add a container to a pod

Now that you have a pod for your interdependent containers, you launch each container by specifying a pod for it to run in.

First, launch a database. You can make up your own credentials as long as you use those same credentials when connecting to the database from WordPress.


```


$ podman run --detach \
\--pod wp_pod \
\--restart=always \
-e MYSQL_ROOT_PASSWORD="badpassword0" \
-e MYSQL_DATABASE="wp_db" \
-e MYSQL_USER="tux" \
-e MYSQL_PASSWORD="badpassword1" \
\--name=wp_db mariadb

```

Next, launch the WordPress container into the same pod:


```


$ podman run --detach \
\--restart=always --pod=wp_pod \
-e WORDPRESS_DB_NAME="wp_db" \
-e WORDPRESS_DB_USER="tux" \
-e WORDPRESS_DB_PASSWORD="badpassword1" \
-e WORDPRESS_DB_HOST="127.0.0.1" \
\--name mypress wordpress

```

Now launch your favorite web browser and navigate to `localhost:8080`.

This time, the setup goes as expected. WordPress connects to the database because you've passed those environment variables while launching the container.

![WordPress setup][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

After you've created a user account, you can log in to see the WordPress dashboard.

![WordPress dashboard running in a container][9]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Next steps

You've created two containers, and you've run them in a pod. You know enough now to run services in containers on your own server. If you want to move to the cloud, containers are, of course, well-suited for that. With tools like Kubernetes and OpenShift, you can automate the process of launching [containers and pods on a cluster][10]. If you're thinking about taking the next step, read [3 ways to get started with Kubernetes][11] by Kevin Casey, and give the Minikube tutorial he mentions a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/start-running-containers

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers.png?itok=d_4QhZxT (Shipping containers stacked)
[2]: https://opensource.com/tags/kubernetes
[3]: https://www.redhat.com/sysadmin/podman-guides-2020
[4]: https://enterprisersproject.com/cheat-sheet-what-s-difference-between-pod-cluster-and-container
[5]: tmp.1zBHYsK8TH#wp
[6]: https://opensource.com/sites/default/files/uploads/podman-wordpress.jpg (WordPress running in a container)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/wordpress-setup.jpg (WordPress setup)
[9]: https://opensource.com/sites/default/files/uploads/wordpress-welcome.jpg (WordPress dashboard running in a container)
[10]: https://enterprisersproject.com/article/2020/9/pod-cluster-container-what-is-difference
[11]: https://enterprisersproject.com/article/2019/11/kubernetes-3-ways-get-started
