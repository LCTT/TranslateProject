FSSlc translating

How To Analyze And Explore The Contents Of Docker Images
======
![](https://www.ostechnix.com/wp-content/uploads/2018/10/dive-tool-720x340.png)

As you may already know, a Docker container image is a lightweight, standalone, executable package of software that has everything required to run an application. That’s why container images are often used by developers for building and distributing applications. If you’re curious to know what is in a Docker image, this brief guide might help you. Today, we are going to learn to analyze and explore the contents of Docker images layer by layer using a tool named **“Dive”**. By analyzing a Docker image, we can discover possible duplicate files across the layers and remove them to reduce the size of the docker image. The Dive utility is not just a Docker Image analyzer, but also helps us to build one.

### Installing Dive

Get the latest version from the [**releases page**][1] and install it as shown below depending upon the distribution you use.

If you’re on **Debian** or **Ubuntu** , run the following commands to download and install it.

```
$ wget https://github.com/wagoodman/dive/releases/download/v0.0.8/dive_0.0.8_linux_amd64.deb

$ sudo apt install ./dive_0.0.8_linux_amd64.deb
```

**On RHEL/CentOS:**

```
$ wget https://github.com/wagoodman/dive/releases/download/v0.0.8/dive_0.0.8_linux_amd64.rpm

$ sudo rpm -i dive_0.0.8_linux_amd64.rpm
```

Dive can also installed using [**Linuxbrew**][2] package manager.

```
$ brew tap wagoodman/dive

$ brew install dive
```

For other installation methods, refer the project’s GitHub page given at the end of this guide.

### Analyze And Explore The Contents Of Docker Images

To analyze a Docker image, simply run dive command with Docker “Image ID”. You can get your Docker images’ IDs using “sudo docker images” command.

```
$ sudo dive ea4c82dcd15a
```

Here, **ea4c82dcd15a** is Docker image id.

The Dive command will quickly analyze the given Docker image and display its contents in the Terminal.
![](https://www.ostechnix.com/wp-content/uploads/2018/10/Dive-1.png)
As you can see in the above screenshot, the layers of given docker image and its details, wasted space are shown in the left pane. On the right pane, the contents of each layer in the given Docker image. You can switch between the left and right pane using **Ctrl+SPACEBAR** key and **UP/DOWN** arrow keys to navigate through the directory tree.

The list of keyboard shortcuts to use “Dive”.

  * **Ctrl+Spacebar** – Switch between left and right panes,
  * **Spacebar** – Expand/Collapse directory tree,
  * **Ctrl+A** – Show/hide added files,
  * **Ctrl+R** – Show/hide removed files,
  * **Ctrl+M** – Show/hide modified files,
  * **Ctrl+U** – Show/hide unmodified files,
  * **Ctrl+ L** – Show layer changes,
  * **Ctrl+A** – Show layer changes,
  * **Ctrl+/** – Filter files,
  * **Ctrl+C** – Exit.



In the above example, I have used “sudo” permission, because my Docker images are stored in **/var/lib/docker/** directory. If you have them on your $HOME directory or anywhere not owned “root” user, you need not to use “sudo”.

You can also build a Docker image and do an immediate analysis with one command: ``

```
$ dive build -t <some-tag>
```

Dive tool is still in beta stage, so there will be bugs. If you came across any bugs, report them in the project’s github page.

And, that’s all for today. You know now how to explore and analyze the contents of Docker container image and how to build it using Dive tool. Hope this helps.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-analyze-and-explore-the-contents-of-docker-images/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/wagoodman/dive/releases
[2]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
