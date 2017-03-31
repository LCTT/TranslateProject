translating---geekpi

3 open source link shorteners
============================================================

> Want to build your own URL shortener? These open source projects make it easy.

 ![3 open source link shorteners](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/links.png?itok=AumNmse7 "3 open source link shorteners") 
>Image by : [Paul Lewin][2]. Modified by Opensource.com. [CC BY-SA 2.0][3]

Nobody likes an impossibly long URL.

They're hard to decipher. But sometimes, between a deep directory structure on a site, plus a large number of parameters tacked on to the end, URLs just begin to get unwieldy. And back in the days before Twitter added their own link shortener to their service, a long URL meant taking precious characters away from your tweets.

Today, people use link shorteners for a slew of reasons. They can make it much easier to type, or remember, an otherwise lengthy bare URL. They can bring a consistent branding to a social media account. They make it easier to perform analytics across a group of URLs. They make it possible to provide a consistent entryway to a URL that may change frequently on the other side.

There are some challenges to URL shorteners, to be sure. They make it challenging to figure out where a link is actually taking you before you click, and they're vulnerable to [linkrot][4], should the service providing the short URL for you ever disappear. But despite these challenges, URL shorteners aren't going anywhere anytime soon.

But with so many free link shortening services out there, why roll your own? In short: control. While some services will let you pick your own domain to use, sometimes, that's about the level of customization you're going to get. With a self-hosted service, you decide how long your service operates for. You decide what format your URLs take. You decide who has access to your analytics. It's yours to own and operate as you please.

Fortunately, there are many open source options out there if you want to build the next bit.ly, goo.gl, or ow.ly yourself. Here are a few you might consider.

### Lessn More

[Lessn More][5] is a personal URL shortener, built in PHP and forked off of an older project called Buttered URLs, which itself was derived from a fork of a project called Lessn. Lessn More provides most of the features you would expect from a URL shortener: API and bookmarklet support, custom URLs, etc. Some helpful features that set Lessn More apart are the ability to use a banned-words list to avoid creating an accidentally-inappropriate URL, the ability to avoid "lookalike" characters to make URLs more readable, the ability to choose whether or not to use mixed-case characters, and a few other helpful features.

[Lessn More][6] provides its [source code][7] on GitHub under a 3-clause [BSD][8] license.

### Polr

[Polr][9] describes itself as a "modern, powerful, and robust URL shortener." It has a fairly straight-forward but modern interface, and like our other options detailed here comes with an API to allow you to use it from within other programs. Of the three presented here, it's the lightest on features, but if you're looking for a simple but functional option it may be a good choice for you. Check out the [online demo][10] before you download.

The [source code][11] for Polr can be found on GitHub under a [GPLv2][12] license.

### YOURLS

[YOURLS][13], short for Your Own URL Shortener, is the option I am most familiar with. In full disclosure, I ran it for several years in production on a personal site, and was very happy with its capabilities.

Written in PHP, YOURLS is a pretty feature-rich option that works well out of the box. You can configure it to be publicly usable by anyone, or only allow certain users to use it. It supports custom URLs, comes with a bookmarklet to make sharing easy, has pretty robust built-in stats, and supports a pluggable architecture to allow others to add to it. It also has an API, making it easy to create other programs which interface with it.

You can find the [source code][14] for YOURLS on GitHub under an [MIT license][15].

* * *

Don't like any of these options? Take a look around the Internet and you can find several other choices: [shuri][16], [Nimbus][17], [Lstu][18], and many others. And beyond the options already available, building a link shortener is a good first programming project to get to know a new language or web framework. After all, the core functionality is very simple: Take a URL as input, and issue a redirect to another URL. Beyond that, it's up to you what bells and whistles to add.

Do you have a favorite we didn't list here? Let us know in the comments below

--------------------------------------------------------------------------------

作者简介：

Jason Baker - Jason is passionate about using technology to make the world more open, from software development to bringing sunlight to local governments. Linux desktop enthusiast. Map/geospatial nerd. Raspberry Pi tinkerer. Data analysis and visualization geek. Occasional coder. Cloud nativist. Follow him on Twitter.

------------

via: https://opensource.com/article/17/3/url-link-shortener

作者：[Jason Baker ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/article/17/3/url-link-shortener?rate=5EGysFmjsUsxCc74bffDni4sFxxaIYiGRUG3UPznav8
[2]:https://www.flickr.com/photos/digypho/7905320090
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://en.wikipedia.org/wiki/Linkrot
[5]:https://lessnmore.net/
[6]:https://lessnmore.net/
[7]:https://github.com/alanhogan/lessnmore
[8]:https://github.com/alanhogan/lessnmore/blob/master/LICENSE.txt
[9]:https://project.polr.me/
[10]:http://demo.polr.me/
[11]:https://github.com/cydrobolt/polr
[12]:https://github.com/cydrobolt/polr/blob/master/LICENSE
[13]:https://yourls.org/
[14]:https://github.com/YOURLS/YOURLS
[15]:https://github.com/YOURLS/YOURLS/blob/master/LICENSE.md
[16]:https://github.com/pips-/shuri
[17]:https://github.com/ethanal/nimbus
[18]:https://github.com/ldidry/lstu
[19]:https://opensource.com/user/19894/feed
[20]:https://opensource.com/article/17/3/url-link-shortener#comments
[21]:https://opensource.com/users/jason-baker
