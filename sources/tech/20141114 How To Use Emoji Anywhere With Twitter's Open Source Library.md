Translating by FSSlc

How To Use Emoji Anywhere With Twitter's Open Source Library
================================================================================
> Embed them in webpages and other projects via GitHub.

![](http://a3.files.readwrite.com/image/upload/c_fit,w_620/MTI1OTA2OTIyNTI3MjcxNTU1.png)

Emoji, tiny characters from Japan that convey emotions through images, have already conquered the world of cellphone text messaging.

Now, you can post them everywhere else in the virtual world, too. Twitter has just [open-sourced][1] its emoji library so you can use them for your own websites, apps, and projects. 

This will require a little bit of heavy lifting. Unicode has recognized and even standardized the emoji alphabet, but emoji still [aren’t fully compliant with all Web browsers][2], meaning they'll show up as “tofu,” or blank boxes, most of the time. When Twitter wanted to make emoji available, the social network teamed up with a company called [Icon Factory][3] to render browser imitations of the text message symbols. As a result, Twitter says there’s been lots of demand for access to its emoji.

Now, you can clone Twitter’s entire library on [GitHub][4] to use in your development projects. Here’s how to do that, and how to make emoji easier to use after you do. 

### Obtain Unicode Support For Emoji ###

Unicode is an international encoding standard that assigns a string of characters to any symbol, letter, or digit people want to use online. In other words, it’s the missing link between how you read text on a computer, and how the computer reads text. For example, while you are looking at an empty space between these words, the computer sees “&mbsp.”

Unicode even has its own [primitive emoji][5] that can be read in the browser without any effort on your part. For example while you see a ♥, your computer is decoding the string “2665.”

To use Twitter’s emoji library in most cases, you simply need to add a script inside the <head> section of your HTML page:

    <script src="//twemoji.maxcdn.com/twemoji.min.js"></script>

This grants your project access to the JavaScript library that contains the hundreds of emoji that work on Twitter. However, creating a document with simply this script isn’t going to make emoji appear on your site. You also need to actually insert some emoji!

In the <body> section, paste a few of the emoji strings you can find in Twitter’s [preview.html source code][6]. I used &#x1F3B9; and &#x1F3C1; without really knowing how they'd appear in the browser window. Yeah, you’ll have to just paste and guess. You can already see the problem we're going to fix in section two. 

However, through some trial and error, you can turn a raw HTML file that looks like this—

![](http://a4.files.readwrite.com/image/upload/c_fit,w_620/MTI1OTA2ODQyNTMzNTQ1OTk0.png)

—into a webpage that looks something like this:

![](http://a1.files.readwrite.com/image/upload/c_fit,w_620/MTI1OTA2ODExNjYzNDU1NTA2.png)

### Convert Emoji Into Readable Language ###

Twitter’s solution is all well and good for making a site or app emoji compliant. But if you want to be able to easily insert your favorite emoji at will via HTML, you’re going to need an easier solution than memorizing all those Unicode strings. 

That’s where programmer Elle Kasai’s [Twemoji Awesome][7] styles come in. 

By adding Elle’s open-source stylesheet to any webpage, you can use English words to understand which emoji you’re inserting. So if you want a heart emoji to show up, you can simply type this :

    <i class="twa twa-heart"></i>

In order to do this, let’s download Elle’s project with the “Download ZIP” button on GitHub.

Next, let’s make a new folder on the desktop. Inside this folder, we’ll put emoji.html—the raw HTML file I showed you before, and also Elle’s [twemoji-awesome.css][8]. 

We’ll need the HTML file to acknowledge the CSS file, so in the <head> section of the html page you’ll want to add a link from the css file:

    <link rel="stylesheet" href="twemoji-awesome.css">

Once you put this in, you can delete Twitter's script from before. Elle's styles each link to the Unicode string for the relevant emoji, so you no longer have to. 

Now, go down to the body section and add a few emoji. I used <i class="twa twa-sparkling-heart"></i>, <i class="twa twa-exclamation"></i>, <i class="twa twa-lg twa-sparkles"></i> and <i class="twa twa-beer"></i>.

You'll end up with something like this:

![](http://a2.files.readwrite.com/image/upload/c_fit,w_620/MTI1OTA2ODcyMDYxNDU2MzU0.png)

Save and view your creation in the browser:

![](http://a1.files.readwrite.com/image/upload/c_fit,w_620/MTI1OTA2ODExOTMxODkwOTYy.png)

Ta-da! Not only have you gotten a basic webpage to support emoji in the browser, you’ve also made it easy to do. Feel free to check out this tutorial on [my GitHub][9] for actual files you can clone instead of screenshots. 

Lead image via [Get Emoji][10]; screenshots by Lauren Orsini

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/11/12/how-to-use-emoji-in-the-browser-window

作者：[Lauren Orsini][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/lauren-orsini
[1]:https://blog.twitter.com/2014/open-sourcing-twitter-emoji-for-everyone
[2]:http://www.unicode.org/reports/tr51/full-emoji-list.html
[3]:https://twitter.com/iconfactory
[4]:https://github.com/twitter/twemoji
[5]:http://www.unicode.org/reports/tr51/full-emoji-list.html
[6]:https://github.com/twitter/twemoji/blob/gh-pages/preview.html
[7]:http://ellekasai.github.io/twemoji-awesome/
[8]:https://github.com/ellekasai/twemoji-awesome/blob/gh-pages/twemoji-awesome.css
[9]:https://github.com/laurenorsini/Emoji-Everywhere
[10]:http://getemoji.com/
