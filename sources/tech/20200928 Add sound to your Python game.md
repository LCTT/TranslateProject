[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add sound to your Python game)
[#]: via: (https://opensource.com/article/20/9/add-sound-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Add sound to your Python game
======
Hear what happens when your hero fights, jumps, collects loot, and more
by adding sounds to your game. Learn how in the 13th article in this
series on creating a platformer in Pygame.
![Colorful sound wave graph][1]

This is part 13 in an ongoing series about creating video games in [Python 3][2] using the [Pygame][3] module. Previous articles are:

  1. [Learn how to program in Python by building a simple dice game][4]
  2. [Build a game framework with Python using the Pygame module][5]
  3. [How to add a player to your Python game][6]
  4. [Using Pygame to move your game character around][7]
  5. [What's a hero without a villain? How to add one to your Python game][8]
  6. [Add platforms to your game][9]
  7. [Simulate gravity in your Python game][10]
  8. [Add jumping to your Python platformer game][11]
  9. [Enable your Python game player to run forward and backward][12]
  10. [Using Python to set up loot in Pygame][13]
  11. [Add scorekeeping to your Python game][14]
  12. [Add throwing mechanics to your Python game][15]



Pygame provides an easy way to integrate sounds into your Python video game. Pygame's [mixer module][16] can play one or more sounds on command, and by mixing those sounds together, you can have, for instance, background music playing at the same time you hear the sounds of your hero collecting loot or jumping over enemies.

It is easy to integrate the mixer module into an existing game, so—rather than giving you code samples showing you exactly where to put them—this article explains the four steps required to get sound in your application.

### Start the mixer

First, in your code's setup section, start the mixer process. Your code already starts Pygame and Pygame fonts, so grouping it together with these is a good idea:


```
pygame.init()
pygame.font.init()
pygame.mixer.init() # add this line
```

### Define the sounds

Next, you must define the sounds you want to use. This requires that you have the sounds on your computer, just as using fonts requires you to have fonts, and using graphics requires you to have graphics.

You also must bundle those sounds with your game so that anyone playing your game has the sound files.

To bundle a sound with your game, first create a new directory in your game folder, right along with the directory you created for your images and fonts. Call it `sound`:


```
`s = 'sound'`
```

Even though there are plenty of sounds on the internet, it's not necessarily _legal_ to download them and give them away with your game. It seems strange because so many sounds from famous video games are such a part of popular culture, but that's how the law works. If you want to ship a sound with your game, you must find an open source or [Creative Commons][17] sound that gives you permission to give the sound away with your game.

There are several sites that specialize in free and legal sounds, including:

  * [Freesound][18] hosts sound effects of all sorts.
  * [Incompetech][19] hosts background music.
  * [Open Game Art][20] hosts some sound effects and music.



Some sound files are free to use only if you give the composer or sound designer credit. Read the conditions of use carefully before bundling any with your game! Musicians and sound designers work just as hard on their sounds as you work on your code, so it's nice to give them credit even when they don't require it.

To give your sound sources credit, list the sounds that you use in a text file called `CREDIT`, and place the text file in your game folder.

You might also try making your own music. The excellent [LMMS][21] audio workstation is easy to use and ships with lots of interesting sounds. It's available on all major platforms and exports to [Ogg Vorbis][22] (OGG) audio format.

### Add sound to Pygame

When you find a sound that you like, download it. If it comes in a ZIP or TAR file, extract it and move the sounds into the `sound` folder in your game directory.

If the sound file has a complicated name with spaces or special characters, rename it. The filename is completely arbitrary, and the simpler it is, the easier it is for you to type into your code.

Most video games use OGG sound files because the format provides high quality in small file sizes. When you download a sound file, it might be an MP3, WAVE, FLAC, or another audio format. To keep your compatibility high and your download size low, convert these to Ogg Vorbis with a tool like [fre:ac][23] or [Miro][24].

For example, assume you have downloaded a sound file called `ouch.ogg`.

In your code's setup section, create a variable representing the sound file you want to use:


```
`ouch = pygame.mixer.Sound(os.path.join(s, 'ouch.ogg'))`
```

### Trigger a sound

To use a sound, all you have to do is call the variable when you want to trigger it. For instance, to trigger the `OUCH` sound effect when your player hits an enemy:


```
for enemy in enemy_hit_list:
    pygame.mixer.Sound.play(ouch)
    score -= 1
```

You can create sounds for all kinds of actions, such as jumping, collecting loot, throwing, colliding, and whatever else you can imagine.

### Add background music

If you have music or atmospheric sound effects you want to play in your game's background, you can use the `music` function of Pygame's mixer module. In your setup section, load the music file:


```
`music = pygame.mixer.music.load(os.path.join(s, 'music.ogg'))`
```

And start the music:


```
`pygame.mixer.music.play(-1)`
```

The `-1` value tells Pygame to loop the music file infinitely. You can set it to anything from `0` and beyond to define how many times the music should loop before stopping.

### Enjoy the soundscapes

Music and sound can add a lot of flavor to your game. Try adding some to your Pygame project!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/add-sound-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://www.python.org/
[3]: https://www.pygame.org/news
[4]: https://opensource.com/article/17/10/python-101
[5]: https://opensource.com/article/17/12/game-framework-python
[6]: https://opensource.com/article/17/12/game-python-add-a-player
[7]: https://opensource.com/article/17/12/game-python-moving-player
[8]: https://opensource.com/article/18/5/pygame-enemy
[9]: https://opensource.com/article/18/7/put-platforms-python-game
[10]: https://opensource.com/article/19/11/simulate-gravity-python
[11]: https://opensource.com/article/19/12/jumping-python-platformer-game
[12]: https://opensource.com/article/19/12/python-platformer-game-run
[13]: https://opensource.com/article/19/12/loot-python-platformer-game
[14]: https://opensource.com/article/20/1/add-scorekeeping-your-python-game
[15]: https://opensource.com/article/20/9/add-throwing-python-game
[16]: https://www.pygame.org/docs/ref/mixer.html
[17]: https://opensource.com/article/20/1/what-creative-commons
[18]: https://freesound.org
[19]: https://incompetech.filmmusic.io
[20]: https://opengameart.org
[21]: https://opensource.com/life/16/2/linux-multimedia-studio
[22]: https://en.wikipedia.org/wiki/Vorbis
[23]: https://www.freac.org/index.php/en/downloads-mainmenu-330
[24]: http://getmiro.com
