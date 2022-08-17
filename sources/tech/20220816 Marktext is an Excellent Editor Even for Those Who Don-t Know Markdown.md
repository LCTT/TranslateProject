[#]: subject: "Marktext is an Excellent Editor Even for Those Who Don’t Know Markdown"
[#]: via: "https://itsfoss.com/marktext-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Marktext is an Excellent Editor Even for Those Who Don’t Know Markdown
======
Another Markdown editor? Have we not seen all kinds of Markdown editors already?

I understand that feeling. If you are a Markdown lover, from [Joplin][1] to [Zettlr][2], you have tried most of them. And if you are not a Markdown fan, you probably don’t care about these editors.

Markdown is an excellent markup language specially for people who write for the web. I am not going to go into the details here. We have an [excellent Markdown starters guide][3] if you are interested in learning more about it.

My focus here is on introducing you to (another) Markdown editor, It’s called [Marktext][4] and it is an Electron app (don’t hate me just yet).

I found it to be an excellent editor. It works as good as it looks. Let me share my experience and its features.

### Marktext: A Markdown editor for everyone

Hate [Electron framework][5] as much as possible but you cannot deny that Electron-based applications have a clean, modern interface.

![Marktext interface][6]

I prefer dark mode and hence I switched the theme. There are six themes in total for you to choose from.

![Marktext dark theme][7]

You can start writing the text immediately. If you don’t remember the text, don’t worry. Just use the insert option with @ and it will give you a number of options such as:

* Headings
* Divider line
* Table
* Mathematical equations
* HTML block
* Code block
* Quote block
* Lists
* Checklist
* Diagrams using vega-lite.js, flowchart.js, js-sequence and PlantUML

![Use various document elements in the editor by pressing @][8]

Select part of text and it gives you additional formatting option to change the text to bold, italic, underline, strike out. You can also highlight the text with yellow background text, convert them in inline code or inline math and create hyperlinks.

![Text formatting options][9]

Marktext also supports images. Though you know that images are not part of markdown (.md) file. They are external elements but you have the option to create a local assets folder in the same location where your Markdown file is saved.

![Images are supported too][10]

Adding image could have been made easier by including it in the insert menu. At the monet, you can add images by select texting and chosing the image option from the format options or use Ctrl+Shift+I keys. There is no scope for adding alt text or captions to the images. This should be improved.

I liked the tables feature in Marktext. You can insert table with predefined size. If you changed your mind, you can resize it as easily. You can move the rows and columns, all with mouse drag and drop without touching the underlying code.

![Tables are very well supported in Marktext][11]

You can enable the sidebar view. The sidebar gives you three options. You can open folders containing multiple markdown files, perform a global search in all the files in the opened folder and show table of contents for the currently opened file. The table of content is automatically generated based on the subheadings.

![Sidebar view has three options: Show folder content, global search and table of content][12]

The gear icon at the bottom gives you additional settings to configure the editor. You can choose the themes, change image settings, views, enable auto-save and modify many more settings.

![Configuration and settings][13]

### Installing Marktext

Marktext is a cross-platform, open source application. Along with Linux, it is available for Windows and macOS.

For Linux, you get the options of AppImage and Flatpak. You can get the AppImage from[the release page][14].

I chose the Flatpak version for better system integration. And it did work well because Marktext automatically became the default editor for .md files on my Ubuntu 22.04 system.

Please ensure that you have Flatpak support enabled on your system and then add Flathub repo:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

After that, use the command below to install it on your system:

```
flatpak install flathub com.github.marktext.marktext
```

If you don’t like it, you can remove it using this command:

```
fkatpak uninstall com.github.marktext.marktext
```

### Verdict

There are plenty of small features like word count, math latex, spell checker or copy-pasting as markdown or HTML and I leave them up to you to discover.

I’ll be honest. Despite using Markdown for writing articles for years, I don’t remember all the syntaxes. I remember the common ones for headings, lists, code block etc but if I have to create a table, I’ll have to search the web.

I have [experimented with a number of markdown editors][15] and there are plenty of good ones there. However, I took an instant liking to Marktext and it is going to be on my system for a long time.

If you try it, do share your experience in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/marktext-editor/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/joplin/
[2]: https://itsfoss.com/zettlr-markdown-editor/
[3]: https://itsfoss.com/markdown-guide/
[4]: https://github.com/marktext/marktext/
[5]: https://www.electronjs.org/
[6]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-dark-theme.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-insert-options.png
[9]: https://itsfoss.com/wp-content/uploads/2022/08/text-formatting-options-marktext.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/images-in-marktext.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/tables-in-marktext.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/sidebar-view-marktext.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-settings.png
[14]: https://github.com/marktext/marktext/releases
[15]: https://itsfoss.com/best-markdown-editors-linux/
