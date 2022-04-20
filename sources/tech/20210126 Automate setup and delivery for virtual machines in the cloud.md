[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate setup and delivery for virtual machines in the cloud)
[#]: via: (https://opensource.com/article/21/1/testcloud-virtual-machines)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

Automate setup and delivery for virtual machines in the cloud
======
Get a cloud image ready in minutes by using Testcloud to automate the
setup process and deliver a VM ready to run.
![Looking at a map][1]

If you're a developer or hobbyist using a Fedora [qcow2 image][2] for the cloud, you always have to do a bunch of initial configuration before an image is ready to use. I know this all too well, and I was eager to find a way to make the setup process simpler. As it happens, the entire Fedora quality assurance team feels the same way, so we developed [Testcloud][3].

Testcloud is a tool that makes it easy to get a cloud image ready for testing in minutes. It automates the setup process and delivers a virtual machine (VM) ready to run on the cloud with just a few commands. 

Testcloud:

  1. Downloads the qcow2 image
  2. Creates the instance with the name of your choice
  3. Creates a user named `fedora` with the password of `passw0rd`
  4. Assigns an IP, which you can later use to secure shell (SSH) into the cloud
  5. Starts, stops, removes, and lists an instance



### Install Testcloud

To start your journey, you first must install the Testcloud package. You can install it from a terminal or through the software application. In both cases, the package name is `testcloud`. Install with:


```
`$ sudo dnf install testcloud -y`
```

Once the installation is complete, add your desired user to the `testcloud` group, which helps Testcloud automate the rest of the process. Execute these two commands to add your user to the `testcloud` group and restart the session with the updated group privileges:


```
$ sudo usermod -a -G testcloud $USER
$ su - $USER
```

![Add user to testcloud group][4]

(Sumantro Mukherjee, [CC BY-SA 4.0][5])

### Spin cloud images like a pro

Once your user has the required group permissions, create an instance:


```
`$ testcloud instance create <instance name> -u <url for qcow2 image>`
```

Alternatively, you can use `fedora:latest/fedora:XX` (where `XX` is your Fedora release) instead of the full URL:


```
`$ testcloud instance create <instance name> -u fedora:latest`
```

This returns the IP address of your VM:


```
$ testcloud instance create testcloud272593 -u <https://download.fedoraproject.org/pub/fedora/linux/releases/33/Cloud/x86\_64/images/Fedora-Cloud-Base-33-1.2.x86\_64.qcow2>  
[...]
INFO:Successfully booted instance testcloud272593
The IP of vm testcloud272593:  192.168.122.202
\------------------------------------------------------------
To connect to the VM, use the following command (password is 'passw0rd'):
ssh fedora@192.168.122.202
\------------------------------------------------------------
```

You can log in as the default user `fedora` with the password `passw0rd` (note the zero). You can get to the VM with `ssh`, `virt-manager`, or any other method that supports connecting to libvirt machines.

Another simple way to create a Fedora cloud is:


```
$ testcloud instance create testcloud193 -u fedora:33
 
WARNING:Not proceeding with backingstore cleanup because there are some testcloud instances running.
You can fix this by following command(s):
testcloud instance stop testcloud272593

DEBUG:Local downloads will be stored in /var/lib/testcloud/backingstores.
DEBUG:successfully changed SELinux context for image /var/lib/testcloud/backingstores/Fedora-Cloud-Base-33-1.2.x86_64.qcow2
DEBUG:Creating instance directories
DEBUG:creating seed image /var/lib/testcloud/instances/testcloud193/testcloud193-seed.img
INFO:Seed image generated successfully
INFO:Successfully booted instance testcloud193
The IP of vm testcloud193:  192.168.122.225
\------------------------------------------------------------
To connect to the VM, use the following command (password is 'passw0rd'):
ssh fedora@192.168.122.225
\------------------------------------------------------------
```

### Play with instances

Testcloud can be used to administer instances. This includes activities such as listing images or stopping and starting an instance.

To list instances, use the `list` subcommand:


```
$ testcloud instance list                
Name                            IP                      State    
\------------------------------------------------------------
testcloud272593                 192.168.122.202         running    
testcloud193                    192.168.122.225         running    
testcloud252793                 192.168.122.146         shutoff    
testcloud93                             192.168.122.152         shutoff
```

To stop a running instance:


```
$ testcloud instance stop testcloud193  
DEBUG:stop instance: testcloud193
DEBUG:stopping instance testcloud193.
```

To remove an instance:


```
$ testcloud instance destroy testcloud193  
DEBUG:remove instance: testcloud193
DEBUG:removing instance testcloud193 from libvirt.
DEBUG:Unregistering instance from libvirt.
DEBUG:removing instance /var/lib/testcloud/instances/testcloud193 from disk
```

To reboot a running instance:


```
$ testcloud instance reboot testcloud93                                                                                        
DEBUG:stop instance: testcloud93
[...]
INFO:Successfully booted instance testcloud93
The IP of vm testcloud93:  192.168.122.152
usage: testcloud [-h] {instance,image} ...
```

Give Testcloud a try and let me know what you think in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/testcloud-virtual-machines

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://en.wikipedia.org/wiki/Qcow
[3]: https://pagure.io/testcloud
[4]: https://opensource.com/sites/default/files/uploads/adduser.png (Add user to testcloud group)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
