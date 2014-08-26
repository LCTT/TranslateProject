[su-kaiyao]翻译中

Linux Terminal: speedtest_cli checks your real bandwidth speed.
================================================================================
![](http://www.speedtest.net/result/3700218352.png)

What’s your upload and download speed at home (or in your office) ?
Are you really sure that you get what do you pay for to your ISP ?

To test the speed of our internet connection There are several internet services such as SpeedTest a web service that is available both from Web browsers and mobile application.

Now you can easily check it also with speedtest_cli a command line interface for testing internet [bandwidth][1] using [speedtest.net][2]. In this way you can do the test also on servers that don’t have a Browser or a graphical interface. 

### Installation ###

speedtest_cli it’s just a python script, so it’s really easy to install and use it, and you have different ways to do it:

#### 1) pip / easy_install ####

Open a terminal and give the command:

    pip install speedtest-cli

or

    easy_install speedtest-cli

#### 2) Github ####

To install directly from github you can use these commands:

    pip install git+https://github.com/sivel/speedtest-cli.git

or

    git clone https://github.com/sivel/speedtest-cli.git
    python speedtest-cli/setup.py install

#### 3) As Ubuntu/Debian or Mint package ####

The [package][3] is available on the getdeb repository, you can easily add it with these steps:

- Install the [getdeb package][4].
Or
- Configure the repository manually:
Go to System-Administration-Software Sources, Third-Party Software tab, Add:

    deb http://archive.getdeb.net/ubuntu trusty-getdeb apps

Add the repository GPG key, open a terminal window and type:

    wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

And now you can install the speedtest-cli package with the commands:

    sudo apt-get update
    sudo apt-get install python-speedtest-cli

#### 4) Just download (Like the way it used to be) ####

As last option, just download the python script where you prefer and run it from there:

    wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
    chmod +x speedtest-cli

or

    curl -o speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
    chmod +x speedtest-cli

### Basic Usage ###

You can simply run the command speedtest_cli.py without any option and you’ll get a report on the terminal of your bandwidth speed, this is the output of my crappy Italian Adsl:

    $ ./speedtest_cli.py
    Retrieving speedtest.net configuration...
    Retrieving speedtest.net server list...
    Testing from Telecom Italia (87.13.73.66)...
    Selecting best server based on latency...
    Hosted by LepidaSpA (Bologna) [12.20 km]: 104.347 ms
    Testing download speed........................................
    Download: 6.35 Mbits/s
    Testing upload speed..................................................
    Upload: 0.34 Mbits/s

So this is the basic usage, and it’s good enough to know how great (or bad) is your connection, but maybe you want to share this information with your friends, to do this just use the option –share

    ./speedtest_cli.py --share
    Retrieving speedtest.net configuration...
    Retrieving speedtest.net server list...
    Testing from Telecom Italia (87.13.73.66)...
    Selecting best server based on latency...
    Hosted by LepidaSpA (Bologna) [12.20 km]: 93.778 ms
    Testing download speed........................................
    Download: 6.20 Mbits/s
    Testing upload speed..................................................
    Upload: 0.33 Mbits/s
    Share results: http://www.speedtest.net/result/3700218352.png

This will produce an image similar to this one (but I hope for you with better values): 

![](http://www.speedtest.net/result/3700218352.png)

Another interesting option it’s the –list that shows a list of speedtest.net servers sorted by distance, these are my results:

    Retrieving speedtest.net configuration...
    Retrieving speedtest.net server list...
    2872) LepidaSpA (Bologna, Italy) [12.20 km]
    1561) MYNETWAY S.R.L. (Cesena, Italy) [80.97 km]
    2710) ReteIVO by D.t.s. Srl (Florence, Italy) [90.90 km]
    4826) Inteplanet Srl (Verona, Italy) [100.45 km]
    3998) Wolnext srl (Verona, Italy) [100.45 km]
    2957) Wifiweb s.r.l. (Altavilla Vicentina, Italy) [103.11 km]
    3103) E4A s.r.l. (Vicenza, Italy) [107.17 km]
    3804) Interplanet Srl (Vicenza, Italy) [107.17 km]
    1014) NTRnet (Vicenza, Italy) [107.17 km]
    3679) Hynet s r l (Vicenza, Italy) [107.17 km]
    3745) Comeser Srl (Fidenza, Italy) [114.00 km]
    5011) Welcomeitalia spa (Massarosa, Italy) [119.26 km]
    2864) ReteIVO by D.t.s. Srl (Massa, Italy) [120.92 km]
    2918) ReteIVO by D.t.s. Srl (Arezzo, Italy) [129.79 km]
    ...

Now that I know the ID of the servers that are located near my location I can pick up a specific server with the option –server, so to chose the server located at Florence (ID 2710) I can use the command:

    ./speedtest_cli.py --server 2710
    Retrieving speedtest.net configuration...
    Retrieving speedtest.net server list...
    Testing from Telecom Italia (87.13.73.66)...
    Hosted by ReteIVO by D.t.s. Srl (Florence) [90.90 km]: 106.505 ms
    Testing download speed........................................
    Download: 6.18 Mbits/s
    Testing upload speed..................................................
    Upload: 0.35 Mbits/s

Article sponsored by [Asapy Programming Company][5]

--------------------------------------------------------------------------------

via: http://linuxaria.com/howto/linux-terminal-speedtest_cli-checks-your-real-bandwidth-speed

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxaria.com/article/tool-command-line-bandwidth-linux
[2]:http://linuxaria.com/howto/speedtest.net
[3]:http://www.getdeb.net/
[4]:http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
[5]:http://www.asapy.com/
