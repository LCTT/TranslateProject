How to Make ‘Vim Editor’ as Bash-IDE Using ‘bash-support’ Plugin in Linux
============================================================

An IDE ([Integrated Development Environment][1]) is simply a software that offers much needed programming facilities and components in a single program, to maximize programmer productivity. IDEs put forward a single program in which all development can be done, enabling a programmer to write, modify, compile, deploy and debug programs.

In this article, we will describe how to [install and configure Vim editor][2] as a Bash-IDE using bash-support vim plug-in.

#### What is bash-support.vim plug-in?

bash-support is a highly-customizable vim plug-in, which allows you to insert: file headers, complete statements, comments, functions, and code snippets. It also enables you to perform syntax checking, make a script executable, start a debugger simply with a keystroke; do all this without closing the editor.

It generally makes bash scripting fun and enjoyable through organized and consistent writing/insertion of file content using shortcut keys (mappings).

The current version plug-in is 4.3, version 4.0 was a rewriting of version 3.12.1; versions 4.0 or better, are based on a comprehensively new and more powerful template system, with changed template syntax unlike previous versions.

### How To Install Bash-support Plug-in in Linux

Start by downloading the latest version of <a target="_blank" rel="nofollow" style="border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: rgb(187, 14, 48); text-decoration: underline; outline: none 0px; transition-duration: 0.2s; transition-timing-function: ease;">bash-support plug-in</a> using the command below:

```
$ cd Downloads
$ curl http://www.vim.org/scripts/download_script.php?src_id=24452 >bash-support.zip
```

Then install it as follows; create the `.vim` directory in your home folder (in case it doesn’t exist), move into it and extract the contents of bash-support.zip there:

```
$ mkdir ~/.vim
$ cd .vim
$ unzip ~/Downloads/bash-support.zip
```

Next, activate it from the `.vimrc` file:

```
$ vi ~/.vimrc
```

By inserting the line below:

```
filetype plug-in on   
set number   #optionally add this to show line numbers in vim
```

### How To Use Bash-support plug-in with Vim Editor

To simplify its usage, the frequently used constructs as well as certain operations can be inserted/performed with key mappings respectively. The mappings are described in ~/.vim/doc/bashsupport.txt and ~/.vim/bash-support/doc/bash-hotkeys.pdf or ~/.vim/bash-support/doc/bash-hotkeys.tex files.

##### Important:

1.  All mappings (`(\)+charater(s)` combination) are filetype specific: they are only work with ‘sh’ files, in order to avoid conflicts with mappings from other plug-ins.
2.  Typing speed matters-when using key mapping, the combination of a leader `('\')` and the following character(s) will only be recognized for a short time (possibly less than 3 seconds – based on assumption).

Below are certain remarkable features of this plug-in that we will explain and learn how to use:

#### How To Generate an Automatic Header for New Scripts

Look at the sample header below, to have this header created automatically in all your new bash scripts, follow the steps below.

