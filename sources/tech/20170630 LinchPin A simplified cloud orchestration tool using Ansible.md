LinchPin: A simplified cloud orchestration tool using Ansible
============================================================

### Launched in late 2016, LinchPin now has a Python API and a growing community.


![LinchPin 1.0: A maturing hybrid cloud orchestration tool using Ansible](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/toolbox-learn-draw-container-yearbook.png?itok=2XFy0htN "LinchPin 1.0: A maturing hybrid cloud orchestration tool using Ansible")
>Image by : [Internet Archive Book Images][10]. Modified by Opensource.com. CC BY-SA 4.0

Late last year, [my team announced][11] [LinchPin][12], a hybrid [cloud][13] orchestration tool using Ansible. Provisioning cloud resources has never been easier or faster. With the power of Ansible behind LinchPin, and a focus on simplicity, many cloud resources are available at users' fingertips. In this article, I'll introduce LinchPin and look at how the project has matured in the past 10 months.

Back when LinchPin was introduced, using the **ansible-playbook** command to run LinchPin was complex. Although that can still be accomplished, LinchPin now has a new front-end command-line user interface (CLI), which is written in [Click][14] and makes LinchPin even simpler than it was before.

Explore the open source cloud

*   [What is the cloud?][1]

*   [What is OpenStack?][2]

*   [What is Kubernetes?][3]

*   [﻿Why the operating system matters for containers][4]

*   [Keeping Linux containers safe and secure][5]

Not to be outdone by the CLI, LinchPin now also has a [Python][15] API, which can be used to manage resources, such as Amazon EC2 and OpenStack instances, networks, storage, security groups, and more. The API [documentation][16] can be helpful when you're trying out LinchPin's Python API.

### Playbooks as a library

Because the core bits of LinchPin are [Ansible playbooks][17], the roles, modules, filters, and anything else to do with calling Ansible modules has been moved into the LinchPin library. This means that although one can still call the playbooks directly, it's not the preferred mechanism for managing resources. The **linchpin** executable has become the de facto front end for the command-line.

### Command-line in depth

Let's have a look at the **linchpin** command in depth:

```
$ linchpin
Usage: linchpin [OPTIONS] COMMAND [ARGS]...

  linchpin: hybrid cloud orchestration

Options:
  -c, --config PATH       Path to config file
  -w, --workspace PATH    Use the specified workspace if the familiar Jenkins
                          $WORKSPACE environment variable is not set
  -v, --verbose           Enable verbose output
  --version               Prints the version and exits
  --creds-path PATH       Use the specified credentials path if WORKSPACE
                          environment variable is not set
  -h, --help              Show this message and exit.

Commands:
  init     Initializes a linchpin project.
  up       Provisions nodes from the given target(s) in...
  destroy  Destroys nodes from the given target(s) in...
```

What can be seen immediately is a simple description, along with options and arguments that can be passed to the command. The three commands found near the bottom of this help are where the focus will be for this document.

### Configuration

In the past, there was **linchpin_config.yml**. This file is no longer, and has been replaced with an ini-style configuration file, called **linchpin.conf**. Although this file can be modified or placed elsewhere, its placement in the library path allows easy lookup of configurations. In most cases, the **linchpin.conf** file should not need to be modified.

### Workspace

The workspace is a defined filesystem path, which allows grouping of resources in a logical way. A workspace can be considered a single point for a particular environment, set of services, or other logical grouping. It can also be one big storage bin of all managed resources.

The workspace can be specified on the command-line with the **--workspace (-w)** option, followed by the workspace path. It can also be specified with an environment variable (e.g., **$WORKSPACE** in bash). The default workspace is the current directory.

### Initialization (init)

Running **linchpin init** will generate the directory structure needed, along with an example **PinFile**, **topology**, and **layout** files:

```
$ export WORKSPACE=/tmp/workspace
$ linchpin init
PinFile and file structure created at /tmp/workspace
$ cd /tmp/workspace/
$ tree
.
├── credentials
├── hooks
├── inventories
├── layouts
│   └── example-layout.yml
├── PinFile
├── resources
└── topologies
    └── example-topology.yml
```

