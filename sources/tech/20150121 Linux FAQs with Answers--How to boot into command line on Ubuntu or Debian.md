Translating----geekpi

Linux FAQs with Answers--How to boot into command line on Ubuntu or Debian
================================================================================
> **Question**: I am running Ubuntu desktop, but I want to boot straight into text-mode console temporarily. What is a convenient way to disable desktop GUI and boot into a terminal? 

Linux desktop comes with a display manager (e.g., GDM, KDM, LightDM), which lets the desktop machine automatically boot into a GUI-based login environment. However, what if you want to disable GUI and boot straight into a text-mode console? For example, you are troubleshooting desktop related issues, or want to run a heavy-duty application that does not require desktop GUI.

Note that you can temporarily switch from desktop GUI to a virtual console by pressing Ctrl+Alt+F1 to F6. However, in this case your desktop GUI will be still running in the background, and thus is different from pure text-mode booting.

On Ubuntu or Debian desktop, you can enable text-mode booting by passing appropriate kernel parameters.

### Boot into Command-line Temporarily ###

If you want to disable desktop GUI and boot in text-mode just one-time, you can use GRUB menu interface.

First, power on your desktop. When you see the initial GRUB menu, press 'e'.

![](https://farm8.staticflickr.com/7490/16112246542_bc1875a397_z.jpg)

This will lead you to the next screen, where you can modify kernel booting parameters. Scroll down the screen to look for a line that begins with "linux", which indicates a list of kernel parameters. Remove from the list "quiet" and "splash". Add "text" in the list instead.

![](https://farm8.staticflickr.com/7471/15493282603_8a70f70af2_z.jpg)

The updated kernel parameter list looks like the following. Press Ctrl+x to continue booting. This will enable one-time console booting in verbose mode.

![](https://farm8.staticflickr.com/7570/15925676530_b11af59243_z.jpg)

Boot into Command-line Permanently

If you want to boot into command-line permanently, you need to [update GRUB configuration][1] which defines kernel booting parameters.

Open a default GRUB config file with a text editor.

    $ sudo vi /etc/default/grub 

Look for a line that starts with GRUB_CMDLINE_LINUX_DEFAULT, and comment out that line by prepending # sign. This will disable the initial splash screen, and enable verbose mode (i.e., showing the detailed booting procedure).

Then change GRUB_CMDLINE_LINUX="" to:

    GRUB_CMDLINE_LINUX="text"

Next, uncomment the line that says "#GRUB_TERMINAL=console".

The updated GRUB defult configuration looks like the following.

![](https://farm9.staticflickr.com/8673/16107564442_9345d94491_b.jpg)

Finally, invoke update-grub command to re-generate a GRUB2 config file under /boot, based on these changes.

    $ sudo update-grub 

At this point, your desktop should be switched from GUI booting to console booting. Verify this by rebooting.

![](https://farm8.staticflickr.com/7518/16106378151_81ac6b5a49_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/boot-into-command-line-ubuntu-debian.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/add-kernel-boot-parameters-via-grub-linux.html