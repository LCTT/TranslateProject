[#]: subject: "How I use the Linux fmt command to format text"
[#]: via: "https://opensource.com/article/22/7/fmt-trivial-text-formatter"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use the Linux fmt command to format text
======
The fmt command is a trivial text formatter. Here's how I use it to format text and email replies. 

When I write documentation for a project, I often write the Readme file and Install instructions in plain text. I don't need to use markup languages like HTML or Markdown to describe what a project does or how to compile it. But maintaining this documentation can be a pain. If I need to update the middle of a sentence in my `Readme` text file, I need to reformat the text so I don't end up with a really long or short line in the middle of my other text that's otherwise formatted to 75 columns. Some editors include a feature that will automatically reformat text to fill paragraphs, but not all do. That's where the Linux `fmt` command comes to the rescue.

### Format text with Linux fmt

The `fmt` command is a trivial text formatter; it collects words and fills paragraphs, but doesn't apply any other text styling such as italics or bold. It's all just plain text. With `fmt`, you can quickly adjust text so it's easier to read. Let's say I start with this familiar sample text:

```
$ cat trek.txt 
Space: the final
frontier. These are the voyages
of the starship Enterprise. Its
continuing mission: to explore
strange new worlds. To
seek out new life and new
civilizations. To boldly go
where no one has gone before!
```

In this sample file, lines have different lengths, and they are broken up in an odd way. You might have similar odd line breaks if you make lots of changes to a plain text file. To reformat this text, you can use the `fmt` command to fill the lines of the paragraph to a uniform length:

```
$ fmt trek.txt 
Space: the final frontier. These are the voyages of the starship
Enterprise. Its continuing mission: to explore strange new worlds. To
seek out new life and new civilizations. To boldly go where no one has
gone before!
```

By default, `fmt` will format text to 75 columns wide, but you can change that with the -w or --width option:

```
$ fmt -w 60 trek.txt 
Space: the final frontier. These are the voyages of
the starship Enterprise. Its continuing mission: to
explore strange new worlds. To seek out new life and new
civilizations. To boldly go where no one has gone before!
```

### Format email replies with Linux fmt

I participate in an email list where we prefer plain text emails. That makes archiving emails on the list server much easier. But the reality is not everyone sends emails in plain text. And sometimes, when I reply to those emails as plain text, my email client puts an entire paragraph on one line. That makes it difficult to "quote" a reply in an email.

Here's a simple example. When I'm replying to an email as plain text, my email client "quotes" the other person's email by adding a > character before each line. For a short message, that might look like this:

```
> I like the idea of the interim development builds.
```

A long line that doesn't get "wrapped" properly will not display correctly in my plain text email reply, because it will be just one long line with a > character at the front, like this:

```
> I like the idea of the interim development builds. This should be a great way to test new changes that everyone can experiment with.
```

To fix this, I bring up a terminal and copy and paste the quoted text into a new file. Then I use the -p or --prefix option to tell `fmt` what character to use as a "prefix" before each line.

```
$ cat > email.txt
> I like the idea of the interim development builds. This should be a great way to test new changes that everyone can experiment with.
^D
$ fmt -p '>' email.txt
> I like the idea of the interim development builds. This should be a
> great way to test new changes that everyone can experiment with.
```

The`fmt` command is a very simple text formatter, but it can do lots of useful things that help in writing and updating documentation in plain text. Explore the other options such as -c or --crown-margin to match the indentation of the first two lines of a paragraph, such as bullet lists. Also try -t or --tagged-paragraph to preserve the indentation of the first line in a paragraph, like indented paragraphs. And the -u or --uniform-spacing option to use one space between words and two spaces between sentences.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/fmt-trivial-text-formatter

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/osdc-docdish-typewriterkeys-3-series.png
