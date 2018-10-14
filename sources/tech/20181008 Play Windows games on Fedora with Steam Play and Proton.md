translated by hopefully2333

Play Windows games on Fedora with Steam Play and Proton
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/steam-proton-816x345.jpg)

Some weeks ago, Steam [announced][1] a new addition to Steam Play with Linux support for Windows games using Proton, a fork from WINE. This capability is still in beta, and not all games work. Here are some more details about Steam and Proton.

According to the Steam website, there are new features in the beta release:

  * Windows games with no Linux version currently available can now be installed and run directly from the Linux Steam client, complete with native Steamworks and OpenVR support.
  * DirectX 11 and 12 implementations are now based on Vulkan, which improves game compatibility and reduces performance impact.
  * Fullscreen support has been improved. Fullscreen games seamlessly stretch to the desired display without interfering with the native monitor resolution or requiring the use of a virtual desktop.
  * Improved game controller support. Games automatically recognize all controllers supported by Steam. Expect more out-of-the-box controller compatibility than even the original version of the game.
  * Performance for multi-threaded games has been greatly improved compared to vanilla WINE.



### Installation

If you’re interested in trying Steam with Proton out, just follow these easy steps. (Note that you can ignore the first steps to enable the Steam Beta if you have the [latest updated version of Steam installed][2]. In that case you no longer need Steam Beta to use Proton.)

Open up Steam and log in to your account. This example screenshot shows support for only 22 games before enabling Proton.

![][3]

Now click on Steam option on top of the client. This displays a drop down menu. Then select Settings.

![][4]

Now the settings window pops up. Select the Account option and next to Beta participation, click on change.

![][5]

Now change None to Steam Beta Update.

![][6]

Click on OK and a prompt asks you to restart.

![][7]

Let Steam download the update. This can take a while depending on your internet speed and computer resources.

![][8]

After restarting, go back to the Settings window. This time you’ll see a new option. Make sure the check boxes for Enable Steam Play for supported titles, Enable Steam Play for all titles and Use this tool instead of game-specific selections from Steam are enabled. The compatibility tool should be Proton.

![][9]

The Steam client asks you to restart. Do so, and once you log back into your Steam account, your game library for Linux should be extended.

![][10]

### Installing a Windows game using Steam Play

Now that you have Proton enabled, install a game. Select the title you want and you’ll find the process is similar to installing a normal game on Steam, as shown in these screenshots.

![][11]

![][12]

![][13]

![][14]

After the game is done downloading and installing, you can play it.

![][15]

![][16]

Some games may be affected by the beta nature of Proton. The game in this example, Chantelise, had no audio and a low frame rate. Keep in mind this capability is still in beta and Fedora is not responsible for results. If you’d like to read further, the community has created a [Google doc][17] with a list of games that have been tested.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/play-windows-games-steam-play-proton/

作者：[Francisco J. Vergara Torres][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/patxi/
[1]: https://steamcommunity.com/games/221410/announcements/detail/1696055855739350561
[2]: https://fedoramagazine.org/third-party-repositories-fedora/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/09/listOfGamesLinux-300x197.png
[4]: https://fedoramagazine.org/wp-content/uploads/2018/09/1-300x169.png
[5]: https://fedoramagazine.org/wp-content/uploads/2018/09/2-300x196.png
[6]: https://fedoramagazine.org/wp-content/uploads/2018/09/4-300x272.png
[7]: https://fedoramagazine.org/wp-content/uploads/2018/09/6-300x237.png
[8]: https://fedoramagazine.org/wp-content/uploads/2018/09/7-300x126.png
[9]: https://fedoramagazine.org/wp-content/uploads/2018/09/10-300x237.png
[10]: https://fedoramagazine.org/wp-content/uploads/2018/09/12-300x196.png
[11]: https://fedoramagazine.org/wp-content/uploads/2018/09/13-300x196.png
[12]: https://fedoramagazine.org/wp-content/uploads/2018/09/14-300x195.png
[13]: https://fedoramagazine.org/wp-content/uploads/2018/09/15-300x196.png
[14]: https://fedoramagazine.org/wp-content/uploads/2018/09/16-300x195.png
[15]: https://fedoramagazine.org/wp-content/uploads/2018/09/Screenshot-from-2018-08-30-15-14-59-300x169.png
[16]: https://fedoramagazine.org/wp-content/uploads/2018/09/Screenshot-from-2018-08-30-15-19-34-300x169.png
[17]: https://docs.google.com/spreadsheets/d/1DcZZQ4HL_Ol969UbXJmFG8TzOHNnHoj8Q1f8DIFe8-8/edit#gid=1003113831
