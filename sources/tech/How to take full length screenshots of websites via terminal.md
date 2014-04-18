How to take full length screenshots of websites via terminal
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Screenshot-790x526.png)

This is a guest post, written by **Tsamis Konstantinos**. He is an avid user of Linux and Open Source, and also a regular visitor of Unixmen. You can contact him via email: **tsamis73@gmail.com**

Taking screenshots is something we all do to remember things instead of notes and for sending things we saw to others. But usually, if not always the webpage we’re taking screenshots of doesn’t fit into our screen and so we need to take multiple screenshots to capture all of it.

For Linux there is a GNOME application that can take any url you give it and return a full length screenshot of it. The application is called **gnome-web-photo** and in this article you can see how to install it and use it.

To install gnome-web-photo on Ubuntu or Debian you type:

    $ sudo apt-get install gnome-web-photo

If you are using Fedora:

    $ sudo yum install gnome-web-photo

If you are using CentOS or RedHat user, be aware that `gnome-web-photo` depends on GTK+ 3.0. This means that `gnome-web-photo` is not compatible with GNOME 2, which is shipped with CentOS/RHEL 6.

To actually take a screenshot of a web page:

    $ gnome-web-photo -t 0 --mode=photo http://www.unixmen.com output.png

The above command will take the full length screenshot of the Unixmen website, and save it in the current directory.

Sample output:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/output2.png)

The **-t** parameter specifies the timeout value (in seconds) for screenshot generation. **-t 0** means that timeout is disabled.

**With** gnome-web-photo, you can also generate a small thumbnail of a webpage like this: Optionally, you can specify thumbnail size by using “**-s**” option. The default thumbnail size is **256×256**.

    $ gnome-web-photo -t 0 -s 128 --mode=thumbnail http://www.unixmen.com output.png

Sample output:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/output.png)

If you want to save a screenshot of a website as a multi-page PDF, so that you can print it out later, you can type:

    $ gnome-web-photo -t 0 --mode=print http://www.unixmen.com output.pdf

Note that the application doesn’t support the **.jpg** format.

This application is quite useful for all sort of uses. Thumbnails and full length screenshots are useful to me and hopefully to you, too.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/take-full-length-screenshots-websites-via-terminal/

译者：[VizV](https://github.com/vizv) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
