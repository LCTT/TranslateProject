translating by ljgibbslf
How to use a here documents to write data to a file in bash script
======

A here document is nothing but I/O redirection that tells the bash shell to read input from the current source until a line containing only delimiter is seen.
[![redirect output of here document to a text file][1]][1]
This is useful for providing commands to ftp, cat, echo, ssh and many other useful Linux/Unix commands. This feature should work with bash or Bourne/Korn/POSIX shell too.

## heredoc syntax

How do I use a heredoc redirection feature (here documents) to write data to a file in my bash shell scripts? [A here document][2] is nothing but I/O redirection that tells the bash shell to read input from the current source until a line containing only delimiter is seen.This is useful for providing commands to ftp, cat, echo, ssh and many other useful Linux/Unix commands. This feature should work with bash or Bourne/Korn/POSIX shell too.

The syntax is:
```
command <<EOF
cmd1
cmd2 arg1
EOF
```

OR allow here-documents within shell scripts to be indented in a natural fashion using **EOF <**
```
command <<-EOF
 msg1
 msg2
 $var on line
EOF
```

OR
```
command <<'EOF'
 cmd1
 cmd2 arg1
 $var won't expand as parameter substitution turned off
 by single quoting
EOF
```

OR **redirect and overwrite it** to a file named my_output_file.txt:
```
command << EOF > my_output_file.txt
 mesg1
 msg2
 msg3
 $var on $foo
EOF
```

OR **redirect and append it** to a file named my_output_file.txt:
```
command << EOF >> my_output_file.txt
 mesg1
 msg2
 msg3
 $var on $foo
EOF
```

## Examples

The following script will write the needed contents to a file named /tmp/output.txt:
```
#!/bin/bash
OUT=/tmp/output.txt
 
echo "Starting my script..."
echo "Doing something..."
 
cat <<EOF >$OUT
  Status of backup as on $(date)
  Backing up files $HOME and /etc/
EOF
 
echo "Starting backup using rsync..."
```


You can view /tmp/output.txt with the [cat command][3]:
`$ cat /tmp/output.txt`
Sample outputs:
```
 Status of backup as on Thu Nov 16 17:00:21 IST 2017
 Backing up files /home/vivek and /etc/

```

### Disabling pathname/parameter/variable expansion, command substitution, arithmetic expansion

Variable such as $HOME and command such as $(date) were interpreted substitution in script. To disable it use single quotes with 'EOF' as follows:
```
#!/bin/bash
OUT=/tmp/output.txt
 
echo "Starting my script..."
echo "Doing something..."
# No parameter and variable expansion, command substitution, arithmetic expansion, or pathname expansion is performed on word.  
# If any part of word is quoted, the delimiter  is  the  result  of  quote removal  on word, and the lines in the here-document 
# are not expanded. So EOF is quoted as follows
cat <<'EOF' >$OUT
  Status of backup as on $(date)
  Backing up files $HOME and /etc/
EOF
 
echo "Starting backup using rsync..."
```

#!/bin/bash OUT=/tmp/output.txtecho "Starting my script..." echo "Doing something..." # No parameter and variable expansion, command substitution, arithmetic expansion, or pathname expansion is performed on word. # If any part of word is quoted, the delimiter is the result of quote removal on word, and the lines in the here-document # are not expanded. So EOF is quoted as follows cat <<'EOF' >$OUT Status of backup as on $(date) Backing up files $HOME and /etc/ EOFecho "Starting backup using rsync..."

You can view /tmp/output.txt with the [cat command][3]:
`$ cat /tmp/output.txt`
Sample outputs:
```
 Status of backup as on $(date)
 Backing up files $HOME and /etc/

```

## A note about using tee command

The syntax is:
```
tee /tmp/filename <<EOF >/dev/null
line 1
line 2
line 3
$(cmd)
$var on $foo
EOF
```

tee /tmp/filename <<EOF >/dev/null line 1 line 2 line 3 $(cmd) $var on $foo EOF

Or disable variable substitution/command substitution by quoting EOF in a single quote:
```
tee /tmp/filename <<'EOF' >/dev/null
line 1
line 2
line 3
$(cmd)
$var on $foo
EOF
```

tee /tmp/filename <<'EOF' >/dev/null line 1 line 2 line 3 $(cmd) $var on $foo EOF

Here is my updated script:
```
#!/bin/bash
OUT=/tmp/output.txt
 
echo "Starting my script..."
echo "Doing something..."
 
tee $OUT <<EOF >/dev/null
  Status of backup as on $(date)
  Backing up files $HOME and /etc/
EOF
 
echo "Starting backup using rsync..."
```

#!/bin/bash OUT=/tmp/output.txtecho "Starting my script..." echo "Doing something..."tee $OUT <<EOF >/dev/null Status of backup as on $(date) Backing up files $HOME and /etc/ EOFecho "Starting backup using rsync..."

## A note about using in-memory here-docs

Here is my updated script:
```
#!/bin/bash
OUT=/tmp/output.txt
 
## in memory here docs 
## thanks https://twitter.com/freebsdfrau
exec 9<<EOF
  Status of backup as on $(date)
  Backing up files $HOME and /etc/
EOF
 
## continue
echo "Starting my script..."
echo "Doing something..."
 
## do it
cat <&9 >$OUT
 
echo "Starting backup using rsync..."
```



--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/using-heredoc-rediection-in-bash-shell-script-to-write-to-file/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/11/redirect-output-of-here-document-to-a-text-file.jpg
[2]:https://bash.cyberciti.biz/guide/Here_documents
[3]:https//www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
