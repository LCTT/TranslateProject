How to turn on an LED with Fedora IoT
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/LED-IoT-816x345.jpg)

Do you enjoy running Fedora, containers, and have a Raspberry Pi? What about using all three together to play with LEDs? This article introduces Fedora IoT and shows you how to install a preview image on a Raspberry Pi. You’ll also learn how to interact with GPIO in order to light up an LED.

### What is Fedora IoT?

Fedora IoT is one of the current Fedora Project objectives, with a plan to become a full Fedora Edition. The result will be a system that runs on ARM (aarch64 only at the moment) devices such as the Raspberry Pi, as well as on the x86_64 architecture.

![][1]

Fedora IoT is based on OSTree, like [Fedora Silverblue][2] and the former [Atomic Host][3].

### Download and install Fedora IoT

The official Fedora IoT images are coming with the Fedora 29 release. However, in the meantime you can download a [Fedora 28-based image][4] for this experiment.

You have two options to install the system: either flash the SD card using a dd command, or use a fedora-arm-installer tool. The Fedora Wiki offers more information about [setting up a physical device][5] for IoT. Also, remember that you might need to resize the third partition.

Once you insert the SD card into the device, you’ll need to complete the installation by creating a user. This step requires either a serial connection, or a HDMI display with a keyboard to interact with the device.

When the system is installed and ready, the next step is to configure a network connection. Log in to the system with the user you have just created choose one of the following options:

  * If you need to configure your network manually, run a command similar to the following. Remember to use the right addresses for your network:
```
    $ nmcli connection add con-name cable ipv4.addresses \
    192.168.0.10/24 ipv4.gateway 192.168.0.1 \
    connection.autoconnect true ipv4.dns "8.8.8.8,1.1.1.1" \
    type ethernet ifname eth0 ipv4.method manual

```

  * If there’s a DHCP service on your network, run a command like this:

```
    $ nmcli con add type ethernet con-name cable ifname eth0
```




### **The GPIO interface in Fedora**

Many tutorials about GPIO on Linux focus on a legacy GPIO sysfis interface. This interface is deprecated, and the upstream Linux kernel community plan to remove it completely, due to security and other issues.

The Fedora kernel is already compiled without this legacy interface, so there’s no /sys/class/gpio on the system. This tutorial uses a new character device /dev/gpiochipN provided by the upstream kernel. This is the current way of interacting with GPIO.

To interact with this new device, you need to use a library and a set of command line interface tools. The common command line tools such as echo or cat won’t work with this device.

You can install the CLI tools by installing the libgpiod-utils package. A corresponding Python library is provided by the python3-libgpiod package.

### **Creating a container with Podman**

[Podman][6] is a container runtime with a command line interface similar to Docker. The big advantage of Podman is it doesn’t run any daemon in the background. That’s especially useful for devices with limited resources. Podman also allows you to start containerized services with systemd unit files. Plus, it has many additional features.

We’ll create a container in these two steps:

  1. Create a layered image containing the required packages.
  2. Create a new container starting from our image.



First, create a file Dockerfile with the content below. This tells podman to build an image based on the latest Fedora image available in the registry. Then it updates the system inside and installs some packages:

```
FROM fedora:latest
RUN  dnf -y update
RUN  dnf -y install libgpiod-utils python3-libgpiod

```

You have created a build recipe of a container image based on the latest Fedora with updates, plus packages to interact with GPIO.

Now, run the following command to build your base image:

```
$ sudo podman build --tag fedora:gpiobase -f ./Dockerfile

```

You have just created your custom image with all the bits in place. You can play with this base container images as many times as you want without installing the packages every time you run it.

### Working with Podman

To verify the image is present, run the following command:

```
$ sudo podman images
REPOSITORY                 TAG        IMAGE ID       CREATED          SIZE
localhost/fedora           gpiobase   67a2b2b93b4b   10 minutes ago  488MB
docker.io/library/fedora   latest     c18042d7fac6   2 days ago     300MB

```

