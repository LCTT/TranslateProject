[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to type emoji on Linux)
[#]: via: (https://opensource.com/article/19/10/how-type-emoji-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to type emoji on Linux
======
The GNOME desktop makes it easy to use emoji in your communications.
![A cat under a keyboard.][1]

Emoji are those fanciful pictograms that snuck into the Unicode character space. They're all the rage online, and people use them for all kinds of surprising things, from signifying reactions on social media to serving as visual labels for important file names. There are many ways to enter Unicode characters on Linux, but the GNOME desktop makes it easy to find and type an emoji.

![Emoji in Emacs][2]

### Requirements

For this easy method, you must be running Linux with the [GNOME][3] desktop.

You must also have an emoji font installed. There are many to choose from, so do a search for _emoji_ using your favorite software installer application or package manager.

For example, on Fedora:


```
$ sudo dnf search emoji
emoji-picker.noarch : An emoji selection tool
unicode-emoji.noarch : Unicode Emoji Data Files
eosrei-emojione-fonts.noarch : A color emoji font
twitter-twemoji-fonts.noarch : Twitter Emoji for everyone
google-android-emoji-fonts.noarch : Android Emoji font released by Google
google-noto-emoji-fonts.noarch : Google “Noto Emoji” Black-and-White emoji font
google-noto-emoji-color-fonts.noarch : Google “Noto Color Emoji” colored emoji font
[...]
```

On Ubuntu or Debian, use **apt search** instead.

I'm using [Google Noto Color Emoji][4] in this article.

### Get set up

To get set up, launch GNOME's Settings application.

  1. In Settings, click the **Region &amp; Language** category in the left column.
  2. Click the plus symbol (**+**) under the **Input Sources** heading to bring up the **Add an Input Source** panel.



![Add a new input source][5]

  3. In the **Add an Input Source** panel, click the hamburger menu at the bottom of the input list.



![Add an Input Source panel][6]

  4. Scroll to the bottom of the list and select **Other**.
  5. In the **Other** list, find **Other (Typing Booster)**. (You can type **boost** in the search field at the bottom to filter the list.)



![Find Other \(Typing Booster\) in inputs][7]

  6. Click the **Add** button in the top-right corner of the panel to add the input source to GNOME.



Once you've done that, you can close the Settings window.

#### Switch to Typing Booster

You now have a new icon in the top-right of your GNOME desktop. By default, it's set to the two-letter abbreviation of your language (**en** for English, **eo** for Esperanto, **es** for Español, and so on). If you press the **Super** key (the key with a Linux penguin, Windows logo, or Mac Command symbol) and the **Spacebar** together on your keyboard, you will switch input sources from your default source to the next on your input list. In this example, you only have two input sources: your default language and Typing Booster.

Try pressing **Super**+**Spacebar** together and watch the input name and icon change.

#### Configure Typing Booster

With the Typing Booster input method active, click the input sources icon in the top-right of your screen, select **Unicode symbols and emoji predictions**, and set it to **On**.

![Set Unicode symbols and emoji predictions to On][8]

This makes Typing Booster dedicated to typing emoji, which isn't all Typing Booster is good for, but in the context of this article it's exactly what is needed.

### Type emoji

With Typing Booster still active, open a text editor like Gedit, a web browser, or anything that you know understands Unicode characters, and type "_thumbs up_." As you type, Typing Booster searches for matching emoji names.

![Typing Booster searching for emojis][9]

To leave emoji mode, press **Super**+**Spacebar** again, and your input source goes back to your default language.

### Switch the switcher

If the **Super**+**Spacebar** keyboard shortcut is not natural for you, then you can change it to a different combination. In GNOME Settings, navigate to **Devices** and select **Keyboard**.

In the top bar of the **Keyboard** window, search for **Input** to filter the list. Set **Switch to next input source** to a key combination of your choice.

![Changing keystroke combination in GNOME settings][10]

### Unicode input

The fact is, keyboards were designed for a 26-letter (or thereabouts) alphabet along with as many numerals and symbols. ASCII has more characters than what you find on a typical keyboard, to say nothing of the millions of characters within Unicode. If you want to type Unicode characters into a modern Linux application but don't want to switch to Typing Booster, then you can use the Unicode input shortcut.

  1. With your default language active, open a text editor like Gedit, a web browser, or any application you know accepts Unicode.
  2. Press **Ctrl**+**Shift**+**U** on your keyboard to enter Unicode entry mode. Release the keys.
  3. You are currently in Unicode entry mode, so type a number of a Unicode symbol. For instance, try **1F44D** for a 👍 symbol, or **2620** for a ☠ symbol. To get the number code of a Unicode symbol, you can search the internet or refer to the [Unicode specification][11].



### Pragmatic emoji-ism

Emoji are fun and expressive. They can make your text unique to you. They can also be utilitarian. Because emoji are Unicode characters, they can be used anywhere a font can be used, and they can be used the same way any alphabetic character can be used. For instance, if you want to mark a series of files with a special symbol, you can add an emoji to the name, and you can filter by that emoji in Search.

![Labeling a file with emoji][12]

Use emoji all you want because Linux is a Unicode-friendly environment, and it's getting friendlier with every release.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-type-emoji-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead_cat-keyboard.png?itok=fuNmiGV- (A cat under a keyboard.)
[2]: https://opensource.com/sites/default/files/uploads/emacs-emoji.jpg (Emoji in Emacs)
[3]: https://www.gnome.org/
[4]: https://www.google.com/get/noto/help/emoji/
[5]: https://opensource.com/sites/default/files/uploads/gnome-setting-region-add.png (Add a new input source)
[6]: https://opensource.com/sites/default/files/uploads/gnome-setting-input-list.png (Add an Input Source panel)
[7]: https://opensource.com/sites/default/files/uploads/gnome-setting-input-other-typing-booster.png (Find Other (Typing Booster) in inputs)
[8]: https://opensource.com/sites/default/files/uploads/emoji-input-on.jpg (Set Unicode symbols and emoji predictions to On)
[9]: https://opensource.com/sites/default/files/uploads/emoji-input.jpg (Typing Booster searching for emojis)
[10]: https://opensource.com/sites/default/files/uploads/gnome-setting-keyboard-switch-input.jpg (Changing keystroke combination in GNOME settings)
[11]: http://unicode.org/emoji/charts/full-emoji-list.html
[12]: https://opensource.com/sites/default/files/uploads/file-label.png (Labeling a file with emoji)
