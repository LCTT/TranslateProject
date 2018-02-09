Become a Hollywood movie hacker with these three command line tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

If you ever spent time growing up watching spy thrillers, action flicks, or crime movies, you developed a clear picture in your mind of what a hacker's computer screen looked like. Rows upon rows of rapidly moving code, streams of grouped hexadecimal numbers flying past like [raining code][1] in The Matrix.

Perhaps there's a world map with flashing points of light and a few rapidly updating charts thrown in there for good measure. And probably a 3D rotating geometric shape, because why not? If possible, this is all shown on a ridiculous number of monitors in an ergonomically uncomfortable configuration. I think Swordfish sported seven.

Of course, those of us who pursued technical careers quickly realized that this was all utter nonsense. While many of us have dual monitors (or more), a dashboard of blinky, flashing data is usually pretty antithetical to focusing on work. Writing code, managing projects, and administering systems is not the same thing as day trading. Most of the situations we encounter require a great deal of thinking about the problem we're trying to solve, a good bit of communicating with stakeholders, some researching and organizing information, and very, very little [rapid-fire typing][7].

That doesn't mean that we sometimes don't feel like we want to be inside of one of those movies. Or maybe, we're just trying to look like we're "being productive."

**Side note: Of course I mean this article in jest.** If you're actually being evaluated on how busy you look, whether that's at your desk or in meetings, you've got a huge cultural problem at your workplace that needs to be addressed. A culture of manufactured busyness is a toxic culture and one that's almost certainly helping neither the company nor its employees.

That said, let's have some fun and fill our screens with some panels of good old-fashioned meaningless data and code snippets. (Well, the data might have some meaning, but not without context.) While there are plenty of fancy GUIs for this (consider checking out [Hacker Typer][8] or [GEEKtyper.com][9] for a web-based version), why not just use your standard Linux terminal? For a more old-school look, consider using [Cool Retro Term][10], which is indeed what it sounds like: A cool retro terminal. I'll use Cool Retro Term for the screenshots below because it does indeed look 100% cooler.

### Genact

The first tool we'll look at is Genact. Genact simply plays back a sequence of your choosing, slowly and indefinitely, letting your code “compile” while you go out for a coffee break. The sequence it plays is up to you, but included by default are a cryptocurrency mining simulator, Composer PHP dependency manager, kernel compiler, downloader, memory dump, and more. My favorite, though, is the setting which displays SimCity loading messages. So as long as no one checks too closely, you can spend all afternoon waiting on your computer to finish reticulating splines.

Genact has [releases][11] available for Linux, OS X, and Windows, and the Rust [source code][12] is available on GitHub under an [MIT license][13].

![](https://opensource.com/sites/default/files/uploads/genact.gif)

### Hollywood

Hollywood takes a more straightforward approach. It essentially creates a random number and configuration of split screens in your terminal and launches busy looking applications like htop, directory trees, source code files, and others, and switch them out every few seconds. It's put together as a shell script, so it's fairly straightforward to modify as you wish.

The [source code][14] for Hollywood can be found on GitHub under an [Apache 2.0][15] license.

![](https://opensource.com/sites/default/files/uploads/hollywood.gif)

### Blessed-contrib

My personal favorite isn't actually an application designed for this purpose. Instead, it's the demo file for a Node.js-based terminal dashboard building library called Blessed-contrib. Unlike the other two, I actually have used Blessed-contrib's library for doing something that resembles actual work, as opposed to pretend-work, as it is a quite helpful library and set of widgets for displaying information at the command line. But it's also easy to fill with dummy data to fulfill your dream of simulating the computer from WarGames.

The [source code][16] for Blessed-contrib can be found on GitHub under an [MIT license][17].

![](https://opensource.com/sites/default/files/uploads/blessed.gif)

Of course, while these tools make it easy, there are plenty of ways to fill up your screen with nonsense. One of the most common tools you'll see in movies is Nmap, an open source security scanner. In fact, it is so overused as the tool to demonstrate on-screen hacking in Hollywood that the makers have created a page listing some of the movies it has [appeared in][18], from The Matrix Reloaded to The Bourne Ultimatum, The Girl with the Dragon Tattoo, and even Die Hard 4.

You can create your own combination, of course, using a terminal multiplexer like screen or tmux to fire up whatever selection of data-spitting applications you wish.

What's your go-to screen for looking busy?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/command-line-tools-productivity

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:http://tvtropes.org/pmwiki/pmwiki.php/Main/MatrixRainingCode
[2]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[7]:http://tvtropes.org/pmwiki/pmwiki.php/Main/RapidFireTyping
[8]:https://hackertyper.net/
[9]:http://geektyper.com
[10]:https://github.com/Swordfish90/cool-retro-term
[11]:https://github.com/svenstaro/genact/releases
[12]:https://github.com/svenstaro/genact
[13]:https://github.com/svenstaro/genact/blob/master/LICENSE
[14]:https://github.com/dustinkirkland/hollywood
[15]:http://www.apache.org/licenses/LICENSE-2.0
[16]:https://github.com/yaronn/blessed-contrib
[17]:http://opensource.org/licenses/MIT
[18]:https://nmap.org/movies/
