[#]: subject: "Change Keyboard Layout in Ubuntu"
[#]: via: "https://itsfoss.com/ubuntu-change-keyboard/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Change Keyboard Layout in Ubuntu
======

When [you install Ubuntu][1], you get to choose the keyboard. You may have gone with the default choice of English US and now you want to change it to English UK or India or any other keyboard of your choice.

The good thing is that you can have multiple keyboard layouts in the same Ubuntu system. This is quite convenient.

In this tutorial, you'll learn to:

  * Add new keyboard layouts in Ubuntu desktop
  * Switch between the available keyboards
  * Remove Additional keyboards
  * Command line method of changing keyboard layout



### Step 1: Add new keyboard layout

To change the keyboard layout, you need to have another keyboard layout enabled on your system first.

Go to system settings. Press the Super key in Ubuntu (Windows symboled key) and search settings.

![][2]

In the system settings, look for Keyboard in the left sidebar. Once you select that, you should see the option of adding a new keyboard under the **Input Sources** section. Click the + sign.

![Add new keyboard layout][3]

You'll be presented with a few keyboard options but you can get a lot more if you click on the three dots. You can scroll through or search by typing the in here.

![There are more keyboard layouts available][4]

Click on your desired keyboard. Keep in mind that the selected keyboard layout may have sub-layouts.

For example, when I click on **English (India)** it shows me a number of English keys from Denmark to Ghana or what not. In here, I chose the **English (India, with rupee)** keyboard. This is the keyboard layout that will be added.

![][5]

You'll see the newly added keyboard layout under the Input Sources section.

![][6]

This is the same method I used for adding a [Hindi keyboard in Ubuntu earlier][7].

### Step 2: Switching keyboards

So, you have successfully added another keyboard. But it is not in use. You have to switch between the available input sources.

There are two ways of doing it.

#### Method 1: Use Super+Space keys together

The quicker method for switching the keyboards to [use keyboard shortcuts in Ubuntu][8]. Press the Super key (Windows key) and Space together. It will momentarily show all the enabled keyboard layouts.

![][9]

You can press Space key multiple times while holding the Super key to move between the available options.

#### Method 2: Use mouse to switch keyboards

It's not easy to remember all these keyboard shortcuts and that's understandable.

When you have more than one keyboards enabled on the system, you'll notice that the keyboard name is being displayed in the top right corner of the panel. Click on it and you'll see the option to switch between the layouts or see the selected keyboard layouts.

![Switch between keyboard layouts][10]

### Bonus Tip: Remove additional keyboard

Not liking multiple keyboards in your system? No worries. You can easily remove them.

Go to the keyboard settings once again as you saw previously. Click on the three vertical dots symbol next to the keyboard of your choice. You should see the remove option here.

![][11]

### Using command line for changing keyboard layout (not recommended)

If you are a desktop user, I strongly recommend the graphical method discussed above.

If you are on a server and you must use some other keyboard layout, you could opt for the command line.

Now, there are multiple ways to change the keyboard layout in Linux. But for Ubuntu, I prefer the [dpkg][12] way.

```

    sudo dpkg-reconfigure keyboard-configuration

```

Enter your password and you shall see this in your terminal:

![][13]

To navigate in this TUI (terminal user interface), use the arrow keys to move between the available options. **Use the tab key to go to the <OK> or <Cancel> options**. When you are at one of them, press enter to confirm your choice.

Go with the country of your choice and then you'll have the option to choose the keyboard layout.

![][14]

When you have added the additional keyboard, you'll be asked to assign a keyboard shortcut to switch between them.

![][15]

You may also go and make the new keyboard the default and the only layout in the system. Though this could be risky if you do it between languages that are not similar. I mean if you use English US keyboard (physical) and you switch the layout to Hungarian, you won't have all the keys available.

You'll be seeing several screens afterward.

If you are not happy with the new keyboard layout, you can type the same command again and then reconfigure the layout.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-change-keyboard/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: https://itsfoss.com/content/images/2023/11/start-system-settings-ubuntu-1.png
[3]: https://itsfoss.com/content/images/2023/11/adding-new-keyboard-layout-ubuntu-1.png
[4]: https://itsfoss.com/content/images/2023/11/adding-keyboard-layout-1-1.png
[5]: https://itsfoss.com/content/images/2023/11/new-keyboard-layout-added-ubuntu-1.png
[6]: https://itsfoss.com/content/images/2023/11/multiple-keyboards-ubuntu.png
[7]: https://itsfoss.com/type-indian-languages-ubuntu/
[8]: https://itsfoss.com/ubuntu-shortcuts/
[9]: https://itsfoss.com/content/images/2023/11/switch-keyboard-layout-using-keyboard-shortcut-in-ubuntu.png
[10]: https://itsfoss.com/content/images/2023/11/switching-keyboard-layout-ubuntu-1.png
[11]: https://itsfoss.com/content/images/2023/11/remove-additional-keyboard-layout-ubuntu-1.png
[12]: https://wiki.debian.org/dpkg
[13]: https://itsfoss.com/content/images/2023/11/changing-keyboard-layout-ubuntu-command-line.png
[14]: https://itsfoss.com/content/images/2023/11/adding-keyboard-ubuntu-command-line-1.png
[15]: https://itsfoss.com/content/images/2023/11/keyboard-switch-option.png