At this point, one could execute **linchpin up** and provision a single libvirt virtual machine, with a network named **linchpin-centos71**. An inventory would be generated and placed in **inventories/libvirt.inventory**. This can be known by reading the **topologies/example-topology.yml** and gleaning out the **topology_name** value.

### Provisioning (linchpin up)

Once a PinFile, topology, and optionally a layout are in place, provisioning can happen.

We use the dummy tooling because it is much simpler to configure; it doesn't require anything extra (authentication, network, etc.). The dummy provider creates a temporary file, which represents provisioned hosts. If the temporary file does not have any data, hosts have not been provisioned, or they have been recently destroyed.

The tree for the dummy provider is simple:

```
$ tree
.
├── hooks
├── inventories
├── layouts
│   └── dummy-layout.yml
├── PinFile
├── resources
└── topologies
    └── dummy-cluster.yml
```

The PinFile is also simple; it specifies which topology, and optional layout to use for the **dummy1** target:

```
---
dummy1:
  topology: dummy-cluster.yml
  layout: dummy-layout.yml
```

The **dummy-cluster.yml** topology file is a reference to provision three (3) resources of type **dummy_node**:

```
---
topology_name: "dummy_cluster" # topology name
resource_groups:
  -
    resource_group_name: "dummy"
    resource_group_type: "dummy"
    resource_definitions:
      -
        name: "web"
        type: "dummy_node"
        count: 3
```

Performing the command **linchpin up** should generate **resources** and **inventory** files based upon the **topology_name** (in this case, **dummy_cluster**):

```
$ linchpin up
target: dummy1, action: up

$ ls {resources,inventories}/dummy*
inventories/dummy_cluster.inventory  resources/dummy_cluster.output
```

To verify resources with the dummy cluster, check **/tmp/dummy.hosts**:

```
$ cat /tmp/dummy.hosts
web-0.example.net
web-1.example.net
web-2.example.net
```

The Dummy module provides a basic tooling for pretend (or dummy) provisioning. Check out the details for OpenStack, AWS EC2, Google Cloud, and more in the LinchPin [examples][18].

### Inventory Generation

As part of the PinFile mentioned above, a **layout** can be specified. If this file is specified and exists in the correct location, an Ansible static inventory file will be generated automatically for the resources provisioned:

```
---
inventory_layout:
  vars:
    hostname: __IP__
  hosts:
    example-node:
      count: 3
      host_groups:
        - example
```

When the **linchpin up** execution is complete, the resources file provides useful details. Specifically, the IP address(es) or host name(s) are interpolated into the static inventory:

```
[example]
web-2.example.net hostname=web-2.example.net
web-1.example.net hostname=web-1.example.net
web-0.example.net hostname=web-0.example.net

[all]
web-2.example.net hostname=web-2.example.net
web-1.example.net hostname=web-1.example.net
web-0.example.net hostname=web-0.example.net
```

### Teardown (linchpin destroy)

LinchPin also can perform a teardown of resources. A teardown action generally expects that resources have been provisioned; however, because Ansible is idempotent, **linchpin destroy** will only check to make sure the resources are up. Only if the resources are already up will the teardown happen.

The command **linchpin destroy** will either use resources and/or topology files to determine the proper teardown procedure.

The **dummy** Ansible role does not use the resources, only the topology during teardown:

```
$ linchpin destroy
target: dummy1, action: destroy

$ cat /tmp/dummy.hosts
-- EMPTY FILE --
```

The teardown functionality is slightly more limited around ephemeral resources, like networking, storage, etc. It is possible that a network resource could be used with multiple cloud instances. In this way, performing a **linchpin destroy**does not teardown certain resources. This is dependent on each provider's implementation. See specific implementations for each of the [providers][19].

### The LinchPin Python API

Much of what is implemented in the **linchpin** command-line tool has been written using the Python API. The API, although not complete, has become a vital component of the LinchPin tooling.

The API consists of three packages:

*   **linchpin**

*   **linchpin.cli**

*   **linchpin.api**

The command-line tool is managed at the base **linchpin** package; it imports the **linchpin.cli** modules and classes, which is a subclassing of **linchpin.api**. The purpose for this is to allow for other possible implementations of LinchPin using the **linchpin.api**, like a planned RESTful API.

