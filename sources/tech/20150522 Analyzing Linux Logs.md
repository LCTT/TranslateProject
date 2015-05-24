translating by zhangboyue
Analyzing Linux Logs
================================================================================
There’s a great deal of information waiting for you within your logs, although it’s not always as easy as you’d like to extract it. In this section we will cover some examples of basic analysis you can do with your logs right away (just search what’s there). We’ll also cover more advanced analysis that may take some upfront effort to set up properly, but will save you time on the back end. Examples of advanced analysis you can do on parsed data include generating summary counts, filtering on field values, and more.

We’ll show you first how to do this yourself on the command line using several different tools and then show you how a log management tool can automate much of the grunt work and make this so much more streamlined.

### Searching with Grep ###

Searching for text is the most basic way to find what you’re looking for. The most common tool for searching text is [grep][1]. This command line tool, available on most Linux distributions, allows you to search your logs using regular expressions. A regular expression is a pattern written in a special language that can identify matching text. The simplest pattern is to put the string you’re searching for surrounded by quotes

#### Regular Expressions ####

Here’s an example to find authentication logs for “user hoover” on an Ubuntu system:

    $ grep "user hoover" /var/log/auth.log
    Accepted password for hoover from 10.0.2.2 port 4792 ssh2
    pam_unix(sshd:session): session opened for user hoover by (uid=0)
    pam_unix(sshd:session): session closed for user hoover

It can be hard to construct regular expressions that are accurate. For example, if we searched for a number like the port “4792” it could also match timestamps, URLs, and other undesired data. In the below example for Ubuntu, it matched an Apache log that we didn’t want.

    $ grep "4792" /var/log/auth.log
    Accepted password for hoover from 10.0.2.2 port 4792 ssh2
    74.91.21.46 - - [31/Mar/2015:19:44:32 +0000] "GET /scripts/samples/search?q=4972HTTP/1.0" 404 545 "-" "-”

#### Surround Search ####

Another useful tip is that you can do surround search with grep. This will show you what happened a few lines before or after a match. It can help you debug what lead up to a particular error or problem. The B flag gives you lines before, and A gives you lines after. For example, we can see that when someone failed to login as an admin, they also failed the reverse mapping which means they might not have a valid domain name. This is very suspicious!

    $ grep -B 3 -A 2 'Invalid user' /var/log/auth.log
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: reverse mapping checking getaddrinfo for 216-19-2-8.commspeed.net [216.19.2.8] failed - POSSIBLE BREAK-IN ATTEMPT!
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Invalid user admin from 216.19.2.8
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: input_userauth_request: invalid user admin [preauth]
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]

#### Tail ####

You can also pair grep with [tail][2] to get the last few lines of a file, or to follow the logs and print them in real time. This is useful if you are making interactive changes like starting a server or testing a code change.

    $ tail -f /var/log/auth.log | grep 'Invalid user'
    Apr 30 19:49:48 ip-172-31-11-241 sshd[6512]: Invalid user ubnt from 219.140.64.136
    Apr 30 19:49:49 ip-172-31-11-241 sshd[6514]: Invalid user admin from 219.140.64.136

A full introduction on grep and regular expressions is outside the scope of this guide, but [Ryan’s Tutorials][3] include more in-depth information.

Log management systems have higher performance and more powerful searching abilities. They often index their data and parallelize queries so you can quickly search gigabytes or terabytes of logs in seconds. In contrast, this would take minutes or in extreme cases hours with grep. Log management systems also use query languages like [Lucene][4] which offer an easier syntax for searching on numbers, fields, and more.

### Parsing with Cut, AWK, and Grok ###

#### Command Line Tools ####

Linux offers several command line tools for text parsing and analysis. They are great if you want to quickly parse a small amount of data but can take a long time to process large volumes of data

#### Cut ####

The [cut][5] command allows you to parse fields from delimited logs. Delimiters are characters like equal signs or commas that break up fields or key value pairs.

Let’s say we want to parse the user from this log:

    pam_unix(su:auth): authentication failure; logname=hoover uid=1000 euid=0 tty=/dev/pts/0 ruser=hoover rhost=  user=root

We can use the cut command like this to get the text after the eighth equal sign. This example is on an Ubuntu system:

    $ grep "authentication failure" /var/log/auth.log | cut -d '=' -f 8
    root
    hoover
    root
    nagios
    nagios

#### AWK ####

Alternately, you can use [awk][6], which offers more powerful features to parse out fields. It offers a scripting language so you can filter out nearly everything that’s not relevant.

For example, let’s say we have the following log line on an Ubuntu system and we want to extract the username that failed to login:

    Mar 24 08:28:18 ip-172-31-11-241 sshd[32701]: input_userauth_request: invalid user guest [preauth]

