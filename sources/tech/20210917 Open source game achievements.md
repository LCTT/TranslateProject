[#]: subject: "Open source game achievements"
[#]: via: "https://fedoramagazine.org/open-source-game-achievements/"
[#]: author: "Dennis Payne https://fedoramagazine.org/author/dulsi/"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source game achievements
======

![][1]

Photo by [Michał Parzuchowski][2] on [Unsplash][3]

Learn how Gamerzilla brings an achievement system to open source games and enables all developers to implement achievements separate from the game platform.

Some open source games rival the quality of commercial games. While it is hard to match the quality of triple-a games, open source games compete effectively against the indie games. But, gamer expectations change over time. Early games included a high score. Achievements expanded over time to promote replay. For example, you may have completed a level but you didn’t find all the secrets or collect all the coins. The Xbox 360 introduced the first multi-game online achievement system. Since that introduction, many game platforms added an achievement system.

Open source games are largely left out of the achievement systems. You can publish an open source game on Steam, but it costs money and they focus on working with companies not the free software community. Additionally, this locks players into a non-free platform.

Commercial game developers are not well served either, since some players enjoy achievements and refuse to purchase from other stores due to the inability to share their accomplishments. This lock-in gives the power to the platform holder. Each platform has a different system forcing the developer to implement support and testing multiple times. Smaller platform are likely to be skipped entirely. Furthermore, the platform holder has access to the achievement data on all companies using their system which could be used for competitive advantage.

### Architecture of Gamerzilla

[Gamerzilla][4] is an open source game achievement system which attempts to correct this situation. The design considered both open source and commercial games. You can run your own Gamerzilla server, use one provided by a game store, or even distributions, or other groups could run them. Where you buy the game doesn’t matter. The achievement data uploads to your Gamerzilla server.

Game achievements require two things, a game, and a Gamerzilla server. As game collections grow, however, that setup has a disadvantage. Each game needs to have credentials to upload to the Gamerzilla server. Many gamers turn to game launchers due to their large number of games and ability to synchronize with one or more stores. By adding Gamerzilla support to the launcher, the individual games no longer need to know your credentials. Session results will relay from the game launcher to the Gamerzilla server.

At one time, freegamedev.net provided the Hubzilla social networking system. We created an addon allowing us to jump start Gamerzilla development. Unfortunately server upgrades broke the service so freegamedev.net stopped offering it.

For Gamerzilla servers, two implementations exist. Maintaining Hubzilla is a complex task, so we developed a standalone Gamerzilla service using *.*Net and React. The API used by games remains the same so it doesn’t matter which implementation you connect to.

Game launchers development and support often lags. To facilitate adding support, we created libgamerzilla. The library handles all the interaction between the game launcher, games, and the Gamerzilla server. Right now only _GameHub_ has an implementation with Gamerzilla support and merging into the project is pending. On Fedora Linux, libgamerzilla-server package serves as a temporary solution. It does not launch games but listens for achievements and relays them to your server.

Game support continues growing. As with game launchers, developers use libgamerzilla to handle the Gamerzilla integration. The library, written in C, is in use in a variety of languages like Python and nim. Games which already have an achievement system typically take only a few days to add support. For other games ,collecting all the information to award the achievements occupies the bulk of the implementation time.

### Setting up a server

The easiest server to setup is the Hubzilla addon. That, however, requires a working Hubzilla site which is not the simplest thing to setup. The new .Net and React server can be setup relatively easily on Fedora Linux, although there are a lot of steps. The [readme][5] details all the steps. The long set of steps is, in part, due to the lack of a built release. This means you need to build the .Net and the React code. Once built, React code serves up directly in Apache. A new service runs the .Net piece. Apache proxies all requests to the Gamerzilla API for the new service.

With the setup steps done, Gamerzilla runs but there are no users. There needs to be an easy way to create an administrator and register new users. Unfortunately this piece does not exist yet. At this time, users must be entered directly using the sqlite3 command line tool. The instructions are in the [readme][5]. Users can be publicly visible or not. The approval flag allows new users to not use the system immediately but web registration still needs to be implemented The user piece is designed with replacement in mind. It would not be hard to replace backend/Service/UserService.cs to integrate with an existing site. Gaming web sites could use this to offer Gamerzilla achievements to their users.

Currently the backend uses a sqlite database. No performance testing has been done. We expect that larger installations may need to modify the system to use a more robust database system.

### Testing the system

There is no game launcher easily available at the moment. If you install libgamerzilla-server, you will have the command _gamerzillaserver_ available from the command line. The first time you run it, you enter your url and login information. Subsequent executions will simply read the information from the configuration file. There is currently no way to correct a mistake except deleting the file at _.local/share/ga_merzillaserver/server.cfg and running _gamerzillaserver_ again.

Most games have no built releases with Gamerzilla support. [Pinball Disc Room on itch.io][6] does have support built in the Linux version. The web version has no achievements There are only two achievements in the game, one for surviving for ten seconds and the other for unlocking and using the tunnel. With a little practice you can get an achievement. You need to check your Gamerzila server as the game provides no visual notification of the achievement.

Currently no game packaged in Fedora Linux supports Gamerzilla. SuperTuxKart merged support but is still awaiting a new release. Seahorse adventures and Shippy 1984 added achievements but new releases are not packaged yet. Some games with support, we maintain independently as the developers ignore pull requests or other attempt to contact them.

### Future work

Gamerzilla needs more games. A variety of games currently support the system. An addition occurs nearly every month. If you have a game you like, ask the developer to support Gamerzilla. If you are making a game and need help adding support, please let us now.

Server development proceeds at a slow pace and we hope to have a functional registration system soon. After that we may setup a permanent hosting site. Right now you can see our [test server][7]. Some people expressed concern with the .Net backend. The API is not very complex and could be rewritten in Python fairly easily.

The largest unknown remains game launchers. GameHub wants a generic achievement interface. We could try to work with them to get that implemented. Adding support to the itch.io app could increase interest in the system. Another possibility is to do away with the game launcher entirely. Perhaps adding something like the gamerzillaserver to Gnome might be possible. You would then configure your url and login information on a settings page. Any game launched could then record achievements.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/open-source-game-achievements/

作者：[Dennis Payne][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dulsi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/game_acheivements-816x345.jpg
[2]: https://unsplash.com/@mparzuchowski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/jenga?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://identicalsoftware.com/gamerzilla/
[5]: https://github.com/dulsi/gamerzilla.net#readme
[6]: https://dulsi.itch.io/pinball-disc-room
[7]: http://108.49.106.217/
