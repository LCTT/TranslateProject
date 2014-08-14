How to remove file metadata on Linux
================================================================================
A typical data file often has associated "metadata" which is descriptive information about the file, represented in the form of a set of name-value pairs. Common metadata include creator's name, tools used to generate the file, file creation/update date, location of creation, editing history, etc. EXIF (images), RDF (web resources), DOI (digital documents) are some of popular metadata standards.

While metadata has its own merits in data management fields, it can actually affect your privacy [adversely][1]. EXIF data in photo images can reveal personally identifiable information such as your camera model, GPS coordinate of shooting, your favorite photo editor software, etc. Metadata in documents and spreadsheets contain author/affiliation information and other editing history. Not to be paranoid, but metadata gathering tools such as [metagoofil][2] are often exploited during information gathering stage as part of penetration testing.

For those of you who want to strip any personalizing metadata from any shared data, there are ways to remove metadata from data files. You can use existing document or image editor software which typically have built-in metadata editing capability. In this tutorial, let me introduce a nice standalone **metadata cleaner tool** which is developed for a single goal: **anonymize all metadata for your privacy**.

[MAT][3] (Metadata Anonymisation Toolkit) is a dedicated metadata cleaner written in Python. It was developed under the umbrella of the Tor project, and comes standard on [Tails][4], privacy-enhanced live OS.

Compared to other tools such as [exiftool][5] which can write to only a limited number of file types, MAT can eliminate metadata from all kinds of files: images (png, jpg), documents (odt, docx, pptx, xlsx, pdf), archives (tar, tar.bz2), audio (mp3, ogg, flac), etc.

### Install MAT on Linux ###

On Debian-based systems (Ubuntu or Linux Mint), MAT comes packaged, so installation is straightforward:

    $ sudo apt-get install mat 

On Fedora, MAT does not come as a pre-built package, so you need to build it from the source. Here is how I built MAT on Fedora (with some limited success; see the bottom of the tutorial):

    $ sudo yum install python-devel intltool python-pdfrw perl-Image-ExifTool python-mutagen
    $ sudo pip install hachoir-core hachoir-parser
    $ wget https://mat.boum.org/files/mat-0.5.tar.xz
    $ tar xf mat-0.5.tar.xz
    $ cd mat-0.5
    $ python setup.py install 

### Anonymize Metadata with MAT-GUI ###

Once installed, MAT can be accessible via GUI as well as from the command line. To launch MAT's GUI, simply type:

    $ mat-gui

Let's clean up a sample document file (e.g., private.odt) which has the following metadata embedded.

![](https://farm6.staticflickr.com/5588/14694815240_22eced1f94_z.jpg)

To add the file to MAT for cleanup, click on "Add" icon. Once the file is loaded, click on "Check" icon to scan for any hidden metadata information.

![](https://farm4.staticflickr.com/3874/14694958067_00694d9d1f_z.jpg)

Once any metadata is detected by MAT, "State" will be marked as "Dirty". You can double click the file to see detected metadata.

![](https://farm4.staticflickr.com/3861/14694815160_cda63bb8d8_z.jpg)

To clean up metadata from the file, click on "Clean" icon. MAT will automatically empty all private metadata fields from the file.

![](https://farm6.staticflickr.com/5554/14694815220_40918f680f_z.jpg)

The cleaned up state is without any personally identifiable traces:

![](https://farm6.staticflickr.com/5591/14881486215_83808b6aaf_z.jpg)

### Anonymize Metadata from the Command Line ###

As mentioned before, another way to invoke MAT is from the command line, and for that, use mat command.

To check for any sensitive metadata, first go to the directory where your files are located, and then run:

    $ mat -c .

It will scan all files in the current directory and its sub directories, and report their state (clean or unclean).

![](https://farm6.staticflickr.com/5564/14878449991_cf9d605e6d_o.png)

You can check actual metadata detected by using '-d' option:

    $ mat -d <input_file> 

![](https://farm6.staticflickr.com/5558/14901361173_0e587329f5_z.jpg)

If you don't supply any option with mat command, the default action is to remove metadata from files. If you want to keep a backup of original files during cleanup, use '-b' option. The following command cleans up all files, and stores original files as '*.bak" files.

    $ mat -b . 

![](https://farm6.staticflickr.com/5591/14694850169_1cf7562657_z.jpg)

To see a list of all supported file types, run:

    $ mat -l 

![](https://farm6.staticflickr.com/5588/14901361153_e59ab7b684_z.jpg)

### Troubleshooting ###

Currently I have the following issue with a compiled version of MAT on Fedora. When I attempt to clean up archive/document files (e.g., *.gz, *.odt, *.docx) on Fedora, MAT fails with the following error. If you know how to fix this problem, let me know in the comment.

      File "/usr/lib64/python2.7/zipfile.py", line 305, in __init__
        raise ValueError('ZIP does not support timestamps before 1980')
    ValueError: ZIP does not support timestamps before 1980

### Conclusion ###

MAT is a simple, yet extremely useful tool to prevent any inadvertent privacy leaks from metadata. Note that it is still your responsibility to anonymize file content, if necessary. All MAT does is to eliminate metadata associated with your files, but does nothing with the files themselves. In short, MAT can be a life saver as it can handle most common metadata removal, but you shouldn't rely solely on it to guarantee your privacy.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/remove-file-metadata-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://www.theguardian.com/world/2013/sep/30/nsa-americans-metadata-year-documents
[2]:http://code.google.com/p/metagoofil/
[3]:https://mat.boum.org/
[4]:https://tails.boum.org/
[5]:http://xmodulo.com/2013/08/view-or-edit-pdf-and-image-metadata-from-command-line-on-linux.html