translating by createyuan

How to Test Your Internet Speed Bidirectionally from Command Line Using ‘Speedtest-CLI’ Tool
================================================================================
We always need to check the speed of the Internet connection at home and office. What we do for this? Go to websites like Speedtest.net and begin test. It loads JavaScript in the web browser and then select best server based upon ping and output the result. It also uses a Flash player to produce graphical results.

What about headless server, where isn’t any web based browser and the main point is, most of the servers are headless. The another bottleneck of such web browser based speed testing is that, you can’t schedule the speed testing at regular interval. Here comes an application “Speedtest-cli” that removes such bottlenecks and let you test the speed of Internet connection from command line.

#### What is Speedtest-cli ####

The application is basically a script developed in Python programming Language. It measures Internet Bandwidth speed bidirectionally. It used speedtest.net infrastructure to measure the speed. Speedtest-cli is able to list server based upon physical distance, test against specific server, and gives you URL to share the result of your internet speed test.

To install latest speedtest-cli tool in Linux systems, you must have Python 2.4-3.4 or higher version installed on the system.

### Install speedtest-cli in Linux ###

There are two ways to install speedtest-cli tool. The first method involves the use of `python-pip` package while the second method is to download the Python script, make it executable and run, here I will cover both ways….

#### Install speedtest-cli Using pythin-pip ####

First you need to install `python-pip` package, then afterwards you can install the speedtest-cli tool using pip command as shown below.

    $ sudo apt-get install python-pip
    $ sudo pip install speedtest-cli

To upgrade speedtest-cli, at later stage, use.

    $ sudo pip install speedtest-cli --upgrade

#### Install speedtest-cli Using Python Script ####

First download the python script from github using wget command, unpack the downloaded file (master.zip) and extract it..

    $ wget https://github.com/sivel/speedtest-cli/archive/master.zip
    $ unzip master.zip 

After extracting the file, go to the extracted directory `speedtest-cli-master` and make the script file executable.

    $ cd speedtest-cli-master/
    $ chmod 755 speedtest_cli.py 

Next, move the executable to `/usr/bin` folder, so that you don’t need to type the full path everytime.

    $ sudo mv speedtest_cli.py /usr/bin/

### Testing Internet Connection Speed with speedtest-cli ###

**1. To test Download and Upload speed of your internet connection, run the `speedtest-cli` command without any argument as shown below.**

    $ speedtest_cli.py

![Test Download Upload Speed in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/Test-Download-Upload-Speed-in-Linux1.png)
Test Download Upload Speed in Linux

**2. To check the speed result in bytes in place of bits.**

    $ speedtest_cli.py --bytes

![Test Internet Speed in Bytes](http://www.tecmint.com/wp-content/uploads/2015/03/Test-Speed-in-Bytes.png)
Test Internet Speed in Bytes

**3. Share your bandwidth speed with your friends or family. You are provided with a link that can be used to download an image.**

![Share Internet Speed Results](http://www.tecmint.com/wp-content/uploads/2015/03/Share-Internet-Speed-Results.png)
Share Internet Speed Results

The following picture is a sample speed test result generated using above command.

![Speed Test Results](http://www.tecmint.com/wp-content/uploads/2015/03/Speed-Test-Results.png)
Speed Test Results

**4. Don’t need any additional information other than Ping, Download and upload?**

    $ speedtest_cli.py --simple

![Test Ping Download Upload Speed](http://www.tecmint.com/wp-content/uploads/2015/03/Test-Ping-Download-Upload-Speed1.png)
Test Ping Download Upload Speed

**5. List the `speedtest.net` server based upon physical distance. The distance in km is mentioned.**

    $ speedtest_cli.py --list

![Check Speedtest.net Servers](http://www.tecmint.com/wp-content/uploads/2015/03/Check-Speedtest-Servers.png)
Check Speedtest.net Servers

**6. The last stage generated a huge list of servers sorted on the basis of distance. How to get desired output? Say I only want to see the speedtest.net server located in Mumbai (India).**

    $ speedtest_cli.py --list | grep -i Mumbai

![Check Nearest Server](http://www.tecmint.com/wp-content/uploads/2015/03/Check-Nearest-Server.png)
Check Nearest Server

**7. Test connection speed against a specific server. Use Server Id generated in example 5 and example 6 in above.**

    $ speedtest_cli.py --server [server ID]
    $ speedtest_cli.py --server [5060]              ## Here server ID 5060 is used in the example.

![Test Connection Against Server](http://www.tecmint.com/wp-content/uploads/2015/03/Test-Connection-Against-Server.png)
Test Connection Against Server

**8. To check the version number and help of `speedtest-cli` tool.**

    $ speedtest_cli.py --version

![Check SpeedCli Version](http://www.tecmint.com/wp-content/uploads/2015/03/Check-SpeedCLi-Version.png)
Check SpeedCli Version

    $ speedtest_cli.py --help

![SpeedCli Help](http://www.tecmint.com/wp-content/uploads/2015/03/SpeedCli-Help.png)
SpeedCli Help

**Note:** Latency reported by tool is not its goal and one should not rely on it. The relative latency values output is responsible for server selected to be tested against. CPU and Memory capacity will influence the result to certain extent.

### Conclusion ###

The tool is must for system administrators and developers. A simple script which runs without any issue. I must say that the application is wonderful, lightweight and do what it promises. I disliked Speedtest.net for the reason it was using flash, but speedtest-cli gave me a reason to love them.

speedtest_cli is a third party application and should not be used to automatically record the bandwidth speed. Speedtest.net is used by millions of users and it is a good idea to [Set Your Own Speedtest Mini Server][1].

That’s all for now, till then stay tuned and connected to Tecmint. Don’t forget to give your valuable feedback in the comments below. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-internet-speed-from-command-line-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/speedtest-mini-server-to-test-bandwidth-speed/
