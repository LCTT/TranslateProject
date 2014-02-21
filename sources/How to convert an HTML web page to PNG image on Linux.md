How to convert an HTML web page to PNG image on Linux
================================================================================
One of the easiest way to screen capture a particular web page as a PNG image is by using [CutyCapt][1], which is a convenient command line Linux tool for converting any HTML webpage to a variety of vector and bitmat image formats (e.g., SVG, PDF, PS, PNG, JPEG, TIFF, GIF). Internally, CutyCapt uses WebKit rendering engine to export webpage rendering output to an image file. Built with Qt, CutyCapt is actually a cross-platform application available for other platforms such as Windows as well.

In this tutorial, I will describe how to **convert an HTML web page to PNG image format using CutyCapt**.

### Install CutyCapt on Linux ###

Here are distro-specific instructions to install CutyCapt on Linux.

**Install CutyCapt on Debian, Ubuntu or Linux Mint**

    $ sudo apt-get install cutycapt 

**Install CutyCapt on Fedora**

    $ sudo yum install subversion qt-devel qtwebkit-devel gcc-c++ make
    $ svn co svn://svn.code.sf.net/p/cutycapt/code/ cutycapt
    $ cd cutycapt/CutyCapt 

Before compilation on Fedora, you need to [patch][2] source code.

Open CutyCapt.hpp with a text editor, and add the following two lines at the beginning of the file.

    #include <QNetworkReply>
    #include <QSslError>

Finally, compile and install CutyCapt as follows.

    $ qmake-qt4
    $ make
    $ sudo cp CutyCapt /usr/local/bin/cutycapt 

### Install CutyCapt on CentOS or RHEL ###

First [enable EPEL repository][3] on your Linux. Then follow the same procedure as in Fedora to build and install CutyCapt.

### Convert HTML to PNG with CutyCapt ###

To take a screenshot of an HTML page as a PNG image, simply run CutyCapt in the following format.

    $ cutycapt --url=http://www.cnn.com --out=cnn.png

To save an HTML page to a different format (e.g., PDF), simply specify the output file appropriately.

    $ cutycapt --url=http://www.cnn.com --out=cnn.pdf

The following shows command-line options of cutycapt.

![](http://farm3.staticflickr.com/2811/12542271814_3c2563d405_z.jpg)

### Convert HTML to PNG with CutyCapt on a Headless Server ###

While CutyCapt is a CLI tool, it requires an X server running. If you attempt to run CutyCapt on a headless server, you will get the error:

    cutycapt: cannot connect to X server :0

If you want to run CutyCapt on a headless server without X windows, you can set up Xvfb (lightweight "fake" X11 server) on the server, so that CutyCapt does not complain.

To install Xvfb on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install xvfb 

To install Xvfb on Fedora, CentOS or RHEL:

    $ sudo yum install xvfb 

After installing Xvfb, proceed to run CutyCapt as follows.

    $ xvfb-run --server-args="-screen 0, 1280x1200x24" cutycapt --url=http://www.cnn.com --out=cnn.png 

It will launch Xvfb server first, and then use CutyCapt to screen capture the webpage. So it may take longer. If you want to make multiple screenshots, you may want to start Xvfb server as a background daemon beforehand.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/02/convert-html-web-page-png-image-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://cutycapt.sourceforge.net/
[2]:https://github.com/hoehrmann/CutyCapt/issues/3
[3]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html