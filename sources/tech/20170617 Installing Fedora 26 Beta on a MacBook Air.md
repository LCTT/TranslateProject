Translating by cycoe

Installing Fedora 26 Beta on a MacBook Air
======================


Since Fedora 26 Beta came out a few days ago, I decided it was a great time to throw it on my 13" MacBook Air.

This MacBook Air is a model number A1466 EMC 2925 which looks like a 2015ish model, 8gb mem, 2.2GHz i7, 512gb ssd.

First thing I did was download the beta. You can grab it from the [GetFedora][1] website. Once you have it downloaded, install it to a usb flash drive. From Linux, you can do this easily with the dd command.

Plug your USB drive into your computer and tail /var/log/syslog (or /var/log/messages) to see what flies by. You can also do a 'df -h' to show the storage devices to find the correct /dev/sdX.

In this example, we'll assume the USB flash drive is /dev/sdc

Code:
```
dd if=/home/rob/Downloads/Fedora-Workstation-Live-x86_64-26_Beta-1.4.iso of=/dev/sdc bs=8M status=progress oflag=direct
```

That may take a bit.. let it finish out.

Next, I shut down the macbook, counted to 5 and powered it back on. After hitting the power on button I held down the 'option' button to give me boot options. The image below shows what my choices were:

![macbook-air-fedora.jpg](https://www.linux.org/attachments/macbook-air-fedora-jpg.2763/)

Click the arrow under 'fedora' and proceed with the install.

After going through the installation I noticed that I had no wifi. Luckily I had a thunderbolt-to-ethernet dongle since this laptop doesn't actually have an ethernet port. I hopped on google and found some great instructions from [this page][2].

To set up wifi,
Update your kernel

Code:
```
sudo dnf update kernel
```

(then reboot)

Install rpmfusion repo

Code:
```
su -c 'dnf install -y http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

Install akmods and kernel-devel packages

Code:
```
sudo dnf install -y akmods "kernel-devel-uname-r == $(uname -r)"
```

Install the broadcom-wl package from rpmfusion

Code:
```
sudo dnf install -y broadcom-wl
```

Rebuild kernel extensions

Code:
```
sudo akmods
```

Then, reboot and hop on your wifi!

Messing around a little bit with it so far, I'm very impressed! All of the function keys work that I care about (screen brightness, keyboard backlight, volume).

Then, in July when the non-beta is released, I'll just dnf my way to it!

Thanks Fedora!

--------------------------------------------------------------------------------

via: https://www.linux.org/threads/installing-fedora-26-beta-on-a-macbook-air.12464/

作者：[Rob ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.org/members/rob.1/
[1]:https://getfedora.org/en/workstation/prerelease/
[2]:https://gist.github.com/jamespamplin/7a803fd5be61d4f93e0c5dcdea3f99ee
