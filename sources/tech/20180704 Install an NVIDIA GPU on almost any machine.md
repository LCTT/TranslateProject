translated by hopefully2333

Install an NVIDIA GPU on almost any machine
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/nvidia-816x345.jpg)

Whether for research or recreation, installing a new GPU can bolster your computer’s performance and enable new functionality across the board. This installation guide uses Fedora 28’s brand-new third-party repositories to install NVIDIA drivers. It walks you through the installation of both software and hardware, and covers everything you need to get your NVIDIA card up and running. This process works for any UEFI-enabled computer, and any modern NVIDIA GPU.

### Preparation

This guide relies on the following materials:

  * A machine that is [UEFI][1] capable. If you’re uncertain whether your machine has this firmware, run sudo dmidecode -t 0. If “UEFI is supported” appears anywhere in the output, you are all set to continue. Otherwise, while it’s technically possible to update some computers to support UEFI, the process is often finicky and generally not recommended.
  * A modern, UEFI-enabled NVIDIA card
  * A power source that meets the wattage and wiring requirements for your NVIDIA card (see the Hardware & Modifications section for details)
  * Internet connection
  * Fedora 28



### Example setup

This example installation uses:

  * An Optiplex 9010 (a fairly old machine)
  * NVIDIA [GeForce GTX 1050 Ti XLR8 Gaming Overclocked Edition 4GB GDDR5 PCI Express 3.0][2] graphics card
  * In order to meet the power requirements of the new GPU, the power supply was upgraded to an [EVGA – 80 PLUS 600W ATX 12V/EPS 12V][3]. This new PSU was 300W above the minimum recommendation, but simply meeting the minimum recommendation is sufficient in most cases.
  * And, of course, Fedora 28.



### Hardware and modifications

#### PSU

Open up your desktop case and check the maximum power output printed on your power supply. Next, check the documentation on your NVIDIA GPU and determine the minimum recommended power (in watts). Further, take a look at your GPU and see if it requires additional wiring, such as a 6-pin connector. Most entry-level GPUs only draw power directly from the motherboard, but some require extra juice. You’ll need to upgrade your PSU if:

  1. Your power supply’s max power output is below the GPU’s suggested minimum power. **Note:** According to some NVIDIA card manufacturers, pre-built systems may require more or less power than recommended, depending on the system’s configuration. Use your discretion to determine your requirements if you’re using a particularly power-efficient or power-hungry setup.
  2. Your power supply does not provide the necessary wiring to power your card.



PSUs are straightforward to replace, but make sure to take note of the wiring layout before detaching your current power supply. Additionally, make sure to select a PSU that fits your desktop case.

#### CPU

Although installing a high-quality NVIDIA GPU is possible in many old machines, a slow or damaged CPU can “bottleneck” the performance of the GPU. To calculate the impact of the bottlenecking effect for your machine, click [here][4]. It’s important to know your CPU’s performance to avoid pairing a high-powered GPU with a CPU that can’t keep up. Upgrading your CPU is a potential consideration.

#### Motherboard

Before proceeding, ensure your motherboard is compatible with your GPU of choice. Your graphics card should be inserted into the PCI-E x16 slot closest to the heat-sink. Ensure that your setup contains enough space for the GPU. In addition, note that most GPUs today employ PCI-E 3.0 technology. Though these GPUs will run best if mounted on a PCI-E 3.0 x16 slot, performance should not suffer significantly with an older version slot.

### Installation
```
sudo dnf update

```

2\. Next, reboot with the simple command:
```
reboot

```

3\. After reboot, install the Fedora 28 workstation repositories:
```
sudo dnf install fedora-workstation-repositories

```

4\. Next, enable the NVIDIA driver repository:
```
sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver

```

5\. Then, reboot again.

6\. After the reboot, verify the addition of the repository via the following command:
```
sudo dnf repository-packages rpmfusion-nonfree-nvidia-driver info

```

If several NVIDIA tools and their respective specs are loaded, then proceed to the next step. If not, you may have encountered an error when adding the new repository and you should give it another shot.

7\. Login, connect to the internet, and open the software app. Click Add-ons> Hardware Drivers> NVIDIA Linux Graphics Driver> Install.

