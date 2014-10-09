诗诗来翻译！disylee
How to configure a network printer and scanner on Ubuntu desktop
================================================================================
In a [previous article][1](注：这篇文章在2014年8月12号的原文里做过，不知道翻译了没有，如果翻译发布了，发布此文章的时候可改成翻译后的链接), we discussed how to install several kinds of printers (and also a network scanner) in a Linux server. Today we will deal with the other end of the line: how to access the network printer/scanner devices from a desktop client.

### Network Environment ###

For this setup, our server's (Debian Wheezy 7.2) IP address is 192.168.0.10, and our client's (Ubuntu 12.04) IP address is 192.168.0.105. Note that both boxes are on the same network (192.168.0.0/24). If we want to allow printing from other networks, we need to modify the following section in the cupsd.conf file on the sever:

    <Location />
      Order allow,deny
      Allow localhost
      Allow from XXX.YYY.ZZZ.*
    </Location>

(in the above example, we grant access to the printer from localhost and from any system whose IPv4 address starts with XXX.YYY.ZZZ)

To verify which printers are available on our server, we can either use lpstat command on the server, or browse to the https://192.168.0.10:631/printers page.

    root@debian:~# lpstat -a 

----------

    EPSON_Stylus_CX3900 accepting requests since Mon 18 Aug 2014 10:49:33 AM WARST
    PDF accepting requests since Mon 06 May 2013 04:46:11 PM WARST
    SamsungML1640Series accepting requests since Wed 13 Aug 2014 10:13:47 PM WARST

