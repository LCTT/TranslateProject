Top 5 CAD Software Available for Linux in 2018
======
[Computer Aided Design (CAD)][1] is an essential part of many streams of engineering. CAD is professionally used is architecture, auto parts design, space shuttle research, aeronautics, bridge construction, interior design, and even clothing and jewelry.

A number of professional grade CAD software like SolidWorks and Autodesk AutoCAD are not natively supported on the Linux platform. So today we will be having a look at the top CAD software available for Linux. Let’s dive right in.

### Best CAD Software available for Linux

![CAD Software for Linux][2]

Before you see the list of CAD software for Linux, you should keep one thing in mind that not all the applications listed here are open source. We included some non-FOSS CAD software to help average Linux user.

Installation instructions of Ubuntu-based Linux distributions have been provided. You may check the respective websites to learn the installation procedure for other distributions.

The list is not any specific order. CAD application at number one should not be considered better than the one at number three and so on.

#### 1\. FreeCAD

For 3D Modelling, FreeCAD is an excellent option which is both free (beer and speech) and open source. FreeCAD is built with keeping mechanical engineering and product design as target purpose. FreeCAD is multiplatform and is available on Windows, Mac OS X+ along with Linux.

![freecad][3]

Although FreeCAD has been the choice of many Linux users, it should be noted that FreeCAD is still on version 0.17 and therefore, is not suitable for major deployment. But the development has picked up pace recently.

[FreeCAD][4]

FreeCAD does not focus on direct 2D drawings and animation of organic shapes but it’s great for design related to mechanical engineering. FreeCAD version 0.15 is available in the Ubuntu repositories. You can install it by running the below command.
```
sudo apt install freecad

```

To get newer daily builds (0.17 at the moment), open a terminal (ctrl+alt+t) and run the commands below one by one.
```
sudo add-apt-repository ppa:freecad-maintainers/freecad-daily

sudo apt update

sudo apt install freecad-daily

```

#### 2\. LibreCAD

LibreCAD is a free, opensource, 2D CAD solution. Generally, CAD tends to be a resource-intensive task, and if you have a rather modest hardware, then I’d suggest you go for LibreCAD as it is really lightweight in terms of resource usage. LibreCAD is a great candidate for geometric constructions.

![librecad][5]
As a 2D tool, LibreCAD is good but it cannot work on 3D models and renderings. It might be unstable at times but it has a dependable autosave which won’t let your work go wasted.

[LibreCAD][6]

You can install LibreCAD by running the following command
```
sudo apt install librecad

```

#### 3\. OpenSCAD

OpenSCAD is a free 3D CAD software. OpenSCAD is very lightweight and flexible. OpenSCAD is not interactive. You need to ‘program’ the model and OpenSCAD interprets that code to render a visual model. It is a compiler in a sense. You cannot draw the model. You describe the model.

![openscad][7]

OpenSCAD is the most complicated tool on this list but once you get to know it, it provides an enjoyable work experience.

[OpenSCAD][8]

You can use the following commands to install OpenSCAD.
```
sudo apt-get install openscad

```

#### 4\. BRL-CAD

BRL-CAD is one of the oldest CAD tools out there. It also has been loved by Linux/UNIX users as it aligns itself with *nix philosophies of modularity and freedom.

![BRL-CAD rendering by Sean][9]

BRL-CAD was started in 1979, and it is still developed actively. Now, BRL-CAD is not AutoCAD but it is still a great choice for transport studies such as thermal and ballistic penetration. BRL-CAD underlies CSG instead of boundary representation. You might need to keep that in mind while opting for BRL-CAD. You can download BRL-CAD from its official website.

[BRL-CAD][10]

#### 5\. DraftSight (not open source)

If You’re used to working on AutoCAD, then DraftSight would be the perfect alternative for you.

DraftSight is a great CAD tool available on Linux. It has a rather similar workflow to AutoCAD, which makes migrating easier. It even provides a similar look and feel. DrafSight is also compatible with the .dwg file format of AutoCAD. But DrafSight is a 2D CAD software. It does not support 3D CAD as of yet.

![draftsight][11]

Although DrafSight is a commercial software with a starting price of $149. A free version is also made available on the[DraftSight website][12]. You can download the .deb package and install it on Ubuntu based distributions. need to register your free copy using your email ID to start using DraftSight.

[DraftSight][12]

#### Honorary mentions

  * With a huge growth in cloud computing technologies, cloud CAD solutions like [OnShape][13] have been getting popular day by day.
  * [SolveSpace][14] is another open-source project worth mentioning. It supports 3D modeling.
  * Siemens NX is an industrial grade CAD solution available on Windows, Mac OS and Linux, but it is ridiculously expensive, so omitted in this list.
  * Then you have [LeoCAD][15], which is a CAD software where you use LEGO blocks to build stuff. What you do with this information is up to you.



#### CAD on Linux, in my opinion

Although gaming on Linux has picked up, I always tell my hardcore gaming friends to stick to Windows. Similarly, if You are an engineering student with CAD in your curriculum, I’d recommend that you use the software that your college prescribes (AutoCAD, SolidEdge, Catia), which generally tend to run on Windows only.

And for the advanced professionals, these tools are simply not up to the mark when we’re talking about industry standards.

For those of you thinking about running AutoCAD in WINE, although some older versions of AutoCAD can be installed on WINE, they simply do not perform, with glitches and crashes ruining the experience.

That being said, I highly respect the work that has been put by the developers of the above-listed software. They have enriched the FOSS world. And it’s great to see software like FreeCAD developing with an accelerated pace in the recent years.

Well, that’s it for today. Do share your thoughts with us using the comments section below and don’t forget to share this article. Cheers.

--------------------------------------------------------------------------------

via: https://itsfoss.com/cad-software-linux/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/aquil/
[1]:https://en.wikipedia.org/wiki/Computer-aided_design
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/cad-software-linux.jpeg
[3]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freecad.jpg
[4]:https://www.freecadweb.org/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/librecad.jpg
[6]:https://librecad.org/
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/openscad.jpg
[8]:http://www.openscad.org/
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/brlcad.jpg
[10]:https://brlcad.org/
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/draftsight.jpg
[12]:https://www.draftsight2018.com/
[13]:https://www.onshape.com/
[14]:http://solvespace.com/index.pl
[15]:https://www.leocad.org/
