[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to host your own webfonts)
[#]: via: (https://opensource.com/article/19/3/webfonts)
[#]: author: (Seth Kenlon (Red Hat, Community Moderator) https://opensource.com/users/seth)

How to host your own webfonts
======

### Customize your website by self-hosting openly licensed fonts.

![Open source fonts][1]

Fonts are often a mystery to many computer users. For example, have you designed a cool flyer and, when you take the file somewhere for printing, find all the titles rendered in Arial because the printer doesn't have the fancy font you used in your design? There are ways to prevent this, of course: you can convert words in special fonts into paths, bundle fonts into a PDF, bundle open source fonts with your design files, or—at least—list the fonts required. And yet it's still a problem because we're human and we're forgetful.

The web has the same sort of problem. If you have even a basic understanding of CSS, you've probably seen this kind of declaration:

```
h1 { font-family: "Times New Roman", Times, serif; }
```

This is a designer's attempt to define a specific font, provide a fallback if a user doesn't have Times New Roman installed, and offer yet another fallback if the user doesn't have Times either. It's better than using a graphic instead of text, but it's still an awkward, inelegant method of font non-management, However, in the early-ish days of the web, it's all we had to work with.

### Webfonts

Then webfonts happened, moving font management from the client to the server. Fonts on websites were rendered for the client by the server, rather than requiring the web browser to find a font on the user's system. Google and other providers even host openly licensed fonts, which designers can include on their sites with a simple CSS rule.

The problem with this free convenience, of course, is that it doesn't come without cost. It's $0 to use, but major sites like Google love to keep track of who references their data, fonts included. If you don't see a need to assist Google in building a record of everyone's activity on the web, the good news is you can host your own webfonts, and it's as simple as uploading fonts to your host and using one easy CSS rule. As a side benefit, your site may load faster, as you'll be making one fewer external call upon loading each page.

### Self-hosted webfonts

The first thing you need is an openly licensed font. This can be confusing if you're not used to thinking or caring about obscure software licenses, especially since it seems like all fonts are free. Very few of us have consciously paid for a font, and yet most people have high-priced fonts on their computers. Thanks to licensing deals, your computer may have shipped with fonts that [you aren't legally allowed to copy and redistribute][2]. Fonts like Arial, Verdana, Calibri, Georgia, Impact, Lucida and Lucida Grande, Times and Times New Roman, Trebuchet, Geneva, and many others are owned by Microsoft, Apple, and Adobe. If you purchased a computer preloaded with Windows or MacOS, you paid for the right to use the bundled fonts, but you don't own those fonts and are not permitted to upload them to a web server (unless otherwise stated).

Fortunately, the open source craze hit the font world long ago, and there are excellent collections of openly licensed fonts from collectives and projects like [The League of Moveable Type][3], [Font Library][4], [Omnibus Type][5], and even [Google][6] and [Adobe][7].

You can use most common font file formats, including TTF, OTF, WOFF, EOT, and so on. Since Sorts Mill Goudy includes a WOFF (Web Open Font Format, developed in part by Mozilla) version, I'll use it in this example. However, other formats work the same way.

Assuming you want to use [Sorts Mill Goudy][8] on your web page:

  1. Upload the **GoudyStM-webfont.woff** file to your web server:

```
scp GoudyStM-webfont.woff seth@example.com:~/www/fonts/
```

Your host may also provide a graphical upload tool through cPanel or a similar web control panel.



  2. In your site's CSS file, add an **@font-face** rule, similar to this:


```
@font-face { 
  font-family: "titlefont";
  src: url("../fonts/GoudyStM-webfont.woff"); 
}
```

The **font-family** value is something you make up. It's a human-friendly name for whatever the font face represents. I am using "titlefont" in this example because I imagine this font will be used for the main titles on an imaginary site. You could just as easily use "officialfont" or "myfont."

The **src** value is the path to the font file. The path to the font must be appropriate for your server's file structure; in this example, I have the **fonts** directory alongside a **css** directory. You may not have your site structured that way, so adjust the paths as needed, remembering that a single dot means _this folder_ and two dots mean _a folder back_.



  3. Now that you've defined the font face name and the location, you can call it for any given CSS class or ID you desire. For example, if you want **< h1>** to render in the Sorts Mill Goudy font, then make its CSS rule use your custom font name:

```
h1 { font-family: "titlefont", serif; }
```




You're now hosting and using your own fonts.


![Web fonts on a website][10]

_Thanks to Alexandra Kanik for teaching me about @font-face and most everything else I know about good web design._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/webfonts

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_typography_fonts.png?itok=Q1jMys5G (Open source fonts)
[2]: https://docs.microsoft.com/en-us/typography/fonts/font-faq
[3]: https://www.theleagueofmoveabletype.com/
[4]: https://fontlibrary.org/
[5]: https://www.omnibus-type.com
[6]: https://github.com/googlefonts
[7]: https://github.com/adobe-fonts
[8]: https://www.theleagueofmoveabletype.com/sorts-mill-goudy
[9]: /file/426056
[10]: https://opensource.com/sites/default/files/uploads/webfont.jpg (Web fonts on a website)
