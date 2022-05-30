[#]: collector: (lujun9972)
[#]: translator: (godgithubf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 ways to play video games on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-gaming)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

3 ways to play video games on Linux
======
If you're ready to put down the popcorn and experience games from all
angles, start gaming on Linux.
![Gaming with penguin pawns][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Today, I'll start with gaming.

I used to think a "gamer" was a very specific kind of creature, carefully cataloged and classified by scientists after years of study and testing. I never classified myself as a gamer because most of the games I played were either on a tabletop (board games and pen-and-paper roleplaying games), NetHack, or Tetris. Now that games are available on everything from mobile devices, consoles, computers, and televisions, it feels like it's a good time to acknowledge that "gamers" come in all different shapes and sizes. If you want to call yourself a gamer, you can! There's no qualification exam. You don't have to know the Konami Code by heart (or even what that reference means); you don't have to buy and play "triple-A" games. If you enjoy a game from time to time, you can rightfully call yourself a gamer. And if you want to be a gamer, there's never been a better time to use Linux.

### Welcome to the underground

Peel back the glossy billboard ads, and underneath, you're sure to find a thriving gaming underground. It's a movement that began with the nascent gaming market before anyone believed money could be made off software that wasn't either a spreadsheet or typing tutor. Indie games have carved out a place in pop culture (believe it or not, [Minecraft, while not open source][2], started out as an indie game) in several ways, proving that in the eyes of players, gameplay comes before production value.

There's a lot of cross-over in the indie and open source developer space. There's nothing quite like kicking back with your Linux laptop and browsing [itch.io][3] or your distribution's software repository for a little-known but precious gem of an open source game.

There are all kinds of open source games available, including plenty of [first person shooters][4], puzzle games like [Nodulus][5], systems management games like [OpenTTD][6], racing games like [Jethook][7], tense escape campaigns like [Sauerbraten][8], and too many more to mention (with more arriving each year, thanks to great initiatives like [Open Jam][9]).

![Jethook game screenshot][10]

Jethook

Overall, the experience of delving into the world of open source games is different than the immediate satisfaction of buying whatever a major game studio releases next. Games by the big studios provide plenty of visual and sonic stimuli, big-name actors, and upwards of 60 hours of gameplay. Independent and open source games aren't likely to match that, but then again, major studios can't match the sense of discovery and personal connection you get when you find a game that you just know nobody else _has ever heard of_. And they can't hope to match the sense of urgency you get when you realize that everybody in the world really, really needs to hear about the great game you've just played.

Take some time to identify the kinds of games you enjoy the most, and then have a browse through your distribution's software repository, [Flathub][11], and open game jams. See what you can uncover and, if you like the game enough, help to promote it!

### Proton and WINE

Gaming on Linux doesn't stop with open source, but it is enabled by it. When Valve Software famously brought Linux back into the gaming market a few years ago by releasing their Steam client for Linux, the hope was that it would compel game studios to write code native to Linux systems. Some did, but Valve failed to push Linux as the primary platform even on their own Valve-branded gaming computers, and it seems that most studios have reverted to their old ways of Windows-only games.

Interestingly, though, the end result has produced more open source code than probably intended. Valve's solution for Linux compatibility has been to create the [Proton][12] project, a compatibility layer to translate Windows games to Linux. At its core, Proton uses [WINE (Wine Is Not an Emulator)][13], the too-good-to-be-true reimplementation of major Windows libraries as open source.

The game market's spoils have turned out to be a treasure trove for the open source world, and today, most games from major studios can be run on Linux as if they were native.

Of course, if you're the type of gamer who has to have the latest title on the day of release, you can certainly expect unpleasant surprises. That's not surprising, though, because few major games are released without bugs requiring large patches a week later. Those bugs can be even worse when a game runs on Proton and WINE, so Linux gamers often benefit by refraining from early adoption. The trade-off may be worth it, though. I've played a few games that run perfectly on Proton, only to discover later from angry forum posts that it's apparently riddled with fatal errors when played on the latest version of Windows. In short, it seems that games from major studios aren't perfect, and so you can expect similar-but-different problems when playing them on Linux as you would on Windows.

### Flatpak

One of the most exciting developments of recent Linux history is [Flatpak][14], a cross between local containers and packaging. It's got nothing to do with gaming (or doesn't it?), but it enables Linux applications to essentially be distributed universally to any Linux distribution. This applies to gaming because there are often lots of fringe technologies used in games, and it can be pretty demanding on distribution maintainers to keep up with all the latest versions required by any given game.

Flatpak abstracts that away from the distribution by establishing a common Flatpak-specific layer for application libraries. Distributors of flatpaks know that if a library isn't in a Flatpak SDK, then it must be included in the flatpak. It's simple and straightforward.

Thanks to Flatpak, the Steam client runs on something obvious like Fedora and on distributions not traditionally geared toward the gaming market, like [RHEL][15] and Slackware!

### Lutris

If you're not eager to sign up on Steam, though, there's my preferred gaming client, [Lutris][16]. On the surface, Lutris is a simple game launcher for your system, a place you can go when you know you want to play a game but just can't decide what to launch yet. With Lutris, you can add [all the games you have on your system][17] to create your own gaming library, and then launch and play them right from the Lutris interface. Better still, Lutris contributors (like me!) regularly publish installer scripts to make it easy for you to install games you own. It's not always necessary, but it can be a nice shortcut to bypass some tedious configuration.

Lutris can also enlist the help of _runners_, or subsystems that run games that wouldn't normally launch straight from your application menu. For instance, if you want to play console games like the open source [Warcraft Tower Defense][18], you must run an emulator, and Lutris can handle that for you (provided you have the emulator installed). Additionally, should you have a GOG.com (Good Old Games) account, Lutris can access it and import games from your library.

There's no easier way to manage your games.

### Play games

Linux gaming is a fulfilling and empowering experience. I used to avoid computer gaming because I didn't feel I had much of a choice. It seemed that there were always expensive games being released, which inevitably got extreme reactions from happy and unhappy gamers alike, and then the focus shifted quickly to the next big thing. On the other hand, open source gaming has introduced me to the _people_ of the gaming world. I've met other players and developers, I've met artists and musicians, fans and promoters, and I've played an assortment of games that I never even realized existed. Some of them were barely long enough to distract me for just one afternoon, while others have provided me hours and hours of obsessive gameplay, modding, level design, and fun.

If you're ready to put down the popcorn and experience games from all angles, start gaming on Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-gaming

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_grid_penguin.png?itok=7Fv83mHR (Gaming with penguin pawns)
[2]: https://opensource.com/alternatives/minecraft
[3]: https://itch.io/jam/open-jam-2020
[4]: https://opensource.com/article/20/5/open-source-fps-games
[5]: https://hyperparticle.itch.io/nodulus
[6]: https://www.openttd.org/
[7]: https://rcorre.itch.io/jethook
[8]: http://sauerbraten.org/
[9]: https://opensource.com/article/18/9/open-jam-announcement
[10]: https://opensource.com/sites/default/files/game_0.png
[11]: http://flathub.org
[12]: https://github.com/ValveSoftware/Proton
[13]: http://winehq.org
[14]: https://opensource.com/business/16/8/flatpak
[15]: https://www.redhat.com/en/enterprise-linux-8
[16]: http://lutris.net
[17]: https://opensource.com/article/18/10/lutris-open-gaming-platform
[18]: https://ndswtd.wordpress.com/download
