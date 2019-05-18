[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use udica to build SELinux policy for containers)
[#]: via: (https://fedoramagazine.org/use-udica-to-build-selinux-policy-for-containers/)
[#]: author: (Lukas Vrabec https://fedoramagazine.org/author/lvrabec/)

Use udica to build SELinux policy for containers
======

![][1]

While modern IT environments move towards Linux containers, the need to secure these environments is as relevant as ever. Containers are a process isolation technology. While containers can be a defense mechanism, they only excel when combined with SELinux.

Fedora SELinux engineering built a new standalone tool, **udica** , to generate SELinux policy profiles for containers by automatically inspecting them. This article focuses on why _udica_ is needed in the container world, and how it makes SELinux and containers work better together. You’ll find examples of SELinux separation for containers that let you avoid turning protection off because the generic SELinux type _container_t_ is too tight. With _udica_ you can easily customize the policy with limited SELinux policy writing skills.

### SELinux technology

SELinux is a security technology that brings proactive security to Linux systems. It’s a labeling system that assigns a label to all _subjects_ (processes and users) and _objects_ (files, directories, sockets, etc.). These labels are then used in a security policy that controls access throughout the system. It’s important to mention that what’s not allowed in an SELinux security policy is denied by default. The policy rules are enforced by the kernel. This security technology has been in use on Fedora for several years. A real example of such a rule is:

```
allow httpd_t httpd_log_t: file { append create getattr ioctl lock open read setattr };
```

The rule allows any process labeled as _httpd_t_ ****to create, append, read and lock files labeled as _httpd_log_t_. Using the _ps_ command, you can list all processes with their labels:

```
$ ps -efZ | grep httpd
system_u:system_r:httpd_t:s0    root     13911     1  0 Apr14 ?       00:05:14 /usr/sbin/httpd -DFOREGROUND
...
```

To see which objects are labeled as httpd_log_t, use _semanage_ :

```
# semanage fcontext -l | grep httpd_log_t
/var/log/httpd(/.)?                               all files          system_u:object_r:httpd_log_t:s0
/var/log/nginx(/.)?                               all files          system_u:object_r:httpd_log_t:s0
...
```

The SELinux security policy for Fedora is shipped in the _selinux-policy_ RPM package.

### SELinux vs. containers

In Fedora, the _container-selinux_ RPM package provides a generic SELinux policy for all containers started by engines like _podman_ or _docker_. Its main purposes are to protect the host system against a container process, and to separate containers from each other. For instance, containers confined by SELinux with the process type _container_t_ can only read/execute files in _/usr_ and write to _container_file_t_ ****files type on host file system. To prevent attacks by containers on each other, Multi-Category Security (MCS) is used.

Using only one generic policy for containers is problematic, because of the huge variety of container usage. On one hand, the default container type ( _container_t_ ) is often too strict. For example:

  * [Fedora SilverBlue][2] needs containers to read/write a user’s home directory
  * [Fluentd][3] project needs containers to be able to read logs in the _/var/log_ directory



On the other hand, the default container type could be too loose for certain use cases:

  * It has no SELinux network controls — all container processes can bind to any network port
  * It has no SELinux control on [Linux capabilities][4] — all container processes can use all capabilities



There is one solution to handle both use cases: write a custom SELinux security policy for the container. This can be tricky, because SELinux expertise is required. For this purpose, the _udica_ tool was created.

### Introducing udica

Udica generates SELinux security profiles for containers. Its concept is based on the “block inheritance” feature inside the [common intermediate language][5] (CIL) supported by SELinux userspace. The tool creates a policy that combines:

  * Rules inherited from specified CIL blocks (templates), and
  * Rules discovered by inspection of container JSON file, which contains mountpoints and ports definitions



You can load the final policy immediately, or move it to another system to load into the kernel. Here’s an example, using a container that:

  * Mounts _/home_ as read only
  * Mounts _/var/spool_ as read/write
  * Exposes port _tcp/21_



The container starts with this command:

```
# podman run -v /home:/home:ro -v /var/spool:/var/spool:rw -p 21:21 -it fedora bash
```

The default container type ( _container_t_ ) doesn’t allow any of these three actions. To prove it, you could use the _sesearch_ tool to query that the _allow_ rules are present on system:

```
# sesearch -A -s container_t -t home_root_t -c dir -p read
```

There’s no _allow_ rule present that lets a process labeled as _container_t_ access a directory labeled _home_root_t_ (like the _/home_ directory). The same situation occurs with _/var/spool_ , which is labeled _var_spool_t:_

```
# sesearch -A -s container_t -t var_spool_t -c dir -p read
```

On the other hand, the default policy completely allows network access.

```
# sesearch -A -s container_t -t port_type -c tcp_socket
allow container_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
allow sandbox_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
```

### Securing the container

It would be great to restrict this access and allow the container to bind just on TCP port _21_ or with the same label. Imagine you find an example container using _podman ps_ whose ID is _37a3635afb8f_ :

```
# podman ps -q
37a3635afb8f
```

You can now inspect the container and pass the inspection file to the _udica_ tool. The name for the new policy is _my_container_.

```
# podman inspect 37a3635afb8f > container.json
# udica -j container.json my_container
Policy my_container with container id 37a3635afb8f created!

Please load these modules using:
 # semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}

Restart the container with: "--security-opt label=type:my_container.process" parameter
```

That’s it! You just created a custom SELinux security policy for the example container. Now you can load this policy into the kernel and make it active. The _udica_ output above even tells you the command to use:

```
# semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}
```

Now you must restart the container to allow the container engine to use the new custom policy:

```
# podman run --security-opt label=type:my_container.process -v /home:/home:ro -v /var/spool:/var/spool:rw -p 21:21 -it fedora bash
```

The example container is now running in the newly created _my_container.process_ SELinux process type:

```
# ps -efZ | grep my_container.process
unconfined_u:system_r:container_runtime_t:s0-s0:c0.c1023 root 2275 434  1 13:49 pts/1 00:00:00 podman run --security-opt label=type:my_container.process -v /home:/home:ro -v /var/spool:/var/spool:rw -p 21:21 -it fedora bash
system_u:system_r:my_container.process:s0:c270,c963 root 2317 2305  0 13:49 pts/0 00:00:00 bash
```

### Seeing the results

The command _sesearch_ now shows _allow_ rules for accessing _/home_ and _/var/spool:_

```
# sesearch -A -s my_container.process -t home_root_t -c dir -p read
allow my_container.process home_root_t:dir { getattr ioctl lock open read search };
# sesearch -A -s my_container.process -t var_spool_t -c dir -p read
allow my_container.process var_spool_t:dir { add_name getattr ioctl lock open read remove_name search write }
```

The new custom SELinux policy also allows _my_container.process_ to bind only to TCP/UDP ports labeled the same as TCP port 21:

```
# semanage port -l | grep 21 | grep ftp
 ftp_port_t                     tcp      21, 989, 990
# sesearch -A -s my_container.process -c tcp_socket -p name_bind
 allow my_container.process ftp_port_t:tcp_socket name_bind;
```

### Conclusion

The _udica_ tool helps you create SELinux policies for containers based on an inspection file without any SELinux expertise required. Now you can increase the security of containerized environments. Sources are available on [GitHub][6], and an RPM package is available in Fedora repositories for Fedora 28 and later.

* * *

*Photo by _[_Samuel Zeller_][7]_ on *[ _Unsplash_.][8]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-udica-to-build-selinux-policy-for-containers/

作者：[Lukas Vrabec][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lvrabec/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/udica-816x345.jpg
[2]: https://silverblue.fedoraproject.org
[3]: https://www.fluentd.org
[4]: http://man7.org/linux/man-pages/man7/capabilities.7.html
[5]: https://en.wikipedia.org/wiki/Common_Intermediate_Language
[6]: https://github.com/containers/udica
[7]: https://unsplash.com/photos/KVG-XMOs6tw?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/lockers?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
