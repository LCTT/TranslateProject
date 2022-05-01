[#]: subject: "Updating Edge Devices with OSTree and Pulp"
[#]: via: "https://fedoramagazine.org/updating-edge-devices-with-ostree-and-pulp/"
[#]: author: "lubosmj https://fedoramagazine.org/author/lubosmj/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Updating Edge Devices with OSTree and Pulp
======

![][1]

Photo by [Shubham Dhage][2] on [Unsplash][3]

Connecting industrial machinery to the internet has given birth to infinite opportunities that range from performance improvements and predictive maintenance to data modelling that can lead to novel solutions and use cases. The possibilities are endless. Connecting machinery on such a scale can test the limits of cloud connectivity, depending on your location and network limitations.

An edge device is any piece of hardware that sits at the boundary between two networks. When initial computation happens on servers at the edge, it speeds up user’s interactions with the cloud. Therefore, adding edge devices provides opportunities to optimize performance, shorten the journey, and lighten the load on your cloud connection.

As amazing as it sounds, managing all of this functionality demands continuous attention from administrators. Having a reliable solution to distribute, deploy, and update systems for edge devices from the outset will help you spend time on things that matter.

In this article, we look at how OSTree is well-positioned for upgrading and updating edge devices with versioned updates of Linux-based operating systems. Furthermore, we’ll explore how Pulp facilitates managing and preparing updates of the OSTree content, as well as making it available to edge devices. Together, they provide a powerful free and open-source solution for administering edge devices.

### How does OSTree help manage Edge devices?

If you need to deploy hundreds of operating systems to edge devices, safe in the knowledge that you can easily manage future updates and maintenance, an OSTree’s immutable and image-based operating system is ready for the task.

[OSTree][4] functions like git, but for operating system binaries. It has git-like content-addressed repositories. The ability to commit and branch entire root filesystem trees resembles the way you submit changes in git. With OSTree, you build an operating system with pre-installed packages, known as an operating system image. After you build the operating system image, it is possible to track it, sign it, test it, and deploy it. These images function as immutable file system trees. When the time comes to change or update, you simply build a new image and deploy it. By atomically switching between different versions of images, you are completely replacing filesystem trees.

OSTree also has a simple CLI that you can use for managing simple workflows, for example, for switching between different versions of images/filesystem trees.

### Where do Fedora-IoT Images feature?

As a standalone tool, the base OSTree CLI is not the most feature-rich utility for managing repository content. To make life easier, in the following demo, we will use _[rpm-ostree][5]_. _rpm-ostree_ is a hybrid image/package system that combines the standard OSTree technology as a base image format and accepts RPM on both the client and server-side.

_rpm-ostree_ integrates with Fedora IoT. In comparison to other ecosystems, instead of installing packages via DNF, you install packages with _rpm-ostree_. After rebooting all changes are applied to a new version of the image.

You can also upgrade or install a new Fedora IoT image with the _rpm-ostree_ utility.

### Where and how does Pulp come into this?

[Pulp][6] is a platform that handles content management workflows. Using Pulp, you can sync packages from remote repositories such as an RPM server, PyPI, Docker Hub, Ansible Galaxy, and many more. You can host and modify synced packages in repositories inside the Pulp server. You can publish repositories that contain packages available for deployment to production environments.

In our scenario, Pulp provides a platform for storing particular versions of OSTree content, promoting approved content through the content management lifecycle, for example from _dev_ to _test_, and from _test_ to _prod_. Pulp also provides a method for publishing content that is consumed by edge devices. Using Pulp, you can pull the latest packages, test, and publish only when safe to do so. Pulp ensures the safety, security, and repeatability of your content supply chain.

The following diagram provides a simplified overview of Pulp. On the left are shown different content types that are mirrored into Pulp from remote sources. These repositories are then served, for instance, to different CI/CD or production environments.

![A simplified overview of Pulp. The content is mirrored from remote repositories and made available to different types of environments.][7]

Pulp creates a new repository version automatically when updating or removing packages in a repository. You can distribute each repository version independently.

Pulp has a plugin-based architecture, which means that you must add a plugin for each content type you want to use. For managing OSTree content, you need [the OSTree plugin][8]. You can then mirror content from a remote repository, import content from a local tarball, and modify content within a Pulp repository while preserving the integrity of the original content. You can move commits and refs from one repository to another or delete them. Pulp ensures that you are safe to experiment while your production environment remains pinned to a particular version.

### Putting it all together

In this section, let’s look at how to build an image with an OSTree commit.

#### Building a Customized Fedora-IoT Image

We start by booting a new virtual machine (VM) that will have an installed Fedora-IoT OS. For the purposes of this example, it is best to have the same version of the OS installed as the running edge devices have.

All commands in this section are executed on the main admin VM (Fedora IoT 35 OS). On this admin VM, we will build the images that we will then distribute to the edge devices.

##### Before you begin:

  * First, ensure that the VM is accessible via SSH. To test, enter the following command from within the target OS:



```

    $ systemctl is-active sshd

```

  * Next, ensure that the following tools for composing operating system images are installed: 



```

    $ sudo rpm-ostree install osbuild-composer composer-cli
    $ sudo systemctl enable --now osbuild-composer.socket

```

  * Now, apply the installed packages by rebooting the system.



* * *

In this example a nano editor package is installed on all edge devices. We need to build an image containing a commit with the package.

Create a blueprint file that describes what changes you want to make to the image as shown here:

```

    $ cat install-nano.toml

    name = "nano-commit"
    description = "Installing nano"
    version = "0.0.1"

    [[packages]]
    name = "nano"
    version = "*"

```

Push this blueprint to the os build composer utility, which is a tool for composing operating system images. _composer-cli_ communicates with _osbuild composer_ through the CLI:

```

    $ composer-cli blueprints push install-nano.toml

```

Build a new image:

```

    $ composer-cli compose start-ostree nano-commit fedora-iot-commit --ref fedora/stable/x86_64/iot

```

The composer will use resources available in your current OS (such as a default operating system version).

Regularly check the status of the build:

```

    $ composer-cli compose status

```

When the build finishes, download the image:

```

    $ composer-cli compose image ${IMAGE_UUID}

```

The downloaded image is basically an OSTree repository packed into a tarball. When you extract the archived content, you will notice that one ref is referencing the checksum of a commit. You can find it inside the _refs/heads/_ directory.

#### Publishing the Customized Image with Pulp

All commands shown in this section are executed on the main admin VM (Fedora IoT 35 OS).

##### Before you begin:

  * Ensure that you have installed Pulp and the Pulp CLI for managing OSTree repositories:



```

    $ python3 -m venv venv && source venv/bin/activate
    $ pip install pulp-cli-ostree

```

  * Then [configure][9] the reference to the Pulp server:



```

    $ pulp config create && pulp status

```

Now configure a proxy server or SSH port forwarding to enable network communication between the VM and Pulp. Ensure that you can ping the Pulp server from the VM.

* * *

First, create a new OSTree repository:

```

    $ pulp ostree repository create --name fedora-iot

```

The following command will import the tarball created in the previous section into Pulp:

```

    $ pulp ostree repository import-commits --name fedora-iot --file ${IMAGE_TARBALL_C1} --repository_name repo

```

Publish the parsed commit as a remote OSTree repository hosted by Pulp:

```

    $ pulp ostree distribution create --name fedora-iot --base-path fedora-iot --repository fedora-iot

```

Try to fetch the commit checksum from the ref:

```

    $ curl http://${PULP_BASE_ADDR}/pulp/content/pulp-fedora-iot/refs/heads/fedora/stable/x86_64/iot

```

#### **Distributing the Customized Image to an Edge Device**

The Edge device can be another VM or a real device running Fedora IoT.

All commands shown in this section are executed on an Edge device (Fedora IoT 35 OS).

##### Before you begin:

  * Configure a proxy server or SSH port forwarding to enable network communication between an Edge device and Pulp. Ensure that you can ping the Pulp server from the Edge device. 
  * Ensure that the Edge device is accessible with SSH:



```

    $ systemctl is-active sshd

```

* * *

The nano package should NOT come pre-installed with the official bare Fedora IoT 35 image. Verify that by attempting to run _nano_ inside your terminal.

In Fedora IoT, updates are retrieved from the URL defined in **/etc/ostree/remotes.d/fedora-iot.conf**. This file can be modified manually or by adding a new remote repository. Learn more at [Adding and Removing Remote Repositories][10].

You can automate the upgrade procedure with an upgrade policy that will be configured at the beginning of deployment. This is done by writing a kickstart file that will boot up an edge device into a headless state. However, for demonstrative purposes, let’s act like a villain and update the aforementioned configuration file manually to have the following content:

```

    [remote "fedora-iot"]
    url=http://${PULP_BASE_ADDR}/pulp/content/pulp-fedora-iot/refs/heads/fedora/stable/x86_64/iot
    gpg-verify=false
    ref=fedora/stable/x86_64/iot

```

Do not forget to replace the variable _${PULP_BASE_ADDR}_ with a valid base path to the pulp server.

The following command shows you that some packages are going to be installed:

```

    $ rpm-ostree upgrade

```

Reboot the edge device:

```

    $ systemctl reboot

```

_…rebooting…_

Log in to the edge VM via ssh, and check the presence of the nano package that comes from Pulp:

```

    $ nano

```

**Done! You have successfully distributed a customized Fedora IoT image via Pulp!**

In case of any questions, do not hesitate to reach out to us at [https://pulpproject.org/help][11].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/updating-edge-devices-with-ostree-and-pulp/

作者：[lubosmj][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lubosmj/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/updating_edge_devices-816x345.jpg
[2]: https://unsplash.com/@theshubhamdhage?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/upload-network?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://ostree.readthedocs.io/en/latest/
[5]: https://coreos.github.io/rpm-ostree/
[6]: https://pulpproject.org/
[7]: https://fedoramagazine.org/wp-content/uploads/2022/04/pulp101-simplified-overview.png
[8]: https://github.com/pulp/pulp_ostree
[9]: https://docs.pulpproject.org/pulp_cli/configuration/
[10]: https://docs.fedoraproject.org/en-US/iot/rebasing/#_adding_and_removing_remote_repositories
[11]: https://pulpproject.org/help/#pulp-community-discourse
