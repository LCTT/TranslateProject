[bazz222222]
Linux 学习系列之物理模拟
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/physics-fetured.jpg)

[Linux 学习系列][1]的所有文章：

- [Learn with Linux: Learning to Type][2]
- [Learn with Linux: Physics Simulation][3]
- [Learn with Linux: Learning Music][4]
- [Learn with Linux: Two Geography Apps][5]
- [Learn with Linux: Master Your Math with These Linux Apps][6]

Linux offers great educational software and many excellent tools to aid students of all grades and ages in learning and practicing a variety of topics, often interactively. The “Learn with Linux” series of articles offers an introduction to a variety of educational apps and software.

Physics is an interesting subject, and arguably the most enjoyable part of any Physics class/lecture are the demonstrations. It is really nice to see physics in action, yet the experiments do not need to be restricted to the classroom. While Linux offers many great tools for scientists to support or conduct experiments, this article will concern a few that would make learning physics easier or more fun.

### 1. Step ###

[Step][7] is an interactive physics simulator, part of [KDEEdu, the KDE Education Project][8]. Nobody could better describe what Step does than the people who made it. According to the project webpage, “[Step] works like this: you place some bodies on the scene, add some forces such as gravity or springs, then click “Simulate” and Step shows you how your scene will evolve according to the laws of physics. You can change every property of bodies/forces in your experiment (even during simulation) and see how this will change the outcome of the experiment. With Step, you can not only learn but feel how physics works!”

While of course it requires Qt and loads of KDE-specific dependencies to work, projects like this (and KDEEdu itself) are part of the reason why KDE is such an awesome environment (if you don’t mind running a heavier desktop, of course).

Step is in the Debian repositories; to install it on derivatives, simply type

    sudo apt-get install step

into a terminal. On a KDE system it should have minimal dependencies and install in seconds.

Step has a simple interface, and it lets you jump right into simulations.

![physics-step-main](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-main.png)

You will find all available objects on the left-hand side. You can have different particles, gas, shaped objects, springs, and different forces in action. (1) If you select an object, a short description of it will appear on the right-hand side (2). On the right you will also see an overview of the “world” you have created (the objects it contains) (3), the properties of the currently selected object (4), and the steps you have taken so far (5).

![physics-step-parts](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-parts.png)

Once you have placed all you wanted on the canvas, just press “Simulate,” and watch the events unfold as the objects interact with each other.

![physics-step-simulate1](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate1.png)

![physics-step-simulate2](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate2.png)

![physics-step-simulate3](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate3.png)

To get to know Step better you only need to press F1. The KDE Help Center offers a great and detailed Step handbook.

### 2. Lightspeed ###

Lightspeed is a simple GTK+ and OpenGL based simulator that is meant to demonstrate the effect of how one might observe a fast moving object. Lightspeed will simulate these effects based on Einstein’s special relativity. According to [their sourceforge page][9] “When an object accelerates to more than a few million meters per second, it begins to appear warped and discolored in strange and unusual ways, and as it approaches the speed of light (299,792,458 m/s) the effects become more and more bizarre. In addition, the manner in which the object is distorted varies drastically with the viewpoint from which it is observed.”

These effects which come into play at relative velocities are:

- **The Lorentz contraction** – causes the object to appear shorter
- **The Doppler red/blue shift** – alters the hues of color observed
- **The headlight effect** – brightens or darkens the object
- **Optical aberration** – deforms the object in unusual ways

Lightspeed is in the Debian repositories; to install it, simply type:

    sudo apt-get install lightspeed

The user interface is very simple. You get a shape (more can be downloaded from sourceforge) which would move along the x-axis (animation can be started by processing “A” or by selecting it from the object menu).

![physics-lightspeed](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed.png)

You control the speed of its movement with the right-hand side slider and watch how it deforms.

![physics-lightspeed-deform](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed-deform.png)

Some simple controls will allow you to add more visual elements

![physics-lightspeed-visual](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed-visual.png)

The viewing angles can be adjusted by pressing either the left, middle or right button and dragging the mouse or from the Camera menu that also offers some other adjustments like background colour or graphics mode.

### Notable mention: Physion ###

Physion looks like an interesting project and a great looking software to simulate physics in a much more colorful and fun way than the above examples would allow. Unfortunately, at the time of writing, the [official website][10] was experiencing problems, and the download page was unavailable.

Judging from their Youtube videos, Physion must be worth installing once a download line becomes available. Until then we can just enjoy the this video demo.

注：youtube 视频
<iframe frameborder="0" src="//www.youtube.com/embed/P32UHa-3BfU?autoplay=1&amp;autohide=2&amp;border=0&amp;wmode=opaque&amp;enablejsapi=1&amp;controls=0&amp;showinfo=0" id="youtube-iframe"></iframe>

Do you have another favorite physics simulation/demonstration/learning applications for Linux? Please share with us in the comments below.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-physics-simulation/

作者：[Attila Orosz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:https://www.maketecheasier.com/series/learn-with-linux/
[2]:https://www.maketecheasier.com/learn-to-type-in-linux/
[3]:https://www.maketecheasier.com/linux-physics-simulation/
[4]:https://www.maketecheasier.com/linux-learning-music/
[5]:https://www.maketecheasier.com/linux-geography-apps/
[6]:https://www.maketecheasier.com/learn-linux-maths/
[7]:https://edu.kde.org/applications/all/step
[8]:https://edu.kde.org/
[9]:http://lightspeed.sourceforge.net/
[10]:http://www.physion.net/
