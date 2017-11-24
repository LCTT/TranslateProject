# mandeler translating A CEO's Guide to Emacs
============================================================

Years—no, decades—ago, I lived in Emacs. I wrote code and documents, managed email and calendar, and shelled all in the editor/OS. I was quite happy. Years went by and I moved to newer, shinier things. As a result, I forgot how to do tasks as basic as efficiently navigating files without a mouse. About three months ago, noticing just how much of my time was spent switching between applications and computers, I decided to give Emacs another try. It was a good decision for several reasons that will be covered in this post. Covered too are `.emacs` and Dropbox tips so that you can set up a good, movable environment.

For those who haven't used Emacs, it's something you'll likely hate, but may love. It's sort of a Rube Goldberg machine the size of a house that, at first glance, performs all the functions of a toaster. That hardly sounds like an endorsement, but the key phrase is "at first glance." Once you grok Emacs, you realize that it's a thermonuclear toaster that can also serve as the engine for... well, just about anything you want to do with text. When you think about how much your computing life revolves around text, this is a rather bold statement. Bold, but true.

Perhaps more importantly to me though, it's the one application I've ever used that makes me feel like I really own it instead of casting me as an anonymous "user" whose wallet is cleverly targeted by product marketing departments in fancy offices somewhere near [Soma][30] or Redmond. Modern productivity and authoring applications (e.g., Pages or IDEs) are like carbon fiber racing bikes. They come kitted out very nicely and fully assembled. Emacs is like a box of classic [Campagnolo][31] parts and a beautiful lugged steel frame that's missing one crank arm and a brake lever that you have to find in some tiny subculture on the Internet. The first one is faster and complete. The second is a source of endless joy or annoyance depending on your personality—and will last until your dying day. I'm the sort of person who feels equal joy at finding an old stash of Campy parts or tweaking my editor with eLisp. YMMV.

