translating by lujun9972
Using User Namespaces on Docker
======
User Namespaces is officially added to Docker ver. 1.10, which allows the host system to map its own `uid` and `gid` to some different `uid` and `gid` for containers' processes. This is a big improvement in Docker's security. So I will show an example of the problem that User Namespaces can resolve, and then show how to enable it.

### Creating a Docker Machine

If you already have a docker machine to try out the User Namaspaces, you can skip this step. I'm using Docker Toolbox on my Macbook, so I simply create a Docker Machine on VirutalBox with `docker-machine` command (e.g. hostname=`host1`):
```
# Create host1
$ docker-machine create --driver virtualbox host1

# Login to host1
$ docker-machine ssh host1

```

### Understanding what a non-root user can do if User Namespaces is not enabled

Before setting up User Namespaces, let's see what the problem is. What was actually wrong with Docker? First of all, one of the great benefits on using Docker is that user can have root privilege on containers so that user can easily install software packages. But this is like a double-edged sword in Linux container technology. With some little twist, non-root user can get root access to, for instance, `/etc` of the host system. Here's how to do it.
```
# Run a container and mount host1's /etc onto /root/etc
$ docker run --rm -v /etc:/root/etc -it ubuntu

# Make some change on /root/etc/hosts
root@34ef23438542:/# vi /root/etc/hosts

# Exit from the container
root@34ef23438542:/# exit

# Check /etc/hosts
$ cat /etc/hosts

```

As you can see, it is surprizingly easy, and it's obvious that Docker wasn't designed for shared computers. But now, with the User Namespaces, Docker lets you avoid this problem.

### Enabling User Namespaces
```
# Create a user called "dockremap"
$ sudo adduser dockremap

# Setup subuid and subgid
$ sudo sh -c 'echo dockremap:500000:65536 > /etc/subuid'
$ sudo sh -c 'echo dockremap:500000:65536 > /etc/subgid'

```

And then, open `/etc/init.d/docker`, and add `--userns-remap=default` next to `/usr/local/bin/docker daemon` like this:
```
$ sudo vi /etc/init.d/docker
 :
 :
/usr/local/bin/docker daemon --userns-remap=default -D -g "$DOCKER_DIR" -H unix:// $DOCKER_HOST $EXTRA_ARGS >> "$DOCKER_LOGFILE" 2>&1 &
 :
 :

```

And restart Docker:
```
$ sudo /etc/init.d/docker restart

```

That's all!

**Note:** If you're using CentOS 7, there are two things you need to know.

**1.** User Namespaces is not enabled on the kernel by default. You can enable it by executing the following command and restart the system.
```
sudo grubby --args="user_namespace.enable=1" \
 --update-kernel=/boot/vmlinuz-3.10.0-XXX.XX.X.el7.x86_64

```

**2.** CentOS 7 uses systemctl to manage services, so the file you need to edit is `/usr/lib/systemd/system/docker.service`.

### Checking if User Namespaces is working properly

If everything's set properly, you shouldn't be able to edit host1's `/etc` from a container. So let's check it out.
```
# Create a container and mount host1's /etc to container's /root/etc
$ docker run --rm -v /etc:/root/etc -it ubuntu

# Check the owner of files in /root/etc, which should be "nobody nogroup".
root@d5802c5e670a:/# ls -la /root/etc
total 180
drwxr-xr-x 11 nobody nogroup 1100 Mar 21 23:31 .
drwx------ 3 root root 4096 Mar 21 23:50 ..
lrwxrwxrwx 1 nobody nogroup 19 Mar 21 23:07 acpi -> /usr/local/etc/acpi
-rw-r--r-- 1 nobody nogroup 48 Mar 10 22:09 boot2docker
drwxr-xr-x 2 nobody nogroup 60 Mar 21 23:07 default
 :
 :

# Try creating a file in /root/etc
root@d5802c5e670a:/# touch /root/etc/test
touch: cannot touch '/root/etc/test': Permission denied

# Try deleting a file
root@d5802c5e670a:/# rm /root/etc/hostname
rm: cannot remove '/root/etc/hostname': Permission denied

```

Okay, great. This is how User Namespaces works.

--------------------------------------------------------------------------------

via: https://coderwall.com/p/s_ydlq/using-user-namespaces-on-docker

作者：[Koji Tanaka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://coderwall.com/kjtanaka
