alim0x translating

How to Customize Time & Date Format in Ubuntu Panel
================================================================================
![Time & Date format](http://ubuntuhandbook.org/wp-content/uploads/2015/08/ubuntu_tips1.png)

This quick tutorial is going to show you how to customize your Time & Date indicator in Ubuntu panel, though there are already a few options available in the settings page.

![custom-timedate](http://ubuntuhandbook.org/wp-content/uploads/2015/12/custom-timedate.jpg)

To get started, search for and install **dconf Editor** in Ubuntu Software Center. Then launch the software and follow below steps:

**1.** When dconf Editor launches, navigate to **com -> canonical -> indicator -> datetime**. Set the value of **time-format** to **custom**.

![custom time format](http://ubuntuhandbook.org/wp-content/uploads/2015/12/time-format.jpg)

You can also do this via a command in terminal:

    gsettings set com.canonical.indicator.datetime time-format 'custom'

**2.** Now you can customize the Time & Date format by editing the value of **custom-time-format**.

![customize-timeformat](http://ubuntuhandbook.org/wp-content/uploads/2015/12/customize-timeformat.jpg)

You can also do this via command:

    gsettings set com.canonical.indicator.datetime custom-time-format 'FORMAT_VALUE_HERE'

Interpreted sequences are:

- %a = abbreviated weekday name
- %A = full weekday name
- %b = abbreviated month name
- %B = full month name
- %d = day of month
- %l = hour ( 1..12), %I = hour (01..12)
- %k = hour ( 1..23), %H = hour (01..23)
- %M = minute (00..59)
- %p = AM or PM, %P = am or pm.
- %S = second (00..59)
- open terminal and run command `man date` to get more details.

Some examples:

custom time format value: **%a %H:%M %m/%d/%Y**

![exam-1](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-1.jpg)

**%a %r %b %d or %a %I:%M:%S %p %b %d**

![exam-2](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-2.jpg)

**%a %-d %b %l:%M %P %z**

![exam-3](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-3.jpg)

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/12/time-date-format-ubuntu-panel/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
