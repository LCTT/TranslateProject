Translating by GOLinux
How to access popular search engines from the command line on Linux
================================================================================
Why would anyone want to search things on the Internet via a terminal? I don't know. There are probably a lot of reasons. But since an answer that no one asked for is always less frustrating than a question that no one can answer, here is a list of popular search engines with the command-line tools that allow you to access them from a Linux terminal.

### 1. Google ###

Let's start right with a giant: Bing! No just kidding, Google. To be frank, you don't really need a utility to search on Google from the command line. A simple:

    $ xdg-open https://www.google.com/search?q="[query]"

would open your web browser on the appropriate search page. However, if what you want is to see the results of that search from a terminal window, without opening any kind of web browser, I would recommend using [cli-google][1]. It is super old (last updated in 2009) but I like it. It is a simple and straightforward application which does exactly what it's supposed to do.

Once you install cli-google, you can do searches with a colored output. You can also adjust the amount of results and the language that you want. Just type:

    $ google 

in your terminal to see all the options.

![](https://farm6.staticflickr.com/5491/14330385480_91b0e138ee_z.jpg)

### 2. YouTube ###

There is going to be a lot of Google in this list. I will try to keep it as minimal as possible, but there is no escape. YouTube is for a lot of people the go to when it comes to finding a video of something quickly. To do such things from a terminal, my go to is [mps-youtube][2]. This software lets you search, make playlists, download videos, and read the comments from the terminal. Once you install mps-youtube, launch it with:

    $ mpsyt 

Then type h to see the options. For quick usage, you can just do:

    /[query] 

to search for something, then type the number ID of the video to listen to its sound, or type:

    i [video-number]

to see its information, and type:

    d [video-number]

to download it. If just listening is not enough for you, here is the trick:

    set player mplayer
    set show_video True 

Now the video will show up in another window on mplayer.

![](https://farm3.staticflickr.com/2925/14517040865_1d54ccce3b_z.jpg)

### 3. Wikipedia ###

Same as for Google, for Wikipedia I like an old script that works just fine: [cliWiki][3]. Once you install it, just run:

    $ cliwiki 

And then type in your search. If there is a direct match, the page will be displayed in the terminal. The output can be quite long so I advise you to channel it with the less command. It is certainly not the most efficient way to do it, but if your goal is to get a block of text concerning a keyword, this is exactly what you need.

![](https://farm3.staticflickr.com/2903/14330600657_065d26cdf2_z.jpg)

### 4. The Pirate Bay ###

Now let's talk dirty. There are surprisingly (or not) a lot of utilities to find torrents on The Pirate Bay from the command line. However my preference goes to [pirate-get][4]. It comes with a ton of options that you can discover with:

    $ pirate-get -h

But to keep it simple:

    $ pirate-get --color -c [category] [query]

will return the result from a certain category of the search corresponding to a query, and with a colored output! From there, the application will prompt you to enter the number of the result that you want, and will then download the torrent from a magnet link. Simple and easy. Use only on non-copyrighted material! 

![](https://farm4.staticflickr.com/3923/14330448479_ae503561e6_z.jpg)

### 5. Twitter ###

Twitter is a good search engine for trends. We already covered [how to access Twitter from the command line][5] using t, but I personally prefer [TTYtter][6] to it. This utility is extermely powerful, could deserve its own post, and cannot be resumed to simply searching. But I am just going to use it as a search engine here. Once installed and configured, you can log in and search using the command:

    /search [query] 

The interface is a bit rough on the eye, but you will get accustomed quickly. Notice that this will work with plain words but also hash-tags.

![](https://farm6.staticflickr.com/5077/14537153013_cc32a98b08_z.jpg)

To conclude, these are in my opinion the big five search engines that people tend to use the most and which are accessible via the command line. The absents are probably Google Images and Google Maps, but those are kind of hard to adapt to the console I guess. I also wanted to look for a music search engine, but did not find any "worthy" of this list. As you have probably noticed, the tools on this list are uneven in term of features and options: some are simplistic while others go deep into functionality. But in the end they all do the job.

Which search engines are missing from this list? Do you know some utilities that were not mentioned? Let us know in the comments.

----------

#### Adrien Brochard ####

I am a Linux aficionado from France. After trying multiple distributions, I finally settled for Archlinux. But I am always trying to improve my system by stacking up tips and tricks.
--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/access-popular-search-engines-command-line-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/henux/cli-google
[2]:https://github.com/np1/mps-youtube
[3]:https://github.com/AnirudhBhat/cliWiki.py
[4]:https://github.com/vikstrous/pirate-get
[5]:http://xmodulo.com/2013/12/access-twitter-command-line-linux.html
[6]:http://www.floodgap.com/software/ttytter/
