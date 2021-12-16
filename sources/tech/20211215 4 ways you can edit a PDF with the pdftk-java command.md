[#]: subject: "4 ways you can edit a PDF with the pdftk-java command"
[#]: via: "https://opensource.com/article/21/12/edit-pdf-linux-pdftk"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 ways you can edit a PDF with the pdftk-java command
======
Combine PDFs, remove pages, split PDFs, and fill in forms with this
handy Linux command.
![a checklist for a team][1]

Between technology whitepapers, manuscripts, and RPG books, I deal with lots of PDFs every day. The PDF format is popular because it contains processed PostScript code. PostScript is the native language of modern printers, so publishers often release a digital version of a book as a PDF because they've invested in the time and effort to produce a file for print anyway. But a PDF isn't intended to be an editable format, and while some reverse processing is possible, it's meant to be the last stop for digital data before it's sent to the printer. Even so, sometimes you need to make adjustments to a PDF, and one of my favorite tools for that job is the [pdftk-java][2] command.

### Install pdftk-java on Linux

As its name suggests, `pdftk-java` is written in Java, so it works on all major operating systems as long as you have Java installed.

Linux and macOS users can install Java from [AdoptOpenJDK.net][3]. Windows users can install [Red Hat's Windows build of OpenJDK][4].

To install `pdftk-java`:

1\. Download the [pdftk-all.jar release][5] from its Gitlab repository, and save it to `~/.local/bin/` or [some other location in your path][6].

2\. Open `~/.bashrc` in your favorite text editor and add this line to it:


```
`alias pdftk='java -jar $HOME/.local/bin/pdftk-all.jar'`
```

3\. Load your new Bash settings:


```
`$ source ~/.bashrc`
```

### Command syntax

The structure of a valid `pdftk-java` command follows a pattern, but there's a lot of flexibility in what's in the pattern. The syntax is a little unusual because it doesn't use traditional-style [terminal options][7], but with practice, it's not too difficult to remember.

  * `pdftk`: The alias to call the command
  * input file: The PDF you want to modify
  * action: What you want to do to the input file
  * output: Where you want to save your modified PDF file



It's the action part that's most complex, so I'll start with simple tasks.

### Combine two PDF files into one

It's not uncommon for the front cover of a book to be created in a separate application, such as Inkscape or GIMP, than the rest of the book, which is usually done in a layout application like Scribus or an office suite like LibreOffice. You could combine the two in your layout application. A good desktop publisher like Scribus makes it easy just to reference an image so that when the cover changes, it's automatically updated in layout. However, it's also possible to prepend the cover to a PDF with `pdftk-java`:


```


$ pdftk cover.pdf body.pdf \
cat \
output book.pdf

```

In this example, the action is `cat`, as in _concatenate_ and like the Linux [cat command][8], it concatenates one or more PDF files into a single data stream, and the data stream is directed into whatever file the `output` argument specifies.

### Remove pages from a PDF

You can't exactly remove a page from a PDF, but you can create a new PDF containing only the pages you want to keep.


```


$ pdftk book.pdf \
cat 1 3-end \
output shorter-book.pdf

```

In this example, page 1 of my book file, and all pages from 3 to the end, are saved to a new file. The page I've removed, therefore, is page 2.

### Split a PDF into separate files

Splitting a PDF file into many different files also uses the `cat` action, and it's similar in principle to removing pages. You can split a PDF by sending the pages you want to a new file:


```


$ pdftk book.pdf \
cat 1-15 \
output part-1.pdf

$ pdftk book.pdf \
cat 16-42 \
output part-2.pdf

```

If you need to split a PDF into single-page files, there's a special action for that, called `burst`:


```


$ pdftk book.pdf burst

$ ls
book.pdf pg_0001.pdf pg_0002.pdf
pg_0003.pdf pg_0004.pdf pg_0005.pdf
[...]

```

### Fill in forms

Few would argue that the PDF format hasn't become bloated over the years, and one feature you sometimes find in a PDF file is a fillable form. You see this in US tax documents, RPG character sheets, online school workbooks, and other PDF files that are intended to be interactive. While most modern PDF viewers, such as GNOME's Evince and KDE's Okular, can fill out PDF forms, you can also fill out a PDF form with the help of `pdftk-java`.

First, you must extract the form data using the `generate_fdf` action. This extracts the IDs of the form elements and places them into a text file.


```


$ pdftk character-sheet.pdf \
generate_fdf \
output chsheet-form.txt

```

Your destination file (in this example, `chsheet-form.txt`) contains the data of the form contained in the PDF, but just the text parts. You can edit it in any standard text editor, like [Atom][9] or [Gedit][10].

In a sometimes admirable and sometimes awkward glimpse into the workflow of the organization producing the PDF, you'll find some forms are clearly labeled, while others have default names like "Checkbox_001" and "Textfield-021", so you might have to cross-reference your text file with your PDF, but that may be worthwhile if you're writing a script to fill out forms automatically. Each label is marked as a `/T` item, and on the following line, there's space (marked as `/V`) provided for text entry. Here's a snippet from one that's got context to its labels and some data filled in:


```


/T (CharacterName 2)
/V (Abaddon)
&gt;&gt;
&lt;&lt;
/T (SlotsTotal 24)
/V ()
&gt;&gt;
&lt;&lt;
/T (Hair)
/V (Brown)
&gt;&gt;
&lt;&lt;
/T (AC)
/V (15)
&gt;&gt;
&lt;&lt;
/T (Background)
/V ()
&gt;&gt;
&lt;&lt;
/T (DEXmod )
/V ()

```

Once you've got the form data entered, you can combine your text input with the PDF structure with the `fill_form` action:


```


$ pdftk character-sheet.pdf \
fill_form chsheet-form.txt \
output completed.pdf

```

Here's a sample of the result:

![A form filled by pdftk-java][11]

(Seth Kenlon, CC BY-SA 4.0)

### PDF modification made easy

When you deal with lots of PDF files or PDF files through shell scripts, a tool like `pdftk-java` is invaluable because it frees you from having to do everything manually. When I build a PDF from the output of [Docbook][12], it's a Makefile that calls `pdftk-java` for any number of tasks, so there's no chance of me forgetting a step or mistyping the command, and there's no need for me to spend my time on it. There are lots of other reasons you might use `pdftk-java` in your own workflow, and lots of other things `pdftk-java` can do, including actions like `shuffle`, `rotate`, `dump_data`, `update_info`, and `attach_files`. If you find yourself dealing with PDF files often, give `pdftk-java` a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/edit-pdf-linux-pdftk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://gitlab.com/pdftk-java/pdftk
[3]: https://adoptopenjdk.net/releases.html
[4]: https://developers.redhat.com/products/openjdk/download
[5]: https://gitlab.com/pdftk-java/pdftk/-/jobs/1527259628/artifacts/raw/build/libs/pdftk-all.jar
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/article/21/8/linux-terminal
[8]: https://opensource.com/article/19/2/getting-started-cat-command
[9]: https://opensource.com/article/20/12/atom
[10]: https://opensource.com/article/20/12/gedit
[11]: https://opensource.com/sites/default/files/pdftk-form-fill.jpg (A form filled by pdftk-java)
[12]: https://opensource.com/article/17/9/docbook
