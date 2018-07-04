      翻译中 by ZenMoore
World Cup football on the command line
======

![](https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc2018.jpg?resize=700%2C450&ssl=1)

Football is around us constantly. Even when domestic leagues have finished, there’s always a football score I want to know. Currently, it’s the biggest football tournament in the world, the Fifa World Cup 2018, hosted in Russia. Every World Cup there are some great football nations that don’t manage to qualify for the tournament. This time around the Italians and the Dutch missed out. But even in non-participating countries, it’s a rite of passage to keep track of the latest scores. I also like to keep abreast of the latest scores from the major leagues around the world without having to search different websites.

![Command-Line Interface][2]If you’re a big fan of the command-line, what better way to keep track of the latest World Cup scores and standings with a small command-line utility. Let’s take a look at one of the hottest trending football utilities available. It’s goes by the name football-cli.

If you’re a big fan of the command-line, what better way to keep track of the latest World Cup scores and standings with a small command-line utility. Let’s take a look at one of the hottest trending football utilities available. It’s goes by the name football-cli.

football-cli is not a groundbreaking app. Over the years, there’s been a raft of command line tools that let you keep you up-to-date with the latest football scores and league standings. For example, I am a heavy user of soccer-cli, a Python based tool, and App-Football, written in Perl. But I’m always looking on the look out for trending apps. And football-cli stands out from the crowd in a few ways.

football-cli is developed in JavaScript and written by Manraj Singh. It’s open source software, published under the MIT license. Installation is trivial with npm (the package manager for JavaScript), so let’s get straight into the action.

The utility offers commands that give scores of past and live fixtures, see upcoming and past fixtures of a league and team. It also displays standings of a particular league. There’s a command that lists the various supported competitions. Let’s start with the last command.

At a shell prompt.

`luke@ganges:~$ football lists`

![football-lists][3]

The World Cup is listed at the bottom. I missed yesterday’s games, so to catch up on the scores, I type at a shell prompt:

`luke@ganges:~$ football scores`

![football-wc-22][4]

Now I want to see the current World Cup group standings. That’s easy.

`luke@ganges:~$ football standings -l WC`

Here’s an excerpt of the output:

![football-wc-table][5]

The eagle-eyed among you may notice a bug here. Belgium is showing as the leader of Group G. But this is not correct. Belgium and England are (at the time of writing) both tied on points, goal difference, and goals scored. In this situation, the team with the better disciplinary record is ranked higher. England and Belgium have received 2 and 3 yellow cards respectively, so England top the group.

Suppose I want to find out Liverpool’s results in the Premiership going back 90 days from today.

`luke@ganges:~$ football fixtures -l PL -d 90 -t "Liverpool"`

![football-Liverpool][6]

I’m finding the utility really handy, displaying the scores and standings in a clear, uncluttered, and attractive way. When the European domestic games start up again, it’ll get heavy usage. (Actually, the 2018-19 Champions League is already underway)!

These few examples give a taster of the functionality available with football-cli. Read more about the utility from the developer’s **[GitHub page][7].** Football + command-line = football-cli

Like similar tools, the software retrieves its football data from football-data.org. This service provide football data for all major European leagues in a machine-readable way. This includes fixtures, teams, players, results and more. All this information is provided via an easy-to-use RESTful API in JSON representation.


--------------------------------------------------------------------------------

via: https://www.linuxlinks.com/football-cli-world-cup-football-on-the-command-line/

作者：[Luke Baker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxlinks.com/author/luke-baker/
[1]:https://www.linuxlinks.com/wp-content/plugins/jetpack/modules/lazy-images/images/1x1.trans.gif
[2]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2017/12/CLI.png?resize=195%2C171&ssl=1
[3]:https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-lists.png?resize=595%2C696&ssl=1
[4]:https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc-22.png?resize=634%2C75&ssl=1
[5]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc-table.png?resize=750%2C581&ssl=1
[6]:https://i1.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-Liverpool.png?resize=749%2C131&ssl=1
[7]:https://github.com/ManrajGrover/football-cli
[8]:https://www.linuxlinks.com/links/Software/
[9]:https://discord.gg/uN8Rqex
