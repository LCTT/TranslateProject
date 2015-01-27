25 Useful Apache ‘.htaccess’ Tricks to Secure and Customize Websites
================================================================================
Websites are important parts of our lives. They serve the means to expand businesses, share knowledge and lots more. Earlier restricted to providing only static contents, with introduction of dynamic client and server side scripting languages and continued advancement of existing static language like html to html5, adding every bit of dynamicity is possible to the websites and what left is expected to follow soon in near future.

With websites, comes the need of a unit that can display these websites to a huge set of audience all over the globe. This need is fulfilled by the servers that provide means to host a website. This includes a list of servers like: Apache HTTP Server, Joomla, and WordPress that allow one to host their websites.

![Apache htaccess Tricks](http://www.tecmint.com/wp-content/uploads/2015/01/htaccess-tricks.jpg)
25 htaccess Tricks

One who wants to host a website can create a local server of his own or can contact any of above mentioned or any another server administrator to host his website. But the actual issue starts from this point. Performance of a website depends mainly on following factors:

- Bandwidth consumed by the website.
- How secure is the website against hackers.
- Optimism when it comes to data search through the database
- User-friendliness when it comes to displaying navigation menus and providing more UI features.

Alongside this, various factors that govern success of servers in hosting websites are:

- Amount of data compression achieved for a particular website.
- Ability to simultaneously serve multiple clients asking for a same or different website.
- Securing the confidential data entered on the websites like: emails, credit card details and so on.
- Allowing more and more options to enhance dynamicity to a website.

This article deals with one such feature provided by the servers that help enhance performance of websites along with securing them from bad bots, hotlinks etc. i.e. ‘.htaccess‘ file.

### What is .htaccess? ###

htaccess (or hypertext access) are the files that provide options for website owners to control the server environment variables and other parameters to enhance functionality of their websites. These files can reside in any and every directory in the directory tree of the website and provide features to the directory and the files and folders inside it.

What are these features? Well these are the server directives i.e. the lines that instruct server to perform a specific task, and these directives apply only to the files and folders inside the folder in which this file is placed. These files are hidden by default as all Operating System and the web servers are configured to ignore them by default but making the hidden files visible can make you see this very special file. What type of parameters can be controlled is the topic of discussion of subsequent sections.

Note: If .htaccess file is placed in /apache/home/www/Gunjit/ directory then it will provide directives for all the files and folders in that directory, but if this directory contains another folder namely: /Gunjit/images/ which again has another .htaccess file then the directives in this folder will override those provided by the master .htaccess file (or file in the folder up in hierarchy).

### Apache Server and .htaccess files ###

Apache HTTP Server colloquially called Apache was named after a Native American Tribe Apache to respect its superior skills in warfare strategy. Build on C/C++ and XML it is cross-platform web server which is based on NCSA HTTPd server and has a key role in growth and advancement of World Wide Web.

Most commonly used on UNIX, Apache is available for wide variety of platforms including FreeBSD, Linux, Windows, Mac OS, Novel Netware etc. In 2009, Apache became the first server to serve more than 100 million websites.

Apache server has one .htaccess file per user in www/ directory. Although these files are hidden but can be made visible if required. In www/ directory there are a number of folders each pertaining to a website named on user’s or owner’s name. Apart from this you can have one .htaccess file in each folder which configured files in that folder as stated above.

How to configure htaccess file on Apache server is as follows…

### Configuration on Apache Server ###

There can be two cases:

#### Hosting website on own server ####

In this case, if .htaccess files are not enabled, you can enable .htaccess files by simply going to httpd.conf (Default configuration file for Apache HTTP Daemon) and finding the <Directories> section.

    <Directory "/var/www/htdocs">

And locate the line that says…

    AllowOverride None 

And correct it to.

    AllowOverride All

Now, on restarting Apache, .htaccess will work.

#### Hosting website on different hosting provider server ####

In this case it is better to consult the hosting admin, if they allow access to .htaccess files.

### 25 ‘.htaccess’ Tricks of Apache Web Server for Websites ###

#### 1. How to enable mod_rewrite in .htaccess file ####

mod_rewrite option allows you to use redirections and hiding your true URL with redirecting to some other URL. This option can prove very useful allowing you to replace the lengthy and long URL’s to short and easy to remember ones.

To allow mod_rewrite just have a practice to add the following line as the first line of your .htaccess file.

    Options +FollowSymLinks

This option allows you to follow symbolic links and thus enable the mod_rewrite option on the website. Replacing the URL with short and crispy one is presented later on.

#### 2. How to Allow or Deny Access to Websites ####

htaccess file can allow or deny access of website or a folder or files in the directory in which it is placed by using order, allow and deny keywords.

**Allowing access to only 192.168.3.1 IP**

    Order Allow, Deny
    Deny from All
    Allow from 192.168.3.1
    
    OR
    
    Order Allow, Deny
    Allow from 192.168.3.1

Order keyword here specifies the order in which allow, deny access would be processed. For the above ‘Order’ statement, the Allow statements would be processed first and then the deny statements would be processed.

**Denying access to only one IP Address**

The below lines provide the means to allow access of the website to all the users accept one with IP Address: 192.168.3.1.

    rder Allow, Deny
    Deny from 192.168.3.1
    Allow from All
    
    OR
    
    
    Order Deny, Allow
    Deny from 192.168.3.1

#### 3. Generate Apache Error documents for different error codes. ####

Using some simple lines, we can fix the error document that run on different error codes generated by the server when user/client requests a page not available on the website like most of us would have seen the ‘404 Page not found’ page in their web browser. ‘.htaccess’ files specify what action to take in case of such error conditions.

To do this, the following lines are needed to be added to the ‘.htaccess’ files:

    ErrorDocument <error-code> <path-of-document/string-representing-html-file-content>

‘ErrorDocument’ is a keyword, error-code can be any of 401, 403, 404, 500 or any valid error representing code and lastly, ‘path-of-document’ represents the path on the local machine (in case you are using your own local server) or on the server (in case you are using any other’s server to host your website).

**Example:**

    ErrorDocument 404 /error-docs/error-404.html

The above line sets the document ‘error-404.html’ placed in error-docs folder to be displayed in case the 404 error is reported by the server for any invalid request for a page by the client.

rrorDocument 404 "<html><head><title>404 Page not found</title></head><body><p>The page you request is not present. Check the URL you have typed</p></body></html>"

The above representation is also correct which places the string representing a usual html file.

#### 4. Setting/Unsetting Apache server environment variables ####

In .htaccess file you can set or unset the global environment variables that server allow to be modified by the hosters of the websites. For setting or unsetting the environment variables you need to add the following lines to your .htaccess files.

**Setting the Environment variables**

    SetEnv OWNER “Gunjit Khera”

Unsetting the Environment variables

    UnsetEnv OWNER

#### 5. Defining different MIME types for files ####

MIME (Multipurpose Internet Multimedia Extensions) are the types that are recognized by the browser by default when running any web page. You can define MIME types for your website in .htaccess files, so that different types of files as defined by you can be recognized and run by the server.

    <IfModule mod_mime.c>
    	AddType	application/javascript		js
    	AddType application/x-font-ttf		ttf ttc
    </IfModule>

Here, mod_mime.c is the module for controlling definitions of different MIME types and if you have this module installed on your system then you can use this module to define different MIME types for different extensions used in your website so that server can understand them.

#### 6. How to Limit the size of Uploads and Downloads in Apache ####

.htaccess files allow you the feature to control the amount of data being uploaded or downloaded by a particular client from your website. For this you just need to append the following lines to your .htaccess file:

    php_value upload_max_filesize 20M
    php_value post_max_size 20M
    php_value max_execution_time 200
    php_value max_input_time 200

The above lines set maximum upload size, maximum size of data being posted, maximum execution time i.e. the maximum time the a user is allowed to execute a website on his local machine, maximum time constrain within on the input time.

#### 7. Making Users to download .mp3 and other files before playing on your website. ####

Mostly, people play songs on websites before downloading them to check the song quality etc. Being a smart seller you can add a feature that can come in very handy for you which will not let any user play songs or videos online and users have to download them for playing. This is very useful as online playing of songs and videos consumes a lot of bandwidth.

Following lines are needed to be added to be added to your .htaccess file:

    AddType application/octet-stream .mp3 .zip 

#### 8. Setting Directory Index for Website ####

Most of website developers would already know that the first page that is displayed i.e. the home page of a website is named as ‘index.html’ .Many of us would have seen this also. But how is this set?

.htaccess file provides a way to list a set of pages which would be scanned in order when a client requests to visit home page of the website and accordingly any one of the listed set of pages if found would be listed as the home page of the website and displayed to the user.

Following line is needed to be added to produce the desired effect.

    DirectoryIndex index.html index.php yourpage.php

The above line specifies that if any request for visiting the home page comes by any visitor then the above listed pages will be searched in order in the directory firstly: index.html which if found will be displayed as the sites home page, otherwise list will proceed to the next page i.e. index.php and so on till the last page you have entered in the list.

#### 9. How to enable GZip compression for Files to save site’s bandwidth. ####

This is a common observation that heavy sites generally run bit slowly than light weight sites that take less amount of space. This is just because for a heavy site it takes time to load the huge script files and images before displaying them on the client’s web browser.

This is a common mechanism that when a browser requests a web page, server provides the browser with that webpage and now to locally display that web page, the browser has to download that page and then run the script inside that page.

What GZip compression does here is saving the time required to serve a single customer thus increasing the bandwidth. The source files of the website on the server are kept in compressed form and when the request comes from a user then these files are transferred in compressed form which are then uncompressed and executed on the server. This improves the bandwidth constrain.

Following lines can allow you to compress the source files of your website but this requires mod_deflate.c module to be installed on your server.

    <IfModule mod_deflate.c>
    	AddOutputFilterByType DEFLATE text/plain
    	AddOutputFilterByType DEFLATE text/html
    	AddOutputFilterByType DEFLATE text/xml
    	AddOutputFilterByType DEFLATE application/html
    	AddOutputFilterByType DEFLATE application/javascript
    	AddOutputFilterByType DEFLATE application/x-javascript
    </IfModule>

#### 10. Playing with the File types. ####

There are certain conditions that the server assumes by default. Like: .php files are run on the server, similarly .txt files say for example are meant to be displayed. Like this we can make some executable cgi-scripts or files to be simply displayed as the source code on our website instead of being executed.

To do this observe the following lines from a .htaccess file.

    RemoveHandler cgi-script .php .pl .py
    AddType text/plain .php .pl .py

These lines tell the server that .pl (perl script), .php (PHP file) and .py (Python file) are meant to just be displayed and not executed as cgi-scripts.

#### 11. Setting the Time Zone for Apache server ####

The power and importance of .htaccess files can be seen by the fact that this can be used to set the Time Zone of the server accordingly. This can be done by setting a global Environment variable ‘TZ’ of the list of global environment variables that are provided by the server to each of the hosted website for modification.

Due to this reason only, we can see time on the websites (that display it) according to our time zone. May be some other person hosting his website on the server would have the timezone set according to the location where he lives.

Following lines set the Time Zone of the Server.

    SetEnv TZ India/Kolkata

#### 12. How to enable Cache Control on Website ####

A very interesting feature of browser, most have observed is that on opening one website simultaneously more than one time, the latter one opens fast as compared to the first time. But how is this possible? Well in this case, the browser stores some frequently visited pages in its cache for faster access later on.

But for how long? Well this answer depends on you i.e. on the time you set in your .htaccess file for Cache control. The .htaccess file can specify the amount of time for which the pages of website can stay in the browser’s cache and after expiration of time, it must revalidate i.e. pages would be deleted from the Cache and recreated the next time user visits the site.

Following lines implement Cache Control for your website.

    <FilesMatch "\.(ico|png|jpeg|svg|ttf)$">
    	Header Set Cache-Control "max-age=3600, public"
    </FilesMatch>
    <FilesMatch "\.(js|css)$">
    	Header Set Cache-Control "public"
    	Header Set Expires "Sat, 24 Jan 2015 16:00:00 GMT"
    </FilesMatch>

The above lines allow caching of the pages which are inside the directory in which .htaccess files are placed for 1 hour.

#### 13. Configuring a single file, the <files> option. ####

Usually the content in .htaccess files apply to all the files and folders inside the directory in which the file is placed, but you can also provide some special permissions to a special file, like denying access to that file only or so on.

For this you need to add <File> tag to your file in a way like this:

    <files conf.html="">
    Order allow, deny
    Deny from 188.100.100.0
    </files>

This is a simple case of denying a file ‘conf.html’ from access by IP 188.100.100.0, but you can add any or every feature described for .htaccess file till now including the features yet to be described to the file like: Cache-control, GZip compression.

This feature is used by most of the servers to secure .htaccess files which is the reason why we are not able to see the .htaccess files on the browsers. How the files are authenticated is demonstrated in subsequent heading.

#### 14. Enabling CGI scripts to run outside of cgi-bin folder. ####

Usually servers run CGI scripts that are located inside the cgi-bin folder but, you can enable running of CGI scripts located in your desired folder but just adding following lines to .htaccess file located in the desired folder and if not, then creating one, appending following lines:

    AddHandler cgi-script .cgi
    Options +ExecCGI

#### 15. How to enable SSI on Website with .htaccess ####

Server side includes as the name suggests would be related to something included at the server side. But what? Generally when we have many pages in our website and we have a navigation menu on our home page that displays links to other pages then, we can enable SSI (Server Size Includes) option that allows all the pages displayed in the navigation menu to be included with the home page completely.

The SSI allows inclusion of multiple pages as if content they contain is a part of a single page so that any editing needed to be done is done in one file only which saves a lot of disk space. This option is by default enabled on servers but for .shtml files.

In case you want to enable it for .html files you need to add following lines:

    AddHandler server-parsed .html

After this following in the html file would lead to SSI.

    <!--#inlcude virtual= “gk/document.html”-->

#### 16. How to Prevent website Directory Listing ####

To prevent any client being able to list the directories of the website on the server at his local machine add following lines to the file inside the directory you don’t want to get listed.

    Options -Indexes

#### 17. Changing Default charset and language headers. ####

.htaccess files allow you to modify the character set used i.e. ASCII or UNICODE, UTF-8 etc. for your website along with the default language used for the display of content.

Following server’s global environment variables allow you to achieve above feature.

    AddDefaultCharset UTF-8
    DefaultLanguage en-US

**Re-writing URL’s: Redirection Rules**

Re-writing feature simply means replacing the long and un-rememberable URL’s with short and easy to remember ones. But, before going into this topic there are some rules and some conventions for special symbols used later on in this article.

**Special Symbols:**

    Symbol      	Meaning
    ^         -  	Start of the string
    $         -  	End of the String
    |         -  	Or [a|b] – a or b
    [a-z]     -  	Any of the letter between a to z
    +         -  	One or more occurrence of previous letter
    *         -  	Zero or more occurrence of previous letter
    ?         -  	Zero or one occurrence of previous letter

**Constants and their meaning:**

    Constant     	Meaning
    NC          -  	No-case or case sensitive
    L           -  	Last rule – stop processing further rules
    R           -  	Temporary redirect to new URL
    R=301       -  	Permanent redirect to new URL
    F           -  	Forbidden, send 403 header to the user
    P           -  	Proxy – grab remote content in substitution section and return it
    G           -  	Gone, no longer exists
    S=x         -  	Skip next x rules
    T=mime-type -  	Force specified MIME type
    E=var:value -  	Set environment variable var to value
    H=handler   -  	Set handler
    PT          -  	Pass through – in case of URL’s with additional headers.
    QSA         -  	Append query string from requested to substituted URL

#### 18. Redirecting a non-www URL to a www URL. ####

Before starting with the explanation, lets first see the lines that are needed to be added to .htaccess file to enable this feature.

    RewriteEngine ON
    RewriteCond %{HTTP_HOST} ^abc\.net$
    RewriteRule (.*) http://www.abc.net/$1 [R=301,L]

The above lines enable the Rewrite Engine and then in second line check all those URL’s that pertain to host abc.net or have the HTTP_HOST environment variable set to “abc.net”.

For all such URL’s the code permanently redirects them (as R=301 rule is enabled) to the new URL http://www.abc.net/$1 where $1 is the non-www URL having host as abc.net. The non-www URL is the one in bracket and is referred by $1.

#### 19. Redirecting entire website to https. ####

Following lines will help you transfer entire website to https:

    RewriteEngine ON
    RewriteCond %{HTTPS} !on
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

The above lines enable the re-write engine and then check the value of HTTPS environment variable. If it is on then re-write the entire pages of the website to https.

#### 20. A custom redirection example ####

For example, redirect url ‘http://www.abc.net?p=100&q=20 ‘ to ‘http://www.abc.net/10020pq’.

    RewriteEngine ON
    RewriteRule ^http://www.abc.net/([0-9]+)([0-9]+)pq$ ^http://www.abc.net?p=$1&q=$2

In above lines, $1 represents the first bracket and $2 represents the second bracket.

#### 21. Renaming the htaccess file ####

For preventing the .htaccess file from the intruders and other people from viewing those files you can rename that file so that it is not accessed by client’s browser. The line that does this is:

    AccessFileName	htac.cess

#### 22. How to Prevent Image Hotlinking for your Website ####

Another problem that is major factor of large bandwidth consumption by the websites is the problem of hot links which are links to your websites by other websites for display of images mostly of your website which consumes your bandwidth. This problem is also called as ‘bandwidth theft’.

A common observation is when a site displays the image contained in some other site due to this hot-linking your site needs to be loaded and at the stake of your site’s bandwidth, the other site’s images are displayed. To prevent this for like: images such as: .gif, .jpeg etc. following lines of code would help:

    RewriteEngine ON
    RewriteCond %{HTTP_REFERER} !^$
    RewriteCond %{HTTP_REFERERER} !^http://(www\.)?mydomain.com/.*$ [NC]
    RewriteRule \.(gif|jpeg|png)$ - [F].

The above lines check if the HTTP_REFERER is not set to blank or not set to any of the links in your websites. If this is happening then all the images in your page are replaced by 403 forbidden.

#### 23. How to Redirect Users to Maintenance Page. ####

In case your website is down for maintenance and you want to notify all your clients that need to access your websites about this then for such cases you can add following lines to your .htaccess websites that allow only admin access and replace the site pages having links to any .jpg, .css, .gif, .js etc.

    RewriteCond %{REQUEST_URI} !^/admin/ [NC]
    RewriteCond %{REQUEST_URI} !^((.*).css|(.*).js|(.*).png|(.*).jpg)	 [NC]
    RewriteRule ^(.*)$ /ErrorDocs/Maintainence_Page.html
    [NC,L,U,QSA]

These lines check if the Requested URL contains any request for any admin page i.e. one starting with ‘/admin/’ or any request to ‘.png, .jpg, .js, .css’ pages and for any such requests it replaces that page to ‘ErrorDocs/Maintainence_Page.html’.

#### 24. Mapping IP Address to Domain Name ####

Name servers are the servers that convert a specific IP Address to a domain name. This mapping can also be specified in the .htaccess files in the following manner.

    For Mapping L.M.N.O address to a domain name www.hellovisit.com
    RewriteCond %{HTTP_HOST} ^L\.M\.N\.O$ [NC]
    RewriteRule ^(.*)$ http://www.hellovisit.com/$1 [L,R=301]

The above lines check if the host for any page is having the IP Address as: L.M.N.O and if so the page is mapped to the domain name http://www.hellovisit.com by the third line by permanent redirection.

#### 25. FilesMatch Tag ####

Like <files> tag that is used to apply conditions to a single file, <FilesMatch> can be used to match to a group of files and apply some conditions to the group of files as below:

    <FilesMatch “\.(png|jpg)$”>
    Order Allow, Deny 
    Deny from All
    </FilesMatch>

### Conclusion ###

The list of tricks that can be done with .htaccess files is much more. Thus, this gives us an idea how powerful this file is and how much security and dynamicity and other features it can give to your website.

We’ve tried our best to cover as much as htaccess tricks in this article, but incase if we’ve missed any important trick, or you most welcome to post your htaccess ideas and tricks that you know via comments section below – we will include those in our article too…

--------------------------------------------------------------------------------

via: http://www.tecmint.com/apache-htaccess-tricks/

作者：[Gunjit Khera][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gunjitk94/