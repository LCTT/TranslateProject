[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (scanimage: scan from the command line!)
[#]: via: (https://jvns.ca/blog/2020/07/11/scanimage--scan-from-the-command-line/)
[#]: author: (Julia Evans https://jvns.ca/)

scanimage: scan from the command line!
======

Here’s another quick post about a command line tool I was delighted by.

Last night, I needed to scan some documents for some bureaucratic reasons. I’d never used a scanner on Linux before and I was worried it would take hours to figure out. I started by using `gscan2pdf` and had trouble figuring out the user interface – I wanted to scan both sides of the page at the same time (which I knew our scanner supported) but couldn’t get it to work.

### enter scanimage!

`scanimage` is a command line tool, in the `sane-utils` Debian package. I think all Linux scanning tools use the `sane` libraries (“scanner access now easy”) so my guess is that it has similar abilities to any other scanning software. I didn’t need OCR in this case so we’re not going to talk about OCR.

### get your scanner’s name with `scanimage -L`

`scanimage -L` lists all scanning devices you have.

At first I couldn’t get this to work and I was a bit frustrated but it turned out that I’d connected the scanner to my computer, but not plugged it into the wall. Oops.

Once everything was plugged in it worked right away. Apparently our scanner is called `fujitsu:ScanSnap S1500:2314`. Hooray!

### list options for your scanner with `--help`

Apparently each scanner has different options (makes sense!) so I ran this command to get the options for my scanner:

```
scanimage --help -d 'fujitsu:ScanSnap S1500:2314'
```

I found out that my scanner supported a `--source` option (which I could use to enable duplex scanning) and a `--resolution` option (which I changed to 150 to decrease the file sizes and make scanning faster).

### scanimage doesn’t output PDFs (but you can write a tiny script)

The only downside was – I wanted a PDF of my scanned document, and scanimage doesn’t seem to support PDF output.

So I wrote this 5-line shell script to scan a bunch of PNGs into a temp directory and convert the resulting PNGs to a PDF.

```
#!/bin/bash
set -e

DIR=`mktemp -d`
CUR=$PWD
cd $DIR
scanimage -b --format png  -d 'fujitsu:ScanSnap S1500:2314' --source 'ADF Front' --resolution 150
convert *.png $CUR/$1
```

I ran the script like this. `scan-single-sided output-file-to-save.pdf`

You’ll probably need a different `-d` and `--source` for your scanner.

### it was so easy!

I always expect using printers/scanners on Linux to be a nightmare and I was really surprised how `scanimage` Just Worked – I could just run my script with `scan-single-sided receipts.pdf` and it would scan a document and save it to `receipts.pdf`!.
--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/07/11/scanimage--scan-from-the-command-line/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
