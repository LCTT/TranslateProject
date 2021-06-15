[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Quick Lookup is a Simple Open Source Word Lookup Tool to Find Meaning of Words You Come Across)
[#]: via: (https://itsfoss.com/quick-lookup/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Quick Lookup is a Simple Open Source Word Lookup Tool to Find Meaning of Words You Come Across
======

_**It is always handy to have a quick word lookup tool while browsing the web or reading an e-book. Quick Lookup is one such free and open-source tool to try.**_

Whenever I come across a word that I don’t know the meaning of, I just open a new tab and search for the meaning. However, it is a hit and trial every time depending on what search engine you’re on.

Even if you do get an idea for the meaning with a quick search, you do not get all the details required along with it. Especially, if you do not know the meaning of the word that describes your target word. You will end up performing another quick search.

So, to get rid of all that hassle, a quick lookup tool should prove to be useful!

### Quick Lookup: A Simple Dictionary App Powered by Wiktionary

![][1]

Whatever is your [idea of what is Linux][2], this is what Wiktionary thinks of Linux.

As you might have guessed already, Quick Lookup needs an active Internet connection to give you the results for your words utilizing [Wiktionary][3].

It is a completely free and open-source application that offers essential features to make it a handy [productive tool for Linux users][4]. Let us take a look at what it offers.

**Recommended Read:**

![][5]

#### [Artha: An Offline English Thesaurus App for Linux][6]

Artha is a feature rich thesaurus application available for all major Linux distributions. 

### Features of Quick Lookup

![][7]

  * Ability to look for the definitions of the words and phrases
  * It lets you manually enter the word or phrase
  * Multiple languages supported but the description and meaning of words/phrases will be displayed only in English
  * Open internal links from within app (if you’re curious about a related word)
  * Remembers your last search with the help of the back button
  * You can also launch the app in selection mode to automatically capture the word you select



### Installing Quick Lookup on Linux

Quick Look is [available primarily][8] as a [Flatpak package][9] for every Linux user. If Flatpak is integrated with your software center like Pop!_Shop on [Pop OS][10], you can find it listed there.

If you have Flatpak enabled, you can always use this command to install it:

```
flatpak install flathub com.github.johnfactotum.QuickLookup
```

You can learn more about [using Flatpak][11] in case you don’t know how about it.

It is worth noting that if you want to select texts on your browser (or any other app) while using a Flatpak package and have it look for the meaning, you will have to type this command (launching it in the selection mode):

```
flatpak run com.github.johnfactotum.QuickLookup --selection
```

In either case, you can simply [download the source][12] archive and get it installed using the installation script. You can also run it without needing to install it by simply navigating the source folder and typing this command:

```
gjs quick-lookup.js
```

If you’ve installed it from source and want it to automatically fetch the text that you select on any app, you will have to launch it using the following command:

```
quick-lookup --selection
```

You also get an option to use the [GNOME Builder][13] if you’re familiar with it. For more details, you can check out its [GitHub page][14].

[Quick Lookup][14]

**Recommended Read:**

![][15]

#### [LanguageTool Review: Free and Open Source Grammar Checker][16]

LanguageTool is a free and open source proofreading software that checks the grammar, style and spelling in more than 20 languages.

### Closing Thoughts on Quick Look

Quick Look is definitely a useful dictionary app (even without an offline functionality) to quickly look for the meanings of words/phrases. I’m not much into eBooks, but you can try using an [eBook reader][17] along with this app to quickly be able to decipher words.

Personally, I like to use it while browsing the web. To make things convenient, I like to keep its Window on top of every window on my workspace. So, you can easily select a text and then click on it to get the meaning and continue working.

An offline functionality would be great for users who do not spend most of their time online. But, for the time being, it’s only online.

Have you tried something like Quick Look? Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/quick-lookup/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/quick-lookup-dictionary.jpg?resize=800%2C559&ssl=1
[2]: https://itsfoss.com/what-is-linux/
[3]: https://www.wiktionary.org/
[4]: https://itsfoss.com/productivity-tips-ubuntu/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2017/08/thesaurus-app-linux.jpeg?fit=300%2C169&ssl=1
[6]: https://itsfoss.com/artha-thesaurus-app-linux/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/quick-lookup-itsfoss.png?resize=800%2C405&ssl=1
[8]: https://flathub.org/apps/details/com.github.johnfactotum.QuickLookup
[9]: https://itsfoss.com/what-is-flatpak/
[10]: https://itsfoss.com/pop-os-20-04-review/
[11]: https://itsfoss.com/flatpak-guide/
[12]: https://github.com/johnfactotum/quick-lookup/releases/tag/1.2.0
[13]: https://wiki.gnome.org/Apps/Builder
[14]: https://github.com/johnfactotum/quick-lookup
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/LanguageTool-grammar-checker.png?fit=800%2C450&ssl=1
[16]: https://itsfoss.com/languagetool-review/
[17]: https://itsfoss.com/best-ebook-readers-linux/
