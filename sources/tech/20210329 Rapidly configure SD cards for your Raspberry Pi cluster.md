[#]: subject: (Rapidly configure SD cards for your Raspberry Pi cluster)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-cluster)
[#]: author: (Gregor von Laszewski https://opensource.com/users/laszewski)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Rapidly configure SD cards for your Raspberry Pi cluster
======
Create multiple SD cards that are preconfigured to create Pi clusters
with Cloudmesh Pi Burner.
![Raspberries with pi symbol overlay][1]

There are many reasons people want to create [computer clusters][2] using the Raspberry Pi, including that they have full control over their platform, they're able to use an inexpensive, highly usable platform, and get the opportunity to learn about cluster computing in general.

There are different methods for setting up a cluster, such as headless, network booting, and booting from SD cards. Each method has advantages and disadvantages, but the latter method is most familiar to users who have worked with a single Pi. Most cluster setups involve many complex steps that require a significant amount of time because they are executed on an individual Pi. Even starting is non-trivial, as you need to set up a network to access them.

Despite improvements to the [Raspberry Pi Imager][3] and the availability of [PiBakery][4], the process is still too involved. So, at Cloudmesh, we asked:

> Is it possible to develop a tool that is specifically targeted to burn SD cards for Pis in a cluster one at a time so that the cards can be just plugged in and, with minimal effort, start a cluster that simply works?

In response, we developed a tool called **Cloudmesh Pi Burner** for SD Cards, and we present it within [Pi Planet][5]. No more spending hours upon hours to replicate the steps and learn complex DevOps tutorials; instead, you can get a cluster set up with just a few commands.

For this, we developed `cms burn`, which is a program that you can execute on a "manager" Pi or a Linux or macOS computer to burn cards for your cluster.

We set up a [comprehensive package][6] on GitHub that can be installed easily. You can read about it in detail in the [README][7]. There, you can also find detailed instructions on how to [burn directly][8] from a macOS or Linux computer.

### Getting started

This article explains how to create a cluster setup using five Raspberry Pi units (you need a minimum of two, but this method also works for larger numbers). To follow along, you must have five SD cards, one for each of the five Pi units. It's helpful to have a network switch (managed or unmanaged) with five Ethernet cables (one for each Pi).

#### Requirements

You need:

  * 5 Raspberry Pi boards
  * 5 SD cards
  * 5 Ethernet cables
  * A network switch (unmanaged or managed)
  * WiFi access
  * Monitor, mouse, keyboard (for desktop access on Pi)
  * An SD card slot for your computer or the manager Pi (and preferably supports USB 3.0 speeds)
  * If you're doing this on a Mac, you must install [XCode][9] and [Homebrew][10]



On Linux, the open source **ext4** filesystem is supported by default. However, Apple doesn't provide this capability for macOS, so you must purchase support separately. I use Paragon Software's **extFS** application. Like macOS itself, this is largely based upon, but is not itself, open source.

At Cloudmesh, we maintain a list of [hardware parts][11] you need to consider when setting up a cluster.

### Network configuration

Figure 1 shows our network configuration. Of the five Raspberry Pi computers, one is dedicated as a _manager_ and four are _workers_. Using WiFi for the manager Pi allows you to set it up anywhere in your house or other location (other configurations are discussed in the README).

Our configuration uses an unmanaged network switch, where the manager and workers communicate locally with each other, and the manager provides internet access to the workers over a bridge that's configured for you.

![Pi cluster setup with bridge network][12]

Pi cluster setup with bridge network (©2021 [The Cloudmesh Projects][13])

### Set up the Cloudmesh burn application

To set up the Cloudmesh burn program, first [create a Python `venv`][14]:


```
$ python3 -m venv ~/ENV3
$ source ~/ENV3/bin/activate
```

Next, install the Cloudmesh cluster generation tools and start the burn process. You must adjust the path to your SD card, which differs depending on your system and what kind of SD card reader you're using. Here's an example:


```
(ENV3)$ pip install cloudmesh-pi-cluster
(ENV3)$ cms help
(ENV3)$ cms burn info
(ENV3)$ cms burn cluster \
\--device=/path/to/sdcard \
\--hostname=red,red01,red02,red03,red04 \
\--ssid=myssid -y
```

Fill out the passwords and plug in the SD cards as requested.

### Start your cluster and configure it

Plug the burned SD cards into the Pis and switch them on. Execute the `ssh` command to log into your manager—it's the one called `red` (worker nodes are identified by number):


```
`(ENV3)$ ssh pi@red.local`
```

This takes a while, as the filesystems on the SD cards need to be installed, and configurations such as Country, SSH, and WiFi need to be activated.

Once you are in the manager, install the Cloudmesh cluster software in it. (You could have done this automatically, but we decided to leave this part of the process up to you to give you maximum flexibility.)


```
pi@red:~ $ curl -Ls \
<http://cloudmesh.github.io/get/pi> \
\--output install.sh
pi@red:~ $ sh ./install.sh
```

After lots of log messages, you see:


```
#################################################
# Install Completed                             #
#################################################
Time to update and upgarde: 339 s
Time to install the venv:   22 s
Time to install cloudmesh:  185 s
Time for total install:     546 s
Time to install: 546 s
#################################################
Please activate with
    source ~/ENV3/bin/activate
```

Reboot:


```
`pi@red:~ $ sudo reboot`
```

### Start using your cluster

Log in to your manager Pi over SSH:


```
`(ENV3)$ ssh pi@red.local`
```

Once you're logged into your manager (in this example, `red.local`) on the network, execute a command to see if things are working. For example, you can use a temperature monitor to get the temperature from all Pi boards:


```
(ENV3) pi@red:~ $ cms pi temp red01,red02,red03,red04

pi temp red01,red02
+--------+--------+-------+----------------------------+
| host   |    cpu |   gpu | date                       |
|--------+--------+-------+----------------------------|
| red01  | 45.277 |  45.2 | 2021-02-23 22:13:11.788430 |
| red02  | 42.842 |  42.8 | 2021-02-23 22:13:11.941566 |
| red02  | 43.356 |  42.8 | 2021-02-23 22:13:11.961245 |
| red02  | 44.124 |  42.8 | 2021-02-23 22:13:11.981896 |
+--------+--------+-------+----------------------------+
```

### Access the workers

It's even more convenient to access the workers, so we designed a tunnel command that makes setup easy. Call it on the manager node, for example:


```
`(ENV3) pi@red:~ $ cms host setup "red0[1-4]" user@laptop.local`
```

This creates ssh keys on all workers, gathers ssh keys from all hosts, and scatters the public keys to the manager's and worker's authorized key file. This also makes the manager node a bridge for the worker nodes so they can have internet access. Now our laptop we update our ssh config file with the following command.


```
`(ENV3)$ cms host config proxy pi@red.local red0[1-4]`
```

Now you can access the workers from your computer. Try it out with the temperature program:


```
(ENV3)$ cms pi temp "red,red0[1-4]"              

+-------+--------+-------+----------------------------+
| host  |    cpu |   gpu | date                       |
|-------+--------+-------+----------------------------|
| red   | 50.147 |  50.1 | 2021-02-18 21:10:05.942494 |
| red01 | 51.608 |  51.6 | 2021-02-18 21:10:06.153189 |
| red02 | 45.764 |  45.7 | 2021-02-18 21:10:06.163067 |
...
+-------+--------+-------+----------------------------+
```

### More information

Since this uses SSH keys to authenticate between the manager and the workers, you can log directly into the workers from the manager. You can find more details in the [README][7] and on [Pi Planet][5]. Other Cloudmesh components are discussed in the [Cloudmesh manual][15].

* * *

_This article is based on [Easy Raspberry Pi cluster setup with Cloudmesh from MacOS][13] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-cluster

作者：[Gregor von Laszewski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/laszewski
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://en.wikipedia.org/wiki/Computer_cluster
[3]: https://www.youtube.com/watch?v=J024soVgEeM
[4]: https://www.raspberrypi.org/blog/pibakery/
[5]: https://piplanet.org/
[6]: https://github.com/cloudmesh/cloudmesh-pi-burn
[7]: https://github.com/cloudmesh/cloudmesh-pi-burn/blob/main/README.md
[8]: https://github.com/cloudmesh/cloudmesh-pi-burn#71-quickstart-for-a-setup-of-a-cluster-from-macos-or-linux-with-no-burning-on-a-pi
[9]: https://opensource.com/article/20/8/iterm2-zsh
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://cloudmesh.github.io/pi/docs/hardware/parts/
[12]: https://opensource.com/sites/default/files/uploads/network-bridge.png (Pi cluster setup with bridge network)
[13]: https://cloudmesh.github.io/pi/tutorial/sdcard-burn-pi-headless/
[14]: https://opensource.com/article/20/10/venv-python
[15]: https://cloudmesh.github.io/cloudmesh-manual/
