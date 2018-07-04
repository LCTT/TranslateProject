A handy way to add free books to your eReader
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDUCATION_colorbooks.png?itok=vNhsYYyC)
I do a lot of reading on my tablet every day. While I have bought a few eBooks, I enjoy finding things for free on [Project Gutenberg][1]; it rekindles fond memories of browsing through the stacks of a library for something to catch my interest. There are various ways to search the PG website by title or author, but this presumes you have some idea of what you’re looking for.

I have used the [Magic Catalog][2], but I seem to have seen or read every book listed there that interests me, and as far as I can tell the catalog is about ten years old. In 2017 alone, PG added 2,423 books to its catalog, so perhaps 20,000 have been added over the last ten years.

From the Project Gutenberg website, you can link to the [Offline Catalogs][3] and download a plain-text list of all the books freely available, but the file is 6.6 MB—a little unwieldy. Even the list for 2017 only is a bit tedious to scan. So I decided to make my own web page from this list, including links to each book (similar to the Magic Catalog), and turn that into an eBook. This turned out to be easier than you might expect. The trick is to use `regex`; specifically, `regex` as featured in [Kwrite][4].

First, strip out the preamble text, which explains various details about Project Gutenberg. The listing begins after that:
```
~ ~ ~ ~ Posting Dates for the below eBooks:  1 Dec 2017 to 31 Dec 2017 ~ ~ ~ ~



TITLE and AUTHOR                                                     ETEXT NO.



The Origin and Development of Christian Dogma, by Charles A. H. Tuthill  56279

 [Subtitle: An essay in the science of history]



Frank Merriwell's Endurance, by Burt L. Standish                         56278

 [Subtitle: or A Square Shooter]



Derelicts, by James Sprunt                                               56277

 [Subtitle: An Account of Ships Lost at Sea in General Commercial

  Traffic and a Brief History of Blockade Runners Stranded Along

  the North Carolina Coast 1861-1865]



Comical Pilgrim; or, Travels of a Cynick Philosopher..., by Anonymous    56276

 [Subtitle: Thro' the most Wicked Parts of the World, Namely,

  England, Wales, Scotland, Ireland, and Holland]



I'r Aifft Ac Yn Ol, by D. Rhagfyr Jones                                  56275

 [Language: Welsh]

```

This shows the structure of the text file. The 5-digit number is the search term for each book—for example, the first book would be found here: <http://www.gutenberg.org/ebooks/56279>. Each book is separated from the next by an empty line.

To start, download the file `GUTINDEX.2017`, load it into Kwrite, strip off the preamble, and Save As `GUTINDEX.2017.xhtml`, so the original is unedited just in case. You might as well put in the `xhtml` preamble:
```
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"

"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>GutIndex 2017</title>

</head>

<body>

```

Then at the bottom of the file:
```
</body>

</html>

```

I’m not a fan of the `~ ~ ~ ~` (four tildes separated by three spaces), so select Edit > Replace in Kwrite to bring up the Replace dialog at the bottom. You don’t need to select Regular expression as the Mode, but you’ll need it later, so go ahead and do that.

In Find, enter `~ ~ ~ ~` and nothing in Replace. Click Replace All, and they all disappear, with the message: 24 replacements.

Now let’s make the links. In Find, enter: `(\d\d\d\d\d)`. (You must include the parentheses.)

In Replace, enter: `<a href=”http://www.gutenberg.org/ebooks/\1”>\1</a>`

This searches for a sequence of 5 digits and replaces it with the link information, which includes the particular 5-digit number twice, denoted by `\1`. Now summon the courage to click Replace All (remember that you can undo this if you’ve made a mistake), and the magic happens: 2423 replacements. Here’s a fragment:
```
The Origin and Development of Christian Dogma, by Charles A. H. Tuthill  <a href="http://www.gutenberg.org/ebooks/56279">56279</a>

 [Subtitle: An essay in the science of history]



Frank Merriwell's Endurance, by Burt L. Standish                         <a href="http://www.gutenberg.org/ebooks/56278">56278</a>

 [Subtitle: or A Square Shooter]



Derelicts, by James Sprunt                                               <a href="http://www.gutenberg.org/ebooks/56277">56277</a>

 [Subtitle: An Account of Ships Lost at Sea in General Commercial

  Traffic and a Brief History of Blockade Runners Stranded Along

  the North Carolina Coast 1861-1865]

```

