[#]: subject: "How to Convert a Webpage to PDF in Linux"
[#]: via: "https://itsfoss.com/convert-webpage-pdf-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Convert a Webpage to PDF in Linux
======

Saving a webpage as a PDF comes in handy when you archive certain resources or use them for educational purposes.

But, how do you convert a webpage to PDF in Linux?

_**You can either choose to go the easy way out using the web browser (GUI) on every Linux distribution or use the terminal to turn a webpage into a PDF file.**_

Here, I shall mention both the methods to help you get the job done.

### Method 1: Converting a Webpage to PDF Using Web Browser

Even though I use Mozilla Firefox for this tutorial, you can do the same thing with any of the [best browsers available for Linux.][1]

![][2]

1\. Load up the webpage you want to convert.

2\. Head to the browser menu to find the “**Print**” option or use the keyboard shortcut “**Ctrl + P**.”

3\. By default, it should let you save it as a PDF. You need to hit “Save,” and choose the destination and save the webpage.

![Save webpage as PDF in Mozilla Firefox][3]

The one major problem with this simple approach is that it includes all the elements on the page. This may include comments, footer etc. You may use a PDF editor to remove parts of it but that’s an additional task.

_**A better option is to utilize a browser extension like [Print Friendly][4]. It allows you to edit and remove parts of the webpage before downloading the PDF.**_

### Method 2: Converting a Webpage to PDF or Images Using the Terminal

You probably already know that you can [browse internet in Linux terminal][5] and even [download files using the command line][6]. That’s not surprising considering you can do a lot more in the terminal, including downloading a webpage as PDF.

A nifty open-source command-line tools **wkhtmltopdf** and **wkhtmltoimage** come to the rescue that lets you convert any HTML webpage to a PDF or image file.

It utilizes the Qt WebKit rendering engine to get the task done. You can explore its [GitHub page][7] for more information.

You should be able to install it from the default repository of your Linux distribution. For Ubuntu-based distros, you can type in the command:

```
sudo apt install wkhtmltopdf
```

It is pretty straightforward to use no matter whether you want to convert it to a PDF or image file:

![][8]

To convert a webpage into a PDF, type in:

```
wkhtmltopdf URL/domain filename.pdf
```

As an example, here’s how it would look:

```
wkhtmltopdf linuxmint.com mint.pdf
```

You can choose to use the complete URL as “**<https://linuxmint.com**”> or use the domain name as shown in the example above.

The file generated will be saved in the home directory by default.

You also get a few exciting options when converting a webpage.

For instance, you can **apply a grayscale filter to the PDF file**, **make multiple copies of the page** in the same file, and **exclude images** during conversion.

The grayscale filter may not work on every webpage, but you can try that using the command:

```
wkhtmltopdf -g google.com googlepage.pdf
```

To make multiple copies of pages in the same PDF file, the command would be:

```
wkhtmltopdf --copies 2 linuxmint.com mint.pdf
```

And, if you want to exclude images from the web pages, just type:

```
wkhtmltopdf --no-images linuxmint.com mint.pdf
```

Additionally, if you want to convert a webpage as an image, the command would look like this:

```
wkhtmltoimage linuxmint.com mint.png
```

Note that unlike the GUI method using a browser, using these tools via the terminal has its limitation. It does not seem to convert web pages utilizing any &lt;iframe&gt; code snippets successfully.

Sites like ours and even DuckDuckGo didn’t convert to PDF or an image. However, simple HTML sites like Linuxmint.com, Ubuntu.com, Google.com, worked like charm.

### Wrapping Up

To get the best results, saving a webpage as a PDF using a browser seems to be the way to go. But, if you want more options and go through the terminal, the **wkhtmltopdf** utility should come in handy.

How do you prefer to convert web pages to PDF in Linux? Feel free to share your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/convert-webpage-pdf-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-browsers-ubuntu-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/mozilla-save-webpage-pdf.png?resize=800%2C536&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/mozilla-firefox-print-pdf-1.png?resize=602%2C584&ssl=1
[4]: https://www.printfriendly.com/
[5]: https://itsfoss.com/terminal-web-browsers/
[6]: https://itsfoss.com/download-files-from-linux-terminal/
[7]: https://github.com/wkhtmltopdf/wkhtmltopdf
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/htmltopdf-mint.png?resize=736%2C344&ssl=1
