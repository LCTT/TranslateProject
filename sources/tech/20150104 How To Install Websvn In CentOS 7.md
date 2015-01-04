How To Install Websvn In CentOS 7
================================================================================
**WebSVN** offers a view onto your subversion repositories that’s been designed to reflect the Subversion methodology. You can view the log of any file or directory and see a list of all the files changed, added or deleted in any given revision. You can also view the differences between two versions of a file so as to see exactly what was changed in a particular revision.

### Features ###

WebSVN offers the following features:

- Easy to use interface;
- Customisable templating system;
- Colourisation of file listings;
- Blame view;
- Log message searching;
- RSS feed support.

### Installation ###

I use the following link to install Subversion on CentOS 7.

- [How To install Subversion On CentOS 7][1]

**1 – Download the websvn to /var/www/html.**

    cd /var/www/html

----------

    wget http://websvn.tigris.org/files/documents/1380/49057/websvn-2.3.3.zip

**2 – Extract the zip package.**

    unzip websvn-2.3.3.zip

----------

    mv websvn-2.3.3 websvn

**3 – Installl php to your system.**

    yum install php

**4 – Edit web svn config.**

    cd /var/www/html/websvn/include

----------

    cp distconfig.php config.php

----------

    vi config.php

----------

    // Configure these lines if your commands aren't on your path.
    //
     $config->setSVNCommandPath('/usr/bin'); // e.g. c:\\program files\\subversion\\bin
     $config->setDiffPath('/usr/bin');
----------
    // For syntax colouring, if option enabled...
     $config->setEnscriptPath('/usr/bin');
     $config->setSedPath('/bin');
----------
    // For delivered tarballs, if option enabled...
     $config->setTarPath('/bin');
----------
    // For delivered GZIP'd files and tarballs, if option enabled...
     $config->setGZipPath('/bin');
----------
    //
     $config->parentPath('/svn/');
----------
    $extEnscript[".pl"] = "perl";
    $extEnscript[".py"] = "python";
    $extEnscript[".sql"] = "sql";
    $extEnscript[".java"] = "java";
    $extEnscript[".html"] = "html";
    $extEnscript[".xml"] = "html";
    $extEnscript[".thtml"] = "html";
    $extEnscript[".tpl"] = "html";
    $extEnscript[".sh"] = "bash";
    ~

save and exit.

**6 – Reload apache and start websvn link http://ip/websvn.**

![websvn](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/websvn.png)

That’s it.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-websvn-centos-7/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
[1]:http://www.unixmen.com/install-subversion-centos-7/
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