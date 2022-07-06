[#]: subject: "How to Boot into an Older Kernel By Default in Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/boot-older-kernel-default/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Boot into an Older Kernel By Default in Ubuntu and Other Linux
======
Here’s a possible scenario. Your system received a kernel update but somehow things are not working as smoothly as previously.

You realized that if you boot into the older kernel (yes, you can downgrade kernel), things are back to normal.

That makes you happy with a little inconvenience. You have to manually select the older kernel at each boot.

This problem was faced by an elderly It’s FOSS reader. The new kernel update in [Linux Mint][1] wasn’t working as expected. Booting into the older kernel ‘fixed’ the issues but choosing the older kernel at each boot was a problem.

Removing the new kernel (while using the older kernel) is not a good idea because the new kernel will be installed and used with the next system updates.

So, I suggested booting into the older Linux kernel by default. How to do that? That’s what I am going to show you in this tutorial.

### Booting into the older Linux kernel

If you are not already familiar with it, your Linux distribution keeps more than one Linux kernel installed on your system. Don’t believe me? [List the installed kernels in Ubuntu][2] with this command:

```
apt list --installed | grep linux-image
```

When you get a new kernel version with the system updates, your system automatically chooses to boot into the latest available kernel.

From the [grub][3] screen, you can **go to the Advanced options** (or older Linux versions):

![ubuntu grub][4]

Here, you can see the available kernels to boot into. Choose the older one (without recovery option):

![grub advanced options][5]

You won’t notice any visual difference. Your files and applications remain the same.

Now that you have booted into the older kernel, it’s time to make your system boot into it automatically.

### Making older kernel the default

If you are comfortable with Linux terminal and commands, you can modify the /etc/default/grub file and add the following lines to it:

```
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```

And then [update grub][6] with:

```
sudo update-grub
```

What you did here is to tell your system to save the currently used entry as the default entry for the future runs of GRUB.

However, not everyone is okay with the command line and hence I’ll focus on a GUI tool called [Grub Customizer][7].

#### Installing Grub Customizer

Use the official PPA to [install Grub Customizer in Ubuntu-based distributions][8]:

```
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer
```

For other distributions, please use your package manager to install this tool.

#### Using Grub Customizer to change the default boot entry

When you run Grub Customizer, it shows the available boot entries.

![grub customizer ubuntu][9]

You have two options here.

**Option1:** Select the desired kernel entry and use the arrow (displayed on the top menu) to move it up the order.

![move older kernel up the order ubntu grub][10]

**Option2:** Make the ‘previously booted entry’ the ‘default entry’.

![make currently booted entry as default ubuntu][11]

I would suggest going with option 2 because it will work even when there are new kernel updates.

This way you downgrade the kernel in Ubuntu or other distributions without even removing the older kernel version.

Do note that most distributions like Ubuntu only keep two kernel versions at a time. So eventually, your preferred older kernel will be removed with the newer kernel versions.

This neat trick helped me when I [installed the latest Linux kernel in Ubuntu][12] and it had issues with my audio system for some reason.

Whatever may be the reason, you now know how to boot into an older kernel automatically.

Questions? Suggestions? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/boot-older-kernel-default/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://linuxmint.com/
[2]: https://learnubuntu.com/list-installed-kernels/
[3]: https://itsfoss.com/what-is-grub/
[4]: https://itsfoss.com/wp-content/uploads/2022/06/ubuntu-grub.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/06/Grub-Advanced-Options.jpg
[6]: https://itsfoss.com/update-grub/
[7]: https://itsfoss.com/customize-grub-linux/
[8]: https://itsfoss.com/install-grub-customizer-ubuntu/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/grub-customizer-ubuntu.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/move-older-kernel-up-the-order-ubntu-grub.png
[11]: https://itsfoss.com/wp-content/uploads/2022/06/make-currently-booted-entry-as-default-ubuntu.png
[12]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
