[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up Minishift and run Jenkins on Linux)
[#]: via: (https://opensource.com/article/20/11/minishift-linux)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

Set up Minishift and run Jenkins on Linux
======
Install, configure, and use Minishift to create your first pipeline.
![cubes coming together to create a larger cube][1]

[Minishift][2] is a tool that helps you run [OKD][3] (Red Hat's open source OpenShift container platform) locally by launching a single-node OKD cluster inside a virtual machine. It is powered by [Kubernetes][4], which is one of my favorite things to talk about.

In this article, I will demonstrate how to get started with Minishift on Linux. This was written for Ubuntu 18.04, and you'll need [sudo access][5] on your Linux machine to run some commands.

### Prerequisites

Before starting the installation, your Linux machine must have either [KVM][6] for Linux or [VirtualBox][7], which runs on every platform. This demo uses KVM, which you can install along with all the required dependencies:


```
$ sudo apt install qemu-kvm \
libvirt-clients libvirt-daemon-system \
bridge-utils virt-manager  
```

After installing KVM, you must make some modifications to allow your user to use it. Specifically, you must add your user name to the `libvirt` group:


```
$ sudo usermod --append --groups libvirt $(whoami)
$ newgrp libvirt
```

Next, install the Docker KVM driver, which is needed to run containers on Minishift. I downloaded the Docker machine driver directly to `/usr/local/bin`. You don't have to save it to `/usr/local/bin`, but you must ensure that its location is in your [PATH][8]:


```
$ curl -L <https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04> \
-o /usr/local/bin/docker-machine-driver-kvm

$ sudo chmod +x /usr/local/bin/docker-machine-driver-kvm
```

### Install Minishift

Now that the prerequisites are in place, visit the Minishift [releases page][9] and determine which version of Minishift you want to install. I used Minishift [v1.34.3][10].

[Download the Linux .tar file][11] to a directory you will be able to find easily. I used the `minishift` directory:


```
$ ls
Minishift-1.34.3-linux-amd64.tgz
```

Next, untar your new file using [the `tar` command][12]:


```
$ tar zxvf minishift-1.34.3-linux-amd64.tgz
minishift-1.34.3-linux-amd64/
minishift-1.34.3-linux-amd64/LICENSE
minishift-1.34.3-linux-amd64/README.adoc
minishift-1.34.3-linux-amd64/minishift
```

By using the `v` (for _verbose_) option in your command, you can see all the files and their locations in your directory structure.

Run the `ls` command to confirm that the new directory was created:


```
$ ls
minishift-1.34.3-linux-amd64
```

Next, change to the new directory and find the binary file you need; it is named `minishift`:


```
$ cd minishift-1.34.3-linux-amd64
$ ls
LICENSE  minishift  README.adoc
$
```

Move the `minishift `binary file to your PATH, which you can find by running the following and looking at the output:


```
$ echo $PATH
/home/jess/.local/bin:/usr/local/sbin:/usr/local/bin
```

I used `/usr/local/bin` as the `minishift` binary file's location:


```
$ sudo mv minishift /usr/local/bin
[sudo] password for jess:
$ ls /usr/local/bin
minishift
```

Run the `minishift` command and look at the output:


```
$ minishift
Minishift is a command-line tool that provisions and manages single-node OpenShift clusters optimized for development workflows.

Usage:
  minishift [command]

Available Commands:
  addons        Manages Minishift add-ons.
  completion  Outputs minishift shell completion for the given shell
  config        Modifies Minishift configuration properties.
  console       Opens or displays the OpenShift Web Console URL.
[...]

Use "minishift [command] --help" for more information about a command.
```

### Log into Minishift's web console

Now that Minishift is installed, you can walk through it and play with some cool new software. Begin with `minishift start`. This, as you might guess, starts Minishift—specifically, it starts a one-node cluster on your computer:


```
$ minishift start
  Starting profile 'minishift'
  Check if deprecated options are used … OK
  Checking if <https://github.com> is reachable … OK
[...]
  Minishift will be configured with…
  Memory: 4GB
  vCPUs : 2GB
  Disk size: 20 GB
Starting Minishift VM ……….OK
```

This process can take a long time, depending on your hardware, so be patient. When it ends, you'll get information about where to find your imaginary cluster on your virtualized network:


```
Server Information ...
MiniShift server started.
The server is accessible via web console at:
<https://192.168.42.66:8443/console>
```

Now, MiniShift is running, complete with a web console. You can log into the OKD console using **developer** as the user name and any password you want. I chose **developer** / **developer**.

![Minishift web console login][13]

(Jess Cherry, [CC BY-SA 4.0][14])

The web console is an easy control panel you can use to administer your humble cluster. It's a place for you to create and load container images, add and monitor pods, and ensure your instance is healthy.

![Minishift web console][15]

(Jess Cherry, [CC BY-SA 4.0][14])

### Build a pipeline

To start building your first pipeline, click **Pipeline Build Example** on the console. Click **Next** to show the parameters available to create the pipeline project.

![Pipeline Build Example][16]

(Jess Cherry, [CC BY-SA 4.0][14])

A window appears with parameters to fill in if you want; you can use what's already there for this example. Walk through the rest of the screen choices to create a sample pipeline.

![Pipeline options][17]

(Jess Cherry, [CC BY-SA 4.0][14])

Click **Create**, and let Minishift create the project for you. It shows your success (or failure).

![Successful pipeline build][18]

(Jess Cherry, [CC BY-SA 4.0][14])

You can also click **Show Parameters** and scroll through the list of parameters configured for this project. Click **Close** and look for a confirmation message on the left. 

![Show Parameters Minishift][19]

(Jess Cherry, [CC BY-SA 4.0][14])

![List of projects][20]

(Jess Cherry, [CC BY-SA 4.0][14])

When you click on **My Project**, you can see the details and pods created for the project to run.

![Project details][21]

(Jess Cherry, [CC BY-SA 4.0][14])

Open the `jenkins-ephemeral` link that was generated. Log in again with the **developer** credentials and allow access to run a pipeline in Jenkins.

![Authorize access interface][22]

(Jess Cherry, [CC BY-SA 4.0][14])

Now you can look through the Jenkins interface to get a feel for what it has to offer.

![Jenkins interface][23]

(Jess Cherry, [CC BY-SA 4.0][14])

Find your project.

![Jenkins projects][24]

(Jess Cherry, [CC BY-SA 4.0][14])

When you're ready, click **Build Now**.

![Jenkins "build now"][25]

(Jess Cherry, [CC BY-SA 4.0][14])

Then you can view the job's output in the console output.

![Jenkins console output][26]

(Jess Cherry, [CC BY-SA 4.0][14])

Once the job completes successfully, you will see a success message at the bottom of the console.

What did this pipeline do? It updated the deployment manually.

![Pipeline result][27]

(Jess Cherry, [CC BY-SA 4.0][14])

Congratulations, you successfully created an example automated deployment using Minishift!

### Clean it up

The last thing to do is to clean up everything by running two commands:


```
$ minishift stop
$ minishift delete
```

Why `stop` and then `delete`? Well, I like to make sure nothing is running before I run a delete command of any kind. This results in a cleaner delete without the possibility of having any leftover or hung processes. Here are the commands' output.

![minishift stop command][28]

(Jess Cherry, [CC BY-SA 4.0][14])

![minishift delete command][29]

(Jess Cherry, [CC BY-SA 4.0][14])

### Final notes

Minishift is a great tool with great built-in automation. The user interface is comfortable to work with and easy on the eyes. I found it a fun new tool to play with at home, and if you want to dive in deeper, just look over the great [documentation][30] and many [online tutorials][3]. I recommend exploring this application in depth. Have a happy time Minishifting!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/minishift-linux

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://www.okd.io/minishift/
[3]: https://www.redhat.com/sysadmin/learn-openshift-minishift
[4]: https://opensource.com/resources/what-is-kubernetes
[5]: https://en.wikipedia.org/wiki/Sudo
[6]: https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine
[7]: https://www.virtualbox.org/wiki/Downloads
[8]: https://opensource.com/article/17/6/set-path-linux
[9]: https://github.com/minishift/minishift/releases
[10]: https://github.com/minishift/minishift/releases/tag/v1.34.3
[11]: https://github.com/minishift/minishift/releases/download/v1.34.3/minishift-1.34.3-linux-amd64.tgz
[12]: https://opensource.com/article/17/7/how-unzip-targz-file
[13]: https://opensource.com/sites/default/files/uploads/minishift_web-console-login.png (Minishift web console login)
[14]: https://creativecommons.org/licenses/by-sa/4.0/
[15]: https://opensource.com/sites/default/files/uploads/minishift_web-console.png (Minishift web console)
[16]: https://opensource.com/sites/default/files/uploads/minishift_pipeline-build-example.png (Pipeline Build Example)
[17]: https://opensource.com/sites/default/files/uploads/minishift_pipeline-build-config.png (Pipeline options)
[18]: https://opensource.com/sites/default/files/uploads/minishift_pipeline-build-success.png (Successful pipeline build)
[19]: https://opensource.com/sites/default/files/pictures/params-minishift.jpg (Show Parameters Minishift)
[20]: https://opensource.com/sites/default/files/uploads/minishift_myprojects.png (List of projects)
[21]: https://opensource.com/sites/default/files/uploads/minishift_project-details.png (Project details)
[22]: https://opensource.com/sites/default/files/uploads/minishift_authorize-access.png (Authorize access interface)
[23]: https://opensource.com/sites/default/files/uploads/jenkins-interface.png (Jenkins interface)
[24]: https://opensource.com/sites/default/files/uploads/jenkins-project.png (Jenkins projects)
[25]: https://opensource.com/sites/default/files/uploads/jenkins_build-now.png (Jenkins "build now")
[26]: https://opensource.com/sites/default/files/uploads/jenkins_console-output.png (Jenkins console output)
[27]: https://opensource.com/sites/default/files/uploads/pipelineresult.png (Pipeline result)
[28]: https://opensource.com/sites/default/files/uploads/minishift-stop.png (minishift stop command)
[29]: https://opensource.com/sites/default/files/uploads/minishift-delete.png (minishift delete command)
[30]: https://docs.okd.io/3.11/minishift/using/index.html
