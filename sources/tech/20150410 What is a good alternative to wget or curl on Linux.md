What is a good alternative to wget or curl on Linux
================================================================================
If you often need to access a web server non-interactively in a terminal environment (e.g., download a file from the web, or test REST-ful web service APIs), chances are that wget or curl is your go-to tool. With extensive command-line options, both of these tools can handle a variety of non-interactive web access use cases (examples [here][1], [here][2] and [here][3]). However, even powerful tools like these are only as good as your knowledge of how to use them. Unless you are well versed in the nitty and gritty details of their syntax, these tools are nothing more than simple web downloaders for you.

Billed as a "curl-like tool for humans," [HTTPie][4] is designed to improve on wget and curl in terms of usability. Its main goal is to make command-line interaction of a web server as human-friendly as possible. For that, HTTPie comes with expressive, yet very simple and intuitive syntax. It also displays responses in colorized formats for readability, and offers nice goodies like excellent JSON support and persistent sessions to streamline your workflows.

I know some of you will be skeptical about replacing a ubiquitously available, perfectly good tool such as wget or curl with totally unheard of software. This view has merit especially if you are a system admin who works with many different hardware boxes. For developers or end-users, however, I would say it's all about productivity. If I've found a user-friendly alternative of a tool, I don't see any problem adopting the easy to use version in my work environment to save my precious time. No need to be loyal and religious about what's being replaced. After all, choice is the best thing about Linux.

In this post, let me review HTTPie, and show you what I mean by HTTPie being a user-friendly alternative of wget and curl.

![](https://farm8.staticflickr.com/7633/16849137018_bcc7a616fc_b.jpg)

### Install HTTPie on Linux ###

HTTPie is written in Python, so you can install it pretty much everywhere (Linux, MacOSX, Windows). Even better, it comes as a prebuilt package on most Linux distributions.

#### Debian, Ubuntu or Linux Mint: ####

    $ sudo apt-get install httpie

#### Fedora: ####

    $ sudo yum install httpie

#### CentOS/RHEL: ####

First, enable [EPEL repository][5] and then run:

    $ sudo yum install httpie 

For any Linux distribution, an alternative installation method is to use [pip][6].

    $ sudo pip install --upgrade httpie 

### HTTPie Examples ###

Once you install HTTPie, you can invoke it by typing http command. In the rest of this article, let me show several useful examples of http command.

#### Example 1: Custom Headers ####

You can set custom headers in the format of <header:value>. For example, let's send an HTTP GET request to www.test.com, with custom user-agent and referer, as well as a custom header (e.g., MyParam).

    $ http www.test.com User-Agent:Xmodulo/1.0 Referer:http://xmodulo.com MyParam:Foo 

Note that when HTTP GET method is used, you don't need to specify any HTTP method.

The HTTP request will look like:

    GET / HTTP/1.1
    Host: www.test.com
    Accept: */*
    Referer: http://xmodulo.com
    Accept-Encoding: gzip, deflate, compress
    MyParam: Foo
    User-Agent: Xmodulo/1.0

#### Example 2: Download a File ####

You can use http as a file downloader tool. You will need to redirect output to a file as follows.

    $ http www.test.com/my_file.zip > my_file.zip

Alternatively:

    $ http --download www.test.com/my_file.zip 

#### Example 3: Custom HTTP Method ####

Besides the default GET method, you can use other methods (e.g., PUT, POST, HEAD). For example, to sent an HTTP PUT request:

    $ http PUT www.test.com name='Dan Nanni' email=dan@email.com 

#### Example 4: Submit a Form ####

Submitting a form with http command is as easy as:

    $ http -f POST www.test.com name='Dan Nanni' comment='Hi there' 

The '-f' option lets http command serialize data fields, and set 'Content-Type' to "application/x-www-form-urlencoded; charset=utf-8".

The HTTP POST request will look like:

    POST / HTTP/1.1
    Host: www.test.com
    Content-Length: 31
    Content-Type: application/x-www-form-urlencoded; charset=utf-8
    Accept-Encoding: gzip, deflate, compress
    Accept: */*
    User-Agent: HTTPie/0.8.0
    
    name=Dan+Nanni&comment=Hi+there

#### Example 5: JSON Support ####

HTTPie comes with built-in JSON support, which is nice considering its growing popularity as a data exchange format. In fact, the default content-type used by HTTPie is JSON. So if you send data fields without specifying any content-type, they will automatically be serialized as a JSON object.

    $ http POST www.test.com name='Dan Nanni' comment='Hi there' 

The HTTP POST request will look like:

    POST / HTTP/1.1
    Host: www.test.com
    Content-Length: 44
    Content-Type: application/json; charset=utf-8
    Accept-Encoding: gzip, deflate, compress
    Accept: application/json
    User-Agent: HTTPie/0.8.0
    
    {"name": "Dan Nanni", "comment": "Hi there"}

#### Example 6: Input Redirect ####

Another nice user-friendly feature of HTTPie is input redirection, where you can feed an HTTP request body with buffered data. For example, you can do things like:

    $ http POST api.test.com/db/lookup < my_info.json 

or:

    $ echo '{"name": "Dan Nanni"}' | http POST api.test.com/db/lookup 

### Conclusion ###

In this article, I introduce to you HTTPie, a possible alternative to wget or curl. Besides these simple examples presented here, you can find a lot of interesting use cases of HTTPie at the [official site][7]. Again, a powerful tool is only as good as your knowledge about the tool. Personally I am sold on HTTPie, as I was looking for a way to test complicated web APIs more easily.

What's your thought?

--------------------------------------------------------------------------------

via: http://xmodulo.com/wget-curl-alternative-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-download-multiple-files-with-wget.html
[2]:http://xmodulo.com/how-to-use-custom-http-headers-with-wget.html
[3]:http://ask.xmodulo.com/custom-http-header-curl.html
[4]:https://github.com/jakubroztocil/httpie
[5]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[6]:http://ask.xmodulo.com/install-pip-linux.html
[7]:https://github.com/jakubroztocil/httpie