[
 ![Script Sample Header Options](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][3]

Script Sample Header Options

Start by setting your personal details (author name, author reference, organization, company etc). Use the map `\ntw` inside a Bash buffer (open a test script as the one below) to start the template setup wizard.

Select option (1) to setup the personalization file, then press [Enter].

```
$ vi test.sh
```
[
 ![Set Personalizations in Scripts File](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][4]

Set Personalizations in Scripts File

Afterwards, hit [Enter] again. Then select the option (1) one more time to set the location of the personalization file and hit [Enter].

[
 ![Set Personalization File Location](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][5]

Set Personalization File Location

The wizard will copy the template file .vim/bash-support/rc/personal.templates to .vim/templates/personal.templates and open it for editing, where you can insert your details.

Press `i` to insert the appropriate values within the single quotes as shown in the screenshot.

[
 ![Add Info in Script Header](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][6]

Add Info in Script Header

Once you have set the correct values, type `:wq` to save and exit the file. Close the Bash test script, open another script to check the new configuration. The file header should now have your personal details similar to that in the screen shot below:

```
$ test2.sh
```
[
 ![Auto Adds Header to Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][7]

Auto Adds Header to Script

#### Make Bash-support Plug-in Help Accessible

To do this, type the command below on the Vim command line and press [Enter], it will create a file .vim/doc/tags:

```
:helptags $HOME/.vim/doc/
```
[
 ![Add Plugin Help in Vi Editor](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][8]

Add Plugin Help in Vi Editor

#### How To Insert Comments in Shell Scripts

To insert a framed comment, type `\cfr` in normal mode:

[
 ![Add Comments to Scripts](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][9]

Add Comments to Scripts

#### How To Insert Statements in a Shell Script

The following are key mappings for inserting statements (`n` – normal mode, `i` – insert mode):

1.  `\sc` – case in … esac (n, I)
2.  `\sei` – elif then (n, I)
3.  `\sf` – for in do done (n, i, v)
4.  `\sfo` – for ((…)) do done (n, i, v)
5.  `\si` – if then fi (n, i, v)
6.  `\sie` – if then else fi (n, i, v)
7.  `\ss` – select in do done (n, i, v)
8.  `\su` – until do done (n, i, v)
9.  `\sw` – while do done (n, i, v)
10.  `\sfu` – function (n, i, v)
11.  `\se` – echo -e “…” (n, i, v)
12.  `\sp` – printf “…” (n, i, v)
13.  `\sa` – array element, ${.[.]} (n, i, v) and many more array features.

#### Insert a Function and Function Header

Type `\sfu` to add a new empty function, then add the function name and press [Enter] to create it. Afterwards, add your function code.

[
 ![Insert New Function in Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][10]

Insert New Function in Script

To create a header for the function above, type `\cfu`, enter name of the function, click [Enter] and fill in the appropriate values (name, description, parameters and returns):

[
 ![Create Header Function in Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][11]

Create Header Function in Script

#### More Examples of Adding Bash Statements

Below is an example showing insertion of an if statement using `\si`:

[
 ![Add Insert Statement to Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][12]

Add Insert Statement to Script

Next example showing addition of an echo statement using `\se`:

[
 ![Add echo Statement to Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][13]

Add echo Statement to Script

#### How To Use Run Operation in Vi Editor

The following is a list of some run operations key mappings:

1.  `\rr` – update file, run script (n, I)
2.  `\ra` – set script cmd line arguments (n, I)
3.  `\rc` – update file, check syntax (n, I)
4.  `\rco` – syntax check options (n, I)
5.  `\rd` – start debugger (n, I)
6.  `\re` – make script executable/not exec.(*) (in)

#### Make Script Executable

After writing script, save it and type `\re` to make it executable by pressing [Enter].

[
 ![Make Script Executable](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][14]

Make Script Executable

#### How To Use Predefined Code Snippets To a Bash Script

Predefined code snippets are files that contain already written code meant for a specific purpose. To add code snippets, type `\nr` and `\nw` to read/write predefined code snippets. Issue the command that follows to list default code snippets:

```
$ .vim/bash-support/codesnippets/
```
[
 ![List of Code Snippets](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][15]

List of Code Snippets

To use a code snippet such as free-software-comment, type `\nr` and use auto-completion feature to select its name, and press [Enter]:

[
 ![Add Code Snippet to Script](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][16]

Add Code Snippet to Script

#### Create Custom Predefined Code Snippets

It is possible to write your own code snippets under ~/.vim/bash-support/codesnippets/. Importantly, you can also create your own code snippets from normal script code:

1.  choose the section of code that you want to use as a code snippet, then press `\nw`, and closely give it a filename.
2.  to read it, type `\nr` and use the filename to add your custom code snippet.

#### View Help For the Built-in and Command Under the Cursor

To display help, in normal mode, type:

1.  `\hh` – for built-in help
2.  `\hm` – for a command help

[
 ![View Built-in Command Help](http://www.tecmint.com/wp-content/uploads/2017/02/View-Built-in-Command-Help.png) 
][17]

View Built-in Command Help

For more reference, read through the file :

```
~/.vim/doc/bashsupport.txt  #copy of online documentation
~/.vim/doc/tags
```

Visit the Bash-support plug-in Github repository: [https://github.com/WolfgangMehner/bash-support][18]
Visit Bash-support plug-in on the Vim Website: [http://www.vim.org/scripts/script.php?script_id=365][19]

That’s all for now, in this article, we described the steps of installing and configuring Vim as a Bash-IDE in Linux using bash-support plug-in. Check out the other exciting features of this plug-in, and do share them with us in the comments.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-vim-as-bash-ide-using-bash-support-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/best-linux-ide-editors-source-code-editors/
[2]:http://www.tecmint.com/vi-editor-usage/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Script-Header-Options.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-in-Scripts.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-File-Location.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Info-in-Script-Header.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Auto-Adds-Header-to-Script.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Plugin-Help-in-Vi-Editor.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Comments-to-Scripts.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Insert-New-Function-in-Script.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Create-Header-Function-in-Script.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Insert-Statement-to-Script.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-echo-Statement-to-Script.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/02/make-script-executable.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/02/list-of-code-snippets.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Code-Snippet-to-Script.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Built-in-Command-Help.png
[18]:https://github.com/WolfgangMehner/bash-support
[19]:http://www.vim.org/scripts/script.php?script_id=365
