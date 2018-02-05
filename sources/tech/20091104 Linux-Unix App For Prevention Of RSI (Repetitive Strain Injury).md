Linux/Unix App For Prevention Of RSI (Repetitive Strain Injury)
======
![workrave-image][1]

[A repetitive strain injury][2] (RSI) is occupational overuse syndrome, non-specific arm pain or work related upper limb disorder. RSI caused from overusing the hands to perform a repetitive task, such as typing, writing, or clicking a mouse. Unfortunately, most people do not understand what RSI is or how dangerous it can be. You can easily prevent RSI using open source software called Workrave.


### What are the symptoms of RSI?

I'm quoting from this [page][3]. Do you experience:

  1. Fatigue or lack of endurance?
  2. Weakness in the hands or forearms?
  3. Tingling, numbness, or loss of sensation?
  4. Heaviness: Do your hands feel like dead weight?
  5. Clumsiness: Do you keep dropping things?
  6. Lack of strength in your hands? Is it harder to open jars? Cut vegetables?
  7. Lack of control or coordination?
  8. Chronically cold hands?
  9. Heightened awareness? Just being slightly more aware of a body part can be a clue that something is wrong.
  10. Hypersensitivity?
  11. Frequent self-massage (subconsciously)?
  12. Sympathy pains? Do your hands hurt when someone else talks about their hand pain?



### How to reduce your risk of Developing RSI

  * Take breaks, when using your computer, every 30 minutes or so. Use software such as workrave to prevent RSI.
  * Regular exercise can prevent all sort of injuries including RSI.
  * Use good posture. Adjust your computer desk and chair to support muscles necessary for good posture.



### Workrave

Workrave is a free open source software application intended to prevent computer users from developing RSI or myopia. The software periodically locks the screen while an animated character, "Miss Workrave," walks the user through various stretching exercises and urges them to take a coffee break. The program frequently alerts you to take micro-pauses, rest breaks and restricts you to your daily limit. The program works under MS-Windows and Linux, UNIX-like operating systems.

#### Install workrave

Type the following [apt command][4]/[apt-get command][5] under a Debian / Ubuntu Linux:
`$ sudo apt-get install workrave`
Fedora Linux user should type the following dnf command:
`$ sudo dnf install workrave`
RHEL/CentOS Linux user should enable EPEL repo and install it using [yum command][6]:
```
### [ **tested on a CentOS/RHEL 7.x and clones** ] ###
$ sudo yum install epel-release
$ sudo yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
$ sudo yum install workrave
```
Arch Linux user type the following pacman command to install it:
`$ sudo pacman -S workrave`
FreeBSD user can install it using the following pkg command:
`# pkg install workrave`
OpenBSD user can install it using the following pkg_add command
```
$ doas pkg_add workrave
```

#### How to configure workrave

Workrave works as an applet which is a small application whose user interface resides within a panel. You need to add workrave to panel to control behavior and appearance of the software.

##### Adding a New Workrave Object To Panel

  * Right-click on a vacant space on a panel to open the panel popup menu.
  * Choose Add to Panel.
  * The Add to Panel dialog opens.The available panel objects are listed alphabetically, with launchers at the top. Select workrave applet and click on Add button.

![Fig.01: Adding an Object \(Workrave\) to a Panel][7]
Fig.01: Adding an Object (Workrave) to a Panel

##### How Do I Modify Properties Of Workrave Software?

To modify the properties of an object workrave, perform the following steps:

  * Right-click on the workrave object to open the panel object popup.
  * Choose Preference. Use the Properties dialog to modify the properties as required.

![](https://www.cyberciti.biz/media/new/tips/2009/11/linux-gnome-workwave-preferences-.png)
Fig.02: Modifying the Properties of The Workrave Software

#### Workrave in Action

The main window shows the time remaining until it suggests a pause. The windows can be closed and you will the time remaining on the panel itself:
![Fig.03: Time reaming counter ][8]
Fig.03: Time reaming counter

![Fig.04: Miss Workrave - an animated character walks you through various stretching exercises][9]
Fig.04: Miss Workrave - an animated character walks you through various stretching exercises

The break prelude window, bugging you to take a micro-pause:
![Fig.05: Time for a micro-pause remainder ][10]
Fig.05: Time for a micro-pause remainder

![Fig.06: You can skip Micro-break ][11]
Fig.06: You can skip Micro-break

##### References:

  1. [Workrave project][12] home page.
  2. [pokoy][13] lightweight daemon that helps prevent RSI and other computer related stress.
  3. [A Pomodoro][14] timer for GNOME 3.
  4. [RSI][2] from the wikipedia.



### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][15], [Facebook][16], [Google+][17].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/repetitive-strain-injury-prevention-software.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/media/new/tips/2009/11/workrave-image.jpg (workrave-image)
[2]:https://en.wikipedia.org/wiki/Repetitive_strain_injury
[3]:https://web.eecs.umich.edu/~cscott/rsi.html##symptoms
[4]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[7]:https://www.cyberciti.biz/media/new/tips/2009/11/add-workwave-to-panel.png (Adding an Object (Workrave) to a Gnome Panel)
[8]:https://www.cyberciti.biz/media/new/tips/2009/11/screenshot-workrave.png (Workrave main window shows the time remaining until it suggests a pause.)
[9]:https://www.cyberciti.biz/media/new/tips/2009/11/miss-workrave.png (Miss Workrave Sofrware character walks you through various RSI stretching exercises )
[10]:https://www.cyberciti.biz/media/new/tips/2009/11/time-for-micro-pause.gif (Workrave RSI Software Time for a micro-pause remainder )
[11]:https://www.cyberciti.biz/media/new/tips/2009/11/Micro-break.png (Workrave RSI Software Micro-break )
[12]:http://www.workrave.org/
[13]:https://github.com/ttygde/pokoy
[14]:http://gnomepomodoro.org
[15]:https://twitter.com/nixcraft
[16]:https://facebook.com/nixcraft
[17]:https://plus.google.com/+CybercitiBiz
