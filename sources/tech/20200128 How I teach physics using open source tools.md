[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I teach physics using open source tools)
[#]: via: (https://opensource.com/article/20/1/teach-physics-open-source)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

How I teach physics using open source tools
======
A roundup of open source tools ideal for teaching physics (and other
subjects).
![Person reading a book and digital copy][1]

The nice aspect of being a physicist and a researcher is the openness of our community. There is a lot of collaboration and sharing of ideas (especially during coffee breaks). We also tend to share the software we write. Since we are very picky about algorithms, we want to modify other people’s code to fix the obvious errors that we find. It feels frustrating when I have to use proprietary tools since I cannot understand their inner workings. Having grown up professionally in such an environment, open source has been my go-to solution for all the software I use.

When I became the regular teacher of the Physics and Biophysics course at the [medical school][2] at my [university][3], I decided to use only open source software to prepare my lectures. Here is my experience so far and the solutions I found.

### Study material

Teaching is not easy. You should first understand the subject and then figure out how to communicate with somebody that knows nothing about the subject; therefore, it is of paramount importance to study the subject in depth and prepare the lectures well in advance. There are countless books about physics, but there are also some interesting, freely available resources. Most of these do not count as open source, as they cannot be modified, but they are useful anyways.

  * [HyperPhysics][4] may have an outdated look, but it is a treasure trove of interesting concepts and insights by Carl R. Nave, Department of Physics and Astronomy Georgia State University.
  * [Open Source Physics][5] has a fabulous collection of applets and support material. I met some of the maintainers at various conferences, and they are remarkable people.
  * [OpenStax][6] is a nonprofit educational initiative based at Rice University that publishes textbooks that are free online. They have a good library and several works about physics in their [scientific section][7].
  * [Open Textbook Library][8] provides a catalog of free textbooks with a [physics section][9] as well. Some of the titles have reviews by users.
  * [Motion Mountain][10] is a collection of books about physics in general by C. Schiller that has also been translated into several languages.
  * [Light and Matter][11] is another collection of writings about different aspects of physics, all authored by B. Crowell of Fullerton College, CA.
  * [Wikipedia][12], what more can I say?



### Lecturing style

Before preparing my support material, I had to decide whether I preferred to use the blackboard or slideshows during the lectures. I opted to use both with the idea of showing hard-to-draw graphics in the slideshows and writing down equations on the blackboard. Eventually, the slideshows became much more prevalent. I use them as the draft of my lecture, helping me to keep track of what I want to say. I also added the mathematical proofs that I want to show to have a correct reference during the lecture.

Instead of using a blackboard, I ended up using a [graphics tablet][13] for all the notes I write during the lectures. I use the tablet for three main purposes: to draw additional drawings to explain myself better, to write down equations and proofs, and to write down the key messages that I want my students to remember. Even if what I write is already on the slideshows, actually writing it by hand during the lectures gives the students the time to write it down in their notes. After the lectures, I share, on my website, both the slideshows and my notes.

![Figure: Example of notes taken during class with the graphics tablet and Krita][14]

Figure: Example of notes taken during class with the graphics tablet and Krita

### Material preparation

#### Slideshows

Since math is the language of physics, I needed a practical way to write down equations in my slideshows. Probably, the best tool for that is [LaTeX][15], but it was designed to typeset books and not slides. Luckily, there is the [Beamer class][16] that allows you to typeset slideshows with LaTeX. The resulting file is a very portable PDF. The layout is nice and clean and forces me not to overstuff each slide. From the same source code, I can prepare two versions of the file. The lecture version follows the guidelines of the university’s [corporate identity][17] (_i.e.,_ with a thick red border), while the handout version has a cleaner layout (_e.g.,_ without the thick borders), thus allowing it to be printed without wasting printer toner. I have also seen students taking notes directly on the PDFs of the handouts on their tablets and computers.

The only drawback of using LaTeX and Beamer is the impossibility of embedding videos in the produced presentation. I, therefore, have to keep as a separate file the occasional videos that I show during class.

![Figure: Examples of slides created with LaTeX and Beamer][18]

Figure: Examples of slides created with LaTeX and Beamer

![Figure: Examples of slides created with LaTeX and Beamer][19]

Figure: Examples of slides created with LaTeX and Beamer

#### Images and diagrams

Something that I am careful about is the licensing of the graphics I use. As such, I never use graphics that do not allow me to redistribute my modifications. I drew most of the images in my slideshows. If I use other people’s work, I always reference it in my slide.

I prefer to use [vector graphics][20] whenever practicable because they can be easily modified and adjusted afterward. I use the exceptional [Inkscape][21] for my vector graphics. On the other hand, for my [raster graphics][22], I use [GIMP][23]. When I need a 3D looking diagram, I use [Blender][24] to draw the scene; then I trace the rendered image with Inkscape to convert it to vectorial. I recently discovered [FreeCAD][25], which has the striking feature that it can directly export the 3D scene to some vectorial format. I can then adjust the image with Inkscape without having to trace the raster image.

In all my diagrams, I am trying to keep a consistent look, and therefore I limit myself to a 10-[color palette][26], both from [d3][27] and [matplotlib][28]. I also use the same palette in my slides to highlight quantities in reference to the illustrations. To produce [plots][29] and [graphs][30], I write Python scripts and employ the matplotlib graphical library.

![Figure: Diagram example created with Inkscape by tracing a Blender 3D diagram][31]

Figure: Diagram example created with Inkscape by tracing a Blender 3D diagram

#### Multimedia support

I have prepared a few pages with applets that demonstrate some phenomena that I describe during my lectures (e.g., [modeling radioactive decay with dice][32]). I opted to offer these applets on my institutional webpage to easily reach all the students instead of requiring them to install software to run them. The necessary choice was to employ [JavaScript][33] and some supporting libraries, such as [jQuery][34] for compatibility between browsers, [MathJax][35] for typesetting math in the webpages, or [d3][27] for graphics display. Since my institution does not provide the capability of writing dynamic webpages, I am using [Jekyll][36], which is a static site generator. Jekyll allows me to have a consistent look and feel across all the pages without having to write HTML code.

![Figure: Dice modeling radioactive decay, image of the interactive simulation][37]

Figure: Dice modeling radioactive decay, image of the [interactive simulation][32]

### Lecturing software

Since my slideshows are PDF files, to show them during the lecture, I use the [default document viewer][38] of my [GNOME 3][39] desktop environment. There is also the alternative of using [Okular][40], which allows annotating the PDFs, but I prefer not to use it, as the annotations would not be carried over to the handouts. In conjunction with the graphical tablet, I use the excellent painting program [Krita][41]. I use the image layers as new pages of my notes. This approach is more practical during the lecture than creating a series of new files. I can also duplicate layers and edit them or load vectorial images and draw over them. Krita has the possibility of writing custom [Python plugins][42], so I prepared a script that exports a PDF file with a new page for each layer.

![Figure: Screenshot of Krita used in class to write notes][43]

Figure: Screenshot of Krita used in class to write notes

When we go through exercises in class, I use the calculator [Qalculate][44] to obtain numerical results. Its particular feature is that it can perform calculations with units associated with the numbers. I can focus more on the exercise resolution than on the units’ conversions. This is a double-edged sword, though, as the students would not learn how to do the conversions themselves. Therefore, I normally start to use Qalculate halfway through the course. [wxMaxima][45] can also support exercise resolution, symbolically solving some difficult equations.

![Figure: Screenshot of Qalculate][46]

Figure: Screenshot of Qalculate

### Video lectures

Sometimes I offer streaming lectures on YouTube, or I upload a video with additional mini-lectures. It has happened that the students have wanted a more in-depth explanation of some subjects. Offering these as a video allows them to take their time to listen and understand the subjects. For these videos, I use [OBS studio][47], which can record or directly stream videos to YouTube. OBS can put on the video scene the screen image and some additional video sources, such as a web camera. To edit the videos, I have been using [OpenShot][48].

![Figure: Screenshot of OBS studio recording the screen][49]

Figure: Screenshot of OBS studio recording the screen

### Conclusions

This is the set of open source tools that I have been using to prepare and support my lectures. Over the years, I changed some of them whenever I discovered some better fitting tools or if I changed my lecturing style. To be frank, due to laziness, one of the requirements for all the tools is that they have to be easily installable. I use [Fedora][50] on my laptop, and its repository has packages for all this software. On the [CentOS][51] installation of my desktop computer, I had worse luck. For instance, Krita and OBS are available only through [Flatpak][52].

Writing this article just made me realize how many tools I am actively using for my lectures. Maybe there are some all-in-one solutions, such as [LibreOffice Impress][53], but I am very satisfied with the results I am getting. Besides, all this software has other useful applications.

Leave comments if you have questions.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/teach-physics-open-source

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://www.medicinachirurgia.unipd.it/
[3]: https://www.unipd.it/
[4]: http://hyperphysics.phy-astr.gsu.edu/
[5]: https://www.compadre.org/osp/
[6]: https://openstax.org/
[7]: https://openstax.org/subjects/science
[8]: https://open.umn.edu/opentextbooks
[9]: https://open.umn.edu/opentextbooks/subjects/physics
[10]: http://www.motionmountain.net/
[11]: http://www.lightandmatter.com/
[12]: https://en.wikipedia.org/wiki/Main_Page
[13]: https://en.wikipedia.org/wiki/Graphics_tablet
[14]: https://opensource.com/sites/default/files/uploads/circuit_notes_0.jpg (Figure: Example of notes taken during class with the graphics tablet and Krita)
[15]: https://www.latex-project.org/
[16]: https://github.com/josephwright/beamer
[17]: https://en.wikipedia.org/wiki/Corporate_identity
[18]: https://opensource.com/sites/default/files/uploads/slide_laplace.png (Figure: Examples of slides created with LaTeX and Beamer)
[19]: https://opensource.com/sites/default/files/uploads/slide_faraday.png (Figure: Examples of slides created with LaTeX and Beamer)
[20]: https://en.wikipedia.org/wiki/Vector_graphics
[21]: https://inkscape.org/
[22]: https://en.wikipedia.org/wiki/Raster_graphics
[23]: https://www.gimp.org/
[24]: https://www.blender.org/
[25]: https://www.freecadweb.org/
[26]: https://github.com/d3/d3-3.x-api-reference/blob/master/Ordinal-Scales.md#category10
[27]: https://d3js.org/
[28]: https://matplotlib.org/
[29]: https://en.wikipedia.org/wiki/Plot_(graphics)
[30]: https://en.wikipedia.org/wiki/Graph_of_a_function
[31]: https://opensource.com/sites/default/files/uploads/electromagnetic_wave.png (Figure: Diagram example created with Inkscape by tracing a Blender 3D diagram)
[32]: http://www2.pd.infn.it/~fontana/project/teaching/2018/01/02/dice-decay.html
[33]: https://en.wikipedia.org/wiki/JavaScript
[34]: https://jquery.com/
[35]: https://www.mathjax.org/
[36]: https://jekyllrb.com/
[37]: https://opensource.com/sites/default/files/uploads/dice_decay.png (Figure: Dice modeling radioactive decay, image of the interactive simulation)
[38]: https://wiki.gnome.org/Apps/Evince
[39]: https://www.gnome.org/gnome-3/
[40]: https://okular.kde.org/
[41]: https://krita.org/en/
[42]: https://docs.krita.org/en/user_manual/python_scripting.html
[43]: https://opensource.com/sites/default/files/uploads/krita_screenshot_0.png (Figure: Screenshot of Krita used in class to write notes)
[44]: https://qalculate.github.io/
[45]: https://wxmaxima-developers.github.io/wxmaxima/
[46]: https://opensource.com/sites/default/files/uploads/qalculate_screenshot.png (Figure: Screenshot of Qalculate)
[47]: https://obsproject.com/
[48]: https://www.openshot.org/
[49]: https://opensource.com/sites/default/files/uploads/obs_screenshot.png (Figure: Screenshot of OBS studio recording the screen)
[50]: https://getfedora.org/
[51]: https://www.centos.org/
[52]: https://flatpak.org/
[53]: https://www.libreoffice.org/discover/impress/
