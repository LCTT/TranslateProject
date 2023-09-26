[#]: subject: "21 Useful Terminal Shortcuts Pro Linux Users Love to Use"
[#]: via: "https://itsfoss.com/linux-terminal-shortcuts/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

21 Useful Terminal Shortcuts Pro Linux Users Love to Use
======

Sure, learning the Linux commands should always be your priority but once you [get a grip on the command line][1], there's one other thing you should focus on.

_**Terminal shortcuts!**_

You have no idea how helpful they are until you know how to use them to make your terminal sessions super productive.

So in this tutorial, I will walk you through the top terminal shortcuts with examples of how to use them.

Before I explain all the shortcuts individually, here's a cheat sheet of what I'll be discussing in this tutorial:

Shortcut | Description
---|---
`Ctrl + A` | Move to the start of the line.
`Ctrl + E` | Move to the end of the line.
`Ctrl + U` | Delete from the cursor to the start of the line.
`Ctrl + K` | Delete from the cursor to the end of the line.
`Ctrl + W` | Delete the word before the cursor.
`Ctrl + L` | Clear the terminal screen.
`Ctrl + C` | Stop the current process/command.
`Ctrl + D` | Log out or exit the terminal.
`Ctrl + Z` | Pause the current process (can be resumed).
`Ctrl + R` | Search command history (backward search).
`Up Arrow` | Show the previous command (from the command history).
`Down Arrow` | Show the next command (from the command history).
`!!` | Repeat the last command.
`!n` | Repeat the nth command from history.
`Tab` | Auto-complete commands, files, or directories.
`Tab` twice | List all possible completions.
`Ctrl + Shift + C` | Copy the selected text or command.
`Ctrl + Shift + V` | Paste copied text or command.
`Ctrl + Shift + N` | Open a new terminal window.
`Ctrl + Shift + T` | Open a new tab in the terminal.
`Ctrl + Tab`or`Ctrl + PageDown` | Switch between terminal tabs.

📋

Though I have used the capital letters, you don't have to type them in caps. I mean Ctrl+A means pressing Ctrl and the A key together. You don't have to press Shift+a key to get the uppercase A.

Now, let's have a look at them individually.

### 1\. Ctrl + A: Move to the start of the line

When you press the `Ctrl + A`, it will shift the cursor to the beginning of the file which can be really helpful when you write a long command and want to make changes at the beginning of the line.

For example. here, I've demonstrated how you can press the `Ctrl + A` anywhere and it will shift you to the beginning of the line:

![Go to the beginning of the line in Linux terminal using Ctrl + A shortcut][2]

### 2\. Ctrl + E: Move to the end of the line

While using the terminal if you want to jump to the end of the line, you can simply press the `Ctrl + E` and it will do the job.

In the following example, I used a sample text and pressed `Ctrl + E` to get to the end of the line:

![Go to the end of the line in linux terminal using Ctrl + E][3]

### 3\. Ctrl + U: Delete from the cursor to start

There are times when you want to remove everything from the cursor position to the beginning of the line.

In that case, all you have to do is use the left arrow keys to place the cursor from where you would like to delete to the start of the line and then press `Ctrl + U` :

![Use Ctrl+U to delete from the cursor to the beginning of the line][4]

💡

Entering the account password with sudo command and unsure whether you typed it correctly? Instead of pressing backspace all the way, just use Ctrl+U keyboard shortcut and start typing the password again.

### 4\. **Ctrl + K:** Delete from the cursor to the end

As you can guess from the title, when you press the `Ctrl + K`, it will remove everything from the cursor to the end of the line (everything from the cursor position to the right-hand side).

To use this shortcut, first, you have to place your cursor from where you want to remove text to the end and then press the `Ctrl + K` as shown here:

![Delete text from the cursor to the end in Linux terminal using Ctrl + K][5]

### 5\. **Ctrl + W:** Delete a single word before the cursor

This is what I use daily as I often mistype commands and want to remove one part of the command for that, you can simply press the `Ctrl + W` .

When you press the `Ctrl + W` key, it will only remove a single word before the cursor:

![Delete single word before the cursor in Linux terminal by pressing Ctrl + W][6]

![][7]

### 6\. **Ctrl + L:** Clear terminal screen (kind of)

It does not [clear the terminal screen][8] in a true manner but declutters the screen and if you scroll up, you will still find the previous command and execution history.

Yes, it is different than the `clear` command as it removes the history and you will find the execution of the `clear` command in the command history.

But when you press `Ctrl + L`, it just declutters your current screen and you won't find it inside of the history (as it is not a command itself).

For example, here, I executed the history command and then pressed the `Ctrl + L` key to clear the screen:

![clear terminal screen in Linux using Ctrl+L][9]

### 7\. **Ctrl +C:** Stop the current process/execution

How many times did it happen when you wanted to [stop the command execution][10] and you had no idea how to do it and ended up closing the terminal itself?

Well, in any case, all you have to do is press `Ctrl + C`.

When you press the keys, it sends the `SIGINT` signal that will eventually kill the process.

For example, here, I killed the ongoing point command execution:

![Use Ctrl+C terminal shortcut to stop a running command][11]

In the end, you'll see the `^C` symbol indicating you pressed the `Ctrl + C` to kill the ongoing execution.

But there are several processes that may not be killed using the `Ctrl + C` signal and in that case, you can use the other [termination signals in Linux][12]:

![][13]

### 8\. **Ctrl + D:** Logout or exit from the terminal

You can always use the exit command to close a shell session and terminal. You can also use the Ctrl+D shortcut keys as well.

When you press the `Ctrl + D`, it will log you out from the ongoing session if you use it in SSH, it will close the session and if pressed again, it will close the terminal itself:

![Use Ctrl+D to close a session][14]

### 9\. **Ctrl + Z:** Pause the current process

Killing an ongoing process is not a good idea always as you have to start over again.

So in that case, what you can do is press `Ctrl + Z` to stop the ongoing process and later on can be continued from where it was left.

For example, here, I stopped the update process:

![Use Ctrl+Z to suspend a process][15]

Want to know more ways to [stop ongoing processes and how to resume them][16]? Here's a detailed guide for that purpose:

![][13]

### 10\. **Ctrl + R:** Search command history

When you press `Ctrl + R`, it opens a search mode prompt from where you can type any part of the command and it will find you the command with matching string you've entered.

Once you find that command, you simply press the `Enter` key and it will execute that command.

For example, here, I searched for the `update` and it gave me the command to update the repository in Ubuntu (sudo apt update):

![Search commands from history using the shortcut Ctrl + R][17]

📋

If you don't like any of the suggestions from the history, use Ctrl+C to come out of the search mode.

### 11\. Up Arrow: Show the previous command from history

When you press the `Up Arrow` key, it will show you previously executed commands one by one from the command history:

![Navigating down the history using arrow key][18]

### 12\. Down Arrow: Show the next command from history

When you press the `Up Arrow` key, it shows you previous commands but there are times when you accidentally press it many times and now you want to show the previously shown command.

In that case, you can use the `Down Arrow` key.

In the following illustration, first I pressed the up arrow key multiple times, and then to come back to previously shown commands, I pressed the down arrow key:

![Navigating down the history using arrow key][19]

📋

Page Up and Page Down keys are also use for the same purpose.

### 13\. !!: Repeat the last command

There are times when you want to execute the most recent command one or more times and in that case, you can simply type `!!` (exclamation twice):

```

    !!

```

For example, here, I executed an echo command and then used the `!!` twice to use the same command again and again:

![The !! repeats what you entered in the terminal previously][20]

But the most common and useful execution of this shortcut is when you forget to use sudo with a command. Instead of writing the entire command again, you just use `sudo !!`

![Practical use of the !! keyboard shortcuts in Linux terminal][21]

💡

A similar keyboard shortcut is Alt+.. This one gives you the last argument/part of the last command. Say, you used ls /etc/apt/sources.list.d previously and now you want to enter this directory. Just type cd and use Alt+.. It will be like typing cd /etc/apt/sources.list.d

### 14\. !n: Repeat the nth command from history

You can access the history of executed commands by simply executing the bash history command in the terminal and each will have an index number associated with it:

```

    history

```

![Select commands from the history][22]

Now, let's suppose I want to execute the 2nd last echo command, then I will be using the following:

```

    !1998

```

![][23]

### 15\. Tab: Auto-complete the command

I think I should have started the terminal shortcuts list with this one.

While typing a long command, you can type half of it and then press the `Tab` key and it will auto-complete for you.

For example, here, I pressed the `Tab` key to auto-complete my script execution:

![Press tab to see command, options and argument suggestions][24]

### 16\. Tab (twice): List all the possible auto-completes

If pressing the `Tab` key does not work, it means there are multiple possibilities of the currently typed command.

In that case, what you can do is press the `Tab` key twice to list all the possibilities:

![Press tab twice to list all possible auto complete suggestions][25]

✋

The next few shortcuts are terminal emulator dependent. They should work with most terminal applications but that's not a surety.

### 17\. Ctrl + Shift + C: Copy the selected text

[To copy the text in the terminal][26], you have to select the text using the mouse and then press the `Ctrl + Shift + C` to copy the selected text:

![Press Ctrl+Shift+C to copy text][27]

### 18\. Ctrl + Shift + V: Paste the copied text

Once you copy the text by selecting the text and pressing `Ctrl + Shift + C`, now you can paste it anywhere by pressing `Ctrl + Shift + V` :

![Press Ctrl+Shift+V to paste text in terminal][28]

### 19\. Ctrl + Shift + N: Open a new terminal window

When you press the `Ctrl + Shift + N`, it will open a new terminal window with the same working directory you were working in the previous window:

0:00

/0:03

1×

### 20\. Ctrl + Shift + T: Open new tab

Like web browsers, in the terminal, you can open tabs to separate different tasks. To open a new tab, all you have to do is press `Ctrl + Shift + T` :

![][29]

### 21\. Ctrl + Tab or Ctrl + PageDown: Switch tabs

If you created multiple tabs using the above method, you may want to switch between them.

And for that purpose, you can use `Ctrl + Tab` or `Ctrl + PageDown`:

![][30]

💡

This is more likely an Ubuntu thing. [Press Ctrl+Alt+T keys to open a new terminal][31].

![][32]

##### New Book: Efficient Linux at the Command Line

Pretty amazing Linux book with lots of practical tips. It fills in the gap, even for experienced Linux users. Must have in your collection.

[Get it from Amazon][33]

### Next: Must-know Linux commands

Liked this list of 'essential' keyboard shortcuts? Perhaps you would like this list of the [most basic yet essential Linux commands:][34]

![][35]

I understand that you may not remember all of these terminals shortcuts, at least not initially. But practice them and gradually they will be in your muscle memory.

By the way, do you have some of your favourite shortcuts that have not been included here? Share it in the comments?

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-terminal-shortcuts/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-terminal-basics/
[2]: https://itsfoss.com/content/images/2023/09/Ctrl-A.svg
[3]: https://itsfoss.com/content/images/2023/09/Ctrl-E.svg
[4]: https://itsfoss.com/content/images/2023/09/Ctrl-U.svg
[5]: https://itsfoss.com/content/images/2023/09/Ctrl-K.svg
[6]: https://itsfoss.com/content/images/2023/09/Ctrl-W.svg
[7]: https://public-files.gumroad.com/akcz661m3xkpsztskivjmh2agj22
[8]: https://itsfoss.com/clear-terminal-ubuntu/
[9]: https://itsfoss.com/content/images/2023/09/Ctrl-L.svg
[10]: https://itsfoss.com/stop-program-linux-terminal/
[11]: https://itsfoss.com/content/images/2023/09/Ctrl-C.svg
[12]: https://linuxhandbook.com/termination-signals/
[13]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[14]: https://itsfoss.com/content/images/2023/09/exit-from-the-ssh-session-and-close-the-terminal-using-shortcut.gif
[15]: https://itsfoss.com/content/images/2023/09/stop-ongoing-process-in-Linux-terminal.gif
[16]: https://linuxhandbook.com/suspend-resume-process/
[17]: https://itsfoss.com/content/images/2023/09/Ctrl-R.svg
[18]: https://itsfoss.com/content/images/2023/09/Up_arrow.svg
[19]: https://itsfoss.com/content/images/2023/09/Down_arrow.svg
[20]: https://itsfoss.com/content/images/2023/09/Use----to-exccute-the-most-recent-command.png
[21]: https://itsfoss.com/content/images/2023/09/using---terminal-shortcut.png
[22]: https://itsfoss.com/content/images/2023/09/Use-the-history-command-to-find-previously-executed-commands.png
[23]: https://itsfoss.com/content/images/2023/09/Use-the--n-shortcut-to-execute-any-command-from-the-command-history-in-Linux-terminal.png
[24]: https://itsfoss.com/content/images/2023/09/Tab.svg
[25]: https://itsfoss.com/content/images/2023/09/Tab_twice.svg
[26]: https://itsfoss.com/copy-paste-linux-terminal/
[27]: https://itsfoss.com/content/images/2023/09/Copy-text-in-Linux-terminal.gif
[28]: https://itsfoss.com/content/images/2023/09/Paste-text-in-terminal.gif
[29]: https://itsfoss.com/content/images/2023/09/Open-new-tab-in-Linux-terminal.gif
[30]: https://itsfoss.com/content/images/2023/09/Switch-between-tabs-in-Linux-terminal.gif
[31]: https://itsfoss.com/open-terminal-ubuntu/
[32]: https://itsfoss.com/content/images/2023/04/efficient-at-linux-command-line-horizontal.png
[33]: https://amzn.to/3MPjiHw
[34]: https://itsfoss.com/essential-ubuntu-commands/
[35]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
