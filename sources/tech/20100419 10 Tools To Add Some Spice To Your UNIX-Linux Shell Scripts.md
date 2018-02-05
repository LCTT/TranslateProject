10 Tools To Add Some Spice To Your UNIX/Linux Shell Scripts
======
There are some misconceptions that shell scripts are only for a CLI environment. You can efficiently use various tools to write GUI and network (socket) scripts under KDE or Gnome desktops. Shell scripts can make use of some of the GUI widget (menus, warning boxes, progress bars, etc.). You can always control the final output, cursor position on the screen, various output effects, and more. With the following tools, you can build powerful, interactive, user-friendly UNIX / Linux bash shell scripts.

Creating GUI application is not an expensive task but a task that takes time and patience. Luckily, both UNIX and Linux ships with plenty of tools to write beautiful GUI scripts. The following tools are tested on FreeBSD and Linux operating systems but should work under other UNIX like operating systems.

### 1. notify-send Command

The notify-send command allows you to send desktop notifications to the user via a notification daemon from the command line. This is useful to inform the desktop user about an event or display some form of information without getting in the user's way. You need to install the following package on a Debian/Ubuntu Linux using [apt command][1]/[apt-get command][2]:
`$ sudo apt-get install libnotify-bin`
CentOS/RHEL user try the following [yum command][3]:
`$ sudo yum install libnotify`
Fedora Linux user type the following dnf command:
`$ sudo dnf install libnotify`
In this example, send simple desktop notification from the command line, enter:
```
### send some notification ##
notify-send "rsnapshot done :)"
```

Sample outputs:
![Fig:01: notify-send in action ][4]
Here is another code with additional options:
```
....
alert=18000
live=$(lynx --dump http://money.rediff.com/ | grep 'BSE LIVE' | awk '{ print $5}' | sed 's/,//g;s/\.[0-9]*//g')
[ $notify_counter -eq 0 ] && [ $live -ge $alert ] && { notify-send -t 5000 -u low -i   "BSE Sensex touched 18k";  notify_counter=1; }
...
```

Sample outputs:
![Fig.02: notify-send with timeouts and other options][5]
Where,

  * -t 5000: Specifies the timeout in milliseconds ( 5000 milliseconds = 5 seconds)
  * -u low : Set the urgency level (i.e. low, normal, or critical).
  * -i gtk-dialog-info : Set an icon filename or stock icon to display (you can set path as -i /path/to/your-icon.png).



For more information on use of the notify-send utility, please refer to the notify-send man page, viewable by typing man notify-send from the command line:
```
man notify-send
```

### #2: tput Command

The tput command is used to set terminal features. With tput you can set:

  * Move the cursor around the screen.
  * Get information about terminal.
  * Set colors (background and foreground).
  * Set bold mode.
  * Set reverse mode and much more.



Here is a sample code:
```
#!/bin/bash
 
# clear the screen
tput clear
 
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15
 
# Set a foreground colour using ANSI escape
tput setaf 3
echo "XYX Corp LTD."
tput sgr0
 
tput cup 5 17
# Set reverse video mode
tput rev
echo "M A I N - M E N U"
tput sgr0
 
tput cup 7 15
echo "1. User Management"
 
tput cup 8 15
echo "2. Service Management"
 
tput cup 9 15
echo "3. Process Management"
 
tput cup 10 15
echo "4. Backup"
 
# Set bold mode
tput bold
tput cup 12 15
read -p "Enter your choice [1-4] " choice
 
tput clear
tput sgr0
tput rc
```


Sample outputs:
![Fig.03: tput in action][6]
For more detail concerning the tput command, see the following man page:
```
man 5 terminfo
man tput
```

### #3: setleds Command

The setleds command allows you to set the keyboard leds. In this example, set NumLock on:
```
setleds -D +num
```

To turn it off NumLock, enter:
```
setleds -D -num
```

  * -caps : Clear CapsLock.
  * +caps : Set CapsLock.
  * -scroll : Clear ScrollLock.
  * +scroll : Set ScrollLock.



See setleds command man page for more information and options:
`man setleds`

### #4: zenity Command