Then, reboot once again.

8\. After reboot, go to ‘Show Applications’ on the side bar, and open up the newly added NVIDIA X Server Settings application. A GUI should open up, and a dialog box will appear with the following message:

![NVIDIA X Server Prompt][5]

Take the application’s advice, but before doing so, ensure you have your NVIDIA GPU on-hand and are ready to install. **Please note** that running nvidia xconfig as root and powering off without installing your GPU immediately may cause drastic damage. Doing so may prevent your computer from booting, and force you to repair the system through the reboot screen. A fresh install of Fedora may fix these issues, but the effects can be much worse.

If you’re ready to proceed, enter the command:
```
sudo nvidia-xconfig

```

If the system prompts you to perform any downloads, accept them and proceed.

9\. Once this process is complete, close all applications and **shut down** the computer. Unplug the power supply to your machine. Then, press the power button once to drain any residual power to protect yourself from electric shock. If your PSU has a power switch, switch it off.

10\. Finally, install the graphics card. Remove the old GPU and insert your new NVIDIA graphics card into the proper PCI-E x16 slot, with the fans facing down. If there is no space for the fans to ventilate in this position, place the graphics card face up instead, if possible. When you have successfully installed the new GPU, close your case, plug in the PSU, and turn the computer on. It should successfully boot up.

**NOTE:** To disable the NVIDIA driver repository used in this installation, or to disable all fedora workstation repositories, consult [The Fedora Wiki Page][6].

### Verification

1\. If your newly installed NVIDIA graphics card is connected to your monitor and displaying correctly, then your NVIDIA driver has successfully established a connection to the GPU.

If you’d like to view your settings, or verify the driver is working (in the case that you have two GPUs installed on the motherboard), open up the NVIDIA X Server Settings app again. This time, you should not be prompted with an error message, and information on the X configuration file and your NVIDIA GPU should be available (see screenshot below).

![NVIDIA X Server Settings][7]

Through this app, you may alter your X configuration file should you please, and may monitor the GPU’s performance, clock speed, and thermal information.

2\. To ensure the new card is working at capacity, a GPU performance test is needed. GL Mark 2, a benchmarking tool that provides information on buffering, building, lighting, texturing, etc, offers an excellent solution. GL Mark 2 records frame rates for a variety of different graphical tests, and outputs an overall performance score (called the glmark2 score).

**Note:** glxgears will only test the performance of your screen or monitor, not the graphics card itself. Use GL Mark 2 instead.

To run GLMark2:

  1. Open up a terminal and close all other applications
  2. sudo dnf install glmark2
  3. glmark2
  4. Allow the test to run to completion for best results. Check to see if the frame rates match your expectation for your NVIDA card. If you’d like additional verification, consult the web to determine if a glmark2 benchmark has been previously conducted on your NVIDA card model and published to the web. Compare scores to assess your GPUs performance.
  5. If your framerates and/or glmark2 score are below expected, consider potential causes. CPU-induced bottlenecking? Other issues?



Assuming the diagnostics look good, enjoy using your new GPU.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-nvidia-gpu/

作者：[Justice del Castillo][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/justice/
[1]:https://whatis.techtarget.com/definition/Unified-Extensible-Firmware-Interface-UEFI
[2]:https://www.cnet.com/products/pny-geforce-gtx-xlr8-gaming-1050-ti-overclocked-edition-graphics-card-gf-gtx-1050-ti-4-gb/specs/
[3]:https://www.evga.com/products/product.aspx?pn=100-B1-0600-KR
[4]:http://thebottlenecker.com (Home: The Bottle Necker)
[5]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/nvidia_xserver_error.jpg?token=c6a7effe35f1c592a155a4a46a068a19fd060a91 (NVIDIA X Sever Prompt)
[6]:https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
[7]:https://bytebucket.org/kenneym/fedora-28-nvidia-gpu-installation/raw/7bee7dc6effe191f1f54b0589fa818960a8fa18b/NVIDIA_XCONFIG.png?token=64e1a7be21e5e9ba157f029b65e24e4eef54d88f (NVIDIA X Server Settings)
