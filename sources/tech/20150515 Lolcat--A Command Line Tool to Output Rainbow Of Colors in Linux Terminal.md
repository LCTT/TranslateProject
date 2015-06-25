Lolcat – A Command Line Tool to Output Rainbow Of Colors in Linux Terminal
================================================================================
For those who believe that Linux Command Line is boring and there isn’t any fun, then you’re wrong here are the articles on Linux, that shows how funny and naughty is Linux..

- [20 Funny Commands of Linux or Linux is Fun in Terminal][1]
- [6 Interesting Funny Commands of Linux (Fun in Terminal)][2]
- [Fun in Linux Terminal – Play with Word and Character Counts][3]

Here in this article, I will be discussing about a small utility called “lolcat” – Which produce rainbow of colors in terminal.

![Lolcat Command to Output Rainbow of Colors for Terminal](http://www.tecmint.com/wp-content/uploads/2015/06/Linux-Lolcat.png)

Lolcat Command to Output Rainbow of Colors for Terminal

#### What is lolcat? ####

Lolcat is an utility for Linux, BSD and OSX which concatenates like similar to [cat command][4] and adds rainbow coloring to it. Lolcat is primarily used for rainbow coloring of text in Linux Terminal.

### Installation of Lolcat in Linux ###

**1. Lolcat utility is available in the repository of lots of Linux distributions, but the available version bit older. Alternatively you can download and install latest version of lolcat from git repository.**

Lolcat is a ruby gem hence it is essential to have latest version of RUBY installed on your system.

    # apt-get install ruby		[On APT based Systems]
    # yum install ruby		[On Yum based Systems]
    # dnf install ruby		[On DNF based Systems]

Once ruby package has been installed, make sure to verify the version of ruby installed.

    # ruby --version
    
    ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]

**2. Next download and install the most recent version of lolcat from the git repository using following commands.**

    # wget https://github.com/busyloop/lolcat/archive/master.zip
    # unzip master.zip
    # cd lolcat-master/bin
    # gem install lolcat

Once lolcat is installed, you can check the version.

    # lolcat --version
    
    lolcat 42.0.99 (c)2011 moe@busyloop.net

### Usage of Lolcat ###

**3. Before starting usage of lolcat, make sure to know the available options and help using following command.**

    # lolcat -h

![Lolcat Help](http://www.tecmint.com/wp-content/uploads/2015/06/Lolcat-Help1.png)

Lolcat Help

**4. Next, pipeline lolcat with commads say ps, date and cal as:**

    # ps | lolcat
    # date | lolcat
    # cal | lolcat

![ps Command Output](http://www.tecmint.com/wp-content/uploads/2015/06/ps-command-output.png)

ps Command Output

![Date Output](http://www.tecmint.com/wp-content/uploads/2015/06/Date.png)

Date Output

![Calendar Output](http://www.tecmint.com/wp-content/uploads/2015/06/Cal.png)

Calendar Output

**5. 3. Use lolcat to display codes of a script file as:**

    # lolcat test.sh

![Display Codes with Lolcat](http://www.tecmint.com/wp-content/uploads/2015/06/Script-Output.png)

Display Codes with Lolcat

**6. Pipeline lolcat with figlet command. Figlet is a utility which displays large characters made up of ordinary screen characters. We can pipeline the output of figlet with lolcat to make the output colorful as:**

    # echo I ❤ Tecmint | lolcat
    # figlet I Love Tecmint | lolcat

![Colorful Texts](http://www.tecmint.com/wp-content/uploads/2015/06/Colorful-Text.png)

Colorful Texts

**Note**: Not to mention that ❤ is an unicode character and to install figlet you have to yum and apt to get the required packages as:

    # apt-get figlet 
    # yum install figlet 
    # dnf install figlet

**7. Animate a text in rainbow of colours, as:**

    $ echo I ❤ Tecmit | lolcat -a -d 500

![Animated Text](http://www.tecmint.com/wp-content/uploads/2015/06/Animated-Text.gif)

Animated Text

Here the option -a is for Animation and -d is for duration. In the above example duration count is 500.

**8. Read a man page (say man ls) in rainbow of colors as:**

    # man ls | lolcat

![List Files Colorfully](http://www.tecmint.com/wp-content/uploads/2015/06/List-Files-Colorfully.png)

List Files Colorfully

**9. Pipeline lolcat with cowsay. cowsay is a configurable thinking and/or speaking cow, which supports a lot of other animals as well.**

Install cowsay as:

    # apt-get cowsay
    # yum install cowsay
    # dnf install cowsay

After install, print the list of all the animals in cowsay as:

    # cowsay -l

**Sample Output**

    Cow files in /usr/share/cowsay/cows:
    apt beavis.zen bong bud-frogs bunny calvin cheese cock cower daemon default
    dragon dragon-and-cow duck elephant elephant-in-snake eyes flaming-sheep
    ghostbusters gnu head-in hellokitty kiss kitty koala kosh luke-koala
    mech-and-cow meow milk moofasa moose mutilated pony pony-smaller ren sheep
    skeleton snowman sodomized-sheep stegosaurus stimpy suse three-eyes turkey
    turtle tux unipony unipony-smaller vader vader-koala www

Output of cowsay pipelined with lolcat and ‘gnu‘ cowfile is used.

    # cowsay -f gnu ☛ Tecmint ☚ is the best Linux Resource Available online | lolcat

![Cowsay with Lolcat](http://www.tecmint.com/wp-content/uploads/2015/06/Cowsay-with-Lolcat.png)

Cowsay with Lolcat

**Note**: You can use lolcat with any other command in pipeline and get colored output in terminal.

**10. You may create alias for the most frequently used commands to get command output in rainbow of colors. You can alias ‘ls -l‘ command which is used for long list the contents of directory as below.**

    # alias lolls="ls -l | lolcat"
    # lolls

![Alias Commands with Colorful](http://www.tecmint.com/wp-content/uploads/2015/06/Alias-Commands-with-Colorful.png)

Alias Commands with Colorful

You may create alias for any command as suggested above. To create permanent alias, you have to add the relevant code (above code for ls -l alias) to ~/.bashrc file and also make sure to logout and login back for the changes to be taken into effect.

That’s all for now. I would like to know if you were aware of lolcat previously? Did you like the post? And suggestion and feedback is welcome in the comment section below. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
[2]:http://www.tecmint.com/linux-funny-commands/
[3]:http://www.tecmint.com/play-with-word-and-character-counts-in-linux/
[4]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/