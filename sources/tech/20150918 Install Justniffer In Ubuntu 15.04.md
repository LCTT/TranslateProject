ictlyh Translating
Install Justniffer In Ubuntu 15.04
================================================================================
### Introduction ###

[Justniffer][1] is a network protocol analyzer that can be used as alternative to Snort. It is a very popular network analyzer tool, it work interactively to trace/sniff a live network. It can capture traffic from a live environment, support “lipcap” a “tcpdump” file formats. It helps the users to perform analysis in a complex network where it is difficult to capture traffic with wireshark. Specially it help to analyze application layer traffic very significantly and can extract http contents like images, scripts, HTML etc easily. Justsniffer is helpful in understanding how communication occur among different components.

### Features ###

This is the advantage of Justniffer that it collect all traffic from a complex network without affecting system performance, and can save logs for future analysis, some of the important features of Justniffer are:

#### 1. Reliable TCP flow rebuilding ####

It can record and reassemble TCP segments and IP fragments using a portion of host Linux kernel.

#### 2. Logging ####

Log are saved for future analysis and can be customized as and when required.

#### 3. Extensible ####

Can be extended with external  python, perl and bash scripts to get some additional results from analysis reports.

#### 4. Performance Management ####

Retrieve  information on the basis of Connection time, close time, response time or request time etc.

### Installation ###

Justsniffer can be installed with ppa.

To add the repo, run:

    $ sudo add-apt-repository ppa:oreste-notelli/ppa

Update System:

    $ sudo apt-get update

Install Justniffer tool:

    $ sudo apt-get install justniffer

It failed to install in make then i run following command and try to reinstall service

    $ sudo apt-get -f install

### Examples ###

First of all verify installed version of Justniffer with -V option, you will need super user privileges to utilize that tool.

    $ sudo justniffer -V

Sample output:

![j](http://www.unixmen.com/wp-content/uploads/2015/09/j.png)

**1. Dump Traffic to terminal in apache like format for eth1 interface, type**

    $ sudo  justniffer -i eth1

Sample output:

![Selection_001](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0013.png)

**2. You can trace running tcp stream with following option**

    $ sudo  justniffer -i eth1 -r

Sample output:

![Selection_002](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0023.png)

**3. To get the response time of web server, type**

    $ sudo justniffer -i eth1 -a " %response.time"

Sample output:

![Selection_003](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0033.png)

**4. Read a tcpdump captured file with Justniffer**

First, capture traffic with tcpdump.

    $ sudo tcpdump -w /tmp/file.cap -s0 -i eth0

Now access that data with justniffer

    $ justniffer -f file.cap

Sample output:

![Selection_005](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0056.png)

**5. Capture http only data**

    $ sudo justniffer -i eth1 -r -p "port 80 or port 8080"

Sample output:

![Selection_006](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0064.png)

**6.  Get http only data from a specific host**

    $ justniffer -i eth1 -r -p "host 192.168.1.250 and tcp port 80"

Sample output:

![Selection_007](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0074.png)

**7. Capture data in a more preciser format**

When you will type **justniffer -h** You will see a lots of format key words which help to get data in more preciser  way

    $ justniffer -h

Sample Output:

![Selection_008](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0083.png)

Let us retrieve data with some predefined parameter provided with justniffer

    $ justniffer -i eth1 -l "%request.timestamp %request.header.host %request.url %response.time"

Sample Output:

![Selection_009](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0094.png)

There are lots of option which you can explore.

### ￼Conclusion ###

Justniffer is a very nice tool for network testing. In my view users who are using Snort for network sniffing will know justniffer as an less complicated tool. It is provided with a lots of  **FORMAT KEYWORDS** which are very helpful to retrieve data in specific formats as per your need. You can log your network in .cap file formats which can be analyzed later on to monitor network service performance.

**Reference:**

- [Justniffer website][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-justniffer-ubuntu-15-04/

作者：[Rajneesh Upadhyay][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/rajneesh/
[1]:http://sourceforge.net/projects/justniffer/?source=directory
[2]:http://justniffer.sourceforge.net/
