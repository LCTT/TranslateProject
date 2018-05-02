PCGen: An easy way to generate RPG characters
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_gaming.png?itok=poe7HXJ7)
Do you remember the first time you built a role-playing game (RPG) character? It was exciting and full of possibility, and your imagination ran wild. If you're an avid gamer, it was probably a major milestone for you.

But do you also remember struggling to decipher an empty character sheet and what you were supposed to write down in each box? Remember poring over the core rulebook, cross-referencing one table with a class write-up, the spellbook with your chosen school of magic, and skills to your race?

Whether you thought it was fun or perplexing—or both, if you play RPGs, the process of building and tracking a character is probably as natural to you now as using a computer.

That's an appropriate analogy, because, as we all know, character sheets have been computerized. It's a sensible match; computers are great for tracking information that changes frequently. They certainly handle it a lot better than scratches on paper worn thin by repeated erasing and scribbling and more erasing.

Sure, you could build custom spreadsheets in [Libre Office][1], but then again you could also try [PCGen][2], a Java-based application that makes character creation and maintenance sublimely simple without taking the fun out of either. While it doesn't have a mobile version, there is a [PCGen viewer][3] for Android so you can access your build whenever you need to.

### Downloading and installing

PCGen is a Java application, so it runs on anything that has Java installed. This isn't quite the same thing as Java in your web browser; PCGen is a downloadable application that runs locally on your computer. You likely already have Java installed; if not, download and install it from your distribution's repository. If you're not sure whether you have it installed, you can [download PCGen][4] first, try to run it, and install Java if it fails to run.

Since PCGen is a Java application, you don't have to install it after you download it (because you've already got the Java runtime installed). The application should just run if you double-click the `pcgen.jar` file, but if your computer hasn't been told what to do with a Java app yet, you may need to tell it explicitly to run in Java. You usually do this by right-clicking and specifying what application to open the file in. The application you want, of course, is Java or, if you're asked to input the application launch command manually, `java -jar`.

