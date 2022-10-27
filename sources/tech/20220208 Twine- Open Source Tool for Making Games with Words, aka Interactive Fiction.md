[#]: subject: "Twine: Open Source Tool for Making Games with Words, aka Interactive Fiction"
[#]: via: "https://itsfoss.com/twine/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Twine: Open Source Tool for Making Games with Words, aka Interactive Fiction
======

_**Brief: Twine and free and [open source tool for creating interactive fiction][1] or text based games.**_

Everyone has a game inside them waiting to come out, just like a chestburster. Unfortunately, not everyone has the skills to create a game, especially one complete with graphics. Thankfully, there is a way to create a fun game using only words. Let me share an application that could help you with it.

### What is Twine?

![Twine story list][2]

As I alluded to above, [Twine][3] allows anyone to create a game without needing to know how to write code. Remember those [Choose-Your-Own-Adventure][4] books? That’s essentially how Twine works.

You create a series of passages, which can be one sentence or a wall of text. You named each of these passages, so you can keep track of them. After that, you connect these passages and create several paths for the player to follow based on their decisions.

Creating a new passage is as easy as putting double brackets around a sentence, for example, **[[Let’s continue!]]**. In this example, “Let’s continue!” is the link you click to get to the new passage, and that sentence becomes the name of the new passage.

I prefer to make the name of the new passage different from the linking sentence. You can do that using this format: **[[Let’s continue!|start-journey]]**. In this example, you click the sentence “Let’s continue!” to go to the passage titled start-journey.

![Twine editor][5]

When you’re done, you can publish the game as an HTML file and share it with friends or share it on a site like itch.io.

There are more advanced features available to make more intricate games. These features include:

  * Support for variables
  * Input boxes to get information from the player
  * if…then statements
  * Loops and more



Another thing to keep in mind is that, Twine makes use of multiple Story Formats. A Story format is essentially a game engine that is baked into the HTML file and makes the game work. Twine comes with three Story Formats:

  * Harlowe – This format is the default, and it designed to be easy for beginners to learn
  * Snowman – This format is for game developers who are more familiar with JavaScript and CSS. Use this format to make a customized playing experience.
  * SugerCube – This format is inspired by early versions of Twine and allows the player to save progress and other features.
  * Chapbook – This format is designed for newer users and have advanced functions built in.



![Twine story structure][6]

### Installation

Unfortunately, most repos do not have the latest version of Twine. This may change in the future.

If you are on Arch or have the [Homebrew][7] 3rd party package manager installed, you are in luck.

Otherwise, you need to download the latest version and from the site, unzip the folder and run the executable.

_**If you don’t want to install Twine or if you want to try it first, you can check out the [online version][8].**_

### My Experience

I’ve created a [couple of games][9] with Twine for some game jams. These were the first games I’ve ever created, and I had fun. At that time, if you wanted to use the advanced features, you had to do a bit of coding. Now, you can add those features using tools in the editor.

One of the problems with Twine is that you cannot really use it with git. That’s because the Twine editor stores all files in the same place. There is no way to change the destination for one.

Another issue is that it is a pain to proofread a game. There is an option to “View Proofing Copy”, which shows you everything on a single page. If you have a smaller game, then there is no issue, but if you have a larger game, it takes to fix spelling and grammar errors. Thankfully, there is a tool for that.

[Tweego][10] is a tool written in Go that allows you to write your Twine game using plain text files. Tweego was inspired by [twee][11], which was Twine’s official command line tool. twee hasn’t been updated in 5 year so can’t be used with the newer version of Twine. Tweego allows you to export your game directly to HTML or to the Twine format.

You can easily use git to back up files create with Tweego. The text files are also very easy to put into a spellchecker. Here is the [text file][12] for a simple game I wrote using Tweego to give you an idea of how readable it is.

![Twine dark mode on Windows][13]

### Final Thoughts

Overall, I think that Twine is a very good tool to create games. It is very simple to learn and has tools that allow you to create fairly complicated games without needing to know how to code.

I worry though that most people ignore games that don’t have flashy graphics. Text games were the first games on computers and are still fun to play. All you need is a little imagination.

--------------------------------------------------------------------------------

via: https://itsfoss.com/twine/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/create-interactive-fiction/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/twine-story-list.png?resize=800%2C502&ssl=1
[3]: https://twinery.org/
[4]: https://en.wikipedia.org/wiki/Choose_Your_Own_Adventure
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/twine-editor-800x502.png?resize=800%2C502&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/twine-story-structure.png?resize=800%2C502&ssl=1
[7]: https://itsfoss.com/homebrew-linux/
[8]: https://twinery.org/2
[9]: https://johnblood.itch.io/
[10]: https://www.motoslave.net/tweego/
[11]: https://github.com/tweecode/twee
[12]: https://github.com/JohnBlood/Adom-10/blob/main/src/adom-10.twee
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/twine-dark-mode.png?resize=800%2C471&ssl=1
