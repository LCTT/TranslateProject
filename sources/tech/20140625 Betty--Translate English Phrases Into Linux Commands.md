Betty: Translate English Phrases Into Linux Commands
================================================================================
**Betty** is an open source tool that translates English-like phrases into Linux commands. The main goal of this project is to use the Linux powered systems through natural language input. Let us see some examples how it works.

### Installation ###

Betty installation is very simple and straight forward. Make sure you’ve installed the following prerequisites packages.

#### On Debian based systems: ####

    sudo apt-get install git curl ruby

On RPM based systems:

    yum install git curl ruby

Now, git clone the Betty repository to any preferred location. I am going to clone the betty repo in my home directory **i.e /home/sk/**.

    git clone https://github.com/pickhardt/betty

Add the betty alias in your bashrc file.

    sudo nano ~/.bashrc

Add the following line at the end:

    alias betty="/home/sk/betty/main.rb"

Make sure you’ve replaced the correct path of the betty directory.

It’s done. Now, it’s time to play with betty.

### Usage ###

You should include the word “betty” in-front of every English phrases. As you may know already, if we want to know the user name of our system, we run the following command:

    whoami

Sample output:

  sk

As you see above, my current user name is **sk**. Well, now we can get the same result using betty as shown below.

    betty whats my username

Sample output:

    Betty: Running whoami
    sk

Cool, isn’t it? Yes. Betty understands the normal English phrase “whats my username” that I entered, and ran the command “whoami” automatically, and finally displayed the correct output.

Let us see some other commands too.

Betty will respond in multiple ways if you didn’t enter exactly what you’re looking for. For example, we run the following command:

    betty whats my name

Betty isn’t sure whether she should find the system username or full name. In this case, she will ask you multiple questions to find the exact result. As you see below, Betty asks me which command(whoami or  finger $(whoami) | sed ‘s/.*: *//;q’) should I want to execute. I just want it to display my username, so i chose number **1**.

    Betty: Okay, I have multiple ways to respond.
    Betty: Enter the number of the command you want me to run, or N (no) if you don't want me to run any.
    [1] whoami
    Gets your system username.
    [2] finger $(whoami) | sed 's/.*: *//;q'
    Gets your full name.
    1
    Betty: Running whoami
    sk

### Compress And Uncompress Folders ###

If you want to compress a file or a folder, use the following command. For example, I want to compress a folder called “test” folder in my home directory.

    betty compress test/ test.tar.gz

Sample output:

    Betty: Running tar -czvf test.tar.gz test/
    test/
    test/home/
    test/home/sk/
    test/home/sk/test/
    test/home/sk/test/sample

Similarly, we can use the following command to uncompress an archive file.

    betty uncompress test.tar.gz

Sample output:

    Betty: Running mkdir test &&  tar -zxvf test.tar.gz -C test
    test/
    test/home/
    test/home/sk/
    test/home/sk/test/
    test/home/sk/test/sample

### Complete list of Betty commands ###

Betty tool has some command formats. It doesn’t understand if you put the command “what is my user name” instead of “whats my username”. So, you have to enter the correct English phrase that supported by Betty.

The complete list of supported commands are given below.

    Count:
    betty how many words are in this directory
    betty how many characters are in myfile.py
    betty count lines in this folder
    (Note that there's many ways to say more or less the same thing.)
    
    Config:
    betty change your name to Joe
    betty speak to me
    betty stop speaking to me
    
    Datetime:
    betty what time is it
    betty what is todays date
    betty what month is it
    betty whats today
    
    Find:
    betty find me all files that contain california
    
    Internet:
    betty download http://www.mysite.com/something.tar.gz to something.tar.gz
    betty uncompress something.tar.gz
    betty unarchive something.tar.gz to somedir
    (You can use unzip, unarchive, untar, uncompress, and expand interchangeably.)
    betty compress /path/to/dir
    
    iTunes:
    betty mute itunes
    betty unmute itunes
    betty pause the music
    betty resume itunes
    betty stop my music
    betty next song
    betty prev track
    betty what song is playing
    (Note that the words song, track, music, etc. are interchangeable)
    
    Fun:
    betty go crazy
    betty whats the meaning of life
    ...and more that are left for you to discover!
    
    Map:
    betty show me a map of mountain view
    
    Meta:
    betty what version are you (or just betty version)
    betty whats your github again
    
    Permissions:
    betty give me permission to this directory
    betty give anotheruser ownership of myfile.txt
    
    Process:
    betty show me all processes by root containing grep
    betty show me all my processes containing netbio
    
    Sizes:
    betty show size for myfile.txt
    
    Spotify:
    betty play spotify
    betty pause spotify
    betty next spotify
    betty previous spotify
    
    User:
    betty whats my username
    betty whats my real name
    betty whats my ip address
    betty who else is logged in
    betty whats my version of ruby
    
    Web queries:
    betty turn web on
    betty please tell me what is the weather like in London

Betty seems very nice tool to Linux novice users. Hope this tool will useful for you too.

Cheers!

Source:

- [Betty Homepage][1]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/betty-translate-english-phrases-linux-commands/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/pickhardt/betty