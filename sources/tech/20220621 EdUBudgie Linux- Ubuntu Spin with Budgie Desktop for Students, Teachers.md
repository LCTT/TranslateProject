[#]: subject: "EdUBudgie Linux: Ubuntu Spin with Budgie Desktop for Students, Teachers"
[#]: via: "https://www.debugpoint.com/2022/06/edubudgie-linux-22-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EdUBudgie Linux: Ubuntu Spin with Budgie Desktop for Students, Teachers
======
EduBudgie is a new Ubuntu LTS flavour featuring the stunning Budgie desktop. We will give you a tour.

![EdUBudgie Linux 22.04 Budgie Desktop][1]

A Linux Hobbyist and educator ([Adam Dix][2]) announced that a new Budgie desktop Ubuntu spin is now available. The current version is based on the recently released Ubuntu 22.04 LTS “Jammy Jellyfish” and Budgie Desktop 10.6.

### Why another distro?

As per the creator of this distribution, the primary goal is to give an out-of-the-box experience with FOSS operating system, especially for the underprivileged education sector. How? Firstly, the distro pre-loads most of the new required educational software in its ISO image. Secondly, EduBudgie focuses on running in Chromebooks if needed. Because, as per the Google educational initiatives, millions of well-made Chromebooks are still out there. And EduBudgie can be installed easily on those hardware (either dual boot or a fresh install). And this will make the Chromebooks usable for the underfunded schools worldwide.

Besides, there are not many Educational Linux Linux distros out there. Hence, this distro aims to save time and cost for schools and university administrations by installing additional packages, solving dependencies, etc.

### EdUBudgie Linux 22.04 Review

#### Installation

The latest ISO image size of EdUBudgie Linux is 5.7 GB which is relatively higher. The primary reason is that many apps are pre-loaded into the ISO to help educators.

The installer is Ubuntu’s Ubiquity installer for EdUBudgie, and installation takes around 5 minutes with basic packages. There were no errors or problems during installation during our quick test.

However, this distro requires a minimum of ~32 GB of disk space on the root partition for installation. It is a hard requirement for installation.

![EdUBudgie requirement on disk space][3]

#### First Look

Budgie desktop looks sleek and beautiful by itself. The primary taskbar cum system tray is at the top. The main application menu is at the left of the top bar. In the middle, you get the fixed app shortcuts which act as a Dock. The system tray is on the right side of the bar.

The application menu is your traditional “Budgie app menu” and looks nice and clean.

Moreover, it has a GRID view and a search and list view. Also, the power options are present inside the App menu itself.

![App Menu Grid View][4]

![App Menu List View][5]

The overall look perfectly balances a professional and not too fancy look. It uses the chromeos-compact GTK2 theme with the win10 icon pack.

#### Applications

Let me give you a basic example. The application stack of EdUBudgie Linux is well-curated. It’s a mix of GNOME apps, Mint apps and Budgie. An essential app is a Calculator for a student. So, the EdUBudie brings the excellent Qalculate advanced calculator for the need. As you can see, much thought went into curating pre-loaded apps.

Let’s have a quick recap of the apps by their categories.

##### Accessories and Educational Apps

Firstly, in the Accessories section, you get the Nemo file manager (from Linux Mint). Perhaps Nemo is the second-best File manager after Dolphin if you compare the features. Hence, it’s a good choice.

In addition, it brings the new GNOME Screenshot tool, new [Gnome Text Editor][6], a To-Do List and Break Timer to remind you to take breaks during your study sessions.

Secondly, the main Educational applications are chosen to cater to different classes of students. Here’s a list:

* gbrainy: A educational quiz, games that feature math and other subjects to keep your mind active
* GeoGebra: Famous open-source program to plot complex mathematical graphs.
* Kig: An interactive Geometry application which makes you think about your ideas. This is one of the best [KDE apps][7] out there.
* KWordQuiz: Improve your English language vocabulary using this excellent app.
* OpenBoard: A necessary tool for taking notes, and rough drawing and perhaps one of the [best whiteboard app][8]s.
* Scratch: A click-and-point programmable animation program developed by MIT for junior students. It helps to learn about the basics of logic and flows in programming.

The impressive list, isn’t it?

Here are some of the images of the above apps for your reference.

![Scratch][9]

![Kig][10]

![GeoGebra][11]

![gbrainy][12]

Let’s talk about the Science and Programming applications.

##### Science and Programming

The programming applications include Geany and Visual Studio Code Editor, an excellent choice as IDE for development. In addition, it contains the following applications for various needs.

* BASIC-256: A program to learn BASIC for young students
* KAlgebra: Math expression solver and graph plotter
* Kalzium: View and understand the Chemical periodic table of elements
* KGeography: View the maps of continents and countries
* KiCad App Suite: CAD drawing
* LibreCAD: Free CAD Drawing app

##### Office and Graphics Apps

Office-suite is an important aspect of any educational operating system. EduBUdgie brings the WPS Office as a default office program for documents, spreadsheets and presentations. This is an interesting choice over LibreOffice.

In addition, you can use Calibre e-book management and Wondershare EdrawMind for diagrams and flowcharts. However, Wondershare EdrawMind is not open-source and comes with limited features. You can use free and open-source Dia, which is also pre-loaded.

The Graphics suite of apps includes all famous open-source apps. A quick list is presented below.

* Blender 3D Drawing
* Darktable RAW Photo manager
* GIMP for raster image processing
* Inkscape for Vector Image
* Krita
* Scribus

Finally, EdUBudgie uses Geary email client, Google Chrome default web browser and Tilix terminal.

##### Remote Communication

Finally, look at the essential apps needed in today’s world. Due to the Pandemic, the schools and universities also conduct classes online. Furthermore, in-person communication is problematic for various reasons for students. With that in mind, EdUBudgie brings communication apps for everyone.

Firstly, the famous Zoom client is pre-installed, which helps you to participate in video conferences and meetings. Secondly, Skype and Microsoft Teams Linux clients are installed to join discussions on Microsoft networks. Besides that, Rambox brings a super-productivity boost to your study where you can create workspaces with multiple apps such as mails, messenger, Slack, etc.

![EdUBudgie Brings well-curated Communication Apps for Linux][13]

##### A mix of backend tech

As you can see from the above list of applications, the apps are chosen from different distros. It consists of KDE Plasma, Linux Mint, GNOME and other tech-based apps. Hence, all the backend packages such as Qt, Java (OpenJDK), and GTK4 are well tested and punched into the ISO. This is a significant feat by itself.

#### Performance

You may be wondering about performance because there are so many applications. Well, with a significant workload which includes multiple heavy apps (Teams, Skype etc.) running simultaneously, it consumes around 62% of your available RAM (i.e. 2.4 GB of 4 GB RAM). Also, the CPU is at 20% on average.

It is an excellent performance metric considering all the apps and their memory footprint. The Budgie desktop itself is well optimized and contributes to this performance.

In addition, the idle state performance is also good, i.e. 1 GB of memory and CPU is within 5%. The idle state resources used by X.Org, lightdm and systemd.

Finally, EdUBudgie Linux uses 19 GB of disk space for its base installation.

![EdUBudgie Linux Performance (average workload)][14]

![EdUBudgie Linux Performance (idle)][15]

### Closing Notes

I am impressed by this distribution on how it is well designed and focused on only one purpose. Not to mention the super-fast performance of the Budgie desktop itself. Also, thanks to the mix of GTK4, Budgie desktop components and icon themes, it looks professional.

Moreover, the stability, performance and long-term support (via Ubuntu LTS) are just add-ons to the excellent list of features. You can use this distribution for your daily driver, making it more appealing even if you are not a student.

You can download EdUBudgie Linux at their [official website][16].

That said, I hope you find this review helpful and don’t forget to check out our other [reviews here][17].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/edubudgie-linux-22-04/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/06/EdUBudgie-Linux-22.04-Budgie-Desktop.jpg
[2]: https://www.linkedin.com/in/adam-dix-0339358/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/EdUBudgie-requirement-on-disk-space.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/App-Menu-Grid-View.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/App-Menu-List-View.jpg
[6]: https://www.debugpoint.com/2021/12/gnome-text-editor/
[7]: https://www.debugpoint.com/tag/kde-apps/
[8]: https://www.debugpoint.com/2022/02/top-whiteboard-applications-linux/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/06/Scratch.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/06/Kig.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/06/GeoGebra.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/06/gbrainy.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/06/EdUBudgie-Brings-well-curated-Communication-Apps-for-Linux.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/06/EdUBudgie-Linux-Performance-average-workload.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2022/06/EdUBudgie-Linux-Performance-idle.jpg
[16]: https://www.edubudgie.com/download
[17]: https://www.debugpoint.com/tag/linux-distro-review