The [zenity commadn will display GTK+ dialogs box][7], and return the users input. This allows you to present information, and ask for information from the user, from all manner of shell scripts. Here is a sample GUI client for the whois directory service for given domain name:

```shell
#!/bin/bash
# Get domain name
_zenity="/usr/bin/zenity"
_out="/tmp/whois.output.$$"
domain=$(${_zenity} --title  "Enter domain" \
	            --entry --text "Enter the domain you would like to see whois info" )
 
if [ $? -eq 0 ]
then
  # Display a progress dialog while searching whois database
  whois $domain  | tee >(${_zenity} --width=200 --height=100 \
  				    --title="whois" --progress \
			            --pulsate --text="Searching domain info..." \
                                    --auto-kill --auto-close \
                                    --percentage=10) >${_out}
 
  # Display back output
  ${_zenity} --width=800 --height=600  \
	     --title "Whois info for $domain" \
	     --text-info --filename="${_out}"
else
  ${_zenity} --error \
	     --text="No input provided"
fi
```

Sample outputs:
![Fig.04: zenity in Action][8]
See the zenity man page for more information and all other supports GTK+ widgets:
```
zenity --help
man zenity
```

### #5: kdialog Command

kdialog is just like zenity but it is designed for KDE desktop / qt apps. You can display dialogs using kdialog. The following will display message on screen:
```
kdialog --dontagain myscript:nofilemsg --msgbox "File: '~/.backup/config' not found."
```

Sample outputs:
![Fig.05: Suppressing the display of a dialog ][9]

See [shell scripting with KDE Dialogs][10] tutorial for more information.

### #6: Dialog

[Dialog is an application used in shell scripts][11] which displays text user interface widgets. It uses the curses or ncurses library. Here is a sample code:
```
#!/bin/bash
dialog --title "Delete file" \
--backtitle "Linux Shell Script Tutorial Example" \
--yesno "Are you sure you want to permanently delete \"/tmp/foo.txt\"?" 7 60
 
# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) echo "File deleted.";;
   1) echo "File not deleted.";;
   255) echo "[ESC] key pressed.";;
esac
```

See the dialog man page for details:
`man dialog`

#### A Note About Other User Interface Widgets Tools

UNIX and Linux comes with lots of other tools to display and control apps from the command line, and shell scripts can make use of some of the KDE / Gnome / X widget set:

  *  **gmessage** - a GTK-based xmessage clone.
  *  **xmessage** - display a message or query in a window (X-based /bin/echo)
  *  **whiptail** - display dialog boxes from shell scripts
  *  **python-dialog** - Python module for making simple Text/Console-mode user interfaces



### #7: logger command

The logger command writes entries in the system log file such as /var/log/messages. It provides a shell command interface to the syslog system log module:
```
logger "MySQL database backup failed."
tail -f /var/log/messages
logger -t mysqld -p daemon.error "Database Server failed"
tail -f /var/log/syslog
```

Sample outputs:
```
Apr 20 00:11:45 vivek-desktop kernel: [38600.515354] CPU0: Temperature/speed normal
Apr 20 00:12:20 vivek-desktop mysqld: Database Server failed
```

See howto [write message to a syslog / log file][12] for more information. Alternatively, you can see the logger man page for details:
`man logger`

### #8: setterm Command

The setterm command can set various terminal attributes. In this example, force screen to turn black in 15 minutes. Monitor standby will occur at 60 minutes:
```
setterm -blank 15 -powersave powerdown -powerdown 60
```

In this example show underlined text for xterm window:
```
setterm -underline on;
echo "Add Your Important Message Here"
setterm -underline off
```

Another useful option is to turn on or off cursor:
```
setterm -cursor off
```

Turn it on:
```
setterm -cursor on
```

See the setterm command man page for details:
`man setterm`

### #9: smbclient: Sending Messages To MS-Windows Workstations

The smbclient command can talk to an SMB/CIFS server. It can send a message to selected users or all users on MS-Windows systems:
```
smbclient -M WinXPPro <<eof
Message 1
Message 2
...
..
EOF
```

OR
```
echo "${Message}" | smbclient -M salesguy2
```


