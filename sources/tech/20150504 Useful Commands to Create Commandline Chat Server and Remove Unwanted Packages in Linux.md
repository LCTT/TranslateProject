translating wi-cuckoo
Useful Commands to Create Commandline Chat Server and Remove Unwanted Packages in Linux
================================================================================
Here we are with the next part of Linux Command Line Tips and Tricks. If you missed our previous post on Linux Tricks you may find it here.

- [5 Linux Command Line Tricks][1]

In this post we will be introducing 6 command Line tips namely create Linux Command line chat using Netcat command, perform addition of a column on the fly from the output of a command, remove orphan packages from Debian and CentOS, get local and remote IP from command Line, get colored output in terminal and decode various color code and last but not the least hash tags implementation in Linux command Line. Lets check them one by one.

![Linux Commandline Chat Server](http://www.tecmint.com/wp-content/uploads/2015/04/linux-commandline-chat-server.jpg)
6 Useful Commandline Tricks and Tips

### 1. Create Linux Commandline Chat Server ###

We all have been using chat service since a long time. We are familiar with Google chat, Hangout, Facebook chat, Whatsapp, Hike and several other application and integrated chat services. Do you know Linux nc command can make your Linux box a chat server with just one line of command.
What is nc command in Linux and what it does?

nc is the depreciation of Linux netcat command. The nc utility is often referred as Swiss army knife based upon the number of its built-in capabilities. It is used as debugging tool, investigation tool, reading and writing to network connection using TCP/UDP, DNS forward/reverse checking.

It is prominently used for port scanning, file transferring, backdoor and port listening. nc has the ability to use any local unused port and any local network source address.

Use nc command (On Server with IP address: 192.168.0.7) to create a command line messaging server instantly.

    $ nc -l -vv -p 11119

Explanation of the above command switches.

- -v : means Verbose
- -vv : more verbose
- -p : The local port Number

You may replace 11119 with any other local port number.

Next on the client machine (IP address: 192.168.0.15) run the following command to initialize chat session to machine (where messaging server is running).

    $ nc 192.168.0.7 11119

![Linux Commandline Chat with nc Command](http://www.tecmint.com/wp-content/uploads/2015/04/Chat-on-Linux-Commandline.gif)

**Note**: You can terminate chat session by hitting ctrl+c key and also nc chat is one-to-one service.

### 2. How to Sum Values in a Column in Linux ###

How to sum the numerical values of a column, generated as an output of a command, on the fly in the terminal.

The output of the ‘ls -l‘ command.

    $ ls -l

![Sum Numerical Values](http://www.tecmint.com/wp-content/uploads/2015/04/Sum-Values.gif)

Notice that the second column is numerical which represents number of symbolic links and the 5th column is numerical which represents the size of he file. Say we need to sum the values of fifth column on the fly.

List the content of 5th column without printing anything else. We will be using ‘awk‘ command to do this. ‘$5‘ represents 5th column.

    $ ls -l | awk '{print $5}'

![List Content Column](http://www.tecmint.com/wp-content/uploads/2015/04/List-Content-Column.gif)

Now use awk to print the sum of the output of 5th column by pipelining it.

    $ ls -l | awk '{print $5}' | awk '{total = total + $1}END{print total}'

![Sum and Print Columns](http://www.tecmint.com/wp-content/uploads/2015/04/Sum-Columns.gif)

### How to Remove Orphan Packages in Linux? ###

Orphan packages are those packages that are installed as a dependency of another package and no longer required when the original package is removed.

Say we installed a package gtprogram which was dependent of gtdependency. We can’t install gtprogram unless gtdependency is installed.

When we remove gtprogram it won’t remove gtdependency by default. And if we don’t remove gtdependency, it will remain as Orpahn Package with no connection to any other package.

    # yum autoremove                [On RedHat Systems]

![Remove Orphan Packages in CentOS](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Orphan-Packages-in-CentOS1.gif)

    # apt-get autoremove                [On Debian Systems]

![Remove Orphan Packages in Debian](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Orphan-Packages-in-Debian.gif)

You should always remove Orphan Packages to keep the Linux box loaded with just necessary stuff and nothing else.

### 4. How to Get Local and Public IP Address of Linux Server ###

To get you local IP address run the below one liner script.

    $ ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

You must have installed ifconfig, if not, apt or yum the required packages. Here we will be pipelining the output of ifconfig with grep command to find the string “intel addr:”.

We know ifconfig command is sufficient to output local IP Address. But ifconfig generate lots of other outputs and our concern here is to generate only local IP address and nothing else.

    # ifconfig | grep "inet addr:"

![Check Local IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Local-IP-Address.gif)

Although the output is more custom now, but we need to filter our local IP address only and nothing else. For this we will use awk to print the second column only by pipelining it with the above script.

    # ifconfig | grep “inet addr:” | awk '{print $2}'

![Filter Only IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Filter-IP-Address.gif)

Clear from the above image that we have customised the output very much but still not what we want. The loopback address 127.0.0.1 is still there in the result.

We use use -v flag with grep that will print only those lines that don’t match the one provided in argument. Every machine have the same loopback address 127.0.0.1, so use grep -v to print those lines that don’t have this string, by pipelining it with above output.

    # ifconfig | grep "inet addr" | awk '{print $2}' | grep -v '127.0.0.1'

![Print IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Print-IP-Address.gif)

We have almost generated desired output, just replace the string `(addr:)` from the beginning. We will use cut command to print only column two. The column 1 and column 2 are not separated by tab but by `(:)`, so we need to use delimiter `(-d)` by pipelining the above output.

    # ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

![Customized IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Custome-IP-Address.gif)

Finally! The desired result has been generated.

### 5. How to Color Linux Terminal ###

You might have seen colored output in terminal. Also you would be knowing to enable/disable colored output in terminal. If not you may follow the below steps.

In Linux every user has `'.bashrc'` file, this file is used to handle your terminal output. Open and edit this file with your choice of editor. Note that, this file is hidden (dot beginning of file means hidden).

    $ vi /home/$USER/.bashrc

Make sure that the following lines below are uncommented. ie., it don’t start with a #.

    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dirc$
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
    
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

![User .bashrc File](http://www.tecmint.com/wp-content/uploads/2015/04/bashrc-file.gif)

Once done! Save and exit. To make the changes taken into effect logout and again login.

Now you will see files and folders are listed in various colors based upon type of file. To decode the color code run the below command.

    $ dircolors -p

Since the output is too long, lets pipeline the output with less command so that we get output one screen at a time.

    $ dircolors -p | less

![Linux Color Output](http://www.tecmint.com/wp-content/uploads/2015/04/Linux-Color-Output.gif)

### 6. How to Hash Tag Linux Commands and Scripts ###

We are using hash tags on Twitter, Facebook and Google Plus (may be some other places, I have not noticed). These hash tags make it easier for others to search for a hash tag. Very few know that we can use hash tag in Linux command Line.

We already know that `#` in configuration files and most of the programming languages is treated as comment line and is excluded from execution.

Run a command and then create a hash tag of the command so that we can find it later. Say we have a long script that was executed in point 4 above. Now create a hash tag for this. We know ifconfig can be run by sudo or root user hence acting as root.

    # ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d: #myip

The script above has been hash tagged with ‘myip‘. Now search for the hash tag in reverse-i-serach (press ctrl+r), in the terminal and type ‘myip‘. You may execute it from there, as well.

![Create Command Hash Tags](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Command-Hash-Tags.gif)

You may create as many hash tags for every command and find it later using reverse-i-search.

That’s all for now. We have been working hard to produce interesting and knowledgeable contents for you. What do you think how we are doing? Any suggestion is welcome. You may comment in the box below. Keep connected! Kudos.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-commandline-chat-server-and-remove-unwanted-packages/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/5-linux-command-line-tricks/
