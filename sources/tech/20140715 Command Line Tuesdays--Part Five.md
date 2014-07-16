Command Line Tuesdays – Part Five
================================================================================
Yes, you’ve guessed what time it is! It’s time to rrrrrrrrummmbleeeee! And this time, we’ll learn how to work with commands. So without further ado, let’s get to business.

Mr Shotts states that until now, we worked with a few mysterious commands, arguments and options, and today is the day we shed a little light upon that mystery. We’ll learn the following commands and what they do: type, which, help and man. But first, let’s learn…

### …what are commands? ###

All great things come in fours, and it’s the same with commands. We can split them up into four categories:

**1) An executable program:** a command can be an executable program. If you’ve ‘traveled’ across your file system in the previous lessons like you were supposed to, you probably visited the /usr/bin folder. You’ve seen quite a number of familiar names like transmission-gtk, deluge-gtk etc. What’s less important for us novices currently is that programs there can be compiled binaries or programs written in scripting languages. Point is, since they are executable programs, you can run them. Try it. Navigate to it, list the files inside, pick one and run it simply by typing its name.

**2) A command built into the shell:** bash provides a number of commands internally called shell builtins. The cd command, for example, is a shell builtin, mr Shotts says.

**3) A shell function:** miniature shell script, built into the environment. For the time being, we’ll just mention it, as it will be covered in the following weeks.

**4) An alias:** commands you can define yourself, using other commands. Also coming in the following lessons.

Now, it’s useful to know what type of command we’re dealing with. And we can find out using…

### …type ###

You can use **type + command** to inspect what kind of command is the command you’d like to use. You do it by simply typing: type command and you’ll get an output. For example:

![type mkdir](https://news.opensuse.org/wp-content/uploads/2014/07/Zaslonska-slika-2014-07-15-091448.png)

or

![type ls](https://news.opensuse.org/wp-content/uploads/2014/07/Zaslonska-slika-2014-07-15-091640.png)

…where we can see that the ‘ls’ command is actually an alias of ‘_ls’!

### which ###

Sometimes (but rarely on a desktop system, though) there are more versions of one executable installed on a machine. To find out the exact location of a given executable, we can use command which. Additionally, it only works with executable programs.

![which transmission-gtk](https://news.opensuse.org/wp-content/uploads/2014/07/Zaslonska-slika-2014-07-15-092052.png)

Now, mostly every command has documentation that comes with it. So you’re somewhere doing your CLI thing, no access to the internet so you can’t bug geekos on the forums or IRC, and you need to find out how to exactly use a command.  You can do it two ways. First being…

### …help ###

help command works with shell builtins (the second category we have mentioned above). So you can pick a shell builtin, like cd, for example, and simply type help cd. You’ll get a helpful page printed out in your terminal, so go ahead and read what cd has to offer. It shows in what ways you can use the command, what options you can use (it’s in square brackets, which means they are optional! Also, if there’s a vertical separator inside the square brackets, it means the options mentioned are mutually exclusive. Don’t use them together!)

### –help ###

help works only for the shell builtins. But most executables work with –help. As far as usage goes, it’s similar to help, but you have to type –help after the command you want to inspect. For example, transmission-gtk –help. Try it out, and see what options you can use with that executable etc.

### man ###

Most executables come with a formal documentation page. You can inspect it using the man command. You just enter man program, and see what it prints out. Pick any program on your computer, and try it out. For example, let’s try man transmission-gtk. You get a file opened, split into categories. It gives you information what the program is, what it does, how you can use it etc., but it doesn’t offer examples, as it’s not a tutorial.

And we’re stoping to a halt there.

I’d like to take a minute and thank everyone commenting and contributing to this section. You make this series vastly better, and I hope that with your help, us noobs will be able to use the CLI basics by the end of summer (just in time for 13.2 :) ). You guys are the best. Newbie users like me, who are feeling lost, stick with it. It will pay off in the end!

And I’d also like to add a formal heads up: part six will not come next Tuesday, as I’ll sadly be away, so we’ll see/hear each other in 14 days, on July 29th. And until then…

### …have a lot of fun! ###

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/07/15/command-line-tuesdays-part-five/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]: