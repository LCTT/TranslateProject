[#]: subject: "Run Linux, macOS, Windows Virtual Machines With Quickemu"
[#]: via: "https://ostechnix.com/run-linux-macos-windows-virtual-machines-with-quickemu/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Run Linux, macOS, Windows Virtual Machines With Quickemu
======
Use Quickemu To Quickly Spin Up Virtual Machines For Linux, macOS And Windows

This guide explains what is **Quickemu** and how to create and **run Linux, macOS and Windows desktop virtual machines with Quickemu** in Linux.

### What Is Quickemu?

Quickemu is a command line program to quickly create and run optimized Linux, macOS and Windows desktop virtual machines.

You don't need sudo or root permissions to run virtual machines. You can simply test any Linux, macOS or Windows VMs as a normal user and store the virtual machine configurations in your HOME directory or USB disk.

The Quickemu application consists of two CLI tools namely **quickemu** and **quickget**.

The quickget CLI tool downloads the latest ISO image for your OS. By default, the downloaded images are saved in your HOME directory. You can change it to other location for example external USB drive.

And, the Quickemu CLI tool uses **QEMU** under the hood to create and manage virtual machines. So the VMs are highly optimized and should work out of the box without any additional configuration.

### Quickemu Features

Quickemu ships with a lot of features out of the box.

* Over 300 operating systems are supported.
* Supports both EFI (with or without SecureBoot) and Legacy BIOS boot.
* Full SPICE support with host/guest clipboard sharing.
* Enables file sharing for Linux and Windows guests using VirtIO-webdavd.
* Enables file sharing for Linux and macOS guests using VirtIO-9p.
* Enables Samba file sharing between Linux, macOS and Windows guests.
* Configures automatic SSH port-forwarding for guests.
* Network port forwarding.
* Full duplex audio support.
* Smartcard, USB device pass-through.
* VirGL acceleration.
* Braille support.
* Free and Opensource.

### Install Quickemu In Linux

Quickemu is a new project and has been packaged for a few operating systems at the moment.

**Arch Linux:**

Quickemu is available in **[AUR][1]**. If you're on Arch Linux and its variants like EndeavourOS, Manjaro Linux, you can install Quickemu using **[Paru][2]** or **[Yay][3]** helpers.

```
$ paru -S quickemu
```

Or,

```
$ yay -S quickemu
```

**NixOS:**

To install Quickemu in NixOS, run:

```
$ nix-env -i quickemu
```

**Ubuntu:**

The developer of Quickemu has created a dedicated PPA for Ubuntu and its derivatives such as Elementary OS, Linux Mint and Pop!_OS.

To install Quickemu in Ubuntu and its derivatives, run the following commands one by one.

```
$ sudo apt-add-repository ppa:flexiondotorg/quickemu
```

```
$ sudo apt update
```

```
$ sudo apt install quickemu
```

For other Linux distributions, refer to the project's GitHub repository given at the end.

### Run Linux, MacOS And Windows Virtual Machines With Quickemu

Creating and managing VMs with Quickemu is just two step process.

Download the OS image, for example Alpine Linux, using quickget CLI:

```
$ quickget alpine latest
```

You can also download a specific version of the Alpine like below:

```
$ quickget alpine 3.15
```

It will create a configuration file for the chosen OS. It will be named based on the selected OS.

```
alpine-latest/alpin 100%[===================>]  47.00M  3.52MB/s    in 14s     
Checking alpine-latest/alpine-virt-3.16.0-x86_64.iso with sha256sum... Good!
Making alpine-latest.conf

To start your Alpine Linux virtual machine run:
    quickemu --vm alpine-latest.conf
```

![Download Alpine Linux ISO Image With Quickget][4]

Now start your Alpine Linux virtual machine using command:

```
$ quickemu --vm alpine-latest.conf
```

This command will create and launch the Alpine Linux virtual machine via Spicy GTK client.

![Run Alpine Linux Virtual Machine With Quickemu][5]

Please note that it is just a live system. You still need to install the OS. You can now start the Alpine OS installation as usual.

Each VM and its associated files(ISO, Qcow2, other configuration files) are stored in a separate directory in your HOME directory. For instance, if you created Alpine VM using the Alpine latest image, a new directory called "alpine-latest" will be created and the VM's related files will be kept in this directory.

```
$ ls alpine-latest
alpine-latest-agent.sock  alpine-latest.pid    alpine-latest.sh               disk.qcow2
alpine-latest.log         alpine-latest.ports  alpine-virt-3.16.0-x86_64.iso  OVMF_VARS.fd
```

As you see in the above output, my Alpine Linux VM's ISO file, Qcow2 disk file and other config files such as `.ports`, `.fd`, `.sock` etc., are saved inside **~/alpine-latest** directory.

### Accessing Virtual Machines From Host Via Terminal

Whenever you launch a VM, Quickemu will display the following useful information on your host system's terminal.

```
Quickemu 3.15 using /usr/bin/qemu-system-x86_64 v6.2.0
 - Host:     Ubuntu 22.04 LTS running Linux 5.15 (ubuntu2204)
 - CPU:      11th Gen Intel(R) Core(TM) i3-1115G4 @ 3.00GHz
 - CPU VM:   1 Socket(s), 1 Core(s), 1 Thread(s), 4G RAM
 - BOOT:     EFI (Linux), OVMF (/usr/share/OVMF/OVMF_CODE_4M.fd), SecureBoot (off).
 - Disk:     alpine-latest/disk.qcow2 (16G)
             Looks unused, booting from alpine-latest/alpine-virt-3.16.0-x86_64.iso
 - Boot ISO: alpine-latest/alpine-virt-3.16.0-x86_64.iso
 - Display:  SPICE, qxl-vga, GL (on), VirGL (off)
 - ssh:      On host:  ssh user@localhost -p 22220
 - SPICE:    On host:  spicy --title "alpine-latest" --port 5930 --spice-shared-dir /home/ostechnix/Public
 - WebDAV:   On guest: dav://localhost:9843/
 - 9P:       On guest: sudo mount -t 9p -o trans=virtio,version=9p2000.L,msize=104857600 Public-ostechnix ~/Public
 - Process:  Starting alpine-latest.conf as alpine-latest (11272)
```

As you see, It displays the configuration details of both host and VM including the other details such as how to access the VM via SSH, access the shared folder via SPICE client etc. You can use these details to access the VM from your host system.

For example, if the SSH service is configured with port 22220 in your VM, you can access the VM from your hosts system like below.

```
$ ssh -P 22220 vm-user@localhost
```

You can check the `.ports` file in the VM directory to find what SSH and SPICE ports the VM is connected to.

```
$ cat alpine-latest/alpine-latest.ports 
ssh,22220
spice,5930
```

This can be useful when you want to start the VMs in headless mode.

### Create VMs With Custom Specification(CPU Core, Disk And Memory)

By default, Quickemu will allocate the number of CPUs cores, and the size of the disk and RAM based on your host computer's specification. You can override this default behavior by using the following parameters.

* cpu_cores="2" - Specify the number of CPU cores(E.g. 2 cores) allocated to the VM.
* ram="4G" - Specify the RAM capacity(E.g. 4 GB) to allocate to the VM.
* disk_size="20G" - Specify the disk size(E.g. 20 GB) to allocate to the VM.

To create a VM with 2 CPU cores, 4 GB RAM and 20 GB hdd, edit your VM configuration file:

```
$ nano alpine-latest.conf
```

Add the following lines:

```
cpu_cores="2"
ram="4G"
disk_size="20G"
```

![Create Custom Configuration VM Using Quickemu][6]

Now, start the VM using the updated config file:

```
$ quickemu --vm alpine-latest.conf
```

### Create Desktop Shortcut For VMs

Instead of typing the whole command, you can create a desktop shortcut for your VM like below.

```
$ quickemu --vm alpine-latest.conf --shortcut
```

This command will create shortcut for the Alpine VM in `~/.local/share/applications/` location.

```
$ ls ~/.local/share/applications/
alpine-latest.desktop
```

A menu entry for the VM is also created for the VM. From now on, you can launch the VM from the Dash or menu.

![Desktop Shortcut For VMs][7]

### Start VMs With SPICE Client

Launching VMs with SPICE protocol will offer you the following benefits.

* Share clipboard between host and guest.
* Share files between host and guest.
* Enable USB pass-through.

Make sure the `spicy` client is installed and run the following command to

```
$ quickemu --vm alpine-latest.conf --display spice
```

### Use Existing ISO Images

Sometimes, you might have already downloaded the ISO files. In that case, you don't need to use "quickget" command to download the ISO file. Instead, just edit your VM configuration file:

```
$ nano alpine-latest.conf
```

Update the correct ISO file pathg(E.g. /home/ostechnix/Downloads/) like below:

```
[...]
iso="/home/ostechnix/Downloads/alpine-virt-3.16.0-x86_64.iso"
```

Now Quickemu will use the ISO file saved in the "Downloads" directory.

### Start VMs In Headless Mode

Make sure the **spicy** client is installed.

Run the following command to start the VM with SPICE, but no display attached:

```
$ quickemu --vm alpine-latest.conf --display none
```

Since the VM is started in headless mode, you can access it via SSH only.

Assuming the SSH service is configured with port 22220 in your VM, you can access the VM from your hosts system like below.

```
$ ssh -P 22220 vm-user@localhost
```

You can check the `.ports` file in the VM directory to lookup what SSH and SPICE ports the VM is connected to.

```
$ cat alpine-latest/alpine-latest.ports 
ssh,22220
spice,5930
```

### Configure Networking

**Enable Bridge Networking**

To allow your VM to a preconfigured network bridge, add the following line to the VM configuration:

```
bridge="br0"
```

**Port Forwarding**

To allow port forwarding, add the following line to VM configuration:

```
port_forwards=("22:2200" "8800:80"
```

Here,

* 22:2200 - The port 22 on your host system is forwarded to the port 2200 on your guest system.
* 8800:80 - The port 8800 on your host system is forwarded to the port 80 on your guest system.

Quickemu allows you to do a few other customization. For more details, refer the project's GitHub page given at the end.

### Delete Virtual Machine

You can delete a VM if it is no longer required using command:

```
$ quickemu --vm alpine-latest.conf --delete-vm
```

This command will the entire virtual machine along with its configuration.

### Display Help

To view Quickemu help, run:

```
$ quickemu --help

Usage
  quickemu --vm ubuntu.conf

You can also pass optional parameters
  --braille               : Enable braille support. Requires SDL.
  --delete-disk           : Delete the disk image and EFI variables
  --delete-vm             : Delete the entire VM and it's configuration
  --display               : Select display backend. 'sdl' (default), 'gtk', 'none', or 'spice'
  --fullscreen            : Starts VM in full screen mode (Ctl+Alt+f to exit)
  --ignore-msrs-always    : Configure KVM to always ignore unhandled machine-specific registers
  --screen <screen>       : Use specified screen to determine the window size.
  --shortcut              : Create a desktop shortcut
  --snapshot apply <tag>  : Apply/restore a snapshot.
  --snapshot create <tag> : Create a snapshot.
  --snapshot delete <tag> : Delete a snapshot.
  --snapshot info         : Show disk/snapshot info.
  --status-quo            : Do not commit any changes to disk/snapshot.
  --version               : Print version
```

### Conclusion

Quickemu provides an easy way to quickly deploy and run Windows, macOS and Linux desktop virtual machines.

One distinct feature of Quickemu, we can download the ISO image directly using the Quickget CLI. I don't think if this feature is included in the other virtualization applications and hypervisors.

Also Quickemu usage is very easy! If you're looking for a simple way to run optimized Virtual machines for Linux, macOS and Windows, Quickemu is perfect choice!

**Resource:**

* [Quickemu GitHub Repository][8]

--------------------------------------------------------------------------------

via: https://ostechnix.com/run-linux-macos-windows-virtual-machines-with-quickemu/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://aur.archlinux.org/packages/quickemu
[2]: https://ostechnix.com/how-to-install-paru-aur-helper-in-arch-linux/
[3]: https://ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Download-Alpine-Linux-ISO-Image-With-Quickget.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Alpine-Linux-Virtual-Machine-With-Quickemu.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/Create-Custom-Configuration-VM-Using-Quickemu.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Desktop-Shortcut-For-VMs.png
[8]: https://github.com/quickemu-project/quickemu