Now, start the container and do some actual experiments. Containers are normally isolated and don’t have an access to the host system, including the GPIO interface. Therefore, you need to mount it inside while starting the container. To do this, use the –device option in the following command:

```
$ sudo podman run -it --name gpioexperiment --device=/dev/gpiochip0 localhost/fedora:gpiobase /bin/bash

```

You are now inside the running container. Before you move on, here are some more container commands. For now, exit the container by typing exit or pressing **Ctrl+D**.

To list the the existing containers, including those not currently running, such as the one you just created, run:

```
$ sudo podman container ls -a
CONTAINER ID   IMAGE             COMMAND     CREATED          STATUS                              PORTS   NAMES
64e661d5d4e8   localhost/fedora:gpiobase   /bin/bash 37 seconds ago Exited (0) Less than a second ago           gpioexperiment

```

To create a new container, run this command:

```
$ sudo podman run -it --name newexperiment --device=/dev/gpiochip0 localhost/fedora:gpiobase /bin/bash

```

Delete it with the following command:

```
$ sudo podman rm newexperiment

```

### **Turn on an LED**

Now you can use the container you already created. If you exited from the container, start it again with this command:

```
$ sudo podman start -ia gpioexperiment

```

As already discussed, you can use the CLI tools provided by the libgpiod-utils package in Fedora. To list the available GPIO chips, run:

```
$ gpiodetect
gpiochip0 [pinctrl-bcm2835] (54 lines)

```

To get the list of the lines exposed by a specific chip, run:

```
$ gpioinfo gpiochip0

```

Notice there’s no correlation between the number of physical pins and the number of lines printed by the previous command. What’s important is the BCM number, as shown on [pinout.xyz][7]. It is not advised to play with the lines that don’t have a corresponding BCM number.

Now, connect an LED to the physical pin 40, that is BCM 21. Remember: the shorter leg of the LED (the negative leg, called the cathode) must be connected to a GND pin of the Raspberry Pi with a 330 ohm resistor, and the long leg (the anode) to the physical pin 40.

To turn the LED on, run the following command. It will stay on until you press **Ctrl+C** :

```
$ gpioset --mode=wait gpiochip0 21=1

```

To light it up for a certain period of time, add the -b (run in the background) and -s NUM (how many seconds) parameters, as shown below. For example, to light the LED for 5 seconds, run:

```
$ gpioset -b -s 5 --mode=time gpiochip0 21=1

```

Another useful command is gpioget. It gets the status of a pin (high or low), and can be useful to detect buttons and switches.

![Closeup of LED connection with GPIO][8]

### **Conclusion**

You can also play with LEDs using Python — [there are some examples here][9]. And you can also use the i2c devices inside the container as well. In addition, Podman is not strictly related to this Fedora edition. You can install it on any existing Fedora Edition, or try it on the two new OSTree-based systems in Fedora: [Fedora Silverblue][2] and [Fedora CoreOS][10].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/turnon-led-fedora-iot/

作者：[Alessio Ciregia][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://alciregi.id.fedoraproject.org/
[1]: https://fedoramagazine.org/wp-content/uploads/2018/08/oled-1024x768.png
[2]: https://teamsilverblue.org/
[3]: https://www.projectatomic.io/
[4]: https://kojipkgs.fedoraproject.org/compose/iot/latest-Fedora-IoT-28/compose/IoT/
[5]: https://fedoraproject.org/wiki/InternetOfThings/GettingStarted#Setting_up_a_Physical_Device
[6]: https://github.com/containers/libpod
[7]: https://pinout.xyz/
[8]: https://fedoramagazine.org/wp-content/uploads/2018/08/breadboard-1024x768.png
[9]: https://github.com/brgl/libgpiod/tree/master/bindings/python/examples
[10]: https://coreos.fedoraproject.org/
