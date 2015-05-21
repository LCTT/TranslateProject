Translating by ictlyh
Linux FAQs with Answers--How to change system proxy settings from the command line on Ubuntu desktop
================================================================================
> **Question**: I often need to change system proxy settings on Ubuntu desktop, but I do not want to go through a chain of GUI menus: "System Settings" -> "Network" -> "Network proxy", which is cumbersome. Is there a more convenient way to change desktop's proxy settings from the command line? 

In Ubuntu desktop, its desktop environment settings, including system proxy settings, are stored in DConf database, which is a simple key/value store. If you modify any desktop properties using System Settings menu, the changes are persisted in the DConf database backend. There are GUI-based or non-GUI-based ways to modify DConf database on Ubuntu. While System Settings or dconf-editor are graphical methods for accessing DConf database, gsettings or dconf are command-line tools that can modify the database.

Here is how to change system proxy settings from the command line using gsettings.

![](https://farm6.staticflickr.com/5460/17872782271_68e5267a4a_c.jpg)

The basic usage of gsettings for reading and writing a particular Dconf setting is as follows.

To modify a DConf setting:

    $ gsettings set <schema> <key> <value> 

To read a DConf setting:

    $ gsettings get <schema> <key> 

### Change System Proxy Setting to Manual from the Command Line ###

The following commands will change HTTP proxy setting to "my.proxy.com:8000" on Ubuntu desktop.

    $ gsettings set org.gnome.system.proxy.http host 'my.proxy.com'
    $ gsettings set org.gnome.system.proxy.http port 8000
    $ gsettings set org.gnome.system.proxy mode 'manual' 

If you want to change HTTPS/FTP proxy to manual as well, use these commands:

    $ gsettings set org.gnome.system.proxy.https host 'my.proxy.com'
    $ gsettings set org.gnome.system.proxy.https port 8000
    $ gsettings set org.gnome.system.proxy.ftp host 'my.proxy.com'
    $ gsettings set org.gnome.system.proxy.ftp port 8000 

To change Socks host settings to manual:

    $ gsettings set org.gnome.system.proxy.socks host 'my.proxy.com'
    $ gsettings set org.gnome.system.proxy.socks port 8000 

All these changes above are limited to the current Desktop user only. If you want to apply the proxy setting changes system-wide, prepend sudo to gsettings command. For example:

    $ sudo gsettings set org.gnome.system.proxy.http host 'my.proxy.com'
    $ sudo gsettings set org.gnome.system.proxy.http port 8000
    $ sudo gsettings set org.gnome.system.proxy mode 'manual' 

### Change System Proxy Setting to Automatic from the Command Line ###

If you are using [proxy auto configuration][1] (PAC), type the following commands to switch to PAC.

    $ gsettings set org.gnome.system.proxy mode 'auto'
    $ gsettings set org.gnome.system.proxy autoconfig-url http://my.proxy.com/autoproxy.pac

### Clear System Proxy Setting from the Command Line ###

Finally, to remove manual/automatic proxy setting, and revert to no-proxy setting:

    $ gsettings set org.gnome.system.proxy mode 'none' 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-system-proxy-settings-command-line-ubuntu-desktop.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-set-up-proxy-auto-config-on-ubuntu-desktop.html