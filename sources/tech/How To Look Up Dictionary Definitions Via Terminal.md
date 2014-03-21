How To Look Up Dictionary Definitions Via Terminal
================================================================================
Most people when they find a word they’re not familiar with, they Google it. Either that or they have a favorite online dictionary that provides an answer. What happens when you have no network connectivity? Or maybe you have an older distribution of Linux and you don’t have a GUI? You need to look it up offline. A good way to do that is here.

First you need to set up dictd locally. **Dictd** is a dictionary database server. It allows you to access online dictionaries. But wait, that’s what we wanted to avoid, right? A connection over the Internet. That’s why you set it up on localhost. It comes with a command-line client.

To install dictd on Ubuntu or Debian you type:

    $ sudo apt-get install dictd

That was easy. Now you need to install dictionaries for it to use. After each dictionary addition dictd will automatically restart to reload its databases. Let’s say we want to install the English dictionary and an English thesaurus (look up synonyms).

Type:

    $ sudo apt-get install dict-gcide
    $ sudo apt-get  install dict-moby-thesaurus

If you want another language you can check the other packages by typing:

    $ sudo apt-cache search “dict package”

That will give you a list like:

    dict-freedict-eng-ara - Dict package for English-Arabic Freedict dictionary
    dict-freedict-eng-cro - Dict package for English-Croatian Freedict dictionary
    dict-freedict-eng-cze - Dict package for English-Czech Freedict dictionary
    dict-freedict-eng-deu - Dict package for English-German Freedict dictionary
    dict-freedict-eng-fra - Dict package for English-French Freedict dictionary

Now after that you have successfully installed dictd and can look up definitions.

First, let’s check if dictd server is running and what databases are installed:

    $ dict -I

Example of output:

    dictd 1.12.0/rf on Linux 3.2.0-29-generic-pae
    On my_host: up 95.000, 2 forks (75.8/hour)

    Database      Headwords         Index          Data  Uncompressed
    gcide              203645       3859 kB         12 MB         38 MB
    moby-thesaurus      30263        528 kB         10 MB         28 MB

To look up a word definition you need to use a particular dictionary of those you have installed. Let’s check the English one (gcide):

    $ dict -d gcide [word you want to look up]

If you don’t use the **-d** parameter dictd will search all available databases and return matched definitions.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/look-dictionary-definitions-via-terminal/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出