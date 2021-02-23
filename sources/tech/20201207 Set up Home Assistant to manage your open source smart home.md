[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up Home Assistant to manage your open source smart home)
[#]: via: (https://opensource.com/article/20/12/home-assistant)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

Set up Home Assistant to manage your open source smart home
======
Learn how to install and configure Home Assistant in the fourth article
in this series on home automation.
![Working from home at a laptop][1]

In the [first article][2] in this series, I introduced [Home Assistant][3] and why you might be interested in it. In short, Home Assistant is an automation hub for some of the most common smart devices on the market today. It enables centralized coordination of disparate hardware. By using it, you no longer have to choose suboptimal tech from a single vendor to manage your smart home from a single app. It also means you will no longer struggle with a hundred different apps that all function slightly differently to manage all your devices. One program to rule them all… or at least that's the dream.

In the second and third articles, I looked at some of the decisions to make when developing home automation, namely [local vs. cloud control][4], and whether to choose [Zigbee, Z-Wave, or WiFi][5], just to hit the high points. This fourth article will be much more hands-on than the previous ones by walking you through setting up a virtual machine (VM) with the Home Assistant-provided image.

### Set up the VM

I won't cover all of the methods available for installing Home Assistant (HA). I run HA in a virtualized environment, and the [official installation page][6] provides VMDK, VHDX, VDI, QCOW2, and OVA downloads. I have a [libvirt][7]-based homelab, so I chose the QCOW2 image.

Regardless of which hypervisor you use, you need to make sure that the boot type is set to UEFI instead of the traditional BIOS. In Arch Linux or Fedora, you need to install the package `edk2-ovmf` to have the option available in [Virt-Manager][8]. In Ubuntu, the package is called `ovmf`. After the package is installed, restart libvirt.

When you create your VM, select the HA image you downloaded. You can accept the default options that Virt-Manager selects _until the confirmation screen_. Make sure you check the box that says **Customize configuration before install**.

![Customize configuration before install option][9]

(Steve Ovens, [CC BY-SA 4.0][10])

When you do this, make sure to change the firmware to UEFI:

![Change the firmware to UEFI][11]

(Steve Ovens, [CC BY-SA 4.0][10])

**Important note:** You cannot change the firmware type after the VM has been created. If you choose BIOS, the VM will not boot!

If you need to expand the amount of disk available to HA's VM, shut down the VM and run:


```
qemu-img resize hassos_ova-4.13.qcow2 +40G
```

Upon boot, the new space will be automatically allocated to the appropriate partitions.

The first boot can take a significant amount of time, as HA pulls down the latest versions of software from the internet and prepares them for initial launch and configuration. To be on the safe side, walk away for 10 minutes or so before attempting to pull up the webpage for the first time. In my experience, it often requires less than five minutes, but 10 minutes is a good amount of time for the system to spin up and settle.

### First-time setup

You should now be able to access the HA interface by pointing a browser to `http://homeassistant.local:8123`. However, this relies on your router to support automatic DNS registration. You can also access the webpage via its IP. In my case, that's `http://192.168.122.90:8123`.

![Home Assistant initial setup screen][12]

(Steve Ovens, [CC BY-SA 4.0][10])

Enter your username and password for the administrative HA account. Then it will prompt you to select a location.

![Home Assistant location setup][13]

(Steve Ovens, [CC BY-SA 4.0][10])

As you can see, your location is used for "sun-based automations." This means it uses your longitude and latitude to determine sunrise and sunset times and your time zone. If, for example, you have an automation that says, "turn on desk light 20 minutes before sunrise and turn off an hour after sunrise," HA uses this location information to determine what time to activate the lights. Unfortunately, you have to use the graphical map to set this information, and it may not function properly without an active internet connection.

After you have completed this, you will see a confirmation screen.

![Home Assistant configuration complete][14]

(Steve Ovens, [CC BY-SA 4.0][10])

Rather than setting up devices here, I prefer to click **Finish** and use the full UI to configure my devices. This is optional, of course. This screen may prepopulate some integrations, depending upon whether HA has automatically discovered devices on your network.

### Initial user settings

After you finish the initial configuration, you will see the Overview page. HA's default interface is called [Lovelace][15]. It is a powerful [YAML][16]-described interface. This means that even if you can't choose certain user interface (UI) elements in the graphic interface, you can open the built-in YAML editor and add them yourself.

Lovelace's default view has a single card that displays the weather based on the location you entered. Click your username (_stratus_ in this example) in the bottom-left panel.

![Home Assistant user profile][17]

(Steve Ovens, [CC BY-SA 4.0][10])

This brings up another screen with several options. Find **Advanced Mode** and make sure it is toggled on.

![Home Assistant user profile options][18]

(Steve Ovens, [CC BY-SA 4.0][10])

This setting is toggled _per user_, so if you have other administrative users, only this one (e.g., _stratus_) will have advanced settings turned on. There are quite a few options exposed when toggling **Advanced Mode**, but the one you want is the ability to run a syntax check against the HA configuration files. To see this in action, navigate to **Server Controls** by clicking on the **Configuration** option in the bottom-left panel, and then click on **Server Controls**.

![Home Assistant server controls][19]

(Steve Ovens, [CC BY-SA 4.0][10])

Clicking on the **Check Configuration** button will check all the HA configuration files for syntax errors. If it finds no errors, you will see a message in green that says **Configuration Valid!**

![Home Assistant configuration valid][20]

(Steve Ovens, [CC BY-SA 4.0][10])

### Looking ahead

Now that HA is set up and configured, you are ready to start really digging into it. In future articles, I will explain how to:

  * Install and configure add-ons
  * Create snapshots and run HA updates
  * Install the Home Assistant Community Store (HACS)
  * Configure entities via the built-in options
  * Work with MQTT
  * Create automation flows with NodeRed



And much more. If there's something else you want to learn, please share it in the comments. While I am not a Home Assistant expert, I will do my best to answer your questions about it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/home-assistant

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/11/home-assistant
[3]: https://www.home-assistant.io/
[4]: https://opensource.com/article/20/11/cloud-vs-local-home-automation
[5]: https://opensource.com/article/20/11/home-automation-part-3
[6]: https://www.home-assistant.io/hassio/installation/
[7]: https://libvirt.org/
[8]: https://virt-manager.org/
[9]: https://opensource.com/sites/default/files/uploads/libvirt_customize1.png (Customize configuration before install option)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/uploads/libvirt_customize2.png (Change the firmware to UEFI)
[12]: https://opensource.com/sites/default/files/uploads/ha-setup1-welcome.png (Home Assistant initial setup screen)
[13]: https://opensource.com/sites/default/files/uploads/ha-setup2-location.png (Home Assistant location setup)
[14]: https://opensource.com/sites/default/files/uploads/ha-setup3-finish.png (Home Assistant configuration complete)
[15]: https://www.home-assistant.io/lovelace/
[16]: https://en.wikipedia.org/wiki/YAML
[17]: https://opensource.com/sites/default/files/uploads/ha-setup3-user-profile.png (Home Assistant user profile)
[18]: https://opensource.com/sites/default/files/uploads/ha-setup4-user-advanced.png (Home Assistant user profile options)
[19]: https://opensource.com/sites/default/files/uploads/ha-setup5-server-controls.png (Home Assistant server controls)
[20]: https://opensource.com/sites/default/files/uploads/ha-setup6-check_config.png (Home Assistant configuration valid)
