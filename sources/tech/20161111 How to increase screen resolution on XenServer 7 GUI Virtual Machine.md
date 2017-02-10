# How to increase screen resolution on XenServer 7 GUI Virtual Machine (VM)

Contents

*   *   [1. Objective][5]
    *   [2. Requirements][6]
    *   [3. Difficulty][7]
    *   [4. Conventions][8]
    *   [5. Instructions][9]
        *   [5.1. Obtain VM UUID][1]
        *   [5.2. Shutdown VM][2]
        *   [5.3. Update VGA a VIDEORAM settings][3]
        *   [5.4. Start VM][4]

### Objective

If your intention is to use XenServer's virtual machine as a remote desktop, the default screen resolution may not be satisfactory for your purposes. 


 ![Default xenserver screen VM resolution](https://linuxconfig.org/images/xenserver-7-default-screen-resolution.png) 


The objective is to increase screen resolution on XenServer 7 GUI Virtual Machine.

### Requirements

Privileged access to XenServer 7 system.

### Difficulty

EASY

### Conventions

*   **#** - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
*   **$** - given command to be executed as a regular non-privileged user

### Instructions

### Obtain VM UUID

First, we need to obtain a relevant UUID of the Virtual Machine on which we wish to increase a screen resolution:
```
# xe vm-list 
uuid ( RO)           : 09a3d0d3-f16c-b215-9460-50dde9123891
     name-label ( RW): CentOS 7
    power-state ( RO): running
```
Tip: It saves some time if you save this UUID as a shell variable:
```
# UUID=09a3d0d3-f16c-b215-9460-50dde9123891
```

### Shutdown VM

Gracefully shutdown your VM or shutdown using `xe vm-vm-shutdown` command:
```
# xe vm-shutdown uuid=$UUID
```

### Update VGA a VIDEORAM settings

Check your current VGA a VIDEORAM parameter settings:
```
# xe vm-param-get uuid=$UUID param-name="platform" param-key=vga
std
# xe vm-param-get uuid=$UUID param-name="platform" param-key=videoram
8
```
To increase a screen resolution, update your VGA to `std` ( if its already set, nothing needs to be done ) and `videoram` to some greater number in megabytes. Eg. 16:
```
# xe vm-param-set uuid=$UUID platform:vga=std
# xe vm-param-set uuid=$UUID platform:videoram=16
```

### Start VM

```
# xe vm-start uuid=$UUID
```

 ![increased xenserver screen VM resolution](https://linuxconfig.org/images/xenserver-7-increased-screen-resolution.png) 

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm

作者：[Lubos Rendek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm
[1]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-1-obtain-vm-uuid
[2]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-2-shutdown-vm
[3]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-3-update-vga-a-videoram-settings
[4]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-4-start-vm
[5]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h1-objective
[6]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h2-requirements
[7]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h3-difficulty
[8]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h4-conventions
[9]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-instructions
