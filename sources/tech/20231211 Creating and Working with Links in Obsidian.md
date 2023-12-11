[#]: subject: "Creating and Working with Links in Obsidian"
[#]: via: "https://itsfoss.com/obsidian-create-links/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Creating and Working with Links in Obsidian
======

One of the best-selling points of Obsidian is its strong document interlinking and visualization. Obsidian provides several ways of linking documents and images. We will be taking a look at each of them.

You'll see three methods of internal linking in Obsidian:

  * Drag and drop method (simple but limited)
  * Using Markdown linking
  * Using Wikilinks (extensive and powerful)



I'll also share some tips on using the graphs and backlinks. Let's see it.

✋

****Non-FOSS Warning!**** Obsidian is not open source software and we are aware of that fact. However, it is an immensely popular tool among coders, including open source developers. That's the reason we have covered it.

### Method 1: Link by drag and drop

Yes, this is the simplest linking. Go to the document where you want to create the link. Now, on the left sidebar, expand that particular folder, where you have the target note.

To create a link, just drag and drop this target file to the location you want the link to appear.

![Add link by Drag and Drop][1]

You can change the link text later.

### Method 2: Link Using Markdown

Since Obsidian uses Markdown at its core, linking is possible, typing the traditional Markdown commands.

Let's say, you have to create a link to the “Markdown Checklist” page in “Markdown Advanced” page. First, you need to note the location of the file you want to link to.

Then, just add this line:

```

    [Link Text](relative path to the file)

```

Or, if you have a file to link, and want to provide the absolute path in the system, use:

```

    [Link text](file://absolute path)

```

![Link using absolute path][2]

🚧

If you are [using Markdown linking][3], make sure that the files and folders do not have space in their names, as this can cause some headache in some cases.

### Method 3: Link Pages using Compact Wikilinks

Obsidian supports an intuitive way of linking pages using [Wikilinks][4]. They are compact links and are interactive to link. By default, this feature is on.

And if you are wondering, yes, it relates to Wikipedia. They use it for internal linking their wiki pages.

#### Add link to an internal note

To create a link, just type `[[`. This will start an interactive dialog, where you can search for the document that you want to link.

![Add Interactive Wikilinks][5]

💡

You can use [[link|Text to appear]] to make a custom text appear on a Wikilink. e.g. [[notes/hello.md|This is a Link to the file Hello]]

#### Add an image file

Also, you can add other files like images using this linking method, but you need to add a `!` symbol before searching using `[[`. Look at the image below to see it in action.

![Add Images using Wikilinks][6]

#### Add link to an internal heading

There is a method to create internal link between various headings of the same page. To do so, first type `[[` and then, use the Markdown heading syntax and name of that particular heading that you want to link.

For example, if you intend to link to the Sixth heading, on your document, which is a level 2 heading, use:

```

    [[##Paragraph Six

```

This will show that in the interactive to choose from.

![Link to Heading][7]

💡

You can press the CTRL key while hovering over a link, to get a preview.

#### Add link to a block of text

Obsidian allows you to create links to particular blocks of text in a document. For this, first, go to the very end of the block that you want to add a link.

Now, add a unique identifier to this block, by using the `^` symbol.

![Add a unique identifier to a block][8]

Now, you can add a link to this part by typing `[[^`. This will automatically prompt you about the available blocks. Select one and press enter.

![Add Link to Block][9]

#### Issues with Wikilinks

Sometimes, if you want pure Markdown documents, and are focussing on interoperability between multiple markdown editors, the Wikilinks feature may create issues.

Since these work inside Obsidian, the links appear broken on other editors. In such cases, you can turn off the Wikilinks. Everything works flawlessly, except that the links will now appear in Markdown format.

To do this, first select the settings button on the bottom left.

![Click on Settings][10]

Now, turn off the Wikilinks feature from the “Files and Links” tab.

![Turn Off Wikilinks feature][11]

#### Tip for organizing attachment Files

For those, who are attaching many files to the Obsidian notes, it is advised to create a separate folder for those attachments under each book.

Now, open the **Settings > Files and Links**. Here, first, you need to make sure the link path is relative to the file location. Then, set the default location for new attachments to "Subfolder under current folder". Now, specify the “Attachments” in the next field, that is "Subfolder name".

![Set Attachments folder location][12]

That's, it. From now on, when you place any attachments by copy and paste, they will be automatically placed in the “attachments” folder inside that notebook folder. And the new link will be perfectly interoperable between any Markdown editors, since the path is now relative to the file location.

📋

Even if this Wikilink feature is turned off, you can still search and add links interactively using the [[ keys. The change will be that, now, the link will not be compact, but the long Markdown Link.

Also, you can turn on the "Automatically Update Internal Links" button to make sure that, while renaming a file, the link is automatically updated.

###

### Using the Graph and Backlinks

Once you are done creating links, it's time to see the notes' relation between other notes via links. Click on the graph view button on the side to go to the graph preview.

![Graph view in Obsidian][13]

As you can see, you will get the links to and from that note on a neat graph. If you press on the graph view on an empty tab, you will get all your notes and their relations.

![Some Links example of a sample Notes Vault][14]

Also, for each note, there is an outgoing link and an incoming link mentions tab, where you can follow the links associated.

![Outgoing and Incoming Links][15]

### Conclusion

As you can see, while it is simple to create internal links to other pages in Obsidian, with Wikilinks, you can create a more personalized and customized knowledge base.

For those who do not like the closed source nature of Obsidian, [Logseq][16] is a good alternative.

![][17]

--------------------------------------------------------------------------------

via: https://itsfoss.com/obsidian-create-links/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/12/link-by-drag-and-drop.gif
[2]: https://itsfoss.com/content/images/2023/12/linking-using-absolute-path.png
[3]: https://itsfoss.com/markdown-links/
[4]: https://en.wikipedia.org/wiki/Help:Link
[5]: https://itsfoss.com/content/images/2023/12/add-interactive-wikilinks.gif
[6]: https://itsfoss.com/content/images/2023/12/add-image-using-wikilinks.gif
[7]: https://itsfoss.com/content/images/2023/12/Link-to-heading-1.gif
[8]: https://itsfoss.com/content/images/2023/12/Add-unique-identifier-to-a-block.png
[9]: https://itsfoss.com/content/images/2023/12/your-block-link.gif
[10]: https://itsfoss.com/content/images/2023/12/click-on-settings-button-in-obsidian.png
[11]: https://itsfoss.com/content/images/2023/12/turn-off-the-wikilink-feature.png
[12]: https://itsfoss.com/content/images/2023/12/set-attachment-folder-location-and-other-settings-1.png
[13]: https://itsfoss.com/content/images/2023/12/graph-view-in-obsidian.png
[14]: https://itsfoss.com/content/images/2023/12/part-of-a-graph-view.png
[15]: https://itsfoss.com/content/images/2023/12/Links-out-and-in.png
[16]: https://itsfoss.com/logseq/
[17]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
