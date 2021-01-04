[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the Markdown Editor app in Nextcloud)
[#]: via: (https://opensource.com/article/20/12/nextcloud-markdown)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use the Markdown Editor app in Nextcloud
======
Nextcloud has one of the smoothest editors of the popular Markdown file
type, with lots of convenient and intuitive features.
![Digital images of a computer desktop][1]

The advantage of plain text is that there’s no extra computer-specific information cluttering up your otherwise human-readable writing. The good thing about computers is that they’re programmable, and so as long as we humans agree to follow very specific conventions when writing, we can program computers to interpret human-readable text as secret instructions. For instance, by surrounding a word with two asterisks, we not only give a visual cue to humans that a word is significant, but we can also program computers to display the word in **bold**.

This is exactly the theory and practice behind [Markdown][2], the popular plain text format that promises writers that as long as _they_ use specific plain text conventions, then their text will be rendered with a specific style.

Traditionally, that has meant that an author writes in plain text and doesn’t see the pretty styling until the text is fed to a converter application (originally `markdown.pl`), but the Markdown Editor app in Nextcloud changes that.

With Nextcloud’s Markdown Editor, you can type in plain text while seeing the style it renders. This is a gamechanger for authors who struggle to remember Markdown’s sometimes confusing notation (do the brackets become before or after the parentheses in a hyperlink?) or who just don’t like the look of plain text. And better yet, it runs in the (Next)cloud, so it’s available to you anywhere.

### Install

To use Nextcloud’s Markdown Editor, you must have an install of Nextcloud. The good news is, Nextcloud is surprisingly _easy_ to install. I’ve installed it on a Raspberry Pi, on a shared server, and even as a local app (which is silly, don’t do it). If you don’t trust your own abilities, you can even rely on [Turnkey Linux][3] to do the hard part for you, or else just purchase managed hosting directly from [Nextcloud.com][4]. Once you have Nextcloud installed, adding apps is simple. Click on your user icon in the top right corner of the Nextcloud interface and select **Apps**. Navigate to the **Office and Text** category and click to install and enable the **Markdown Editor**.

![Nextcloud app store showing Markdown Editor installer][5]

### Launching

After activation, the Markdown Editor gets associated with any file ending in .md in your Nextcloud files, so when you open a Markdown file, you launch Markdown Editor.

### Using Markdown Editor

The Markdown Editor contains a large text field for you to type into and a single toolbar along the top.

![Example markdown file ][6]

The toolbar contains the basic functions of a word processor—styling your text with bold, italics, and strike-through, creating headings and paragraphs, lists, and so on.

Many of these functions get invoked automatically as you type if you know Markdown. If you’re not familiar with Markdown, then the toolbar or the usual keyboard shortcuts (**Ctrl+B** for bold, **Ctrl+I** for italics, and so on) help you style your text.

The great thing about the way Markdown Editor works is that it truly is all things for all users: if you want to type in Markdown, then it accepts that and instantly converts it into visual styling, and if you don’t want to think about Markdown, then it generates the style for you when you use keyboard shortcuts or toolbar buttons. Either way, you never have to see the Markdown syntax, but you also never lose it. It’s the perfect compromise.

It’s an awfully smart editor, too. It offers to create a hyperlink for you when you select a word, it auto-converts Markdown quickly and smoothly, and it knows a few different "flavors" of Markdown syntax (Commonmark primarily, but also traditional Markdown, Github Markdown, and so on).

![black text on white background, word highlighted in blue to create an automatic link][7]

### Try Nextcloud

I’ve used a few Markdown preview applications, and Nextcloud’s Markdown Editor is one of the smoothest. It respects its user and does the bare minimum to display Markdown, so its conversion is fast and accurate. Because it’s an app in Nextcloud, you also get the benefit of having your work saved instantly, with version control, on your own private, open source cloud. Text editing doesn’t get much better than that.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/nextcloud-markdown

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://opensource.com/article/19/9/introduction-markdown
[3]: https://www.turnkeylinux.org/nextcloud
[4]: http://nextcloud.com
[5]: https://opensource.com/sites/default/files/uploads/nextcloud-app-install-31_days-markdown-opensource.jpg (Nextcloud app store showing Markdown Editor installer)
[6]: https://opensource.com/sites/default/files/uploads/nextcloud-markdown-31-days-opensource.jpg (Example markdown file )
[7]: https://opensource.com/sites/default/files/uploads/nextcloud-link-31_days_markdown-opensource.jpg (black text on white background, word highlighted in blue to create an automatic link)
