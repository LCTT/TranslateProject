A Simple Command-line Snippet Manager
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/pet-6-720x340.png)

We can't remember all the commands, right? Yes. Except the frequently used commands, it is nearly impossible to remember some long commands that we rarely use. That's why we need to some external tools to help us to find the commands when we need them. In the past, we have reviewed two useful utilities named [**" Bashpast"**][1] and [**" Keep"**][2]. Using Bashpast, we can easily bookmark the Linux commands for easier repeated invocation. And, the Keep utility can be used to keep the some important and lengthy commands in your Terminal, so you can use them on demand. Today, we are going to see yet another tool in the series to help you remembering commands. Say hello to **" Pet"**, a simple command-line snippet manager written in **Go** language.

Using Pet, you can;

  * Register/add your important, long and complex command snippets.
  * Search the saved command snippets interactively.
  * Run snippets directly without having to type over and over.
  * Edit the saved command snippets easily.
  * Sync the snippets via Gist.
  * Use variables in snippets.
  * And more yet to come.



#### Installing Pet CLI Snippet Manager

Since it is written in Go language, make sure you have installed Go in your system.

After Go language, grab the latest binaries from [**the releases page**][3].
```
wget https://github.com/knqyf263/pet/releases/download/v0.2.4/pet_0.2.4_linux_amd64.zip
```

For 32 bit:
```
wget https://github.com/knqyf263/pet/releases/download/v0.2.4/pet_0.2.4_linux_386.zip
```

Extract the downloaded archive:
```
unzip pet_0.2.4_linux_amd64.zip
```

32 bit:
```
unzip pet_0.2.4_linux_386.zip
```

Copy the pet binary file to your PATH (i.e **/usr/local/bin** or the like).
```
sudo cp pet /usr/local/bin/
```

Finally, make it executable:
```
sudo chmod +x /usr/local/bin/pet
```

If you're using Arch based systems, then you can install it from AUR using any AUR helper tools.

Using [**Pacaur**][4]:
```
pacaur -S pet-git
```

Using [**Packer**][5]:
```
packer -S pet-git
```

Using [**Yaourt**][6]:
```
yaourt -S pet-git
```

Using [**Yay** :][7]
```
yay -S pet-git
```

Also, you need to install **[fzf][8]** or [**peco**][9] tools to enable interactive search. Refer the official GitHub links to know how to install these tools.

#### Usage

Run 'pet' without any arguments to view the list of available commands and general options.
```
$ pet
pet - Simple command-line snippet manager.

Usage:
 pet [command]

Available Commands:
 configure Edit config file
 edit Edit snippet file
 exec Run the selected commands
 help Help about any command
 list Show all snippets
 new Create a new snippet
 search Search snippets
 sync Sync snippets
 version Print the version number

Flags:
 --config string config file (default is $HOME/.config/pet/config.toml)
 --debug debug mode
 -h, --help help for pet

Use "pet [command] --help" for more information about a command.
```

To view the help section of a specific command, run:
```
$ pet [command] --help
```

**Configure Pet**

It just works fine with default values. However, you can change the default directory to save snippets, choose the selector (fzf or peco) to use, the default text editor to edit snippets, add GIST id details etc.

To configure Pet, run:
```
$ pet configure
```

This command will open the default configuration in the default text editor (for example **vim** in my case). Change/edit the values as per your requirements.
```
[General]
 snippetfile = "/home/sk/.config/pet/snippet.toml"
 editor = "vim"
 column = 40
 selectcmd = "fzf"

[Gist]
 file_name = "pet-snippet.toml"
 access_token = ""
 gist_id = ""
 public = false
~
```

**Creating Snippets**

To create a new snippet, run:
```
$ pet new
```

Add the command and the description and hit ENTER to save it.
```
Command> echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9'
Description> Remove numbers from output.
```

[![][10]][11]

This is a simple command to remove all numbers from the echo command output. You can easily remember it. But, if you rarely use it, you may forgot it completely after few days. Of course we can search the history using "CTRL+r", but "Pet" is much easier. Also, Pet can help you to add any number of entries.

Another cool feature is we can easily add the previous command. To do so, add the following lines in your **.bashrc** or **.zshrc** file.
```
function prev() {
 PREV=$(fc -lrn | head -n 1)
 sh -c "pet new `printf %q "$PREV"`"
}
```

Do the following command to take effect the saved changes.
```
source .bashrc
```

Or,
```
source .zshrc
```

Now, run any command, for example:
```
$ cat Documents/ostechnix.txt | tr '|' '\n' | sort | tr '\n' '|' | sed "s/.$/\\n/g"
```

To add the above command, you don't have to use "pet new" command. just do:
```
$ prev
```

Add the description to the command snippet and hit ENTER to save.

[![][10]][12]

**List snippets**

To view the saved snippets, run:
```
$ pet list
```

[![][10]][13]

**Edit Snippets**

If you want to edit the description or the command of a snippet, run:
```
$ pet edit
```

This will open all saved snippets in your default text editor. You can edit or change the snippets as you wish.
```
[[snippets]]
 description = "Remove numbers from output."
 command = "echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9'"
 output = ""

[[snippets]]
 description = "Alphabetically sort one line of text"
 command = "\t prev"
 output = ""
```

**Use Tags in snippets**

To use tags to a snippet, use **-t** flag like below.
```
$ pet new -t
Command> echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9
Description> Remove numbers from output.
Tag> tr command examples

```

**Execute Snippets**

To execute a saved snippet, run:
```
$ pet exec
```

Choose the snippet you want to run from the list and hit ENTER to run it.

[![][10]][14]

Remember you need to install fzf or peco to use this feature.

**Search Snippets**

If you have plenty of saved snippets, you can easily search them using a string or key word like below.
```
$ pet search
```

Enter the search term or keyword to narrow down the search results.

[![][10]][15]

**Sync Snippets**

First, you need to obtain the access token. Go to this link <https://github.com/settings/tokens/new> and create access token (only need "gist" scope).

Configure Pet using command:
```
$ pet configure
```

Set that token to **access_token** in **[Gist]** field.

After setting, you can upload snippets to Gist like below.
```
$ pet sync -u
Gist ID: 2dfeeeg5f17e1170bf0c5612fb31a869
Upload success

```

You can also download snippets on another PC. To do so, edit configuration file and set **Gist ID** to **gist_id** in **[Gist]**.

Then, download the snippets using command:
```
$ pet sync
Download success

```

For more details, refer the help section:
```
pet -h
```

Or,
```
pet [command] -h
```

And, that's all. Hope this helps. As you can see, Pet usage is fairly simple and easy to use! If you're having hard time remembering lengthy commands, Pet utility can definitely be useful.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pet-simple-command-line-snippet-manager/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/bookmark-linux-commands-easier-repeated-invocation/
[2]:https://www.ostechnix.com/save-commands-terminal-use-demand/
[3]:https://github.com/knqyf263/pet/releases
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://github.com/junegunn/fzf
[9]:https://github.com/peco/peco
[10]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[11]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-1.png ()
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-2.png ()
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-3.png ()
[14]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-4.png ()
[15]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-5.png ()
