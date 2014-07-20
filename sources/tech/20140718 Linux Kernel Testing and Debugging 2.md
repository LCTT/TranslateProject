Linux Kernel Testing and Debugging
================================================================================
### Compiling and Installing Stable Kernel ###

If you cloned the stable git:

    cd linux-stable

    git checkout linux-3.x.y

or if you are using the tar-ball:

    cd linux-3.x.y

Starting out with the distribution configuration file is the safest approach for the very first kernel install on any system. You can do so by copying the configuration for your current kernel from /boot.

    cp /boot/config-3.x.y-z-generic .config

Run the following command to generate kernel configuration file based on the current configuration. You will be prompted to tune the configuration to enable new features and drivers that have been added since the Ubuntu snapshot the kernel from the mainline.

    make oldconfig

Once this step is complete, it is time to compile the kernel:

    make all

Once the kernel compilation is complete, install the new kernel:

    sudo "make modules_install install"

The above command will install the new kernel and run update-grub to add the new kernel to the grub menu. Now it is time to reboot the system to boot the newly installed kernel. Before we do that, let's save logs from the current kernel to compare and look for regressions and new errors, if any: 

    dmesg -t > dmesg_current

    dmesg -t -k > dmesg_kernel

    dmesg -t -l emerg > dmesg_current_emerg

    dmesg -t -l alert > dmesg_current_alert

    dmesg -t -l crit > dmesg_current_alert

    dmesg -t -l err > dmesg_current_err

    dmesg -t -l warn > dmesg_current_warn

In general, dmesg should be clean with no emerg, alert, crit, and err level messages. If you see any of these, it might indicate some hardware and/or kernel problem.

A couple more important steps before trying out the newly installed kernel. There is no guarantee that the new kernel will boot. As a safe guard, please ensure that there is at least one good kernel installed. Change the default grub configuration file /etc/default/grub: 

Enable printing early boot messages to vga using earlyprink=vga kernel boot option:

    GRUB_CMDLINE_LINUX="earlyprink=vga" 

Increase the GRUB_TIMEOUT value to 10 - 15 seconds, so grub pauses in menu allowing time to choose kernel to be boot:

    Uncomment GRUB_TIMEOUT and set it to 10: GRUB_TIMEOUT=10 
    Comment out GRUB_HIDDEN_TIMEOUT and GRUB_HIDDEN_TIMEOUT_QUIET 

Run update-grub to update the grun configuration in /boot

    sudo update-grub 

Now restart the system. Once the new kernel comes up, compare the saved dmesg from the old kernel with the new one and see if there are any regressions. If the newly installed kernel fails to boot, you will have to boot a good kernel and then investigate why the new kernel failed to boot. 

### Living in The Fast Lane ###

If you like driving in the fast lane and have the need for speed, clone the mainline kernel git or better yet the linux-next git. Booting and testing mainline and linux-next helps find and fix problems before the kernel is released.

Mainline:

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

linux-next:

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Compiling and installing mainline and linux-next kernels is exactly same as the stable kernel. Please follow the instructions from previous sections. 

### Applying Patches ###

Linux kernel patch files are text files that contain the differences from the original source to the new. Each Linux patch is a self-contained change to the code that stands on its own, unless explicitly made part of a patch series. New patches are applied as follows:

    patch -p1 < file.patch

    git apply --index file.patch 

Either one will work, however, when a patch adds a new file and if it is applied using the patch command, git doesn't know about the new files and they will be treated as untracked files. "git diff" will not show the files in its output and "git status" will show the files as untracked.

For the most part, there are no issues with building and installing kernels, however, "git reset --hard" will not remove the newly added files and a subsequent git pull will fail. A couple of ways to tell git about the new files and have it track them, there by avoiding the above issues: 


Option 1:

> When a patch that adds new files is applied using the patch command, run "git clean" to remove untracked files, before running "git reset --hard". For example, git clean -dfx will force remove untracked directories and files, ignoring any standard ignore rules specified in the .gitignore file. You could include -q option to run git clean in quiet mode, if you don't care to know which files are removed.

Option 2:

> An alternate approach is to tell git to track the newly added files by running "git apply --index file.patch". This will result in git applying the patch and adding the result to the index. Once this is done, git diff will show the newly added files in its output and git status will report the status correctly tagging these files as newly created files.

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,1

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出