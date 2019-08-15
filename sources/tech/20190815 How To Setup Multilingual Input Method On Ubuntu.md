[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Setup Multilingual Input Method On Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-setup-multilingual-input-method-on-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Setup Multilingual Input Method On Ubuntu
======

For those who don’t know, there are hundreds of spoken languages in India and 22 languages are listed as official languages in Indian constitution. I am not a native English speaker, so I often use **Google translate** if I ever needed to type and/or translate something from English to my native language, which is Tamil. Well, I guess I don’t need to rely on Google translate anymore. I just found way to type in Indian languages on Ubuntu. This guide explains how to setup multilingual input method. It has been exclusively written for Ubuntu 18.04 LTS, however it might work on other Ubuntu variants like Linux mint, Elementary OS.

### Setup Multilingual Input Method On Ubuntu Linux

With the help of **IBus** , we can easily setup multilingual input method on Ubuntu and its derivatives. Ibus, stands for **I** ntelligent **I** nput **Bus** , is an input method framework for multilingual input in Unix-like operating systems. It allows us to type in our native language in most GUI applications, for example LibreOffice.

##### Install IBus On Ubuntu

To install IBus package on Ubuntu, run:

```
$ sudo apt install ibus-m17n
```

The Ibus-m17n package provides a lot of Indian and other countries languages including amharic, arabic, armenian, assamese, athapascan languages, belarusian, bengali, burmese, central khmer, chamic languages, chinese, cree, croatian, czech, danish, divehi, dhivehi, maldivian, esperanto, french, georgian, ancient and modern greek, gujarati, hebrew, hindi, inuktitut, japanese, kannada, kashmiri, kazakh, korean, lao, malayalam, marathi, nepali, ojibwa, oriya, panjabi, punjabi, persian, pushto, pashto, russian, sanskrit, serbian, sichuan yi, nuosu, siksika, sindhi, sinhala, sinhalese, slovak, swedish, tai languages, tamil, telugu, thai, tibetan, uighur, uyghur, urdu, uzbek, vietnamese, as well as yiddish.

##### Add input languages

We can add languages in System **Settings** section. Click the drop down arrow on the top right corner of your Ubuntu desktop and choose Settings icon in the bottom left corner.

![][2]

Launch System’s settings from top panel

From the Settings section, click on **Region & Language** option in the left pane. Then click the **+** (plus) sign button on the right side under **Input Sources** tab.

![][3]

Region & language section in Settings section

In the next window, click on the **three vertical dots** button.

![][4]

Add input source in Ubuntu

Search and choose the input language you’d like to add from the list.

![][5]

Add input language

For the purpose of this guide, I am going to add **Tamil** language. After choosing the language, click **Add** button.

![][6]

Add Input Source

Now you will see the selected input source has been added. You will see it in Region & Language section under Input Sources tab.

![][7]

Input sources section in Ubuntu

Click the “Manage Installed Languages” button under Input Sources tab.

![][8]

Manage Installed Languages In Ubuntu

Next you will be asked whether you want to install translation packs for the chosen language. You can install them if you want. Or, simply choose “Remind Me Later” button. You will be notified when you open this next time.

![][9]

The language support is not installed completely

Once the translation packs are installed, Click **Install / Remove Languages** button. Also make sure IBus is selected in Keyboard input method system.

![][10]

Install / Remove Languages In Ubuntu

Choose your desired language from the list and click Apply button.

![][11]

Choose input language

That’s it. That’s we have successfully setup multilingual input method on Ubuntu 18.04 desktop. Similarly, add as many as input languages you want.

After adding all language sources, log out and log in back.

##### Type In Indian languages and/or your preferred languages

Once you have added all languages, you will see them from the drop download on the top bar of your Ubuntu desktop.

![][12]

Choose input language from top bar in Ubuntu desktop

Alternatively, you can use **SUPER+SPACE** keys from the Keyboard to switch between input languages.

![][13]

Choose input language using Super+Space keys in Ubuntu

Open any GUI text editors/apps and start typing!

![][14]

Type in Indian languages in Ubuntu

##### Add IBus to startup applications

We need let IBus to start automatically on every reboot, so you need not to start it manually whenever you want to type in your preferred language.

To do so, simply type “startup applications” in the dash and click on Startup Applications option.

![][15]

Launch startup applications in Ubuntu

In the next window, click Add, type “Ibus” in the name field and “ibus-daemon” in the Command field and then click Add button.

![][16]

Add Ibus to startup applications on Ubuntu

From now IBus will automatically start on system startup.

* * *

**Suggested read:**

  * [**How To Use Google Translate From Commandline In Linux**][17]
  * [**How To Type Indian Rupee Sign (₹) In Linux**][18]
  * [**How To Setup Japanese Language Environment In Arch Linux**][19]



* * *

So, it is your turn now. What application/tool you’re using to type in local Indian languages? Let us know them in the comment section below.

**Reference:**

  * [**IBus – Ubuntu Community Wiki**][20]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-setup-multilingual-input-method-on-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/07/Ubuntu-system-settings.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/Region-language-in-Settings-ubuntu.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-input-source-in-Ubuntu.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-input-language.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-Input-Source-Ubuntu.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/08/Input-sources-Ubuntu.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/08/Manage-Installed-Languages.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-language-support-is-not-installed-completely.png
[10]: https://www.ostechnix.com/wp-content/uploads/2019/08/Install-Remove-languages.png
[11]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-language.png
[12]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-input-language-from-top-bar-in-Ubuntu.png
[13]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-input-language-using-SuperSpace-keys.png
[14]: https://www.ostechnix.com/wp-content/uploads/2019/08/Setup-Multilingual-Input-Method-On-Ubuntu.png
[15]: https://www.ostechnix.com/wp-content/uploads/2019/08/Launch-startup-applications-in-ubuntu.png
[16]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-Ibus-to-startup-applications-on-Ubuntu.png
[17]: https://www.ostechnix.com/use-google-translate-commandline-linux/
[18]: https://www.ostechnix.com/type-indian-rupee-sign-%e2%82%b9-linux/
[19]: https://www.ostechnix.com/setup-japanese-language-environment-arch-linux/
[20]: https://help.ubuntu.com/community/ibus
