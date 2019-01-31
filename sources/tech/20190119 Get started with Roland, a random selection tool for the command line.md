[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Roland, a random selection tool for the command line)
[#]: via: (https://opensource.com/article/19/1/productivity-tools-roland)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with Roland, a random selection tool for the command line
======

Get help making hard choices with Roland, the seventh in our series on open source tools that will make you more productive in 2019.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the seventh of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### Roland

By the time the workday has ended, often the only thing I want to think about is hitting the couch and playing the video game of the week. But even though my professional obligations stop at the end of the workday, I still have to manage my household. Laundry, pet care, making sure my teenager has what he needs, and most important: deciding what to make for dinner.

Like many people, I often suffer from [decision fatigue][1], and I make less-than-healthy choices for dinner based on speed, ease of preparation, and (quite frankly) whatever causes me the least stress.

![](https://opensource.com/sites/default/files/uploads/roland-1.png)

[Roland][2] makes planning my meals much easier. Roland is a Perl application designed for tabletop role-playing games. It picks randomly from a list of items, such as monsters and hirelings. In essence, Roland does the same thing at the command line that a game master does when rolling physical dice to look up things in a table from the Game Master's Big Book of Bad Things to Do to Players.

With minor modifications, Roland can do so much more. For example, just by adding a table, I can enable Roland to help me choose what to cook for dinner.

The first step is installing Roland and all its dependencies.

```
git clone git@github.com:rjbs/Roland.git
cpan install Getopt::Long::Descriptive Moose \
   namespace::autoclean List:AllUtils Games::Dice \
   Sort::ByExample Data::Bucketeer Text::Autoformat \
   YAML::XS
cd oland
```

Next, I create a YAML document named **dinner** and enter all our meal options.

```
type: list
pick: 1
items:
 - "frozen pizza"
 - "chipotle black beans"
 - "huevos rancheros"
 - "nachos"
 - "pork roast"
 - "15 bean soup"
 - "roast chicken"
 - "pot roast"
 - "grilled cheese sandwiches"
```

Running the command **bin/roland dinner** will read the file and pick one of the options.

![](https://opensource.com/sites/default/files/uploads/roland-2.png)

I like to plan for the week ahead so I can shop for all my ingredients in advance. The **pick** command determines how many items from the list to chose, and right now, the **pick** option is set to 1. If I want to plan a full week's dinner menu, I can just change **pick: 1** to **pick: 7** and it will give me a week's worth of dinners. You can also use the **-m** command line option to manually enter the choices.

![](https://opensource.com/sites/default/files/uploads/roland-3.png)

You can also do fun things with Roland, like adding a file named **8ball** with some classic phrases.

![](https://opensource.com/sites/default/files/uploads/roland-4.png)

You can create all kinds of files to help with common decisions that seem so stressful after a long day of work. And even if you don't use it for that, you can still use it to decide which devious trap to set up for tonight's game.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tools-roland

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Decision_fatigue
[2]: https://github.com/rjbs/Roland
