[#]: subject: "Make a video game with Bitsy"
[#]: via: "https://opensource.com/article/22/1/bitsy-game-design"
[#]: author: "Peter Cheer https://opensource.com/users/petercheer"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make a video game with Bitsy
======
Bitsy is an open source video game designer. Its minimalistic features
make it prime for anyone to explore their creativity.
![Gaming artifacts with joystick, GameBoy, paddle][1]

There are many game design programs and many different possible approaches to game design, but for me, the one that stands out is Bitsy. Created by Adam Le Doux in 2017 and released under an MIT license, Bitsy is, in the words of its creator: "A little editor for little games or worlds. The goal is to make it easy to make games where you can walk around, talk to people, and be somewhere."

### Install Bitsy

Bitsy is written in JavaScript and produces HTML5 games. You can download it from [GitHub][2] or the [creator's website][3]. It's small, easy to learn, has a distinctive bit map art style, is intentionally short on features, and is limited in what it can do.

Despite (or perhaps because of) these limitations, Bitsy has attracted a vibrant user community since it was released. The two main approaches users have taken to Bitsy have been embracing the limitations and seeking to push against the limitations to see how far you can go.

### Creative bounds

The limitations of Bitsy means that accepting them and still producing a satisfying game becomes a challenge demanding inventiveness and creativity. You can see and play some of the impressive games produced with Bitsy online at the [Itch.io website][4]. At the same time, people have come up with hacks, tweaks, and extensions. These have pushed against some of the limitations without sacrificing the essence of Bitsy.

The basic elements in Bitsy are an avatar representing the player, rooms where the game action takes place, sprites (non-player characters that you can interact with), and items. There's a bitmap editor for creating these elements, which also allows for simple two-frame animations.

![Bitsy bitmap editor][5]

(Peter Cheer, [CC BY-SA 4.0][6])

Working within Bitsy relies on conditional variables rather than full-fledged scripting, making it easy to learn for those without a background in coding and sometimes frustrating to those expecting more flexibility.

If you want to see the basics of Bitsy, you can do that online at the creator's website, or download it and run it locally.

![Bitsy room editor][7]

(Peter Cheer, [CC BY-SA 4.0][6])

### Documentation

There isn't just one place to go for documentation about Bitsy. Various short videos are available on YouTube if you want to see Bitsy in action. I prefer text-based tutorials, and the three resources I found most useful are:

  * [The official Bitsy tutorial][8] made available on the Itch.io site is by Claire Morwood
  * [Bitsy workshop PDF][9] by user haraiva
  * [Bitsy variables][10] tutorial by user ayolland



Read through the tutorials, try out some Bitsy games, and get creating something of your own. Keep it simple to start with. Once you've become comfortable with Bitsy, you may want to investigate some of the [tools, hacks, and extensions][11] that people have created for it.

It's the perfect tool for educators, too, and there's even a [Bitsy class][12] curriculum by educator Hal Meeks available online.

You can also find heaps of game assets that people have made for Bitsy on the [Itch.io website][13].

### Twine integration

You may have already tried the popular browser-based game development tool [Twine][14]. You can integrate Bitsy with Twine by varying degrees. Integration can extend from simply placing a Bitsy game in an iframe to display inside your Twine game up to sharing variables between the two engines and dialogue commands which let you execute basic Twine commands inside a Bitsy game! If these possibilities interest you, then look at:

  * [Combining Bitsy and Twine tutorial][15]
  * [Bitsy hacks][16]
  * [Freya's Twisty Template][17]



### Bitsy for beginners

Beginners can get started easily with Bitsy, whether you're new to programming or just to game design. With it, you can explore all its possibilities for sparking creativity, imagination, and inventiveness.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/bitsy-game-design

作者：[Peter Cheer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petercheer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://github.com/le-doux/bitsy
[3]: https://ledoux.itch.io/bitsy
[4]: https://itch.io/games/tag-bitsy
[5]: https://opensource.com/sites/default/files/uploads/bitsy-editor-sprite.jpg (Bitsy bitmap editor)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/bitsy-editor-room.jpg (Bitsy room editor)
[8]: https://www.shimmerwitch.space/bitsyTutorial.html
[9]: https://static1.squarespace.com/static/58930a6c893fc0a33ae624db/t/5bacd94ac83025ead3937071/1538054510407/BITSY-WORKSHOP.pdf
[10]: https://ayolland.itch.io/trevor/devlog/29520/bitsy-variables-a-tutorial
[11]: https://itch.io/tools/tag-bitsy
[12]: https://halmeeks.net/bitsyclass/
[13]: https://itch.io/game-assets/tag-bitsy
[14]: https://opensource.com/article/18/2/twine-gaming
[15]: https://spdrcstl.com/blog/bitsy-twine-tutorial.html
[16]: https://github.com/seleb/bitsy-hacks/blob/main/dist/twine-bitsy-comms.js
[17]: https://communistsister.itch.io/twitsy-template-1
