Parsing HTML with Python
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_html_code.png?itok=VjUmGsnl)

Image by : Jason Baker for Opensource.com.

As a long-time member of the documentation team at Scribus, I keep up-to-date with the latest updates of the source so I can help make updates and additions to the documentation. When I recently did a "checkout" using Subversion on a computer I had just upgraded to Fedora 27, I was amazed at how long it took to download the documentation, which consists of HTML pages and associated images. I became concerned that the project's documentation seemed much larger than it should be and suspected that some of the content was "zombie" documentation--HTML files that aren't used anymore and images that have lost all references in the currently used HTML.

I decided to create a project for myself to figure this out. One way to do this is to search for existing image files that aren't used. If I could scan through all the HTML files for image references, then compare that list to the actual image files, chances are I would see a mismatch.

Here is a typical image tag:
```
<img src="images/edit_shapes.png" ALT="Edit examples" ALIGN=left>
```

I'm interested in the part between the first set of quotation marks, after `src=`. After some searching for a solution, I found a Python module called [BeautifulSoup][1]. The tasty part of the script I wrote looks like this:
```
soup = BeautifulSoup(all_text, 'html.parser')
match = soup.findAll("img")
if len(match) > 0:
    for m in match:
        imagelist.append(str(m))
```

We can use this `findAll` method to pluck out the image tags. Here is a tiny piece of the output:
```


<img src="images/pdf-form-ht3.png"/><img src="images/pdf-form-ht4.png"/><img src="images/pdf-form-ht5.png"/><img src="images/pdf-form-ht6.png"/><img align="middle" alt="GSview - Advanced Options Panel" src="images/gsadv1.png" title="GSview - Advanced Options Panel"/><img align="middle" alt="Scribus External Tools Preferences" src="images/gsadv2.png" title="Scribus External Tools Preferences"/>
```

So far, so good. I thought that the next step might be to just carve this down, but when I tried some string methods in the script, it returned errors about this being tags and not strings. I saved the output to a file and went through the process of editing in [KWrite][2]. One nice thing about KWrite is that you can do a "find & replace" using regular expressions (regex), so I could replace `<img` with `\n<img`, which made it easier to see how to carve this down from there. Another nice thing with KWrite is that, if you make an injudicious choice with regex, you can undo it.

But I thought, surely there is something better than this, so I turned to regex, or more specifically the `re` module for Python. The relevant part of this new script looks like this:
```
match = re.findall(r'src="(.*)/>', all_text)
if len(match)>0:
    for m in match:
        imagelist.append(m)
```

And a tiny piece of its output looks like this:
```
images/cmcanvas.png" title="Context Menu for the document canvas" alt="Context Menu for the document canvas" /></td></tr></table><br images/eps-imp1.png" title="EPS preview in a file dialog" alt="EPS preview in a file dialog" images/eps-imp5.png" title="Colors imported from an EPS file" alt="Colors imported from an EPS file" images/eps-imp4.png" title="EPS font substitution" alt="EPS font substitution" images/eps-imp2.png" title="EPS import progress" alt="EPS import progress" images/eps-imp3.png" title="Bitmap conversion failure" alt="Bitmap conversion failure"
```

At first glance, it looks similar to the output above, and has the nice feature of trimming out parts of the image tag, but there are puzzling inclusions of table tags and other content. I think this relates to this regex expression `src="(.*)/>`, which is termed greedy, meaning it doesn't necessarily stop at the first instance of `/>` it encounters. I should add that I also tried `src="(.*)"` which was really no better. Not being a regexpert (just made this up), my searching around for various ideas to improve this didn't help.

After a series of other things, even trying out `HTML::Parser` with Perl, I finally tried to compare this to the situation of some scripts that I wrote for Scribus that analyze the contents of a text frame, character by character, then take some action. For my purposes, what I finally came up with improves on all these methods and requires no regex or HTML parser at all. Let's go back to that example `img` tag I showed.
```
<img src="images/edit_shapes.png" ALT="Edit examples" ALIGN=left>
```

I decided to home in on the `src=` piece. One way would be to wait for an occurrence of `s`, then see if the next character is `r`, the next `c`, and the next `=`. If so, bingo! Then what follows between two sets of double quotation marks is what I need. The problem with this is the structure it takes to hang onto these. One way of looking at a string of characters representing a line of HTML text would be:
```
for c in all_text:
```

But the logic was just too messy to hang onto the previous `c`, and the one before that, the one before that, and the one before that.

In the end, I decided to focus on the `=` and to use an indexing method whereby I could easily reference any prior or future character in the string. Here is the searching part:
```
    index = 3
    while index < linelength:
        if (all_text[index] == '='):
            if (all_text[index-3] == 's') and (all_text[index-2] == 'r') and (all_text[index-1] == 'c'):
                imagefound(all_text, imagelist, index)
                index += 1
            else:
                index += 1
        else:
            index += 1
```

