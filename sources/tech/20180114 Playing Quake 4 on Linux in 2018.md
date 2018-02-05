Playing Quake 4 on Linux in 2018
======
A few months back [I wrote an article][1] outlining the various options Linux users now have for playing Doom 3, as well as stating which of the three contenders I felt to be the best option in 2017. Having already gone to the trouble of getting the original Doom 3 binary working on my modern Arch Linux system, it made me wonder just how much effort it would take to get the closed source Quake 4 port up and running again as well.

### Getting it running

[![][2]][3] [![][4]][5]

Quake 4 was ported to Linux by Timothee Besset in 2005, although the binaries themselves were later taken down along with the rest of the id Software FTP server by ZeniMax. The original [Linux FAQ page][6] is still online though, and mirrors hosting the Linux installer still exist, such as [this one][7] ran by the fan website [Quaddicted][8]. Once downloaded this will give you a graphical installer which will install the game binary without any of the game assets.

These will need to be taken from either the game discs of a retail Windows version as I did, or taken from an already installed Windows version of the game such as from [Steam][9]. Follow the steps in the Linux FAQ to the letter for best results. Please note that the [GOG.com][10] release of Quake 4 is unique in not supplying a valid CD key, something which is still required for the Linux port to launch. There are [ways to get around this][11], but we only condone these methods for legitimate purchasers.

Like with Doom 3 I had to remove the libgcc_s.so.1, libSDL-1.2.id.so.0, and libstdc++.so.6 libraries that the game came with in the install directory in order to get it to run. I also ran into the same sound issue I had with Doom 3, meaning I had to modify the Quake4Config.cfg file located in the hidden ~/.quake4/q4base directory in the same fashion as before. However, this time I ran into a whole host of other issues that made me have to modify the configuration file as well.

First off the language the game wanted to use would always default to Spanish, meaning I had to manually tell the game to use English instead. I also ran into a known issue on all platforms wherein the game would not properly recognize the available VRAM on modern graphics cards, and as such would force the game to use lower image quality settings. Quake 4 will also not render see-through surfaces unless anti-aliasing is enabled, although going beyond 8x caused the game not to load for me.

Appending the following to the end of the Quake4Config.cfg file resolved all of my issues:

```
seta image_downSize "0"
seta image_downSizeBump "0"
seta image_downSizeSpecular "0"
seta image_filter "GL_LINEAR_MIPMAP_LINEAR"
seta image_ignoreHighQuality "0"
seta image_roundDown "0"
seta image_useCompression "0"
seta image_useNormalCompression "0"
seta image_anisotropy "16"
seta image_lodbias "0"
seta r_renderer "best"
seta r_multiSamples "8"
seta sys_lang "english"
seta s_alsa_pcm "hw:0,0"
seta com_allowConsole "1"
```

Please note that this will also set the game to use 8x anti-aliasing and restore the drop down console to how it worked in all of the previous Quake games. Similar to the Linux port of Doom 3 the Linux version of Quake 4 also does not support Creative EAX ADVANCED HD audio technology. Unlike Doom 3 though Quake 4 does seem to also feature an alternate method for surround sound, and widescreen support was thankfully patched into the game soon after its release.

### Playing the game

[![][12]][13] [![][14]][15]

Over the years Quake 4 has gained something of a reputation as the black sheep of the Quake family, with many people complaining that the game's vehicle sections, squad mechanics, and general aesthetic made it feel too close to contemporary military shooters of the time. In the game's heart of hearts though it really does feel like a concerted sequel to Quake II, with some of developer Raven Software's own Star Trek: Voyager - Elite Force title thrown in for good measure.

To me at least Quake 4 does stand as being one of the "Last of the Romans" in terms of being a first person shooter that embraced classic design ideals at a time when similar titles were not getting the support of major publishers. Most of the game still features the player moving between levels featuring fixed enemy placements, a wide variety of available weapons, traditional health packs, and an array of enemies each sporting unique attributes and skills.

Quake 4 also offers a well made campaign that I found myself going back to on a higher skill level not long after I had already finished my first try at the game. Certain aspects like the vehicle sections do indeed drag the game down a bit, and the multiplayer aspect pails in comparison to its predecessor Quake III Arena, but overall I am quite pleased with what Raven Software was able to accomplish with the Doom 3 engine, especially when so few others tried.

### Final thoughts

If anyone ever needed a reason to be reminded of the value of video game source code releases, this is it. Most of the problems I encountered could have been easily sidestepped if Quake 4 source ports were available, but with the likes of John Carmack and Timothee Besset gone from id Software and the current climate at ZeniMax not looking too promising, it is doubtful that any such creations will ever materialize. Doom 3 source ports look to be the end of the road.

Instead we are stuck using this cranky 32 bit binary with an obstructive CD Key check and a graphics system that freaks out at the sight of any modern video card sporting more than 512 MB of VRAM. The game itself has aged well, with graphics that still look great and dynamic lighting that is better than what is included with many modern titles. It is just a shame that it is now such a pain to get running, not just on Linux, but on any platform.

--------------------------------------------------------------------------------

via: https://www.gamingonlinux.com/articles/playing-quake-4-on-linux-in-2018.11017

作者：[Hamish][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.gamingonlinux.com/profiles/6
[1]:https://www.gamingonlinux.com/articles/playing-doom-3-on-linux-in-2017.10561
[2]:https://www.gamingonlinux.com/uploads/articles/article_images/thumbs/20458196191515697921gol6.jpg
[3]:https://www.gamingonlinux.com/uploads/articles/article_images/20458196191515697921gol6.jpg
[4]:https://www.gamingonlinux.com/uploads/articles/article_images/thumbs/9405540721515697921gol6.jpg
[5]:https://www.gamingonlinux.com/uploads/articles/article_images/9405540721515697921gol6.jpg
[6]:http://zerowing.idsoftware.com/linux/quake4/Quake4FrontPage/
[7]:https://www.quaddicted.com/files/idgames2/idstuff/quake4/linux/
[8]:https://www.quaddicted.com/
[9]:http://store.steampowered.com/app/2210/Quake_IV/
[10]:https://www.gog.com/game/quake_4
[11]:https://www.gog.com/forum/quake_series/quake_4_on_linux_no_cd_key/post31
[12]:https://www.gamingonlinux.com/uploads/articles/article_images/thumbs/5043571471515951537gol6.jpg
[13]:https://www.gamingonlinux.com/uploads/articles/article_images/5043571471515951537gol6.jpg
[14]:https://www.gamingonlinux.com/uploads/articles/article_images/thumbs/6922853731515697921gol6.jpg
[15]:https://www.gamingonlinux.com/uploads/articles/article_images/6922853731515697921gol6.jpg