See smbclient man page or read our previous post about "[sending a message to Windows Workstation"][13] with smbclient command:
`man smbclient`

### #10: Bash Socket Programming

Under bash you can open a socket to pass some data through it. You don't have to use curl or lynx commands to just grab data from remote server. Bash comes with two special device files which can be used to open network sockets. From the bash man page:

  1.  **/dev/tcp/host/port** - If host is a valid hostname or Internet address, and port is an integer port number or service name, bash attempts to open a TCP connection to the corresponding socket.
  2.  **/dev/udp/host/port** - If host is a valid hostname or Internet address, and port is an integer port number or service name, bash attempts to open a UDP connection to the corresponding socket.


You can use this technquie to dermine if port is open or closed on local or remote server without using nmap or other port scanner:
```
# find out if TCP port 25 open or not
(echo >/dev/tcp/localhost/25) &>/dev/null && echo "TCP port 25 open" || echo "TCP port 25 close"
```

You can use [bash loop and find out open ports][14] with the snippets:
```
echo "Scanning TCP ports..."
for p in {1..1023}
do
  (echo >/dev/tcp/localhost/$p) >/dev/null 2>&1 && echo "$p open"
done
```


Sample outputs:
```
Scanning TCP ports...
22 open
53 open
80 open
139 open
445 open
631 open
```

In this example, your bash script act as an HTTP client:
```
#!/bin/bash
exec 3<> /dev/tcp/${1:-www.cyberciti.biz}/80
 
printf "GET / HTTP/1.0\r\n" >&3
printf "Accept: text/html, text/plain\r\n" >&3
printf "Accept-Language: en\r\n" >&3
printf "User-Agent: nixCraft_BashScript v.%s\r\n" "${BASH_VERSION}"   >&3
printf "\r\n" >&3
 
while read LINE <&3
do
   # do something on $LINE
   # or send $LINE to grep or awk for grabbing data
   # or simply display back data with echo command
   echo $LINE
done
```

See the bash man page for more information:
`man bash`

### A Note About GUI Tools and Cronjob

You need to request local display/input service using export DISPLAY=[user's machine]:0 command if you are [using cronjob][15] to call your scripts. For example, call /home/vivek/scripts/monitor.stock.sh as follows which uses zenity tool:
`@hourly DISPLAY=:0.0 /home/vivek/scripts/monitor.stock.sh`

Have a favorite UNIX tool to spice up shell script? Share it in the comments below.

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][16], [Facebook][17], [Google+][18].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/spice-up-your-unix-linux-shell-scripts.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[2]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[3]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[4]:https://www.cyberciti.biz/media/new/tips/2010/04/notify-send.png (notify-send: Shell Script Get Or Send Desktop Notifications )
[5]:https://www.cyberciti.biz/media/new/tips/2010/04/notify-send-with-icons-timeout.png (Linux / UNIX: Display Notifications From Your Shell Scripts With notify-send)
[6]:https://www.cyberciti.biz/media/new/tips/2010/04/tput-options.png (Linux / UNIX Script Colours and Cursor Movement With tput)
[7]:https://bash.cyberciti.biz/guide/Zenity:_Shell_Scripting_with_Gnome
[8]:https://www.cyberciti.biz/media/new/tips/2010/04/zenity-outputs.png (zenity: Linux / UNIX display Dialogs Boxes From The Shell Scripts)
[9]:https://www.cyberciti.biz/media/new/tips/2010/04/KDialog.png (Kdialog: Suppressing the display of a dialog )
[10]:http://techbase.kde.org/Development/Tutorials/Shell_Scripting_with_KDE_Dialogs
[11]:https://bash.cyberciti.biz/guide/Bash_display_dialog_boxes
[12]:https://www.cyberciti.biz/tips/howto-linux-unix-write-to-syslog.html
[13]:https://www.cyberciti.biz/tips/freebsd-sending-a-message-to-windows-workstation.html
[14]:https://www.cyberciti.biz/faq/bash-for-loop/
[15]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/
[16]:https://twitter.com/nixcraft
[17]:https://facebook.com/nixcraft
[18]:https://plus.google.com/+CybercitiBiz
