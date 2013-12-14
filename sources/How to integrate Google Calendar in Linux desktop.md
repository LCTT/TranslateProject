How to integrate Google Calendar in Linux desktop
================================================================================
Google Calendar is one of the most popular web applications. One can access or sync Google Calendar across multiple devices either via web interface or with native apps. In Linux, there are several ways to access Google Calendar natively, such as by using email client plugins (e.g., Evolution or Thunderbird) or calendar apps (e.g., Sunbird or Rainlendar). These solutions, however, typically involve installing unnecessarily bulky software which you will probably not need.

If all you want is to access and get reminded by Google Calendar natively on Linux, then you can consider [Google Calendar command line interface (or gcalcli)][1], which is much more light-weight. Even better for Linux desktop, you can use gcalcli together with [Conky][2], to integrate Google Calendar into your desktop theme transparently.

In this tutorial, I will demonstrate **how to integrate Google Calendar into Linux desktop, by using gcalcli and Conky**.

### Install gcalcli on Linux ###

Before installing gcalcli, verify that you are using Python 2, as gcalcli is not compatible with Python 3.

To install gcalcli on Debian, Ubuntu or Linux Mint, use the following commands.

    $ sudo apt-get install git python-pip python-gdata python-dateutil python-gflags python-vobject python-parsedatetime
    $ sudo pip install google-api-python-client
    $ sudo pip install apiclient urllib3
    $ git clone https://github.com/insanum/gcalcli.git
    $ cd gcalcli
    $ sudo python setup.py install 

**Note**: gcalcli is included in the standard repository of Ubuntu or Linux mint. However, that version is not updated with the latest features and bug fixes. So I recommend building gcalcli from the source, as documented above.

To install gcalcli on Fedora, CentOS or RHEL, run the following.

    $ sudo yum install git python-pip python-gdata python-dateutil python-gflags python-vobject
    $ sudo pip install google-api-python-client
    $ sudo pip install apiclient urllib3
    $ git clone https://github.com/insanum/gcalcli.git
    $ cd gcalcli
    $ sudo python setup.py install 

### Google Authentication for gcalcli ###

To be able to access Google Calendar with gcalcli, you need to go through OAuth2 authention with your Google account, in order to grant gcalcli permission to access your Google Calendar.

The first time you run gcalcl, OAuth2 authentication will automatically be initiated. Thus run the following command to start.

    $ gcalcli agenda 

The command will print out a URL as shown below.