![](https://farm4.staticflickr.com/3903/14777969919_7b7b25a4a4_z.jpg)

### Installing Network Printers in Ubuntu Desktop ###

In our Ubuntu 12.04 client, we will open the "Printing" menu (Dash -> Printing). Note that in other distributions the name may differ a little (such as "Printers" or "Print & Fax", for example):

![](https://farm4.staticflickr.com/3837/14964314992_d8bd0c0d04_o.png)

No printers have been added to our Ubuntu client yet:

![](https://farm4.staticflickr.com/3887/14941655516_80430529b5_o.png)

Here are the steps to install a network printer on Ubuntu desktop client.

**1)** The "Add" button will fire up the "New Printer" menu. We will choose "Network printer" -> "Find Network Printer" and enter the IP address of our server, then click "Find":

![](https://farm6.staticflickr.com/5581/14777977730_74c29a99b2_z.jpg)

**2)** At the bottom we will see the names of the available printers. Let's choose the Samsung printer and press "Forward":

![](https://farm6.staticflickr.com/5585/14941655566_c1539a3ea0.jpg)

**3)** We will be asked to fill in some information about our printer. When we're done, we'll click on "Apply":

![](https://farm4.staticflickr.com/3908/14941655526_0982628fc9_z.jpg)

**4)** We will then be asked whether we want to print a test page. Let’s click on "Print test page":

![](https://farm4.staticflickr.com/3853/14964651435_cc83bb35aa.jpg)

The print job was created with local id 2:

![](https://farm6.staticflickr.com/5562/14777977760_b01c5338f2.jpg)

5) Using our server's CUPS web interface, we can observe that the print job has been submitted successfully (Printers -> SamsungML1640Series -> Show completed jobs):

![](https://farm4.staticflickr.com/3887/14778110127_359009cbbc_z.jpg)

We can also display this same information by running the following command on the printer server:

     root@debian:~# cat /var/log/cups/page_log | grep -i samsung 

----------

    SamsungML1640Series root 27 [13/Aug/2014:22:15:34 -0300] 1 1 - localhost Test Page - -
    SamsungML1640Series gacanepa 28 [18/Aug/2014:11:28:50 -0300] 1 1 - 192.168.0.105 Test Page - -
    SamsungML1640Series gacanepa 29 [18/Aug/2014:11:45:57 -0300] 1 1 - 192.168.0.105 Test Page - -

The page_log log file shows every page that has been printed, along with the user who sent the print job, the date & time, and the client's IPv4 address.

To install the Epson inkjet and PDF printers, we need to repeat steps 1 through 5, and choose the right print queue each time. For example, in the image below we are selecting the PDF printer:

![](https://farm4.staticflickr.com/3926/14778046648_c094c8422c_o.png)

However, please note that according to the [CUPS-PDF documentation][2], by default:

> PDF files will be placed in subdirectories named after the owner of the print job. In case the owner cannot be identified (i.e. does not exist on the server) the output is placed in the directory for anonymous operation (if not disabled in cups-pdf.conf - defaults to /var/spool/cups-pdf/ANONYMOUS/). 

These default directories can be modified by changing the value of the **Out** and **AnonDirName** variables in the /etc/cups/cups-pdf.conf file. Here, ${HOME} is expanded to the user's home directory:

    Out ${HOME}/PDF
    AnonDirName /var/spool/cups-pdf/ANONYMOUS

### Network Printing Examples ###

#### Example #1 ####

Printing from Ubuntu 12.04, logged on locally as gacanepa (an account with the same name exists on the printer server).

![](https://farm4.staticflickr.com/3845/14778046698_57b6e552f3_z.jpg)

After printing to the PDF printer, let's check the contents of the /home/gacanepa/PDF directory on the printer server:

    root@debian:~# ls -l /home/gacanepa/PDF 

----------

    total 368
    -rw------- 1 gacanepa gacanepa 279176 Aug 18 13:49 Test_Page.pdf
    -rw------- 1 gacanepa gacanepa   7994 Aug 18 13:50 Untitled1.pdf
    -rw------- 1 gacanepa gacanepa  74911 Aug 18 14:36 Welcome_to_Conference_-_Thomas_S__Monson.pdf

The PDF files are created with permissions set to 600 (-rw-------), which means that only the owner (gacanepa in this case) can have access to them. We can change this behavior by editing the value of the **UserUMask** variable in the /etc/cups/cups-pdf.conf file. For example, a umask of 0033 will cause the PDF printer to create files with all permissions for the owner, but read-only privileges to all others.

     root@debian:~# grep -i UserUMask /etc/cups/cups-pdf.conf 

----------

    ### Key: UserUMask
    UserUMask 0033

For those unfamiliar with umask (aka user file-creation mode mask), it acts as a set of permissions that can be used to control the default file permissions that are set for new files when they are created. Given a certain umask, the final file permissions are calculated by performing a bitwise boolean AND operation between the file base permissions (0666) and the unary bitwise complement of the umask. Thus, for a umask set to 0033, the default permissions for new files will be NOT (0033) AND 0666 = 644 (read / write / execute privileges for the owner, read-only for all others.

### Example #2 ###

Printing from Ubuntu 12.04, logged on locally as jdoe (an account with the same name doesn't exist on the server).

![](https://farm4.staticflickr.com/3907/14964315142_a71d8a8aef_z.jpg)

     root@debian:~# ls -l /var/spool/cups-pdf/ANONYMOUS 

----------

    total 5428
    -rw-rw-rw- 1 nobody nogroup 5543070 Aug 18 15:57 Linux_-_Wikipedia__the_free_encyclopedia.pdf

The PDF files are created with permissions set to 666 (-rw-rw-rw-), which means that everyone has access to them. We can change this behavior by editing the value of the **AnonUMask** variable in the /etc/cups/cups-pdf.conf file.

At this point, you may be wondering about this: Why bother to install a network PDF printer when most (if not all) current Linux desktop distributions come with a built-in "Print to file" utility that allows users to create PDF files on-the-fly?

There are a couple of benefits of using a network PDF printer:

- A network printer (of whatever kind) lets you print directly from the command line without having to open the file first.
- In a network with other operating system installed on the clients, a PDF network printer spares the system administrator from having to install a PDF creator utility on each individual machine (and also the danger of allowing end-users to install such tools).
- The network PDF printer allows to print directly to a network share with configurable permissions, as we have seen. 

### Installing a Network Scanner in Ubuntu Desktop ###

Here are the steps to installing and accessing a network scanner from Ubuntu desktop client. It is assumed that the network scanner server is already up and running as described [here][3].

**1)** Let us first check whether there is a scanner available on our Ubuntu client host. Without any prior setup, you will see the message saying that "No scanners were identified."

     $ scanimage -L 

![](https://farm4.staticflickr.com/3906/14777977850_1ec7994324_z.jpg)

**2)** Now we need to enable saned daemon which comes pre-installed on Ubuntu desktop. To enable it, we need to edit the /etc/default/saned file, and set the RUN variable to yes:

     $ sudo vim /etc/default/saned 

----------

    # Set to yes to start saned
    RUN=yes

**3)** Let's edit the /etc/sane.d/net.conf file, and add the IP address of the server where the scanner is installed:

![](https://farm6.staticflickr.com/5581/14777977880_c865b0df95_z.jpg)

**4)** Restart saned:

     $ sudo service saned restart 

**5)** Let's see if the scanner is available now:

![](https://farm4.staticflickr.com/3839/14964651605_241482f856_z.jpg)

Now we can open "Simple Scan" (or other scanning utility) and start scanning documents. We can rotate, crop, and save the resulting image:

![](https://farm6.staticflickr.com/5589/14777970169_73dd0e98e3_z.jpg)

### Summary ###

Having one or more network printers and scanner is a nice convenience in any office or home network, and offers several advantages at the same time. To name a few: 

- Multiple users (connecting from different platforms / places) are able to send print jobs to the printer's queue.
- Cost and maintenance savings can be achieved due to hardware sharing. 

I hope this article helps you make use of those advantages.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/configure-network-printer-scanner-ubuntu-desktop.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/2014/08/usb-network-printer-and-scanner-server-debian.html
[2]:http://www.cups-pdf.de/documentation.shtml
[3]:http://xmodulo.com/2014/08/usb-network-printer-and-scanner-server-debian.html#scanner
