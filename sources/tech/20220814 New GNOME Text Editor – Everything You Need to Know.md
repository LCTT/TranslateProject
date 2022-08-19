[#]: subject: "New GNOME Text Editor – Everything You Need to Know"
[#]: via: "https://www.debugpoint.com/gnome-text-editor/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

New GNOME Text Editor – Everything You Need to Know
======
We give you details about GNOME’s new default text editor – the Gnome Text Editor.

A text editor is an essential tool for any Linux distribution or desktop. You use it almost daily for small to complex tasks while working, studying, etc.

Most mainstream Linux desktops have a text editor that integrates well. For example, KDE has Kate or KWrite, and GNOME has Gedit.

### So, Why a new Text Editor for GNOME?

GNOME 42 version onwards, Gedit is replaced with a new editor – Gnome Text Editor. So the distributions which are based on GNOME should not have the new editor. The old Gedit may co-exist with this new editor until users are comfortable.

You might ask why.

What is wrong with Gedit? Gedit is a mighty text editor that supports many advanced functionalities other than being a simple text editor. Nothing is wrong in that sense. We covered some cool features of Gedit [here][1]; you might want to look.

The primary reason for putting effort into creating another text editor is the libadwaita library adaptation necessary for GNOME Shell. The libadwaita and associated libhandy library provide advanced GUI features such as animation, UI widgets, built-in dark mode, responsive UI and others.

Adapting libadwaita and its features to an existing application running for decades is a complex process. It is more cost-effective to develop a brand-new application with the latest libraries than to debug and change an old one.

The Gedit is a two-decade-old application, with its first release in Feb 1999. Now you can comprehend what kind of complexity is built already inside its code base.

### GNOME Text Editor

At first look, [GNOME’s new text editor][2] looks the same. See the image below.

![GNOME Text Editor][3]

The first difference you would see in the looks. The title bar, action buttons and fonts are different. And they look neat overall. There is a slight gradient of the logo in the title bar itself, which you may notice. That is cool, indeed.

The Open menu has a search bar with an option to open the open file dialog. The title bar has the line and column numbers at the top, unlike in Gedit, where it was at the bottom.

When you start modifying a file, it gives you a dot instead of an Asterix indicator showing that it has been changed.

In the editor itself, the line numbers are shown on the left side. The context menu is almost the same as Gedit’s.

At the top right, there is no Save button like in Gedit. However, you have two options. The first view button gives you detailed settings about the Margin, Indentation, Wrapping and other options.

![Menu 1][4]

The main difference is in the hamburger menu and its preference dialog.

The hamburger menu provides the dark and light mode out-of-the-box, which is accessible from this menu itself. Thanks to the libadwaita library, you can experience it with its default installation without any additional plugins.

![GNOME Text Editor - Hamburger Menu][5]

![GNOME Text Editor in Dark Mode][6]

The preference dialog is entirely new. The new text editor provides the following themes preloaded –

* Adwaita
* Kate
* Tango
* Classic
* Solarized Light

![Preference Window][7]

Also, new features such as Grid pattern in the entire editor window, highlighting current lines and overview map are excellent additions to this editor.

A built-in session restoration behaviour is bound to help you when you work in this text editor.

One of the nifty features is the save as dialog box. It gives you a nice little list of unsaved files with an option to select which ones you want to save. This is, indeed, next-level UI design.

![New Save Changes Popup][8]

### Comparison to Gedit

If you compare this new editor to Gedit, there are many differences from the feature standpoint. The default Gedit was powerful because of its Plugins. It had plugins for grammar and spelling check, a built-in Python compiler and many others – and they are part of the default installation.

As this editor is still in a very early stage of writing this guide, I hope more features drop in. Plugin support is welcome; if existing Gedit plugins can be used, nothing like it.

So, that’s about its features. Here’s how you can install it.

### How to Install

#### Using Flatpak

Set up your system to use Flatpack and use the following command to install.

```
flatpak install flathub org.gnome.TextEditor
```

#### Using apt (for Ubuntu, Linux Mint and others)

You can also install it using the apt package manager as the below command.

```
sudo apt install gnome-text-editor
```

#### For Fedora and related distros using dnf

```
sudo dnf install gnome-text-editor
```

#### Usage

Remember those commands which you used to run using gedit? For example:

```
sudo gedit somefile.txt
```

Now that you have a new editor. You should start using it. And the above command looks like the one below.

```
sudo gnome-text-editor somefile.txt
```

### Closing Notes

I hope Gedit and GNOME Text Editor can co-exist as default packaging in future GNOME releases. A new editor is acceptable regarding look and feel, but how often do you care about how an app looks right? Because many users have already established their workflow with Gedit and its plugins.

So, do you like the new Text Editor of GNOME? Let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-text-editor/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2021/04/gedit-features/
[2]: https://gitlab.gnome.org/GNOME/gnome-text-editor
[3]: https://www.debugpoint.com/wp-content/uploads/2021/12/GNOME-Text-Editor-1024x576.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2021/12/Menu-1.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2021/12/GNOME-Text-Editor-Hamburger-Menu.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/12/GNOME-Text-Editor-in-Dark-Mode.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/12/Preference-Window.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2021/12/New-Save-Changes-Popup.jpg
