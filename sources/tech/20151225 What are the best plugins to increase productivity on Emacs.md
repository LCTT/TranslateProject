What are the best plugins to increase productivity on Emacs
================================================================================
Over a year ago now, I went looking for the best plugins to [turn Vim into a full-fledged IDE][1]. Interestingly, a lot of the comments on that post were about how Emacs already has most of these plugins built in, and was already a great IDE. Although I can only agree about Emacs' incredible versatility, it is still not the ultimate editor when it comes out of the box. Thankfully, its vast plugin library is here to fix that. But among the plethora of options available to you, it is sometimes hard to know where to start. So for now, let me try to assemble a short list of the indispensable plugins to increase your productivity while using Emacs. Although I am heavily geared towards programming related productivity, most of these plugins would be useful to anyone for any usage.

### 1. Ido-mode ###

![](https://c2.staticflickr.com/6/5718/23311895573_c1fb34337c_c.jpg)

Maybe one of the most useful plugin for beginners, Ido stands for interactively do. It replaces most of the dry prompts with a fancy character matching menu. For example, it will replace the normal prompt to open a file with a list of all the files in the current directory. Type any string, and Ido will try to match it with the most appropriate file. It makes it really easy to visualize your actions, and also to quickly get through a folder where all files are named with the same prefix.

### 2. Smex ###

![](https://c2.staticflickr.com/2/1517/23310442314_2a22a60c34_c.jpg)

Not the most famous one, but a good place to complete what Ido-mode started: Smex can be a fancy replacement to the normal 'M-x' prompt, with a heavy inspiration from Ido-mode. It brings the same interactive search for the commands you would normally have to type after calling 'M-x'. It is simple and efficient, and a great way to save those additional few fractions of a second you normally need.

### 3. Auto Complete ###

![](https://c2.staticflickr.com/6/5794/23643004900_3042f77952_c.jpg)

Before knowing the existence of this plugin, I spent half of my time on Emacs pressing ‘M-/’ to complete my words. Now, I have a fancy pop-up to do it for me. There is not much more to say about it, except that we all need it.

### 4. YASnippet ###

![](https://c2.staticflickr.com/2/1688/23830403072_0d8df6ef4c_b.jpg)

This one is really for the coders. There is always some piece of code that we feel we use all the time. For me, it's 'var_dump(...); exit;' to debug PHP. After a while of typing it over and over, it just occurred to me that I could have it pre-recorded and easily accessible as a snippet of code. With YASnippets, it's easy to import snippet files or make your own. After that, a simple press on the tabulation key will expand a small keyword into a chunk of pre-written code easy to navigate through and modify.

### 5. Org-mode ###

![](https://c2.staticflickr.com/6/5687/23570808789_d683c949e4.jpg)

For disclaimer, I have only recently started using Org-mode. But it has already blown me away. From the hundreds of written pieces I have seen around, Org-mode can change your life. The idea behind it is simple: it is a mode that simplifies note taking while keeping a plain text format, making it easy to navigate through lists of tasks and various data, and perform operations such as filtering by priority or due date, or setting a recurrence. Yet, from this simple idea, you can accomplish a lot, and it is easy to get overwhelmed with all the options. Rather than a long explanation, I urge you to go through [available tutorials][2], watch a lot of videos, and see by yourself how powerful Org-mode is.

### 6. Helm ###

![](https://c2.staticflickr.com/2/1489/23310442334_5e6db22b79_c.jpg)

Some love it, but others are not such a big fan of it. I am part of the later. But with such a huge following, it is impossible to avoid it. Helm aims to transform your Emacs experience completely. Simply described, Helm is a framework that will help you find a file or a command quickly from within Emacs. Based on your input, it will try to use word completion to guide you to the action you have in mind. The feeling is a bit weird at first, but for some, Helm is a religion of its own. Although I am not its fan, I do appreciate helm-occur which a great tool to search for strings in a large document as it shows all occurrences in a separate buffer, making it easy to navigate through them. If you are looking for a quick demo to understand what Helm can do, I recommend [this post][3].

### 7. ace-jump-mode ###

![](https://c2.staticflickr.com/2/1710/23856168871_6df1faa565_c.jpg)

Another plugin with a big following that I am trying to get on board with is ace-jump-mode. Master this plugin, and you will be promised to transcend the usage of a mouse. Simply described, by triggering ace-jump-mode with a shortcut of your choice, you will be prompted for a character. Enter one, and all words starting with that character will be highlighted with a unique letter. Enter one of the letters on screen, and your cursor will jump straight to the word it is highlighting. I have to admit that it is pretty hard to get the reflex to use it, but once you have it, it will increase your movement speed in a document by a lot.

### 8. find-file-in-project ###

![](https://c2.staticflickr.com/2/1492/23570808809_96ec8454a9_c.jpg)

If you like Sublime text and its very handy 'Ctrl-p' fuzzy search to open any file in a project, then you will love find-file-in-project (or ffip). After setting it up by declaring the root of your version control folder, you can summon easily a cool text bar that quickly scans and searches through your code base for a matching file based on the name you input. I like to have it bound to the F6 key on my keyboard. It is simple and very handy if you do not know the complicate directory structure from the top of your head.

### 9. Flymake ###

![](https://c2.staticflickr.com/6/5708/23310442354_cbba657ed3.jpg)

For IDE lovers, I think that syntax checker is one of the most powerful features. It is great for beginners and handy for tired programmers. And thanks to Flymake, Emacs users can enjoy it too. Since I work in PHP a lot, Flymake does not need any extra configuration. As I write my code, it will automatically check my code and highlight any line that contains a problem. For compiled languages, Flymake will look for a Makefile that it will use to check your code. Absolutely magical.

### 10. electric-pair ###

Last, but not least, electric-pair is one of the simplest yet most powerful plugin in my opinion. It just automatically closes whatever parenthesis or bracket you open. It doesn't look like much at first, but trust me. After struggling for the hundredth time to find that matching parenthesis, you will be glad to have a plugin to ensure that all your expressions are balanced.

To conclude, Emacs is a fantastic tool. Probably not a shocker. Try these plugins and watch as your productivity goes through the roof. This list is of course not exhaustive at all. If you want to bring your contribution, feel free to do so in the comments. I am myself always looking for new plugins to try and new ways to experience Emacs.

--------------------------------------------------------------------------------

via: http://xmodulo.com/best-plugins-to-increase-productivity-on-emacs.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/turn-vim-full-fledged-ide.html
[2]:http://orgmode.org/worg/org-tutorials/
[3]:http://tuhdo.github.io/helm-intro.html
