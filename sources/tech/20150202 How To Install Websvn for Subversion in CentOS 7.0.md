Translating----geekpi

How To Install Websvn for Subversion in CentOS 7.0
================================================================================
Hi all, today we'll be installing latest WebSVN in our CentOS 7 for subversion repositories.

WebSVN offers a view onto your subversion repositories that’s been designed to reflect the Subversion methodology. We can view the log of any file or directory and see a list of all the files changed, added or deleted in any given revision. We can also view the differences between two versions of a file so as to see exactly what was changed in a particular revision.

### Features ###

WebSVN offers the following features:

- Easy to use interface
- Customisable templating system
- Colourisation of file listings
- Blame view
- Log message searching
- RSS feed support
- [and more...][1]

Since it's written using PHP, WebSVN is also very portable and easy to install.

Now, we'll install WebSVN for our Subversion (Apache SVN). Make sure that you have installed Apache SVN in your server. If you don't have it installed, you can install from this tutorial.

After you installed Apache SVN(Subversion), you'll need to follow the easy steps below.

### 1. Download WebSVN ###

You can  download WebSVN from their official site http://www.websvn.info/download/ . We'll first get inside directory /var/www/html/ and then download the package inside it.

    $ sudo -s

**Please execute the above command in a shell or terminal as wee'll need to switch to root privilege so that we'll have full access to the system's restricted areas.**

    # cd /var/www/html
    # wget http://websvn.tigris.org/files/documents/1380/49057/websvn-2.3.3.zip

![downloading websvn package](http://blog.linoxide.com/wp-content/uploads/2015/01/downloading-websvn.png)

Here, I am download the latest version 2.3.3 of websvn. You can get the link from the site. You can simply replace the above link with the link of the package you wanna install.

### 2. Extract the downloaded zip ###

    # unzip websvn-2.3.3.zip

    # mv websvn-2.3.3 websvn

![extracting websvn](http://blog.linoxide.com/wp-content/uploads/2015/01/extracting-websvn.png)

### 3. Install php ###

    # yum install php

![yum install php](http://blog.linoxide.com/wp-content/uploads/2015/01/yum-install-php.png)

### 4. Edit WebSVN config ###

Now, we'll need to copy distconfig.php which is situated inside /var/www/html/websvn/include directory to config.php and then edit the configuration file.

    # cd /var/www/html/websvn/include

    # cp distconfig.php config.php

    # nano config.php

Now, we'll need to make changes to the file as shown below. After it is done, please save the file and exit.

    // Configure these lines if your commands aren't on your path.
    //
     $config->setSVNCommandPath('/usr/bin'); // e.g. c:\\program files\\subversion\\bin
     $config->setDiffPath('/usr/bin');
    
    // For syntax colouring, if option enabled...
     $config->setEnscriptPath('/usr/bin');
     $config->setSedPath('/bin');
    
    // For delivered tarballs, if option enabled...
     $config->setTarPath('/bin');
    
    // For delivered GZIP'd files and tarballs, if option enabled...
     $config->setGZipPath('/bin');
    
    //
     $config->parentPath('/svn/');
    
    $extEnscript[".pl"] = "perl";
    $extEnscript[".py"] = "python";
    $extEnscript[".sql"] = "sql";
    $extEnscript[".java"] = "java";
    $extEnscript[".html"] = "html";
    $extEnscript[".xml"] = "html";
    $extEnscript[".thtml"] = "html";
    $extEnscript[".tpl"] = "html";
    $extEnscript[".sh"] = "bash";

![websvn config file](http://blog.linoxide.com/wp-content/uploads/2015/01/config-file-websvn.png)

### 5. Starting WebSVN ###

Now, we are almost done. We now need to restart our Apache server. You can do that by the command below.

    # systemctl restart httpd.service

And then, we'll open WebSVN inside our favorite browser with the address as http://Ip-address/websvn or if you are on local computer, you can goto http://localhost/websvn .

![websvn successfully installed](http://blog.linoxide.com/wp-content/uploads/2015/01/websvn-success.png)

**Note**: If you encountered error like "Unable to find "enscript" tool at location "/usr/bin/enscript"" then, you'll need to install enscript using the command "yum install enscript" which will fix the problem.

### Conclusion ###

Hurray, we have completed installing WebSVN in our CentOS 7 server. This tutorial works great on RHEL 7 too. WebSVN offers a view onto your subversion repositories that’s been designed to reflect the subversion methodology. You can view the log of any file or directory and see a list of all the files changed, added or deleted in any given revision. So, if you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy WebSVN :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-websvn-subversion-centos-7/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.websvn.info/features/
