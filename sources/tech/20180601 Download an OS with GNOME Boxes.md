Download an OS with GNOME Boxes
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/boxes-install-os-816x345.jpg)

Boxes is the GNOME application for running virtual machines. Recently Boxes added a new feature that makes it easier to run different Linux distributions. You can now automatically install these distros in Boxes, as well as operating systems like FreeBSD and FreeDOS. The list even includes Red Hat Enterprise Linux. The Red Hat Developer Program includes a [no-cost subscription to Red Hat Enterprise Linux][1]. With a [Red Hat Developer][2] account, Boxes can automatically set up a RHEL virtual machine entitled to the Developer Suite subscription. Here’s how it works.

### Red Hat Enterprise Linux

To create a Red Hat Enterprise Linux virtual machine, launch Boxes and click New. Select Download an OS from the source selection list. At the top, pick Red Hat Enterprise Linux. This opens a web form at [developers.redhat.com][2]. Sign in with an existing Red Hat Developer Account, or create a new one.

![][3]

If this is a new account, Boxes requires some additional information before continuing. This step is required to enable the Developer Subscription on the account. Be sure to [accept the Terms & Conditions][4] now too. This saves a step later during registration.

![][5]

Click Submit and the installation disk image starts to download. The download can take a while, depending on your Internet connection. This is a great time to go fix a cup of tea or coffee!

![][6]

Once the media has downloaded (conveniently to ~/Downloads), Boxes offers to perform an Express Install. Fill in the account and password information and click Continue. Click Create after you verify the virtual machine details. The Express Install automatically performs the entire installation! (Now is a great time to enjoy a second cup of tea or coffee, if so inclined.)

![][7]

![][8]

![][9]

Once the installation is done, the virtual machine reboots and logs directly into the desktop. Inside the virtual machine, launch the Red Hat Subscription Manager via the Applications menu, under System Tools. Enter the root password to launch the utility.

![][10]

Click the Register button and follow the steps through the registration assistant. Log in with your Red Hat Developers account when prompted.

![][11]

![][12]

Now you can download and install updates through any normal update method, such as yum or GNOME Software.

![][13]

### FreeDOS anyone?

Boxes can install a lot more than just Red Hat Enterprise Linux, too. As a front end to KVM and qemu, Boxes supports a wide variety of operating systems. Using [libosinfo][14], Boxes can automatically download (and in some cases, install) quite a few different ones.

![][15]

To install an OS from the list, select it and finish creating the new virtual machine. Some OSes, like FreeDOS, do not support an Express Install. In those cases the virtual machine boots from the installation media. You can then manually install.

![][16]

![][17]

### Popular operating systems on Boxes

These are just a few of the popular choices available in Boxes today.

![][18]![][19]![][20]![][21]![][22]![][23]

Fedora updates its osinfo-db package regularly. Be sure to check back frequently for new OS options.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/download-os-gnome-boxes/

作者：[Link Dupont][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/linkdupont/
[1]:https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available/
[2]:http://developers.redhat.com
[3]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-33-13.png
[4]:https://www.redhat.com/wapps/tnc/termsack?event%5B%5D=signIn
[5]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-34-37.png
[6]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-14-37-27.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-09-11.png
[8]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-15-19-1024x815.png
[9]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-21-53-1024x815.png
[10]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-26-29-1024x815.png
[11]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-30-48-1024x815.png
[12]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-31-17-1024x815.png
[13]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-32-29-1024x815.png
[14]:https://libosinfo.org
[15]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-20-02-56.png
[16]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-40-25.png
[17]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-15-43-02-1024x815.png
[18]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-55-20-1024x815.png
[19]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-28-28-1024x815.png
[20]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-11-43-1024x815.png
[21]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-16-58-09-1024x815.png
[22]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-17-46-38-1024x815.png
[23]:https://fedoramagazine.org/wp-content/uploads/2018/05/Screenshot-from-2018-05-25-18-34-11-1024x815.png
