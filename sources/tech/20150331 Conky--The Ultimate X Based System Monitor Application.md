Conky – The Ultimate X Based System Monitor Application
================================================================================
Conky is a system monitor application written in ‘C’ Programming Language and released under GNU General Public License and BSD License. It is available for Linux and BSD Operating System. The application is X (GUI) based that was originally forked from [Torsmo][1].

#### Features ####

- Simple User Interface
- Higher Degree of configuration
- It can show System stats using built-in objects (300+) as well as external scripts either on the desktop or in it’s own container.
- Low on Resource Utilization
- Shows system stats for a wide range of system variables which includes but not restricted to CPU, memory, swap, Temperature, Processes, Disk, Network, Battery, email, System messages, Music player, weather, breaking news, updates and blah..blah..blah
- Available in Default installation of OS like CrunchBang Linux and Pinguy OS.

#### Lesser Known Facts about Conky ####

- The Name conky was derived from a Canadian Television Show.
- It has already been ported to Nokia N900.
- It is no more maintained officially.

### Conky Installation and Usage in Linux ###

Before we install conky, we need to install packages like lm-sensors, curl and hddtemp using following command.

    # apt-get install lm-sensors curl hddtemp

Time to detect-sensors.

    # sensors-detect

**Note**: Answer ‘Yes‘ when prompted!

Check all the detected sensors.

    # sensors

#### Sample Output ####

    acpitz-virtual-0
    Adapter: Virtual device
    temp1:        +49.5°C  (crit = +99.0°C)
    
    coretemp-isa-0000
    Adapter: ISA adapter
    Physical id 0:  +49.0°C  (high = +100.0°C, crit = +100.0°C)
    Core 0:         +49.0°C  (high = +100.0°C, crit = +100.0°C)
    Core 1:         +49.0°C  (high = +100.0°C, crit = +100.0°C)

Conky can be installed from repo as well as, can be compiled from source.

    # yum install conky              [On RedHat systems]
    # apt-get install conky-all      [On Debian systems]

**Note**: Before you install conky on Fedora/CentOS, you must have enabled [EPEL repository][2].

After conky has been installed, just issue following command to start it.

    $ conky &

![Conky Monitor in Action](http://www.tecmint.com/wp-content/uploads/2015/03/Start-Conkey.jpeg)
Conky Monitor in Action

It will run conky in a popup like window. It uses the basic conky configuration file located at /etc/conky/conky.conf.

You may need to integrate conky with the desktop and won’t like a popup like window every-time. Here is what you need to do

Copy the configuration file /etc/conky/conky.conf to your home directory and rename it as ‘`.conkyrc`‘. The dot (.) at the beginning ensures that the configuration file is hidden.

    $ cp /etc/conky/conky.conf /home/$USER/.conkyrc

Now restart conky to take new changes.

    $ killall -SIGUSR1 conky

![Conky Monitor Window](http://www.tecmint.com/wp-content/uploads/2015/03/Restart-Conky.jpeg)
Conky Monitor Window

You may edit the conky configuration file located in your home dircetory. The configuration file is very easy to understand.

Here is a sample configuration of conky.

![Conky Configuration](http://www.tecmint.com/wp-content/uploads/2015/03/Conky-Configuration.jpeg)
Conky Configuration

From the above window you can modify color, borders, size, scale, background, alignment and several other properties. By setting different alignments to different conky window, we can run more than one conky script at a time.

**Using script other than the default for conky and where to find it?**

You may write your own conky script or use one that is available over Internet. We don’t suggest you to use any script you find on the web which can be potentially dangerous unless you know what you are doing. However a few famous threads and pages have conky script that you can trust as mentioned below.

- [http://ubuntuforums.org/showthread.php?t=281865][3]
- [http://conky.sourceforge.net/screenshots.html][4]

At the above url, you will find every screenshot has a hyperlink, which will redirects to script file.

#### Testing Conky Script ####

Here I will be running a third party written conky-script on my Debian Jessie Machine, to test.

    $ wget https://github.com/alexbel/conky/archive/master.zip
    $ unzip master.zip 

Change current working directory to just extracted directory.

    $ cd conky-master

Rename the secrets.yml.example to secrets.yml.

    $ mv secrets.yml.example secrets.yml

Install Ruby before you could run this (ruby) script.

    $ sudo apt-get install ruby
    $ ruby starter.rb 

![Conky Fancy Look](http://www.tecmint.com/wp-content/uploads/2015/03/Conky-Fancy-Look.jpeg)
Conky Fancy Look

**Note**: This script can be modified to show your current weather, temperature, etc.

If you want to start conky at boot, add the below one liner to startup Applications.

    conky --pause 10 
    save and exit.

And Finally…such a lightweight and useful GUI eye candy like package is not in active stage and is not maintained officially anymore. The last stable release was conky 1.9.0 released on May 03, 2012. A thread on Ubuntu forum has gone over 2k pages of users sharing configuration. (link to forum : [http://ubuntuforums.org/showthread.php?t=281865/][5])

- [Conky Homepage][6]

That’s all for now. Keep connected. Keep commenting. Share your thoughts and configuration in comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-conky-in-ubuntu-debian-fedora/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://torsmo.sourceforge.net/
[2]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[3]:http://ubuntuforums.org/showthread.php?t=281865
[4]:http://conky.sourceforge.net/screenshots.html
[5]:http://ubuntuforums.org/showthread.php?t=281865/
[6]:http://conky.sourceforge.net/