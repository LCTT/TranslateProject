[#]: subject: (Write your first JavaScript code)
[#]: via: (https://opensource.com/article/21/7/javascript-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Write your first JavaScript code
======
JavaScript was created for the web, but it can do so much more. Learn
the basics, then download our cheat sheet so you always have the details
at hand.
![Code with javascript on white background][1]

JavaScript is a programming language full of pleasant surprises. Many people first encounter JavaScript as a language for the web. There's a JavaScript engine in all the major browsers, there are popular frameworks such as JQuery, Cash, and Bootstrap to help make web design easier, and there are even programming environments written in JavaScript. It seems to be everywhere on the internet, but it turns out that it's also a useful language for projects like [Electron][2], an open source toolkit for building cross-platform desktop apps with JavaScript.

JavaScript is a surprisingly multipurpose language with a wide assortment of libraries for much more than just making websites. Learning the basics of the language is easy, and it's a gateway to building whatever you imagine.

### Install JavaScript

As you progress with JavaScript, you may find yourself wanting advanced JavaScript libraries and runtimes. When you're just starting, though, you don't have to install JavaScript at all. All major web browsers include a JavaScript engine to run the code. You can write JavaScript using your favorite text editor, load it into your web browser, and see what your code does.

### Get started with JavaScript

To write your first JavaScript code, open your favorite text editor, such as [Notepad++][3], [Atom][4], or [VSCode][5]. Because it was developed for the web, JavaScript works well with HTML, so first, just try some basic HTML:


```
&lt;[html][6]&gt;
  &lt;[head][7]&gt;
    &lt;[title][8]&gt;JS&lt;/[title][8]&gt;
  &lt;/[head][7]&gt;
  &lt;[body][9]&gt;
    &lt;[p][10] id="example"&gt;Nothing here.&lt;/[p][10]&gt;
  &lt;/[body][9]&gt;
&lt;/[html][6]&gt;
```

Save the file, and then open it in a web browser.

![HTML displayed in browser][11]

(Seth Kenlon, [CC BY-SA 4.0][12])

To add JavaScript to this simple HTML page, you can either create a JavaScript file and refer to it in the page's `head` or just embed your JavaScript code in the HTML using the `<script>` tag. In this example, I embed the code:


```
&lt;[html][6]&gt;
  &lt;[head][7]&gt;
    &lt;[title][8]&gt;JS&lt;/[title][8]&gt;
  &lt;/[head][7]&gt;
  &lt;[body][9]&gt;
    &lt;[p][10] id="example"&gt;Nothing here.&lt;/[p][10]&gt;

    &lt;[script][13]&gt;
      let myvariable = "Hello world!";

      document.getElementById("example").innerHTML = myvariable;
    &lt;/[script][13]&gt;
   
  &lt;/[body][9]&gt;
&lt;/[html][6]&gt;
```

Reload the page in your browser.

![HTML with JavaScript displayed in browser][14]

(Seth Kenlon, [CC BY-SA 4.0][12])

As you can see, the `<p>` tag as written still contains the string "Nothing here," but when it's rendered, JavaScript alters it so that it contains "Hello world" instead. Yes, JavaScript has the power to rebuild (or just help build) a webpage.

The JavaScript in this simple script does two things. First, it creates a variable called `myvariable` and places the string "Hello world!" into it. Finally, it searches the current document (the web page as the browser is rendering it) for any HTML element with the ID `example`. When it locates `example`, it uses the `innerHTML` function to replace the contents of the HTML element with the contents of `myvariable`.

Of course, using a custom variable isn't necessary. It's just as easy to populate the HTML element with something being dynamically created. For instance, you could populate it with a timestamp:


```
&lt;[html][6]&gt;
  &lt;[head][7]&gt;
    &lt;[title][8]&gt;JS&lt;/[title][8]&gt;
  &lt;/[head][7]&gt;
  &lt;[body][9]&gt;
    &lt;[p][10] id="example"&gt;Date and time appears here.&lt;/[p][10]&gt;

    &lt;[script][13]&gt;
      document.getElementById("example").innerHTML = Date();
    &lt;/[script][13]&gt;
   
  &lt;/[body][9]&gt;
&lt;/[html][6]&gt;
```

Reload the page to see a timestamp generated at the moment the page is rendered. Reload a few times to watch the seconds increment.

### JavaScript syntax

In programming, **syntax** refers to the rules of how sentences (or "lines") are written. In JavaScript, each line of code must end in a semicolon (`;`) so that the JavaScript engine running your code understands when to stop reading.

Words (or "strings") must be enclosed in quotation marks (`"`), while numbers (or "integers") go without.

Almost everything else is a convention of the JavaScript language, such as variables, arrays, conditional statements, objects, functions, and so on.

### Creating variables in JavaScript

Variables are containers for data. You can think of a variable as a box where you can put data to share with your program. Creating a variable in JavaScript is done with two keywords you choose based on how you intend to use the variable: `let` and `var`. The `var` keyword denotes a variable intended for your entire program to use, while `let` creates variables for specific purposes, usually inside functions or loops.

JavaScript's built-in `typeof` function can help you identify what kind of data a variable contains. Using the first example, you can find out what kind of data `myvariable` contains by modifying the displayed text to:


```
&lt;string&gt;
let myvariable = "Hello world!";
document.getElementById("example").innerHTML = typeof(myvariable);
&lt;/string&gt;
```

This renders "string" in your web browser because the variable contains "Hello world!" Storing different kinds of data (such as an integer) in `myvariable` would cause a different data type to be printed to your sample web page. Try changing the contents of `myvariable` to your favorite number and then reloading the page.

### Creating functions in JavaScript

Functions in programming are self-contained data processors. They're what makes programming _modular_. It's because functions exist that programmers can write generic libraries that, for instance, resize images or keep track of the passage of time for other programmers (like you) to use in their own code.

You create a function by providing a custom name for your function followed by any amount of code enclosed within braces.

Here's a simple web page featuring a resized image and a button that analyzes the image and returns the true image dimensions. In this example code, the `<button>` HTML element uses the built-in JavaScript function `onclick` to detect user interaction, which triggers a custom function called `get_size`:


```
&lt;[html][6]&gt;
  &lt;[head][7]&gt;
    &lt;[title][8]&gt;Imager&lt;/[title][8]&gt;
  &lt;/[head][7]&gt;
  &lt;[body][9]&gt;

    &lt;[div][15]&gt;
      &lt;[button][16] onclick="get_size(document.getElementById('myimg'))"&gt;
        Get image size
    &lt;/[button][16]&gt;
    &lt;/[div][15]&gt;
   
    &lt;[div][15]&gt;
      &lt;[img][17] style="width: 15%" id="myimg" src="penguin.png" /&gt;
    &lt;/[div][15]&gt;
   
    &lt;[script][13]&gt;
      function get_size(i) {
        let w = i.naturalWidth;
        let h = i.naturalHeight;
        alert(w + " by " + h);
      }
    &lt;/[script][13]&gt;
   
  &lt;/[body][9]&gt;
&lt;/[html][6]&gt;
```

Save the file and load it into your web browser to try the code.

![Custom get_size function returns image dimensions][18]

(Seth Kenlon, [CC BY-SA 4.0][12])

### Cross-platform apps with JavaScript

You can see from the code sample how JavaScript and HTML work closely together to create a cohesive user experience. This is one of the great strengths of JavaScript. When you write code in JavaScript, you inherit one of the most common user interfaces of modern computing regardless of platform: the web browser. Your code is cross-platform by nature, so your application, whether it's just a humble image size analyzer or a complex image editor, video game, or whatever else you dream up, can be used by everyone with a web browser (or a desktop, if you deliver an Electron app).

Learning JavaScript is easy and fun. There are lots of websites with tutorials available. There are also over a million JavaScript libraries to help you interface with devices, peripherals, the Internet of Things, servers, file systems, and lots more. And as you're learning, keep our [**JavaScript cheat sheet**][19] close by so you remember the fine details of syntax and structure.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/javascript-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lixin555](https://github.com/lixin555)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code2.png?itok=JCJTJszs (Code with javascript on white background)
[2]: https://www.electronjs.org/
[3]: https://opensource.com/article/16/12/notepad-text-editor
[4]: https://opensource.com/article/20/12/atom
[5]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[6]: http://december.com/html/4/element/html.html
[7]: http://december.com/html/4/element/head.html
[8]: http://december.com/html/4/element/title.html
[9]: http://december.com/html/4/element/body.html
[10]: http://december.com/html/4/element/p.html
[11]: https://opensource.com/sites/default/files/pictures/plain-html.jpg (HTML displayed in browser)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: http://december.com/html/4/element/script.html
[14]: https://opensource.com/sites/default/files/uploads/html-javascript.jpg (HTML with JavaScript displayed in browser)
[15]: http://december.com/html/4/element/div.html
[16]: http://december.com/html/4/element/button.html
[17]: http://december.com/html/4/element/img.html
[18]: https://opensource.com/sites/default/files/uploads/get-size.jpg (Custom get_size function returns image dimensions)
[19]: https://opensource.com/downloads/javascript-cheat-sheet