Witness the power of `regex`! Now let's create paragraphs to separate these individual books as whitespace and newlines mean nothing to HTML. Here is where we use that empty line between books. Before we do that, though, let’s eliminate the lines that contain headings:
```
TITLE and AUTHOR                                                     ETEXT NO.

```

We're doing this because they’re unnecessary, and the second heading is not going to line up with the ebook number anyway. I wanted to get rid of this line and the extra newline characters, and since there were only 12, I went through the file manually—but you can facilitate this by using Edit > Find, searching for ETEXT.

Now more `regex`. In Find, enter: `\n\n`

In Replace, enter: `</p>\n\n<p>`

Then Replace All. I leave in the two newline characters so the text file is easier to read. You will need to manually add `</p>` at the end of the list. At the beginning, you'll see this:
```
 Posting Dates for the below eBooks:  1 Dec 2017 to 31 Dec 2017 </p>



<p>The Origin and Development of Christian Dogma, by Charles A. H. Tuthill  <a href="http://www.gutenberg.org/ebooks/56279">56279</a>

```

I’d like to make the posting dates a header, but I also want to eliminate `Posting Dates for the below eBooks:` since simply showing the dates is enough. In Find, enter: `Posting Dates for the below eBooks:`, and in Replace, enter: `<h3>` (or `<h4>`).

Now let's fix that trailing `</p>` for each header. You could do this manually, but if you're feeling lazy, enter `2017 </p>` in Find, and `</h3>` in Replace. With each of these, there's a slight risk of doing too much, but the feedback will tell you how many replacements there are (there should be 12). And you always have Undo.

Now for some manual cleanup. Because you added the `<p>` and `</p>` tags, and because of the new `<h3>` tags, there will be extra paragraph tags and a mismatch in the region of these headers. You could simply scan the file at these points, or get some help by entering `<h3>` in the Find space, clicking Find All to highlight them, and scrolling down the file to get rid of any unneeded tags.

The other problem I found with XHTML was ampersands scattered throughout. Since XHTML is stricter than HTML, replace the `&` with `&amp;`. You may want to replace these individually using Replace instead of Replace All.

Some of the lines in the text file have some sort of control character that acts like `&nbsp;` (a non-breaking space). To fix this, highlight one in Kwrite—they show up as a faint baseline with a vertical bump—paste it into Find, and enter a space in Replace. This maintains visual spacing as text but is ignored as HTML (by the way, there were 12,586 of these in the document).

Here's how it looks in a narrowed browser window:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/screenshot_gutindex.png?itok=X4yq744k)

Clicking a link takes you to the book's Project Gutenberg page, where you can view or download it.

I used [Sigil][5] to convert this to an eBook, which was probably the easiest part of the process. Start Sigil, then select "Add Existing Files" from the toolbar and select your XHTML or HTML file. To create a chapter for each month, scroll down to the monthly header line, place the cursor at the beginning of the line, then Split at Cursor (Ctrl + Return) to create 12 chapters. You can also use the headers to create a table of contents; it’s also a good idea to edit the metadata to give it a title that will show up in your eBook reader (you can make yourself the author). Finally, save the file, and you’re done.

Happy reading!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/browse-project-gutenberg-library

作者：[Greg Pittman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:http://www.gutenberg.org/wiki/Main_Page
[2]:http://freekindlebooks.org/MagicCatalog/magiccatalog.html
[3]:http://www.gutenberg.org/wiki/Gutenberg:Offline_Catalogs
[4]:https://www.kde.org/applications/utilities/kwrite/
[5]:https://sigil-ebook.com/
