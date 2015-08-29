Translating by Xuanwo

Part 2 - LFCS: How to Install and Use vi/vim as a Full Text Editor
================================================================================
A couple of months ago, the Linux Foundation launched the LFCS (Linux Foundation Certified Sysadmin) certification in order to help individuals from all over the world to verify they are capable of doing basic to intermediate system administration tasks on Linux systems: system support, first-hand troubleshooting and maintenance, plus intelligent decision-making to know when it’s time to raise issues to upper support teams.

![Learning VI Editor in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/LFCS-Part-2.png)

Learning VI Editor in Linux

Please take a look at the below video that explains The Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This post is Part 2 of a 10-tutorial series, here in this part, we will cover the basic file editing operations and understanding modes in vi/m editor, that are required for the LFCS certification exam.

### Perform Basic File Editing Operations Using vi/m ###

Vi was the first full-screen text editor written for Unix. Although it was intended to be small and simple, it can be a bit challenging for people used exclusively to GUI text editors, such as NotePad++, or gedit, to name a few examples.

To use Vi, we must first understand the 3 modes in which this powerful program operates, in order to begin learning later about the its powerful text-editing procedures.

Please note that most modern Linux distributions ship with a variant of vi known as vim (“Vi improved”), which supports more features than the original vi does. For that reason, throughout this tutorial we will use vi and vim interchangeably.

If your distribution does not have vim installed, you can install it as follows.

- Ubuntu and derivatives: aptitude update && aptitude install vim
- Red Hat-based distributions: yum update && yum install vim
- openSUSE: zypper update && zypper install vim

### Why should I want to learn vi? ###

There are at least 2 good reasons to learn vi.

1. vi is always available (no matter what distribution you’re using) since it is required by POSIX.

2. vi does not consume a considerable amount of system resources and allows us to perform any imaginable tasks without lifting our fingers from the keyboard.

In addition, vi has a very extensive built-in manual, which can be launched using the :help command right after the program is started. This built-in manual contains more information than vi/m’s man page.

