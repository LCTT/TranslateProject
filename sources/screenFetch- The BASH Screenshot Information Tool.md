#screenFetch: The BASH Screenshot Information Tool

[screenFetch](https://github.com/KittyKatt/screenFetch) is a “**Bash Screenshot Information Tool**”. It fetches system/theme information in terminal for Linux desktop screenshots. It can be used to generate one of those nifty terminal theme information + ASCII distribution logos you see in everyone’s screenshots nowadays.

It will auto-detect your distribution and display an ASCII version of that distribution’s logo and some valuable information to the right. There are options to specify no ascii art, colors, taking a screenshot upon displaying info, and even customizing the screenshot command. This script is very easy to add to and can easily be extended.

screenFetch will display the following details:

- Current logged in user
- Os version
- Kernel version
- Total Uptime
- No of installed packages
- Present shell details
- Present screen resolution
- Current Desktop environment
- Current Window manger (File manager)
- Total and Free Disk usage in percentage
- CPU details such as processor speed, type
- Total and current usage RAM sze

###Install screenFetch On Linux

You can either install it by directly downloading the source package from the project page or by cloning the screenFetch git repository.

Install From Source:

Download the [latest version here](http://git.silverirc.com/cgit.cgi/screenfetch.git/). I downloaded and installed it in /home/sk/Downloads directory.

Extract it with command:

	$ unzip Downloads/screenfetch-3.1.0.zip

Change to screenfetch directory and set the executable permission.

	$ cd screenfetch-3.1.0/
	$ chmod +x screenfetch-dev

Now run screenfetch with command:

	$ ./screenfetch-dev

Sample output:

	sk@sk: ~-screenfetch-3.1.0_008

###Install Via GIT Repository

First make sure you’ve installed git package.

If not, install it with following command on RHEL based systems.

	# yum install git

Install git on Debian based systems with command:

	# apt-get install git

Now clone screenFetch repository using command:

	# git clone git://github.com/KittyKatt/screenFetch.git screenfetch

Copy the file to /usr/bin/ directory and set executable permission:

	# cp screenfetch/screenfetch-dev /usr/bin/screenfetch
	# chmod +x /usr/bin/screenfetch

Now run screenFetch with command:

	# screenfetch

You will see the result like shown in the above screenshot.

via: http://www.unixmen.com/screenfetch-bash-screenshot-information-tool/
