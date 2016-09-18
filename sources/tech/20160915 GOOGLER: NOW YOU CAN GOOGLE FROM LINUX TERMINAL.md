LinuxBars 翻译认领
GOOGLER: NOW YOU CAN GOOGLE FROM LINUX TERMINAL!
====

![](https://itsfoss.com/wp-content/uploads/2016/09/google-from-linux-terminal.jpg)

A quick question: What do you do every day? Of course, a lot of things. But I can tell one thing, you search on Google almost every day (if not every day). Am I right?

Now, if you are a Linux user (which I’m guessing you are) here’s another question: wouldn’t it be nice if you can Google without even leaving the terminal? Without even firing up a Browser window?

If you are a *nix enthusiast and also one of those people who just love the view of the terminal, I know your answer is – Yes. And I think, the rest of you will also like the nifty little tool I’m going to introduce today. It’s called Googler!

### GOOGLER: GOOGLE IN YOUR LINUX TERMINAL

Googler is a straightforward command-line utility for Google-ing right from your terminal window. Googler mainly supports three types of Google Searches:

- Google Search: Simple Google searching, equivalent to searching on Google homepage.
- Google News Search: Google searching for News, equivalent to searching on Google News.
- Google Site Search: Google searching for results from a specific site.

Googler shows the search results with the title, URL and page excerpt. The search results can be opened directly in the browser with only a couple of keystrokes.

![](https://itsfoss.com/wp-content/uploads/2016/09/googler-1.png)

### INSTALLATION ON UBUNTU

Let’s go through the installation process first.

At first make sure you have python version 3.3 or later using this command:

```
python3 --version
```

If not, upgrade it. Googler requires python 3.3+ for running.

Though Googler is yet not available through package repository on Ubuntu, we can easily install it from the GitHub repository. All we have to do is run the following commands:

```
cd /tmp
git clone https://github.com/jarun/googler.git
cd googler
sudo make install
cd auto-completion/bash/
sudo cp googler-completion.bash /etc/bash_completion.d/
```

And that’s it. Googler is installed along with command autocompletion feature.

### FEATURES & BASIC USAGE

If we go through all its features, Googler is actually quite powerful a tool. Some of the main features are:

Interactive Interface: Run the following command in terminal:

```
googler
```

The interactive interface will be opened. The developer of Googler, Arun [Prakash Jana][1] calls it the omniprompt. You can enter ? for available commands on omniprompt.

![](https://itsfoss.com/wp-content/uploads/2016/09/googler-2.png)

From the omniprompt, enter any search phrases to initiate the search. You can then enter n or p to navigate next or previous page of search results.

To open any search result in a browser window, just enter the index number of that result. Or you can open the search page itself by entering o .

- News Search: If you want to search News, start googler with the N optional argument:

```
googler -N
```

The subsequent omniprompt will fetch results from Google News.

- Site Search: If you want to search pages from a specific site, run googler with w {domain} argument:

```
googler -w itsfoss.com
```

The subsequent omniprompt with fetch results only from It’s FOSS blog!

- Manual Page: Run the following command for Googler manual page equipped with various examples:

```
man googler
```

- Google country/domain specific search:

```
googler -c in "hello world"
```

The above example command will open search results from Google’s Indian domain (in for India).

- Filter search results by duration and language preference.
- Google search keywords support, such as: site:example.com or filetype:pdf etc.
- HTTPS proxy support.
- Shell commands autocomplete.
- Disable automatic spelling correction.

There are much more. You can twist Googler to suit your needs.

Googler can also be integrated with a text-based browser ( like – [elinks][2], [links][3], [lynx][4], w3m etc.), so that you wouldn’t even need to leave the terminal for browsing web pages. The instructions can be found on the [GitHub project page of Googler][5].

If you want a graphical demonstration of Googler’s various features, feel free to check the terminal recording attached to the GitHub project page : [jarun/googler v2.7 quick demo][6].

### THOUGHTS ON GOOGLER?

Though Googler might not feel necessary or desired to everybody, for someone who doesn’t want to open the browser just for searching on google or simply want to spend as much as time possible on the terminal window, it is a great tool indeed. What do you think?

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Munif Tanjim][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/munif/
[1]: https://github.com/jarun
[2]: http://elinks.or.cz/
[3]: http://links.twibright.com/
[4]: http://lynx.browser.org/
[5]: https://github.com/jarun/googler#faq
[6]: https://asciinema.org/a/85019
