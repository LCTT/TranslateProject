[#]: subject: "Use secret keyboard keys on Linux"
[#]: via: "https://opensource.com/article/22/7/linux-compose-key-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use secret keyboard keys on Linux
======
With a compose key, you're not limited to what's on your keyboard. Download the cheat sheet.

![Linux keys on the keyboard for a desktop computer][1]

A typical computer keyboard has only about 100 keys on it.

Most keys double up on characters, also called glyphs, thanks to the Shift key. Glyphs are frequently used to type letters with accents and umlauts, to produce characters used in mathematic or monetary expressions, or just to add fun emojis. In some regions there are even three glyphs available on select keys.

Regardless of your region, however, some glyphs don't make it onto your keyboard. Fortunately, Linux provides access to these through a compose key.

There's no compose key on your keyboard, at least not by default, but you can designate a key you're not otherwise using as your compose key. I use the Alt key to the right of the spacebar on my desktop keyboard and the Menu key on my laptop.

**[[ Download the cheat sheet: Linux compose key ]][2]**

### Setting a Compose key in GNOME

![A screenshot shows the keyboard and mouse options visible. The "Compose Key" option is set to Right Alt.][3]

Image by:

(Seth Kenlon, CC BY-SA 4.0)

On the GNOME desktop, install the Tweaks application from your software repository. You can also install it from a terminal (use `apt` for Debian-based distributions, `dnf` for Fedora and similar):

```
$ sudo dnf install gnome-tweaks
```

After you launch Tweaks:

1. Click on the Keyboard & Mouse category in the left column.
2. Locate the Compose key setting and choose a key to designate.
3. Close Tweaks.

### Setting a Compose key in KDE Plasma Desktop

![A screenshot shows the advanced options threaded under Keyboard settings. "Configure keyboard options" is checked, "Position of Compose Key" is checked within that menu, and "Right Alt" is checked within that menu.][4]

Image by:

(Seth Kenlon, CC BY-SA 4.0)

On the KDE Plasma Desktop, open System Settings and navigate to the Input Devices control panel. Then:

1. In the Input Devices panel, click the Advanced tab.
2. Find the Compose key list item and choose a key to designate.
3. Click the Apply button in the bottom right corner of the window and then close System Settings.

### Using compose sequences

To enter a hidden character, press the compose key and then release it. You're now in compose mode. While in compose mode, you can press and release one key and then another to combine characters.

For instance:

1. Press the compose key and release it. You are now in compose mode.
2. Press an apostrophe (') and then release it.
3. Press the letter E and then release it. This is a valid combination, so you are now out of compose mode.

You've just typed the letter É!

Some compose sequences are a combination of just two keys, while others require three keys, and at least one special glyph uses a series of four key presses.

### The secret glyphs

It's a small world, so there's a good chance you've got friends whose names use glyphs that aren't native to your keyboard. You can now stop skipping over diacritics and type names using the appropriate modifiers.

Here's a sample list of compose sequences for common diacritics:

* ' + <letter> = á é í ó ú ć ń ý j́́ ẃ ź
* ` + <letter> = à è ì ò ù ǹ ỳ ẁ
* ~ + <letter> = ã ẽ ĩ õ ũ ñ ỹ
* ^ + <letter> = â ê î ô û ĉ ŷ ĵ ŵ ẑ
* u + <letter> = ă ĕ ĭ ŏ ŭ
* c + c = č
* - + <letter> = ā ē ī ō ū đ
* , + <letter> = ą ę į ǫ ų ç ḑ ţ

That's not a complete list, but it covers a lot of the common ones.

#### Currency

International banking gets a little easier thanks to the compose key, too:

* - + Y = ¥
* - + L = £
* = + E = €
* = + L = ₤
* = + N = ₦
* = + R = ₹
* = + W = ₩
* / + m = ₥
* R + s = ₨
* C + r = ₢
* F + r = ₣

Once again, that's not a complete list, but it's a good start.

#### Fun glyphs

Diacritics and currency are useful, but the compose key can be used just for fun, too.

* < + 3 = ♥
* < + > = ⋄
* # + q = ♩
* : + ) = ☺
* : + ( = ☹
* p + o + o = 💩

#### Live long and prosper

My favorite "secret" glyph in Linux is the traditional Vulcan salutation, "Live long and prosper."

* L + L + A + P = 🖖

### Finding all the glyphs

There are many more glyphs available through the compose key, and you can have fun discovering new ones by pressing random compose sequences. A more methodical method for finding glyphs is to refer to the `Compose` file, located in `/usr/share/X11/locale/en_US.UTF-8` (adjust the exact path depending on the locale your keyboard uses).

That file can admittedly be overwhelming, as it consists of over 6,000 lines of compose sequences, many of which are complex combinations of ASCII and Unicode. For a quick and easy reference of common and foundational sequences, you can [download our compose key cheat sheet][5]. It provides sequences covering mathematics, typography, music, arrows, diacritics, currency, and more.

Now that you're in on the secret, your range of expression just got a whole lot bigger.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/linux-compose-key-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/linux_keyboard_desktop.png
[2]: https://opensource.com/downloads/linux-compose-key-cheat-sheet
[3]: https://opensource.com/sites/default/files/2022-04/gnome-tweaks-compose.jpeg
[4]: https://opensource.com/sites/default/files/2022-04/kde-settings-input-advanced-compose.jpeg
[5]: https://opensource.com/downloads/linux-compose-key-cheat-sheet
