translating by chenxinlong
# [Boot Repair Tool - Repair The Most Boot Related Problems][15]


 [![boot repair tool repair the most boot related problems ](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/boot-repair-tool-repair-the-most-boot-related-problems_orig.jpg)][1] ​We all encounter many times the boot related problems and most of them are simply related to **GRUB**. Many people find it way too hard sometimes to enter long commands or search forums to find the way they can solve it. Today I am going to tell you how to use a simple, small software to solve most of the boot related problems. This tool is known as **Boot Repair Tool**. Now no more talk and get to work.

### How To Install And Use Boot Repair Tool In Linux

​You will need a live bootable pendrive or DVD of your installed OS, so at least you can install the application and use it. Boot into your [OS][17] and open terminal and enter the following commands -
```
sudo add-apt-repository -y ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair
```
 [![install boot repair tool in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-boot-repair-tool-in-linux.jpg?1498051049)][2] ​After the installation is complete, you can launch Boot Repair Tool from the apps menu or any way you launch the app in your distro. [![run boot-repair from apps menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/run-boot-repair-from-apps-menu.jpg?1498051112)][3] ​You can see Boot Repair in the menu.
 [![Picture](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/scan-boot-issues-with-boot-repair.jpg?1498051197)][4] ​Launch it, it will do some scanning. Wait for it to finish.
 [![boot repair app menu to repair system](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/boot-repair-app-menu-to-repair-system.jpg?1498051265)][5] ​You will see this screen now which will be saying recommended repair based on the scan. There will also be an advance option in the bottom in which you can configure the aspects of the application. I will recommend inexperienced users to go with recommended repair as it is easy and in most cases does the job.
 [![apply recommended fixes to fix grub issues](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/apply-recommended-fixes-to-fix-grub-issues.jpg?1498051332)][6] ​After choosing recommended updates, it will start the repair. Wait for the further process.
 [![fix the grub menu using boot repair](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/fix-the-grub-menu-using-boot-repair.jpg?1498051422)][7] ​You will see an instruction screen now. Now it is time for our work. Open the terminal and copy and paste the highlighted command in terminal one by one.
 [![download and install grub using the given commands](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/confirm-grub-packages-installation.jpg?1498051588)][8] ​After the commands are done you will see a screen asking for confirmation like mentioned above. Select yes by using arrow keys or tab buttons and hit enter to select. Now in **Boot Repair Tool** screen hit forward. [![install grub menu and kernel to fix boot menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-grub-menu-and-kernel-to-fix-boot-menu.jpg?1498055715)][9] ​You will see this screen. Copy the command mentioned there and paste it into terminal and hit enter and let it do the job. It will take some time so be patient. It will download GRUB, [kernel][18] or whatever required to repair your boot. [![install grub](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-grub.jpg?1498055780)][10] ​You may see some options to configure where to install GRUB now. Choose yes and then hit enter and you will see the above screen. Use spacebar to select an option and TAB to navigate through options. After choosing and installation of GRUB is finished, you can close Terminal. Now select the forward option in Boot Repair Tool screen.
 [![scan for the boot issues](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/scan-for-the-boot-issues.jpg?1498055908)][11] ​Now it will do some scanning. It will ask you some options regarding confirmation. Select Yes for every option.
 [![fixed boot issues with boot rescue](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/fixed-boot-issues-with-boot-rescue.jpg?1498056040)][12] It will show you a successful confirmation message. If not and shows a failed message then a linked will be generated. Go on that link for more assistance.

After success, reboot your PC. You will see GRUB when you will reboot. You have successfully repaired your PC. Have Fun.

### Advance Tips For Boot Repair

​It happened with me that on repair when my PC was on dual boot, it failed to recognize [Windows 7 installed on another partition][19]. Here is a simple tip on how to fix it.

Open a terminal and install os-prober. It is simple and can be found in either software center or via terminal.

os-prober helps you recognize other OS installed in your PC. [![install os-prober](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-prober_orig.jpg)][13] ​After os-prober is installed, run it via terminal by typing os-prober. If failed then trying running it root. After that run update-grub command. That is all you will get the option to boot into Windows from GRUB. 
 [![upgrade-grub in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/upgrade-grub-in-linux.jpg?1498056179)][14] 

### Conclusion

​That is all. Now you have successfully repaired your PC. Go now enjoy tweaking around. I will also love to hear your experiences with <u>Boot Repair Tool</u>. Comment below, I am listening. |

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems

作者：[www.linuxandubuntu.com ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[1]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-boot-repair-tool-in-linux_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/run-boot-repair-from-apps-menu_orig.jpg
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-boot-issues-with-boot-repair_orig.jpg
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/boot-repair-app-menu-to-repair-system_orig.jpg
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/apply-recommended-fixes-to-fix-grub-issues_orig.jpg
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/fix-the-grub-menu-using-boot-repair_orig.jpg
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-grub-packages-installation_orig.jpg
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-grub-menu-and-kernel-to-fix-boot-menu_orig.jpg
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-grub_orig.jpg
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-for-the-boot-issues_orig.jpg
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/fixed-boot-issues-with-boot-rescue_orig.jpg
[13]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-prober_orig.jpg
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/upgrade-grub-in-linux_orig.jpg
[15]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems
[16]:http://www.linuxandubuntu.com/home/boot-repair-tool-repair-the-most-boot-related-problems#comments
[17]:http://www.linuxandubuntu.com/home/category/distros
[18]:http://www.linuxandubuntu.com/home/linux-kernel-40-codenamed-hurr-durr-im-a-sheep-released-installupgrade-in-ubuntulinux-mint
[19]:http://www.linuxandubuntu.com/home/how-to-dual-boot-windows-7-and-ubuntu
