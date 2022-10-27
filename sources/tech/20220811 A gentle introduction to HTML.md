[#]: subject: "A gentle introduction to HTML"
[#]: via: "https://opensource.com/article/22/8/gentle-introduction-html"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A gentle introduction to HTML
======
Learn the markup language of the web.

![Digital creative of a browser on the internet][1]

I feel confident in claiming that HTML is the most widely used markup language ever. While other markup languages exist, including , LaTeX, and [Markdown][2], no other markup language is as widespread as the Hyper Text Markup Language. HTML is the de facto language of the Web. First implemented in web browsers in 1994, the language continues to evolve. Yet the basics of HTML remain the same.

If you are just getting started in HTML, I wanted to offer this gentle introduction to learning HTML. I focus on the essentials of HTML to build a basic understanding of how HTML works. You can use this as a starting point to learn more about HTML.

### Collect words to fill a paragraph

Let's start with a basic understanding of HTML and how client applications like web browsers display HTML documents. At its core, HTML *collects* words in a file and *fills* a paragraph. That means if you don't add instructions (called markup) to an HTML file, and just leave it as plain text, a web browser turns all that text into a single paragraph.

Start with this sample text, saved in a plain text file called `index.html`. This is a paragraph from the old *King's Toaster* story, an Internet fable about how you might build a toaster out of a microcontroller:

```
The engineer replied,

"Using a four-bit microcontroller, I would write a simple
program that reads the darkness knob and quantizes its
position to one of 16 shades of darkness, from snow white
to coal black.

The program would use that darkness level as the index to
a 16-element table of initial timer values.

Then it would turn on the heating elements and start the
timer with the initial value selected from the table.

At the end of the time delay, it would turn off the heat
and pop up the toast.

Come back next week, and I'll show you a working
prototype."
```

You can put this file on a web server and access it like you would any website, or you can save it to your local disk and open it directly in a web browser. How you get the file into the web browser doesn't really matter. But you should name the file with an `.html` extension, which web browsers recognize by default as an HTML file.

In this case, I've written the file on separate lines. I've also added some blank lines, to demonstrate that HTML doesn't care about extra white space. This extra space may help humans read the HTML code, but the web browser just treats it as one block by default. Viewed on a web browser, this file looks like this:

![The HTML page as displayed in a web browser][3]

Image by:

(Jim Hall, CC BY-SA 4.0)

### Inline and block elements

At the core of HTML is the concept of *inline* and *block* elements. You can think of block elements as *always filling a rectangle*. Inline elements *follow only the inline text*.

The basic block element is called the *division*, and uses the `<div>` tag. The basic inline element is the *span*, with the `<span>` tag. Most HTML tags are some kind of block element or inline element, so it helps to start with just these two to understand how they work.

Add some `<div>` and `<span>` tags to your HTML document to see what block and inline elements look like:

```
<div>
The engineer replied,

"Using a four-bit microcontroller, I would write a simple
program that reads the darkness knob and quantizes its
position to one of 16 shades of darkness, from snow white
to coal black.

<span>
The program would use that darkness level as the index to
a 16-element table of initial timer values.
</span>

Then it would turn on the heating elements and start the
timer with the initial value selected from the table.

At the end of the time delay, it would turn off the heat
and pop up the toast.

Come back next week, and I'll show you a working
prototype."
</div>
```

I've added a `<div>` block element around the whole paragraph, and a `<span>` around just one sentence. Notice that when I start an HTML element like `<div>` or `<span>`, I need to provide its corresponding *closing* tag like `</div>` and `</span>`. Most HTML elements are formed like this, with an opening and closing tag.

The web browser uses these tags to display HTML content in a certain way, but because `<div>` and `<span>` don't really define any special formatting on their own, you can't see that anything has changed. Your sample paragraph looks the same as before:

![This really is a different screenshot than the one above, but it looks exactly the same because &lt;div&gt; and &lt;span&gt; do not add extra styling to the web page][4]

Image by:

(Jim Hall, CC BY-SA 4.0)

You can include *direct styling* in these tags with a style instruction, so you can see how the block and inline elements behave. To make the boundaries of each element stand out, let's use a light blue background for the `<div>` block and a pink background for the `<span>` :

```
<div style="background-color:lightblue">
The engineer replied,

"Using a four-bit microcontroller, I would write a simple
program that reads the darkness knob and quantizes its
position to one of 16 shades of darkness, from snow white
to coal black.

<span style="background-color:pink">
The program would use that darkness level as the index to
a 16-element table of initial timer values.
</span>

Then it would turn on the heating elements and start the
timer with the initial value selected from the table.

At the end of the time delay, it would turn off the heat
and pop up the toast.

Come back next week, and I'll show you a working
prototype."
</div>
```

With these changes, the entire paragraph has a light blue background. The `<div>` block element is a rectangle, so the blue fills even the empty space after the last sentence ends. Meanwhile, the second sentence has a pink background. This highlight follows the sentence because `<span>` is an inline element.

![Adding colors helps us see the difference between block elements (blue) and inline elements (pink)][5]

Image by:

(Jim Hall, CC BY-SA 4.0)

Most HTML elements are either block or inline. The only difference is these other elements carry some default styles, depending on what they are. For example, `<p>` is a block element that has extra space above and below the block. The heading tags, `<h1>` through `<h6>`, are also block elements defined at different font sizes and text styles like italics and bold. The `<strong>` tag is an inline element that displays text in a **bold** weight. Similarly, `<em>` is also an inline element that sets the text in an *italics* style.

### Finishing an HTML page

Some HTML elements are required. While the sample HTML file you have used display correctly on any web browser, it is not technically a *correct* HTML page. There are a few elements you need to add:

Every HTML document should provide a document type declaration. Use the single tag `<!DOCTYPE html>` on the first line of the HTML file to define an HTML document. The HTML standard also expects you to wrap the document text in two block elements: `<html>` to define the full page, and `<body>` to define the document body.

```
<!DOCTYPE html>
<html>
<body>
<div style="background-color:lightblue">
The engineer replied,
...
</div>
</body>
</html>
```

HTML documents also need a `<head>` block before the `<body>` that provides *meta information* about the page. The only required meta information is the title of the document, defined by the `<title>` element:

```
<!DOCTYPE html>
<html>
<head>
<title>The King's Toaster</title>
</head>
<body>
<div style="background-color:lightblue">
The engineer replied,

"Using a four-bit microcontroller, I would write a simple
program that reads the darkness knob and quantizes its
position to one of 16 shades of darkness, from snow white
to coal black.

<span style="background-color:pink">
The program would use that darkness level as the index to
a 16-element table of initial timer values.
</span>

Then it would turn on the heating elements and start the
timer with the initial value selected from the table.

At the end of the time delay, it would turn off the heat
and pop up the toast.

Come back next week, and I'll show you a working
prototype."
</div>
</body>
</html>
```

The supporting tags like `<html>`, `<head>`, and `<body>` do not change how the HTML page appears in a web browser, but they are required for a technically correct HTML document:

![Adding colors helps us see the difference between block elements (blue) and inline elements (pink)][6]

Image by:

(Jim Hall, CC BY-SA 4.0)

This gentle introduction to HTML provides just the essentials of HTML, but now that you understand block and inline elements, you're well on your way to learning how to write HTML documents using other HTML tags.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/gentle-introduction-html

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_web_internet_website.png
[2]: https://opensource.com/%20https%3A//opensource.com/article/19/9/introduction-markdown
[3]: https://opensource.com/sites/default/files/2022-08/html-plain-text.webp
[4]: https://opensource.com/sites/default/files/2022-08/html-text-div-span.webp
[5]: https://opensource.com/sites/default/files/2022-08/html-text-div-span-color.webp
[6]: https://opensource.com/sites/default/files/2022-08/html-text-div-span-color.webp
