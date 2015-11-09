How to Set Up AWStats On Ubuntu Server
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/10/Apache_awstats_featured.jpg)

AWStats is an open-source Web analytics reporting tool that generates advanced web, streaming, FTP or mail server statistics graphically. This log analyser works as a CGI or from command line and shows you all the possible information your log contains in a few graphical web pages. It uses a partial information file to be able to process large log files often and quickly. It supports most web server log file formats including Apache, IIS and many other web server log formats.

This article will help you to install and configure AWStats on Ubuntu.

### Install AWStats Package ###

By default, AWStats package is available in the Ubuntu repository.

You can install it by running:

    sudo apt-get install awstats

Next you will need to enable the CGI module in Apache.

You can do this by running:

    sudo a2enmod cgi

Now, restart Apache to reflect the changes.

    sudo /etc/init.d/apache2 restart

### Configure AWStats ###

You need to create a configuration file for each domain or website you wish to view statistics for. In this example we will create a configuration file for “test.com“.

You can do this by duplicating the AWStats default configuration file to one with your domain name.

    sudo cp /etc/awstats/awstats.conf /etc/awstats/awstats.test.com.conf

Now, you need to make some changes in the config file:

    sudo nano /etc/awstats/awstats.test.com.conf

Update the settings shown below:

    # Change to Apache log file, by default it's /var/log/apache2/access.log
    LogFile="/var/log/apache2/access.log"
     
    # Change to the website domain name
    SiteDomain="test.com"
    HostAliases="www.test.com localhost 127.0.0.1"
     
    # When this parameter is set to 1, AWStats adds a button on report page to allow to "update" statistics from a web browser
    AllowToUpdateStatsFromBrowser=1

Save and close the file.

After these changes, you need to build your initial statistics which will be generated from the current logs on your server. You can do this using:

    sudo /usr/lib/cgi-bin/awstats.pl -config=test.com -update

The output will look something like this:

![awtstats](https://www.maketecheasier.com/assets/uploads/2015/10/awtstats.png)

### Configure Apache For AWStats ###

Next, you need to configure Apache2 to show these stats. Now copy the content of the “cgi-bin” folder to the default document root directory of your Apache installation. By default, this is in the “/usr/lib/cgi-bin” folder.

You can do this by running:

    sudo cp -r /usr/lib/cgi-bin /var/www/html/
    sudo  chown www-data:www-data /var/www/html/cgi-bin/
    sudo chmod -R 755 /var/www/html/cgi-bin/

### Test AWStats ###

Now you can access your AWStats by visiting the url “http://your-server-ip/cgi-bin/awstats.pl?config=test.com.”
It will show you a results page like this:

![awstats_page](https://www.maketecheasier.com/assets/uploads/2015/10/awstats_page.jpg)

### Set Up Cron to Update Logs ###

It is recommended to schedule a cron job to regularly update the AWStats database using newly created log entries, so the stats get updated on a regular basis. This will also save your time.

To do this you need to edit the “/etc/crontab” file:

    sudo nano /etc/crontab

Add the following line that tells AWStats to update every ten minutes.

    */10 * * * * root /usr/lib/cgi-bin/awstats.pl -config=test.com -update

Save and close the file.

### Conclusion ###

AWStats is a very useful tool that can give you an overview of what is happening on your website and assist with site analysis. It is very easy to install and configure. Feel free to comment below if you have any questions.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/set-up-awstats-ubuntu/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/