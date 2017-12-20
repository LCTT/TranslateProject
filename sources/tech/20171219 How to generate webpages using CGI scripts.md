How to generate webpages using CGI scripts
======
Back in the stone age of the Internet when I first created my first business website, life was good.

I installed Apache and created a few simple HTML pages that stated a few important things about my business and gave important information like an overview of my product and how to contact me. It was a static website because the content seldom changed. Maintenance was simple because of the unchanging nature of my site.

## Static content

Static content is easy and still common. Let's take a quick look at a couple sample static web pages. You don't need a working website to perform these little experiments. Just place the files in your home directory and open them with your browser. You will see exactly what you would if the file were served to your browser via a web server.

The first thing you need on a static website is the index.html file which is usually located in the /var/www/html directory. This file can be as simple as a text phrase such as "Hello world" without any HTML markup at all. This would simply display the text string. Create index.html in your home directory and add "Hello world" (without the quotes) as it's only content. Open the index.html in your browser with the following URL.
```
file:///home/<yourhomedirectory>/index.html
```

So HTML is not required, but if you had a large amount of text that needed formatting, the results of a web page with no HTML coding would be incomprehensible with everything running together.

So the next step is to make the content more readable by using a bit of HTML coding to provide some formatting. The following command creates a page with the absolute minimum markup required for a static web page with HTML. You could also use your favorite editor to create the content.
```
echo "<h1>Hello World</h1>" > test1.html
```

Now view index.html and see the difference.

Of course you can put a lot of additional HTML around the actual content line to make a more complete and standard web page. That more complete version as shown below will still display the same results in the browser, but it also forms the basis for more standardized web site. Go ahead and use this content for your index.html file and display it in your browser.
```
<!DOCTYPE HTML PUBLIC "-//w3c//DD HTML 4.0//EN">
<html>
<head>
<title>My Web Page</title>
</head>
<body>
<h1>Hello World</h1>
</body>
</html>
```

I built a couple static websites using these techniques, but my life was about to change.

## Dynamic web pages for a new job

I took a new job in which my primary task was to create and maintain the CGI ([Common Gateway Interface][6]) code for a very dynamic website. In this context, dynamic means that the HTML needed to produce the web page on a browser was generated from data that could be different every time the page was accessed. This includes input from the user on a web form that is used to look up data in a database. The resulting data is surrounded by appropriate HTML and displayed on the requesting browser. But it does not need to be that complex.

Using CGI scripts for a website allows you to create simple or complex interactive programs that can be run to provide a dynamic web page that can change based on input, calculations, current conditions in the server, and so on. There are many languages that can be used for CGI scripts. We will look at two of them, Perl and Bash. Other popular CGI languages include PHP and Python.

This article does not cover installation and setup of Apache or any other web server. If you have access to a web server that you can experiment with, you can directly view the results as they would appear in a browser. Otherwise, you can still run the programs from the command line and view the HTML that would be created. You can also redirect that HTML output to a file and then display the resulting file in your browser.

### Using Perl

Perl is a very popular language for CGI scripts. Its strength is that it is a very powerful language for the manipulation of text.

To get CGI scripts to execute, you need the following line in the in httpd.conf for the website you are using. This tells the web server where your executable CGI files are located. For this experiment, let's not worry about that.
```
ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
```

Add the following Perl code to the file index.cgi, which should be located in your home directory for your experimentation. Set the ownership of the file to apache.apache when you use a web server, and set the permissions to 755 because it must be executable no matter where it is located.

```
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "<html><body>\n";
print "<h1>Hello World</h1>\n";
print "Using Perl<p>\n";
print "</body></html>\n";
```

Run this program from the command line and view the results. It should display the HTML code it will generate.

Now view the index.cgi in your browser. Well, all you get is the contents of the file. Browsers really need to have this delivered as CGI content. Apache does not really know that it needs to run the file as a CGI program unless the Apache configuration for the web site includes the "ScriptAlias" definition as shown above. Without that bit of configuration Apache simply send the data in the file to the browser. If you have access to a web server, you could try this out with your executable index files in the /var/www/cgi-bin directory.

To see what this would look like in your browser, run the program again and redirect the output to a new file. Name it whatever you want. Then use your browser to view the file that contains the generated content.

The above CGI program is still generating static content because it always displays the same output. Add the following line to your CGI program immediately after the "Hello World" line. The Perl "system" command executes the commands following it in a system shell, and returns the result to the program. In this case, we simply grep the current RAM usage out of the results from the free command.

```
system "free | grep Mem\n";
```

Now run the program again and redirect the output to the results file. Reload the file in the browser. You should see an additional line so that displays the system memory statistics. Run the program and refresh the browser a couple more times and notice that the memory usage should change occasionally.

### Using Bash

Bash is probably the simplest language of all for use in CGI scripts. Its primary strength for CGI programming is that it has direct access to all of the standard GNU utilities and system programs.

Rename the existing index.cgi to Perl.index.cgi and create a new index.cgi with the following content. Remember to set the permissions correctly to executable.

```
#!/bin/bash
echo "Content-type: text/html"
echo ""
echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Hello World</title>'
echo '</head>'
echo '<body>'
echo '<h1>Hello World</h1><p>'
echo 'Using Bash<p>'
free | grep Mem
echo '</body>'
echo '</html>'
exit 0
```

Execute this program from the command line and view the output, then run it and redirect the output to the temporary results file you created before. Then refresh the browser to view what it looks like displayed as a web page.

## Conclusion

It is actually very simple to create CGI programs that can be used to generate a wide range of dynamic web pages. This is a trivial example but you should now see some of the possibilities.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/cgi-scripts

作者：[David Both][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:http://december.com/html/4/element/html.html
[2]:http://december.com/html/4/element/head.html
[3]:http://december.com/html/4/element/title.html
[4]:http://december.com/html/4/element/body.html
[5]:http://december.com/html/4/element/h1.html
[6]:https://en.wikipedia.org/wiki/Common_Gateway_Interface
[7]:http://perldoc.perl.org/functions/system.html