I start the search with the fourth character (indexing starts at 0), so I don't get an indexing error down below, and realistically, there will not be an equal sign before the fourth character of a line. The first test is to see if we find `=` as we're marching through the string, and if not, we march on. If we do see one, then we ask if the three previous characters were `s`, `r`, and `c`, in that order. If that happens, we call the function `imagefound`:
```
def imagefound(all_text, imagelist, index):
    end = 0
    index += 2
    newimage = ''
    while end == 0:
        if (all_text[index] != '"'):
            newimage = newimage + all_text[index]
            index += 1
        else:
            newimage = newimage + '\n'
            imagelist.append(newimage)
            end = 1
            return
```

We're sending the function the current index, which represents the `=`. We know the next character will be `"`, so we jump two characters and begin adding characters to a holding string named `newimage`, until we reach the following `"`, at which point we're done. We add the string plus a `newline` character to our list `imagelist` and `return`, keeping in mind there may be more image tags in this remaining string of HTML, so we're right back in the middle of our searching loop.

Here's what our output looks like now:
```
images/text-frame-link.png
images/text-frame-unlink.png
images/gimpoptions1.png
images/gimpoptions3.png
images/gimpoptions2.png
images/fontpref3.png
images/font-subst.png
images/fontpref2.png
images/fontpref1.png
images/dtp-studio.png
```

Ahhh, much cleaner, and this only took a few seconds to run. I could have jumped seven more index spots to cut out the `images/` part, but I like having it there to make sure I haven't chopped off the first letter of the image filename, and this is so easy to edit out with KWrite--you don't even need regex. After doing that and saving the file, the next step was to run another script I wrote called `sortlist.py`:
```
#!/usr/bin/env python
# -*- coding: utf-8  -*-
# sortlist.py

import os

imagelist = []
for line in open('/tmp/imagelist_parse4.txt').xreadlines():
    imagelist.append(line)
   
imagelist.sort()

outfile = open('/tmp/imagelist_parse4_sorted.txt', 'w')
outfile.writelines(imagelist)
outfile.close()
```

This pulls in the file contents as a list, sorts it, then saves it as another file. After that I could just do the following:
```
ls /home/gregp/development/Scribus15x/doc/en/images/*.png > '/tmp/actual_images.txt'
```

Then I need to run `sortlist.py` on that file too, since the method `ls` uses to sort is different from Python. I could have run a comparison script on these files, but I preferred to do this visually. In the end, I ended up with 42 images that had no HTML reference from the documentation.

Here is my parsing script in its entirety:
```
#!/usr/bin/env python
# -*- coding: utf-8  -*-
# parseimg4.py

import os

def imagefound(all_text, imagelist, index):
    end = 0
    index += 2
    newimage = ''
    while end == 0:
        if (all_text[index] != '"'):
            newimage = newimage + all_text[index]
            index += 1
        else:
            newimage = newimage + '\n'
            imagelist.append(newimage)
            end = 1
            return
       
htmlnames = []
imagelist = []
tempstring = ''
filenames = os.listdir('/home/gregp/development/Scribus15x/doc/en/')
for name in filenames:
    if name.endswith('.html'):
        htmlnames.append(name)
#print htmlnames
for htmlfile in htmlnames:
    all_text = open('/home/gregp/development/Scribus15x/doc/en/' + htmlfile).read()
    linelength = len(all_text)
    index = 3
    while index < linelength:
        if (all_text[index] == '='):
            if (all_text[index-3] == 's') and (all_text[index-2] == 'r') and
(all_text[index-1] == 'c'):
                imagefound(all_text, imagelist, index)
                index += 1
            else:
                index += 1
        else:
            index += 1

outfile = open('/tmp/imagelist_parse4.txt', 'w')
outfile.writelines(imagelist)
outfile.close()
imageno = len(imagelist)
print str(imageno) + " images were found and saved"
```

Its name, `parseimg4.py`, doesn't really reflect the number of scripts I wrote along the way, with both minor and major rewrites, plus discards and starting over. Notice that I've hardcoded these directory and filenames, but it would be easy enough to generalize, asking for user input for these pieces of information. Also as they were working scripts, I sent the output to `/tmp`, so they disappear once I reboot my system.

This wasn't the end of the story, since the next question was: What about zombie HTML files? Any of these files that are not used might reference images not picked up by the previous method. We have a `menu.xml` file that serves as the table of contents for the online manual, but I also needed to consider that some files listed in the TOC might reference files not in the TOC, and yes, I did find some.

I'll conclude by saying that this was a simpler task than this image search, and it was greatly helped by the processes I had already developed.


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/20150529_gregp.jpg?itok=nv02g6PV)][7] Greg Pittman - Greg is a retired neurologist in Louisville, Kentucky, with a long-standing interest in computers and programming, beginning with Fortran IV in the 1960s. When Linux and open source software came along, it kindled a commitment to learning more, and eventually contributing. He is a member of the Scribus Team.[More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/parsing-html-python

作者：[Greg Pittman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://www.crummy.com/software/BeautifulSoup/
[2]:https://www.kde.org/applications/utilities/kwrite/
[7]:https://opensource.com/users/greg-p
[8]:https://opensource.com/users/greg-p
