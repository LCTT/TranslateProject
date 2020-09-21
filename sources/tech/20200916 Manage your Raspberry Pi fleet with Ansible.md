[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your Raspberry Pi fleet with Ansible)
[#]: via: (https://opensource.com/article/20/9/raspberry-pi-ansible)
[#]: author: (Ken Fallon https://opensource.com/users/kenfallon)

Manage your Raspberry Pi fleet with Ansible
======
A solution to the problem of updating difficult-to-reach Raspberry Pis
in the enterprise.
![Raspberries with pi symbol overlay][1]

The Raspberry Pi is a small, versatile device that makes interfacing with the real world a breeze for mere mortals. The Raspberry Pi Foundation's idea was to sell the devices at such a low cost that breaking one would be sad—but not a disaster. This is one reason it has been a massive success as an [educational tool][2]. But their usefulness has not escaped the business world, where they are becoming a valuable tool for automating the physical world.

Whether they are used for powering information displays, automating testing, controlling machinery, monitoring an environment, or doing other tasks, enterprises see Raspberry Pis as serious devices for doing serious tasks. Each model has a long product lifecycle—even the older models ([1B+][3], [2B][4], [3A+][5], [3B][6], and [3B+][7]) will remain in production until at least January 2026. There is little risk that they will go obsolete, so you can maintain a sufficiently large stock and treat them as modular components that you replace rather than fix.

### Stable hardware vs. changing software

While you can rely on the hardware to remain constant, the same is not true for the software. The Raspberry Pi's official supported operating system is [Raspberry Pi OS][8] (previously called Raspbian), and it should be updated regularly to get the latest [security and bug fixes][9].

This presents a problem. Because Raspberry Pis provide a bridge between the physical and virtual worlds, they are often installed in difficult-to-reach locations. They also tend to be installed by hardware folks, typically electricians for plants and assembly technicians for products. You do not want to waste their time by requiring them to connect a keyboard and monitor, log in [to run `raspi-config`][10], install software with `apt-get`, and then configure the software.

Since Raspberry Pi OS boots off an SD card, one approach is to always maintain an up-to-date version of the software on the SD card that the installer can just plug (and hot glue) in. A good quality assurance (QA) department will keep the SD cards under version control, so you can be assured that all new installations are on the latest release. But this solution is costly to maintain since every software update requires preparing a new image and burning it to all the SD cards. It also doesn't address how to fix all your existing devices. In some cases, you may need to create custom images for specific Raspberry Pis doing specific jobs, and it may be unavoidable that you need an installer to connect a keyboard and monitor to configure something.

A better approach is to use the same minimal base operating system install and then use [network boot][11] to maintain all the customizations and updates on the network. This requires maintaining just one base image, which is easier to manage, so it is a good approach if you have a reliable network infrastructure. Unfortunately, not all networks support this method; as the Raspberry Pi's network boot documentation says: "Due to the huge range of networking devices available, we can't guarantee that network booting will work with any device." Sadly, it is no longer an option on the [Raspberry Pi 4][12]. Furthermore, this is not an option when devices are disconnected from the network for a long period of time.

The better goal, therefore, is to produce a common base Raspberry Pi OS image that doesn't change often but, once it's installed, can automatically be customized, maintained, and managed remotely.

### Create the base image

Your base image will almost certainly need small changes from the default Raspberry Pi OS image. Fortunately, you only need to recreate the base image if the Raspberry Pi OS image is updated or you need to change something in your configuration. The typical time between major versions of Raspberry Pi OS is about two years, which is a good target maintenance lifecycle. It gives you plenty of time to swap out older devices for new ones while keeping things manageable for the QA department to maintain releases. Older versions will still be supported for security and bug fixes for [some time][13] after that.

On my Hacker Public Radio episode _[Safely enabling SSH in the default Raspbian image][14]_ in 2017, I walked through the steps to automate updating the base image. The script I created:

  * Downloads the latest image ZIP file
  * Verifies it is valid
  * Extracts the image itself
  * Enables SSH for secure remote management
  * Changes the default passwords for the root and Pi users
  * Secures the SSH server on the Pi



Since then, I have augmented the script to:

  * Enable connections to a WiFi network (`wpa_supplicant.conf`)
  * Load its configuration from an INI file, keeping sensitive information separate from the main script.
  * Use [`losetup` to simplify mounting][15] the image
  * Create a [firstboot script][16]



These changes ensure that the devices are locked down before deploying them. You can find an updated version of the [fix-ssh-on-pi script][17] on GitHub.

Now is a good time to modify the script for your environment and especially to add any security keys or digital certificates necessary for authentication. However, it's best to hold off adding any custom applications or configurations at this point, as they can be added later. For the most part, the image will behave like a generic Raspberry Pi OS image, meaning it will boot and resize the SD card as usual and install the typical default software and firmware.

The notable addition is support for a firstboot script. This is the glue that makes the Raspberry Pi run your custom configuration after the first time it configures itself. Again, I encourage you to modify the script for your environment. For example, you can have the device register itself, run through a system test and diagnostic procedures, pull down a client application, etc.

If you don't want to customize it, it will do the bare minimum needed to get your Raspberry Pi on the network so that it can be uniquely identified by the network-management software.

### Set up automatic management

If you're managing servers in a [DevOps][18] environment, you won't blink an eye at the idea of using [configuration management software][19] to control your Raspberry Pi devices. If you use a tool that requires an agent, you can include the agent software as part of the base image. Given the resources on the Raspberry Pi, though, an agentless solution such as [Ansible][20] might be the best option. It just uses SSH and Python, doesn't require any additional software on the client, the control software is easy to install, and it is easy to use.

All you need is the [Ansible software][21], a list of devices you want to manage saved in an [inventory file][22], and a [playbook][23], which is a set of instructions that you want carried out. For example, you can [update][9] the base Raspberry Pi OS image using the `apt update && apt full-upgrade` equivalent [apt module][24]. The playbook would be:


```
 - name: Run the equivalent of "apt-get update" as a separate step
    apt:
      update_cache: true
      cache_valid_time: 3600
  - name: Update all packages to the latest version
    apt:
      upgrade: dist
```

You may think installing Ansible for Raspberry Pi is overkill, but I find it is worthwhile if you need to manage more than two or three computers. Using Ansible also gives you a more hygienic network—your inventory is audited and listed in its host file, software installations are documented through its playbooks, and data and configurations are kept away from their devices, so they are easier to back up regularly.

According to [Wikipedia][25], Ansible's design goals include:

>   * **Minimal in nature**. Management systems should not impose additional dependencies on the environment.
>   * **Consistent**. With Ansible, one should be able to create consistent environments.
>   * **Secure**. Ansible does not deploy agents to nodes. Only OpenSSH and Python are required on the managed nodes.
>   * **Highly reliable**. When carefully written, an Ansible playbook can be [idempotent][26] to prevent unexpected side effects on the managed systems. It is entirely possible to have a poorly written playbook that is not idempotent.
>   * **Minimal learning required**. Playbooks use an easy and descriptive language based on YAML and Jinja templates.
>


Anyone with the correct authorization can configure a device, but you can limit authorization using standard Unix permissions. You can apply granular access to playbooks so that, for example, test operators can access just the test and diagnostic tools you install.

### How it works

Imagine you have a widget factory that includes a Raspberry Pi in its product. Your facilities team also uses them to monitor the environmental plant and security. Likewise, the engineering team uses the devices on the production lines within the manufacturing monitoring process. And the IT department uses them as disposable dumb terminals to access the head office enterprise resource planning ([ERP][27]) system. In all of these cases, downtime needs to be kept to a minimum.

We aim to deliver the exact same device with the exact same image to each of the teams.

#### Preparing the image

Common to all stages is preparing the image itself. After cloning the [fix-ssh-on-pi.bash script from github][17], a one time action is needed to edit and rename the files `fix-ssh-on-pi.ini_example` to `fix-ssh-on-pi.ini`, and `wpa_supplicant.conf_example` to `wpa_supplicant.conf`.

You only need to run the script any time that [Raspberry Pi OS][8](Raspbian) is updated, or when you changed your configuration files. I would recommend including this as part of your devops workflow. If you don’t have that in place yet then it can be automated using a simple cron job.

I would recommend having a Raspberry Pi Station dedicated to burning the latest SDCards in the store room. This would automatically burn the latest image from the network once a new card is inserted into the [external SD Card Reader][28]. With some imagination and a 3D printer, a nice unit could be manufactured for giving feedback on progress.

When a Raspberry Pi is requisitioned, the store keepers can then remove one of the finished SDCards and include it with the work order.

#### Inventory/Hosts File

In our fictitious example, the role of the device will be determined by the location of the network that it has connected to. Therefore we need to be able to identify Raspberry Pies once they come onto the network. How you approach this will entirely depend on how your network is configured, and what tools is available to you. I would advise listening to the episode by [operat0r][29] called [hpr3090 :: Locating Computers on a Enterprise Network][30] for some great tips on how to do this.

Each department would have their own provisioning server running the Ansible Software, which of course could be another Raspberry Pi. It is the standard unix/ssh permissions that dictate who has access to what within your organization. In episode [hpr3080 :: Ansible ping][31] I walked through the absolute basics of installing and troubleshooting [Ansible][20]. Since then [klaatu][32] added [hpr3162 :: Introduction to Ansible][33] which is a great introduction to the topic in general.

How the provisioning server becomes aware of the new devices can be active or passive.

You could have the [First Boot script][16] actively calling a url to register itself. You would need to have a web application listening and using the received information to register the new host in the Ansible Inventory.

This might be a good approach for departments where devices are replaced infrequently and you want them provisioned as soon as possible. As an example when a water quality monitoring station gets replaced, it would be a good idea to have it register. The Electrician could then select the exact Playbook to deploy to the device via a smart phone app.

On the other hand a passive approach may be better if you are going to be installing devices constantly, like on a production line. In that case we can assume that any new devices found on the production line network will have our test and diagnostic software installed at the beginning of the line. This can also be removed automatically prior to shipping.

One of the changes that `fix-ssh-on-pi.bash` does is that it renames the hostname of each Raspberry Pi to a version based on it’s [Ethernet MAC address][34]. As an example a [Ethernet MAC address][34] of `dc:a6:32:01:23:45` will result in a [hostname][35] of `dca632012345`.

When the Raspberry Pi finishes it’s first time boot sequence, the 3rd automatic reboot will request a IP Address from your [DHCP][36] server, that hostname will (probably) become available in the office [DNS][37] network.

At this point your Raspberry Pi is accessible using something like `ssh dca632012345`, `ssh dca632012345.local`, `ssh dca632012345.lan`, or in our example `ssh dca632012345.production.example.com`.

I included a small script on [github][17] to locate Raspberry Pies based on [Ethernet MAC address][34]. I discussed this recently on my Hacker Public Radio episode _[Locating computers on a network][38]_:


```
# ./put-pi-in-ansible-host.bash | tee all_pies.ini
[all_pies]
b827eb012345 ansible_host=192.168.1.123
dca632012345 ansible_host=192.168.1.127
b827eb897654 ansible_host=192.168.1.143
dca632897654 ansible_host=192.168.1.223
```

In my _[Ansible ping][31]_ episode on Hacker Public Radio, I used a YAML inventory file instead of the INI version above.

#### Execute a playbook

Regardless of how the provisioning server becomes aware of the devices, you now know they exist. In this example, you would deploy different playbooks based on the subnet the device is in.

Perhaps the simplest playbook you can try is this one (from _Ansible ping_ and available on [GitHub][17]):


```
\- name: Test Ping
  hosts: all
  tasks:
  - action: ping
```

You should now have everything you need to communicate with the new devices:


```
`ansible-playbook --inventory-file all_pies.ini ping-example-playbook.yaml`
```

By modifying the playbook, you can update and configure your devices any way you like. I use this to create users, update the system to the latest version, add and remove software, and do other configurations. There are several good examples available about updating your systems, such as the [Ansible apt update all packages on Ubuntu / Debian Linux][39] tutorial.

At this point, the devices cease to be generic. You will know the exact role each Raspberry Pi should have, and you can provision it as such. How custom it is will depend on the playbook, but I advise having a specific [Ansible role][40] for each task you need a Pi to do. For example, even if your widget factory has only one water-quality monitoring station, you should still define a role for it. Not only will this allow you to quickly deploy an identical replacement if necessary, but you are also documenting the process, which may be required for certifications such as [ISO 9000][41].

You now have the means to audit that updates to your network are in place and being done regularly. Hopefully, this will keep your devices secure for many years of service. This method also applies to products you ship, as they can be updated via hotspots operated by field service engineers. During regular system maintenance, the Raspberry Pi is automatically updated using credentials supplied in the `wpa_supplicant.conf` file.

### Make management easier

I hope this has opened your mind about how to tackle managing many devices more easily. All you need to get started is your PC or laptop and a Raspberry Pi. The principles of burning a generic image, creating a device inventory, and deploying a playbook are the same whether you're working on a small scale or scaling up to hundreds of devices.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/raspberry-pi-ansible

作者：[Ken Fallon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kenfallon
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://www.raspberrypi.org/education/
[3]: https://www.raspberrypi.org/products/raspberry-pi-1-model-b-plus/
[4]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[5]: https://www.raspberrypi.org/products/raspberry-pi-3-model-a-plus/
[6]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[7]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[8]: https://www.raspbian.org/
[9]: https://www.raspberrypi.org/documentation/raspbian/updating.md
[10]: https://www.raspberrypi.org/documentation/configuration/raspi-config.md
[11]: https://www.raspberrypi.org/documentation/hardware/raspberrypi/bootmodes/net_tutorial.md
[12]: https://www.raspberrypi.org/blog/raspberry-pi-4-on-sale-now-from-35/#comment-1510410
[13]: https://wiki.debian.org/DebianReleases
[14]: http://hackerpublicradio.org/eps.php?id=2356
[15]: http://man7.org/linux/man-pages/man8/losetup.8.html
[16]: https://github.com/nmcclain/raspberian-firstboot
[17]: https://github.com/kenfallon/fix-ssh-on-pi
[18]: https://en.wikipedia.org/wiki/DevOps
[19]: https://en.wikipedia.org/wiki/Comparison_of_open-source_configuration_management_software
[20]: https://www.ansible.com/
[21]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
[22]: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html
[23]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html
[24]: https://docs.ansible.com/ansible/latest/modules/apt_module.html
[25]: https://en.wikipedia.org/wiki/Ansible_%28software%29%23Design_goals
[26]: https://en.wikipedia.org/wiki/Idempotent
[27]: https://en.wikipedia.org/wiki/Enterprise_resource_planning
[28]: https://www.amazon.com/StarTech-com-4-Slot-USB-C-Card-Reader/dp/B07HVPNQRQ/
[29]: http://hackerpublicradio.org/correspondents.php?hostid=36
[30]: http://hackerpublicradio.org/eps.php?id=3090
[31]: http://hackerpublicradio.org/eps.php?id=3080
[32]: http://hackerpublicradio.org/correspondents.php?hostid=78
[33]: http://hackerpublicradio.org/eps.php?id=3162
[34]: https://en.wikipedia.org/wiki/MAC_address
[35]: https://en.wikipedia.org/wiki/Hostname
[36]: https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol
[37]: https://en.wikipedia.org/wiki/Domain_Name_System
[38]: http://hackerpublicradio.org/eps.php?id=3052
[39]: https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/
[40]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
[41]: https://en.wikipedia.org/wiki/ISO_9000
