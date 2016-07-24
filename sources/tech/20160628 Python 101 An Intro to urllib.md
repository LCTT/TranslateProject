Python 101: An Intro to urllib
=================================

The urllib module in Python 3 is a collection of modules that you can use for working with URLs. If you are coming from a Python 2 background you will note that in Python 2 you had urllib and urllib2. These are now a part of the urllib package in Python 3. The current version of urllib is made up of the following modules:

- urllib.request
- urllib.error
- urllib.parse
- urllib.rebotparser

We will be covering each part individually except for urllib.error. The official documentation actually recommends that you might want to check out the 3rd party library, requests, for a higher-level HTTP client interface. However, I believe that it can be useful to know how to open URLs and interact with them without using a 3rd party and it may also help you appreciate why the requests package is so popular.

---

### urllib.request

The urllib.request module is primarily used for opening and fetching URLs. Let’s take a look at some of the things you can do with the urlopen function:

```
>>> import urllib.request
>>> url = urllib.request.urlopen('https://www.google.com/')
>>> url.geturl()
'https://www.google.com/'
>>> url.info()
<http.client.HTTPMessage object at 0x7fddc2de04e0>
>>> header = url.info()
>>> header.as_string()
('Date: Fri, 24 Jun 2016 18:21:19 GMT\n'
 'Expires: -1\n'
 'Cache-Control: private, max-age=0\n'
 'Content-Type: text/html; charset=ISO-8859-1\n'
 'P3P: CP="This is not a P3P policy! See '
 'https://www.google.com/support/accounts/answer/151657?hl=en for more info."\n'
 'Server: gws\n'
 'X-XSS-Protection: 1; mode=block\n'
 'X-Frame-Options: SAMEORIGIN\n'
 'Set-Cookie: '
 'NID=80=tYjmy0JY6flsSVj7DPSSZNOuqdvqKfKHDcHsPIGu3xFv41LvH_Jg6LrUsDgkPrtM2hmZ3j9V76pS4K_cBg7pdwueMQfr0DFzw33SwpGex5qzLkXUvUVPfe9g699Qz4cx9ipcbU3HKwrRYA; '
 'expires=Sat, 24-Dec-2016 18:21:19 GMT; path=/; domain=.google.com; HttpOnly\n'
 'Alternate-Protocol: 443:quic\n'
 'Alt-Svc: quic=":443"; ma=2592000; v="34,33,32,31,30,29,28,27,26,25"\n'
 'Accept-Ranges: none\n'
 'Vary: Accept-Encoding\n'
 'Connection: close\n'
 '\n')
>>> url.getcode()
200
```

Here we import our module and ask it to open Google’s URL. Now we have an HTTPResponse object that we can interact with. The first thing we do is call the geturl method which will return the URL of the resource that was retrieved. This is useful for finding out if we followed a redirect.

Next we call info, which will return meta-data about the page, such as headers. Because of this, we assign that result to our headers variable and then call its as_string method. This prints out the header we received from Google. You can also get the HTTP response code by calling getcode, which in this case was 200, which means it worked successfully.

If you’d like to see the HTML of the page, you can call the read method on the url variable we created. I am not reproducing that here as the output will be quite long.

Please note that the request object defaults to a GET request unless you specify the data parameter. Should you pass in the data parameter, then the request object will issue a POST request instead.

---

### Downloading a file

A typical use case for the urllib package is for downloading a file. Let’s find out a couple of ways we can accomplish this task:

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> response = urllib.request.urlopen(url)
>>> data = response.read()
>>> with open('/home/mike/Desktop/test.zip', 'wb') as fobj:
...     fobj.write(data)
...
```

Here we just open a URL that leads us to a zip file stored on my blog. Then we read the data and write it out to disk. An alternate way to accomplish this is to use urlretrieve:

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> tmp_file, header = urllib.request.urlretrieve(url)
>>> with open('/home/mike/Desktop/test.zip', 'wb') as fobj:
...     with open(tmp_file, 'rb') as tmp:
...         fobj.write(tmp.read())
```

The urlretrieve method will copy a network object to a local file. The file it copies to is randomly named and goes into the temp directory unless you use the second parameter to urlretrieve where you can actually specify where you want the file saved. This will save you a step and make your code much simpler:

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> urllib.request.urlretrieve(url, '/home/mike/Desktop/blog.zip')
('/home/mike/Desktop/blog.zip',
 <http.client.HTTPMessage object at 0x7fddc21c2470>)
