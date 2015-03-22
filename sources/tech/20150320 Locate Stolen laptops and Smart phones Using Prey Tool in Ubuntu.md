Locate Stolen laptops and Smart phones Using Prey Tool in Ubuntu
================================================================================
Prey is an open source, cross platform tool which helps recover your stolen laptops, desktops, tablet computers and smart phones. It has gained vast popularity and has claimed to help recover hundreds of missing laptops and smart phones. The working of this tool is pretty simple, install it on your Laptop or smart phone, and if your device goes missing, login the Prey website with your credentials and mark your device as “Missing” there.  As soon as the thief connects your device with internet, it will immediately send you the Geo location of your device. If your laptop is having webcam, it will also capture the screenshot of the thief.

Prey consumes minimum system resources; it does not affect your device’s performance in any way. You can also use it alongside any other anti-theft application you had installed on your device. It uses secure and encrypted channels to communicate your device data with Prey servers.

### Installing and configuring Prey on Ubuntu ###

Let’s see how we can install and configure Prey on ubuntu, note that during configuration process, we will have to register an account at Prey official website. Once done, it will be able to monitor your devices. Its free account monitors up-to 3 devices, if you need to add more devices to its watch list, you need to purchase appropriate plan.

Considering the popularity and use of Prey, it has been added to the official ubuntu repository now. That means you don’t need to add any additional PPA to the package manager. Simply launch your terminal application and run the following command to install it:

    sudo apt-get install prey

![Install Prey](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Prey.png)

![Install Prey 1](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Prey-1.png)

It is a very lightweight application, uses only few MB of space on the system, once installation is completed, launch it from Applications >> Prey and it will ask you for the configuration.

Choose “New user” if you are using this app for first time.

![Prey New User](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-New-User.png)

This second step is actually the process to sign you up on Prey official website. Please provide your username, email address and password for free account.

![Register Prey](http://blog.linoxide.com/wp-content/uploads/2015/03/Register-Prey.png)

Hit “Apply” once done, that’s all, your computer is now protected by Prey.

![Prey Configuration](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Configuration.png)

Login your newly created [Prey account][1] and you should be able to see your device information there under “Devices” menu.

![Prey Web Login](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Web-Login.png)

As soon as your laptop or any other device goes missing, simply login your Prey web account and change the device status to “missing” by clicking “Set Device to Missing” option.

![Prey Missing Page](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-1.png)

Choose report frequency from here and hit “Yes, my device is missing”. Report Frequency option is the time interval after which this app will send you status updates for your device location. It will email you as soon as the device status is changed from web interface.

![Prey Missing Email](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-2.png)

As soon as your stolen device is connected to the internet, it will immediately send you report, containing your device's  Geo whereabouts and IP address.

![Prey Found Report](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-3.png)

Click the report link and you should be able to see your device’s Geo location and IP address.

![Prey Final](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Final.png)

There is one known drawback in Prey , It needs your device to be connected to internet for sending Geo location, if thief is smart enough to format your device hard disk before connecting it to the network, then you’ll never get report of its recovery. But there is still a work around to overcome this drawback, make sure to add a BIOS password and disable booting the system from removable devices.

### Conclusion ###

It is a small, very useful security application which lets you track all of your devices on a single place, although not perfect, but still provides good level of recovery chances for your stolen devices. It runs seamlessly on Linux, Windows and Mac operating system. Here are details about Prey Pro plans.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/anti-theft-application-prey-ubuntu/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://preyproject.com/