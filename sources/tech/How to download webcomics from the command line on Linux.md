disylee来占坑2014-5-20
How to download webcomics from the command line on Linux
================================================================================
Do you never miss a new strip from xkcd? Read webcomics regularly? Or would you like to back up all the strips of your favorite website? Hopefully, the open source community has the solution: a command line program to download all your favorite webcomics from your terminal.

Before we begin, remember that you should keep these downloaded strips for your personal use, and not broadcast them without permission. If you really like an author's work, support the comic by donating or buying some of the merchandise.

### Install Dosage on Linux ###

The open source program to download webcomics is called [dosage][1]. There are a couple of ways to install this webcomic downloader on your machine since it is written in Python. Today we will go with an easy way.

First, you will need to [install pip][2]. Also, make sure that you have at least Python 2.7.0 or Python 3.3 installed. Then use pip to install dosage as follows.

    $ sudo pip install dosage

If pip cannot somehow find the package (like on Ubuntu 14.04), use the following command instead.

    $ sudo pip install http://wummel.github.io/dosage/dist/dosage-2.13.tar.gz

dosage will automatically create a new folder called "Comics" in your home directory.

### Basic Usage of Dosage ###

dosage's basic usage can be described as follows. Using dosage, you can find webcomics in the database that you are interested in reading, download the strips, and easily fetch the latest strips as they come out. In a sense, you more or less subscribe to a webcomic, and dosage will take care of making sure that you never miss any unread strips.

To start downloading and reading offline your webcomics, begin by listing them with the command:

    $ dosage -l

Right now, dosage has over 2000 comics in its database. My personal tip is if you are looking for a particular webcomic, use the syntax:

    $ dosage -l | grep [keyword]

It will then return all the comics with title containing [keyword].

Once you decided which comic you wanted to subscribe to from the list, use this command to subsribe to the comic:

    $ dosage [name of the webcomic] 

![](https://farm3.staticflickr.com/2940/13943751585_978ef260de_z.jpg)

Subscribing to a comic will automatically create a folder in the "Comics" directory, and download the latest strip of that webcomic.

If instead of downloading just the latest strip, you are interested in all the issues, use this command:

    $ dosage -a [name of the comic] 

Finally, once you subscribed to a couple of webcomics, you can easily download the latest strip of all of them in one shot with the simple command below:

    $ dosage @ 

If you never want to miss your daily comics for example, you should run this command every day.

### Advanced Usage of Dosage ###

Past the first day playing around with dosage, you might want to get the most out of it. It entails knowing a bit more about the command's syntax and shortcuts.

If you tried to download some xkcd strips, you might have noticed that dosage refuses with the message:

    use the --adult option to confirm your age

![](https://farm3.staticflickr.com/2929/13920634111_9d63589f74_z.jpg)

Because by default dosage will ignore any webcomic flagged for people over 18 (and for some reason xkcd is one of them). To bypass that, just do as it says:

    $ dosage --adult xkcd

From a previous example, you may have noticed that the argument '@' is used to refer to all downloaded comics. A continuation is '@@' for all comics in dosage database.

    $ dosage @@

The above command will download the latest strip of every comic that dosage knows about.

If you want to fetch the strips from the beginning of the series up to a particular day, you can do:

    $ dosage -a [name of the comic]:[year-month-day]

For example, to see all of Calvin and Hobbes' strips from 2014 until its creation, run:

    $ dosage -a calvinandhobbes:2014-01-01

Finally for all the developers out there who would like to do something of these strips for your personal use, dosage integrates the possibility of generating rss, json, and html log files while downloading strips:

    $ dosage -o [type] [name of the comic]

In the above command, [type] is either rss, json, or html, and [name of the comic] can also be just '@'. For example, the "html" argument will create a nice HTML code to see all the strips downloaded:

The command below will download all the strips for Calvin and Hobbes, and then spit out an HTML code to view in your web browser all the strips in a nice webpage format.

    $ dosage -o html -a calvinandhobbes 

![](https://farm4.staticflickr.com/3693/13920644962_1b041dc2f2_z.jpg)

To conclude, I invite you to read the [manual page][3] for more information. dosage is a really neat tool, and I know that it will be of great use to any fans of webcomics out there. I'm very curious to know what can come out of the fancier options like creating a json file out of downloaded strips.

Do you have an alternative to dosage? Or are you actually a fan of the latter and use it regularly? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/download-webcomics-command-line-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wummel.github.io/dosage/
[2]:http://ask.xmodulo.com/install-pip-linux.html
[3]:http://wummel.github.io/dosage/dosage.1.html
