Comparing Twine and Ren'Py for creating interactive fiction
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/book_list_fiction_sand_vacation_read.jpg?itok=IViIZu8J)

Any experienced technology educator knows engagement and motivation are key to a student's learning. Of the many techniques for stimulating engagement and motivation among learners, storytelling and game creation have good track records of success, and writing interactive fiction is a great way to combine both of those techniques.

Interactive fiction has a respectable history in computing, stretching back to the text-only adventure games of the early 1980s, and it's enjoyed a new popularity recently. There are many technology tools that can be used for writing interactive fiction, but the two that will be considered here, [Twine][1] and [Ren'Py][2], are ideal for the task. Each has different strengths that make it more attractive for particular types of projects.

### Twine

![Twine 2.0][4]

![][5]

Twine is a popular cross-platform open source interactive fiction system that developed out of the HTML- and JavaScript-based [TiddlyWiki][6]. If you're not familiar with Twine, multimedia artist and Opensource.com contributor Seth Kenlon's article on how he [uses Twine to create interactive adventure games][7] is a great introduction to the tool.

One of Twine's advantages is that it produces a single, compiled HTML file, which makes it easy to distribute and play an interactive fiction work on any system with a reasonably modern web browser. But this comes at a cost: While it will support graphics, sound files, and embedded video, Twine is somewhat limited by its roots as a primarily text-based system (even though it has developed a lot over the years).

This is very appealing to new learners who can rapidly produce something that looks good and is fun to play. However, when they want to add visual effects, graphics, and multimedia, learners can get lost among the different, creative ways to do this and the maze of different Twine program versions and story formats. Even so, there's an impressive amount of resources available on how to use Twine.

Educators often hope learners will take the skills they have gained using one tool and build on them, but this isn't a strength for Twine. While Twine is great for developing literacy and creative writing skills, the coding and programming side is weaker. The story format scripting language has what you would expect: logic commands, conditional statements, arrays/lists, and loops, but it is not closely related to any popular programming language.

### Ren'Py

![Ren'Py 7.0][9]

![][5]

Ren'Py approaches interactive fiction from a different angle; [Wikipedia][10] describes it as a "visual novel engine." This means that the integration of graphics and other multimedia elements is a lot smoother and more integrated than in Twine. In addition, as Opensource.com contributor Joshua Allen Holm explained, [you don't need much coding experience][11] to use Ren'Py.

Ren'Py can export finished work for Android, Linux, Mac, and Windows, which is messier than the "one file for all systems" that comes from Twine, particularly if you get into the complexity of making builds for mobile devices. Bear in mind, too, that finished Ren'Py projects with their multimedia elements are a lot bigger than Twine projects.

The ease of downloading graphics and multimedia files from the internet for Ren'Py projects also provides a great opportunity to teach learners about the complexities of copyright and advocate (as everyone should!) for [Creative Commons][12] licenses.

As its name suggests, Ren'Py's scripting languages are a mix of true Python and Python-like additions. This will be very attractive to educators who want learners to progress to Python programming. Python's syntatical rules and strict enforcement of indentation are more intimidating to use than the scripting options in Twine, but the long-term gains are worth it.

### Comparing Twine and Ren'Py

There are various reasons why Twine has become so successful, but one that will appeal to open source enthusiasts is that anyone can take a compiled Twine story or game and import it back into Twine. This means if you come across a compiled Twine story or game with a neat feature, you can look at the source code and find out how it was done. Ren'Py allows a level of obfuscation that prevents low-level attempts at hacking.

When it comes to my work helping people with visual impairments use technology, Ren'Py is superior to Twine. Despite claims to the contrary, Twine's HTML files can be used by screen reader users—but only with difficulty. In contrast, Ren'Py has built-in self-voicing capabilities, something that I am very pleased to see, although Linux users may need to add the [eSpeak package][13] to support it.

Ren'Py and Twine can be used for similar purposes. Text-based projects tend to be simpler and quicker to create than ones that require creating or sourcing graphics and multimedia elements. If your projects will be more text-based, Twine might be the best choice. And, if your projects make extensive use of graphics and multimedia elements, Ren'Py might suit you better.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/twine-vs-renpy-interactive-fiction

作者：[Peter Cheer][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/petercheer
[1]:http://twinery.org/
[2]:https://www.renpy.org/
[3]:/file/402696
[4]:https://opensource.com/sites/default/files/uploads/twine2.png (Twine 2.0)
[5]:data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw== (Click and drag to move)
[6]:https://tiddlywiki.com/
[7]:https://opensource.com/article/18/2/twine-gaming
[8]:/file/402701
[9]:https://opensource.com/sites/default/files/uploads/renpy.png (Ren'Py 7.0)
[10]:https://en.wikipedia.org/wiki/Ren%27Py
[11]:https://opensource.com/life/13/8/gaming-renpy
[12]:https://creativecommons.org/
[13]:http://espeak.sourceforge.net/
