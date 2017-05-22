How to Password Protect a Vim File in Linux
============================================================
ch-cn translating

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][16] | [4 Free Shell Scripting eBooks][17]

[Vim][5] is a popular, feature-rich and highly-extensible [text editor for Linux][6], and one of its special features is support for encrypting text files using various crypto methods with a password.

In this article, we will explain to you one of the simple Vim usage tricks; password protecting a file using Vim in Linux. We will show you how to secure a file at the time of its creation as well as after opening it for modification.

**Suggested Read:** [10 Reasons Why You Should Use Vim Editor in Linux][7]

To install the full version of Vim, simply run this command:

```
$ sudo apt install vim          #Debian/Ubuntu systems
$ sudo yum install vim          #RHEL/CentOS systems 
$ sudo dnf install vim		#Fedora 22+
```

Read Also: [Vim 8.0 Is Released After 10 Years – Install on Linux][8]

### How to Password Protect a Vim File in Linux

Vim has a `-x` option which enables you to use encryption when creating files. Once you run the [vim command][9]below, you’ll be prompted for a crypt key:

```
$ vim -x file.txt
Warning: Using a weak encryption method; see :help 'cm'
Enter encryption key: *******
Enter same key again: *******
```

If the crypto key matches after entering it for the second time, you can proceed to modify the file.

 [![Vim File Password Protected](https://www.tecmint.com/wp-content/uploads/2017/05/Vim-File-Password-Protected-File.png)][10] 

Vim File Password Protected

Once your done, press `[Esc]` and `:wq` to save and close the file. The next time you want to open it for editing, you’ll have to enter the crypto key like this:

```
$ vim file.txt
Need encryption key for "file.txt"
Warning: Using a weak encryption method; see :help 'cm'
Enter encryption key: *******
```

In case you enter a wrong password (or no key), you’ll see some junk characters.

 [![Vim Content Encrypted](https://www.tecmint.com/wp-content/uploads/2017/05/Vim-Content-Encrypted.png)][11] 

Vim Content Encrypted

#### Setting a Strong Encryption Method in Vim

Note: There is a warning indicating that a weak encryption method has been used to protect the file. Next, we’ll see how to set a strong encryption method in Vim.

 [![Weak Encryption on Vim File](https://www.tecmint.com/wp-content/uploads/2017/05/Weak-Encryption-on-Vim-File.png)][12] 

Weak Encryption on Vim File

To check the set of cryptmethod(cm), type (scroll down to view all available methods):

```
:help 'cm'
```

##### Sample Output

```
                                                *'cryptmethod'* *'cm'*
'cryptmethod' 'cm'      string  (default "zip")
global or local to buffer |global-local|
{not in Vi}
Method used for encryption when the buffer is written to a file:
*pkzip*
zip          PkZip compatible method.  A weak kind of encryption.
Backwards compatible with Vim 7.2 and older.
*blowfish*
blowfish     Blowfish method.  Medium strong encryption but it has
an implementation flaw.  Requires Vim 7.3 or later,
files can NOT be read by Vim 7.2 and older.  This adds
a "seed" to the file, every time you write the file
options.txt [Help][RO]                                                                  
```

You can set a new cryptomethod on a Vim file as shown below (we’ll use blowfish2 in this example):

```
:setlocal cm=blowfish2
```

Then press `[Enter]` and `:wq` to save the file.

 [![Set Strong Encryption on Vim File](https://www.tecmint.com/wp-content/uploads/2017/05/Set-Strong-Encryption-on-Vim-File.png)][13] 

Set Strong Encryption on Vim File

Now you should not see the warning message when you open the file again as shown below.

```
$ vim file.txt
Need encryption key for "file.txt"
Enter encryption key: *******
```

You can also set a password after opening a Vim text file, use the command`:X` and set a crypto pass like shown above.

Check out some of our useful articles on Vim editor.

1.  [Learn Useful Vim Editor Trips and Tricks in Linux][1]

2.  [8 Useful Vim Editor Tricks for Every Linux User][2]

3.  [spf13-vim – The Ultimate Distribution for Vim Editor][3]

4.  [How to Use Vim Editor as Bash IDE in Linux][4]

That’s all! In this article, we explained how to password protect a file via the [Vim text editor in Linux][14].

Always remember to appropriately secure text files that could contain secret info such as usernames and passwords, financial account info and so on, using strong encryption and a password. Use the feedback section below to share any thoughts with us.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: https://www.tecmint.com/password-protect-vim-file-in-linux/

作者：[Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/learn-vi-and-vim-editor-tips-and-tricks-in-linux/
[2]:https://www.tecmint.com/how-to-use-vi-and-vim-editor-in-linux/
[3]:https://www.tecmint.com/spf13-vim-offers-vim-plugins-vim-editor/
[4]:https://www.tecmint.com/use-vim-as-bash-ide-using-bash-support-in-linux/
[5]:https://www.tecmint.com/vi-editor-usage/
[6]:https://www.tecmint.com/best-open-source-linux-text-editors/
[7]:https://www.tecmint.com/reasons-to-learn-vi-vim-editor-in-linux/
[8]:https://www.tecmint.com/vim-8-0-install-in-ubuntu-linux-systems/
[9]:https://www.tecmint.com/linux-command-line-editors/
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Vim-File-Password-Protected-File.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Vim-Content-Encrypted.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/Weak-Encryption-on-Vim-File.png
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Set-Strong-Encryption-on-Vim-File.png
[14]:https://www.tecmint.com/vi-editor-usage/
[15]:https://www.tecmint.com/author/aaronkili/
[16]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:https://www.tecmint.com/free-linux-shell-scripting-books/
