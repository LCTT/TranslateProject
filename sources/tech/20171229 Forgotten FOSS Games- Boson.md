Forgotten FOSS Games: Boson
======

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/0.10-2-800x445.jpg)

Back in September of 1999, just about a year after the KDE project had shipped its first release ever, Thomas Capricelli announced "our attempt to make a Real Time Strategy game (RTS) for the KDE project" on the [kde-announce][1] mailing list. Boson 0.1, as the attempt was called, was based on Qt 1.4, the KDE 1.x libraries, and described as being "Warcraft-like".

Development continued at a fast pace over the following year. 3D artists and sound designers were invited to contribute, and basic game play (e.g. collecting oil and minerals) started working. The core engine gained much-needed features. A map editor was already part of the package. Four releases later, on October 30, 2000, the release of version 0.5 was celebrated as a major milestone, also because Boson had been ported to Qt 2.2.1 & KDE 2.0 to match the development of the projects it was based on. Then the project suddenly went into hiatus, as it happens so often with ambitious open source game projects. A new set of developers revived Boson one year later, in 2001, and decided to port the game to Qt 3, the KDE 3 libraries and the recently introduced libkdegames library.

![][2]

By version 0.6 (released in June of 2002) the project was on a very good path again, having been extended with all the features players were used to from similar RTS titles, e.g. fog of war, path-finding, units defending themselves automatically, the destruction of a radar/satellite station leading to the disappearance of the minimap, and so on. The game came with its own soundtrack (you had the choice between "Jungle" and "Progressive), although the tracks did sound a bit… similar to each other, and Techno hadn't been a thing in game soundtracks since Command and Conquer: Tiberian Sun. More maps and sound effects tightened the atmosphere, but there was no computer opponent with artificial intelligence, so you absolutely had to play over a local network or online.

Sadly the old websites at <http://aquila.rezel.enst.fr/boson/> and <http://boson.eu.org> are no longer online, and YouTube was not a thing back then, so most of the old artwork, videos and roadmaps are lost. But the [Sourceforce page][3] has survived, and the [Subversion repository][4] contains screenshots from version 0.7 on and some older ones from unknown version numbers.

### From 2D to 3D

It might be hard to believe nowadays, but Boson was a 2D game until the release of version 0.7 in January of 2003. So it didn't look like Warcraft 3 (released in 2002), but much more like Warcraft 2 or the first five Command & Conquer titles. The engine was extended with OpenGL support and now "just" loaded the existing 3D models instead of forcing the developers to pre-render them into 2D sprites. Why so late? Because your average Linux installation simply didn't have OpenGL support when Boson was created back in 1999. The first XFree86 release to include GLX (OpenGL Extension to the X Window System) was version 4.0, published in 2000. And then it took a while to get OpenGL acceleration working in the major Linux graphics drivers (Matrox G200/G400, NVIDIA Riva TNT, ATI RagePro, S3 ViRGE and Intel 810). I can't say it was trivial to set up a Linux Desktop with hardware accelerated 3D until Ubuntu 7.04 put all the bits together for the first time and made it easy to install the proprietary NVIDIA drivers through the "Additional Drivers" settings dialogue.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/gl_boson1.jpg)

So when Boson switched to OpenGL in January of 2003, that sucked. You now absolutely needed hardware acceleration to be able play it, and well, it was January of 2003. GPUs still used [AGP][5] slots back then, ATI was still an independent company, the Athlon64 would not be released before September 2003, and you were happy if you even owned a GeForce FX or a Radeon 9000 card. Luckily I did, and when I came across Boson, I immediately downloaded it, built it on my Gentoo machine and ran it on my three-monitor setup (two 15″ TFTs and one 21″ CRT). After debugging 3D hardware acceleration for a day or two, naturally…

![][6]

Boson wasn't finished or even really playable back then (still no computer opponent, only a few units working, no good maps etc.), but it showed promise, especially in light of the recent release of Command & Conquer: Generals in February of 2003. The thought of having an actual open source alternative to a recently released AAA video game title was so encouraging that I started to make small contributions, mainly by [reporting bugs][7]. The cursor icon theme I created using Cinema 4D never made it into a release.

### Development hell

Boson went through four releases in 2003 alone, all the way up to version 0.10. Performance was improved, the engine was extended with support for Python scripts, adaptive level of detail, smoke, lighting, day/night switches, and flying units. The 3D models started to look nice, an elementary Artificial Intelligence opponent was added (!), and the list of dependencies grew longer. Release notices like "Don't crash when using proprietary NVidia drivers and no usable font was found (reported to NVidia nearly a year ago)" are a kind reminder that proprietary graphics drivers already were a pain to work with back then, in case anybody forgot.

![][8]

An important task from version 0.10 on was to remove (or at least weaken) the dependencies on Qt and KDE. To be honest I never really got why the whole game, or for that matter any application ever, had to be based on Qt and KDE to begin with. Qt is a very, very intrusive thing. It's not just a library full of cool stuff, it's a framework. It locks you into its concept of what an application is and how it is supposed to work, and what your code should look like and how it is supposed to be structured. You need a whole toolchain with a metacompiler because your code isn't even standard C++.

Every time the Qt/KDE developers decide to break the ABI, deprecate a component or come up with a new and (supposedly) better solution to an existing solution, you have to follow - and that has happened way too often. Just ask the KDE developers how many times they had to port KDE just because Qt decided to change everything for the umpteenth time, and now imagine you depend on both Qt **and** KDE. Pretty much everything Qt offers can be solved in a less intrusive way nowadays.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/buildings0001.png.wm-1024x576.jpg)