For more information, see the [Python API library documentation on Read the Docs][20].

### Hooks

One of the big improvements in LinchPin 1.0 going forward is hooks. The goal with hooks is to allow additional configuration using external resources in certain specific states during **linchpin** execution. The states currently are as follows:

*   **preup**: Executed before provisioning the topology resources

*   **postup**: Executed after provisioning the topology resources, and generating the optional inventory

*   **predestroy**: Executed before teardown of the topology resources

*   **postdestroy**: Executed after teardown of the topology resources

In each case, these hooks allow external scripts to run. Several types of hooks exist, including custom ones called  _Action Managers_ . Here's a list of built-in Action Managers:

*   **shell**: Allows either inline shell commands, or an executable shell script

*   **python**: Executes a Python script

*   **ansible**: Executes an Ansible playbook, allowing passing of a **vars_file** and **extra_vars** represented as a Python dict

*   **nodejs**: Executes a Node.js script

*   **ruby**: Executes a Ruby script

A hook is bound to a specific target and must be restated for each target used. In the future, hooks will be able to be global, and then named in the **hooks**section for each target more simply.

### Using hooks

Describing hooks is simple enough, understanding their power might not be so simple. This feature exists to provide flexible power to the user for things that the LinchPin developers might not consider. This concept could lead to a simple way to ping a set of systems, for instance, before running another hook.

Looking into the  _workspace_  more closely, one might have noticed the **hooks**directory. Let's have a look inside this directory to see the structure:

```
$ tree hooks/
hooks/
├── ansible
│   ├── ping
│   │   └── dummy_ping.yaml
└── shell
    └── database
        ├── init_db.sh
        └── setup_db.sh
```

In every case, hooks can be used in the **PinFile**, shown here:

```
---
dummy1:
  topology: dummy-cluster.yml
  layout: dummy-layout.yml
  hooks:
    postup:
      - name: ping
        type: ansible
        actions:
          - dummy_ping.yaml
      - name: database
        type: shell
        actions:
          - setup_db.sh
          - init_db.sh
```

The basic concept is that there are three postup actions to complete. Hooks are executed in top-down order. Thus, the Ansible **ping** task would run first, followed by the two shell tasks, **setup_db.sh**, followed by **init_db.sh**. Assuming the hooks execute successfully, a ping of the systems would occur, then a database would be set up and initialized.

### Authentication Driver

In the initial design of LinchPin, developers decided to have authentication be managed within the Ansible playbooks; however, moving to a more API and command-line driven tool meant that authentication should be outside of the library where the playbooks now reside, and still pass authentication values along as needed.

### Configuration

Letting users use the authentication method provided by the driver used accomplished this task. For instance, if the topology called for OpenStack, the standard method is to use either a yaml file, or similar **OS_** prefixed environment variables. A clouds.yaml file consists of a profile, with an **auth**section:

```
clouds:
  default:
    auth:
      auth_url: http://stack.example.com:5000/v2.0/
      project_name: factory2
      username: factory-user
      password: password-is-not-a-good-password
```

More detail is in the [OpenStack documentation][21].

This clouds.yaml—or any other authentication file—is located in the **default_credentials_path** (e.g., ~/.config/linchpin) and referenced in the topology:

```
---
topology_name: openstack-test
resource_groups:
  -
    resource_group_name: linchpin
    resource_group_type: openstack
    resource_definitions:
      - name: resource
        type: os_server
        flavor: m1.small
        image: rhel-7.2-server-x86_64-released
        count: 1
        keypair: test-key
        networks:
          - test-net2
        fip_pool: 10.0.72.0/24
    credentials:
      filename: clouds.yaml
      profile: default
```

The **default_credentials_path** can be changed by modifying the **linchpin.conf**.

The topology includes a new **credentials** section at the bottom. With **openstack**, **ec2**, and **gcloud** modules, the credentials can be specified similarly. The Authentication driver will then look in the given  _filename_ **clouds.yaml**, and search for the  _profile_  named **default**.