[![](http://farm4.staticflickr.com/3791/11216331146_d2c5f95963_z.jpg)][3]

At the same time, it will pop up a web browser window, and direct you to the URL. If a web browser window fails to open for any reason, you can copy and paste the URL into a web browser window manually.

If you are not logged in to your Google account, you will be asked to log in. After logging in, you will see the following message, asking you to allow gcalcl to manage your Google Calendar. Click on "Accept" button.

[![](http://farm4.staticflickr.com/3810/11216308465_1008fc1bb3_z.jpg)][4]

Enable Google Calendar API

After authentication, the next step is to enable API access for Google Calendar. gcalcli accesses your Google Calendar via Google Calendar API. In order to use Google Calendar API, however, you need to explicitly enable the API under your Google account.

First go to: [https://cloud.google.com/console][5]. Click on "API Project" under project list.

Go to "APIs & auth" --> "APIs" to see a list of Google APIs. Click on toggle button for "Calendar API" to enable the API.

Now go to "APIs & auth" --> "Registered apps" to register gcalcli app. Click on "Register app" button on the top.

[![](http://farm8.staticflickr.com/7293/11216363656_c203b6dfa2_z.jpg)][6]

Fill in the app name (e.g., "My Gcalcli"), and choose "Native" as a platform. Click on "Register" button to finalize.

This will create and show OAuth client ID and secret as follows. Make a note of this information. You can ignore the warning saying that "You have not set up your product name".

[![](http://farm3.staticflickr.com/2890/11216593546_312a564f1f_z.jpg)][7]

The result of OAuth authentication will be saved in ~/.gcalcli_oauth text file.

### Access Google Calendar from the Command Line with gcalcli ###

You are almost ready to access Google Calendar with gcalcli.

Create a gcalcli configuration file in your home directory as follows. Put OAuth client ID and secret that you obtained before, in the following format.

    $ vi ~/.gcalclirc 

> --client_id='XXXXXXXXXX.apps.googleusercontent.com'
> --client_secret='YYYYYYYYYYYYYYYY'

At this point, you should be able to run gcalcli from the command line.

Try the following two commands, which will print a list of your Google Calendars, and an agenda for the next 5 days, respectively.

    $ gcalcli list
    $ gcalcli agenda 

[![](http://farm4.staticflickr.com/3780/11216465043_c8f6d8967d_z.jpg)][8]

### Integrate gcalcli with Conky ###

The final step is to integrate the output of gcalcli into your desktop theme. For that, you need Conky, which is a very powerful tool that can display a wide range of information directly on desktop theme.

First [install Conky][9] on your Linux system.

Then, create a following script somewhere in your home directory (e.g., ~/bin).

    $ vi ~/bin/gcal.sh 

> #!/bin/sh
> 
> gcalcli --conky calw 2 |
>     sed -e 's/^[(0\x71^[(B/?/g' \
>         -e 's/^[(0\x78^[(B/?/g' \
>         -e 's/^[(0\x6A^[(B/?/g' \
>         -e 's/^[(0\x6B^[(B/?/g' \
>         -e 's/^[(0\x6C^[(B/?/g' \
>         -e 's/^[(0\x6D^[(B/?/g' \
>         -e 's/^[(0\x6E^[(B/?/g' \
>         -e 's/^[(0\x74^[(B/?/g' \
>         -e 's/^[(0\x75^[(B/?/g' \
>         -e 's/^[(0\x76^[(B/?/g' \
>         -e 's/^[(0\x77^[(B/?/g'

    $ chmod +x ~/bin/gcal.sh 

**Important Note**: '^[' in the above script must be the **actual ESCAPE key** (i.e. press Ctrl-V ESC in vi editor).

This script translates VT100 escape sequences to Unicode box drawing characters. This is a [needed workaround][10] because Conky does not support ASCII line art used by gcalcli.

Finally, create a Conky configuration file in your home directory as follows.

    $ vi ~/.conkyrc 

> alignment top_right
> maximum_width 630
> minimum_size 330 10
> gap_x 25
> gap_y 50
> 
> own_window yes
> own_window_type conky
> own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
> own_window_transparent yes
> own_window_argb_visual yes
> own_window_argb_value 0
> 
> update_interval 300
> background no
> 
> border_width 1
> default_color cornflowerblue
> default_outline_color white
> default_shade_color white
> double_buffer no
> draw_borders no
> draw_graph_borders no
> draw_outline no
> draw_shades no
> max_port_monitor_connections 64
> max_specials 512
> max_user_text 16384
> text_buffer_size 8096
> no_buffers yes
> out_to_console no
> uppercase no
> use_xft yes
> xftfont Bitstream Vera Sans Mono:size=10
> 
> TEXT
> *** Google Calendar Agenda ***
> ${execpi 300 gcalcli --conky agenda}
> ${execpi 300 ~/bin/gcal.sh}

This Conky configuration will display an agenda and two weeks' worth of schedules of your Google Calendar, directly in your desktop theme. The displayed info is updated every 5 minutes.

Now you can activate Conky by running the following.

    $ conky 

You should see Google Calendar in the right side of your Linux desktop as follows.

[![](http://farm8.staticflickr.com/7390/11216377436_72d00cec49_z.jpg)][11]

Once you verify that Google Calendar shows up correctly, you can set Conky to auto-start every time you log in to your desktop.

### Set up Google Calendar Reminder ###

gcalcli can also send a reminder for any upcoming schedule in your Google Calendar. It uses notify-send command to send desktop notifications. For Google Calendar reminder, you can set up a cron job like the following.

    $ crontab -l 

> */10 * * * * /usr/local/bin/gcalcli remind

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/integrate-google-calendar-linux-desktop.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/insanum/gcalcli
[2]:http://conky.sourceforge.net/
[3]:http://www.flickr.com/photos/xmodulo/11216331146/
[4]:http://www.flickr.com/photos/xmodulo/11216308465/
[5]:https://cloud.google.com/console
[6]:http://www.flickr.com/photos/xmodulo/11216363656/
[7]:http://www.flickr.com/photos/xmodulo/11216593546/
[8]:http://www.flickr.com/photos/xmodulo/11216465043/
[9]:http://xmodulo.com/2013/12/install-configure-conky-linux.html
[10]:https://github.com/insanum/gcalcli/issues/97
[11]:http://www.flickr.com/photos/xmodulo/11216377436/