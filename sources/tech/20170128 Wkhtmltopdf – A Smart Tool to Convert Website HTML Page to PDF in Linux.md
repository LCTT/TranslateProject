Wkhtmltopdf – A Smart Tool to Convert Website HTML Page to PDF in Linux
============================================================

**Wkhtmltopdf** is an open source simple and much effective command-line shell utility that enables user to convert any given **HTML** (**Web Page**) to **PDF** document or an image (**jpg**, **png**, etc).

Wkhtmltopdf is written in **C++** programming language and distributed under **GNU/GPL** (**General Public License**). It uses **WebKit** rendering layout engine to convert **HTML** pages to** PDF**document without loosing the quality of the pages. Its is really very useful and trustworthy solution for creating and storing snapshots of web pages in real-time.

### Wkhtmltopdf Features

1.  Open source and cross platform.
2.  Convert any **HTML** web pages to **PDF** files using **WebKit** engine.
3.  Options to add headers and footers
4.  Table of Content (**TOC**) generation option.
5.  Provides batch mode conversions.
6.  Support for **PHP** or **Python** via bindings to libwkhtmltox.

In this article we will show you how to install **Wkhtmltopdf** program under Linux systems using source tarball files.

### Install Evince (PDF Viewer)

Let’s install **evince** (a **PDF** reader) program for viewing **PDF** files in Linux systems.

```
$ sudo yum install evince             [RHEL/CentOS and Fedora]
$ sudo dnf install evince             [On Fedora 22+ versions]
$ sudo apt-get install evince         [On Debian/Ubuntu systems]
```

### Download Wkhtmltopdf Source File

Download **wkhtmltopdf** source files for your **Linux** architecture using [Wget command][1], or you can also download latest versions (current stable series is **0.12.4**) at [wkhtmltopdf download][2] page.

##### On 64-bit Linux OS

```
$ wget http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
```

##### On 32-bit Linux OS

```
$ wget http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-i386.tar.xz
```

### Install Wkhtmltopdf in Linux

Extract the files to a current working directory using following [tar command][3].

```
------ On 64-bit Linux OS ------
$ sudo tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
------ On 32-bit Linux OS ------
$ sudo tar -xvzf wkhtmltox-0.12.4_linux-generic-i386.tar.xz 
```

Install the **wkhtmltopdf** under **/usr/bin** directory for easy execution of program from any path.

```
$ sudo cp wkhtmltox/bin/wkhtmltopdf /usr/bin/
```

### How to Use Wkhtmltopdf?

Here we will see how to covert remote **HTML** pages to **PDF** files, verify information, view created files using **evince** program from the **GNOME** Desktop.

#### Convert Website HTML Page to PDF File

To convert any website **HTML** web page to **PDF**, run the following example command. It will convert the given webpage to [10-Sudo-Configurations.pdf][4] in current working directory.

```
# wkhtmltopdf http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/ 10-Sudo-Configurations.pdf
```

##### Sample Output :

```
Loading pages (1/6)
Counting pages (2/6)
Resolving links (4/6)
Loading headers and footers (5/6)
Printing pages (6/6)
Done
```

#### View Generated PDF File

To verify that the file is created, use the following command.

```
$ file 10-Sudo-Configurations.pdf
```

##### Sample Output :

```
10-Sudo-Configurations.pdf: PDF document, version 1.4
```

#### View Information of Generated PDF File

To view the information of generated file, issue the following command.

```
$ pdfinfo 10-Sudo-Configurations.pdf
```

##### Sample Output :

```
Title:          10 Useful Sudoers Configurations for Setting 'sudo' in Linux
Creator:        wkhtmltopdf 0.12.4
Producer:       Qt 4.8.7
CreationDate:   Sat Jan 28 13:02:58 2017
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          13
Encrypted:      no
Page size:      595 x 842 pts (A4)
Page rot:       0
File size:      697827 bytes
Optimized:      no
PDF version:    1.4
```

#### View Created PDF File

Take a look at the newly created **PDF** file using **evince** program from the desktop.

```
$ evince 10-Sudo-Configurations.pdf
```

##### Sample Screenshot :

Looks pretty nice under my Linux Mint 17 box.

[
 ![View Website Page in PDF](http://www.tecmint.com/wp-content/uploads/2012/10/View-Website-Page-in-PDF.png) 
][5]

View Website Page in PDF

#### Create TOC (Table Of Content) of a Page to PDF

To create a table of content for a **PDF** file, use the option as **toc**.

```
$ wkhtmltopdf toc http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/ 10-Sudo-Configurations.pdf
```

##### Sample Output :

```
Loading pages (1/6)
Counting pages (2/6)
Loading TOC (3/6)
Resolving links (4/6)
Loading headers and footers (5/6)
Printing pages (6/6)
Done
```

To check the **TOC** for the created file, again use evince program.

```
$ evince 10-Sudo-Configurations.pdf
```

##### Sample Screenshot :

Take a look at the picture below. it looks even more better than the above.

[
 ![Create Website Page to Table of Contents in PDF](http://www.tecmint.com/wp-content/uploads/2012/10/Create-Website-Page-Table-of-Contents-in-PDF.png) 
][6]

Create Website Page to Table of Contents in PDF

#### Wkhtmltopdf Options and Usage

For **Wkhtmltopdf** more usage and options, use the following help command. It will display list of all available options that you can use with it.

```
$ wkhtmltopdf --help
```

--------------------------------------------------------------------------------

作者简介：

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------

via: http://www.tecmint.com/wkhtmltopdf-convert-website-html-page-to-pdf-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[2]:http://wkhtmltopdf.org/downloads.html
[3]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[4]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2012/10/View-Website-Page-in-PDF.png
[6]:http://www.tecmint.com/wp-content/uploads/2012/10/Create-Website-Page-Table-of-Contents-in-PDF.png