Assuming authentication is found and loaded, provisioning will continue as normal.

### Simplicity

Although LinchPin can be complex around topologies, inventory layouts, hooks, and authentication management, the ultimate goal is simplicity. By simplifying with a command-line interface, along with goals to improve the developer experience coming post-1.0, LinchPin continues to show that complex configurations can be managed with simplicity.

### Community Growth

Over the past year, LinchPin's community has grown to the point that we now have a [mailing list][22], an IRC channel (#linchpin on chat.freenode.net), and even manage our sprints in the open with [GitHub][23].

The community membership has grown immensely—from 2 core developers to about 10 contributors over the past year. More people continue to work with the project. If you've got an interest in LinchPin, drop us a line, file an issue on GitHub, join up on IRC, or send us an email.

 _This article is based on Clint Savage's OpenWest talk, [Introducing LinchPin: Hybrid cloud provisioning using Ansible][7]. [OpenWest][8] will be held July 12-15, 2017 in Salt Lake City, Utah._

--------------------------------------------------------------------------------

作者简介：

Clint Savage - Clint Savage works for Red Hat as a Senior Software Engineer for Project Atomic. His job entails automating Atomic server builds for Fedora, CentOS, and Red Hat Enterprise Linux (RHEL).

-------------

via: https://opensource.com/article/17/6/linchpin

作者：[Clint Savage][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/herlo
[1]:https://opensource.com/resources/cloud?src=cloud_resource_menu1
[2]:https://opensource.com/resources/what-is-openstack?src=cloud_resource_menu2
[3]:https://opensource.com/resources/what-is-kubernetes?src=cloud_resource_menu3
[4]:https://opensource.com/16/12/yearbook-why-operating-system-matters?src=cloud_resource_menu4
[5]:https://opensource.com/business/16/10/interview-andy-cathrow-anchore?src=cloud_resource_menu5
[6]:https://opensource.com/article/17/6/linchpin?rate=yx4feHOc5Kf9gaZe5S4MoVAmf9mgtociUimJKAYgwZs
[7]:https://www.openwest.org/custom/description.php?id=166
[8]:https://www.openwest.org/
[9]:https://opensource.com/user/145261/feed
[10]:https://www.flickr.com/photos/internetarchivebookimages/14587478927/in/photolist-oe2Gwy-otuvuy-otus3U-otuuh3-ovwtoH-oe2AXD-otutEw-ovwpd8-oe2Me9-ovf688-oxhaVa-oe2mNh-oe3AN6-ovuyL7-ovf9Kt-oe2m4G-ovwqsH-ovjfJY-ovjfrU-oe2rAU-otuuBw-oe3Dgn-oe2JHY-ovfcrF-oe2Ns1-ovjh2N-oe3AmK-otuwP7-ovwrHt-ovwmpH-ovf892-ovfbsr-ovuAzN-ovf3qp-ovuFcJ-oe2T3U-ovwn8r-oe2L3T-oe3ELr-oe2Dmr-ovuyB9-ovuA9s-otuvPG-oturHA-ovuDAh-ovwkV6-ovf5Yv-ovuCC5-ovfc2x-oxhf1V
[11]:http://sexysexypenguins.com/posts/introducing-linch-pin/
[12]:http://linch-pin.readthedocs.io/en/develop/
[13]:https://opensource.com/resources/cloud
[14]:http://click.pocoo.org/
[15]:https://opensource.com/resources/python
[16]:http://linchpin.readthedocs.io/en/develop/libdocs.html
[17]:http://docs.ansible.com/ansible/playbooks.html
[18]:https://github.com/CentOS-PaaS-SIG/linchpin/tree/develop/linchpin/examples/topologies
[19]:https://github.com/CentOS-PaaS-SIG/linch-pin/tree/develop/linchpin/provision/roles
[20]:http://linchpin.readthedocs.io/en/develop/libdocs.html
[21]:https://docs.openstack.org/developer/python-openstackclient/configuration.html
[22]:https://www.redhat.com/mailman/listinfo/linchpin
[23]:https://github.com/CentOS-PaaS-SIG/linch-pin/projects/4
[24]:https://opensource.com/users/herlo
