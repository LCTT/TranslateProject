Bash 脚本中如何使用 here 文档将数据写入文件
======

<ruby>here 文档<rt>here document</rt></ruby> （LCTT 译注：here 文档又称作 heredoc ）不是什么特殊的东西，只是一种 I/O 重定向方式，它告诉 bash shell 从当前源读取输入，直到读取到只有分隔符的行。

![redirect output of here document to a text file][1]

这对于向 ftp、cat、echo、ssh 和许多其他有用的 Linux/Unix 命令提供指令很有用。 此功能适用于 bash 也适用于 Bourne、Korn、POSIX 这三种 shell。

### here 文档语法

语法是：

```
command <<EOF
cmd1
cmd2 arg1
EOF
```

或者允许 shell 脚本中的 here 文档使用 `EOF<<-` 以自然的方式缩进：

```
command <<-EOF
  msg1
  msg2 
  $var on line 
EOF
```

或者

```
command <<'EOF'
 cmd1
 cmd2 arg1
 $var won't expand as parameter substitution turned off
 by single quoting
EOF
```

或者 **重定向并将其覆盖** 到名为 `my_output_file.txt` 的文件中：

```
command <<EOF > my_output_file.txt
 mesg1
 msg2
 msg3
 $var on $foo
EOF
```

或**重定向并将其追加**到名为 `my_output_file.txt` 的文件中：

```
command <<EOF >> my_output_file.txt
 mesg1
 msg2
 msg3
 $var on $foo
EOF
```

### 示例

以下脚本将所需内容写入名为 `/tmp/output.txt` 的文件中：

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

你可以使用[cat命令][3]查看/tmp/output.txt文件：

```
$ cat /tmp/output.txt
```

示例输出：

```
 Status of backup as on Thu Nov 16 17:00:21 IST 2017
 Backing up files /home/vivek and /etc/
```

### 禁用路径名/参数/变量扩展、命令替换、算术扩展

像 `$HOME` 这类变量和像 `$(date)` 这类命令在脚本中会被解释为替换。 要禁用它，请使用带有 `'EOF'` 这样带有单引号的形式，如下所示：

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

你可以使用 [cat 命令][3]查看 `/tmp/output.txt` 文件：

```
$ cat /tmp/output.txt
```

示例输出：

```
 Status of backup as on $(date)
 Backing up files $HOME and /etc/

```

### 关于 tee 命令的使用

语法是：

```
tee /tmp/filename <<EOF >/dev/null
line 1
line 2
line 3
$(cmd)
$var on $foo
EOF
```

或者通过在单引号中引用 `EOF` 来禁用变量替换和命令替换：

```
tee /tmp/filename <<'EOF' >/dev/null
line 1
line 2
line 3
$(cmd)
$var on $foo
EOF
```

这是我更新的脚本：

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

### 关于内存 here 文档的使用

这是我更新的脚本：

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
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.cyberciti.biz
[1]: https://www.cyberciti.biz/media/new/faq/2017/11/redirect-output-of-here-document-to-a-text-file.jpg
[2]: https://bash.cyberciti.biz/guide/Here_documents
[3]: https//www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/
