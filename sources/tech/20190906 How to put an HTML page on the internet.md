[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to put an HTML page on the internet)
[#]: via: (https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/)
[#]: author: (Julia Evans https://jvns.ca/)

How to put an HTML page on the internet
======

One thing I love about the internet is that it’s SO EASY to put static HTML websites on the internet. Someone asked me today how to do it, so I thought I’d write down how really quickly!

### just an HTML page

All of my sites are just static HTML and CSS. My web design skills are relatively minimal (<https://wizardzines.com> is the most complicated site I’ve developed on my own), so keeping all my internet sites relatively simple means that I have some hope of being able to make changes / fix things without spending a billion hours on it.

So we’re going to take as minimal of an approach as possible in this blog post – just one HTML page.

### the HTML page

The website we’re going to put on the internet is just one file, called `index.html`. You can find it at <https://github.com/jvns/website-example>, which is a Github repository with exactly one file in it.

The HTML file has some CSS in it to make it look a little less boring, which is partly copied from <https://example.com>.

### how to put the HTML page on the internet

Here are the steps:

  1. sign up for a [Neocities][1] account
  2. copy the index.html into the index.html in your neocities site
  3. done



The index.html page above is on the internet at [julia-example-website.neocities.com][2], if you view source you’ll see that it’s the same HTML as in the github repo.

I think this is probably the simplest way to put an HTML page on the internet (and it’s a throwback to Geocities, which is how I made my first website in 2003) :). I also like that Neocities (like [glitch][3], which I also love) is about experimentation and learning and having fun..

### other options

This is definitely not the only easy way – Github pages and Gitlab pages and Netlify will all automatically publish a site when you push to a Git repository, and they’re all very easy to use (just connect them to your github repository and you’re done). I personally use the Git repository approach because not having things in Git makes me nervous – I like to know what changes to my website I’m actually pushing. But I think if you just want to put an HTML site on the internet for the first time and play around with HTML/CSS, Neocities is a really nice way to do it.

If you want to actually use your website for a Real Thing and not just to play around you probably want to buy a domain and link it to your website so that you can change hosting providers in the future, but that is a bit less simple.

### this is a good possible jumping off point for learning HTML

If you are a person who is comfortable editing files in a Git repository but wants to practice HTML/CSS, I think this is a fun way to put a website on the internet and play around! I really like the simplicity of it – there’s literally just one file, so there’s no fancy extra magic to get in the way of understanding what’s going on.

There are also a bunch of ways to complicate/extend this, like this blog is actually generated with [Hugo][4] which generates a bunch of HTML files which then go on the internet, but it’s always nice to start with the basics.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://neocities.org/
[2]: https://julia-example-website.neocities.org/
[3]: https://glitch.com
[4]: https://gohugo.io/
