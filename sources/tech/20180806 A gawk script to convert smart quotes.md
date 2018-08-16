translating by lujun9972
A gawk script to convert smart quotes
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourceprescription.png?itok=gFrc_GTH)

I manage a personal website and edit the web pages by hand. Since I don't have many pages on my site, this works well for me, letting me "scratch the itch" of getting into the site's code.

When I updated my website's design recently, I decided to turn all the plain quotes into "smart quotes," or quotes that look like those used in print material: “” instead of "".

Editing all of the quotes by hand would take too long, so I decided to automate the process of converting the quotes in all of my HTML files. But doing so via a script or program requires some intelligence. The script needs to know when to convert a plain quote to a smart quote, and which quote to use.

You can use different methods to convert quotes. Greg Pittman wrote a [Python script][1] for fixing smart quotes in text. I wrote mine in GNU [awk][2] (gawk).

> Get our awk cheat sheet. [Free download][3].

To start, I wrote a simple gawk function to evaluate a single character. If that character is a quote, the function determines if it should output a plain quote or a smart quote. The function looks at the previous character; if the previous character is a space, the function outputs a left smart quote. Otherwise, the function outputs a right smart quote. The script does the same for single quotes.
```
function smartquote (char, prevchar) {

        # print smart quotes depending on the previous character

        # otherwise just print the character as-is



        if (prevchar ~ /\s/) {

                # prev char is a space

                if (char == "'") {

                        printf("&lsquo;");

                }

                else if (char == "\"") {

                        printf("&ldquo;");

                }

                else {

                        printf("%c", char);

                }

        }

        else {

                # prev char is not a space

                if (char == "'") {

                        printf("&rsquo;");

                }

                else if (char == "\"") {

                        printf("&rdquo;");

                }

                else {

                        printf("%c", char);

                }

        }

}

```

With that function, the body of the gawk script processes the HTML input file character by character. The script prints all text verbatim when inside an HTML tag (for example, `<html lang="en">`. Outside any HTML tags, the script uses the `smartquote()` function to print text. The `smartquote()` function does the work of evaluating when to print plain quotes or smart quotes.
```
function smartquote (char, prevchar) {

        ...

}



BEGIN {htmltag = 0}



{

        # for each line, scan one letter at a time:



        linelen = length($0);



        prev = "\n";



        for (i = 1; i <= linelen; i++) {

                char = substr($0, i, 1);



                if (char == "<") {

                        htmltag = 1;

                }



                if (htmltag == 1) {

                        printf("%c", char);

                }

                else {

                        smartquote(char, prev);

                        prev = char;

                }



                if (char == ">") {

                        htmltag = 0;

                }

        }



        # add trailing newline at end of each line

        printf ("\n");

}

```

Here's an example:
```
gawk -f quotes.awk test.html > test2.html

```

Sample input:
```
<!DOCTYPE html>

<html lang="en">

<head>

  <title>Test page</title>

  <link rel="stylesheet" type="text/css" href="/test.css" />

  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width" />

</head>

<body>

  <h1><a href="/"><img src="logo.png" alt="Website logo" /></a></h1>

  <p>"Hi there!"</p>

  <p>It's and its.</p>

</body>

</html>

```

Sample output:
```
<!DOCTYPE html>

<html lang="en">

<head>

  <title>Test page</title>

  <link rel="stylesheet" type="text/css" href="/test.css" />

  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width" />

</head>

<body>

  <h1><a href="/"><img src="logo.png" alt="Website logo" /></a></h1>

  <p>&ldquo;Hi there!&rdquo;</p>

  <p>It&rsquo;s and its.</p>

</body>

</html>

```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/gawk-script-convert-smart-quotes

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/article/17/3/python-scribus-smart-quotes
[2]:/downloads/cheat-sheet-awk-features
[3]:https://opensource.com/downloads/cheat-sheet-awk-features
