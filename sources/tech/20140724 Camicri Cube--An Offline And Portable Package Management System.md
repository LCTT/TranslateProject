Camicri Cube: An Offline And Portable Package Management System
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/camicri-cube-206x205.jpg)

As we all know, we must have an Internet connection in our System for downloading and installing applications using synaptic manager or software center. But, what if you don’t have an Internet connection, or the Internet connection is dead slow? This will be definitely a headache when installing packages using software center in your Linux desktop. Instead, you can manually download the applications from their official site, and install them. But, most of the Linux users doesn’t aware about the required dependencies for the applications that they wanted to install. What could you do if you have such situation? Leave all the worries now. Today, we introduce an awesome offline package manager called **Camicri Cube**.

You can use this package manager on any Internet connected system, download the list of packages you want to install, bring them back to your offline computer, and Install them. Sounds good? Yes, It is! Cube is a package manager like Synaptic and Ubuntu Software Center, but a portable one. It can be used and run in any platform (Windows, Apt-Based Linux Distributions), online and offline, in flashdrive or any removable devices. The main goal of this project is to enable the offline Linux users to download and install Linux applications easily.

Cube will gather complete details of your offline computer such as OS details, installed applications and more. Then, just the copy the cube application using any USB thumb drive, and use it on the other Internet connected system, and download the list of applications you want. After downloading all required packages, head back to your original computer and start installing them. Cube is developed and maintained by **Jake Capangpangan**. It is written using C++, and bundled with all necessary packages. So, you don’t have to install any extra software to use it.

### Installation ###

Now, let us download and install Cube on the Offline system which doesn’t have the Internet connection. Download Cube latest version either from the [official Launchpad Page][1] or [Sourceforge site][2]. Make sure you have downloaded the correct version depending upon your offline computer architecture. As I use 64 bit system, I downloaded the 64bit version.

    wget http://sourceforge.net/projects/camicricube/files/Camicri%20Cube%201.0.9/cube-1.0.9.2_64bit.zip/

Extract the zip file and move it to your home directory or anywhere you want:

    unzip cube-1.0.9.2_64bit.zip

That’s it. Now it’s time to know how to use it.

### Usage ###

Here, I will be using Two Ubuntu systems. The original (Offline – no Internet) is running with **Ubuntu 14.04**, and the Internet connected system is running with **Lubuntu 14.04** Desktop.

#### Steps to do On Offline system: ####

From the offline system, Go to the extracted Cube folder. You’ll find an executable called “cube-linux”. Double click it, and Click Execute. If it not executable, set the executable permission as shown below.

    sudo chmod -R +x cube/

Then, go to the cube directory,

    cd cube/

And run the following command to run it.

    ./cube-linux

Enter the Project name (Ex.sk) and click **Create**. As I mentioned above, this will create a new project with complete details of your system such as OS details, list of installed applications, list of repositories etc.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0013.png)

As you know, our system is an offline computer that means I don’t have Internet connection. So I skipped the Update Repositories process by clicking on the **Cancel** button. We will update the repositories later on an Internet connected system.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0023.png)

Again, I clicked **No** to skip updating the offline computer, because we don’t have Internet connection.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0033.png)

That’s it. Now the new project has been created. The new project will be saved on your main cube folder. Go to the Cube folder, and you’ll find a folder called Projects. This folder will hold all the essential details of your  offline system.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Selection_004.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Selection_005.png)

Now, close the cube application, and copy the entire main **cube** folder to any flash drive, and go to the Internet connected system.

#### Steps to do on an Internet connected system: ####

The following steps needs to be done on the Internet connected system. In our case, Its **Lubuntu 14.04**.

Make the cube folder executable as we did in the original computer.

    sudo chmod -R +x cube/

Now, double click the file cube-linux to open it or you can launch it from the Terminal as shown below.

    cd cube/
    ./cube-linux

You will see that your project is now listed in the “Open Existing Projects” part of the window. Select your project 

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0014.png)

Then, the cube will ask if this is your project’s original computer. It’s not my original (Offline) computer, so I clicked **No**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0024.png)

You’ll be asked if you want to update your repositories. Click **Ok** to update the repositories.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0034.png)

Next, we have to update all outdated packages/applications. Click on the “**Mark All updates**” button from the Cube’s tool bar. After that, click “**Download all marked**” button to update all updated packages/applications. As you see in the below screenshot, there are 302 packages needs to be updated in my case. Then, Click **Ok** to continue to download marked packages.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_005.png)

Now, Cube will start to download all marked packages.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Downloading-packages_006.png)

We have completed updating repositories and packages. Now, you can download a new package if you want to install it on your offline system.

#### Downloading New Applications ####

For example, here I am going to download the **apache2** Package. Enter the name of the package in the **search** box, and hit Search button. The Cube will fetch the details of the application that you are looking for. Hit the “**Download this package now**” button, and click **Ok** to start download.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_008.png)

Cube will start downloading the apache2 package with all its dependencies.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Downloading-packages_009.png)

If you want to search and download more packages, simply Click the button “**Mark this package**”, and do search the required packages. You can mark as many as packages you want to install on your original computer. Once you marked all packages, hit the “**Download all marked**” button on the top tool bar to start downloading them.

After you completed updating repositories, outdated packages, and downloading new applications, close the Cube application. Then, copy the entire Cube folder to any flash drive or external hdd, and go back to your Offline system.

#### Steps to do on Offline computer: ####

Copy the Cube folder back to your Offline system on any place you want. Go to the cube folder and double click **cube-linux** file to launch Cube application.

Or, you can launch it from Terminal as shown below.

    cd cube/
    ./cube-linux

Select your project and click Open.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0012.png)

Then a dialog will ask you to update your system, please click “Yes” especially when you download new repositories, because this will transfer all new repositories to your computer.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0021.png)

You’ll see that the repositories will be updated on your offline computer without Internet connection. Because, we already have updated the repositories on the Internet connected system. Seems cool, isn’t it?

After updating the repositories, let us install all downloaded packages. Click the “Mark All Downloaded” button to select all downloaded packages, and click “Install All Marked” to install all of them from the Cube main Tool bar. The Cube application will automatically open a new Terminal, and install all packages.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Terminal_001.png)

If you encountered with dependency problems, go to **Cube Menu -> Packages -> Install packages with complete dependencies** to install all packages.

If you want to install a specific package, Navigate to the List Packages, click the “Downloaded” button, and all downloaded packages will be listed.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0035.png)

Then, double click the desired package, and click “Install this”, or “Mark this” if you want to install it later.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0043.png)

By this way, you can download the required packages from any Internet connected system, and then you can install them in your offline computer without Internet connection.

### Conclusion ###

This is one of the best and useful tool ever I have used. But during testing this tool in my Ubuntu 14.04 testbox, I faced many dependency problems, and the Cube application is suddenly closed often. Also, I could use this tool only on a fresh Ubuntu 14.04 offline system without any issues. Hope all these issues wouldn’t happen on previous versions of Ubuntu. Apart from these minor issues, this tool does this job as advertised and worked like a charm.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/camicri-cube-offline-portable-package-management-system/

原文作者：

![](http://1.gravatar.com/avatar/1ba62ac2b395f541750b6b4f873eb37b?s=70&d=monsterid&r=G)

[SK][a](Senthilkumar, aka SK, is a Linux enthusiast, FOSS Supporter & Linux Consultant from Tamilnadu, India. A passionate and dynamic person, aims to deliver quality content to IT professionals and loves very much to write and explore new things about Linux, Open Source, Computers and Internet.)

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://launchpad.net/camicricube
[2]:http://sourceforge.net/projects/camicricube/