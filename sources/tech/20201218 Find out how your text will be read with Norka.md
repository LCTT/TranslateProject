[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Find out how your text will be read with Norka)
[#]: via: (https://opensource.com/article/20/12/norka)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Find out how your text will be read with Norka
======
This is a no-frills text editor designed to provide insight into how
your writing will be read and understood.
![Reading a book, selfcare][1]

Some text editors are designed for programming, others for specialized text formats, others for document design. The Norka text editor is designed for reading. It might seem strange to create a text editor designed for _reading_, but actually, it makes a lot of sense if you think about it. Your text is written once or thrice, depending on your personal tolerance for iteration, but it’s meant to be read for years to come. Norka makes it easy for you to focus on how your writing is going to get read.

### Installing

The Norka text editor is licensed with an MIT license and can be [installed as a Flatpak on Linux][2]. It is open source, so if you want to try your hand at installing it on a different platform, you may [clone its Github repository][3].

### Norka interface

The Norka interface is simple—a button back to your Norka document collection, an export button, and a preference menu. The rest of the window is blank space for you to write text into, and in the bottom right corner, there’s a read time calculator to help you understand how long it might take for readers to get through what you’ve written.

![Dark Norka terminal box with green and white text][4]

That’s nearly all there is to Norka. There are no page breaks or line numbers, no code-folding or regex searches. This is an editor meant for text writing words, not styling documents or keeping track of a complex data schema.

There are, of course, some extra features. Copy and paste work as expected with **Ctrl+C** and **Ctrl+V**. You can undo with **Ctrl+Z** and find with **Ctrl+F**. You can even insert emoji with **Ctrl+:**.

![Norka terminal box with pop up box of emoji search menu][5]

#### Styling text

While Norka definitely has no interest in helping you design, say, a brochure or flyer, it does have some ability to indicate how you want your text styled. It does this through [Markdown][6], a simple convention for writing in plain text but with special notation to indicate how the text should be rendered later in HTML or EPUB or PDF or whatever your destination may be.

In most editors, you have to know Markdown to use Markdown, but Norka translates common word processor keyboard shortcuts to produce Markdown for you. For instance, to make a word bold, you can press **Ctrl+B**, which inserts four asterisks on either side of your cursor. When you type the next word, it’s surrounded on either side with two asterisks, which is the Markdown notation for strong (rendered in boldface by default) text. You can view all Markdown shortcuts in the hamburger menu in the upper-right corner of the Norka window.

#### Saving and exporting

You can think of Norka like a notebook. All of the documents you start in Norka remain in Norka’s internal database, and everything is saved automatically by default. To work with a file outside of Norka, you use the **Share** button in the top right corner of your open document. Alternately, you can right-click on any document from Norka's file view and select **Export**. You can export (or _share_—Norka uses both terms interchangeably) a document to **Text**, **HTML**, or **Markdown**.

### Try Norka

Norka is easy to try and easy to use. It helps you focus on writing by keeping its interface simple, almost to the point of restriction. But restrictions can be a powerful creative tool, sometimes.

Norka might not be your best choice for heavy revisions or text processing. It doesn’t have exciting features like case conversion, integrated **sed** commands, character swapping, and so on. It’s a text writer for readers. If that makes sense to you, then you may be just the audience Norka is seeking.

Thanks for spending two minutes and 39 seconds reading this article!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/norka

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/reading_book_selfcare_wfh_learning_education_520.png?itok=H6satV2u (Reading a book, selfcare)
[2]: https://flathub.org/apps/details/com.github.tenderowl.norka
[3]: https://github.com/TenderOwl/Norka
[4]: https://opensource.com/sites/default/files/uploads/norka-31_days-norka-opensource.png (Dark Norka terminal box with green and white text)
[5]: https://opensource.com/sites/default/files/uploads/norka_emoji-31_days-norka-opensource.png (Norka terminal box with pop up box of emoji search menu)
[6]: https://opensource.com/article/19/9/introduction-markdown
