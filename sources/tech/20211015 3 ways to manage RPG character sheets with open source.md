[#]: subject: "3 ways to manage RPG character sheets with open source"
[#]: via: "https://opensource.com/article/21/10/manage-rpg-character-sheets"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 ways to manage RPG character sheets with open source
======
Learn about two terminal commands and a desktop application.
![Dice on a keyboard][1]

It's that time of year again for gamers everywhere.

Tomorrow is [Free RPG Day][2], a day when publishers across the tabletop role-playing game industry release games for players both new and experienced, and they're all completely free. Although Free RPG Day was canceled in 2020, it's back this year as a live event with some virtual support by way of free RPG sampler downloads from [Dungeon Crawl Classics][3] and [Paizo][4]. And if the event's virtual offerings aren't enough, you might check out my list of [open source tabletop RPGs.][5]

Over the past two years, like most people, I've been playing my tabletop games online. I use [open source video conferencing][6] and some [shared mapping software][7]. Don't get me wrong: I love my pen and paper for analog games. To this day, I rarely leave home without my 2E5 quad book so I can sketch out dungeon maps on the go. But I find my computer desk gets pretty cluttered between RPG sourcebooks, splat books, random tables, dice tower, dice, and character sheets. To clear some space, I've recently adopted a digital system for my character sheets, for both my player characters and non-player characters when I DM.

### Digital character sheets

Typically, a character sheet is filled out in pencil on old-fashioned physical paper. It's a time-honored tradition that I've done since the late '80s, and even more experienced players have been doing since the late '70s. Going digital can be a big step away from something that might feel like an intrinsic part of the game. I sympathize with that sentiment, and I don't take my digital character sheets lightly.

When I decide to maintain a character with the aid of a computer, I insist on substantial benefit for my divergence. I've tried two different options for digital character sheets, and one of my players invented a third. They're all open source, and I believe they each have unique advantages that make them worth trying out.

### pc

The `pc` command reads character data as an INI file, then lets you query it by category or by attribute. The format is relatively flexible, making it suitable for most RPG systems, whether you play D&amp;D, Swords &amp; Wizardry, Pathfinder, Starfinder, Stardrifter, or something else.

The syntax for an INI file is so simple that it's almost intuitive. Each heading is enclosed in brackets, and each stat is a key and value pair.

Here's a small sample:


```
[Character]
Name=Skullerix
Level=5
Class=Fighter
Ancestry=Human

[Health]
AC=14
HP=43
Max=66
```

The limitation to this format is that you can't have single-value attributes. That means that if you want to list attributes that get a proficiency bonus in D&amp;D 5th Edition, you can't just list the attributes:


```
[Save]
DEX
INT
```

Instead, you must force them to be a pair.

In D&amp;D 5e, it's easy to come up with a value. These saving throws are highlighted only because your proficiency bonus applies to them, so I just make a note of the character's current bonus:


```
[Save]
DEX=3
INT=3
```

In other systems, there may be attributes that simply don't have a value and really are meant just to be listed. In that case, you can either set a value to itself or to `True`:


```
[Save]
DEX=DEX
INT=True
```

Once you've entered your character's data into the INI format, you can query it with the `pc` command. The command requires the `--character` or `-c option` along with the character sheet file you want to query. With no further arguments, you get a listing of the entire character sheet.

Add a heading name to view all stats within one category:


```
$ pc -c skullerix.ini Character
Character:
Name: Skullerix
Level: 5
Class: Fighter
Ancestry: Human
```

Provide a heading name plus a key name to view the value of a specific stat:


```
$ pc -c skullerix.ini Character Level
Level: 5
```

If you're like me and play lots of games, you can keep all of your characters in the default location `~/.local/share/pc,` then query them without the path or file extension.

For instance, say you have `froese.ini, kitaro.ini`, and `wendy.ini<` in `~/.local/share/pc`:


```
$ pc -c kitaro Character Class
Class: Wizard
$ pc -c wendy Health AC
23
$ pc -c froese Save INT
3
```

To see the characters in your default folder, use the `--list` or `-l` option:


```
$ pc --list
froese.ini
kitaro.ini
wendy.ini
```

The pc project is written in Lua and is available from its [Gitlab repository][8].

### PCGen

PCGen is an application designed to help you build and maintain characters. It even has knowledge of the rules of the system it's assisting you with. Far from just a configuration file generator, PCGen is a database of open source rules and how they relate to one another over the course of a character's life.

PCGen can build characters for D&amp;D 5e, Pathfinder 1e, Starfinder, and Fantasy Craft. When you first launch PCGen, you can download rule definitions for each game. The files are small, but depending on what you want to install, there can be a lot of files to download.

You only have to do it once, though, and PCGen tends to everything else but clicking the button to start the download for each system.

Once you have everything downloaded, you can start creating characters by selecting **New** from the **File** menu.

PCGen keeps track of incomplete tasks in the panel labeled **Things to be done**, and it helps you proceed through the process of satisfying each requirement until you've got a complete character.

![PCGen dashboard showing a character summary][9]

(Seth Kenlon, CC BY-SA 4.0)

PCGen does all calculations for you, so you don't have to figure out your skill ranks, how a proficiency bonus affects your rolls, and other computations. Better yet, you don't have to calculate how your scores change as you level up or even what benefits you get with each new level. You'll have choices to make at each level, but you don't have to flip through your rulebook in hopes you're not missing anything significant.

One of my favorite things about PCGen is its ability to render your character sheet when finished.

On paper, your eyes probably know exactly where to look to find your proficiency bonus, or skill ranks, or other character stats. In some formats, you lose that when you go digital. PCGen has a built-in renderer and can show you your character in standard character sheet layouts that an experienced player will likely find familiar.

![A traditional-looking RPG character sheet rendered by PC Gen][10]

(Seth Kenlon, CC BY-SA 4.0)

PCGen is an ENnie award winner, and it's well deserved. Maintaining a character is easy with PCGen, and it's an application I find myself opening on lazy afternoons just for the fun of building something new.

  * On Linux, download PCGen's universal installer from [pcgen.org.][11] You must have [Java installed][12].) Run `pcgen.sh` to launch the application.
  * On macOS, download PCGen's universal installer from [pcgen.org][11]. You must have [Java installed][13].) Run `pcgen.sh` to launch the application.
  * On Windows, download PCGen's Windows installer from [pcgen.org][11]. You must also [install Java][14].



### Player character XML

One of the advantages of using a terminal command to query character sheets is that you gain independence from the layout.

Playing several game systems can be taxing, because nearly every system has its own layout. With a terminal command, however, instead of looking over sheets of paper for data, you look up the same information quickly by letting your computer do the scanning.

One of the projects I've been enjoying lately for character tracking is the d project, which uses XML to express character stats and the `xmllint` command to query it. The d project features a few utilities:

  * `d` command rolls dice (include FUDGE die).
  * `v` command queries character sheets.
  * The `e` command initializes your home directory by placing files in predictable locations.



Because [XML is so flexible][15], this format allows you to devise your own schema, depending on what works best for your system.

For example, a class-based system like D&amp;D or Pathfinder may benefit from a section for special class features, while a skill-based system might have a simple schema with no categories.

Here's a simple example:


```
&lt;char&gt;
  &lt;name&gt;Robin Hood&lt;/name&gt;
  &lt;health&gt;20&lt;/health&gt;
  &lt;acrobat&gt;5&lt;/acrobat&gt;
  &lt;archery&gt;8&lt;/archery&gt;
  &lt;disguise&gt;3&lt;/disguise&gt;
&lt;/char&gt;
```

First, export the location of the character sheet:


```
`$ export CHAR_SHEET=~/.config/char/robin.xml`
```

Alternately, you can initialize your home directory with the `e` command, which creates the `~/.config/char` directory and defines the `CHAR_SHEET` variable in your `.bashrc` file:


```
`$ e init`
```

After you've got your environment configured, you can query your character sheet:


```
$ ./v char.name
&lt;name&gt;Robin Hood&lt;/name&gt;
$ ./v char.archery
&lt;archery&gt;7&lt;/archery&gt;
```

Functionally, `v` is similar to the `pc` script, but because it uses XML, there are a lot of possibilities for how you view it. With XSL, you could style your XML-based character sheet and give it a layout for users who aren't comfortable in the terminal but still retain the XML source for those who are.

### Open source at the open table

Whether you're looking for a complex application like PCGen to guide you through character creation or simple utilities like pc or d to quickly query character stats, open source has plenty of options for you.

And the choice of tooling is precisely what makes it such a pleasure to do your analog game in a digital remote setting.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/manage-rpg-character-sheets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice-keys_0.jpg?itok=PGEs3ZXa (Dice on a keyboard)
[2]: https://www.freerpgday.com/
[3]: https://goodman-games.com/blog/2021/10/06/pdf-previews-of-our-free-rpg-day-releases/
[4]: https://paizo.com/community/blog/v5748dyo6shte
[5]: https://opensource.com/article/20/7/free-rpg-day
[6]: https://opensource.com/article/21/9/alternatives-zoom
[7]: https://opensource.com/article/19/6/how-use-maptools
[8]: https://gitlab.com/slackermedia/pc
[9]: https://opensource.com/sites/default/files/uploads/pcgen-build.png (Character building with PCGEN)
[10]: https://opensource.com/sites/default/files/uploads/pcgen-render.png (rendered character sheet)
[11]: http://pcgen.org/download/
[12]: https://opensource.com/article/19/11/install-java-linux
[13]: https://opensource.com/article/20/7/install-java-mac
[14]: https://access.redhat.com/documentation/pt-br/openjdk/11/html-single/installing_and_using_openjdk_11_for_windows/index
[15]: https://opensource.com/article/21/7/what-xml
