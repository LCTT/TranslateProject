[#]: subject: "Auto-updating podman containers with systemd"
[#]: via: "https://fedoramagazine.org/auto-updating-podman-containers-with-systemd/"
[#]: author: "Daniel Schier https://fedoramagazine.org/author/danielwtd/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Auto-updating podman containers with systemd
======

![][1]

Auto-Updating containers can be very useful in some cases. Podman provides mechanisms to take care of container updates automatically. This article demonstrates how to use Podman Auto-Updates for your setups.

### Podman

Podman is a daemonless Docker replacement that can handle rootfull and rootless containers. It is fully aware of SELinux and Firewalld. Furthermore, it comes pre-installed with Fedora Linux so you can start using it right away.

If Podman is not installed on your machine, use one of the following commands to install it. Select the appropriate command for your environment.

```
# Fedora Workstation / Server / Spins
$ sudo dnf install -y podman

# Fedora Silverblue, IoT, CoreOS
$ rpm-ostree install podman
```

Podman is also available for many other Linux distributions like CentOS, Debian or Ubuntu. Please have a look at the [Podman Install Instructions][2].

### Auto-Updating Containers

Updating the Operating System on a regular basis is somewhat mandatory to get the newest features, bug fixes, and security updates. But what about containers? These are not part of the Operating System.

#### Why Auto-Updating?

If you want to update your Operating System, it can be as easy as:

```
$ sudo dnf update
```

This will not take care of the deployed containers. But why should you take care of these? If you check the content of containers, you will find the application (for example MariaDB in the docker.io/library/mariadb container) and some dependencies, including basic utilities.

Running updates for containers can be tedious and time-consuming, since you have to:

  1. pull the new image
  2. stop and remove the running container
  3. start the container with the new image



This procedure must be done for every container. Updating 10 containers can easily end up taking 30-40 commands that must be run.

Automating these steps will save time and ensure, that everything is up-to-date.

#### Podman and systemd

Podman has built-in support for systemd. This means you can start/stop/restart containers via systemd without the need of a separate daemon. The Podman Auto-Update feature requires you to have containers running via systemd. This is the only way to automatically ensure that all desired containers are running properly. Some articles like these for [Bitwarden][3] and [Matrix Server][4] already had a look at this feature. For this article, I will use an even simpler [Apache httpd][5] container.

First, start the container with the desired settings.

```
# Run httpd container with some custom settings
$ sudo podman container run -d -t -p 80:80 --name web -v web-volume:/usr/local/apache2/htdocs/:Z docker.io/library/httpd:2.4

# Just a quick check of the container
$ sudo podman container ls
CONTAINER ID  IMAGE                        COMMAND           CREATED        STATUS            PORTS               NAMES
58e5b07febdf  docker.io/library/httpd:2.4  httpd-foreground  4 seconds ago  Up 5 seconds ago  0.0.0.0:80->80/tcp  web

# Also check the named volume
$ sudo podman volume ls
DRIVER      VOLUME NAME
local       web-volume
```

Now, set up systemd to handle the deployment. Podman will generated the necessary file.

```
# Generate systemd service file
$ sudo podman generate systemd --new --name --files web

/home/USER/container-web.service
```

This will generate the file _container-web service_ in your current directory. Review and edit the file to your liking. Here is the file contents with added newlines and formatting to improve readability.

```
# container-web.service

[Unit]
Description=Podman container-web.service
Documentation=man:podman-generate-systemd(1)
Wants=network.target
After=network-online.target
RequiresMountsFor=%t/containers

[Service]
Environment=PODMAN_SYSTEMD_UNIT=%n
Restart=on-failure
TimeoutStopSec=70
ExecStartPre=/bin/rm -f %t/container-web.pid %t/container-web.ctr-id

ExecStart=/usr/bin/podman container run \
          --conmon-pidfile %t/container-web.pid \
          --cidfile %t/container-web.ctr-id \
          --cgroups=no-conmon \
          --replace \
          -d \
          -t \
          -p 80:80 \
          --name web \
          -v web-volume:/usr/local/apache2/htdocs/ \
          docker.io/library/httpd:2.4

ExecStop=/usr/bin/podman container stop \
          --ignore \
          --cidfile %t/container-web.ctr-id \
          -t 10

ExecStopPost=/usr/bin/podman container rm \
          --ignore \
          -f \
          --cidfile %t/container-web.ctr-id

PIDFile=%t/container-web.pid
Type=forking

[Install]
WantedBy=multi-user.target default.target
```

Now, remove the current container, copy the file to the proper systemd directory, and start/enable the service.

```
# Remove the temporary container
$ sudo podman container rm -f web

# Copy the service file
$ sudo cp container-web.service /etc/systemd/system/container-web.service

# Reload systemd
$ sudo systemctl daemon-reload

# Enable and start the service
$ sudo systemctl enable --now container-web

# Another quick check
$ sudo podman container ls
$ sudo systemctl status container-web
```

Please be aware, that the container can now only be managed via systemd. Starting and stopping the container with the “podman” command may interfere with systemd.

Now that the general setup is out of the way, have a look at auto-updating this container.

#### Manual Auto-Updates

The first thing to look at is manual auto-updates. Sounds weird? This feature allows you to avoid the 3 steps per container, but you will have full control over the update time and date. This is very useful if you only want to update containers in a maintenance window or on the weekend.

Edit the _/etc/systemd/system_/_container-web.service_ file and add the label shown below to it.

```
--label "io.containers.autoupdate=registry"
```

The changed file will have a section appearing like this:

```
...snip...

ExecStart=/usr/bin/podman container run \
          --conmon-pidfile %t/container-web.pid \
          --cidfile %t/container-web.ctr-id \
          --cgroups=no-conmon \
          --replace \
          -d \
          -t \
          -p 80:80 \
          --name web \
          -v web-volume:/usr/local/apache2/htdocs/ \
          --label "io.containers.autoupdate=registry" \
          docker.io/library/httpd:2.4

...snip...
```

Now reload systemd and restart the container service to apply the changes.

```
# Reload systemd
$ sudo systemctl daemon-reload

# Restart container-web service
$ sudo systemctl restart container-web
```

After this setup you can run a simple command to update a running instance to the latest available image for the used tag. In this example case, if a new 2.4 image is available in the registry, Podman will download the image and restart the container automatically with a single command.

```
# Update containers
$ sudo podman auto-update
```

#### Scheduled Auto-Updates

Podman also provides a systemd timer unit that enables container updates on a schedule. This can be very useful if you don’t want to handle the updates on your own. If you are running a small home server, this might be the right thing for you, so you are getting the latest updates every week or so.

Enable the systemd timer for podman as follows:

```
# Enable podman auto update timer unit
$ sudo systemctl enable --now podman-auto-update.timer

Created symlink /etc/systemd/system/timers.target.wants/podman-auto-update.timer → /usr/lib/systemd/system/podman-auto-update.timer.
```

Optionally, you can edit the schedule of the timer. By default, the update will run every Monday morning, which is ok for me. Edit the timer module using this command:

```
$ sudo systemctl edit podman-auto-update.timer
```

This will bring up your default editor. Changing the schedule is beyond the scope of this article but the link to _systemd.timer_ below will help. The Demo section of [Systemd Timers for Scheduling Tasks][6] contains details as well.

That’s it. Nothing more to do. Podman will now take care of image updates and also prune old images on a schedule.

### Hints &amp; Tips

Auto-Updating seems like the perfect solution for container updates, but you should consider some things, before doing so.

  * avoid using the “latest” tag, since it can include major updates
  * consider using tags like “2” or “2.4”, if the image provider has them
  * test auto-updates beforehand (does the container support updates without additional steps?)
  * consider having backups of your Podman volumes, in case something goes sideways
  * auto-updates might not be very useful for highly productive setups, where you need full control over the image version in use
  * updating a container also restarts the container and prunes the old image
  * occasionally check if the updates are being applied



If you take care of the above hints, you should be good to go.

### Docs &amp; Links

If you want to learn more about this topic, please check out the links below. There is a lot of useful information in the official documentation and some blogs.

  * <https://docs.podman.io/en/latest/markdown/podman-auto-update.1.html>
  * <https://docs.podman.io/en/latest/markdown/podman-generate-systemd.1.html>
  * <https://www.freedesktop.org/software/systemd/man/systemd.service.html>
  * <https://www.freedesktop.org/software/systemd/man/systemd.timer.html>
  * [Systemd Timers for Scheduling Tasks][6]



### Conclusion

As you can see, without the use of additional tools, you can easily run auto-updates on Podman containers manually or on a schedule. Scheduling allows unattended updates overnight, and you will get all the latest security updates, features, and bug fixes. Some setups I have tested successfully are: MariaDB, Ghost Blog, WordPress, Gitea, Redis, and PostgreSQL.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/auto-updating-podman-containers-with-systemd/

作者：[Daniel Schier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/danielwtd/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/auto-updating-podman-containers-816x345.jpg
[2]: https://podman.io/getting-started/installation
[3]: https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/
[4]: https://fedoramagazine.org/deploy-your-own-matrix-server-on-fedora-coreos/
[5]: https://hub.docker.com/_/httpd
[6]: https://fedoramagazine.org/systemd-timers-for-scheduling-tasks/
