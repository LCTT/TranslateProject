[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Print double-sided documents at home with this simple Bash script)
[#]: via: (https://opensource.com/article/20/4/print-duplex-bash-script)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Print double-sided documents at home with this simple Bash script
======
Use this script and save yourself the hassle and wasted paper of trying
to manually load and print double-sided documents.
![bash logo on green background][1]

We have a laser printer at home. This Hewlett Packard LaserJet Pro CP1525nw Color Printer is an older model, but it has been a great workhorse that prints reliably and in color. I [put it on our home network][2] a few years ago using our [Raspberry Pi][3] as a print server.

The LaserJet has been a great addition to my home office. Since [I launched my company][4] last year, I have relied on this little laser printer to print handouts and other materials for client meetings, workshops, and training sessions.

My only gripe with this printer is that it prints single-sided only. If you want to print double-sided, you need to set up a custom print job to do it yourself. That's inconvenient and requires manual steps. In LibreOffice, I need to specifically set up the print job to print the odd-numbered pages first, then reload the paper before printing the even-numbered pages on the other side—but in reverse order.

![LibreOffice print dialog][5]

If I need to print a PDF that someone has sent me, the process is the same. For a four-page document, I first need to print pages 1 and 3, then reload the paper and print pages 2 and 4 in reverse order. In the GNOME print dialog, you need to select "Page Setup" to print odd pages or even pages.

![Gnome print dialog][6]

![Gnome page setup][7]

Regardless of how I print, the overall process is to print the odd-numbered pages, reload the stack of printed pages into the paper tray, then print the even-numbered pages in reverse order. If I'm printing a four-page document, printing the even-numbered pages in reverse order means page 4 prints on the back of page 3 and page 2 prints on the back of page 1. Imagine my frustration in those few instances when I forgot to select the option to print in reverse order when printing the even-numbered pages and ruined a long print job.

Similarly, it's easy to forget how to deal with documents that have an odd number of pages. In a five-page document, you first print pages 1, 3, and 5. But when you reload the printed pages into the printer, you don't want page 5. Instead, you only want to load pages 1 and 3. Otherwise, page 4 will print on the back of page 5, page 2 will print on the back of page 3, and nothing gets printed on the back of page 1.

To make things easier and more reliable, I wrote a simple Bash script that automates printing duplex. This is basically a wrapper to print odd-numbered pages, remind me to reload the pages (and remove the last page if needed), then print the even-numbered pages.

Whenever I need to print a document as duplex, I first convert the document to PDF. This is very easy to do. In LibreOffice, there's a toolbar icon to export directly as PDF. You can also navigate under **File— Export As—Export as PDF** to do the same. Or in any other application, there's usually a **Save to PDF** feature. When in doubt, GNOME supports printing to a PDF file instead of a printer.

![Libre Office toolbar][8]

![Export as PDF][9]

### How it works

Once I've saved to PDF, I let my Bash script do the rest. This really just automates the **lpr** commands to make printing easier. It prints odd pages first, prompts me to reload the paper, then prints the even pages. If the document has an odd number of pages, it also reminds me to remove the last page when I reload the printed pages. It's pretty simple.

The only "programming" part of the script is determining the page count, and figuring out if that's an even or odd number. Both of those are easy to do.

To determine the page count, I use the **pdfinfo** command. This generates useful info about a PDF document. Here's some sample output:


```
$ pdfinfo All\ training\ -\ catalog.pdf
Creator:        Writer
Producer:       LibreOffice 6.3
CreationDate:   Fri Oct 18 16:06:07 2019 CDT
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          11
Encrypted:      no
Page size:      612 x 792 pts (letter)
Page rot:       0
File size:      65623 bytes
Optimized:      no
PDF version:    1.5
```

That output is very easy to parse. To get the page count, I use an AWK one-line script to look for **Pages:** and print the second field.


```
`pages=$( pdfinfo "$1" | awk '/^Pages:/ {print $2}' )`
```

To figure out if this is an odd or even number, I use the modulo (**%**) arithmetic operator to divide by two and tell me the remainder. The modulo of two will always be zero for an even number, and one for an odd number. I use this simple test to determine if the document has an odd number of pages, so I'll need to remove the last page before printing the rest of the document:


```
`if [ $(( $pages % 2 )) -ne 0 ] ; then`
```

With that, writing the **print-duplex.sh** Bash script is a simple matter of calling **lpr** with the correct options to send output to my printer (**lpr -P "HP_LaserJet_CP1525nw"**), to print odd-numbered pages (**-o page-set=odd**) or even-numbered pages (**-o page-set=even**), and to print in reverse order (**-o outputorder=reverse**).

### Bash script


```
#!/bin/sh
# print-duplex.sh
# simple wrapper to print duplex

cat&lt;&lt;EOF
$1 ($pages pages)
\-------------------------------------------------------------------------------
Printing odd pages first
Please wait for job to finish printing...
\-------------------------------------------------------------------------------
EOF

lpr -P "HP_LaserJet_CP1525nw" -o page-set=odd "$1"
sleep $pages

cat&lt;&lt;EOF
===============================================================================
Put paper back into the printer in EXACT OUTPUT ORDER (face down in tray)
then press ENTER
===============================================================================
EOF

pages=$( pdfinfo "$1" | awk '/^Pages:/ {print $2}' )

if [ $(( $pages % 2 )) -ne 0 ] ; then
  echo '!! Remove the last page - this document has an odd number of pages'
fi

echo -n '&gt;'
read x

cat&lt;&lt;EOF
\-------------------------------------------------------------------------------
Printing even pages
Please wait for job to finish printing...
\-------------------------------------------------------------------------------
EOF

lpr -P "HP_LaserJet_CP1525nw" -o page-set=even -o outputorder=reverse "$1"
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/print-duplex-bash-script

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/18/3/print-server-raspberry-pi
[3]: https://opensource.com/resources/raspberry-pi
[4]: https://opensource.com/article/19/9/business-creators-open-source-tools
[5]: https://opensource.com/sites/default/files/uploads/print_dialog_-_libreoffice_0.png (LibreOffice print dialog)
[6]: https://opensource.com/sites/default/files/uploads/print_dialog_-_gnome_0.png (Gnome print dialog)
[7]: https://opensource.com/sites/default/files/uploads/print_dialog_-_gnome_-_page_setup.png (Gnome page setup)
[8]: https://opensource.com/sites/default/files/uploads/toolbar_-_export_as_pdf_-_libreoffice.png (Libre Office toolbar)
[9]: https://opensource.com/sites/default/files/uploads/file_-_export_as_pdf_-_libreoffice.png (Export as PDF)
