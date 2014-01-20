8 Interesting Linux Tips And Tricks!
================================================================================
We keep bringing you tips and tricks for Linux from time to time. Keeping in tune with this practice, here are eight most interesting tips and tricks that we received recently from out readers. We hope you like it. Read on...

![](http://www.efytimes.com/admin/useradmin/photo/j4lm23703PM1182014.jpg)

### Listing files in the order of their sizes ###

If you want to have a list of the files sorted on the basis of their size, you can use the following command.
It will list the files in decreasing order.

    # ls -l | grep ^- | sort -nr -k 5 | more

If you need to do the same thing recursively, you could use the second command shown below.

    # ls -lR | grep ^- | sort -nr -k 5 | more

*—Sumedh Gajbhiye,
sumedh.gajbhiye1985@gmail.com*

### Resetting weird terminals ###

If you’ve felt that your bash terminal is misbehaving—showing junk characters for the prompt and displaying non-ascii characters for whatever you type—the following commands should put things back on track.
Type the command shown below at the terminal and press Enter:

    # reset

If that does not fix the issue, then try the following:

    # stty sane

*—Sudheer Divakaran,
cdsudheer@gmail.com*

### Recording and playing back the terminal session ###

Here is a simple tip to record and playback a terminal session. It is done by using the command script and scriptreplay.
This comes very handy while making tutorials using the terminal.
To start recording of your terminal session, use the following command:

    $ script -t 2> timing.log -a output.session

Then type in:

    $ ls
    $touch test
    .....

    $ exit

Here, the script command takes two files as the -arguments timing.log (which stores information on the time at which each command is run) and output.session (which stores the output of the commands).
Now, to playback the recorded session, use scriptplay as shown below.

    $ scriptreplay timing.log output.session

Note: timing.log and output.session can be shared with anyone who wants to replay a terminal session in his terminal.

*—Abhishek Singh,
abhishekkumarsingh.cse@gmail.com*

### Generate random numbers using the shell script ###

Sometimes when you are programming with the shell script, there may be a requirement to generate a random number to be used in the script.
Here is the code to get a 3-digit random number.

    var=$(dd if=/dev/urandom count=1 2> /dev/null | cksum | cut -f1 -d” “ | cut -c 3-5);

This will store the generated random number in the variable named as var.

*—Arpan Chavda,
09bce006@nirmauni.ac.in*

### Make software run on Linux as the root user ###

As a root user, to make software run on Linux, you have to change the string geteuid to getppid in the hex dump of the software.
This technique is extremely helpful in operating systems such as Backtrack, where most of the installation work has to be done as a root user.
For example: to run the Google Chrome browser as the root user, use the following command:

    # hexedit /opt/google/chome/chrome

Then press Ctrl+S and search the string geteuid in the hex dump.
Replace that with string getppid. Press Ctrl+X to save and exit the hex editor.
Now run the browser as the root user.

    # google-chrome

*—Mayank Bhanderi,
mbhanderi24@gmail.com*

### Optimise your site with GZIP compression ###

Compression is a simple, effective way to save bandwidth and speed up your site.
With the help of compression, any site’s home page goes from 100 KB to 10 KB.
To enable this feature in the Apache Web server you need to include the deflate_module in httpd.conf and add the lines shown below in the configuration file of Apache (/etc/httpd/conf/httpd.conf) to compress text, html, javascript, css and xml files:

    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript

*—Munish Kumar,
munishtotech@gmail.com*

### Check server load information while logging in ###

Here is a tip to check the server load average when you log in to the server. Create a text file named sload.sh with content shown below:

    #!/bin/bash
    gh=$(uptime | awk -F, ‘{print $3}’)
    echo -e “Server$gh\n”

Now, to check the server load at the time of logging in, call the sload.sh script through /root/.bashrc
Do remember to allow permission to the script as shown below:

    # chmod 755 /root/sload.sh

To call the sload.sh script, append the following to the end of /root/.bashrc

    /root/sload.sh

Or you can even append the content of the sload.sh to .bashrc

    $echo “/root/sload.sh” >> /root/.bashrc

After completing the above steps, you can log out and log in again to see the server load when you next log in.

*—Ranjith Kumar T,
ranjith.stc@gmail.com*

### Start your job at a specific time ###

You can schedule your job at a specific time with the use of the following command:

    # at 2015

    > >vlc /music/rockstar.mp3

This command will start to play rockstar.mp3 using VLC player at 2015 hours.
You can check your pending jobs by using the option -l with the at command, as follows:

    # at -l

More info can be found in the man pages of the at command.

*—Manas Pradhan,
acmeofmanas@gmail.com*

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=127250

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出