Maybe the original Boson developers just wanted to take advantage of Qt's 2D graphics subsystem to make development easier. Or make sure the game can run on more than one platform (at least one release was known to work on FreeBSD). Or they hoped to become a part of the official KDE family to keep the project visible and attract more developers. Whatever the reason might have been, the cleanup was in full swing. aRts (the audio subsystem used by KDE 2 and 3) was replaced by the more standard OpenAL library. [libUFO][9] (which is one of the very few projects relying on the XUL language Mozilla uses to design UIs for Firefox and other application, BTW) was used to draw the on-screen menus.

The release of version 0.11 was delayed for 16 months due to the two main developers being busy with other stuff, but the changelog was very long and exciting. "Realistic" water and environmental objects like trees were added to the maps, the engine learned how to handle wind. The path-finding algorithm and the artificial intelligence opponent became smarter, and everything seemed to slowly come together.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/units0001.png.wm.jpg)

By the time version 0.12 was released eight months later, Boson had working power plants, animated turrets, a new radar system and much more. Version 0.13, the last one to ever be officially released, again shipped an impressive amount of new features and improvements, but most of the changes were not really visible.

Version 0.13 had been released in October of 2006, and after December of the same year the commit rate suddenly dropped to zero. There were only two commits in the whole year of 2007, followed by an unsucessful attempt to revive the project in 2008. In 2011 the "Help wanted" text was finally removed from the (broken) website and Boson was officially declared dead.

### Let's Play Boson!

The game no longer even builds on modern GNU/Linux distributions, mostly due to the unavailability of Qt 3 and the KDE 3 libraries and some other oddities. I managed to install Ubuntu 11.04 LTS in a VirtualBox, which was the last Ubuntu release to have Boson in its repositories. Don't be surprised by how bad the performance is, as far as I can tell it's not the fault of VirtualBox. Boson never ran fast on any kind of hardware and did everything in a single thread, probably losing a lot of performance when synchronizing with various subsystems.

Here's a video of me trying to play. First I enable the eye candy (the shaders) and start one of the maps in the official "campaign" in which I am immediately attacked by the enemy and don't really have time to concentrate on resource collection, only to have the game crash on me before I loose to the enemy. Then I start a map without an enemy (there is supposed to be one, but my units never find it) so I have more time to actually explore all the options, buildings and units.

Sound didn't work in this release, so I added some tracks of the official soundtrack to the audio track of the video.

https://www.youtube.com/embed/18sqwNjlBow?feature=oembed

You can clearly see that the whole codebase was still in full developer mode back in 2006. There are multiple checkboxes for debugging information at the top of the screen, some debugging text scrolls over the actual text of the game UI. Everything can be configured in the Options dialogue, and you can easily break the game by fiddling with internal settings like the OpenGL update interval. Set it too low (the default is 50 Hz), and the internal logic will get confused. Clearly this is because the OpenGL renderer and the game logic run in the same thread, something one would probably no longer do nowadays.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_option_dialogue.png.wm.jpg)

The game menu has all the standard options. There are three available campaigns, each one with its own missions. The mission overview hints that each map could have different conditions for winning and loosing, e.g. in the "Lost Village" mission you are not supposed to destroy the houses in the occupied village. There are ten available colours for the players and three different species: Human, Neutral and "Smackware". No idea where that Name comes from, judging from the unit models it looks like it was just another human player with different units.

There is only a single type of artificial intelligence for the computer opponent. Pretty much all other RTS games offer multiple different opponent AIs. These are either following completely different strategies or are based on a few basic types of AIs which are limited by some external influences, e.g. limiting the rate of resources they get/can collect, or limiting them to certain unit types.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_game_menu.png.wm-1024x537.jpg)

The game itself does not look very attractive, even with the "realistic-looking" water. Smoke looks okay, but smoke is easy. There is nothing going on on the maps: The ground has only a single texture, the shoreline is very edgy at many points, there is no vegetation except for some lonely trees. Shadows look "wrong"(but enabling them seemed to cause crashes anyways). All the standard mouse and keyboard bindings (assign the selected units to a group, select group, move, attack, etc.) are there and working.

One of the lesser common features is that you can zoom out of the map completely and the engine marks all units with a coloured rectangle. This is something Command & Conquer never had, but games like Supreme Commander did too.

![][10]

