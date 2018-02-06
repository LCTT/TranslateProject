Translating by stevenzdg988
How To Find The Installed Proprietary Packages In Arch Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/01/Absolutely-Proprietary-720x340.jpg)
Are you an avid free software supporter and currently using any Arch based distribution? I've got a small tip for you! Now, you can easily find the installed proprietary packages in Arch Linux and its variants such as Antergos, Manjaro Linux etc. You don't need to refer the license details of the installed package in its website or use any external tool to find out whether the package is free or proprietary.

### Find The Installed Proprietary Packages In Arch Linux

A fellow developer has developed an utility named **" Absolutely Proprietary"**, a proprietary package detector for arch-based distributions. It compares all installed packages in your Arch based system against Parabola's package [blacklist][1] and [aur-blacklist][2] and then prints your **Stallman Freedom Index** (free/total). Additionally, you can save the list to a file and share or compare it with other systems/users.

Before installing it, Make sure you have installed **python** and **git**.

Then, git clone the repository:
```
git clone https://github.com/vmavromatis/absolutely-proprietary.git
```

This command will download all contents in a directory called 'absolutely-proprietary' in your current working directory.

Change to that directory:
```
cd absolutely-proprietary
```

And, find the installed proprietary packages using command:
```
python main.py
```

This command will download the blacklist.txt, aur-blacklist.txt and compare the locally installed packages with the remote packages and displays the

Here is the sample output from my Arch Linux desktop:
```
Retrieving local packages (including AUR)...
Downloading https://git.parabola.nu/blacklist.git/plain/blacklist.txt
Downloading https://git.parabola.nu/blacklist.git/plain/aur-blacklist.txt
Comparing local packages to remote...
=============================================
47 ABSOLUTELY PROPRIETARY PACKAGES INSTALLED
=============================================

Your GNU/Linux is infected with 47 proprietary packages out of 1370 total installed.
Your Stallman Freedom Index is 96.57

+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| Name | Status | Libre Alternatives | Description |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| chromium-pepper-flash | nonfree | | proprietary Google Chrome EULA, missing sources |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| faac | nonfree | | [FIXME:description] is a GPL'ed package, but has non free code that can't be distributed und|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| libunrar | nonfree | | part of nonfree unrar, Issue442 |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| opera | nonfree | | nonfree, nondistributable, built from binary installers, etc |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| shutter | nonfree | | need registered user to download (and access website) the source code and depends perl-net-d|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| ttf-ms-fonts | nonfree | | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| ttf-ubuntu-font-family | nonfree | | Ubuntu font license considered non-free by DFSG and Fedora |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| unace | nonfree | | license forbids making competing ACE archivers from unace |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| unrar | nonfree | unar | |
| | | fsf | |
| | | unrar | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| virtualbox | nonfree | | contains BIOS which needs a nonfree compiler to build from source (OpenWatcom compiler), doe|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| wordnet | nonfree | | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+


Save list to file? (Y/n)
```

[![][3]][4]

As you can see, I have 47 proprietary packages in my system. Like I said already, we can save it to a file and review them later. To do so, jut press 'y' when you are prompted to save the list in a file. Then press 'y' to accept the defaults or hit 'n' to save it in your preferred format and location.
```
Save list to file? (Y/n) y
Save as markdown table? (Y/n) y
Save it to (/tmp/tmpkuky_082.md): y
The list is saved at /home/sk/absolutely-proprietary/y.md

You can review it from the command line
using the "less -S /home/sk/absolutely-proprietary/y.md"
or, if installed, the "most /home/sk/absolutely-proprietary/y.md" commands
```

As you may noticed, I have only the **nonfree** packages. It will display two more type of packages such as semifree, uses-nonfree.

  * **nonfree** : This package is blatantly nonfree software.
  * **semifree** : This package is mostly free, but contains some nonfree software.
  * **uses-nonfree** : This package depends on, recommends, or otherwise inappropriately integrates with other nonfree software or services.



Another notable feature of this utility is it's not just displays the propriety packages, but also alternatives to such packages.

Hope this helps. I will be soon here with another useful guide soon. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-installed-proprietary-packages-arch-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://git.parabola.nu/blacklist.git/plain/blacklist.txt
[2]:https://git.parabola.nu/blacklist.git/plain/aur-blacklist.txt
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/Proprietary-Packages-1-1.png ()
