wangjiezhe translating ...

Linux FAQs with Answers--How to convert a text file to PDF format on Linux
================================================================================
> **Question**: I want to convert a plain text file into a PDF document. Is there an easy way to convert a text file to a PDF file from the command line on Linux? 

When you have a bunch of text documents to maintain, there are advantages in converting them into PDF format. For example, PDF is good for printing because PDF documents have pre-defined layout. Besides, with PDF format, there is less risk hat the documents are accidentally modified.

To convert a text file to PDF format, you can follow two-step procedures.

### Prerequisites ###

First, you need to install two prerequisite packages.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install enscript ghostscript 

On Fedora, CentOS/RHEL:

    $ sudo yum install enscript ghostscript 

On Arch Linux:

    $ sudo pacman -S enscript ghostscript 

### Convert a Text File to PDF Format ###

Once all prerequisites are installed, follow these two steps to generate a PDF file from a text file.

First, convert a text file to Postscript format by using enscript command-line tool.

    $ enscript -p output.ps input.txt 

Finally convert the generated postscript file to a PDF file.

    $ ps2pdf output.ps output.pdf 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/convert-text-to-pdf-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
