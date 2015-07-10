Linux FAQs with Answers--How to install a Brother printer on Linux
================================================================================
> **Question**: I have a Brother HL-2270DW laser printer, and want to print documents from my Linux box using this printer. How can I install an appropriate Brother printer driver on my Linux computer, and use it? 

Brother is well known for its affordable [compact laser printer lineup][1]. You can get a high-quality WiFi/duplex-capable laser printer for less than 200USD, and the price keeps going down. On top of that, they provide reasonably good Linux support, so you can download and install their printer driver on your Linux computer. I bought [HL-2270DW][2] model more than a year ago, and I have been more than happy with its performance and reliability.

Here is how to install and configure a Brother printer driver on Linux. In this tutorial, I am demonstrating the installation of a USB driver for Brother HL-2270DW laser printer. So first connect your printer to a Linux computer via USB cable.

### Preparation ###

In this preparation step, go to the official [Brother support website][3], and search for the driver of your Brother printer by typing printer model name (e.g., HL-2270DW).

![](https://farm1.staticflickr.com/301/18970034829_6f3a48d817_c.jpg)

Once you go to the download page for your Brother printer, choose your Linux platform. For Debian, Ubuntu or their derivatives, choose "Linux (deb)". For Fedora, CentOS or RHEL, choose "Linux (rpm)".

![](https://farm1.staticflickr.com/380/18535558583_cb43240f8a_c.jpg)

On the next page, you will find a LPR driver as well as CUPS wrapper driver for your printer. The former is a command-line driver, while the latter allows you to configure and manage your printer via web-based administration interface. Especially the CUPS-based GUI is quite useful for (local or remote) printer maintenance. It is recommended that you install both drivers. So click on "Driver Install Tool" and download the installer file.

![](https://farm1.staticflickr.com/329/19130013736_1850b0d61e_c.jpg)

Before proceeding to run the installer file, you need to do one additional step if you are using a 64-bit Linux system.

Since Brother printer drivers are developed for 32-bit Linux, you need to install necessary 32-bit libraries on 64-bit Linux as follows.

On older Debian (6.0 or earlier) or Ubuntu (11.04 or earlier), install the following package.

    $ sudo apt-get install ia32-libs

On newer Debian or Ubuntu which has introduced multiarch, you can install the following package instead:

    $ sudo apt-get install lib32z1 lib32ncurses5

which replaces ia32-libs package. Or, you can install just:

    $ sudo apt-get install lib32stdc++6

If you are using a Red Hat based Linux, you can install:

    $ sudo yum install glibc.i686 

### Driver Installation ###

Now go ahead and extract a downloaded driver installer file.

    $ gunzip linux-brprinter-installer-2.0.0-1.gz

Next, run the driver installer file as follows.

    $ sudo sh ./linux-brprinter-installer-2.0.0-1

You will be prompted to type a printer model name. Type the model name of your printer, for example "HL-2270DW".

![](https://farm1.staticflickr.com/292/18535599323_1a94f6dae5_b.jpg)

After agreeing to GPL license agreement, accept default answers to any subsequent questions.

![](https://farm1.staticflickr.com/526/19130014316_5835939501_b.jpg)

Now LPR/CUPS printer drivers are installed. Proceed to configure your printer next.

### Printer Configuration ###

We are going to configure and manage a Brother via CUPS-based web management interface.

First, verify that CUPS daemon is running successfully.

    $ sudo netstat -nap | grep 631

Open a web browser window, and go to http://localhost:631. You will see the following CUPS printer management interface.

![](https://farm1.staticflickr.com/324/18968588688_202086fc72_c.jpg)

Go to "Administration" tab, and click on "Manage Printers" under Printers section.

![](https://farm1.staticflickr.com/484/18533632074_0526cccb86_c.jpg)

You must see your printer (HL-2270DW) listed in the next page. Click on the printer name.
![](https://farm1.staticflickr.com/501/19159651111_95f6937693_c.jpg)

In the dropdown menu titled "Administration", choose "Set As Server Default" option. This will make your printer system-wide default.

![](https://farm1.staticflickr.com/472/19150412212_b37987c359_c.jpg)

When asked to authenticate yourself, type in your Linux login information.

![](https://farm1.staticflickr.com/511/18968590168_807e807f73_c.jpg)

Now the basic configuration step is mostly done. To test print, open any document viewer application (e.g., PDF viwer), and print it. You will see "HL-2270DW" listed and chosen by default in printer setting.

![](https://farm4.staticflickr.com/3872/18970034679_6d41d75bf9_c.jpg)

Print should work now. You can see the printer status and manage printer jobs via the same CUPS web interface.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-brother-printer-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/brother_printers
[2]:http://xmodulo.com/go/hl_2270dw
[3]:http://support.brother.com/