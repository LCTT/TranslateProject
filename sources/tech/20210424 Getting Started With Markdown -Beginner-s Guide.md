[#]: subject: (Getting Started With Markdown [Beginner’s Guide])
[#]: via: (https://itsfoss.com/markdown-guide/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Getting Started With Markdown [Beginner’s Guide]
======

In my work, I often have to write code, write the documentation that goes with that code, create Web pages, and work on text restoration projects, and have written several formal papers while I was in school. I can include class notes here, too; I needed to write them for nearly every class.

I use Markdown for nearly all of my writing and it is a major time-saver for me.

In this article, I am going to share my experience with Markdown. You’ll be learning the following:

  * What is Markdown?
  * How does it work?
  * Markdown basic syntax and how to use them



### What is Markdown?

If you are new to Markdown, it is a text-to-HTML conversion tool for web writers. Markdown files follow a specific syntax that is easy to read and just as easy to write. They are plain text files so they can be created using any text editor on any computer. These files can then be turned into Web pages – and Web pages are built using a markup called HTML.

Markdown then, is just a way to create Web pages without the need (or even know how) to write HTML code. Actually, Markdown is an great way to format plain text even if you don’t have to convert to HTML. Someone once described Markdown to me this way:

> “It isn’t _what you see is what you get_, but _what you see is what you mean_”.

Markdown, however, is more than an easy formatting scheme, it is also a software tool that converts the plain text formatting to HTML.

This is why the syntax is important. If you want a title on your Web page, Markdown will create one based on the character(s) you use in front of your title. A sampling of some of Markdown’s syntax is shown this screenshot:

![Markdown to HTML conversion][1]

### So how do I make this plain text to HTML conversion?

John Gruber’s Markdown is a Perl script that is run on the command line. Basically, it reads the Markdown text that you create and builds a Web page from it.

I will avoid the command line here since there are [many outstanding Markdown editors][2] that can do this conversion for you. Not only that, many of these editors will let you write your text and show you what the Web page will look like (called _rendering_) at the same time.

Markdown editors are generally set up to show two frames. The left frame is where you write your text and the right frame shows you what the formatted text will look like in HTML:

![Most Markdown editors have two panes to write and preview the text][3]

When you are finished with your text and are happy with it, simply save the Markdown file. This way, you’ll always have it in case you need to edit or rewrite later. Once the file is saved, you can have the editor export the markdown file to HTML.

The editor will create the Web page, using your Markdown as a reference. Your Markdown file will not be changed during an export – you will still have it – along with a separate, newly created HTML (Web page) file that you can put on a Web server.

**Note**: Many Markdown editors can also export your Markdown files to other formats, such as `.doc`, `.docx`, and `.pdf`. You can learn about those advanced setups, and extra software you might need, later on.

### Basic Markdown Syntax

To get the new Markdown user up to speed quickly, I will limit this to cover the syntax I use most often. These, I believe will be the most helpful – you can be productive now while you learn more about what Markdown can do for you later on.

#### Write Headings

I normally use `#` characters to denote headings. There are six levels:

```
# Level 1 Heading
## Level 2 Heading
### Level 3 Heading
#### Level 4 Heading
##### Level 5 Heading
###### Level 6 Heading
```

There is another heading style that uses lines underneath the text. I rarely use this type of heading since I am limited to only two. A double line, which is made with the `=` character, makes a `H1` heading. A single line, made with the `-` character, makes a `H2` heading:

```
Level 1 Heading
===============

Level 2 Heading
---------------
```

![][4]

#### Paragraphs

Paragraphs are separated by a blank line (make sure that there is a blank line between paragraphs). Do not indent the first line at all. Indenting with a `<Tab>` or `<spaces>` has a different purpose in Markdown.

A paragraph is a block of text and should not be indented with spaces or tabs. It can have one line or many lines. To end a paragraph and start a new one, the `<Enter>` key is hit twice; paragraphs are separated by a blank line.

![][5]

#### Line Breaks

Remember that with paragraphs, a blank line has to separate them and this is done by pressing twice on the `<Enter>` key. Markdown is strict about it.

Markdown does not support “hard-wrapped” or “fixed-line-length” paragraphs. That is, hitting the `<Enter>` key once will not force text to a new line. It may appear so in the editing window, but the HTML won’t show it.

Yet, there will be times when you may need to break up paragraphs with some way to break up a line. Markdown does have a way to do this but it may seem a little strange at first: **a line break is made by ending a line with two or more spaces and then hitting the `<Enter>` key once.**

![][6]

Here is a working example of a short verse. Each line has two spaces at the end. The last line, since it’s the end of the verse, doesn’t have the extra spaces. Since it’s the end of the verse (paragraph), I hit the `<Enter>` key twice:

Baa, baa black sheep,
Have you any wool?.
Yes, sir. Yes, sir.
Three bags full.

Adding two spaces at the end of a line, to create a line break, can take some getting used to.

![][7]

#### Horizontal Rules

Horizontal rules are great for splitting up text into sections.

Use three or more dashes `-`, underscores `_`, or asterisks `*` for horizontal rules, like so:

```
`---`

`***`

`___`
```

You can even put spaces between the characters:

```
`- - -`
```

I do not use horizontal rules very often in articles or papers, but they come in handy for me in journal entries, system logs, and class notes.

![][8]

#### Emphasis on text with bold and italics

When you want a word or phrase to stand out and be noticed, you can either make it bold or italicized. Italics and bold text can be made on one of two ways. The first is by surrounding the text with asterisks `*`, while the second is to use underscores `_`.

To italicize a word or phrase, surround the text with one underscore or asterisk. To make a word or phrase bold, surround it with two underscores or asterisks:

```
This is *italics* made with asterisks.

This is _italics_ made with underscores.

This is **bold** made with asterisks.

This is __bold__ made with underscores.
```

Remember to use the same character. An asterisk on one side of a word or phrase, and an underscore on the side, will not work. The same character has to be on both sides of the word or phrase.

![][9]

#### Block quotes

Block quotes are used for direct quotes. If you were writing a blog entry and you wanted to repeat something that Benjamin Franklin said, you could use a block quote.

A right angle bracket is used to specify a block quote:

```
> This is a block quote.

>> Use two right angle brackets if you want a block quote that is further indented.
```

![][10]

#### Adding links in Markdown

Links are just plain cool. There are three ways to create links on basic Markdown, but I will only cover two here: Regular links and automatic links.

The third type of link, called reference links, are supported in basic Markdown and more advanced flavors. I want to get to started quickly. You can look up reference links when you are ready for that.

Regular links let you link to various websites. The name of the site, or a phrase you want to use, is placed in square brackets `[]`. The actual link is inside parentheses `()`.

```
Visit [It's FOSS](https://itsfoss.com) today!
```

Automatic links are made with angle brackets `<>` surrounding the link. The link is an actual address (either a Web or email address). The link is spelled out and, when it is converted to HTML, the spelled out link becomes a working link.

```
<http://automatic-link-to-url.com/>

<[email protected]>
```

This is useful for when you want to spell out the address in your text:

![][11]

#### Adding images in Markdown

Links to images are almost identical to links to Web sites. The small difference between site links and images, is that image links begin with a bang (exclamation point) `!`

The name of the image, or a descriptive phrase of the image, is placed in square brackets `[]`. The actual link is inside parentheses `()`.

You can embed images like so:

```
![alternate text](./images/image.jpg)
```

Here’s an example image link. It is a sample link, with no image, but it is a decent sample of how an actual link might look like:

```
![a picture of bill](./images/my_photo_of_me.jpg)
```

![][12]

#### Lists

Lists are made for many reasons. They can be used as ‘things to do’ items, topic elements in an outline, parts lists in an assembly project, and so on. There are two main types of lists: unordered and ordered.

Unordered lists are not numbered; these are the ‘bullet items’ we see in many documents. Ordered lists are numbered.

To create an ordered (numbered) list, just begin each line with a number, like so:

```
1. Item one.
2. Item two.
3. Item three.
```

Unordered lists are not numbered, but use either an asterisk `*`, a plus sign `+`, or a minus sign `-` at the beginning of each item on the list. I prefer to use either an asterisk or minus sign, but you get to choose:

```
* Item one.
+ Item two.
- Item three.
```

Sub-items can be added to both ordered and unordered lists by indenting, like so:

```
1. Item 1
    1. Sub-item 1
    2. Sub-item 2
2. Item 2
3. Item 3
```

![][13]

### Markdown syntax cheat sheet

For your reference, here is a short listing of Markdown syntax that has been covered in this small introduction.

If you decide to adopt it as a writing tool, you’ll find that Markdown has the means to simplify writing even more.

![][14]

[Download Markdown Cheat Sheet in PDF format][15]

### Conclusion

Markdown can do more than what I have described here. A huge percentage of my writing can be accomplished with the Markdown syntax I have covered here – and these are the items I use most often even in more complex projects.

If all of this seems too simple, it really is that easy. Markdown was built to simply the writing task, but you don’t have to take my word for it. Try it out! There is no need to install a Markdown editor; you can do this online. There are several [good online Markdown editors][16]. Here are three that I prefer:

John Gruber’s [Dingus][17], [Editor.md][18], and [Dillinger][19]. Editor.md and Dillinger will let you see your Markdown rendered as HTML in real time. Dingus doesn’t preview in real time, but there is a Markdown syntax cheat sheet on the page for reference.

![][20]

Try out some of the examples in this article on either of these online editors. Try out some of your own ideas, too. This will let you get used to Markdown before possibly committing to learn more about it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/markdown-guide/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/retext_window_showing_syntax_and_preview-2.png?resize=800%2C429&ssl=1
[2]: https://itsfoss.com/best-markdown-editors-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/ghostwriter_two_frames-1.png?resize=800%2C458&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/1_md_headings_vscodium.png?resize=800%2C485&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/2_md_paragraphs_example_vscodium.png?resize=800%2C593&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/3_md_line_break_fail_vscodium.png?resize=800%2C593&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/4_md_line_break_success_vscodium.png?resize=800%2C450&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/5_md_horizontal_rules_vscodium.png?resize=800%2C326&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/6_md_emphasis_vscodium.png?resize=800%2C393&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/7_md_blockquotes_vscodium.png?resize=800%2C393&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/8_md_links_vscodium.png?resize=800%2C678&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/9_md_images_vscodium.png?resize=800%2C725&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/10_md_lists_vscodium.png?resize=800%2C725&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/markdown-syntax-cheatsheet.png?resize=727%2C743&ssl=1
[15]: https://drive.google.com/file/d/1y-Qz9PX_2HksEG5D_WwN-asNB-tpjZHV/view?usp=sharing
[16]: https://itsfoss.com/online-markdown-editors/
[17]: https://daringfireball.net/projects/markdown/dingus
[18]: http://editor.md.ipandao.com/en.html
[19]: https://dillinger.io/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/editor-md_page_in_browser-1.png?resize=800%2C505&ssl=1
