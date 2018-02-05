Graphics and music tools for game development
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Life_opengame.png?itok=JPxruL3k)

In early October, our club, [Geeks and Gadgets][1] from Marshall University, participated in the inaugural [Open Jam][2], a game jam that celebrated the best of open source tools. Game jams are events where participants work as teams to develop computer games for fun. Jams tend to be very short--only three days long--and very exhausting. Opensource.com [announced][3] Open Jam in late August, and more than [three dozen games][4] were entered into the competition.

Our club likes to create and use open source software in our projects, so Open Jam was naturally the jam we wanted to participate in. Our submission was an experimental game called [Mark My Words][5]. We used a variety of free and open source (FOSS) tools to develop it; in this article we'll discuss some of the tools we used and potential stumbling blocks to be aware of.

### Audio tools

#### MilkyTracker

[MilkyTracker][6] is one of the best software packages available for composing old-style video game music. It is an example of a [music tracker][7], a powerful MOD and XM file creator with a characteristic grid-based pattern editor. We used it to compose most of the musical pieces in our game. One of the great things about this program is that it consumed much less disk space and RAM than most of our other tools. Even so, MilkyTracker is still extremely powerful.

![](https://opensource.com/sites/default/files/u128651/mtracker.png)

The user interface took a while to get used to, so here are some pointers for any musician who wants to try out MilkyTracker:

  * Go to Config > Misc. and set the edit mode control style to "MilkyTracker." This will give you modern keyboard shortcuts for almost everything
  * Undo with Ctrl+Z
  * Redo with Ctrl+Y
  * Toggle pattern-edit mode with the Spacebar
  * Delete the previous note with the Backspace key
  * Insert a row with the Insert key
  * By default, a note will continue playing until it is replaced on that channel. You can end a note explicitly by inserting a KeyOff note with the backquote (`) key
  * You will have to create or find samples before you can start composing. We recommend finding [Creative Commons][8] licensed samples at websites such as [Freesound][9] or [ccMixter][10]



In addition, keep the [MilkyTracker documentation page][11] handy. It contains links to numerous tutorials and manuals. A good starting point is the [MilkyTracker Guide][12] on the project's wiki.

#### LMMS

Two of our musicians used the versatile and modern music creation tool [LMMS][13]. It comes with a library of cool samples and effects, plus a variety of flexible plugins for generating unique sounds. The learning curve for LMMS was surprisingly low, in part due to the nice beat/bassline editor.

![](https://opensource.com/sites/default/files/u128651/lmms_plugins.png)

We have one suggestion for musicians trying out LMMS: Use the plugins. For [chiptune][14]-style music, we recommend [sfxr][15], [BitInvader][16], and [FreeBoy][17]. For other styles, [ZynAddSubFX][18] is a good choice. It comes with a wide range of synthesized instruments that can be altered however you see fit.

### Graphics tools

#### Tiled

[Tiled][19] is a popular tilemap editor in open source game development. We used it to assemble consistent, retro-looking backgrounds for our in-game scenes.

![](https://opensource.com/sites/default/files/u128651/tiled.png)

Tiled can export maps as XML, JSON, or as flattened images. It is stable and cross-platform.

One of Tiled's features, which we did not use during the jam, allows you to define and place arbitrary game objects, such as coins and powerups, onto the map. All you have to do is load the object's graphics as a tileset, then place them using Insert Tile.

Overall, Tiled is a stellar piece of software that we recommend for any project that needs a map editor.

#### Piskel

[Piskel][20] is a pixel art editor whose source code is licensed under the [Apache License, Version 2.0][21]. We used Piskel for almost all our graphical assets during the jam, and we will certainly be using it in future projects as well.

Two features of Piskel that helped us immensely during the jam are onion skin and spritesheet exporting.

##### Onion skin

The onion skin feature will make Piskel show a ghostly overlay of the previous and next frames of your animation as you edit, like this:

![](https://opensource.com/sites/default/files/u128651/onionshow.gif)

Onion skin is handy because it serves as a drawing guide and helps you maintain consistent shapes and volumes on your characters throughout the animation process. To enable it, just click the onion-shaped icon underneath the preview window on the top-right of the screen.

![](https://opensource.com/sites/default/files/u128651/onionenable.png)

##### Spritesheet exporting

Piskel's ability to export animations as a spritesheet was also very helpful. A spritesheet is a single raster image that contains all the frames of an animation. For example, here is a spritesheet we exported from Piskel:

![](https://opensource.com/sites/default/files/u128651/sprite-artist.png)

The spritesheet consists of two frames. One frame is in the top half of the image and the other frame is in the bottom half of the image. Spritesheets greatly simplify a game's code by enabling an entire animation to be loaded from a single file. Here is an animated version of the above spritesheet:

![](https://opensource.com/sites/default/files/u128651/sprite-artist-anim.gif)

##### Unpiskel.py

There were several times during the jam when we wanted to batch convert Piskel files into PNGs. Since the Piskel file format is based on JSON, we wrote a small GPLv3-licensed Python script called [unpiskel.py][22] to do the conversion.

It is invoked like this:
```


python unpiskel.py input.piskel
```

The script will extract the PNG data frames and layers from a Piskel file (here `input.piskel`) and store them in their own files. The files follow the pattern `NAME_XX_YY.png` where `NAME` is the truncated name of the Piskel file, `XX` is the frame number, and `YY` is the layer number.

Because the script can be invoked from a shell, it can be used on a whole list of files.
```
for f in *.piskel; do python unpiskel.py "$f"; done
```

### Python, Pygame, and cx_Freeze

#### Python and Pygame

We used the [Python][23] language to make our game. It is a scripting language that is commonly used for text processing and desktop app development. It can also be used for game development, as projects like [Angry Drunken Dwarves][24] and [Ren'Py][25] have shown. Both of these projects use a Python library called [Pygame][26] to display graphics and produce sound, so we decided to use this library in Open Jam, too.

Pygame turned out to be both stable and featureful, and it was great for the arcade-style game we were creating. The library's speed was fast enough at low resolutions, but its CPU-only rendering starts to slow down at higher resolutions. This is because Pygame does not use hardware-accelerated rendering. However, the infrastructure is there for developers to take full advantage of OpenGL.

If you're looking for a good 2D game programming library, Pygame is one to keep your eye on. Its website has [a good tutorial][27] to get started. Be sure to check it out!

#### cx_Freeze

Prepping our game for distribution was interesting. We knew that Windows users were unlikely to have a Python installation, and asking them to install it would have been too much. On top of that, they would have had to also install Pygame, which is not an intuitive task on Windows.

One thing was clear: We had to put our game into a more convenient form. Many of the other Open Jam participants used the proprietary game engine Unity, which enabled their games to be played in the web browser. This made them extremely convenient to play. Convenience was one thing our game didn't have even a sliver of. But, thanks to a vibrant Python ecosystem, we had options. Tools exist to help Python programmers prepare their programs for distribution on Windows. The two that we considered were [cx_Freeze][28] and [Pygame2exe][29] (which uses [py2exe][30]). We decided on cx_Freeze because it was cross-platform.

In cx_Freeze, you can pack a single-script game for distribution just by running a command like this in the shell:
```
cxfreeze main.py --target-dir dist
```

This invocation of `cxfreeze` will take your script (here `main.py`) and the Python interpreter on your system and bundle them up into the `dist` directory. Once this is done, all you have to do is manually copy your game's data files into the `dist` directory. You will find that the `dist` directory contains an executable file that can be run to start your game.

There is a more involved way to use cx_Freeze that allows you to automate the copying of data files, but we found the straightforward invocation of `cxfreeze` to be good enough for our needs. Thanks to this tool, we made our game a little more convenient to play.

### Celebrating open source

Open Jam is important because it celebrates the open source model of software development. This is an opportunity to analyze the current state of open source tools and what we need to work on in the future. Game jams are perhaps the best time for game devs to try to push their tools to the limit, to learn what must be improved for the good of future game devs.

Open source tools enable people to explore their creativity without compromising their freedom and without investing money upfront. Although we might not become professional game developers, we were still able to get a small taste of it with our short, experimental game called [Mark My Words][5]. It is a linguistically themed game that depicts the evolution of a fictional writing system throughout its history. There were many other delightful submissions to Open Jam, and they are all worth checking out. Really, [go look][31]!

Before closing, we would like to thank all the [club members who participated][32] and made this experience truly worthwhile. We would also like to thank [Michael Clayton][33], [Jared Sprague][34], and [Opensource.com][35] for hosting Open Jam. It was a blast.

Now, we have some questions for readers. Are you a FOSS game developer? What are your tools of choice? Be sure to leave a comment below!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/graphics-music-tools-game-dev

作者：[Charlie Murphy][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rsg167
[1]:http://mugeeks.org/
[2]:https://itch.io/jam/open-jam-1
[3]:https://opensource.com/article/17/8/open-jam-announcement
[4]:https://opensource.com/article/17/11/open-jam
[5]:https://mugeeksalpha.itch.io/mark-omy-words
[6]:http://milkytracker.titandemo.org/
[7]:https://en.wikipedia.org/wiki/Music_tracker
[8]:https://creativecommons.org/
[9]:https://freesound.org/
[10]:http://ccmixter.org/view/media/home
[11]:http://milkytracker.titandemo.org/documentation/
[12]:https://github.com/milkytracker/MilkyTracker/wiki/MilkyTracker-Guide
[13]:https://lmms.io/
[14]:https://en.wikipedia.org/wiki/Chiptune
[15]:https://github.com/grimfang4/sfxr
[16]:https://lmms.io/wiki/index.php?title=BitInvader
[17]:https://lmms.io/wiki/index.php?title=FreeBoy
[18]:http://zynaddsubfx.sourceforge.net/
[19]:http://www.mapeditor.org/
[20]:https://www.piskelapp.com/
[21]:https://github.com/piskelapp/piskel/blob/master/LICENSE
[22]:https://raw.githubusercontent.com/MUGeeksandGadgets/MarkMyWords/master/tools/unpiskel.py
[23]:https://www.python.org/
[24]:https://www.sacredchao.net/~piman/angrydd/
[25]:https://renpy.org/
[26]:https://www.Pygame.org/
[27]:http://Pygame.org/docs/tut/PygameIntro.html
[28]:https://anthony-tuininga.github.io/cx_Freeze/
[29]:https://Pygame.org/wiki/Pygame2exe
[30]:http://www.py2exe.org/
[31]:https://itch.io/jam/open-jam-1/entries
[32]:https://github.com/MUGeeksandGadgets/MarkMyWords/blob/3e1e8aed12ebe13acccf0d87b06d4f3bd124b9db/README.md#credits
[33]:https://twitter.com/mwcz
[34]:https://twitter.com/caramelcode
[35]:https://opensource.com/
