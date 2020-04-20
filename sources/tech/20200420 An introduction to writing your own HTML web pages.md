[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to writing your own HTML web pages)
[#]: via: (https://opensource.com/article/20/4/build-websites)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

An introduction to writing your own HTML web pages
======
Get back to basics by building a web page with only HTML and CSS.
![website design image][1]

Websites are an excellent resource for open source software projects. A website provides an ideal opportunity for users to learn more about your project. Project websites can share additional information, screenshots, sample code, videos, and other resources that developers and users will find useful.

If you are interested in starting your own website, this article is for you.

### Other options

You certainly don't need to build a website for your open source software project. These days, you can host your open source software project on places like GitHub or GitLab, and get by with the standard "Readme.md" style description of your project. That works great for many projects and is a perfect solution for developers who want to focus more on writing the code for their project than maintaining a website.

But if you want to create a website, you can leverage tools and site builders to do the work for you. For example, the open source [TYPO3][2] web content management system is an excellent website builder. Or you can use a number of other open source content management systems and site builders to create and manage a project website, all without having to learn any HTML code at all.

But in the spirit of open source software, I prefer to code my open source project websites by hand. And in this article, I'll show you the basics of building your own website using HTML and CSS.

### Web page structure

HTML is a simple hypertext markup language that is easy for humans to write and easy for computers to read. The core of HTML is the tag, a markup that tells a web browser about the page, or something inside the page. HTML tags begin with the less-than symbol (**&lt;**) and end with the greater-than symbol (**&gt;**). For example, the tag to start an HTML page is:


```
`<html>`
```

Most tags require you to separately mark the beginning and end of something. The ending tag includes a slash (**/**) inside the tag. For example, the tag to end the HTML page is:


```
`</html>`
```

With that, we can see the top-level outline of a web page. The HTML code for this is:


```
&lt;[html][3]&gt;
&lt;/[html][3]&gt;
```

Inside the start and end tags for the HTML page, you would include other code blocks. All pages need a **body** block to define the text body of the web page. Most pages also start with a special **head** block that defines certain parameters for the web browser, such as where to find the stylesheet. We'll explore stylesheets later.


```
&lt;[html][3]&gt;
        &lt;[head][4]&gt;
        &lt;/[head][4]&gt;
         
        &lt;[body][5]&gt;
        &lt;/[body][5]&gt;
&lt;/[html][3]&gt;
```

White space, including "new lines" and spaces and tabs are unimportant to the web browser, but most web developers will indent HTML blocks that are inside other HTML blocks to make the code more readable for humans. That is why I've indented the **head** and **body** blocks in my sample code.

### A simple web page outline

Most web pages follow a general outline. This is usually a header and navigation bar at the top, main content in the middle, and a footer at the bottom. The HTML version 5 standard defines tags to do just this. Let's add to the code sample to include these tags:


```
&lt;[html][3]&gt;
        &lt;[head][4]&gt;
        &lt;/[head][4]&gt;
         
        &lt;[body][5]&gt;
                &lt;[header][6]&gt;
                &lt;/[header][6]&gt;
                 
                &lt;[nav][7]&gt;
                &lt;/[nav][7]&gt;

                &lt;main&gt;
                &lt;/main&gt;
                 
                &lt;[footer][8]&gt;
                &lt;/[footer][8]&gt;
        &lt;/[body][5]&gt;
&lt;/[html][3]&gt;
```

Your web page content goes inside each of these blocks. For example, you should include your open source project's name in the header. Also consider adding useful navigation links to the header, and your contact information and any social media links in the footer. You can define each of these elements using HTML tags.

To get started, you might use these common tags in your page:

  * **&lt;h1&gt;**Heading level 1 (usually a title in the header)**&lt;/h1&gt;**
  * **&lt;h2&gt;**Heading level 2 (usually a topic title in the main body)**&lt;/h2&gt;**
  * **&lt;p&gt;**Body paragraph. This is the most frequently used HTML tag.**&lt;/p&gt;**
  * **&lt;i&gt;**Italic text**&lt;/i&gt;**
  * **&lt;b&gt;**Bold text**&lt;/b&gt;**
  * **&lt;a href="**[**https://example.com/**][9]**"&gt;**Link to another page or another website**&lt;/a&gt;**
  * **&lt;img src="image.png" alt="Image you want to display" /&gt;**



The **img** tag to display an image is different from the other tags we've explored so far. This is an example of a "self-closing" tag, a tag that stands alone to do something. In the latest version of HTML, you do not need the ending slash.

With images, be sure to include alternative descriptive text in the **alt** parameter. Visually impaired users who have their browser set to not display images will use the alternative text instead. You'll also see the alternative text if the image cannot be loaded.

With these new tags, we can expand the HTML code sample to create a simple yet functional web page. Let's add a logo and page title in the header and some simple text in the main body. We'll also include links to other pages in the navigation bar, and a link to Twitter and a contact email address in the footer.


```
&lt;[html][3]&gt;
        &lt;[head][4]&gt;
        &lt;/[head][4]&gt;
         
        &lt;[body][5]&gt;
                &lt;[header][6]&gt;
                        &lt;[h1][10]&gt;&lt;[img][11] src="logo.png" alt="FreeDOS logo" /&gt; The FreeDOS Project&lt;/[h1][10]&gt;
                &lt;/[header][6]&gt;

                &lt;[nav][7]&gt;
                        &lt;[a][12] href="[http://wiki.freedos.org/"\&gt;Wiki\][13]&lt;/[a][12]&gt;
                        &lt;[a][12] href="/download/"&gt;Download&lt;/[a][12]&gt;
                &lt;/[nav][7]&gt;

                &lt;main&gt;
                        &lt;[h2][14]&gt;Welcome to FreeDOS&lt;/[h2][14]&gt;
                        &lt;[p][15]&gt;&lt;[b][16]&gt;FreeDOS is open source software!&lt;/[b][16]&gt; It doesn’t cost anything to download and use FreeDOS. You can also share FreeDOS for others to enjoy! And you can view and edit our source code, because all FreeDOS programs are distributed under the GNU General Public License or a similar open source software license.&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="[http://wiki.freedos.org/"\&gt;Read][17] the wiki&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="/download/"&gt;Download FreeDOS 1.2&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                &lt;/main&gt;
                 
                &lt;[footer][8]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="[https://twitter.com/freedos\\_project"\&gt;Follow][18] us on Twitter&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;Contact me at &lt;[i][19]&gt;[jhall@freedos.org][20]&lt;/[i][19]&gt;&lt;/[p][15]&gt;
                &lt;/[footer][8]&gt;
        &lt;/[body][5]&gt;
&lt;/[html][3]&gt;
```

 

![Plain text HTML][21]

### Adding styles to your web page

If you view this simple web page in a browser, you'll find it's just plain text. You can add some pizzazz to your web pages by using stylesheets. The stylesheet is usually a separate file that tells the web browser how to display certain parts of your web page. You might set your web page fonts here, or your background colors, or other styling.

The format of the stylesheet is quite different from HTML. In stylesheets, you give the name of the tag or "element" that you want to modify, then list the different styles in a set of curly braces. For example, this simple stylesheet defines text color and background color for everything that's inside the block, which is the entire page.


```
body {
        color: black;
        background-color: white;
}
```

If you're just learning about how to create web pages, I recommend you start with these simple stylesheet instructions:

  * background-color: _color_;
  * color: _color_;
  * font-weight: bold;
  * text-style: italic;
  * text-decoration: underline;
  * height: _size_; and width: _size_; (helpful in setting the size of an image)
  * text-align: center;



You can embed the stylesheet in your HTML page by including it in the **head** section, using a **&lt;style&gt;** block. Let’s add a very simple stylesheet that sets the default colors to be black on white, the header to centered white text on a blue background, and the footer to italics black text on a gray background. We’ll also set the logo to be 50 pixels tall.


```
&lt;[html][3]&gt;
        &lt;[head][4]&gt;
                &lt;[style][22]&gt;
                        body {
                                color: black;
                                background-color: white;
                        }
                        header {
                                color: white;
                                background-color: blue;
                                text-align: center;
                        }
                        img {
                                height: 50px;
                        }
                        footer {
                                color: black;
                                background-color: gray;
                                text-style: italic;
                        }
                &lt;/[style][22]&gt;
        &lt;/[head][4]&gt;
         
        &lt;[body][5]&gt;
                &lt;[header][6]&gt;
                        &lt;[h1][10]&gt;&lt;[img][11] src="logo.png" alt="FreeDOS logo" /&gt; The FreeDOS Project&lt;/[h1][10]&gt;
                &lt;/[header][6]&gt;
                 
                &lt;main&gt;
                        &lt;[h2][14]&gt;Welcome to FreeDOS&lt;/[h2][14]&gt;
                        &lt;[p][15]&gt;&lt;[b][16]&gt;FreeDOS is open source software!&lt;/[b][16]&gt; It doesn’t cost anything to download and use FreeDOS. You can also share FreeDOS for others to enjoy! And you can view and edit our source code, because all FreeDOS programs are distributed under the GNU General Public License or a similar open source software license.&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="[http://wiki.freedos.org/"\&gt;Read][17] the wiki&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="/download/"&gt;Download FreeDOS 1.2&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                &lt;/main&gt;
                 
                &lt;[footer][8]&gt;
                        &lt;[p][15]&gt;&lt;[a][12] href="[https://twitter.com/freedos\\_project"\&gt;Follow][18] us on Twitter&lt;/[a][12]&gt;&lt;/[p][15]&gt;
                        &lt;[p][15]&gt;Contact me at &lt;[i][19]&gt;[jhall@freedos.org][20]&lt;/[i][19]&gt;&lt;/[p][15]&gt;
                &lt;/[footer][8]&gt;
        &lt;/[body][5]&gt;
&lt;/[html][3]&gt;
```

 

![HTML stylesheet][23]

Stylesheets allow you to completely change the look of the website without changing the HTML code. Here’s a more advanced stylesheet that adds new colors, fonts, spacing, borders, drop shadows, and hover effects to give the same HTML a fresh look.


```
body {
        color: black;
        background-color: white;
        font-family: 'Open Sans', Calibri, sans-serif;
        margin: 0;
}
header {
        color: white;
        background-color: steelblue;
}
        header &gt; h1 {
                font-size: small;
                margin: 0;
                text-align: center;
        }
        header img {
                border: 0;
                height: 50px;
                vertical-align: middle;
        }
nav {
        background-color: darkorange;
        box-shadow: 0 0 4px dimgray;
        padding: .5em 0;
        text-align: center;
}
        nav &gt; a {
                color: white;
                background-color: transparent;
                padding: .5em 1em;
        }
        nav &gt; a:hover {
                background-color: orange;
        }
main {
        border-left: 1px dotted lightgray;
        border-right: 1px dotted lightgray;
        margin: 0 10%;
        padding: 2em 1em;
}
        main a {
                color: royalblue;
        }
        main a:hover {
                color: dodgerblue;
        }
        main h2 {
                border-bottom: 1px solid dimgray;
                font-size: 1.2em;
                margin: 2em 0;
                text-align: center;
                text-transform: uppercase;
        }
footer {
        color: dimgray;
        background-color: lightgray;
        border-top: 2px solid dimgray;
        font-size: small;
        padding: 1em 0;
        text-align: center;
}
        footer a {
                color: black;
        }
        footer a:hover {
                color: dimgray;
        }
```

![HTML sample site][24]

### Learn more

This is just an introduction to writing your own HTML web pages. There is lots more to learn. By experimenting and with a little practice, you can build your own web pages that look clean and modern, yet are easy to maintain.

Having mastered the basics, you can use these other resources to learn more about creating web pages, including HTML and stylesheets:

#### [W3Schools][25]

An excellent resource for building web pages. It also includes tutorials and code samples to get you up and running quickly. I often use W3Schools as a reference when I'm trying something new.

#### [Mozilla's HTML Guide][26]

A great guide to using HTML. Mozilla also provides Beginner's tutorials so you can learn how to create your own web pages.

#### [Mozilla's CSS Guide][27]

Another great reference provided by the Mozilla folks. Includes tutorials that help you teach yourself about stylesheets.

#### [PHP][28]

Interested in taking your websites to the next level? Once you're able to craft your own HTML pages, try adding PHP code to make your web pages more dynamic. This website includes lots of examples and tutorials.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/build-websites

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0 (website design image)
[2]: https://typo3.org/
[3]: http://december.com/html/4/element/html.html
[4]: http://december.com/html/4/element/head.html
[5]: http://december.com/html/4/element/body.html
[6]: http://december.com/html/4/element/header.html
[7]: http://december.com/html/4/element/nav.html
[8]: http://december.com/html/4/element/footer.html
[9]: https://example.com/
[10]: http://december.com/html/4/element/h1.html
[11]: http://december.com/html/4/element/img.html
[12]: http://december.com/html/4/element/a.html
[13]: http://wiki.freedos.org/"\>Wiki\
[14]: http://december.com/html/4/element/h2.html
[15]: http://december.com/html/4/element/p.html
[16]: http://december.com/html/4/element/b.html
[17]: http://wiki.freedos.org/"\>Read
[18]: https://twitter.com/freedos\_project"\>Follow
[19]: http://december.com/html/4/element/i.html
[20]: mailto:jhall@freedos.org
[21]: https://opensource.com/sites/default/files/uploads/html1-plain.png (Plain text HTML)
[22]: http://december.com/html/4/element/style.html
[23]: https://opensource.com/sites/default/files/uploads/html2-stylesheets.png (HTML stylesheet)
[24]: https://opensource.com/sites/default/files/uploads/html3-final.png (HTML sample site)
[25]: https://www.w3schools.com/
[26]: https://developer.mozilla.org/en-US/docs/Web/HTML
[27]: https://developer.mozilla.org/en-US/docs/Web/CSS
[28]: https://www.php.net/manual/en/intro-whatis.php
