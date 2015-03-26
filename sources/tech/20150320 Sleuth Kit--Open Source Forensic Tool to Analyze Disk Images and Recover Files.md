
tranlating by haimingfg

Sleuth Kit - Open Source Forensic Tool to Analyze Disk Images and Recover Files
================================================================================
SIFT is a Ubuntu based forensics distribution provided by SANS Inc. It consist of many forensics tools such as Sleuth kit / Autopsy etc . However, Sleuth kit/Autopsy tools can be installed on Ubuntu/Fedora distribution  instead of downloading complete distribution of SIFT.

Sleuth Kit /Autopsy is open source digital forensics investigation tool which is used for recovering the lost files from disk image and analysis of images for incident response. Autopsy tool is a web interface of sleuth kit which supports all features of sleuth kit. This tool is available for both  Windows and Linux Platforms.

### Install Sleuth kit ###

First of all, download Sleuth kit software from [sleuthkit][1] website. Use wget command to download it in terminal which is shown in the figure.

    # wget http://cznic.dl.sourceforge.net/project/sleuthkit/sleuthkit/4.1.3/sleuthkit-4.1.3.tar.gz

![Download Sleuth Kit](http://blog.linoxide.com/wp-content/uploads/2015/03/download-sleuthkeit.png)

Extract the sleuthkit-4.1.3.tar.gz  using following command and go inside the extracted directory

    # tar -xvzf sleuthkit-4.1.3.tar.gz

![Extraction Process](http://blog.linoxide.com/wp-content/uploads/2015/03/extract.png)

Run following command which perform the requirement check before sleuth kit installation

    #./configure

![configure](http://blog.linoxide.com/wp-content/uploads/2015/03/configure.png)

Make command compile the sleuth kit code.

    #make

![make](http://blog.linoxide.com/wp-content/uploads/2015/03/make.png)

Finally following command install it under **/usr/local** path.

    #make install

![make install](http://blog.linoxide.com/wp-content/uploads/2015/03/make-install.png)

### Install Autopsy Tool ###

Sleuth kit installation is complete and now we will install autopsy interface. Download Autopsy software from [sleuthkit's autopsy page][2] . Use wget command to download it in terminal which is shown in the figure.

    # wget http://kaz.dl.sourceforge.net/project/autopsy/autopsy/2.24/autopsy-2.24.tar.gz

![Autpsy download link](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy.png)

Extract the autopsy-2.24.tar.gz  using following command and go inside the extracted directory

    # tar -xvzf autopsy-2.24.tar.gz

![Autopsy Extraction](http://blog.linoxide.com/wp-content/uploads/2015/03/Autopsy-extraction.png)

Configuration script of autopsy asks for NSRL (National Software Reference Library) and path of **Evidence_Locker** folder.

Enter "n" for NSRL prompt and create Evidence_Locker folder under **/usr/local** directory. Autopsy stores the configuration files, audit logs and output under Evidence_Locker folder.

    #mkdir /usr/local/Evidence_Locker

    #cd autopsy-2.24

    #./configure

![Autopsy Configuration Script](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy-configuration.png)

After adding Evidence_Locker path in installation process , autopsy stores configuration files in it and shows a following message to run the autopsy program.

![Start Autopsy](http://blog.linoxide.com/wp-content/uploads/2015/03/start-autopsy.png)

Type **./autopsy** command in terminal to start the graphical interface of Sleuth kit tool.

![Autopsy Started](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy-started.png)

Type following address in the web browser to access the interface of autopsy .

    http://localhost:9999/autopsy

Main web page of autopsy plugin is shown int the following figure.

![Main Page](http://blog.linoxide.com/wp-content/uploads/2015/03/main-interface.png)

Click on the **New Case** button to start analysis in autopsy tool. Enter the case name, description about the investigation and name of agent which is shown in the following figure.

![create new case](http://blog.linoxide.com/wp-content/uploads/2015/03/create-new-case1.png)

Following web page will appear  after entering the details in the above page. Click on **Add Host** button to add details for the analyst machine.

![add host](http://blog.linoxide.com/wp-content/uploads/2015/03/add-host1.png)

Enter host name, description and time zone setting of analyst machine on the next page.

![add host-detial](http://blog.linoxide.com/wp-content/uploads/2015/03/add-host-detial.png)

Click on the **Add Image** button to add image file for forensics analysis.

![add image](http://blog.linoxide.com/wp-content/uploads/2015/03/add-image.png)

Click on the **Add Image File** button on the following web page.  It opens new web page which require Path of image file and select  type  & importing method.

![Add image file](http://blog.linoxide.com/wp-content/uploads/2015/03/Add-image-file.png)

As shown in the following figure, we have entered path of Linux image file. In our case, image file is  partition of disk.

![add image parition](http://blog.linoxide.com/wp-content/uploads/2015/03/add-image-parition.png)

Click on the next button and select **Calculate hash** option in the next page which is shown in the following figure. It also detect the file system type of the given image.

![image and file system detail](http://blog.linoxide.com/wp-content/uploads/2015/03/image-and-file-system-detail.png)

Following window shows the MD5 hash of the image file before static analysis .

![hash](http://blog.linoxide.com/wp-content/uploads/2015/03/hash1.png)

On the next web page, autopsy shows following information about the image file.

- mount point for the image
- name of image
- file system type of given image

Click on the **details** button to get more information about the given image file. It also offer extraction of unallocated fragments and strings from the  volume of image file which is shown in the following figure.

![Image detail](http://blog.linoxide.com/wp-content/uploads/2015/03/image-details.png)

Click on **Analyze** button which is shown in the below figure to start analysis on given image  . It opens another page which shows the multiple options for image analysis.

![analysis](http://blog.linoxide.com/wp-content/uploads/2015/03/analysis1.png)

Autopsy offer following features during image analysis process.

- File Analysis
- Keyword Search
- File Type
- Image Details
- Data Unit

File Analysis on given  image of Linux partition is shown in the following figure.

![Analysis of image](http://blog.linoxide.com/wp-content/uploads/2015/03/Analysis-of-image.png)

It extracts all files and folders from the given image . Extraction of deleted files are shown int he figure.

![Deleted Files](http://blog.linoxide.com/wp-content/uploads/2015/03/deleted.png)

### Conclusion ###

Hopefully this article will be useful for the beginner in static forensics analysis of disk image. Autopsy is web interface for sleuth kit which provides features such as extraction of strings , recovery of deleted files, timeline analysis, extraction of web surfing history, keyword search and email analysis on windows and linux disk images.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/autopsy-sleuth-kit-installation-ubuntu/

作者：[nido][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:http://www.sleuthkit.org/sleuthkit/download.php
[2]:http://www.sleuthkit.org/autopsy/download.php
