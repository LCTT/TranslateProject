Add free books to your eReader: Formatting tips
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_library_reading_list_colorful.jpg?itok=jJtnyniB)

In my recent article, [A handy way to add free books to your eReader][1], I explained how to convert the plaintext indexes at [Project Gutenberg][2] to HTML and then EPUBs. But as one commenter noted, there is a problem in older indexes, where individual books are not always separated by an extra newline character.

I saw quite vividly the extent of the problem when I was working on the index for 2007, where you see things like this:
```
Audio: The General Epistle of James                                      22931
Audio: The Epistle to the Hebrews                                        22930
Audio: The Epistle of Philemon                                           22929

Sacrifice, by Stephen French Whitman                                     22928
The Atlantic Monthly, Volume 18, No. 105, July 1866, by Various          22927
The Continental Monthly, Vol. 6, No 3,  September 1864, by Various       22926

The Story of Young Abraham Lincoln, by Wayne Whipple                     22925
Pathfinder, by Alan Douglas                                              22924
  [Subtitle: or, The Missing Tenderfoot]
Pieni helmivyo, by Various                                               22923
  [Subtitle: Suomen runoja koulunuorisolle]
  [Editor: J. Waananen]  [Language: Finnish]
The Posy Ring, by Various                                                22922
```

My first reaction was, "Well, how bad can it be to just add newlines where needed?" The answer: "Really bad." After days of working this way and stopping only when the cramps in my hand became too annoying, I decided to revisit the problem. I thought I might need to do multiple Find-Replace passes, maybe keyed on things like `[Language: Finnish] `or maybe just the `]` bracket, but this seemed almost as laborious as the manual method.

Then I noticed a particular feature: For most instances where a newline was needed, a newline character was immediately followed by the capital letter of the next title. For lines where there was still more information about the book, the newline was followed by spaces. So I tried this: In the Find text box in [KWrite][3] (remember, we’re using regex), I put:
```
(\n[A-Z])

```

and in Replace, I put:
```
\n\1

```

For every match inside the parentheses, I added a preceding newline, retaining whatever the capital letter was. This worked extremely well. The few instances where it failed involved book titles beginning with a number or with quotes. I fixed these manually, but I could have put this:
```
(\n[0-9])

```

In Find and run Replace All again. Later, I also tried it with the quotes—this requires a backslash, like this:
```
(\n\”) and (\n\’)

```

One side effect is that a number of the listings were separated by three newline characters. Not an issue for XHTML, but easily fixed by putting in Find:
```
\n\n\n

```

and in Replace:
```
\n\n

```

To review the process with the new features:

  1. Remove the preamble and other text you don’t want
  2. Add extra newlines with the method shown above
  3. Convert three consecutive newlines to two (optional)
  4. Add the appropriate HTML tags at the beginning and end
  5. Create the links based on finding `(\d\d\d\d\d)`, replacing with `<a href=”http://www.gutenberg.org/ebooks/``\1”>\1</a>`
  6. Add paragraph tags by finding `\n\n` and replacing with `</p>\n\n<p>`
  7. Add a `</p>` just before the `</body>` tag at the end
  8. Fix the headers, preceding each with `<h3>` and changing the `</p>` to `</h3>` – the older indexes have only a single header
  9. Save the file with an `.xhtml` suffix, then import to [Sigil][4] to make your EPUB.



The next issue that comes up is when the eBook numbers include only four digits. This is a problem since there are many four-digit numbers in the listings, many of which are dates. The answer comes from modifying our strategy in point 5 in the above listing.

In Find, put:

`(\d\d\d\d)\n`

and in Replace, put:

`<a href="[http://www.gutenberg.org/ebooks/](http://www.gutenberg.org/ebooks/)\1">\1</a>\n`

Notice that the `\n` is outside the parentheses; therefore, we need to add it at the end of the new replacement. Now we see another problem resulting from this new method: Some of the eBook numbers are followed by C (copyrighted). So we need to do another pass in Find:

