    Vic020

Linux FAQs with Answers--How to disable Apport internal error reporting on Ubuntu
================================================================================
> **Question**: On Ubuntu desktop, I often encounter a popup window, alerting that Ubuntu has experienced an internal error, and asking me to send an error report. This is bothering me as it keeps popping up for every application crash. How can I turn off the error reporting feature? 

Ubuntu desktop comes with Apport pre-installed, which is a system that catches applications crashes, unhandled exceptions or any non-crash application bugs, and automatically generates a crash report for debugging purposes. When an application crash or bug is detected, Apport alerts user of the event by showing a popup window and asking the user to submit a crash report. You will see messages like the following.

- "Sorry, the application XXXX has closed unexpectedly."
- "Sorry, Ubuntu XX.XX has experienced an internal error."
- "System program problem detected." 

![](https://farm9.staticflickr.com/8635/15688551119_708b23b12a_z.jpg)

If application crashes are recurring, frequent error reporting alerts can be disturbing. Or you may be worried that Apport can collect and upload any sensitive information of your Ubuntu system. Whatever the reason is, you may want to disable Apport's error reporting feature.

### Disable Apport Error Reporting Temporarily ###

If you want to disable Apport temporarily, use this command:

    $ sudo service apport stop 

Note that Apport will be enabled back after you boot your Ubuntu system.

### Disable Apport Error Reporting Permanently ###

To turn off Apport permanently, edit /etc/default/apport with a text editor, and change the content to the following.

    enabled=0

Now if you reboot your Ubuntu system, Apport will automatically be disabled.

If you think you will never use Apport, another method is to simply remove it altogether.

    $ sudo apt-get purge apport 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-apport-internal-error-reporting-ubuntu.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
