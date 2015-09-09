Learn with Linux: Learning Music
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-featured.png)

This article is part of the [Learn with Linux][1] series:

- [Learn with Linux: Learning to Type][2]
- [Learn with Linux: Physics Simulation][3]
- [Learn with Linux: Learning Music][4]
- [Learn with Linux: Two Geography Apps][5]
- [Learn with Linux: Master Your Math with These Linux Apps][6]

Linux offers great educational software and many excellent tools to aid students of all grades and ages in learning and practicing a variety of topics, often interactively. The “Learn with Linux” series of articles offers an introduction to a variety of educational apps and software.

Learning music is a great pastime. Training your ears to identify scales and chords and mastering an instrument or your own voice requires lots of practise and could become difficult. Music theory is extensive. There is much to memorize, and to turn it into a “skill” you will need diligence. Linux offers exceptional software to help you along your musical journey. They will not help you become a professional musician instantly but could ease the process of learning, being a great aide and reference point.

### Gnu Solfège ###

[Solfège][7] is a popular music education method that is used in all levels of music education all around the world. Many popular methods (like the Kodály method) use Solfège as their basis. GNU Solfège is a great software aimed more at practising Solfège than learning it. It assumes the student has already acquired the basics and wishes to practise what they have learned.

As the developer states on the GNU website:

> “When you study music on high school, college, music conservatory, you usually have to do ear training. Some of the exercises, like sight singing, is easy to do alone [sic]. But often you have to be at least two people, one making questions, the other answering. […] GNU Solfège tries to help out with this. With Solfege you can practise the more simple and mechanical exercises without the need to get others to help you. Just don’t forget that this program only touches a part of the subject.”

The software delivers its promise; you can practise essentially everything with audible and visual aids.

GNU solfege is in the Debian (therefore Ubuntu) repositories. To get it just type the following command into a terminal:

    sudo apt-get install solfege

When it loads, you find yourself on a simple starting screen/

![learnmusic-solfege-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-main.png)

The number of options is almost overwhelming. Most of the links will open sub-categories

![learnmusic-solfege-scales](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-scales.png)

from where you can select individual exercises.

![learnmusic-solfege-hun](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-hun.png)

There are practice sessions and tests. Both will be able to play the tones through any connected MIDI device or just your sound card’s MIDI player. The exercises often have visual notation and the ability to play back the sequence slowly.

One important note about Solfège is that under Ubuntu you might not be able to hear anything with the default setup (unless you have a MIDI device connected). If that is the case, head over to “File -> Preferences,” select sound setup and choose the appropriate option for your system (choosing ALSA would probably work in most cases).

![learnmusic-solfege-midi](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-midi.png)

Solfège could be very helpful for your daily practise. Use it regularly and you will have trained your ear before you can sing do-re-mi.

### Tete (ear trainer) ###

[Tete][8] (This ear trainer ‘ere) is a Java application for simple, yet efficient, [ear training][9]. It helps you identify a variety of scales by playing thhm back under various circumstances, from different roots and on different MIDI sounds. [Download it from SourceForge][10]. You then need to unzip the downloaded file.

    unzip Tete-*

Enter the unpacked directory:

    cd Tete-*

Assuming you have Java installed in your system, you can run the java file with

    java -jar Tete-[your version]

(To autocomplete the above command, just press the Tab key after typing “Tete-“.)

Tete has a simple, one-page interface with everything on it.

![learnmusic-tete-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-main.png)

You can choose to play scales (see above), chords,

![learnmusic-tete-chords](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-chords.png)

or intervals.

![learnmusic-tete-intervals](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-intervals.png)

You can “fine tune” your experience with various options including the midi instrument’s sound, what note to start from, ascending or descending scales, and how slow/fast the playback should be. Tete’s SourceForge page includes a very useful tutorial that explains most aspects of the software.

### JalMus ###

Jalmus is a Java-based keyboard note reading trainer. It works with attached MIDI keyboards or with the on-screen virtual keyboard. It has many simple lessons and exercises to train in music reading. Unfortunately, its development has been discontinued since 2013, but the software appears to still be functional.

To get Jalmus, head over to the [sourceforge page][11] of its last version (2.3) to get the Java installer, or just type the following command into a terminal:

    wget http://garr.dl.sourceforge.net/project/jalmus/Jalmus-2.3/installjalmus23.jar

Once the download finishes, load the installer with

    java -jar installjalmus23.jar

You will be guided through a simple Java-based installer that was made for cross-platform installation.

Jalmus’s main screen is plain.

![learnmusic-jalmus-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-main.jpg)

You can find lessons of varying difficulty in the Lessons menu. It ranges from very simple ones, where one notes swims in from the left, and the corresponding key lights up on the on screen keyboard …

![learnmusic-jalmus-singlenote](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-singlenote.png)

… to difficult ones with many notes swimming in from the right, and you are required to repeat the sequence on your keyboard.

![learnmusic-jalmus-multinote](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-multinote.png)

Jalmus also includes exercises of note reading single notes, which are very similar to the lessons, only without the visual hints, where your score will be displayed after you finished. It also aids rhythm reading of varying difficulty, where the rhythm is both audible and visually marked. A metronome (audible and visual) aids in the understanding

![learnmusic-jalmus-rhythm](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-rhythm.png)

and score reading where multiple notes will be played

![learnmusic-jalmus-score](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-score.png)

All these options are configurable; you can switch features on and off as you like.

All things considered, Jalmus probably works best for rhythm training. Although it was not necessarily its intended purpose, the software really excelled in this particular use-case.

### Notable mentions ###

#### TuxGuitar ####

For guitarists, [TuxGuitar][12] works much like Guitar Pro on Windows (and it can also read guitar-pro files).
PianoBooster

[Piano Booster][13] can help with  piano skills. It is designed to play MIDI files, which you can play along with on an attached keyboard, watching the core roll past on the screen.

### Conclusion ###

Linux offers many great tools for learning, and if your particular interest is music, your will not be left without software to aid your practice. Surely there are many more excellent software tools available for music students than were mentioned above. Do you know of any? Please let us know in the comments below.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-learning-music/

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
[7]:https://en.wikipedia.org/wiki/Solf%C3%A8ge
[8]:http://tete.sourceforge.net/index.shtml
[9]:https://en.wikipedia.org/wiki/Ear_training
[10]:http://sourceforge.net/projects/tete/files/latest/download
[11]:http://sourceforge.net/projects/jalmus/files/Jalmus-2.3/
[12]:http://tuxguitar.herac.com.ar/
[13]:http://www.linuxlinks.com/article/20090517041840856/PianoBooster.html