Vito

SchoolTool: An Advanced School Management And Information System
================================================================================
[**SchoolTool**][1] is an Open Source, free, web based student information system designed for schools around the world. It is developed and distributed by [Shuttleworth][2] foundation with strong support for translation, localization and automated deployment and updates via the **Ubuntu Linux installer** and **package management system**.

SchoolTool is licensed under GPL2 and written in **Python** using the **Zope 3** framework. The main goals of this project are to create a simple turnkey student management and information system, including demographics, gradebook, attendance, calendaring and reporting for primary and secondary schools.

**Features**

- Customizable student and teacher demographics and other personal data
- Contact management for teachers, students, and their guardians
- Teacher gradebooks
- Schoolwide assessment data collection and report card generation
- Class attendance and daily participation grades
- Calendars for the school, groups, individuals, and resource booking
- Tracking and management of student interventions

**Install SchoolTool**

The core development team of SchoolTool strongly suggests and recommends to install it on Ubuntu 12.04 or later. Since they have created packages for multiple operating systems, the core development team doesn’t support them.

SchoolTool is found in the official repositories, so we can install it with command:

    $ sudo apt-get install schooltool

However, SchoolTool has a PPA to get the newer releases and development releases.

    $ sudo add-apt-repository ppa:schooltool-owners/ppa

or

    $ sudo add-apt-repository ppa:schooltool-owners/dev

Update the sources list using command:

And finally install SchoolTool using command:

    $ sudo apt-get install schooltool

**Access SchoolTool**

Open up your browser and type **http://localhost:7080/** in the address bar. If you want to open it from a remote client, edit file **/etc/schooltool/standard/paste.ini**,

    $ sudo nano /etc/schooltool/standard/paste.ini

Set the host value as 0.0.0.0 as shown below.

    host = 0.0.0.0

Save and close the file. Restart schooltool service.

    $ sudo service schooltool restart

Now you can access the SchoolTool web console using URL **http://ip-address:7080** from your browser. You will see a blank calender screen like below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Your-School-%C2%BB-Today-Mozilla-Firefox_001.png)
*Your School » Today*

**Initial Configuration**

**Change Management password:**

The default SchoolTool administrative user is “**manager**” and password is “**schooltool**”. Login using the above credentials.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/SchoolTool-Administrator-%C2%BB-Password-Mozilla-Firefox_004.png)
*Log In*

Go to the **Home** button on the upper side. Click on the **Password** under the **Settings** section. Enter the old and new password twice and click Apply.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/SchoolTool-Administrator-%C2%BB-Password-Mozilla-Firefox_004.png)
*SchoolTool Administrator » Password*

**Server Settings:**

Login to the manager account. In the Server section, you will find the details of your SchoolTool server.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-Mozilla-Firefox_005.png)
*Server*

**Setup Outgoing Mail**

SchoolTool doesn’t act a email server like Sendmail or Postfix. It will send  mails like email clients such as Thunderbird, Evolution.

To enable mail function in SchoolTool, login to manager account and goto Server tab. Click on the **Outgoing Email** link. After that, Click on the yellow colored pencil icon to change the email settings. Fill up the smtp, Email and password details and click apply.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-%C2%BB-Outgoing-Email-Settings-Mozilla-Firefox_008.png)

*Server » Outgoing Email Settings*

To verify the mail settings, click on Send Test Email under Actions menu and enter the test mail contents.

**Setup Calendar**

It is important to setup the calendar as per your Regional location. To do that, click on the **Calendar** tab on the Server section. Select your Time zone, for me it’s **Asia/Kolkatta**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-%C2%BB-Calendar-Settings-Mozilla-Firefox_009.png)

*Server » Calendar Settings*

Go to the rest of the links such as Errors, Tabs and Pack Database. Mos of them are self-explanatory. Read and change the settings as per your needs.

**Setup School**

Here we’ve come to the brief and biggest part that needs more time and attention to get things done. We can’t cover all the things in one article. So i recommend you to visit the official [documentation page][3] of the SchoolTool, go through the sections one by one and setup your school accordingly. It will take some hours or even days to setup the whole school setup. Don’t be afraid, it is not that a difficult task. SchoolTool team has a well prepared self-helf documentation with screenshots in their website. You don’t have to go anywhere to learn SchoolTool. Learn from the SchoolTool documentation page and do it yourself.

**References:**

- [SchoolTool Website][4]
- [Wikipedia][5]


via: http://www.unixmen.com/schooltool-advanced-school-management-information-system/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://schooltool.org/
[2]:http://www.shuttleworthfoundation.org/
[3]:http://book.schooltool.org/setup-toc.html
[4]:http://www.schooltool.org/
[5]:http://en.wikipedia.org/wiki/SchoolTool