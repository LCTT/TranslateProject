[#]: subject: "How I use open source to play RPGs"
[#]: via: "https://opensource.com/article/21/10/open-source-rpgs"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use open source to play RPGs
======
Find an open source tool for almost every element of role-playing games.
![Dice as a random number generator][1]

I play a lot of tabletop role-playing games (RPGs), in terms of both frequency and variety. Generally, I prefer playing RPGs in person with friends, but over the past two years, I've been playing online.

At first, I wasn't sure how to run a long-term game online. I knew there were a lot of tools out there to make it possible, but none of them interested me until I discovered the world of open source online tabletop gaming. With a small collection of open source applications, I've been able to run all my games exclusively on open source.

It's a good time of year for it, too, because it was recently [Free RPG Day][2]. On FreeRPG Day, publishers across the tabletop role-playing game industry release, free of charge, games to encourage players to try new games and new adventures. Although it was canceled in 2020, it's back this year as a live event with some virtual support by way of free RPG sampler downloads from [Dungeon Crawl Classics][3] and [Paizo][4].

And if the event's virtual offerings aren't enough, I've compiled a list of [5 open source tabletop RPGs you may not have tried yet][5].

When you're ready to start playing, try some of these open source tools and see how much they can enhance your gameplay.

### Chat

The most basic—and technically speaking, the only—requirement for an RPG game online is communication. It's the medium of the game: players need a way to talk.

There are a few good options for this. I find that [Mumble][6] is the tool with the lowest demand on bandwidth. It's a voice-only chat application that can use the very efficient Opus codec to get everyone talking for hours at a time without interruption.

![Mumble client][7]

CC BY-SA Seth Kenlon

There are public instances all around the world, so after downloading the Mumble client, you can join any of them that are open and use it to run a game online. There's a push-to-talk setting, so you can cut out background noise, which is a welcome feature when the rest of your household doesn't halt all of its activity just for your tabletop session.

There's also a text chat client for asides. My gaming groups usually use the chat to post links relevant to the game, but you could also use it for off-topic chatter in an attempt to keep the spoken game on topic.

If your players prefer facial cues or are just used to video chat web apps, then [Jitsi][8] is an excellent substitute for in-person gatherings around a table. Jitsi is mostly like every other video chat application you've ever used, except possibly even easier. You can set up a room, invite friends, keep out strangers, and play for hours. Muting and going off-camera are intuitive, the interface is attractive, and new features are being developed and introduced regularly.

![Jitsi][9]

CC BY-SA Seth Kenlon

Both Mumble and Jitsi have clients for both desktop and mobiles, so anyone can play no matter what device they're on.

### Character sheets

I've already posted about my [digital character sheet][10] solutions, but any RPG player knows that there's more to managing a character than just stats.

During a game online that spanned several sessions, I found there was a lot of downtime between games. It occurred to me that, while I found it unreasonable to demand that my players calculate encumbrance during a live pen-and-paper game, it's pretty easy to request them to track encumbrance when everything's digital.

There are plenty of spreadsheets available online, but the open source option is [Ethercalc][11]. With instances all over the world, it's easy to find a free Ethercalc host. Alternately, you can use Podman or Docker to easily install and run your own instance.

![Ethercalc spreadsheet of inventory][12]

Seth Kenlon, CC-BY-SA 4.0

Ethercalc provides the essentials: a shared ledger so players can track the items their party is carrying (and who's holding one at any given time), the weight of each item, and the value. Items get entered as the party collects loot during the game, so they know when they're too burdened to pick up something new.

Between sessions, the shared spreadsheet can be referenced and organized so that the PCs know what to sell or stuff into a bag of holding or what they can safely drop when better loot presents itself next session.

### Maps

Mythic Table is an open source shared mapping system for tabletop games. That means you can load an image to serve as the map of your game and move digital tokens on the map to represent where players' characters are located.

Since [last I wrote about Mythic Table][13], it's run a successful Kickstarter campaign to ensure its continued development. It's also gained several new features, most notably a "fog of war" feature that allows the dungeon master to blank out the map and reveal only the parts that players have explored.

![A dungeon map rendered by Mythic Table and user interface choices for chat, maps, and characters][14]

Seth Kenlon, CC-BY-SA 4.0

I've been running two games on Mythic Table for the past few months, and it's been an excellent and straightforward map system. Conveniently, it also features a digital dice roller, so if your players lack dice or you prefer to roll dice in the open, you have a shared dice pool.

You can try Mythic Table at [mythictable.com][15] or visit their code repository on [Github][16].

### Open gaming on open source

The open source tools I use are universal, so they work with whatever game system you decide to play. Because they're all open source, they can be used online by all your players regardless of what OS they use, and they can all be self-hosted.

If you're a programmer as well as a gamer, visit their Git repositories and see if there's anything you can contribute. If you're a gamer or a gamemaster, try the tools out the next time you sit down at a digital game table. You might be surprised at just how few online accounts you actually need to have to use some of the best applications available for gaming.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/open-source-rpgs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/header_dice.png?itok=dOMrHopO (Dice as a random number generator)
[2]: https://www.freerpgday.com/
[3]: https://goodman-games.com/blog/2021/10/06/pdf-previews-of-our-free-rpg-day-releases/
[4]: https://paizo.com/community/blog/v5748dyo6shte
[5]: https://opensource.com/article/21/10/rpg-tabletop-games
[6]: http://mumble.info/
[7]: https://opensource.com/sites/default/files/mumble-client.png (Mumble client)
[8]: https://jitsi.org/
[9]: https://opensource.com/sites/default/files/jitsi-client.jpg (Jitsi)
[10]: https://opensource.com/article/21/10/3-ways-manage-your-character-sheets-open-source
[11]: http://ethercalc.net/
[12]: https://opensource.com/sites/default/files/uploads/ethercalc.jpeg (Ethercalc)
[13]: https://opensource.com/article/20/11/open-source-battle-maps
[14]: https://opensource.com/sites/default/files/uploads/mythic.jpeg (Mythic Table)
[15]: http://mythictable.com/
[16]: https://gitlab.com/mythicteam/mythictable