```

As you can see, it returns the location of where it saved the file and the header information from the request.

### Specifying Your User Agent

When you visit a website with your browser, the browser tells the website who it is. This is called the user-agent string. Python’s urllib identifies itself as Python-urllib/x.y where the x and y are major and minor version numbers of Python. Some websites won’t recognize this user-agent string and will behave in strange ways or not work at all. Fortunately, it’s easy for you to set up your own custom user-agent string:

```
>>> import urllib.request
>>> user_agent = ' Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0'
>>> url = 'http://www.whatsmyua.com/'
>>> headers = {'User-Agent': user_agent}
>>> request = urllib.request.Request(url, headers=headers)
>>> with urllib.request.urlopen(request) as response:
...     with open('/home/mdriscoll/Desktop/user_agent.html', 'wb') as out:
...         out.write(response.read())
```

Here we set up our user agent to Mozilla FireFox and we set out URL to <http://www.whatsmyua.com/> which will tell us what it thinks our user-agent string is. Then we create a Request instance using our url and headers and pass that to urlopen. Finally we save the result. If you open the result file, you will see that we successfully changed our user-agent string. Feel free to try out a few different strings with this code to see how it will change.

---

### urllib.parse

The urllib.parse library is your standard interface for breaking up URL strings and combining them back together. You can use it to convert a relative URL to an absolute URL, for example. Let’s try using it to parse a URL that includes a query:

```
>>> from urllib.parse import urlparse
>>> result = urlparse('https://duckduckgo.com/?q=python+stubbing&t=canonical&ia=qa')
>>> result
ParseResult(scheme='https', netloc='duckduckgo.com', path='/', params='', query='q=python+stubbing&t=canonical&ia=qa', fragment='')
>>> result.netloc
'duckduckgo.com'
>>> result.geturl()
'https://duckduckgo.com/?q=python+stubbing&t=canonical&ia=qa'
>>> result.port
None
```

Here we import the urlparse function and pass it an URL that contains a search query to the duckduckgo website. My query was to look up articles on “python stubbing”. As you can see, it returned a ParseResult object that you can use to learn more about the URL. For example, you can get the port information (None in this case), the network location, path and much more.

### Submitting a Web Form

This module also holds the urlencode method, which is great for passing data to a URL. A typical use case for the urllib.parse library is submitting a web form. Let’s find out how you might do that by having the duckduckgo search engine look for Python:

```
>>> import urllib.request
>>> import urllib.parse
>>> data = urllib.parse.urlencode({'q': 'Python'})
>>> data
'q=Python'
>>> url = 'http://duckduckgo.com/html/'
>>> full_url = url + '?' + data
>>> response = urllib.request.urlopen(full_url)
>>> with open('/home/mike/Desktop/results.html', 'wb') as f:
...     f.write(response.read())
```

This is pretty straightforward. Basically we want to submit a query to duckduckgo ourselves using Python instead of a browser. To do that, we need to construct our query string using urlencode. Then we put that together to create a fully qualified URL and use urllib.request to submit the form. We then grab the result and save it to disk.

---

### urllib.robotparser

The robotparser module is made up of a single class, RobotFileParser. This class will answer questions about whether or not a specific user agent can fetch a URL that has a published robot.txt file. The robots.txt file will tell a web scraper or robot what parts of the server should not be accessed. Let’s take a look at a simple example using ArsTechnica’s website:

```
>>> import urllib.robotparser
>>> robot = urllib.robotparser.RobotFileParser()
>>> robot.set_url('http://arstechnica.com/robots.txt')
None
>>> robot.read()
None
>>> robot.can_fetch('*', 'http://arstechnica.com/')
True
>>> robot.can_fetch('*', 'http://arstechnica.com/cgi-bin/')
False
```

Here we import the robot parser class and create an instance of it. Then we pass it a URL that specifies where the website’s robots.txt file resides. Next we tell our parser to read the file. Now that that’s done, we give it a couple of different URLs to find out which ones we can crawl and which ones we can’t. We quickly see that we can access the main site, but not the cgi-bin.

---

### Wrapping Up

You have reached the point that you should be able to use Python’s urllib package competently. We learned how to download a file, submit a web form, change our user agent and access a robots.txt file in this chapter. The urllib has a lot of additional functionality that is not covered here, such as website authentication. However, you might want to consider switching to the requests library before trying to do authentication with urllib as the requests implementation is a lot easier to understand and debug. I also want to note that Python has support for Cookies via its http.cookies module although that is also wrapped quite well in the requests package. You should probably consider trying both to see which one makes the most sense to you.

--------------------------------------------------------------------------------

via: http://www.blog.pythonlibrary.org/2016/06/28/python-101-an-intro-to-urllib/

作者：[Mike][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.blog.pythonlibrary.org/author/mld/