![vi Man Pages](http://www.tecmint.com/wp-content/uploads/2014/10/vi-man-pages.png)

vi Man Pages

#### Launching vi ####

To launch vi, type vi in your command prompt.

![Start vi Editor](http://www.tecmint.com/wp-content/uploads/2014/10/start-vi-editor.png)

Start vi Editor

Then press i to enter Insert mode, and you can start typing. Another way to launch vi/m is.

    # vi filename

Which will open a new buffer (more on buffers later) named filename, which you can later save to disk.

#### Understanding Vi modes ####

1. In command mode, vi allows the user to navigate around the file and enter vi commands, which are brief, case-sensitive combinations of one or more letters. Almost all of them can be prefixed with a number to repeat the command that number of times.

For example, yy (or Y) copies the entire current line, whereas 3yy (or 3Y) copies the entire current line along with the two next lines (3 lines in total). We can always enter command mode (regardless of the mode we’re working on) by pressing the Esc key. The fact that in command mode the keyboard keys are interpreted as commands instead of text tends to be confusing to beginners.

2. In ex mode, we can manipulate files (including saving a current file and running outside programs). To enter this mode, we must type a colon (:) from command mode, directly followed by the name of the ex-mode command that needs to be used. After that, vi returns automatically to command mode.

3. In insert mode (the letter i is commonly used to enter this mode), we simply enter text. Most keystrokes result in text appearing on the screen (one important exception is the Esc key, which exits insert mode and returns to command mode).

![vi Insert Mode](http://www.tecmint.com/wp-content/uploads/2014/10/vi-insert-mode.png)

vi Insert Mode

#### Vi Commands ####

The following table shows a list of commonly used vi commands. File edition commands can be enforced by appending the exclamation sign to the command (for example, <b.:q! enforces quitting without saving).

注：表格
<table cellspacing="0" border="0">
  <colgroup width="290">
  </colgroup>
  <colgroup width="781">
  </colgroup>
  <tbody>
    <tr>
      <td bgcolor="#999999" height="19" align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;Key command</span></b></td>
      <td bgcolor="#999999" align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;Description</span></b></td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;h or left arrow</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go one character to the left</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;j or down arrow</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go down one line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;k or up arrow</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go up one line</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;l (lowercase L) or right arrow</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go one character to the right</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;H</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the top of the screen</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;L</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the bottom of the screen</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;G</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the end of the file</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;w</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Move one word to the right</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;b</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Move one word to the left</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;0 (zero)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the beginning of the current line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;^</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the first nonblank character on the current line</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;$</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go to the end of the current line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;Ctrl-B</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go back one screen</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;Ctrl-F</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Go forward one screen</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;i</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Insert at the current cursor position</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;I (uppercase i)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Insert at the beginning of the current line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;J (uppercase j)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Join current line with the next one (move next line up)</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;a</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Append after the current cursor position</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;o (lowercase O)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Creates a blank line after the current line</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;O (uppercase o)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Creates a blank line before the current line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;r</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Replace the character at the current cursor position</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;R</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Overwrite at the current cursor position</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;x</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Delete the character at the current cursor position</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;X</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Delete the character immediately before (to the left) of the current cursor position</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;dd</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Cut (for later pasting) the entire current line</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;D</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Cut from the current cursor position to the end of the line (this command is equivalent to d$)</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;yX</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Give a movement command X, copy (yank) the appropriate number of characters, words, or lines from the current cursor position</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;yy or Y</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Yank (copy) the entire current line</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;p</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Paste after (next line) the current cursor position</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;P</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Paste before (previous line) the current cursor position</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;. (period)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Repeat the last command</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;u</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Undo the last command</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;U</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Undo the last command in the last line. This will work as long as the cursor is still on the line.</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;n</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Find the next match in a search</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;N</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Find the previous match in a search</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:n</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Next file; when multiple files are specified for editing, this commands loads the next file.</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:e file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Load file in place of the current file.</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:r file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Insert the contents of file after (next line) the current cursor position</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:q</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Quit without saving changes.</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:w file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Write the current buffer to file. To append to an existing file, use :w &gt;&gt; file.</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:wq</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Write the contents of the current file and quit. Equivalent to x! and ZZ</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:r! command</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;Execute command and insert output after (next line) the current cursor position.</td>
    </tr>
  </tbody>
</table>

#### Vi Options ####

The following options can come in handy while running vim (we need to add them in our ~/.vimrc file).

    # echo set number >> ~/.vimrc
    # echo syntax on >> ~/.vimrc
    # echo set tabstop=4 >> ~/.vimrc
    # echo set autoindent >> ~/.vimrc

![vi Editor Options](http://www.tecmint.com/wp-content/uploads/2014/10/vi-options.png)

vi Editor Options

- set number shows line numbers when vi opens an existing or a new file.
- syntax on turns on syntax highlighting (for multiple file extensions) in order to make code and config files more readable.
- set tabstop=4 sets the tab size to 4 spaces (default value is 8).
- set autoindent carries over previous indent to the next line.

#### Search and replace ####

vi has the ability to move the cursor to a certain location (on a single line or over an entire file) based on searches. It can also perform text replacements with or without confirmation from the user.

a). Searching within a line: the f command searches a line and moves the cursor to the next occurrence of a specified character in the current line.

For example, the command fh would move the cursor to the next instance of the letter h within the current line. Note that neither the letter f nor the character you’re searching for will appear anywhere on your screen, but the character will be highlighted after you press Enter.

For example, this is what I get after pressing f4 in command mode.

![Search String in Vi](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-string.png)

Search String in Vi

b). Searching an entire file: use the / command, followed by the word or phrase to be searched for. A search may be repeated using the previous search string with the n command, or the next one (using the N command). This is the result of typing /Jane in command mode.

![Vi Search String in File](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-line.png)

Vi Search String in File

c). vi uses a command (similar to sed’s) to perform substitution operations over a range of lines or an entire file. To change the word “old” to “young” for the entire file, we must enter the following command.

    :%s/old/young/g

**Notice**: The colon at the beginning of the command.

![Vi Search and Replace](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-and-replace.png)

Vi Search and Replace

The colon (:) starts the ex command, s in this case (for substitution), % is a shortcut meaning from the first line to the last line (the range can also be specified as n,m which means “from line n to line m”), old is the search pattern, while young is the replacement text, and g indicates that the substitution should be performed on every occurrence of the search string in the file.

Alternatively, a c can be added to the end of the command to ask for confirmation before performing any substitution.

    :%s/old/young/gc

Before replacing the original text with the new one, vi/m will present us with the following message.

![Replace String in Vi](http://www.tecmint.com/wp-content/uploads/2014/10/vi-replace-old-with-young.png)

Replace String in Vi

- y: perform the substitution (yes)
- n: skip this occurrence and go to the next one (no)
- a: perform the substitution in this and all subsequent instances of the pattern.
- q or Esc: quit substituting.
- l (lowercase L): perform this substitution and quit (last).
- Ctrl-e, Ctrl-y: Scroll down and up, respectively, to view the context of the proposed substitution.

#### Editing Multiple Files at a Time ####

Let’s type vim file1 file2 file3 in our command prompt.

    # vim file1 file2 file3

First, vim will open file1. To switch to the next file (file2), we need to use the :n command. When we want to return to the previous file, :N will do the job.

In order to switch from file1 to file3.

a). The :buffers command will show a list of the file currently being edited.

    :buffers

![Edit Multiple Files](http://www.tecmint.com/wp-content/uploads/2014/10/vi-edit-multiple-files.png)

Edit Multiple Files

b). The command :buffer 3 (without the s at the end) will open file3 for editing.

In the image above, a pound sign (#) indicates that the file is currently open but in the background, while %a marks the file that is currently being edited. On the other hand, a blank space after the file number (3 in the above example) indicates that the file has not yet been opened.

#### Temporary vi buffers ####

To copy a couple of consecutive lines (let’s say 4, for example) into a temporary buffer named a (not associated with a file) and place those lines in another part of the file later in the current vi section, we need to…

1. Press the ESC key to be sure we are in vi Command mode.

2. Place the cursor on the first line of the text we wish to copy.

3. Type “a4yy to copy the current line, along with the 3 subsequent lines, into a buffer named a. We can continue editing our file – we do not need to insert the copied lines immediately.

4. When we reach the location for the copied lines, use “a before the p or P commands to insert the lines copied into the buffer named a:

- Type “ap to insert the lines copied into buffer a after the current line on which the cursor is resting.
- Type “aP to insert the lines copied into buffer a before the current line.

If we wish, we can repeat the above steps to insert the contents of buffer a in multiple places in our file. A temporary buffer, as the one in this section, is disposed when the current window is closed.

### Summary ###

As we have seen, vi/m is a powerful and versatile text editor for the CLI. Feel free to share your own tricks and comments below.

#### Reference Links ####

- [About the LFCS][1]
- [Why get a Linux Foundation Certification?][2]
- [Register for the LFCS exam][3]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/vi-editor-usage/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://training.linuxfoundation.org/certification/LFCS
[2]:https://training.linuxfoundation.org/certification/why-certify-with-us
[3]:https://identity.linuxfoundation.org/user?destination=pid/1