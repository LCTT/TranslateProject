[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Teach a virtual class with Moodle on Linux)
[#]: via: (https://opensource.com/article/20/10/moodle)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Teach a virtual class with Moodle on Linux
======
Teach school remotely with the Moodle learning management system on
Linux.
![Digital images of a computer desktop][1]

The pandemic has created a greater need for remote education than ever before. This makes a learning management system (LMS) like [Moodle][2] more important than ever for ensuring that education stays on track as more and more schooling is delivered virtually.

Moodle is a free LMS written in PHP and distributed under the open source [GNU Public License][3] (GPL). It was developed by [Martin Dougiamas][4] and has been under continuous development since its release in 2002. Moodle can be used for blended learning, distance learning, flipped classrooms, and other forms of e-learning. There are currently over [190 million users][5] and 145,000 registered Moodle sites worldwide.

I have used Moodle as an administrator, teacher, and student, and in this article, I'll show you how to set it up and get started using it.

### Install Moodle on Linux

Moodle's [system requirements][6] are modest, and there is plenty of documentation to help you. My favorite installation method is by downloading it as an ISO from [Turnkey Linux][7] and installing a Moodle site in VirtualBox.

First, download the [Moodle ISO][8] and save it to your computer.

Next, install VirtualBox from the Linux command line with


```
$ sudo apt install virtualbox
```

or


```
$ sudo dnf install virtualbox
```

Once the download completes, start VirtualBox and select the **New** button on the console.

![Create a new VirtualBox][9]

(Don Watkins, [CC BY-SA 4.0][10])

Choose a name for your virtual machine, your operating system (Linux), and the type of Linux you're using (e.g., Debian 64-bit).

![Naming the VirtualBox VM][11]

(Don Watkins, [CC BY-SA 4.0][10])

Next, set your virtual machine (VM) memory size—use the default 1024MB. Then, choose a **dynamically allocated** virtual disk and attach the Moodle.iso to your virtual machine.

![Attaching Moodle.iso to VM][12]

(Don Watkins, [CC BY-SA 4.0][10])

Change your network settings from NAT to **Bridged adapter**. Then start the machine and install the ISO to create the Moodle virtual machine. During installation, you will be prompted to create passwords for the root account, MySQL, and Moodle. The Moodle password must include at least eight characters, one upper case letter, and one special character.

Reboot the virtual machine. When the installation finishes, be sure to record your Moodle appliance settings somewhere safe. (After the installation, you can delete the ISO file if you want.)

![Moodle appliance settings][13]

(Don Watkins, [CC BY-SA 4.0][10])

It's important to note that your Moodle instance isn't visible by anyone on the Internet yet. It only exists in your local network: only people in your building who are connected to the same router or wifi access point as you can access your site right now. The worldwide Internet can't get to it because you're behind a firewall (embedded in your router, and possibly also in your computer). For more information on configuring your network, read Seth Kenlon's article on [opening ports and routing traffic through your firewall.][14]

### Start using Moodle

Now you are ready to log into your Moodle machine and get familiar with the software. Log into Moodle using the default login username, **admin**, and the password you set when you created the Moodle VM.

![Moodle login screen][15]

(Don Watkins, [CC BY-SA 4.0][10])

After logging in for the first time, you'll see your new Moodle site's main Dashboard. 

![Moodle admin dashboard][16]

(Don Watkins, [CC BY-SA 4.0][10])

The default appliance name is **Turnkey Moodle**, but it's easy to change it to suit your school, classroom, or other needs and preferences. To personalize your Moodle site, in the menu on the left-hand side of the user interface, select **Site home**. Then click on the **Settings** icon on the right side of the display, and choose **Edit settings**.

![Moodle settings][17]

(Don Watkins, [CC BY-SA 4.0][10])

You can change your site's name and add a short name and site description if you'd like.

![Name Moodle site][18]

(Don Watkins, [CC BY-SA 4.0][10])

Be sure to scroll to the bottom and save your changes. Now your site is personalized.

![Moodle changes saved][19]

(Don Watkins, [CC BY-SA 4.0][10])

The default category is Miscellaneous, which won't help people identify your site's purpose. To add a category, return to the main Dashboard and select **Site administration** from the left-hand menu. Under **Courses**, select **Add a category **and enter details about your site.

![Add category option in Moodle][20]

(Don Watkins, [CC BY-SA 4.0][10])

To add a course, return to **Site administration**, and click **Add a new course**. You will see a series of options, such as naming your course, providing a short name, assigning a category, and setting the course start and end dates. You can also set options for the course's format, such as social, weekly, and topic, as well as its appearance, file upload size, completion tracking, and more.

![Add course option in Moodle][21]

(Don Watkins, [CC BY-SA 4.0][10])

### Add and manage users

Now that you have set up a course, you can add users. There are a variety of ways to do this. Manual entry is a good place to start if you are a homeschooler. Moodle supports email-based registration, [LDAP][22], [Shibboleth][23], and many others. School districts and other larger installations can upload users with a comma-delimited file. Passwords can be added in bulk, too, with a forced password change at first login. For more information, be sure to consult Moodle's [documentation][24].

Moodle is a very granular, permission-oriented environment. It is easy to assign policies and roles to users and enforce those assignments using Moodle's menus.

There are many roles within Moodle, and each has specific privileges and permissions. The default roles are manager, course creator, teacher, non-editing teacher, student, guest, and authenticated user, but you can add other ones.

### Add content to your course

Once you have your Moodle site and a course set up, you can add content to the course. Moodle has all the tools you need to create great content, and it's built on solid pedagogy that emphasizes a [social constructionist][25] view.

I created a sample course called Code with [Mu][26]. It is in the **Programming** category and **Python** subcategory.

![Moodle course list][27]

(Don Watkins, [CC BY-SA 4.0][10])

I chose a weekly format for my course with the default of four weeks. Using the editing tools, I hid all but the first week of the course. This ensures my students stay focused on the material.

As the teacher or Moodle administrator, I can add activities to each week's instruction by clicking **Add an activity** **or resource**.

![Add activity in Moodle][28]

(Don Watkins, [CC BY-SA 4.0][10])

I get a pop-up window with a variety of activities I can assign to my students.

![Moodle activities menu][29]

(Don Watkins, [CC BY-SA 4.0][10])

Moodle's tools and activities make it easy for me to create learning materials and cap off the week with a short quiz.

![Moodle activities checklist][30]

(Don Watkins, [CC BY-SA 4.0][10])

There are more than 1,600 plugins you can use to extend Moodle with new activities, question types, integrations with other systems, and more. For example, the [BigBlueButton][31] plugin supports slide sharing, a whiteboard, audio and video chat, and breakout rooms. Others to consider include the [Jitsi][32] plugin for videoconferencing, a [plagiarism checker][33], and an [Open Badge Factory][34] for awarding badges.

### Keep exploring Moodle

Moodle is a powerful LMS, and I hope this introduction whets your appetite to learn more. There are excellent [tutorials][35] to help you improve your skills, and you can see Moodle in action on its [demonstration site][36] or access [Moodle's source code][37] if you want to see what's under the hood or [contribute][38] to development. Moodle also has a great [mobile app][39] for iOS and Android, if you like to work on the go. Follow Moodle on [Twitter][40], [Facebook][41], and [LinkedIn][42] to stay up to date on what's new.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/moodle

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://moodle.org/
[3]: https://docs.moodle.org/19/en/GNU_General_Public_License
[4]: https://dougiamas.com/about/
[5]: https://docs.moodle.org/39/en/History
[6]: https://docs.moodle.org/39/en/Installation_quick_guide#Basic_Requirements
[7]: https://www.turnkeylinux.org/
[8]: https://www.turnkeylinux.org/download?file=turnkey-moodle-16.0-buster-amd64.iso
[9]: https://opensource.com/sites/default/files/uploads/virtualbox_new.png (Create a new VirtualBox)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/uploads/virtualbox_namevm.png (Naming the VirtualBox VM)
[12]: https://opensource.com/sites/default/files/uploads/virtualbox_attach-iso.png (Attaching Moodle.iso to VM)
[13]: https://opensource.com/sites/default/files/uploads/moodle_appliance.png (Moodle appliance settings)
[14]: https://opensource.com/article/20/9/firewall
[15]: https://opensource.com/sites/default/files/uploads/moodle_login.png (Moodle login screen)
[16]: https://opensource.com/sites/default/files/uploads/moodle_dashboard.png (Moodle admin dashboard)
[17]: https://opensource.com/sites/default/files/uploads/moodle_settings.png (Moodle settings)
[18]: https://opensource.com/sites/default/files/uploads/moodle_name-site.png (Name Moodle site)
[19]: https://opensource.com/sites/default/files/uploads/moodle_saved.png (Moodle changes saved)
[20]: https://opensource.com/sites/default/files/uploads/moodle_addcategory.png (Add category option in Moodle)
[21]: https://opensource.com/sites/default/files/uploads/moodle_addcourse.png (Add course option in Moodle)
[22]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[23]: https://www.shibboleth.net/
[24]: https://docs.moodle.org/39/en/Main_page
[25]: https://docs.moodle.org/39/en/Pedagogy#How_Moodle_tries_to_support_a_Social_Constructionist_view
[26]: https://opensource.com/article/20/9/teach-python-mu
[27]: https://opensource.com/sites/default/files/uploads/moodle_choosecourse.png (Moodle course list)
[28]: https://opensource.com/sites/default/files/uploads/moodle_addactivity_0.png (Add activity in Moodle)
[29]: https://opensource.com/sites/default/files/uploads/moodle_activitiesmenu.png (Moodle activities menu)
[30]: https://opensource.com/sites/default/files/uploads/moodle_activitieschecklist.png (Moodle activities checklist)
[31]: https://moodle.org/plugins/mod_bigbluebuttonbn
[32]: https://moodle.org/plugins/mod_jitsi
[33]: https://moodle.org/plugins/plagiarism_unicheck
[34]: https://moodle.org/plugins/local_obf
[35]: https://learn.moodle.org/
[36]: https://school.moodledemo.net/
[37]: https://git.in.moodle.com/moodle/moodle
[38]: https://git.in.moodle.com/moodle/moodle/-/blob/master/CONTRIBUTING.txt
[39]: https://download.moodle.org/mobile/
[40]: https://twitter.com/moodle
[41]: https://www.facebook.com/moodle
[42]: https://www.linkedin.com/company/moodle/
