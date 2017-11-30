yixunx translating

# Search DuckDuckGo from the Command Line

 ![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/duckduckgo.png)
When we showed you how to [search Google from the command line][3] a lot of you to say you use [Duck Duck Go][4], the awesome privacy-focused search engine.

Well, now there’s a tool to search DuckDuckGo from the command line. It’s called [ddgr][6] (pronounced, in my head, as  _dodger_ ) and it’s pretty neat.

Like [Googler][7], ddgr is totally open-source and totally unofficial. Yup, the app is unaffiliated with DuckDuckGo in any way. So, should it start returning unsavoury search results for innocent terms, make sure you quack in this dev’s direction, and not the search engine’s!

### DuckDuckGo Terminal App

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/ddgr-gif.gif)

[DuckDuckGo Bangs][8] makes finding stuff on DuckDuckGo super easy (there’s even a bang for  _this_  site) and, dutifully, ddgr supports them.

Unlike the web interface, you can specify the number of search results you would like to see per page. It’s more convenient than skimming through 30-odd search results per page. The default interface is carefully designed to use minimum space without sacrificing readability.

`ddgr` has a number of features, including:

*   Choose number of search results to fetch

*   Support for Bash autocomplete

*   Use !bangs

*   Open URLs in a browser

*   “I’m feeling lucky” option

*   Filter by time, region, file type, etc

*   Minimal dependencies

You can download `ddgr` for various systems direct from the Github project page:

[Download ‘ddgr’ from Github][9]

You can also install ddgr on Ubuntu 16.04 LTS and up from a PPA. This repo is maintained by the developer of ddgr and is recommended should you want to stay up-to-date with new releases as and when they appear.

Do note that at the time of writing the latest version of ddgr is  _not_  in the PPA, but an older version (lacking –num support) is:

```
sudo add-apt-repository ppa:twodopeshaggy/jarun
```

```
sudo apt-get update
```

### How To Use ddgr to Search DuckDuckGo from the Comand Line

To use ddgr once you installed all you need to do is pop open your terminal emulator of choice and run:

```
ddgr
```

Next enter a search term:

```
search-term
```

To limit the number of results returned run:

```
ddgr --num 5 search-term
```

To instantly open the first matching result for a search term in your browser run:

```
ddgr -j search-term
```

You can pass arguments and flags to narrow down your search. To see a comprehensive list inside the terminal run:

```
ddgr -h
```

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/duck-duck-go-terminal-app

作者：[JOEY SNEDDON  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/download
[3]:http://www.omgubuntu.co.uk/2017/08/search-google-from-the-command-line
[4]:http://duckduckgo.com/
[5]:http://www.omgubuntu.co.uk/2017/11/duck-duck-go-terminal-app
[6]:https://github.com/jarun/ddgr
[7]:https://github.com/jarun/googler
[8]:https://duckduckgo.com/bang
[9]:https://github.com/jarun/ddgr/releases/tag/v1.1
