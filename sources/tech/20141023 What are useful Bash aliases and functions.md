luoyutiantang
What are useful Bash aliases and functions
================================================================================
As a command line adventurer, you probably found yourself repeating the same lengthy commands over and over. If you always ssh into the same machine, if you always chain the same commands together, or if you constantly run a program with the same flags, you might want to save the precious seconds of your life that you spend repeating the same actions over and over.

The solution to achieve that is to use an alias. As you may know, an alias is a way to tell your shell to remember a particular command and give it a new name: an alias. However, an alias is quickly limited as it is just a shortcut for a shell command, without the ability to pass or control the arguments. So to complement, bash also allows you create your own functions, which can be more lengthy and complex, and also accepts any number of arguments.

Naturally, like with soup, when you have a good recipe you share it. So here is a list with some of the most useful bash aliases and functions. Note that "most useful" is loosely defined, and of course the usefulness of an alias is dependent on your everyday usage of the shell.

Before you start experimenting with aliases, here is a handy tip: if you give an alias the same name as a regular command, you can choose to launch the original command and ignore the alias with the trick:

    \command 

For example, the first alias below replaces the ls command. If you wish to use the regular ls command and not the alias, call it via:

    \ls 

### Productivity ###

So these aliases are really simple and really short, but they are mostly based on the idea that if you save yourself a fraction of a second every time, it might end up accumulating years at the end. Or maybe not. 

    alias ls="ls --color=auto"

Simple but vital. Make the ls command output in color.

    alias ll = "ls --color -al"

Shortcut to display in color all the files from a directory in a list format.

    alias grep='grep --color=auto'

Similarly, put some color in the grep output.

    mcd() { mkdir -p "$1"; cd "$1";} 

One of my favorite. Make a directory and cd into it in one command: mcd [name].

    cls() { cd "$1"; ls;}

Similar to the previous function, cd into a directory and list its content: cls [name].

    backup() { cp "$1"{,.bak};}

Simple way to make a backup of a file: backup [file] will create [file].bak in the same directory.

    md5check() { md5sum "$1" | grep "$2";}

Because I hate comparing the md5sum of a file by hand, this function computes it and compares it using grep: md5check [file] [key].

![](https://farm6.staticflickr.com/5616/15412389280_8be57841ae_o.jpg)

    alias makescript="fc -rnl | head -1 >" 

Easily make a script out of the last command you ran: makescript [script.sh]

    alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 

Just to generate a strong password instantly.

![](https://farm4.staticflickr.com/3955/15574321206_dd365f0f0e.jpg)

    alias c="clear"

Cannot do simpler to clean your terminal screen.

    alias histg="history | grep"

To quickly search through your command history: histg [keyword]

    alias ..='cd ..'

No need to write cd to go up a directory.

    alias ...='cd ../..'

Similarly, go up two directories.

    extract() { 
        if [ -f $1 ] ; then 
          case $1 in 
            *.tar.bz2)   tar xjf $1     ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1     ;; 
            *.rar)       unrar e $1     ;; 
            *.gz)        gunzip $1      ;; 
            *.tar)       tar xf $1      ;; 
            *.tbz2)      tar xjf $1     ;; 
            *.tgz)       tar xzf $1     ;; 
            *.zip)       unzip $1       ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1        ;; 
            *)     echo "'$1' cannot be extracted via extract()" ;; 
             esac 
         else 
             echo "'$1' is not a valid file" 
         fi 
    }

Longest but also the most useful. Extract any kind of archive: extract [archive file]

### System Info ###

Want to know everything about your system as quickly as possible?

    alias cmount="mount | column -t"

Format the output of mount into columns.

![](https://farm6.staticflickr.com/5603/15598830622_587b77a363_z.jpg)

    alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 

Display the directory structure recursively in a tree format.

    sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

"Sort by size" to display in list the files in the current directory, sorted by their size on disk.

    alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 

Intercept the stdout and stderr of a process: intercept [some PID]. Note that you will need strace installed.

    alias meminfo='free -m -l -t'

See how much memory you have left.

![](https://farm4.staticflickr.com/3955/15411891448_0b9d6450bd_z.jpg)

    alias ps? = "ps aux | grep"

Easily find the PID of any process: ps? [name]

    alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

Displays the current sound volume.

![](https://farm4.staticflickr.com/3939/15597995445_99ea7ffcd5_o.jpg)

### Networking ###

For all the commands that involve the Internet or your local network, there are fancy aliases for them.

    alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"

Download entirely a website: websiteget [URL]

    alias listen="lsof -P -i -n" 

Show which applications are connecting to the network.

![](https://farm4.staticflickr.com/3943/15598830552_c7e5eaaa0d_z.jpg)

    alias port='netstat -tulanp'

Show the active ports

    gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}

Rough function to display the number of unread emails in your gmail: gmail [user name]

    alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"

Get your public IP address and host.

    getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';} 

Returns your current location based on your IP address.

### Useless ###

So what if some aliases are not all that productive? They can still be fun.

    kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}

To draw the kernel module dependency graph. Requires image viewer.

    alias busy="cat /dev/urandom | hexdump -C | grep "ca fe"" 

Make you look all busy and fancy in the eyes of non-technical people.

![](https://farm6.staticflickr.com/5599/15574321326_ab3fbc1ef9_z.jpg)

To conclude, a good chunk of these aliases and functions come from my personal .bashrc, and the awesome websites [alias.sh][1] and [commandlinefu.com][2] which I already presented in my post on the [best online tools for Linux][3]. So definitely go check them out, make your own recipes, and if you are so inclined, share your wisdom in the comments. 

As a bonus, here is the plain text version of all the aliases and functions I mentioned, ready to be copy pasted in your bashrc.

    #Productivity
    alias ls="ls --color=auto"
    alias ll="ls --color -al"
    alias grep='grep --color=auto'
    mcd() { mkdir -p "$1"; cd "$1";}
    cls() { cd "$1"; ls;}
    backup() { cp "$1"{,.bak};}
    md5check() { md5sum "$1" | grep "$2";}
    alias makescript="fc -rnl | head -1 >"
    alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
    alias c="clear"
    alias histg="history | grep"
    alias ..='cd ..'
    alias ...='cd ../..'
    extract() {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
      
    #System info
    alias cmount="mount | column -t"
    alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
    sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
    alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
    alias meminfo='free -m -l -t'
    alias ps?="ps aux | grep"
    alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
      
    #Network
    alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
    alias listen="lsof -P -i -n"
    alias port='netstat -tulanp'
    gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
    alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"
    getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}
      
    #Funny
    kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
    alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""

--------------------------------------------------------------------------------

via: http://xmodulo.com/useful-bash-aliases-functions.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://alias.sh/
[2]:http://www.commandlinefu.com/commands/browse
[3]:http://xmodulo.com/useful-online-tools-linux.html