![][12]

The game logic is identical to all the other "traditional" Base Building RTS games. You start with a base (Boson calls it the Command Bunker) and optionally some additional buildings and units. The Command Bunker builds all buildings, factory buildings produce units, electrical power or can fight units. Some buildings change the game, e.g. the existence of a Radar will show enemy units on the mini-map even if they are currently inside the fog of war. Some units can gather resources (Minerals and Oil in case of Boson) and bring them to refineries, each unit and building comes at the cost of a defined amount of these resources. Buildings require electrical power. Since war is mostly a game of logistics, finding and securing resources and destroying the opponent before the resources run out is key. There is a "Tech Tree" with dependencies, which prevents you from being able to build everything right from the start. For example advanced units require the existence of a Tech Center or something similar.

There are basically two types of user interfaces for RTS games: In the first one building units and buildings is part of the UI itself. There is a central menu, often at the left or at the right of the screen, which shows all options and when you click one production starts regardless of whether your base or factory buildings are visible on the screen right now or not. In the second one you have to select the your Command Bunker or each of the factories manually and choose from their individual menus. Boson uses the second type. The menu items are not very clear and not easily visible, but I guess once you're accustomed to them the item locations move to muscle memory.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_command_bunker.png.wm-1024x579.jpg)

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_weapons_factory.png.wm-1024x465.jpg)

In total the game could probably already look quiet nice if somebody made a couple of nice maps and cleaned up the user interface. But there is a long list of annoying bugs. Units often simply stop if they encounter an obstacle. Mineral and Oil Harvesters are supposed to shuttle between the location of the resource and a refinery automatically, but their internal state machine seems to fail a lot. Send the collector to a Mineral Mine, it doesn't start to collect. Click around a lot, it suddenly starts to collect. When it it full, it doesn't go back to the refinery or goes there and doesn't unload. Sometimes the whole cycle works for a while and then breaks while you're not looking. Frustrating.

Vehicles also sometimes go through water when they're not supposed to, or even go through the map geometry (!). This points at some major problem with collision detection.

![](http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_vehicle_through_geometry.png.wm.jpg)

The win/loose message does look a bit… beta as well 😉

[![][14]][14]

### Why was it never finished?

I think there were many reasons why Boson died. The engine was completely home-grown and lacking a lot in features, testing and performance. The less important subsystems, like audio output, were broken more often than not. There was no "real" focus on getting the basic parts (collecting resources, producing units, fighting battles) fully (!) working before time was spent on less important details like water, smoke, wind etc. Also there were many technical challenges. Most users wouldn't even have been able to enjoy the game even in 2006 due to the missing 3D acceleration on many Linux distributions (Ubuntu pretty much solved that in 2007, not earlier). Qt 4 had been released in 2006, and porting from Qt 3 to Qt 4 was not exactly easy. The KDE project decided to take this as an opportunity to overhaul pretty much every bit of code, leading to the KDE 4 Desktop. Boson didn't really need any of the functionality in either Qt or KDE, but it would have had been necessary to port everything anyways for no good reason.

Also the competition became much stronger after 2004. The full source code for [Warzone 2100][15], an actual commercial RTS game with much more complicated game play, had been released under an open source license in 2004 and is still being maintained today. Fans of Total Annihilation started to work on 3D viewers for the game, leading to [Total Annihilation 3D][16] and the [Spring RTS][17] engine.

Boson never had a big community of active players, so there was no pool new developers could have been recruited from. Obviously it died when the last few developers carrying it along no longer felt it was worth the time, and I think it is clear that the amount of work required to turn the game into something playable would still have been very high.

--------------------------------------------------------------------------------

via: http://www.lieberbiber.de/2017/12/29/forgotten-foss-games-boson/

作者：[sturmflut][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://marc.info/?l=kde-announce&r=1&w=2
[2]:http://www.lieberbiber.de/wp-content/uploads/2017/03/client8.jpg
[3]:http://boson.sourceforge.net
[4]:https://sourceforge.net/p/boson/code/HEAD/tree/
[5]:https://en.wikipedia.org/wiki/Accelerated_Graphics_Port
[6]:http://www.lieberbiber.de/wp-content/uploads/2017/03/0.8-1-1024x768.jpg
[7]:https://sourceforge.net/p/boson/code/3888/
[8]:http://www.lieberbiber.de/wp-content/uploads/2017/03/0.9-1.jpg
[9]:http://libufo.sourceforge.net/
[10]:http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_game_1.png.wm-1024x510.jpg
[11]:http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_game_1.png.wm.jpg
[12]:http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_maximum_zoom_out.png.wm-1024x511.jpg
[13]:http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_maximum_zoom_out.png.wm.jpg
[14]:http://www.lieberbiber.de/wp-content/uploads/2017/12/boson_game_end.png.85.jpg
[15]:http://wz2100.net/
[16]:https://github.com/zuzuf/TA3D
[17]:https://en.wikipedia.org/wiki/Spring_Engine