Here’s how you can use the awk command. First, put a regular expression /sshd.*invalid user/ to match the sshd invalid user lines. Then print the ninth field using the default delimiter of space using { print $9 }. This outputs the usernames.

    $ awk '/sshd.*invalid user/ { print $9 }' /var/log/auth.log
    guest
    admin
    info
    test
    ubnt

You can read more about how to use regular expressions and print fields in the [Awk User’s Guide][7].

#### Log Management Systems ####

Log management systems make parsing easier and enable users to quickly analyze large collections of log files. They can automatically parse standard log formats like common Linux logs or web server logs. This saves a lot of time because you don’t have to think about writing your own parsing logic when troubleshooting a system problem.

Here you can see an example log message from sshd which has each of the fields remoteHost and user parsed out. This is a screenshot from Loggly, a cloud-based log management service.

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.25.09-AM.png)

You can also do custom parsing for non-standard formats. A common tool to use is [Grok][8] which uses a library of common regular expressions to parse raw text into structured JSON. Here is an example configuration for Grok to parse kernel log files inside Logstash:

    filter{
      grok  {
        match => {"message" => "%{CISCOTIMESTAMP:timestamp} %{HOST:host} %{WORD:program}%{NOTSPACE} %{NOTSPACE}%{NUMBER:duration}%{NOTSPACE} %{GREEDYDATA:kernel_logs}"
      }
    }

And here is what the parsed output looks like from Grok:

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.30.37-AM.png)

### Filtering with Rsyslog and AWK ###

Filtering allows you to search on a specific field value instead of doing a full text search. This makes your log analysis more accurate because it will ignore undesired matches from other parts of the log message. In order to search on a field value, you need to parse your logs first or at least have a way of searching based on the event structure.

#### How to Filter on One App ####

Often, you just want to see the logs from just one application. This is easy if your application always logs to a single file. It’s more complicated if you need to filter one application among many in an aggregated or centralized log. Here are several ways to do this:

1. Use the rsyslog daemon to parse and filter logs. This example writes logs from the sshd application to a file named sshd-messages, then discards the event so it’s not repeated elsewhere. You can try this example by adding it to your rsyslog.conf file.

    :programname, isequal, “sshd” /var/log/sshd-messages
    &~

2. Use command line tools like awk to extract the values of a particular field like the sshd username. This example is from an Ubuntu system.

    $ awk '/sshd.*invalid user/ { print $9 }' /var/log/auth.log
    guest
    admin
    info
    test
    ubnt

3. Use a log management system that automatically parses your logs, then click to filter on the desired application name. Here is a screenshot showing the syslog fields in a log management service called Loggly. We are filtering on the appName “sshd” as indicated by the Venn diagram icon.

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.05.02-AM.png)

#### How to Filter on Errors ####

One of the most common thing people want to see in their logs is errors. Unfortunately, the default syslog configuration doesn’t output the severity of errors directly, making it difficult to filter on them.

There are two ways you can solve this problem. First, you can modify your rsyslog configuration to output the severity in the log file to make it easier to read and search. In your rsyslog configuration you can add a [template][9] with pri-text such as the following:

    "<%pri-text%> : %timegenerated%,%HOSTNAME%,%syslogtag%,%msg%n"

This example gives you output in the following format. You can see that the severity in this message is err.

    <authpriv.err> : Mar 11 18:18:00,hoover-VirtualBox,su[5026]:, pam_authenticate: Authentication failure

You can use awk or grep to search for just the error messages. In this example for Ubuntu, we’re including some surrounding syntax like the . and the > which match only this field.

    $ grep '.err>' /var/log/auth.log
    <authpriv.err> : Mar 11 18:18:00,hoover-VirtualBox,su[5026]:, pam_authenticate: Authentication failure

Your second option is to use a log management system. Good log management systems automatically parse syslog messages and extract the severity field. They also allow you to filter on log messages of a certain severity with a single click.

Here is a screenshot from Loggly showing the syslog fields with the error severity highlighted to show we are filtering for errors:

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.00.36-AM.png)

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/analyzing-linux-logs/

作者：[Jason Skowronski][a] [Amy Echeverri][b] [ Sadequl Hussain][c]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linkedin.com/in/jasonskowronski
[b]:https://www.linkedin.com/in/amyecheverri
[c]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:http://linux.die.net/man/1/grep
[2]:http://linux.die.net/man/1/tail
[3]:http://ryanstutorials.net/linuxtutorial/grep.php
[4]:https://lucene.apache.org/core/2_9_4/queryparsersyntax.html
[5]:http://linux.die.net/man/1/cut
[6]:http://linux.die.net/man/1/awk
[7]:http://www.delorie.com/gnu/docs/gawk/gawk_26.html#IDX155
[8]:http://logstash.net/docs/1.4.2/filters/grok
[9]:http://www.rsyslog.com/doc/v8-stable/configuration/templates.html
