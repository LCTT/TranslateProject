[#]: subject: "Shrink PDFs with this Linux tool"
[#]: via: "https://opensource.com/article/22/7/shrink-pdfs-minuimus-linux"
[#]: author: "Howard Fosdick https://opensource.com/users/howtech"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Shrink PDFs with this Linux tool
======
Minuimus is an open source program used to reduce PDF storage space by 10% to 20% without altering the data.

![Filing cabinet for organization][1]

Excluding HTML, PDF files are probably the most popular document format on the web. Unfortunately, they're not compact. For example, I like to download free eBooks. A quick glance at my eBook directory shows that its 75 PDF files consume about 500 megabytes. On average, that's over 6.6 MB for each PDF file.

Couldn't I save some storage space by compressing those files? What if I want to send a bundle of them through email? Or host them for download on a website? The transmission would be faster if these files were made smaller. This article shows a simple way to reduce PDF file size. The benefit is that it shrinks your PDFs transparently without altering the data content in any way. Plus, you can also compact many PDF files with a single command.

Compare this to the alternatives. You could upload your PDF files to one of the many online file compression websites. Several are free, but you risk the privacy of your documents by uploading them to an unknown website. More importantly, most websites shrink PDFs by tampering with the images they contain. They either change their resolution or their sizes. So you trade lower image quality to get smaller PDF files. That's the same trade-off you face using interactive apps like LibreOffice, or Ghostscript line commands like`gs` and `ps2pdf`. The technique we'll illustrate in this article compacts PDFs without altering either the images they contain or their data content. And you can reduce many PDFs with a single line command. Let's get started.

### Identify and delete big unused PDFs on Linux

Before you spend time and effort compacting PDF files, identify your largest ones and delete those you don't need. This command lists the 50 biggest PDFs in its directory tree, ordered by descending size:

```
$ find  -type f  -exec  du -Sh {} +  |  grep .pdf | sort -rh  |  head -n 50
```

From the output, you can easily identify and eliminate duplicates. You can also delete obsolete files. Getting rid of these space hogs yields big benefits. Now you know which PDFs are the high payback candidates for the reduction technique we'll now cover.

### Transparently compact PDFs

We'll use the open source [Minuimus][2] program to compact PDFs. Minuimus is a generalized command-line utility that performs all sorts of useful file conversions and compressions. To shrink PDFs, Minuimus unloads and then rebuilds them, gaining numerous efficiencies along the way. It does this transparently, without altering your data in any way.

To use Minuimus, download its [zip file.][3] Then install it as its documentation explains, with these commands:

```
$ make deps      # Installs all required supporting packages
$ make all       # Compiles helper binaries
$ make install   # Copies all needed files to /usr/bin
```

Minuimus is a Perl script, so you run it like this:

```
$ minuimus.pl  input_file.pdf    # replaces the input file with compressed output
```

When it runs, Minuimus immediately makes a backup of your original input file. It only replaces the input file with its compacted version after it fully verifies data accuracy by comparing before and after bitmaps representing the data.

A big benefit to Minuimus is that it validates any PDF file it works on. I've found that it gives intelligent, helpful error messages if it encounters any problems. For example, on one of my computers, Minuimus said that it couldn't properly invoke a utility it uses called `leanify`. Yet it still shrunk the PDFs and ran to successful completion.

Here's how to compact many files in one command. This compresses all the PDF files in a directory:

```
$ minuimus.pl *.pdf
```

If you have lots of PDFs to convert, Minuimus might process for a while. So if you're converting hundreds of PDFs, for example, you might want to run Minuimus as a background job. Schedule it for off-hours through your GUI scheduler or as a Cron job.

Be sure to redirect its output from the terminal to files so that you can easily review it later:

```
$ minuimus.pl *.pdf  1>output_messages.txt  2>error_messages.txt
```

### How much space will you reclaim?

Unfortunately, there's no way to predict how much space Minuimus can save. That's because PDFs contain anything from text to images of all different kinds. They vary enormously. I ran Minuimus on my download directory of PDF books. The directory contained 75 PDFs consuming about 500 MB. Minuimus reduced it by about 11%, to about 445 MB. That's impressive for an algorithm that doesn't change the data.

Across a large group of PDFs, size reduction of 10% to 20% appears common. The biggest files often shrink the most. Processing a collection of big PDFs often reclaims much more space than processing many small PDFs. Some PDF files show really dramatic space savings. That's because some applications create absolutely hideous PDFs. I call those files "PDF monsters." You can slay them with a single Minuimus command.

For example, while writing this article, Minuimus knocked an 85 megabyte PDF down to 32 meg. That's just 38% of its original size. The program slimmed several other monsters by 50%, recovering tens of megabytes. This is why I began this article by introducing a command to list your biggest PDF files. If Minuimus identifies a few monsters you can slay, you can reclaim major disk space for free.

### Shrink PDFs with Minuimus

PDF files are useful and ubiquitous. But they often consume a good deal of storage space. Minuimus makes it easy to reduce PDF storage space by 10% to 20% without altering the data. Perhaps its biggest benefit is identifying and transforming malformed "PDF monsters" into smaller, more manageable files.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/shrink-pdfs-minuimus-linux

作者：[Howard Fosdick][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/files_documents_organize_letter.png
[2]: http://birds-are-nice.me/software/minuimus.html
[3]: http://birds-are-nice.me/software/minuimus.zip
