[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Analyze your web server log files with this Python tool)
[#]: via: (https://opensource.com/article/20/7/python-lars)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

Analyze your web server log files with this Python tool
======
This Python module can collect website usage logs in multiple formats
and output well structured data for analysis.
![Person standing in front of a giant computer screen with numbers, data][1]

Ever wanted to know how many visitors you've had to your website? Or which pages, articles, or downloads are the most popular? If you're self-hosting your blog or website, whether you use Apache, Nginx, or even Microsoft IIS (yes, really), [lars][2] is here to help.

Lars is a web server-log toolkit for [Python][3]. That means you can use Python to parse log files retrospectively (or in real time) using simple code, and do whatever you want with the data—store it in a database, save it as a CSV file, or analyze it right away using more Python.

Lars is another hidden gem written by [Dave Jones][4]. I first saw Dave present lars at a local Python user group. Then a few years later, we started using it in the [piwheels][5] project to read in the Apache logs and insert rows into our Postgres database. In real time, as Raspberry Pi users download Python packages from [piwheels.org][6], we log the filename, timestamp, system architecture (Arm version), distro name/version, Python version, and so on. Since it's a relational database, we can join these results on other tables to get more contextual information about the file.

You can install lars with:


```
`$ pip install lars`
```

On some systems, the right route will be [ `sudo` ] `pip3 install lars`.

To get started, find a single web access log and make a copy of it. You'll want to download the log file onto your computer to play around with it. I'm using Apache logs in my examples, but with some small (and obvious) alterations, you can use Nginx or IIS. On a typical web server, you'll find Apache logs in `/var/log/apache2/` then usually `access.log` , `ssl_access.log` (for HTTPS), or gzipped rotated logfiles like `access-20200101.gz` or `ssl_access-20200101.gz` .

First of all, what does a log entry look like?

```
81.174.152.222 - - [30/Jun/2020:23:38:03 +0000] "GET / HTTP/1.1" 200 6763 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0"
```


    This is a request showing the IP address of the origin of the request, the timestamp, the requested file path (in this case / , the homepage, the HTTP status code, the user agent (Firefox on Ubuntu), and so on.


    Your log files will be full of entries like this, not just every single page hit, but every file and resource served—every CSS stylesheet, JavaScript file and image, every 404, every redirect, every bot crawl. To get any sensible data out of your logs, you need to parse, filter, and sort the entries. That's what lars is for. This example will open a single log file and print the contents of every row:

    [code]

```
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            print(row)
```

    
```
Which will show results like this for every log entry:
```

```
Row(remote_host=IPv4Address('81.174.152.222'), ident=None, remote_user=None, time=DateTime(2020, 6, 30, 23, 38, 3), request=Request(method='GET', url=Url(scheme='', netloc='', path_str='/', params='', query_str='', fragment=''), protocol='HTTP/1.1'), status=200, size=6763)
```


    It's parsed the log entry and put the data into a structured format. The entry has become a namedtuple with attributes relating to the entry data, so for example, you can access the status code with row.status and the path with row.request.url.path_str:

    [code]

```

```

```
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            print(f'hit {row.request.url.path_str} with status code {row.status}')
```

    
```
If you wanted to show only the 404s, you could do:

[code]
```

with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            if row.status == 404:
                print(row.request.url.path_str)

```

```


    You might want to de-duplicate these and print the number of unique pages with 404s:

    [code]

```
s = set()
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            if row.status == 404:
                s.add(row.request.url.path_str)
print(len(s))
```

    
```
Dave and I have been working on expanding piwheels' logger to include web-page hits, package searches, and more, and it's been a piece of cake, thanks to lars. It's not going to tell us any answers about our users—we still have to do the data analysis, but it's taken an awkward file format and put it into our database in a way we can make use of it.


Check out lars' documentation to see how to read Apache, Nginx, and IIS logs, and learn what else you can do with it. Thanks, yet again, to Dave for another great tool!
```

* * *

```
This originally appeared on Ben Nuttall's Tooling Blog and is republished with permission.
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/python-lars

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://lars.readthedocs.io/en/latest/
[3]: https://opensource.com/resources/python
[4]: https://twitter.com/waveform80/
[5]: https://opensource.com/article/18/10/piwheels-python-raspberrypi
[6]: http://piwheels.org
