Install AWFFull web server log analysis application on ubuntu 17.10
======


AWFFull is a web server log analysis program based on "The Webalizer".AWFFull produces usage statistics in HTML format for viewing with a browser. The results are presented in both columnar and graphical format, which facilitates interpretation. Yearly, monthly, daily and hourly usage statistics are presented, along with the ability to display usage by site, URL, referrer, user agent (browser), user name,search strings, entry/exit pages, and country (some information may not be available if not present in the log file being processed).



AWFFull supports CLF (common log format) log files, as well as Combined log formats as defined by NCSA and others, and variations of these which it attempts to handle intelligently. In addition, AWFFull also supports wu-ftpd xferlog formatted log files, allowing analysis of ftp servers, and squid proxy logs. Logs may also be compressed, via gzip.

AWFFull is a web server log analysis program based on "The Webalizer".AWFFull produces usage statistics in HTML format for viewing with a browser. The results are presented in both columnar and graphical format, which facilitates interpretation. Yearly, monthly, daily and hourly usage statistics are presented, along with the ability to display usage by site, URL, referrer, user agent (browser), user name,search strings, entry/exit pages, and country (some information may not be available if not present in the log file being processed).AWFFull supports CLF (common log format) log files, as well as Combined log formats as defined by NCSA and others, and variations of these which it attempts to handle intelligently. In addition, AWFFull also supports wu-ftpd xferlog formatted log files, allowing analysis of ftp servers, and squid proxy logs. Logs may also be compressed, via gzip.

If a compressed log file is detected, it will be automatically uncompressed while it is read. Compressed logs must have the standard gzip extension of .gz.

### Changes from Webalizer

AWFFull is based on the Webalizer code and has a number of large and small changes. These include:

o Beyond the raw statistics: Making use of published formulae to provide additional insights into site usage.

o GeoIP IP Address look-ups for more accurate country detection.

o Resizable graphs.

o Integration with GNU gettext allowing for ease of translations.Currently 32 languages are supported.

o Display more than 12 months of the site history on the front page.

o Additional page count tracking and sort by same.

o Some minor visual tweaks, including Geolizer's use of Kb, Mb etc for Volumes.

o Additional Pie Charts for URL counts, Entry and Exit Pages, and Sites.

o Horizontal lines on graphs that are more sensible and easier to read.

o User Agent and Referral tracking is now calculated via PAGES not HITS.

o GNU style long command line options are now supported (eg --help).

o Can choose what is a page by excluding "what isn't" vs the original "what is" method.

o Requests to the site being analysed are displayed with the matching referring URL.

o A Table of 404 Errors, and the referring URL can be generated.

o An external CSS file can be used with the generated html.

o Manual performance optimisation of the config file is now easier with a post analysis summary output.

o Specified IP's & Addresses can be assigned to a given country.

o Additional Dump options for detailed analysis with other tools.

o Lotus Domino v6 logs are now detected and processed.

**Install awffull on ubuntu 17.10**

> sudo apt-get install awffull

### Configuring AWFFULL

You have to edit awffull config file at /etc/awffull/awffull.conf. If you have multiple virtual websites running in the same machine, you can make several copies of the default config file.

> sudo vi /etc/awffull/awffull.conf

Make sure the following lines are there

> LogFile /var/log/apache2/access.log.1
>  OutputDir /var/www/html/awffull

Save and exit the file

You can run the awffull config using the following command

> awffull -c [your config file name]

This will create all the required files under /var/www/html/awffull directory so you can access your webserver stats using http://serverip/awffull/

You should see similar to the following screen

If you have more site and you can automate the process using shell script and cron job.


--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-awffull-web-server-log-analysis-application-on-ubuntu-17-10.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
