[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create template files in GNOME)
[#]: via: (https://opensource.com/article/20/9/gnome-templates)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Create template files in GNOME
======
Make boilerplates so you can get started on a new document faster.
![Digital images of a computer desktop][1]

I just stumbled onto a new (to me) feature of the [GNOME][2] desktop that enables you to create a document template. A template is generally an empty shell of a document with certain things configured and is often referred to as boilerplate. An example might be a letterhead for a law firm, with its corporate title and address at the top. Another might be a bank or insurance carrier letter that contains certain disclaimers in the footer at the bottom of the document. Since this sort of information rarely changes, you can add it to an empty document to use as a template.

I was browsing through files on my Linux system one day and clicked on the **Templates** directory. I just happened to notice a message at the top of the window that stated, "Put files in this folder to use them as templates for new documents." There was also a link to **Learn more…** that opens the [GNOME help][3] for templates.

![Message at top of Templates folder in GNOME Desktop][4]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

### Create a template

Creating a template for the GNOME desktop is quite simple. There are several ways you can place a file into this folder: You can copy or move a file from another location through either the graphical user interface (GUI) or the command-line interface (CLI), or you can create an entirely new file. I chose the latter; actually, I created two files.

![My first two GNOME templates][6]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

The first template I created is for an Opensource.com article. It provides a place to enter a title and several lines for my name and the license terms under which I am providing the content of the article. I use the Markdown document format for my articles, so I create the template as a new Markdown document—**Opensource.com Article.md**:


```
# Title    
```
An article for Opensource.com
by: Alan Formy-Duval
Creative Commons BY-SA 4.0
```

```

I saved this document as a file in `/home/alan/Templates`. Now GNOME recognizes this file as a template and suggests it whenever I want to create a new document.

### Use a template

Whenever I get a spark or epiphany for a new article, I can just right-click in the folder where I plan to organize my content and select the template from the **New Document** list.

![Select the template by name][7]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

You can make a template for all sorts of documents or files. I am writing this article using a template I created for my Opensource.com articles. Programmers might use templates for software code; perhaps you want a template that just contains `main()`.

The GNOME desktop environment provides a very useful, feature-rich user interface for users of Linux and related operating systems. What are your favorite GNOME desktop features, and how do you use them? Please share in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/gnome-templates

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://www.gnome.org/
[3]: https://help.gnome.org/users/gnome-help/stable/files-templates.html.en
[4]: https://opensource.com/sites/default/files/uploads/gnome-message_at_top_border.png (Message at top of Templates folder in GNOME Desktop)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/gnome-first_two_templates_border.png (My first two GNOME templates)
[7]: https://opensource.com/sites/default/files/uploads/gnome-new_document_menu_border.png (Select the template by name)
