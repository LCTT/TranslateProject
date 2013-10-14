How to Test Your Internet Speed with a Terminal Command
================================================================================
![](http://img.gawkerassets.com/img/190w8luc8u8jjjpg/original.jpg)

You probably know about the internet [speed tests][1] that can be performed from your browser. However, Make Tech Easier shows us that you can do the same thing right from a terminal window—perfect for your Raspberry Pi or home server.

Just open a terminal and run the following command:

    wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip

The test basically downloads a 10MB file using the [wget][2] command to pull a file from a remote server. The speed is displayed in the terminal when the file download has completed, so you know how fast your connection is running.

Any Linux PC can perform the wget command out of the box. [Windows][3] and [Mac][4] users will need to download the program, but it still functions more or less the same. Hit the link to read more.

--------------------------------------------------------------------------------

via: http://lifehacker.com/how-to-test-your-internet-speed-with-a-terminal-command-1364123567

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.speedtest.net/
[2]:http://lifehacker.com/161202/geek-to-live--mastering-wget
[3]:http://gnuwin32.sourceforge.net/packages/wget.htm
[4]:https://www.macupdate.com/app/mac/33951/wget