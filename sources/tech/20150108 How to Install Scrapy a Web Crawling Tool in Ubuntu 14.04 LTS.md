Translating-----geekpi

How to Install Scrapy a Web Crawling Tool in Ubuntu 14.04 LTS
================================================================================
It is an open source software which is used for extracting the data from websites. Scrapy framework is developed in Python and it perform the crawling job in fast, simple and extensible way.  We have created a Virtual Machine (VM) in virtual box and Ubuntu 14.04 LTS is installed on it.

### Install Scrapy ###

Scrapy is dependent on Python, development libraries and pip software. Python latest version is pre-installed on Ubuntu. So we have to install pip and python developer libraries before installation of Scrapy.

Pip is the replacement for easy_install for python package indexer. It is used for installation and management of Python packages. Installation of pip package is shown in Figure 1.

    sudo apt-get install python-pip

![Fig:1 Pip installation](http://blog.linoxide.com/wp-content/uploads/2014/11/f1.png)

Fig:1 Pip installation

We have to install python development libraries by using following command. If this package is not installed then installation of scrapy framework generates error about python.h header file.

    sudo apt-get install python-dev

![Fig:2 Python Developer Libraries](http://blog.linoxide.com/wp-content/uploads/2014/11/f2.png)

Fig:2 Python Developer Libraries

Scrapy framework can be installed either from deb package or source code. However we have installed deb package using pip (Python package manager) which is shown in Figure 3.

    sudo pip install scrapy 

![Fig:3 Scrapy Installation](http://blog.linoxide.com/wp-content/uploads/2014/11/f3.png)

Fig:3 Scrapy Installation

Scrapy successful installation takes some time which is shown in Figure 4.

![Fig:4 Successful installation of Scrapy Framework](http://blog.linoxide.com/wp-content/uploads/2014/11/f4.png)

Fig:4 Successful installation of Scrapy Framework

### Data extraction using Scrapy framework ###

**(Basic Tutorial)**

We will use Scrapy for the extraction of store names (which are providing Cards) item from fatwallet.com web site. First of all, we created new scrapy project “store_name” using below given command and shown in Figure 5.

    $sudo scrapy startproject store_name

![Fig:5 Creation of new project in Scrapy Framework](http://blog.linoxide.com/wp-content/uploads/2014/11/f5.png)

Fig:5 Creation of new project in Scrapy Framework

Above command creates a directory with title “store_name” at current path. This main directory of the project contains files/folders which are shown in the following Figure 6.

    $sudo ls –lR store_name

![Fig:6 Contents of store_name project.](http://blog.linoxide.com/wp-content/uploads/2014/11/f6.png)

Fig:6 Contents of store_name project.

A brief description of each file/folder is given below;

- scrapy.cfg is the project configuration file
- store_name/ is another directory inside the main directory. This directory contains python code of the project.
- store_name/items.py contains those items which will be extracted by the spider.
- store_name/pipelines.py is the pipelines file.
- Setting of store_name project is in store_name/settings.py file.
- and the store_name/spiders/ directory, contains spider for the crawling

As we are interested to extract the store names of the Cards from fatwallet.com site, so we updated the contents of the file as shown below.

    import scrapy

    class StoreNameItem(scrapy.Item):

       name = scrapy.Field()   # extract the names of Cards store

After this, we have to write new spider under store_name/spiders/ directory of the project. Spider is python class which consist of following mandatory attributes :

1. Name of the spider (name )
1. Starting url of spider for crawling (start_urls)
1. And parse method which consist of regex for the extraction of desired items from the page response. Parse method is the important part of spider.

We created spider “store_name.py” under store_name/spiders/ directory and added following python code for the extraction of store name from fatwallet.com site. The output of the spider is written in the file (**StoreName.txt**) which is shown in Figure 7.

    from scrapy.selector import Selector
    from scrapy.spider import BaseSpider
    from scrapy.http import Request
    from scrapy.http import FormRequest
    import re
    class StoreNameItem(BaseSpider):
    name = "storename"
    allowed_domains = ["fatwallet.com"]
    start_urls = ["http://fatwallet.com/cash-back-shopping/"]
    
    def parse(self,response):
    output = open('StoreName.txt','w')
    resp = Selector(response)
    
    tags = resp.xpath('//tr[@class="storeListRow"]|\
             //tr[@class="storeListRow even"]|\
             //tr[@class="storeListRow even last"]|\
              //tr[@class="storeListRow last"]').extract()
    for i in tags:
    i = i.encode('utf-8', 'ignore').strip()
    store_name = ''
    if re.search(r"class=\"storeListStoreName\">.*?<",i,re.I|re.S):
    store_name = re.search(r"class=\"storeListStoreName\">.*?<",i,re.I|re.S).group()
    store_name = re.search(r">.*?<",store_name,re.I|re.S).group()
    store_name = re.sub(r'>',"",re.sub(r'<',"",store_name,re.I))
    store_name = re.sub(r'&amp;',"&",re.sub(r'&amp;',"&",store_name,re.I))
    #print store_name
    output.write(store_name+""+"\n")

![Fig:7 Output of the Spider code .](http://blog.linoxide.com/wp-content/uploads/2014/11/f7.png)

Fig:7 Output of the Spider code .

*NOTE: The purpose of this tutorial is only the understanding of Scrapy Framework*

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/scrapy-install-ubuntu/

作者：[nido][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/