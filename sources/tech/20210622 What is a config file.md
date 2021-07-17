[#]: subject: (What is a config file?)
[#]: via: (https://opensource.com/article/21/6/what-config-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is a config file?
======
There are several popular formats for configuration files, each with its
own strengths. Find what works best for you.
![Computer screen with files or windows open][1]

There are thousands of configuration files on your computer. You may never directly interact with the bulk of them, but they're scattered throughout your `/etc` folder and in `~/.config` and `~/.local` and `/usr`. There are probably some in `/var` and possibly even in `/opt`. If you've ever opened one by accident or to make a change, you may have wondered why some configuration files look one way while others look completely different.

Storing configurations is a flexible task because as long as developers know how their code puts data into a file, they can easily write code to extract that data as needed. However, the tech industry graciously favors well-documented standardization, so several well-known formats have evolved over the years to make configuration easy.

### Why we need configuration

Configuration files ("config files" for short) are important to modern computing. They allow you to customize how you interact with an application or how an application interacts with the rest of your system. It's thanks to config files that any time you launch an application, it has "memories" of how you like to use it.

Configuration files can be, and often are, very simple in structure. For instance, if you were to write an application, and the only thing it ever needed to know was its user's preferred name, then its one and only config file could contain exactly one word: the name of the user. For example:


```
`Tux`
```

Usually, though, an application needs to keep track of more than just one piece of information, so configuration often uses a key and a value:


```
NAME='Tux'
SPECIES='Penguin'
```

Even without programming experience, you can imagine how code parses that data. Here are two simple examples, one using the [`awk` command][2] and the other using the [grep command][3], focusing on just the line containing the "key" of `NAME`, and returning the "value" appearing after the equal sign (`=`):


```
$ awk -F'=' '/NAME/ { print $2; }' myconfig.ini
'Tux'
$ grep NAME fake.txt | cut -d'=' -f2
'Tux'
```

The same principle applies to any programming language and any configuration file. As long as you have a consistent data structure, you can write simple code to extract and parse it when necessary.

### Choose a format

To be broadly effective, the most important thing about configuration files is that they are consistent and predictable. The last thing you want to do is dump information into a file under the auspices of saving user preferences and then spend days writing code to reverse-engineer the random bits of information that have ended up in the file.

There are several popular formats for configuration files, each with its own strengths.

#### INI

INI files take the format of key and value pairs:


```
[example]
name=Tux
style=widgety,fidgety
enabled=1
```

This simple style of configuration can be intuitive, with the only point of confusion being poor key names (for example, cryptic names like `unampref` instead of `name`). They're easy to parse and easy to edit.

The INI format features sections in addition to keys and values. In this sample code, `[example]` and `[demo]` are configuration sections:


```
[example]
name=Tux
style=widgety,fidgety
enabled=1

[demo]
name=Beastie
fullscreen=1
```

This is a little more complex to parse because there are _two_ `name` keys. You can imagine a careless programmer querying this config file for `name` and always getting back `Beastie` because that's the last name defined by the file. When parsing such a file, a developer must be careful to search within sections for keys, which can be tricky depending on the language used to parse the file. However, it's a popular enough format that most languages have an existing library to help programmers parse INI files.

#### YAML

[YAML files][4] are structured lists that can contain values or key and value pairs:


```
\---
Example:
  Name: 'Tux'
  Style:
   - 'widgety'
    - 'fidgety'
  Enabled: 1
```

YAML is popular partly because it looks clean. It doesn't have much of a syntax aside from where you place the data in relation to previous data. What's a feature for some, though, is a bug for others, and many developers avoid YAML because of the significance it places on what is essentially _not there_. If you get indentation wrong in YAML, YAML parsers may see your file as invalid, and even if it's tolerated, it may return incorrect data.

Most languages have YAML parsers, and there are good open source YAML linters (applications to validate syntax) to help you ensure the integrity of a YAML file.

#### JSON

JSON files are technically subsets of YAML, so its data structure is the same, although its syntax is completely different:


```
{
  "Example": {
    "Name": [
      "Tux"
    ],
    "Style": [
      "widgety",
      "fidgety"
    ],
    "Enabled": 1
  }
}
```

JSON is popular among JavaScript programmers, which isn't surprising, given that JSON stands for JavaScript Object Notation. As a result of being strongly associated with web development, JSON is a common output format for web APIs. Most programming languages have libraries to parse JSON.

#### XML

XML uses tags as keys that surround a configuration value:


```
&lt;example&gt;
  &lt;name&gt;Tux&lt;/name&gt;
  &lt;style priority="user"&gt;widgety&lt;/style&gt;
  &lt;style priority="fallback"&gt;fidgety&lt;/style&gt;
  &lt;enabled&gt;1&lt;/enabled&gt;
&lt;/example&gt;
```

XML is often used by Java programmers, and Java has a rich set of XML parsers. While it has a reputation of being quite strict, XML is simultaneously very flexible. Unlike HTML, which has a set of tags you're allowed to use, you can arbitrarily invent your own XML tags. As long as you structure it consistently and have a good library to parse it, you can extract your data with precision and ease.

There are some good open source linters to help you validate XML files, and most programming languages have a library to parse XML.

#### Binary formats

Linux prides itself on plain-text configuration. The advantage is that you can see configuration data using basic tools like [cat][5], and you can even edit a configuration with your [favorite text editor][6].

Some applications use binary formats, though, which means the data is encoded in some format that is not a natural language. These files usually require a special application (usually the application they're meant to configure) to interpret their data.
You can't view these files, at least not in a way that makes any sense, and you can't edit them outside of their host application. Some reasons for resorting to binary formats are:

  * **Speed:** A programmer can register specific bits of information at certain points within a binary's config file using custom notation. When the data is extracted, there's no searching involved because everything is already indexed.
  * **Size:** Text files can get big, and should you choose to compress a text file, you're functionally turning it into a binary format. Binary files can be made smaller through tricks of encoding (the same is true of text files, but at some point, your optimizations make your data so obscure that it may as well be binary).
  * **Obfuscation:** Some programmers don't want people even looking at their configuration files, so they encode them as binary data. This usually succeeds only in frustrating users. This is not a good reason to use binary formats.



If you must use a binary format for configuration, use one that already exists as an open standard, such as [NetCDF][7].

### Find what works

Configuration formats help developers store the data their applications need and help users store preferences for how they want applications to act. There's probably no wrong answer to the question of what format you should use, as long as you feel well supported by the language you're using. When developing your application, look at the formats available, model some sample data, review and evaluate the libraries and utilities your programming language provides, and choose the one you feel the most confident about.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/what-config-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/20/9/awk-ebook
[3]: https://opensource.com/downloads/grep-cheat-sheet
[4]: https://www.redhat.com/sysadmin/yaml-beginners
[5]: https://opensource.com/article/19/2/getting-started-cat-command
[6]: https://opensource.com/article/21/2/open-source-text-editors
[7]: https://www.unidata.ucar.edu/software/netcdf/
