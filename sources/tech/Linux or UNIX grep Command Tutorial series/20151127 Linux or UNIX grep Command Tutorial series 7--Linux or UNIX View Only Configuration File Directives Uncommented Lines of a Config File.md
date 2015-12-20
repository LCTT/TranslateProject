Linux / UNIX View Only Configuration File Directives ( Uncommented Lines of a Config File )
================================================================================
Most Linux and UNIX-like system configuration files are documented using comments, but some time I just need to see line of configuration text in a config file. How can I view just the uncommented configuration file directives from squid.conf or httpd.conf file? How can I strip out comments and blank lines on a Linux or Unix-like systems?

To view just the uncommented lines of text in a config file use the grep, sed, awk, perl or any other text processing utility provided by UNIX / BSD / OS X / Linux operating systems.

### grep command example to strip out command ###

You can use the gerp command as follows:

    $ grep -v "^#" /path/to/config/file
    $ grep -v "^#" /etc/apache2/apache2.conf

Sample outputs:

    ServerRoot "/etc/apache2"
     
    LockFile /var/lock/apache2/accept.lock
     
    PidFile ${APACHE_PID_FILE}
     
    Timeout 300
     
    KeepAlive On
     
    MaxKeepAliveRequests 100
     
    KeepAliveTimeout 15
     
     
    <IfModule mpm_prefork_module>
        StartServers          5
        MinSpareServers       5
        MaxSpareServers      10
        MaxClients          150
        MaxRequestsPerChild   0
    </IfModule>
     
    <IfModule mpm_worker_module>
        StartServers          2
        MinSpareThreads      25
        MaxSpareThreads      75
        ThreadLimit          64
        ThreadsPerChild      25
        MaxClients          150
        MaxRequestsPerChild   0
    </IfModule>
     
    <IfModule mpm_event_module>
        StartServers          2
        MaxClients          150
        MinSpareThreads      25
        MaxSpareThreads      75
        ThreadLimit          64
        ThreadsPerChild      25
        MaxRequestsPerChild   0
    </IfModule>
    
    User ${APACHE_RUN_USER}
    Group ${APACHE_RUN_GROUP}
     
     
    AccessFileName .htaccess
     
    <Files ~ "^\.ht">
        Order allow,deny
        Deny from all
        Satisfy all
    </Files>
     
    DefaultType text/plain
     
     
    HostnameLookups Off
     
    ErrorLog /var/log/apache2/error.log
     
    LogLevel warn
     
    Include /etc/apache2/mods-enabled/*.load
    Include /etc/apache2/mods-enabled/*.conf
     
    Include /etc/apache2/httpd.conf
     
    Include /etc/apache2/ports.conf
     
    LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
    LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %O" common
    LogFormat "%{Referer}i -> %U" referer
    LogFormat "%{User-agent}i" agent
     
    CustomLog /var/log/apache2/other_vhosts_access.log vhost_combined
     
     
     
    Include /etc/apache2/conf.d/
     
    Include /etc/apache2/sites-enabled/

To suppress blank lines use [egrep command][1], run:

    egrep -v "^#|^$" /etc/apache2/apache2.conf
    ## or pass it to the page such as more or less ##
    egrep -v "^#|^$" /etc/apache2/apache2.conf | less
     
    ## Bash function ######################################
    ## or create function or alias and use it as follows ##
    ## viewconfig /etc/squid/squid.conf                  ##
    #######################################################
    viewconfig(){
       local f="$1"
       [ -f "$1" ] && command egrep -v "^#|^$" "$f" || echo "Error $1 file not found."
    }

Sample output:

![Fig.01: Unix/Linux Egrep Strip Out Comments Blank Lines](http://s0.cyberciti.org/uploads/faq/2008/05/grep-strip-out-comments-blank-lines.jpg)

Fig.01: Unix/Linux Egrep Strip Out Comments Blank Lines

### Understanding grep/egrep command line options ###

The -v option invert the sense of matching, to select non-matching lines. This option should work under all posix based systems. The regex ^$ matches and removes all blank lines and ^# matches and removes all comments that starts with a "#".

### sed Command example ###

GNU / sed command can be used as follows:

    $ sed '/ *#/d; /^ *$/d' /path/to/file
    $ sed '/ *#/d; /^ *$/d' /etc/apache2/apache2.conf

GNU or BSD sed can update your config file too. The syntax is as follows to edit files in-place, saving backups with the specified extension such as .bak:

    sed -i'.bak.2015.12.27' '/ *#/d; /^ *$/d' /etc/apache2/apache2.conf

For more info see man pages - [grep(1)][2], [sed(1)][3]

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/shell-display-uncommented-lines-only/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/grep-regular-expressions/
[2]:http://www.manpager.com/linux/man1/grep.1.html
[3]:http://www.manpager.com/linux/man1/sed.1.html