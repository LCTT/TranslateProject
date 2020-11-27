[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Update devices remotely with this open source tool)
[#]: via: (https://opensource.com/article/20/9/update-remote-devices-updatehub)
[#]: author: (Domarys https://opensource.com/users/domarys)

Update devices remotely with this open source tool
======
Handle all your complete device updates, including firmware and
bootloaders, over the air with UpdateHub Community Edition.
![Working from home at a laptop][1]

The ability to access, connect, and [manage multiple devices remotely][2] through a single account is important. Going a step further, being able to completely update devices remotely is another way for sysadmins to reduce effort and minimize headaches.

[UpdateHub][3] is an open source solution that allows you to do complete device updates, including firmware and bootloaders, remotely. Its goal is to make it easier to do device updates and reduce rework and risk, whether you're updating thousands of devices or managing small deployments. UpdateHub handles all aspects of over-the-air (OTA) updates, including package integrity and authenticity, while you take care of your other work.

This step-by-step guide to UpdateHub aims to help you get started with this professional tool. There are two UpdateHub server options: [UpdateHub Cloud][4] and [UpdateHub Community Edition][3] (UpdateHub CE), a fully open source server (distributed under the MIT License), which is what this tutorial uses.

### Check the requirements

First, make sure your Linux distribution has installed all [the required packages][5] to build an image using the Yocto Project.

You also need the following hardware:

  * **Target** is the development device. This tutorial uses a [Raspberry Pi 3 Model B+][6], but you could also use a Raspberry Pi 3, Model B, or Model B+.
  * **Host** is the computer where you will build the image using the Yocto Project. This tutorial uses [Yocto 3.1 Dunfell][7].



To start UpdateHub CE, you must have [Docker][8] installed on the host. If you don't have it, see Docker's [orientation and setup][9] instructions.

This tutorial uses Google's [repo tool][10] to facilitate the process, as it requires multiple repositories. You can learn more about repo in the [Android development setup guide][11].

On Debian and Ubuntu distros, install repo with:


```
`sudo apt install repo`
```

If you're using another Linux distribution, download repo directly and set your distro with:


```
mkdir ~/bin
curl <http://commondatastorage.googleapis.com/git-repo-downloads/repo> &gt; ~/bin/repo
chmod a+x ~/bin/repo
PATH=${PATH}:~/bin
```

Finally, you need network connectivity via [DHCP][12], or you must know how to change the internet protocol (IP) address or to create a Yocto Project layer that handles this configuration.

### Prepare your environment for the build

UpdateHub provides a repository with a manifest file used by the repo tool, which makes it easier to manage multiple layers.

Download the source code by creating a directory and fetching the necessary Yocto Project layers:


```
mkdir updatehub-platform
cd updatehub-platform
repo init -u <https://github.com/UpdateHub/updatehub-yocto-project-reference-platform.git> -b dunfell
repo sync
```

After the `repo sync` command completes, you will see all the layers you need in the `sources` directory.

The UpdateHub platform provides support for multiple [supported devices][13]. During the Yocto Project environment setup, it will ask if you want to accept the end-user license agreement (EULA) of the `meta-freescale` layer; this is not necessary for this project.

Load the Yocto Project environment:


```
`MACHINE="raspberrypi3" source ./setup-environment build`
```

Note that this command is valid only for the terminal session where you loaded the environment. If you use a new terminal, you will need to load the environment again. However, you won't need to configure the machine again because the configuration content is stored in the `conf/local.conf` file.

### Start UpdateHub CE

With Docker installed, download the Docker image and start the server on port 8080:


```
`docker run -d -p 8080:8080 updatehub/updatehub-ce:latest`
```

![Installing and running the server with Docker image][14]

(Domarys Correa, [CC BY-SA 4.0][15])

Access the UpdateHub CE dashboard through the host IP address and port 8080 (`http://IP_ADDRESS:8080`). The host IP in the example is 192.168.15.50, so that would be `http://192.168.15.50:8080`.

Use the default of `admin` for the login and password, and click **Login**.

You need to configure the `UPDATEHUB_SERVER_URL` to use the UpdateHub CE address because the device needs to know the server's IP address. By default, the `meta-updatehub` layer uses the UpdateHub Cloud address in the server URL variable.

You should see UpdateHub CE's main interface:

![Accessing the UpdateHub CE dashboard][16]

(Domarys Correa, [CC BY-SA 4.0][15])

### Configure the environment to generate the image

The next step is to generate the Linux image that will be used by the device. But first, you need to set up some variables in the `conf/local.conf` file:


```
UPDATEHUB_SERVER_URL = "<http://IP\_ADDRESS:8080>"
UPDATEHUB_PACKAGE_VERSION_SUFFIX = "-test-image-1"
ENABLE_UART = "1"
UPDATEHUB_POLLING_INTERVAL = "1m"
```

Going line by line in the above code:

  * `UPDATEHUB_SERVER_URL` contains the IP address where UpdateHub CE is running.
  * `UPDATEHUB_PACKAGE_VERSION_SUFFIX` adds a suffix in the image version. This is useful for placing a version number and incrementing it for each new image. This variable will be the `VERSION_ID`, which is composed of the `DISTRO_VERSION` (described in the [docs][17]) plus the `UPDATEHUB_PACKAGE_VERSION_SUFFIX`. You can verify this in the `/etc/os-release` file in the target.
  * `ENABLE_UART`: There are several ways to access the target device, such as using the serial console or connecting a keyboard and a monitor. This variable allows access to a serial console on a Raspberry Pi by using the serial ports available on the GPIO header.
  * `UPDATEHUB_POLLING_INTERVAL`: By default, communication between UpdateHub's agent and server happens every 24 hours. Use this variable to set up a new consultation time of 1 minute.



This tutorial uses [Minicom][18] to connect with the target; if you want, you can learn more about [using the serial connection in Raspberry Pi][19].

### Generate the image

Now that the Yocto Project environment is ready, compile the image using the [BitBake][20] task-execution engine by running:


```
`bitbake updatehub-image-base`
```

Image generation can take a while, depending on the host machine. If this is the first time you are building an image for `raspberrypi3` in Yocto's Dunfell branch, BitBake will download the entire source code, so your download speed will influence the time it takes to generate the image.

Once the image is compiled, navigate to the `build/tmp/deploy/images/raspberrypi3/` host directory and verify the image file, `updatehub-image-minimal-raspberrypi3.wic.gz`, is there.

Insert an SD card into your Raspberry Pi and check its name by running `dmesg`. Then flash the image to your SD card with the following command, but make sure to change `/dev/sdX` to your SD card name:


```
`zcat updatehub-image-base-raspberrypi3.wic.gz | sudo dd of=/dev/sdX`
```

Insert the imaged SD card into the target device to connect to Raspberry Pi. The image has a network configured to obtain an IP address using DHCP. Access the console with user `root` and leave the password empty.

Confirm the version of the image running on the target using `cat /etc/os-release`.

![Viewing a version of the image with Minicom][21]

(Domarys Correa, [CC BY-SA 4.0][15])

### Generate the update package

Your device should be running and working correctly, but you need to add the feature to create an update package. This creates an image to update your target. The following example adds support for an SSH server on the target and creates an update package to install this functionality.

Add support for the OpenSSH server by adding the following line to the `build/conf/local.conf` file:


```
`IMAGE_FEATURES += "ssh-server-openssh"`
```

To make it clear that the updated image will have another version, put the suffix `-test-image-2` in the `UPDATEHUB_PACKAGE_VERSION_SUFFIX` variable:


```
`UPDATEHUB_PACKAGE_VERSION_SUFFIX = "-test-image-2"`
```

Save the file and run:


```
`bitbake updatehub-image-base -c uhuarchive`
```

This command generates a file with a `.uhupkg` extension, a format used by UpdateHub to update the system. The generated file will be in the same directory as the images are, `tmp/deploy/images/raspberrypi3`; in this example, that's `updatehub-image-base-raspberrypi3.uhupkg`.

### Check your device

To access the UpdateHub CE dashboard, click the **Devices** tab to see if your device is listed:

![Device section on the UpdateHub CE][22]

(Domarys Correa, [CC BY-SA 4.0][15])

### Send an update package

UpdateHub CE dashboard's **Packages** tab shows a list of available packages, but you do not have any yet. To add a package, click the **Upload Package** button, and select the `updatehub-image-minimal-raspberrypi3.uhupkg` file. In this example, it is in `tmp/deploy/images/raspberrypi3/directory`. A screen showing the package details will appear. This shows the process of adding an update package to the dashboard:

![Add an update package][23]

(Domarys Correa, [CC BY-SA 4.0][15])

### Create a rollout

With the device recognized and the packet sent to the server, you can create a rollout, which is essentially a deployment plan. Navigate to the **Rollouts** tab and click **Create Rollout**. Choose which package version you want to use in the upgrade. This example only has the package from the previous step, with version `20.04-test-image-2`. Choose this version, and make sure it includes the list of devices that will be updated.

![Creating a rollout and checking the device update][24]

(Domarys Correa, [CC BY-SA 4.0][15])

Previously, you configured the image running on the target to perform an update query on the UpdateHub server every minute, so within one minute of creating the rollout, the update process will start. To track the update status, check the **Rollouts** tab.

![The update process][25]

(Domarys Correa, [CC BY-SA 4.0][15])

After finishing an upgrade process, the target reboots automatically. The new image boots up and automatically queries the server for updates. The server responds that it does not have any updates and ends the update cycle.

When the status shows `updated`, run the command below on the host to access the target over SSH:


```
`ssh root@IP_DO_TARGET`
```

No password is required; just press **Enter**, and you will be in the target console. You can check the version in the `/etc/os-release` file to confirm.

### Congratulations! You're done!

Now you have access to a professional tool to update your devices remotely. This tutorial used a Raspberry Pi 3 with the Yocto Project version Dunfell 3.1.2, but [other devices and versions][13] are supported.

If you have any questions about integrating your device, access the developers' team through [Gitter][26] or by emailing [contact@updatehub.io][27].

* * *

_This article is based on [UpdateHub: Sending OTA Updates using the Yocto Project][28] on UpdateHub's blog._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/update-remote-devices-updatehub

作者：[Domarys][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/domarys
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/7/linux-shellhub
[3]: https://github.com/UpdateHub/updatehub-ce
[4]: https://updatehub.io/
[5]: https://www.yoctoproject.org/docs/2.6.1/mega-manual/mega-manual.html#required-packages-for-the-build-host
[6]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[7]: https://old.yoctoproject.org/yoctoproject/dunfell
[8]: https://www.docker.com/
[9]: https://docs.docker.com/get-started/
[10]: https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md
[11]: https://source.android.com/setup/develop
[12]: https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol
[13]: https://docs.updatehub.io/yocto-project/supported-machines/
[14]: https://opensource.com/sites/default/files/uploads/yocto1_installserver.gif (Installing and running the server with Docker image)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/sites/default/files/uploads/yocto2_updatehubce-dashboard.gif (Accessing the UpdateHub CE dashboard)
[17]: https://www.yoctoproject.org/docs/2.6.1/ref-manual/ref-manual.html#var-DISTRO_VERSION
[18]: https://wiki.emacinc.com/wiki/Getting_Started_With_Minicom
[19]: https://elinux.org/RPi_Serial_Connection
[20]: https://github.com/openembedded/bitbake
[21]: https://opensource.com/sites/default/files/uploads/yocto_confirm.gif (Viewing a version of the image with Minicom)
[22]: https://opensource.com/sites/default/files/uploads/yocto_device-dashboard.gif (Device section on the UpdateHub CE)
[23]: https://opensource.com/sites/default/files/uploads/yocto_addupdate.gif (Add an update package)
[24]: https://opensource.com/sites/default/files/uploads/yocto6_createrollout.gif (Creating a rollout and checking the device update)
[25]: https://opensource.com/sites/default/files/uploads/yocto7.gif (The update process)
[26]: https://gitter.im/UpdateHub
[27]: mailto:contact@updatehub.io
[28]: https://blog.updatehub.io/updatehub-sending-ota-updates-using-the-yocto-project/
