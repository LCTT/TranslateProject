RHCSA Series: Editing Text Files with Nano and Vim / Analyzing text with grep and regexps – Part 4
================================================================================
Every system administrator has to deal with text files as part of his daily responsibilities. That includes editing existing files (most likely configuration files), or creating new ones. It has been said that if you want to start a holy war in the Linux world, you can ask sysadmins what their favorite text editor is and why. We are not going to do that in this article, but will present a few tips that will be helpful to use two of the most widely used text editors in RHEL 7: nano (due to its simplicity and easiness of use, specially to new users), and vi/m (due to its several features that convert it into more than a simple editor). I am sure that you can find many more reasons to use one or the other, or perhaps some other editor such as emacs or pico. It’s entirely up to you.

![Learn Nano and vi Editors](http://www.tecmint.com/wp-content/uploads/2015/03/Learn-Nano-and-vi-Editors.png)

RHCSA: Editing Text Files with Nano and Vim – Part 4

### Editing Files with Nano Editor ###

To launch nano, you can either just type nano at the command prompt, optionally followed by a filename (in this case, if the file exists, it will be opened in edition mode). If the file does not exist, or if we omit the filename, nano will also be opened in edition mode but will present a blank screen for us to start typing:

![Nano Editor](http://www.tecmint.com/wp-content/uploads/2015/03/Nano-Editor.png)

Nano Editor

As you can see in the previous image, nano displays at the bottom of the screen several functions that are available via the indicated shortcuts (^, aka caret, indicates the Ctrl key). To name a few of them:

- Ctrl + G: brings up the help menu with a complete list of functions and descriptions:Ctrl + X: exits the current file. If changes have not been saved, they are discarded.
- Ctrl + R: lets you choose a file to insert its contents into the present file by specifying a full path.

![Nano Editor Help Menu](http://www.tecmint.com/wp-content/uploads/2015/03/Nano-Help.png)

Nano Editor Help Menu

- Ctrl + O: saves changes made to a file. It will let you save the file with the same name or a different one. Then press Enter to confirm.

![Nano Editor Save Changes Mode](http://www.tecmint.com/wp-content/uploads/2015/03/Nano-Save-Changes.png)

Nano Editor Save Changes Mode

- Ctrl + X: exits the current file. If changes have not been saved, they are discarded.
- Ctrl + R: lets you choose a file to insert its contents into the present file by specifying a full path.

![Nano: Insert File Content to Parent File](http://www.tecmint.com/wp-content/uploads/2015/03/Insert-File-Content.png)

Nano: Insert File Content to Parent File

will insert the contents of /etc/passwd into the current file.

- Ctrl + K: cuts the current line.
- Ctrl + U: paste.
- Ctrl + C: cancels the current operation and places you at the previous screen.

To easily navigate the opened file, nano provides the following features:

- Ctrl + F and Ctrl + B move the cursor forward or backward, whereas Ctrl + P and Ctrl + N move it up or down one line at a time, respectively, just like the arrow keys.
- Ctrl + space and Alt + space move the cursor forward and backward one word at a time.

Finally,

- Ctrl + _ (underscore) and then entering X,Y will take you precisely to Line X, column Y, if you want to place the cursor at a specific place in the document.

![Navigate to Line Numbers in Nano](http://www.tecmint.com/wp-content/uploads/2015/03/Column-Numbers.png)

Navigate to Line Numbers in Nano

The example above will take you to line 15, column 14 in the current document.

If you can recall your early Linux days, specially if you came from Windows, you will probably agree that starting off with nano is the best way to go for a new user.

### Editing Files with Vim Editor ###

Vim is an improved version of vi, a famous text editor in Linux that is available on all POSIX-compliant *nix systems, such as RHEL 7. If you have the chance and can install vim, go ahead; if not, most (if not all) the tips given in this article should also work.

One of vim’s distinguishing features is the different modes in which it operates:


- Command mode will allow you to browse through the file and enter commands, which are brief and case-sensitive combinations of one or more letters. If you need to repeat one of them a certain number of times, you can prefix it with a number (there are only a few exceptions to this rule). For example, yy (or Y, short for yank) copies the entire current line, whereas 4yy (or 4Y) copies the entire current line along with the next three lines (4 lines in total).
- In ex mode, you can manipulate files (including saving a current file and running outside programs or commands). To enter ex mode, we must type a colon (:) starting from command mode (or in other words, Esc + :), directly followed by the name of the ex-mode command that you want to use.
- In insert mode, which is accessed by typing the letter i, we simply enter text. Most keystrokes result in text appearing on the screen.
- We can always enter command mode (regardless of the mode we’re working on) by pressing the Esc key.

Let’s see how we can perform the same operations that we outlined for nano in the previous section, but now with vim. Don’t forget to hit the Enter key to confirm the vim command!

To access vim’s full manual from the command line, type :help while in command mode and then press Enter:

![vim Edito Help Menu](http://www.tecmint.com/wp-content/uploads/2015/03/vim-Help-Menu.png)

vim Edito Help Menu

The upper section presents an index list of contents, with defined sections dedicated to specific topics about vim. To navigate to a section, place the cursor over it and press Ctrl + ] (closing square bracket). Note that the bottom section displays the current file.

1. To save changes made to a file, run any of the following commands from command mode and it will do the trick:

    :wq!
    :x!
    ZZ (yes, double Z without the colon at the beginning)

2. To exit discarding changes, use :q!. This command will also allow you to exit the help menu described above, and return to the current file in command mode.

3. Cut N number of lines: type Ndd while in command mode.

4. Copy M number of lines: type Myy while in command mode.

5. Paste lines that were previously cutted or copied: press the P key while in command mode.

6. To insert the contents of another file into the current one:

    :r filename

For example, to insert the contents of `/etc/fstab`, do:

![Insert Content of File in vi Editor](http://www.tecmint.com/wp-content/uploads/2015/03/Insert-Content-vi-Editor.png)

Insert Content of File in vi Editor

7. To insert the output of a command into the current document:

    :r! command

For example, to insert the date and time in the line below the current position of the cursor:

![Insert Time an Date in vi Editor](http://www.tecmint.com/wp-content/uploads/2015/03/Insert-Time-and-Date-in-vi-Editor.png)

Insert Time an Date in vi Editor

In another article that I wrote for, ([Part 2 of the LFCS series][1]), I explained in greater detail the keyboard shortcuts and functions available in vim. You may want to refer to that tutorial for further examples on how to use this powerful text editor.

### Analyzing Text with Grep and Regular Expressions ###

By now you have learned how to create and edit files using nano or vim. Say you become a text editor ninja, so to speak – now what? Among other things, you will also need how to search for regular expressions inside text.

A regular expression (also known as “regex” or “regexp“) is a way of identifying a text string or pattern so that a program can compare the pattern against arbitrary text strings. Although the use of regular expressions along with grep would deserve an entire article on its own, let us review the basics here:

**1. The simplest regular expression is an alphanumeric string (i.e., the word “svm”) or two (when two are present, you can use the | (OR) operator):**

    # grep -Ei 'svm|vmx' /proc/cpuinfo

The presence of either of those two strings indicate that your processor supports virtualization:

![Regular Expression Example](http://www.tecmint.com/wp-content/uploads/2015/03/Regular-Expression-Example.png)

Regular Expression Example

**2. A second kind of a regular expression is a range list, enclosed between square brackets.**

For example, `c[aeiou]t` matches the strings cat, cet, cit, cot, and cut, whereas `[a-z]` and `[0-9]` match any lowercase letter or decimal digit, respectively. If you want to repeat the regular expression X certain number of times, type `{X}` immediately following the regexp.

For example, let’s extract the UUIDs of storage devices from `/etc/fstab`:

    # grep -Ei '[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}' -o /etc/fstab

![Extract String from a File in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/Extract-String-from-a-File.png)

Extract String from a File

The first expression in brackets `[0-9a-f]` is used to denote lowercase hexadecimal characters, and `{8}` is a quantifier that indicates the number of times that the preceding match should be repeated (the first sequence of characters in an UUID is a 8-character long hexadecimal string).

The parentheses, the `{4}` quantifier, and the hyphen indicate that the next sequence is a 4-character long hexadecimal string, and the quantifier that follows `({3})` denote that the expression should be repeated 3 times.

Finally, the last sequence of 12-character long hexadecimal string in the UUID is retrieved with `[0-9a-f]{12}`, and the -o option prints only the matched (non-empty) parts of the matching line in /etc/fstab.

**3. POSIX character classes.**

注：表格
<table cellspacing="0" border="0">
<colgroup width="201"></colgroup>
<colgroup width="440"></colgroup>
<tbody>
<tr>
<td align="center" height="25" bgcolor="#999999" style="border: 1px solid #000000;"><b>Character Class</b></td>
<td align="center" bgcolor="#999999" style="border: 1px solid #000000;"><b>Matches…</b></td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:alnum:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any alphanumeric [a-zA-Z0-9] character</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:alpha:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any alphabetic [a-zA-Z] character</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:blank:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Spaces or tabs</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:cntrl:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any control characters (ASCII 0 to 32)</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:digit:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any numeric digits [0-9]</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:graph:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any visible characters</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:lower:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any lowercase [a-z] character</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:print:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any non-control characters</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:space:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any whitespace</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:punct:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any punctuation marks</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:upper:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any uppercase [A-Z] character</td>
</tr>
<tr>
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[[:xdigit:]]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any hex digits [0-9a-fA-F]</td>
</tr>
<tr class="alt">
<td align="left" height="21" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;[:word:]</td>
<td align="left" bgcolor="#FFFFFF" style="border: 1px solid #000000;">&nbsp;Any letters, numbers, and underscores [a-zA-Z0-9_]</td>
</tr>
</tbody>
</table>

For example, we may be interested in finding out what the used UIDs and GIDs (refer to [Part 2][2] of this series to refresh your memory) are for real users that have been added to our system. Thus, we will search for sequences of 4 digits in /etc/passwd:

    # grep -Ei [[:digit:]]{4} /etc/passwd

![Search For a String in File](http://www.tecmint.com/wp-content/uploads/2015/03/Search-For-String-in-File.png)

Search For a String in File

The above example may not be the best case of use of regular expressions in the real world, but it clearly illustrates how to use POSIX character classes to analyze text along with grep.

### Conclusion ###

In this article we have provided some tips to make the most of nano and vim, two text editors for the command-line users. Both tools are supported by extensive documentation, which you can consult in their respective official web sites (links given below) and using the suggestions given in [Part 1][3] of this series.

#### Reference Links ####

- [http://www.nano-editor.org/][4]
- [http://www.vim.org/][5]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-how-to-use-nano-vi-editors/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/vi-editor-usage/
[2]:http://www.tecmint.com/file-and-directory-management-in-linux/
[3]:http://www.tecmint.com/rhcsa-exam-reviewing-essential-commands-system-documentation/
[4]:http://www.nano-editor.org/
[5]:http://www.vim.org/