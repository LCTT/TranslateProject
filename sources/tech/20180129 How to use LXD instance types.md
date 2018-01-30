How to use LXD instance types
======
**Background** : LXD is a hypervisor that manages machine containers on Linux distributions. You install LXD on your Linux distribution and then you can launch machine containers into your distribution running all sort of (other) Linux distributions.

When you launch a new LXD container, there is a parameter for an instance type. Here it is,
```
$ lxc launch --help
Usage: lxc launch [ <remote>:]<image> [<remote>:][<name>] [--ephemeral|-e] [--profile|-p <profile>...] [--config|-c <key=value>...] [--type|-t <instance type>]

Create and start containers from images.

Not specifying -p will result in the default profile.
Specifying "-p" with no argument will result in no profile.

Examples:
 lxc launch ubuntu:16.04 u1

Options:
 -c, --config (= map[]) Config key/value to apply to the new container
 --debug (= false) Enable debug mode
 -e, --ephemeral (= false) Ephemeral container
 --force-local (= false) Force using the local unix socket
 --no-alias (= false) Ignore aliases when determining what command to run
 -p, --profile (= []) Profile to apply to the new container
**-t (= "") Instance type**
 --verbose (= false) Enable verbose mode
```

What do we put for Instance type? Here is the documentation,

<https://lxd.readthedocs.io/en/latest/containers/#instance-types>

Simply put, an instance type is just a mnemonic shortcut for specific pair of CPU cores and RAM memory settings. For CPU you specify the number of cores and for RAM memory the amount in GB (assuming your own computer has enough cores and RAM so that LXD can allocate them to the newly created container).

You would need an instance type if you want to create a machine container that resembles in the specs as close as possible what you will be installing later on, on AWS (Amazon), Azure (Microsoft) or GCE (Google).

The instance type can have any of the following forms,

  * `<instance type>` for example: **t2.micro** (LXD figures out that this refers to AWS t2.micro, therefore 1 core, 1GB RAM).
  * `<cloud>:<instance type>` for example, **aws:t2.micro** (LXD quickly looks into the AWS types, therefore 1core, 1GB RAM).
  * `c<CPU>-m<RAM in GB>` for example, **c1-m1** (LXD explicitly allocates one core, and 1GB RAM).



Where do these mnemonics like **t2.micro** come from? The documentation says from <https://github.com/dustinkirkland/instance-type/tree/master/yaml>

[![][1]][2]

There are three sets of instance types, **aws** , **azure** and **gce**. Their names are listed in [the LXD instance type index file ][3]**.yaml,**
```
aws: "aws.yaml"
gce: "gce.yaml"
azure: "azure.yaml"

```

Over there, there are YAML configuration files for each of AWS, Azure and GCE, and in them there are settings for CPU cores and RAM memory.

The actual URLs that the LXD client will be using, are

<https://uk.images.linuxcontainers.org/meta/instance-types/aws.yaml>

Sample for AWS:
```
t2.large:
 cpu: 2.0
 mem: 8.0
t2.medium:
 cpu: 2.0
 mem: 4.0
t2.micro:
 cpu: 1.0
 mem: 1.0
t2.nano:
 cpu: 1.0
 mem: 0.5
t2.small:
 cpu: 1.0
 mem: 2.0
```

<https://uk.images.linuxcontainers.org/meta/instance-types/azure.yaml>

Sample for Azure:
```
ExtraSmall:
 cpu: 1.0
 mem: 0.768
Large:
 cpu: 4.0
 mem: 7.0
Medium:
 cpu: 2.0
 mem: 3.5
Small:
 cpu: 1.0
 mem: 1.75
Standard_A1_v2:
 cpu: 1.0
 mem: 2.0
```

<https://uk.images.linuxcontainers.org/meta/instance-types/gce.yaml>

Sample for GCE:
```
f1-micro:
 cpu: 0.2
 mem: 0.6
g1-small:
 cpu: 0.5
 mem: 1.7
n1-highcpu-16:
 cpu: 16.0
 mem: 14.4
n1-highcpu-2:
 cpu: 2.0
 mem: 1.8
n1-highcpu-32:
 cpu: 32.0
 mem: 28.8
```

Let's see an example. Here, all of the following are all equivalent! Just run one of them to get a 1 CPU core/1GB RAM container.
```
$ lxc launch ubuntu:x -t t2.micro aws-t2-micro

$ lxc launch ubuntu:x -t aws:t2.micro aws-t2-micro

$ lxc launch ubuntu:x -t c1-m1 aws-t2-micro
```

Let's verify that the constraints have been actually set for the container.
```
$ lxc config get aws-t2-micro limits.cpu
1

$ lxc config get aws-t2-micro limits.cpu.allowance


$ lxc config get aws-t2-micro limits.memory
1024MB

$ lxc config get aws-t2-micro limits.memory.enforce


```

There are generic limits for 1 CPU core and 1024MB/1GB RAM. For more, see [LXD resource control][4].

If you already have a running container and you wanted to set limits live (no need to restart it), here is how you would do that.
```
$ lxc launch ubuntu:x mycontainer
Creating mycontainer
Starting mycontainer

$ lxc config set mycontainer limits.cpu 1
$ lxc config set mycontainer limits.memory 1GB
```

Let's see the config with the limits,
```
$ lxc config show mycontainer
architecture: x86_64
config:
 image.architecture: amd64
 image.description: ubuntu 16.04 LTS amd64 (release) (20180126)
 image.label: release
 image.os: ubuntu
 image.release: xenial
 image.serial: "20180126"
 image.version: "16.04"
 limits.cpu: "1"
 limits.memory: 1GB
...
```

### Troubleshooting

#### I tried to the the memory limit but I get an error!

I got this error,
```
$ lxc config set mycontainer limits.memory 1
error: Failed to set cgroup memory.limit_in_bytes="1": setting cgroup item for the container failed
Exit 1 
```

When you set the memory limit ( **limits.memory** ), you need to append a specifier like **GB** (as in 1GB). Because the number there is in bytes if no specifier is present, and one byte of memory is not going to work.

#### I cannot set the limits in lxc launch -config!

How do I use **lxc launch -config ConfigurationGoesHere**?

Here is the documentation:
```
$ lxc launch --help
Usage: lxc launch [ <remote>:]<image> ... [--config|-c <key=value>...]
```

Here it is,
```
$ lxc launch ubuntu:x --config limits.cpu=1 --config limits.memory=1GB mycontainer
Creating mycontainer
Starting mycontainer
```

That is, use multiple **- config** parameters.


--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-use-lxd-instance-types/

作者：[Simos Xenitellis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/author/simos/
[1]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2018/01/lxd-instance-types.png?resize=750%2C277&ssl=1
[2]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2018/01/lxd-instance-types.png?ssl=1
[3]:https://uk.images.linuxcontainers.org/meta/instance-types/.yaml
[4]:https://stgraber.org/2016/03/26/lxd-2-0-resource-control-412/
