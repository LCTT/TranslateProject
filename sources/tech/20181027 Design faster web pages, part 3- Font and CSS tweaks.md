Design faster web pages, part 3: Font and CSS tweaks
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/designfaster3-816x345.jpg)

Welcome back to this series of articles on designing faster web pages. [Part 1][1] and [part 2][2] of this series covered how to lose browser fat through optimizing and replacing images. This part looks at how to lose additional fat in CSS ([Cascading Style Sheets][3]) and fonts.

### Tweaking CSS

First things first: let’s look at where the problem originates. CSS was once a huge step forward. You can use it to style several pages from a central style sheet. Nowadays, many web developers use frameworks like Bootstrap.

While these frameworks are certainly helpful, many people simply copy and paste the whole framework. Bootstrap is huge; the “minimal” version of 4.0 is currently 144.9 KB. Perhaps in the era of terabytes of data, this isn’t much. But as they say, even small cattle makes a mess.

Look back at the [getfedora.org][4] example. Recall in [part 1][1], the first analysis showed the CSS files used nearly ten times more space than the HTML itself. Here’s a display of the stylesheets used:

![][5]

That’s nine different stylesheets. Many styles in them that are also unused on the page.

#### Remove, merge, and compress/minify

The font-awesome CSS inhabits the extreme end of included, unused styles. There are only three glyphs of the font used on the page. To make that up in KB, the font-awesome CSS used at getfedora.org is originally 25.2 KB. After cleaning out all unused styles, it’s only 1.3 KB. This is only about 4% of its original size! For Bootstrap CSS, the difference is 118.3 KB original, and 13.2 KB after removing unused styles.

The next question is, must there be a bootstrap.css and a font-awesome.css? Or can they be combined? Yes, they can. That doesn’t save much file space, but the browser now requests fewer files to succesfully render the page.

Finally, after merging the CSS files, try to remove unused styles and minify them. In this way, you save 10.1 KB for a final size of 4.3 KB.

Unfortunately, there’s no packaged “minifier” tool in Fedoras repositories yet. However, there are hundreds of online services to do that for you. Or you can use [CSS-HTML-JS Minify][6], which is Python, and therefore easy to isntall. There’s not an available tool to purify CSS, but there are web services like [UnCSS][7].

### Font improvement

[CSS3][8] came with something a lot of web developer like. They could define fonts the browser downloads in the background to render the page. Since then, a lot of web designers are very happy, especially after they discovered the usage of icon fonts for web design. Font sets like [Font Awesome][9] are quiet popular today and widely used. Here’s the size of that content:

```
current free version 912 glyphs/icons, smallest set ttf 30.9KB, woff 14.7KB, woff2 12.2KB, svg 107.2KB, eot 31.2
```

So the question is, do you need all the glyphs? In all probability, no. You can get rid of them with [FontForge][10], but that’s a lot of work. You could also use [Fontello][11]. Use the public instance, or set up your own, as it’s free software and available on [Github][12].

The downside of such customized font sets is you must host the font by yourself. You can’t use other online font services to provide updates. But this may not really be a downside, compared to faster performance.

### Conclusion

Now you’ve done everything you can to the content itself, to minimize what the browser loads and interprets. From now on, only tricks with the administration of the server can help.

One easy to do, but which many people do wrong, is decide on some intelligent caching. For instance, a CSS or picture file can be cached for a week. Whatever you do, if you use a proxy service like Cloudflare or build your own proxy, minimze the pages first. Users like fast loading pages. They’ll (silently) thank you for it, and the server will have a smaller load, too.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/design-faster-web-pages-part-3-font-css-tweaks/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/design-faster-web-pages-part-1-image-compression/
[2]: https://fedoramagazine.org/design-faster-web-pages-part-2-image-replacement/
[3]: https://en.wikipedia.org/wiki/Cascading_Style_Sheets
[4]: https://getfedora.org
[5]: https://fedoramagazine.org/wp-content/uploads/2018/02/CSS_delivery_tool_-_Examine_how_a_page_uses_CSS_-_2018-02-24_15.00.46.png
[6]: https://github.com/juancarlospaco/css-html-js-minify
[7]: https://uncss-online.com/
[8]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS3
[9]: https://fontawesome.com/
[10]: https://fontforge.github.io/en-US/
[11]: http://fontello.com/
[12]: https://github.com/fontello/fontello