![1933 steel bicycle](https://blog.fugue.co/assets/images/bicycle.jpg)
A 1933 steel bicycle that I still ride. Check out this comparison of frame tubes: [https://www.youtube.com/watch?v=khJQgRLKMU0][6].

This may give the impression that Emacs is anachronistic or old-fashioned. It's not. It's powerful and timeless, but demands that you patiently understand it on its terms. The terms are pretty far off the beaten path and seem odd, but there is a logic to them that is both compelling and charming. To me, Emacs feels like the future rather than the past. Just as the lugged steel frame will be useful and comfortable in decades to come and the carbon fiber wunderbike will be in a landfill, having shattered on impact, so will Emacs persist as a useful tool when the latest trendy app is long forgotten.

If the notion of building your own personal working environment by editing Lisp code and having that fits-like-a-glove environment follow you to any computer is appealing to you, you may really like Emacs. If you like the new and shiny and want to get straight to work without much investment of time and mental cycles, it's likely not for you. I don't write code any more (other than Ludwig and Emacs Lisp), but many of the engineers at Fugue use Emacs to good effect. I'd say our engineers are about 30% Emacs, 40% IDEs, and 30% Vim users. But, this post is about Emacs for CEOs and other [Pointy-Haired Bosses][32] (PHB)[1][7] (and, hey, anyone who’s curious), so I'm going to explain and/or rationalize why I love it and how I use it. I also hope to provide you with enough detail that you can have a successful experience with it, without hours of Googling.

### Lasting Advantages

The long-term advantages that come with using Emacs just make life easier. The net gain makes the initial lift entirely worthwhile. Consider these:

### No More Context Switching

Org Mode alone is worth investing some serious time in, but if you are like me, you are usually working on a dozen or so documents—from blog posts to lists of what you need to do for a conference to employee reviews. In the modern world of computing, this generally means using several applications, all of which have distracting user interfaces and different ways to store, sort, and search. The result is that you need to constantly switch mental contexts and remember minutiae. I hate context switching because it is an imposition put on me due to a broken interface model[2][8] and I hate having to remember things my computer should remember for me in any rational world. In providing a single environment, Emacs is even more powerful for the PHB than the programmer, since programmers tend to spend a greater percentage of their day in a single application. Switching mental contexts has a higher cost than is often apparent. OS and application vendors have tarted up interfaces to distract us from this reality. If you’re technical, having access to a powerful [language interpreter][33] in a single keyboard shortcut (`M-:`) is especially useful.[3][9]

Many applications can be full screened all day and used to edit text. Emacs is singular because it is both an editor and a Lisp interpreter. In essence, you have a Turing complete machine a keystroke or two away at all times, while you go about your business. If you know a little or a lot about programming, you'll recognize that this means you can do  _anything_  in Emacs. The full power of your computer is available to you in near real time while you work, once you have the commands in memory. You won't want to re-create Excel in eLisp, but most things you might do in Excel are smaller in scope and easy to accomplish in a line or two of code. If I need to crunch numbers, I'm more likely to jump over to the scratch buffer and write a little code than open a spreadsheet. Even if I have an email to write that isn't a one-liner, I'll usually just write it in Emacs and paste it into my email client. Why context switch when you can just flow? You might start with a simple calculation or two, but, over time, anything you need computed can be added with relative ease to Emacs. This is perhaps unique in applications that also provide rich features for creating things for other humans. Remember those magical terminals in Isaac Asimov's books? Emacs is the closest thing I've encountered to them.[4][10] I no longer decide what app to use for this or that thing. Instead, I just work. There is real power and efficiency to having a great tool and committing to it.

### Creating Things in Peace and Quiet

What’s the end result of having the best text editing features I've ever found? Having a community of people making all manner of useful additions? Having the full power of Lisp a keychord away? It’s that I use Emacs for all my creative work, aside from making music or images.

I have a dual monitor set up at my desk. One of them is in portrait mode with Emacs full screened all day long. The other one has web browsers for researching and reading; it usually has a terminal open as well. I keep my calendar, email, etc., on another desktop in OS X, which is hidden while I'm in Emacs, and I keep all notifications turned off. This allows me to actually concentrate on what I'm doing. I've found eliminating distractions to be almost impossible in the more modern UI applications due to their efforts to be helpful and easy to use. I don't need to be constantly reminded how to do operations I've done tens of thousands of times, but I do need a nice, clean white sheet of paper to be thoughtful. Maybe I'm just bad at living in noisy environments due to age and abuse, but I’d suggest it’s worth a try for anyone. See what it's like to have some actual peace and quiet in your computing environment. Of course, lots of apps now have modes that hide the interface and, thankfully, both Apple and Microsoft now have meaningful full-screen modes. But, no other application is powerful enough to “live in” for most things. Unless you are writing code all day or perhaps working on a very long document like a book, you're still going to face the noise of other apps. Also, most modern applications seem simultaneously patronizing and lacking in functionality and usability.[5][11] The only applications I dislike more than office apps are the online versions.

![1933 steel bicycle](https://blog.fugue.co/assets/images/desktop.jpg)
My desktop arrangement. Emacs on the left.

But what about communicating? The difference between creating and communicating is substantial. I'm much more productive at both when I set aside distinct time for each. We use Slack at Fugue, which is both wonderful and hellish. I keep it on a messaging desktop alongside my calendar and email, so that, while I'm actually making things, I'm blissfully unaware of all the chatter in the world. It takes just one Slackstorm or an email from a VC or Board Director to immediately throw me out of my work. But, most things can usually wait an hour or two.

### Taking Everything with You and Keeping It Forever

The third reason I find Emacs more advantageous than other environments is that it's easy to take all your stuff with you. By this, I mean that, rather than having a plethora of apps interacting and syncing in their own ways, all you need is one or two directories syncing via Dropbox or the like. Then, you can have all your work follow you anywhere in the environment you have crafted to suit your purposes. I do this across OS X, Windows, and sometimes Linux. It's dead simple and reliable. I've found this capability to be so useful that I dread dealing with Pages, GDocs, Office, or other kinds of files and applications that force me back into finding stuff somewhere on the filesystem or in the cloud.

The limiting factor in keeping things forever on a computer is file format. Assuming that humans have now solved the problem of storage [6][12] for good, the issue we face over time is whether we can continue to access the information we've created. Text files are the most long-lived format for computing. You easily can open a text file from 1970 in Emacs. That’s not so true for Office applications. Text files are also nice and small—radically smaller than Office application data files. As a digital pack rat and as someone who makes lots of little notes as things pop into my head, having a simple, light, permanent collection of stuff that is always available is important to me.

If you’re feeling ready to give Emacs a try, read on! The sections that follow don’t take the place of a full tutorial, but will have you operational by the time you finish reading.

### Learning To Ride Emacs - A Technical Setup

The price of all this power and mental peace and quiet is that you have a steep learning curve with Emacs and it does everything differently than you're used to. At first, this will make you feel like you’re wasting time on an archaic and strange application that the modern world passed by. It’s a bit like learning to ride a bicycle[7][13]if you've only driven cars.

### Which Emacs?

I use the plain vanilla Emacs from GNU for OS X and Windows. You can get the OS X version at [][34][http://emacsformacosx.com/][35] and the Windows version at [][36][http://www.gnu.org/software/emacs/][37]. There are a bunch of other versions out there, especially for the Mac, but I've found the learning curve for doing powerful stuff (which involves Lisp and lots of modes) to be much lower with the real deal. So download it, and we can get started![8][14]

### First, You'll Need To Learn How To Navigate

I use the Emacs conventions for keys and combinations in this document. These are 'C' for control, 'M' for meta (which is usually mapped to Alt or Option), and the hyphen for holding down the keys in combination. So `C-h t` means to hold down control and type h, then release control and type t. This is the command for bringing up the tutorial, which you should go ahead and do.

Don't use the arrow keys or the mouse. They work, but you should give yourself a week of using the native navigation commands in Emacs. Once you have them committed to muscle memory, you'll likely enjoy them and miss them badly everywhere else you go. The Emacs tutorial does a pretty good job of walking you through them, but I'll summarize so you don't need to read the whole thing. The boring stuff is that, instead of arrows, you use `C-b` for back, `C-f` for forward, `C-p` for previous (up), and `C-n` for next (down). You may be thinking "why in the world would I do that, when I have perfectly good arrow keys?" There are several reasons. First, you don't have to move your hands from the typing position, and the forward and back keys used with Alt (or Meta in Emacspeak) navigate a word at a time. This is more handy than is obvious. The third good reason is that, if you want to repeat a command, you can precede it with a number. I often use this when editing documents by estimating how many words I need to go back or lines up or down and doing something like `C-9 C-p` or `M-5 M-b`. The other really important navigation commands are based on `a` for the beginning of a thing and `e` for the end of a thing. Using `C-a|e` are on lines, and using `M-a|e`, are on sentences. For the sentence commands to work properly, you'll need to double space after periods, which simultaneously provides a useful feature and takes a shibboleth of [opinion][38] off the mental table. If you need to export the document to a single space [publication environment][39], you can write a macro in moments to do so.

It genuinely is worth going through the tutorial that ships with Emacs. I'll cover a few important commands for the truly impatient, but the tutorial is gold. Reminder: `C-h t` for the tutorial.

### Learn To Copy and Paste

You can put Emacs into `CUA` mode, which will work in familiar ways, but the native Emacs way is pretty great and plenty easy once you learn it. You mark regions (like selecting) by using Shift with the navigation commands. So `C-F` selects one character forward from the cursor, etc. You copy with `M-w`, you cut with `C-w`, and you paste with `C-y`. These are actually called killing and yanking, but it's very similar to cut and paste. There is magic under the hood here in the kill ring, but for now, just worry about cut, copy, and paste. If you start fumbling around at this point, `C-x u` is undo...

### Next, Learn Ido Mode

Trust me. Ido makes working with files much easier. You don't generally use a separate Finder|Explorer window to work with files in Emacs. Instead you use the editor's commands to create, open, and save files. This is a bit of a pain without Ido, so I recommend installing it before learning the other way. Ido comes with Emacs beginning with version 22, but you'll want to make some tweaks to your `.emacs` file so that it is always used. This is a good excuse to get your environment set up.

Most features in Emacs come in modes. To install any given mode, you'll need to do two things. Well, at first you'll need to do a few extra things, but these only need to be done once, and thereafter only two things. So the extra things are that you'll need a single place to put all your eLisp files and you'll need to tell Emacs where that place is. I suggest you make a single directory in, say, Dropbox that is your Emacs home. Inside this, you'll want to create an `.emacs` file and an `.emacs.d` directory. Inside the `.emacs.d`, make a directory called `lisp`. So you should have:

```
home
|
+.emacs
|
-.emacs.d
  |
  -lisp
```

You'll put the `.el` files for things like modes into the `home/.emacs.d/lisp`directory, and you'll point to that in your `.emacs` like so:

`(add-to-list 'load-path "~/.emacs.d/lisp/")`

Ido Mode comes with Emacs, so you won't need to put an `.el` file into your Lisp directory for this, but you'll be adding other stuff soon that will go in there.

### Symlinks are Your Friend

But wait, that says that `.emacs` and `.emacs.d` are in your home directory, and we put them in some dumb folder in Dropbox! Correct. This is how you make it easy to have your environment anywhere you go. Keep everything in Dropbox and make symbolic links to `.emacs`, `.emacs.d`, and your main document directories in `~`. On OS X, this is super easy with the `ln -s` command, but on Windows this is a pain. Fortunately, Emacs provides an easy alternative to symlinking on Windows, the HOME environment variable. Go into Environment Variables in Windows (as of Windows 10, you can just hit the Windows key and type "Environment Variables" to find this with search, which is the best part of Windows 10), and make a HOME environment variable in your account that points to the Dropbox folder you made for Emacs. If you want to make it easy to navigate to local files that aren't in Dropbox, you may instead want to make a symbolic link to the Dropbox Emacs home in your actual home directory.

So now you've done all the jiggery-pokery needed to get any machine pointed to your Emacs setup and files. If you get a new computer or use someone else's for an hour or a day, you get your entire work environment. This seems a little difficult the first time you do it, but it's about a ten minute (at most) operation once you know what you're doing.

But we were configuring Ido...

`C-x` `C-f` and type `~/.emacs RET RET` to create your `.emacs` file. Add these lines to it:

```
;; set up ido mode
(require `ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
```

With the `.emacs` buffer open, do an `M-x evaluate-buffer` command, and you'll either get an error if you munged something or you'll get Ido. Ido changes how the minibuffer works when doing file operations. There is great documentation on it, but I'll point out a few tips. Use the `~/` effectively; you can just type `~/` at any point in the minibuffer and it'll jump back to home. Implicit in this is that you should have most of your stuff a short hop off your home. I use `~/org` for all my non-code stuff and `~/code` for code. Once you’re in the right directory, you'll often have a collection of files with different extensions, especially if you use Org Mode and publish from it. You can type period and the extension you want no matter where you are in the file name and Ido will limit the choices to files with that extension. For example, I'm writing this blog post in Org Mode, so the main file is:

`~/org/blog/emacs.org`

I also occasionally push it out to HTML using Org Mode publishing, so I've got an `emacs.html` file in the same directory. When I want to open the Org file, I will type:

`C-x C-f ~/o[RET]/bl[RET].or[RET]`

The [RET]s are me hitting return for auto completion for Ido Mode. So, that’s 12 characters typed and, if you're used to it, a  _lot_  less time than opening Finder|Explorer and clicking around. Ido Mode is plenty useful, but really is a utility mode for operating Emacs. Let's explore some modes that are useful for getting work done.

### Fonts and Styles

I recommend getting the excellent input family of typefaces for use in Emacs. They are customizable with different braces, zeroes, and other characters. You can build in extra line spacing into the font files themselves. I recommend a 1.5X line spacing and using their excellent proportional fonts for code and data. I use Input Serif for my writing, which has a funky but modern feel. You can find them on [http://input.fontbureau.com/][40] where you can customize to your preferences. You can manually set the fonts using menus in Emacs, but this puts code into your `.emacs`file and, if you use multiple devices, you may find you want some different settings. I've set up my `.emacs` to look for the machine I'm using by name and configure the screen appropriately. The code for this is:

```
;; set up fonts for different OSes. OSX toggles to full screen.
(setq myfont "InputSerif")
(cond
((string-equal system-name "Sampo.local")
 (set-face-attribute 'default nil :font myfont :height 144)
 (toggle-frame-fullscreen))
((string-equal system-name "Morpheus.local")
 (set-face-attribute 'default nil :font myfont :height 144))
((string-equal system-name "ILMARINEN")
 (set-face-attribute 'default nil :font myfont :height 106))
((string-equal system-name "UKKO")
 (set-face-attribute 'default nil :font myfont :height 104)))
```

You should replace the `system-name` values with what you get when you evaluate `(system-name)` in your copy of Emacs. Note that on Sampo (my MacBook), I also set Emacs to full screen. I'd like to do this on Windows as well, but Windows and Emacs don't really love each other and it always ends up in some wonky state when I try this. Instead, I just fullscreen it manually after launch.

I also recommend getting rid of the awful toolbar that Emacs got sometime in the 90s when the cool thing to do was to have toolbars in your application. I also got rid of some other "chrome" so that I have a simple, productive interface. Add these to your `.emacs` file to get rid of the toolbar and scroll bars, but to keep your menu available (on OS X, it'll be hidden unless you mouse to the top of the screen anyway):

```
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
```

### Org Mode

I pretty much live in Org Mode. It is my go-to environment for authoring documents, keeping notes, making to-do lists and 90% of everything else I do. Org was originally conceived as a combination note-taking and to-do list utility by a fellow who is a laptop-in-meetings sort. I am against use of laptops in meetings and don't do it myself, so my use cases are a little different than his. For me, Org is primarily a way to handle all manner of content within a structure. There are heads and subheads, etc., in Org Mode, and they function like an outline. Org allows you to expand or hide the contents of the tree and also to rearrange the tree. This fits how I think very nicely and I find it to be just a pleasure to use in this way.

Org Mode also has a lot of little things that make life pleasant. For example, the footnote handling is excellent and the LaTeX/PDF output is great. Org has the ability to generate agendas based on the to-do's in all your documents and a nice way to relate them to dates/times. I don't use this for any sort of external commitments, which are handled on a shared calendar, but for creating things and keeping track of what I need to create in the future, it's invaluable. Installing it is as easy as adding the `org-mode.el` to your Lisp directory and adding these lines to your `.emacs`, if you want it to indent based on tree location and to open documents fully expanded:

```
;; set up org mode
(setq org-startup-indented t)
(setq org-startup-folded "showall")
(setq org-directory "~/org")
```

The last line is there so that Org knows where to look for files to include in agendas and some other things. I keep Org right in my home directory, i.e., a symlink to the directory that lives in Dropbox, as described earlier.

I have a `stuff.org` file that is always open in a buffer. I use it like a notepad. Org makes it easy to extract things like TODOs and stuff with deadlines. It's especially useful when you can inline Lisp code and evaluate it whenever you need. Having code with content is super handy. Again, you have access to the actual computer with Emacs, and this is a liberation.

#### Publishing with Org Mode

I care about the appearance and formatting of my documents. I started my career as a designer, and I think information can and should be presented clearly and beautifully. Org has great support for generating PDFs via LaTeX, which has a bit of its own learning curve, but doing simple things is pretty easy.

If you want to use fonts and styles other than the typical LaTeX ones, you've got a few things to do. First, you'll want XeLaTeX so you can use normal system fonts rather than LaTeX specific fonts. Next, you'll want to add this to `.emacs`:

```
(setq org-latex-pdf-process
 '("xelatex -interaction nonstopmode %f"
  "xelatex -interaction nonstopmode %f"))
```

I put this right at the end of my Org section of `.emacs` to keep things tidy. This will allow you to use more formatting options when publishing from Org. For example, I often use:

```
#+LaTeX_HEADER: \usepackage{fontspec}
#+LATEX_HEADER: \setmonofont[Scale=0.9]{Input Mono}
#+LATEX_HEADER: \setromanfont{Maison Neue}
#+LATEX_HEADER: \linespread{1.5}
#+LATEX_HEADER: \usepackage[margin=1.25in]{geometry}

#+TITLE: Document Title Here
```

These simply go somewhere in your `.org` file. Our corporate font for body copy is Maison Neue, but you can put whatever is appropriate here. I strongly discourage the use of Maison Neue. It’s a terrible font and no one should ever use it.

This file is an example of PDF output using these settings. This is what out-of-the-box LaTeX always looks like. It's fine I suppose, but the fonts are boring and a little odd. Also, if you use the standard format, people will assume they are reading something that is or pretends to be an academic paper. You've been warned.

### Ace Jump Mode

This is more of a gem than a major feature, but you want it. It works a bit like Jef Raskin's Leap feature from days gone by.[9][15] The way it works is you type `C-c` `C-SPC`and then type the first letter of the word you want to jump to. It highlights all occurrences of words with that initial character, replacing it with a letter of the alphabet. You simply type the letter of the alphabet for the location you want and your cursor jumps to it. I find myself using this as often as the more typical nav keys or search. Download the `.el` to your Lisp directory and put this in your `.emacs`:

```
;; set up ace-jump-mode
(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c C-SPC" ) 'ace-jump-mode)
```

### More Later

That's enough for one post—this may get you somewhere you'd like to be. I'd love to hear about your uses for Emacs aside from programming (or for programming!) and whether this was useful at all. There are likely some boneheaded PHBisms in how I use Emacs, and if you want to point them out, I'd appreciate it. I'll probably write some updates over time to introduce additional features or modes. I'll certainly show you how to use Fugue with Emacs and Ludwig-mode as we evolve it into something more useful than code highlighting. Send your thoughts to [@fugueHQ][41] on Twitter.

* * *

#### Footnotes

1.  [^][16] If you are now a PHB of some sort, but were never technical, Emacs likely isn’t for you. There may be a handful of folks for whom Emacs will form a path into the more technical aspects of computing, but this is probably a small population. It’s helpful to know how to use a Unix or Windows terminal, to have edited a dotfile or two, and to have written some code at some point in your life for Emacs to make much sense.

2.  [^][17] [][18][http://archive.wired.com/wired/archive/2.08/tufte.html][19]

3.  [^][20] I mainly use this to perform calculations while writing. For example, I was writing an offer letter to a new employee and wanted to calculate how many options to include in the offer. Since I have a variable defined in my `.emacs` for outstanding-shares, I can simply type `M-: (* .001 outstanding-shares)`and get a tenth of a point without opening a calculator or spreadsheet. I keep  _lots_ of numbers in variables like this so I can avoid context switching.

4.  [^][21] The missing piece of this is the web. There is an Emacs web browser called eww that will allow you to browse in Emacs. I actually use this, as it is both a great ad-blocker and removes most of the poor choices in readability from the web designer's hands. It's a bit like Reading Mode in Safari. Unfortunately, most websites have lots of annoying cruft and navigation that translates poorly into text.

5.  [^][22] Usability is often confused with learnability. Learnability is how difficult it is to learn a tool. Usability is how useful the tool is. Often, these are at odds, such as with the mouse and menus. Menus are highly learnable, but have poor usability, so there have been keyboard shortcuts from the earliest days. Raskin was right on many points where he was ignored about GUIs in general. Now, OSes are putting things like decent search onto a keyboard shortcut. On OS X and Windows, my default method of navigation is search. Ubuntu's search is badly broken, as is the rest of its GUI.

6.  [^][23] AWS S3 has effectively solved file storage for as long as we have the Internet. Trillions of objects are stored in S3 and they've never lost one of them. Most every service out there that offers cloud storage is built on S3 or imitates it. No one has the scale of S3, so I keep important stuff there, via Dropbox.

7.  [^][24] By now, you might be thinking "what is it with this guy and bicycles?" ... I love them on every level. They are the most mechanically efficient form of transportation ever invented. They can be objects of real beauty. And, with some care, they can last a lifetime. I had Rivendell Bicycle Works build a frame for me back in 2001 and it still makes me happy every time I look at it. Bicycles and UNIX are the two best inventions I've interacted with. Well, they and Emacs.

8.  [^][25] This is not a tutorial for Emacs. It comes with one and it's excellent. I do walk through some of the things that I find most important to getting a useful Emacs setup, but this is not a replacement in any way.

9.  [^][26] Jef Raskin designed the Canon Cat computer in the 1980s after falling out with Steve Jobs on the Macintosh project, which he originally led. The Cat had a document-centric interface (as all computers should) and used the keyboard in innovative ways that you can now imitate with Emacs. If I could have a modern, powerful Cat with a giant high-res screen and Unix underneath, I'd trade my Mac for it right away. [][27][https://youtu.be/o_TlE_U_X3c?t=19s][28]

--------------------------------------------------------------------------------

via: https://blog.fugue.co/2015-11-11-guide-to-emacs.html

作者：[Josh Stella ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.fugue.co/authors/josh.html
[1]:https://blog.fugue.co/2013-10-16-vpc-on-aws-part3.html
[2]:https://blog.fugue.co/2013-10-02-vpc-on-aws-part2.html
[3]:http://ww2.fugue.co/2017-05-25_OS_AR_GartnerCoolVendor2017_01-LP-Registration.html
[4]:https://blog.fugue.co/authors/josh.html
[5]:https://twitter.com/joshstella
[6]:https://www.youtube.com/watch?v=khJQgRLKMU0
[7]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#phb
[8]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#tufte
[9]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#interpreter
[10]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#eww
[11]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#usability
[12]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#s3
[13]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#bicycles
[14]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#nottutorial
[15]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#canoncat
[16]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#phbOrigin
[17]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#tufteOrigin
[18]:http://archive.wired.com/wired/archive/2.08/tufte.html
[19]:http://archive.wired.com/wired/archive/2.08/tufte.html
[20]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#interpreterOrigin
[21]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#ewwOrigin
[22]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#usabilityOrigin
[23]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#s3Origin
[24]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#bicyclesOrigin
[25]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#nottutorialOrigin
[26]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#canoncatOrigin
[27]:https://youtu.be/o_TlE_U_X3c?t=19s
[28]:https://youtu.be/o_TlE_U_X3c?t=19s
[29]:https://blog.fugue.co/authors/josh.html
[30]:http://www.huffingtonpost.com/zachary-ehren/soma-isnt-a-drug-san-fran_b_987841.html
[31]:http://www.campagnolo.com/US/en
[32]:http://www.businessinsider.com/best-pointy-haired-boss-moments-from-dilbert-2013-10
[33]:http://www.webopedia.com/TERM/I/interpreter.html
[34]:http://emacsformacosx.com/
[35]:http://emacsformacosx.com/
[36]:http://www.gnu.org/software/emacs/
[37]:http://www.gnu.org/software/emacs/
[38]:http://www.huffingtonpost.com/2015/05/29/two-spaces-after-period-debate_n_7455660.html
[39]:http://practicaltypography.com/one-space-between-sentences.html
[40]:http://input.fontbureau.com/
[41]:https://twitter.com/fugueHQ
