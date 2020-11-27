[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/getting-started-with-fedora-coreos/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

Getting started with Fedora CoreOS
======

![Getting started with Fedora CoreOS][1]

Photo by [Paweł Czerwiński][2] on [Unsplash][3]

This has been called the age of DevOps, and operating systems seem to be getting a little bit less attention than tools are. However, this doesn’t mean that there has been no innovation in operating systems. [Edit: The diversity of offerings from the plethora of distributions based on the Linux kernel is a fine example of this.] [Fedora CoreOS][4] has a specific philosophy of what an operating system should be in this age of DevOps.

### Fedora CoreOS’ philosophy

Fedora CoreOS (FCOS) came from the merging of CoreOS Container Linux and Fedora Atomic Host. It is a minimal and monolithic OS focused on running containerized applications. Security being a first class citizen, FCOS provides automatic updates and comes with SELinux hardening.

For automatic updates to work well they need to be very robust. The goal being that servers running FCOS won’t break after an update. This is achieved by using different release streams (stable, testing and next). Each stream is released every 2 weeks and content is promoted from one stream to the other (next -&gt; testing -&gt; stable). That way updates landing in the stable stream have had the opportunity to be tested over a long period of time.

### Getting Started

For this example let’s use the stable stream and a QEMU base image that we can run as a virtual machine. You can use [coreos-installer][5] to download that image.

From your (Workstation) terminal, run the following commands after updating the link to the image. [Edit: On Silverblue the container based coreos tools are the simplest method to try. Instructions can be found at <https://docs.fedoraproject.org/en-US/fedora-coreos/tutorial-setup/> , in particular “Setup with Podman or Docker”.]

```
$ sudo dnf install coreos-installer
$ coreos-installer download --image-url https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/32.20200907.3.0/x86_64/fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2.xz
$ xz -d fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2.xz
$ ls
fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2
```

#### Create a configuration

To customize a FCOS system, you need to provide a configuration file that will be used by [Ignition][6] to provision the system. You may use this file to configure things like creating a user, adding a trusted SSH key, enabling systemd services, and more.

The following configuration creates a _‘core’_ user and adds an SSH key to the authorized_keys file. It is also creating a systemd service that uses [podman][7] to run a simple hello world container.

```
version: "1.0.0"
variant: fcos
passwd:
  users:
    - name: core
      ssh_authorized_keys:
        - ssh-ed25519 my_public_ssh_key_hash fcos_key
systemd:
  units:
    -
      contents: |
          [Unit]
          Description=Run a hello world web service
          After=network-online.target
          Wants=network-online.target
          [Service]
          ExecStart=/bin/podman run --pull=always   --name=hello --net=host -p 8080:8080 quay.io/cverna/hello
          ExecStop=/bin/podman rm -f hello
          [Install]
          WantedBy=multi-user.target
      enabled: true
      name: hello.service
```

After adding your SSH key in the configuration save it as _config.yaml_. Next use the Fedora CoreOS Config Transpiler (fcct) tool to convert this YAML configuration into a valid Ignition configuration (JSON format).

Install _fcct_ directly from Fedora’s repositories or get the binary from [GitHub][8].

```
$ sudo dnf install fcct
$ fcct -output config.ign config.yaml
```

#### Install and run Fedora CoreOS

To run the image, you can use the libvirt stack. To install it on a Fedora system using the dnf package manager

```
$ sudo dnf install @virtualization
```

Now let’s create and run a Fedora CoreOS virtual machine

```
$ chcon --verbose unconfined_u:object_r:svirt_home_t:s0 config.ign
$ virt-install --name=fcos \
--vcpus=2 \
--ram=2048 \
--import \
--network=bridge=virbr0 \
--graphics=none \
--qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${PWD}/config.ign" \
--disk=size=20,backing_store=${PWD}/fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2
```

Once the installation is successful, some information is displayed and a login prompt is provided.

```
Fedora CoreOS 32.20200907.3.0
Kernel 5.8.10-200.fc32.x86_64 on an x86_64 (ttyS0)
SSH host key: SHA256:BJYN7AQZrwKZ7ZF8fWSI9YRhI++KMyeJeDVOE6rQ27U (ED25519)
SSH host key: SHA256:W3wfZp7EGkLuM3z4cy1ZJSMFLntYyW1kqAqKkxyuZrE (ECDSA)
SSH host key: SHA256:gb7/4Qo5aYhEjgoDZbrm8t1D0msgGYsQ0xhW5BAuZz0 (RSA)
ens2: 192.168.122.237 fe80::5054:ff:fef7:1a73
Ignition: user provided config was applied
Ignition: wrote ssh authorized keys file for user: core
```

The Ignition configuration file did not provide any password for the _core_ user, therefore it is not possible to login directly via the console. (Though, it is possible to configure a password for users via Ignition configuration.)

Use Ctrl + ] key combination to exit the virtual machine’s console. Then check if the hello.service is running.

```
$ curl http://192.168.122.237:8080
Hello from Fedora CoreOS!
```

Using the preconfigured SSH key, you can also access the VM and inspect the services running on it.

```
$ ssh core@192.168.122.237
$ systemctl status hello
● hello.service - Run a hello world web service
Loaded: loaded (/etc/systemd/system/hello.service; enabled; vendor preset: enabled)
Active: active (running) since Wed 2020-10-28 10:10:26 UTC; 42s ago
```

#### zincati, rpm-ostree and automatic updates

The zincati service drives rpm-ostreed with automatic updates.
Check which version of Fedora CoreOS is currently running on the VM, and check if Zincati has found an update.

```
$ ssh core@192.168.122.237
$ rpm-ostree status
State: idle
Deployments:
● ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20200907.3.0 (2020-09-23T08:16:31Z)
Commit: b53de8b03134c5e6b683b5ea471888e9e1b193781794f01b9ed5865b57f35d57
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
$ systemctl status zincati
● zincati.service - Zincati Update Agent
Loaded: loaded (/usr/lib/systemd/system/zincati.service; enabled; vendor preset: enabled)
Active: active (running) since Wed 2020-10-28 13:36:23 UTC; 7s ago
…
Oct 28 13:36:24 cosa-devsh zincati[1013]: [INFO ] initialization complete, auto-updates logic enabled
Oct 28 13:36:25 cosa-devsh zincati[1013]: [INFO ] target release '32.20201004.3.0' selected, proceeding to stage it

... zincati reboot ...
```

After the restart, let’s remote login once more to check the new version of Fedora CoreOS.

```
$ ssh core@192.168.122.237
$ rpm-ostree status
State: idle
Deployments:
● ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20201004.3.0 (2020-10-19T17:12:33Z)
Commit: 64bb377ae7e6949c26cfe819f3f0bd517596d461e437f2f6e9f1f3c24376fd30
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20200907.3.0 (2020-09-23T08:16:31Z)
Commit: b53de8b03134c5e6b683b5ea471888e9e1b193781794f01b9ed5865b57f35d57
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
```

_rpm-ostree status_ now shows 2 versions of Fedora CoreOS, the one that came in the QEMU image, and the latest one received from the update. By having these 2 versions available, it is possible to rollback to the previous version using the _rpm-ostree rollback_ command.

Finally, you can make sure that the hello service is still running and serving content.

```
$ curl http://192.168.122.237:8080
Hello from Fedora CoreOS!
```

More information: [Fedora CoreOS updates][9]

#### Deleting the Virtual Machine

To clean up afterwards, the following commands will delete the VM and associated storage.

```
$ virsh destroy fcos
$ virsh undefine --remove-all-storage fcos
```

### Conclusion

Fedora CoreOS provides a solid and secure operating system tailored to run applications in containers. It excels in a DevOps environment which encourages the hosts to be provisioned using declarative configuration files. Automatic updates and the ability to rollback to a previous version of the OS, bring a peace of mind during the operation of a service.

Learn more about Fedora CoreOS by following the tutorials available in the project’s [documentation][10].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-fedora-coreos/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/fcos-gettingstarted-1-816x345.jpg
[2]: https://unsplash.com/@pawel_czerwinski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/core?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://getfedora.org/coreos/
[5]: https://github.com/coreos/coreos-installer/releases
[6]: https://github.com/coreos/ignition
[7]: https://podman.io/
[8]: https://github.com/coreos/fcct/releases
[9]: https://docs.fedoraproject.org/en-US/fedora-coreos/auto-updates/
[10]: https://docs.fedoraproject.org/en-US/fedora-coreos/tutorials/