`(\d\d\d\d)C\n`

and in Replace:

`<a href=”[http://www.gutenberg.org/ebooks/](http://www.gutenberg.org/ebooks/)\1”>\1</a>C\n`

I noticed that as of the 2002 index, the lack of extra newlines between listings was no longer a problem, and this continued all the way to the very first index, so steps 2 and 3 became unnecessary.

I’ve now taken the process all the way to the beginning, GUTINDEX.1996, and this process works all the way. At one point three-digit eBook numbers appear, so you must begin to Find:

`(\d\d\d)\n` and then `(\d\d\d)C\n`

Then later:

`(\d\d)\n` and then `(\d\d)C\n`

And finally:

`(\d)\n`

The only glitch was in one book, eBook number 2, where the date "1798" was snagged by the three-digit search. At this point, I now have eBooks of the entire Gutenberg catalog, not counting new books presently being added.

### Troubleshooting and a bonus

I strongly advise you to test your XHTML files by trying to load them in a browser. Your browser should tell you if your XHTML is not properly formatted, in which case the file won’t show in your browser window. Two particular problems I found, having initially ignored my own advice, resulting from improper characters. I copied the link specification tags from my first article. If you do that, you will find that the typewriter quotes are substituted with typographic (curly) quotes. Fixing this was just a matter of doing a Find/Replace.

Second, there are a number of ampersands (&) in the listings, and these need to be replaced by &amp; for the browser to make sense of them. Some recent listings also use the Unicode non-breaking space, and these should be replaced with a regular space. (Hint: Copy one, put it in Find, put a regular space in Replace, then Replace All)

Finally, there may be some accented characters lurking, and the browser feedback should help locate them. Example: Ibáñez needed to be Ib&aacute;&ntilde;ez.

And now the bonus: Once your XHTML is well-formed, you can use your browser to comb Project Gutenberg just like on your e-reader. I also found that [Calibre][5] would not make the links properly until the quotes were fixed.

Finally, here is a template for a separate web page you can place on your system to easily link to each year’s listing on your system. Make sure you fix the locations for your personal directory structure and filenames. Also, make sure all these quotes are typewriter quotes, not curly quotes.
```
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GutIndexes</title>
</head>
<body leftmargin="100">
<h2>GutIndexes</h2>
<font size="5">
<table cellpadding="20"><tr>
<td><a href="/home/gregp/Documents/GUTINDEX.1996.xhtml">1996</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.1997.xhtml">1997</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.1998.xhtml">1998</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.1999.xhtml">1999</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2000.xhtml">2000</a></td></tr>
<tr><td><a href="/home/gregp/Documents/GUTINDEX.2001.xhtml">2001</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2002.xhtml">2002</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2003.xhtml">2003</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2004.xhtml">2004</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2005.xhtml">2005</a></td></tr>
<tr><td><a href="/home/gregp/Documents/GUTINDEX.2006.xhtml">2006</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2007.xhtml">2007</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2008.xhtml">2008</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2009.xhtml">2009</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2010.xhtml">2010</a></td></tr>
<tr><td><a href="/home/gregp/Documents/GUTINDEX.2011.xhtml">2011</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2012.xhtml">2012</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2013.xhtml">2013</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2014.xhtml">2014</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2015.xhtml">2015</a></td></tr>
<tr><td><a href="/home/gregp/Documents/GUTINDEX.2016.xhtml">2016</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2017.xhtml">2017</a></td>
<td><a href="/home/gregp/Documents/GUTINDEX.2018.xhtml">2018</a></td>
</tr>
</table>
</font>
</body>
</html>
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/more-books-your-ereader

作者：[Greg Pittman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://opensource.com/article/18/4/browse-project-gutenberg-library
[2]:https://www.gutenberg.org/
[3]:https://www.kde.org/applications/utilities/kwrite/
[4]:https://sigil-ebook.com/
[5]:https://calibre-ebook.com/
