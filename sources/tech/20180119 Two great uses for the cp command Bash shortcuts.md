Translating by cncuckoo

Two great uses for the cp command: Bash shortcuts
============================================================

### Here's how to streamline the backup and synchronize functions of the cp command.

![Two great uses for the cp command: Bash shortcuts ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC)

>Image by : [Internet Archive Book Images][6]. Modified by Opensource.com. CC BY-SA 4.0

Last July, I wrote about [two great uses for the cp command][7]: making a backup of a file, and synchronizing a secondary copy of a folder.

Having discovered these great utilities, I find that they are more verbose than necessary, so I created shortcuts to them in my Bash shell startup script. I thought I’d share these shortcuts in case they are useful to others or could offer inspiration to Bash users who haven’t quite taken on aliases or shell functions.

### Updating a second copy of a folder – Bash alias

The general pattern for updating a second copy of a folder with cp is:

```
cp -r -u -v SOURCE-FOLDER DESTINATION-DIRECTORY
```

I can easily remember the -r option because I use it often when copying folders around. I can probably, with some more effort, remember -v, and with even more effort, -u (is it “update” or “synchronize” or…).

Or I can just use the [alias capability in Bash][8] to convert the cp command and options to something more memorable, like this:

```
alias sync='cp -r -u -v'
```

```
sync Pictures /media/me/4388-E5FE
```

Not sure if you already have a sync alias defined? You can list all your currently defined aliases by typing the word alias at the command prompt in your terminal window.

Like this so much you just want to start using it right away? Open a terminal window and type:

```
echo "alias sync='cp -r -u -v'" >> ~/.bash_aliases
```

```
me@mymachine~$ alias

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias egrep='egrep --color=auto'

alias fgrep='fgrep --color=auto'

alias grep='grep --color=auto'

alias gvm='sdk'

alias l='ls -CF'

alias la='ls -A'

alias ll='ls -alF'

alias ls='ls --color=auto'

alias sync='cp -r -u -v'

me@mymachine:~$
```

### Making versioned backups – Bash function

The general pattern for making a backup of a file with cp is:

```
cp --force --backup=numbered WORKING-FILE BACKED-UP-FILE
```

Besides remembering the options to the cp command, we also need to remember to repeat the WORKING-FILE name a second time. But why repeat ourselves when [a Bash function][9] can take care of that overhead for us, like this:

Again, you can save this to your .bash_aliases file in your home directory.

```
function backup {

    if [ $# -ne 1 ]; then

        echo "Usage: $0 filename"

    elif [ -f $1 ] ; then

        echo "cp --force --backup=numbered $1 $1"

        cp --force --backup=numbered $1 $1

    else

        echo "$0: $1 is not a file"

    fi

}
```

The first if statement checks to make sure that only one argument is provided to the function, otherwise printing the correct usage with the echo command.

The elif statement checks to make sure the argument provided is a file, and if so, it (verbosely) uses the second echo to print the cp command to be used and then executes it.

If the single argument is not a file, the third echo prints an error message to that effect.

In my home directory, if I execute the backup command so defined on the file checkCounts.sql, I see that backup creates a file called checkCounts.sql.~1~. If I execute it once more, I see a new file checkCounts.sql.~2~.

Success! As planned, I can go on editing checkCounts.sql, but if I take a snapshot of it every so often with backup, I can return to the most recent snapshot should I run into trouble.

At some point, it’s better to start using git for version control, but backup as defined above is a nice cheap tool when you need to create snapshots but you’re not ready for git.

### Conclusion

In my last article, I promised you that repetitive tasks can often be easily streamlined through the use of shell scripts, shell functions, and shell aliases.

Here I’ve shown concrete examples of the use of shell aliases and shell functions to streamline the synchronize and backup functionality of the cp command. If you’d like to learn more about this, check out the two articles cited above: [How to save keystrokes at the command line with alias][10] and [Shell scripting: An introduction to the shift method and custom functions][11], written by my colleagues Greg and Seth, respectively.


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/clh_portrait2.jpg?itok=V1V-YAtY)][13] Chris Hermansen 


 Engaged in computing since graduating from the University of British Columbia in 1978, I have been a full-time Linux user since 2005 and a full-time Solaris, SunOS and UNIX System V user before that. On the technical side of things, I have spent a great deal of my career doing data analysis; especially spatial data analysis. I have a substantial amount of programming experience in relation to data analysis, using awk, Python, PostgreSQL, PostGIS and lately Groovy. I have also built a few... [more about Chris Hermansen][14]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/two-great-uses-cp-command-update

作者：[Chris Hermansen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:https://opensource.com/users/clhermansen
[2]:https://opensource.com/users/clhermansen
[3]:https://opensource.com/user/37806/feed
[4]:https://opensource.com/article/18/1/two-great-uses-cp-command-update?rate=J_7R7wSPbukG9y8jrqZt3EqANfYtVAwZzzpopYiH3C8
[5]:https://opensource.com/article/18/1/two-great-uses-cp-command-update#comments
[6]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[7]:https://opensource.com/article/17/7/two-great-uses-cp-command
[8]:https://opensource.com/article/17/5/introduction-alias-command-line-tool
[9]:https://opensource.com/article/17/1/shell-scripting-shift-method-custom-functions
[10]:https://opensource.com/article/17/5/introduction-alias-command-line-tool
[11]:https://opensource.com/article/17/1/shell-scripting-shift-method-custom-functions
[12]:https://opensource.com/tags/linux
[13]:https://opensource.com/users/clhermansen
[14]:https://opensource.com/users/clhermansen
