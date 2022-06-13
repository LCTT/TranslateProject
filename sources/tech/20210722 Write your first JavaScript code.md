[#]: subject: "Write your first JavaScript code"
[#]: via: "https://opensource.com/article/21/7/javascript-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write your first JavaScript code
======
JavaScript was created for the web, but it can do so much more. Learn the basics, then download our cheat sheet so you always have the details at hand.

![open source programming][1]

Image by: Opensource.com

JavaScript is a programming language full of pleasant surprises. Many people first encounter JavaScript as a language for the web. There's a JavaScript engine in all the major browsers, there are popular frameworks such as JQuery, Cash, and Bootstrap to help make web design easier, and there are even programming environments written in JavaScript. It seems to be everywhere on the internet, but it turns out that it's also a useful language for projects like [Electron][2], an open source toolkit for building cross-platform desktop apps with JavaScript.

JavaScript is a surprisingly multipurpose language with a wide assortment of libraries for much more than just making websites. Learning the basics of the language is easy, and it's a gateway to building whatever you imagine.

### Install JavaScript

As you progress with JavaScript, you may find yourself wanting advanced JavaScript libraries and runtimes. When you're just starting, though, you don't have to install JavaScript at all. All major web browsers include a JavaScript engine to run the code. You can write JavaScript using your favorite text editor, load it into your web browser, and see what your code does.

### Get started with JavaScript

To write your first JavaScript code, open your favorite text editor, such as [Notepad++][3], [Atom][4], or [VSCode][5]. Because it was developed for the web, JavaScript works well with HTML, so first, just try some basic HTML:

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Nothing here.</p>
  </body>
</html>
```

Save the file, and then open it in a web browser.

![HTML displayed in browser][6]

To add JavaScript to this simple HTML page, you can either create a JavaScript file and refer to it in the page's `head`  or just embed your JavaScript code in the HTML using the `<script>` tag. In this example, I embed the code:

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Nothing here.</p>

    <script>
      let myvariable = "Hello world!";

      document.getElementById("example").innerHTML = myvariable;
    </script>

  </body>
</html>
```

Reload the page in your browser.

![HTML with JavaScript displayed in browser][7]

As you can see, the `<p>` tag as written still contains the string "Nothing here," but when it's rendered, JavaScript alters it so that it contains "Hello world" instead. Yes, JavaScript has the power to rebuild (or just help build) a webpage.

The JavaScript in this simple script does two things. First, it creates a variable called `myvariable` and places the string "Hello world!" into it. Finally, it searches the current document (the web page as the browser is rendering it) for any HTML element with the ID `example`. When it locates `example`, it uses the `innerHTML` function to replace the contents of the HTML element with the contents of `myvariable`.

Of course, using a custom variable isn't necessary. It's just as easy to populate the HTML element with something being dynamically created. For instance, you could populate it with a timestamp:

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Date and time appears here.</p>

    <script>
      document.getElementById("example").innerHTML = Date();
    </script>
    
  </body>
</html>
```

Reload the page to see a timestamp generated at the moment the page is rendered. Reload a few times to watch the seconds increment.

### JavaScript syntax

In programming, **syntax** refers to the rules of how sentences (or "lines") are written. In JavaScript, each line of code must end in a semicolon (`;` ) so that the JavaScript engine running your code understands when to stop reading.

Words (or "strings") must be enclosed in quotation marks (`"` ), while numbers (or "integers") go without.

Almost everything else is a convention of the JavaScript language, such as variables, arrays, conditional statements, objects, functions, and so on.

### Creating variables in JavaScript

Variables are containers for data. You can think of a variable as a box where you can put data to share with your program. Creating a variable in JavaScript is done with two keywords you choose based on how you intend to use the variable: `let` and `var`. The `var` keyword denotes a variable intended for your entire program to use, while `let` creates variables for specific purposes, usually inside functions or loops.

JavaScript's built-in `typeof` function can help you identify what kind of data a variable contains. Using the first example, you can find out what kind of data `myvariable` contains by modifying the displayed text to:

```
<string>
let myvariable = "Hello world!";
document.getElementById("example").innerHTML = typeof(myvariable);
</string>
```

This renders "string" in your web browser because the variable contains "Hello world!" Storing different kinds of data (such as an integer) in `myvariable` would cause a different data type to be printed to your sample web page. Try changing the contents of `myvariable` to your favorite number and then reloading the page.

### Creating functions in JavaScript

Functions in programming are self-contained data processors. They're what makes programming *modular*. It's because functions exist that programmers can write generic libraries that, for instance, resize images or keep track of the passage of time for other programmers (like you) to use in their own code.

You create a function by providing a custom name for your function followed by any amount of code enclosed within braces.

Here's a simple web page featuring a resized image and a button that analyzes the image and returns the true image dimensions. In this example code, the `<button>` HTML element uses the built-in JavaScript function `onclick` to detect user interaction, which triggers a custom function called `get_size` :

```
<html>
  <head>
    <title>Imager</title>
  </head>
  <body>

    <div>
      <button onclick="get_size(document.getElementById('myimg'))">
        Get image size
    </button>
    </div>
    
    <div>
      <img style="width: 15%" id="myimg" src="penguin.png" />
    </div>
   
    <script>
      function get_size(i) {
        let w = i.naturalWidth;
        let h = i.naturalHeight;
        alert(w + " by " + h);
      }
    </script>
    
  </body>
</html>
```

Save the file and load it into your web browser to try the code.

![Custom get_size function returns image dimensions][8]

### Cross-platform apps with JavaScript

You can see from the code sample how JavaScript and HTML work closely together to create a cohesive user experience. This is one of the great strengths of JavaScript. When you write code in JavaScript, you inherit one of the most common user interfaces of modern computing regardless of platform: the web browser. Your code is cross-platform by nature, so your application, whether it's just a humble image size analyzer or a complex image editor, video game, or whatever else you dream up, can be used by everyone with a web browser (or a desktop, if you deliver an Electron app).

Learning JavaScript is easy and fun. There are lots of websites with tutorials available. There are also over a million JavaScript libraries to help you interface with devices, peripherals, the Internet of Things, servers, file systems, and lots more. And as you're learning, keep our [JavaScript cheat sheet][9] close by so you remember the fine details of syntax and structure.

Image by: (Seth Kenlon, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/javascript-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code2.png
[2]: https://www.electronjs.org/
[3]: https://opensource.com/article/16/12/notepad-text-editor
[4]: https://opensource.com/article/20/12/atom
[5]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[6]: https://opensource.com/sites/default/files/pictures/plain-html.jpg
[7]: https://opensource.com/sites/default/files/uploads/html-javascript.jpg
[8]: https://opensource.com/sites/default/files/uploads/get-size.jpg
[9]: https://opensource.com/downloads/javascript-cheat-sheet
