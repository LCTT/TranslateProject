    Vic020

Linux FAQs with Answers--How to define PATH environment variable for sudo commands
================================================================================
> **Question**: I built and installed a program in /usr/local/bin. The program requires root privilege to run. But when I try to run the program with sudo, I get "sudo: XXXXX: command not found" error. Somehow /usr/local/bin is not included in the PATH environment variable. How can I fix this problem? 

When you run a program with sudo, the program is executed with a new, minimum environment for security reasons. That is, not all the environment variables you define are inherited to sudo commands. In case of PATH environment variable, it is reset to a new "default" PATH variable when sudo is used. So if the new default PATH variable does not include the folder where your program is, you will get "command not found" error with sudo.

To customize the default PATH variable for sudo session, open /etc/sudoers file with a text editor, and look for "secure_path". The value defined in "secure_path" will be used as the default PATH variable when you execute sudo commands.

So add any necessary path (e.g., /usr/local/bin) to "secure_path", and it will be passed to sudo commands.

    Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

This change will be effective immediately.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/define-path-environment-variable-sudo-commands.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
