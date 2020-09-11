[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using GNS3 with Fedora)
[#]: via: (https://fedoramagazine.org/using-gns3-with-fedora/)
[#]: author: (Shaun Assam https://fedoramagazine.org/author/sassam/)

Using GNS3 with Fedora
======

![][1]

GNS3 is [an amazing tool][2] that allows IT professionals to, quite simply, create a virtual lab. The software can virtualize or emulate a variety of systems called appliances. These appliances range from Cisco routers and switches to nodes such as Windows Server, CentOS, and Fedora. GNS3 also has the capability to utilize [containers][3]. If you’re designing and testing proof-of-concept ideas, recreating environments for troubleshooting, or want to delve into the world of network engineering, GNS3 might be for you.

As seen on their website, GNS3 is well acquainted in the enterprise world. Companies using it span from tech businesses like Intel, to scientific organizations like NASA. Even renown banks and telecom companies are included in the list. This adds great credibility to the power and reliability this open-source tool provides.

### Installation

For Fedora users, GNS3 can be easily installed from the official repository. From the command-line type:

```
sudo dnf install gns3-server gns3-gui
```

The reason for the separate packages is because GNS3 can be configured as a dedicated server. This is useful for teams to collaborate while working on a project, or problem. The dedicated servers can be installed on bare-metal or as a virtual machine.

GNS3 requires a computer with virtualization capabilities. This allows the software to utilize the computer’s hardware to increase the performance when running the appliances. To use Spice/VNC as a console install the _virt-viewer_ package.

When the installation is complete, an icon will be placed among the applications for GNS3.

![][4]

### Initial setup

Opening GNS3 for the first time will open the Setup Wizard. The options on the first screen allow users to either setup an isolated VM environment, run the topologies from the local computer, or to use a remote server. The examples in this article are performed on the local machine.

The next screen configures the application to connect to the local machine running GNS3 server. Here we see the path to the application installed locally on the server, host binding address, and port. These settings can be tweaked to match your setup. However, for a quick setup it’s best to accept the defaults.

Once the settings are verified, a confirmation will appear stating the connection to the local server was successful. The last screen in the wizard will provide a summary. Click the **Finish** button to complete the setup.

![][5]

### Finding appliances in the GNS3 Marketplace

Before venturing into the GUI, this would be a good time to visit the [GNS3 Marketplace][6]. The marketplace contains appliances, pre-configured labs, and software for use with GNS3. The options in the Marketplace are vast and beyond the scope of this article. However, let’s download an appliance to see how it works.

First, select the appliance you want (the examples in this article will use OpenWRT). Select the template for that appliance to download. Appliance templates are JSON files with the extension _gns3a_.

You can also install OS nodes without a template, or create your own. [OSBoxes.org][7] has a variety of pre-built VMWare images (VMDK) that are compatible with GNS3. For this article we’ll use the Fedora 64-bit VMWare image. You can also find images for many other distributions such as CentOS, Ubuntu, and Kali Linux.

To use Cisco appliances a service agreement or subscription to VIRL is needed to download the IOS images from Cisco. For links and guides to legally download Cisco IOS, check out David Bombal’s site at <https://davidbombal.com/gns3-download-cisco-ios-images-virl-images-best-get/>.

You may also need to install Dynamips which is not included in the official repos. However, a simple web search will point to the RPM package.

![][8]

### Importing appliances to GNS3

Now that we have some appliances let’s build a small and simple topology using the templates and images we just downloaded.

After the initial setup the **New appliance template** window will open. From here we can import template files like the _gns3a_ file downloaded from the Marketplace. Other options for adding appliances without a template include IOS devices, VMs, and Docker containers.

To add the OpenWRT router, click **Import an appliance template file**. This will open the **Add appliance** wizard. Review the information on the first screen which shows the category, vendor, architecture, and KVM status for that appliance, and click **Next**. Now select the **Server type** to run the appliance and click **Next**. This is where we can specify whether we want to run it on a remote server, in a GNS3 VM, or on the local machine. After verifying the server requirements click **Next** to continue the installation.

At this point it’s time to install the image file for the OpenWRT appliance. Select the version and click the **Download** button. This will go to the site containing the image file and download it. This article will use OpenWRT 18.06.4 downloaded from the project’s website. If the version of the image is not in the list, click the button to **Create a new version**, and enter the version number (in this case 18.06.4). Select the filename and click **Import** to import the image. GNS3 will then ask if you would like to copy the image and decompress it (if necessary). Accept it and complete the install.

![][9]

### Adding appliances without a template

To add the Fedora VM downloaded from OSBoxes, click on one of the icons on the left and select **New appliance template** near the bottom. Select **Add a Qemu virtual machine** and click **Next**. Enter a name for the appliance (in this case Fedora 30) then click **Next**. Verify the QEMU binary path and input the amount of RAM to use for the VM, then select the **Console type**. On the next screen select **New image** and browse for the VMDK file. Depending on the file-size it may take a few moments. To copy/import the image select **Yes** and once it’s completed click **Finish**.

![][10]

### Adding and connecting nodes in GNS3

Now that we have some appliances, let’s build a simple topology with OpenWRT and Fedora in GNS3. The icons on the left represent Routers, Switches, End devices, and Security devices. The second-last shows all appliances, and the bottom option is to _Add a link_ which connects the nodes to each other.

Click on the **Routers** icon and drag the OpenWRT router onto the empty workspace to the right. Click on the **End devices** icon and do the same for the computer node. Depending on how large the file is, it may take a few moments for the PC node to appear in the workspace. To connect the nodes, click **Add a link** then click on a node, select the interface (i.e. Ethernet0), then do the same with the other node (as seen in the demo below).

You can customize the consoles by going to the menu bar and selecting **Edit &gt; Preferences &gt; General**. Select the tab for **Console applications** and click the **Edit** button. From here you can choose your favourite terminal in the drop-down menu and even customize it in the text-box below.

Once everything is in place, start the nodes by clicking the green (play) button at the top. The lights in the Topology Summary section will turn green indicating the nodes are on. To open the consoles for the nodes, click the **Console to all devices** button to the left (it looks like a terminal icon). The Remote Viewer window for Fedora and a terminal window for OpenWRT will open.

Once complete you can turn off the nodes individually by right-clicking on the node and selecting **Stop**, or to stop all nodes click the red **Stop** button in the top bar.

![][11]

### Conclusion

GNS3 is a powerful piece of software with features that are beyond the scope of this article. The software is similar to Cisco’s Packet Tracer. However, Packet Tracer is a simulator with limitations to the program’s coding. GNS3 on the other hand virtualizes/emulates the nodes using the hardware’s actual OS. This provides full functionality and a closer experience to the actual hardware.

The [GNS3 documentation][12] site offers an enormous amount of resources that delve further into the workings of the application. They also offer training courses for those interested in digging deep into the workings of the software.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-gns3-with-fedora/

作者：[Shaun Assam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sassam/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3.png-816x345.jpg
[2]: https://gns3.com
[3]: https://fedoramagazine.org/running-containers-with-podman/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-app-icon-1024x768.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-initial-setup.gif
[6]: https://www.gns3.com/marketplace
[7]: https://www.osboxes.org
[8]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-marketplace.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-adding-appliance-template.gif
[10]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-adding-vm-image-without-template.gif
[11]: https://fedoramagazine.org/wp-content/uploads/2019/08/gns3-demo.gif
[12]: https://docs.gns3.com
