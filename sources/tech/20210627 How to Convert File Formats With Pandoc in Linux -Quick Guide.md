[#]: subject: (How to Convert File Formats With Pandoc in Linux [Quick Guide])
[#]: via: (https://itsfoss.com/pandoc-convert-file/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Convert File Formats With Pandoc in Linux [Quick Guide]
======

In an earlier article, I covered the [procedure to batch convert a handful of Markdown files to HTML][1] using pandoc. In that article, multiple HTML files were created, but pandoc can do much more. It has been called “the Swiss army knife” of document conversion – and with good reason. There isn’t a lot that it can’t do.

[Pandoc][2] can covert .docx, .odt, .html, .epub, LaTeX, DocBook, etc. to these and other formats, such as JATS, TEI Simple, AsciiDoc, and more.

Yes, this means that pandoc can convert .docx files to .pdf and .html, but you may be thinking: “Word can export files to .pdf and .html too. Why would I need pandoc?”

You would have a good point there, but since pandoc can convert so many formats, it could well become your go-to tool for all of your conversion tasks. For example, many of us know that [Markdown editors][3] can export its Markdown files to .html. With pandoc, Markdown files can be converted to numerous other formats as well.

I rarely have Markdown export to HTML; I normally let pandoc do it.

### Converting File Formats with Pandoc

![][4]

Here, I will convert Markdown files into a few different formats. I do almost all of my writing using Markdown syntax, but I often have to convert to another format: .docx files are usually required for school work, .html for web pages that I create – and for .epub work, .pdf for flyers and handouts, and even an occasional TEI Simple file for a university digital humanities project. Pandoc can handle all of these, and more, easily.

First, you need to [install pandoc][5]. Also, to create .pdf files, LaTeX will be needed as well. The package I prefer is [TeX Live][6].

**Note**: If you would like to try out pandoc before installing it, there is an online try-out page at: <http://pandoc.org/try/>

#### Installing pandoc and texlive

Users of Ubuntu and other Debian distros can type the following commands in the terminal:

```
sudo apt-get update
sudo apt-get install pandoc texlive
```

Notice on the second line, you are installing pandoc and texlive in one shot. [apt-get command][7] will have no problem with this, but go get some coffee; this may take a few minutes.

#### Getting to Conversion

Once pandoc and texlive are installed, you can burn through some work!

The sample document for this project will be an article that was first published in the _North American Review_ in December of 1894, and is titled: “How To Repel Train Robbers”. The Markdown file that I will be using was created some time ago as part of a restoration project.

The file: `how_to_repel_train_robbers.md` is located in my Documents directory, in a sub-directory named samples. Here is what it looks like in Ghostwriter.

![Markdown file in Ghostwriter][8]

I want to create .docx, .pdf, and .html versions of this file.

#### The First Conversion

I’ll start with making a .pdf copy first, since I went through the trouble of installing a LaTeX package.

While in the ~/Documents/samples/ directory, I type the following to create a .pdf file:

```
pandoc -o htrtr.pdf how_to_repel_train_robbers.md
```

The above command will create a file called htrtr.pdf from the how_to_repel_train_robbers.md file. The reason I used htrtr as a name was that it is shorter than how_to_repel_train_robbers – htrtr is the first letter of each word in the long title.

Here is a snapshot of the .pdf file once it is made:

![Converted PDF file viewed in Ocular][9]

#### The Second Conversion

Next, I want to create a .docx file. The command is almost identical to the one I used to create the .pdf and it is:

```
pandoc -o htrtr.docx how_to_repel_train_robbers.md
```

In no time, a .docx file is created. Here is what it looks like in Libre Writer:

![Converted DOCX file viewed in Libre Writer][10]

#### The Third Conversion

I may want to post this on the web, so a web page would be nice. I will create a .html file with this command:

```
pandoc -o htrtr.html how_to_repel_train_robbers.md
```

Again, the command to create it is very much like the last two conversions. Here is what the .html file looks like in a browser:

![Converted HTML file viewed in Firefox][11]

#### Noticed Anything Yet?

Let’s look at the past commands again. They were:

```
pandoc -o htrtr.pdf how_to_repel_train_robbers.md
pandoc -o htrtr.docx how_to_repel_train_robbers.md
pandoc -o htrtr.html how_to_repel_train_robbers.md
```

The only thing different about these three commands is the extension next to htrtr. This gives you a hint that pandoc relies on the extension of the output filename you provide.

### Conclusion

Pandoc can do far more than the three little conversions done here. If you write with a preferred format, but need to convert the file to another format, chances are great that pandoc will be able to do it for you.

What would you do with this? Would you automate this? What if you had a web site that had articles for your readers to download? You could modify these little commands to work as a script and your readers could decide which format they would like. You could offer .docx, .pdf, .odt, .epub, or more. Your readers choose, the proper conversion script runs, and your readers download their file. It can be done.

--------------------------------------------------------------------------------

via: https://itsfoss.com/pandoc-convert-file/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/convert-markdown-files/
[2]: https://pandoc.org/
[3]: https://itsfoss.com/best-markdown-editors-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/pandoc-quick-guide.png?resize=800%2C450&ssl=1
[5]: https://pandoc.org/installing.html
[6]: https://www.tug.org/texlive/
[7]: https://itsfoss.com/apt-get-linux-guide/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_ghostwriter.png?resize=800%2C516&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_ocular.png?resize=800%2C509&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_libre_writer.png?resize=800%2C545&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_firefox.png?resize=800%2C511&ssl=1
