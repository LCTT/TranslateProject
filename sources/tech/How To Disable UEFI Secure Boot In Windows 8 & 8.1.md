How To Disable UEFI Secure Boot In Windows 8 & 8.1
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_UEFI.jpeg)

These days, if you buy a computer pre-installed with Windows, you’ll end up with either Windows 8 or Windows 8.1. Starting with Windows 8, Microsoft replaced BIOS with UEFI. UEFI is not something that Microsoft invented, instead its a protocol in existence before Windows 8. Some Mac devices have been using UEFI for some time now.

With UEFI comes the feature of “secure boot” which boots only those boot loaders that are signed in to UEFI firmware. This security feature prevents rootkit malware and provides an additional layer of security. But it has a down side, if you want to dual boot Windows 8 with Linux, Secure Boot will not allow it. Therefore it is advised to **disable secure boot in Windows 8 to allow dual booting with Linux**.

### Disable UEFI secure boot in Windows 8 and 8.1 ###

There have been too many noises around secure boot. Because of these rumors, some people almost believed that dual boot to Linux is not possible with pre-installed Windows 8. While that is true for Arm PCs, secure boot can be disabled in Intel based system. Honestly, **disabling UEFI secure boot** is not at all a herculean task and same can be said for dual booting Linux with Windows 8 UEFI.

While it is fairly straight forward to access BIOS settings, you press F10 or F12 at boot time, it’s not the same case with UEFI. To access UEFI settings, you’ll have to go from within Windows. Let’s see how to access UEFI settings to disable secure boot in Windows 8.

#### Step 1: Go to PC settings ####

Open the settings charms in Windows by pressing Windows+I keys. At the bottom, you’ll see the option of Change PC settings. Click on it.

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_1.jpeg)

#### Step 2: Go to Advanced startup ####

There will be a slight difference in PC settings for Windows 8 and Windows 8.1. Depending upon which one you are using, you can follow the respective procedure described below:

Windows 8: In Windows 8, you need to go to General PC settings and select **Advanced startup** and then click on **Restart now:**

![](http://itsfoss.com/wp-content/uploads/2014/05/Change_PC_Settings_Windows8.jpg)

**Window 8.1**: In Windows 8.1, go to **Update and recovery** from left sidebar:

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_2.jpeg)

Then click **Restart now** under **Advanced startup**:

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_3.jpeg)

Don’t worry! It won’t restart right after it, instead it will provide some option that you will see on next boot.

#### Step 4 Access UEFI settings ####

After you have clicked Restart now button, you will be presented with some options to choose from in the next screen. Select **Troubleshoot** here:

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8.jpg)

In **Troubleshoot** menu, select **Advanced options**:

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_1.jpg)

In Advanced options menu, choose **UEFI Firmware settings**:

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_2.jpg)

Next, click on **Restart** button to reboot your system in UEFI settings which ‘may’ seem to have similar interface as BIOS.

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_3.jpg)

#### Step 5: Disable secure boot in UEFI ####

By this time you must have been booted in to UEFI utility. You can change various settings here but all we want to do right now is to disable secure boot option to allow dual booting of Ubuntu or any other Linux

Move to Boot tab, there you’ll find **Secure Boot** option which is set to enabled. Use the arrow key to go to Secure Boot option and then press **enter** to select it. **Use + or – to change its value**. Confirm it when prompted. Press **F10 to save the changes** and exit the UEFI settings.

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8.jpg)

Next you’ll be booted in to Windows normally. Now you should be able to dual boot Windows 8 with Ubuntu or other Linux OS. I’ll be writing on how to dual boot Ubuntu with Windows 8 UEFI in coming days. Stay tuned.

I hope this tutorial helps you to disable secure boot in Windows 8 and Windows 8.1. Any questions or suggestions are always welcomed. Feel free to drop a comment.

--------------------------------------------------------------------------------

via: http://itsfoss.com/disable-uefi-secure-boot-in-windows-8/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出