Linux and BSD users can customize this experience:

  1. Download PCGen to a directory, such as `/opt` or `~/bin`.
  2. Unzip the archive with `unzip pcgen-x.yy.zz-full.zip`.
  3. Download a suitable icon (e.g., `wget https://openclipart.org/image/300px/svg_to_png/285672/d20-blank.png -O pcgen/d20.png`.
  4. Create a file called `pcgen.desktop` in your `~/.local/share/applications` directory. Open it in a text editor and type the following, adjusting as appropriate:


```
[Desktop Entry] Version=1.0 Type=Application Name=PCGen Exec="/home/your-username/bin/pcgen/pcgen.sh" Encoding=UTF-8 Icon=/home/your-username/bin/pcgen/d20.png

```

Now you can launch PCGen from your system's application menu as you would any other applications.

### Player agency

Many hours of my childhood were spent poring over my friends' D&D Player Handbooks, rolling up characters that I'd never play (thanks to the infamous "satanic panic," I wasn't allowed to play the game). What I learned from this is creating a character for an RPG is a kind of mini-game itself. There are rules to follow, important choices to make, and ultimately a needed narrative to make it all come together.

A new player might think it's a good idea to allow an application to do a build for them, but most experienced players probably agree that the best way to learn is by doing. And besides, letting something build your character would rob you of the mini-game that is character building. If an application is nothing more than a pre-gen factory, one of the most important parts of being a player is removed from the game, and nobody wants that.

On the other hand, nobody wants the character building process to discourage new players.

PCGen manages to strike a perfect balance between guiding you through a character build and staying out of your way as you tinker. Primarily it does this by using an unobtrusive alert system that keeps you updated about any required tasks left in your character build. It's helpful without grabbing the steering wheel out of your hands to take over completely.


![PCGen to-do list][6]

No annoying Clippy, but plenty of helpful hints

### Getting started

PCGen essentially has two modes: the character build and the character sheet. When you launch it, PCGen first asks you to choose the game system you're building for.

![System selection][8]

Selecting your game system

Included systems are OGL (Open Game License) systems, including D&D 5e (3 and 3.5 editions), Pathfinder, and Fantasy Craft. Better still, PCGen comes preloaded with all manner of add-on material, so not only can you design characters from advanced and third-party modules, the dungeon master (DM) can even create stats for monsters and villains.

Once you've double-clicked the system you're using, you're presented with a helpful screen letting you either load an existing build you have saved or start building a new one. Each new character gets its own tab in PCGen, so if you want to build a whole party or if a DM wants to track a whole hoard of monsters, it's easy to load up a cast of characters and have them at the ready.

Starting from the top left, your character build starts with the basics: choosing a name, gender, and alignment. PCGen includes a random-name generator with lots of knobs and switches to adjust for etymology (real and fantasy), race, and gender.

### Rolling for abilities

When it's time to roll for ability scores, PCGen has lots of options. It defaults to manual entry. You roll physical dice and enter the numbers.

Alternately, you can let PCGen roll for you, and you can set the rolling style. You can have PCGen roll 4d6 and drop the lowest, roll 3d6, or roll 2d6 and add 6.

You can also choose to use a point-purchasing mode with a budget of anything between 15 and 25. This method might appeal to players coming from video games, many of which use this method to allocate attributes.

### Classes and levels

Once you pick a class and add your first level, your attributes are locked in and you get a budget for all remaining class- and level-dependent aspects of your character. What exactly those are, of course, depends on what system you're playing, but PCGen keeps you updated on any remaining required tasks as you go.

There are a lot of tabs in PCGen, and it can sometimes seem just as overwhelming as staring at a physical 300-page Player's Handbook, but as long as you follow the tips, PCGen can keep you on the straight and narrow.

### Character sheets

As if building your character wasn't enough fun, the most satisfying step is yet to come: seeing all your choices laid out in a proper character-sheet format.

The final tab of PCGen is the Character Sheet tab, and it formats your character's attributes into a layout of your choice. The default is a standard, generic layout. It's easily printable and easy to understand.

There are several variations and addendums available, too. For spellcasters, there's a spellbook sheet that lists available spells, and there are several alternate layouts, some optimized for screen and others for print.

If you're using PCGen as you play, you can add temporary effects to your character sheet to let PCGen adjust your attributes accordingly.

If you export your character and import it into the PCGen Importer on your Android phone or tablet, you can use your digital character sheet to track spells and current health and make temporary adjustments to armour class and other attribute modifiers.

![Exported character sheet on Android][10]

Exported character sheet on Android

### PCGen's advantages

The market is full of digital character-sheet trackers, but PCGen stands out for several reasons. First, it's cross-platform. That may or may not mean much to you, because we tend to standardize our workflow to devices that play nice with one another. In my gaming groups, though, we have Linux users and Windows users, and we have people who want to work off a mobile device and others who prefer a proper computer. Choosing an application that everyone can use and become comfortable with makes the process of updating stats more efficient.

Second, because PCGen is open source, all your character data remains in an open and parsable format. As an XML fan, I find it invaluable to get my character data as an XML dump, and it's doubly useful to me as a DM as I prepare for an upcoming adventure and need custom monster stat blocks to insert in my notes.

On a related note, knowing that PCGen will always be available regardless of a player's financial circumstance is also nice. When I changed jobs a year ago, I was lucky to go from one job to the next without interruption in income. In one of my gaming groups, however, two members have been made redundant recently and a third is a university student without much disposable income. The fact that we don't have to worry about monthly membership fees or whether we can all afford to invest in software that is, at the end of the day, a minor convenience over pen and paper gives us confidence in our choice of using digital tools.

PCGen's open source license also lends itself to rapid development and expansion and ensured maintenance. The reason there's a mobile edition is that the code and data are open. Who knows what's next?

While PCGen's default datasets revolve, naturally, around OGL content (because the OGL is open and allows content to be freely redistributed), since the application is also open, you can add whatever data you want. It's not necessarily trivial, but games like Open Legend, Dungeon Delvers, and other openly licensed games are ripe for porting to PCGen.

### Pen and paper

The pen-and-paper tradition remains important. PCGen strikes a healthy balance between the desire to make stats accounting more convenient by leveraging the latest technology while maintaining the joy of manually updating characters.

Whether you're an old-school gamer who banishes digital devices from your table or a progressive gamer who embraces technology, it's fair to say most of us have encountered a few times when a game has come to a halt because of a phone or tablet. The fact is, everyone has a mobile device now (even me, even if it's only because my job pays for it), so they will make their way onto your game table. I have found that encouraging game-relevant information to be on screens has helped focus players on the game; I'd rather my players stare at their character sheets and game reference documents than surf social media sites on their devices.

PCGen, in my experience, is the most true-to-form digital character sheet available. It allows for user control, it offers useful guidance as needed, and it's as close to pen-and-paper convenience as possible. Take a look at it, open gamers!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/pcgen-rpg-character-generator

作者：[Seth Kenlon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:http://libreoffice.org
[2]:http://pcgen.org
[3]:https://play.google.com/store/apps/details?id=com.dysfunctional.apps.pcgencharactersheet
[4]:http://pcgen.org/download/
[5]:/file/394491
[6]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pcgen_tip.jpg?itok=GXOz_OJ_ (PCGen to-do list)
[7]:/file/394486
[8]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pcgen_sys.jpg?itok=Zn0_9hkQ (System selection)
[9]:/file/394481
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pcgen_screen.jpg?itok=4V6AZPud (Exported character sheet on Android)
