Turtl: Secure, Open Source Evernote Alternative
=============


[Turtl][9] is a secure, open source Evernote alternative, available for Linux, Windows, Mac, and Android. An iOS version is "coming soon". Firefox and Chrome bookmarking extensions are also available.

![](https://3.bp.blogspot.com/-cNoUUjaU4A0/V7MFKCasZJI/AAAAAAAAYTk/r7oWe-z_HB87hDvlKLViiiHUMfagnC6LQCLcB/s400/turtl-desktop-linux.png)

The application, which is currently in beta, lets you keep your notes (with Markdown support for the note editor), website bookmarks, passwords, documents, photos, and so on, in a single private place.

Notes can be organized in boards, which support nesting, and can be shared with other Turtl users:

![](https://2.bp.blogspot.com/-G-Ln3T1c2QA/V7MFmrqkukI/AAAAAAAAYTs/dXMPEB9MPREicixlEJlQVqg9SFjBX1pwgCLcB/s400/turtl-boards.png)

You can also add tags to your notes. The Turtle search allows sorting by creation date, last edited date, or by tags.

Here's the note editor (for a file note):

![](https://1.bp.blogspot.com/-8cNHV69iCWM/V7MFX7sBlMI/AAAAAAAAYTo/ZUVTYwiCSy8uzrVKdf6NcsQZlHtylIyvgCEw/s400/turtl-edit-note.png)

So what about security? Turtl encrypts the data before storing it, using a cryptographic key, and the password is not stored on the server. Only you and those you choose to share with can read your data. You can read more about the Turtl security and encryption [HERE][1].

Update (thanks to Dimitry!): according to a [bug report][2], Turtl has a pretty serious security issue. Turtl allows creating multiple accounts with the same username, distinguishing between them by passwords. Hopefully this will be fixed soon.

The Turtl developers provide a hosted service for synchronizing your notes, which is completely free "until your profile grows past a certain size or you require certain features". At the time I'm writing this article, the premium service is not available.

However, you don't have to use the self hosted server - you can run your own [Turtl server][3] since it's free, open source software, just like the desktop and mobile applications.

Turtl is not as feature rich as Evernote, however, quite a few new features are listed in its [roadmap][4], like import/export to plaintext and Evernote data format, native PDF reader support, interface locking, and more.

I should also mention that the desktop application requires entering the password every time it's started, which might be good for security reasons, but can be considered annoying by some.


### Download Turtl


[Download Turtl application][5] (binaries available for Linux - 32bit and 64bit, Windows 64bit, Mac 64bit, Android, as well as Chrome and Firefox bookmarking add-ons)

**Update**: Turtl uses a new server. To get the app to work, logout and in Advanced settings, under the login box, set the Turtl server to "https://api.turtlapp.com/v2" (without the quotes).

To download the source code (desktop, mobile and server), report bugs, etc., see the Turtl @ [GitHub][6].

Arch Linux users can install Turtl via [AUR][7].

To install Turtl in Linux, extract the downloaded archive and run the "install.sh" script. Before installing it, make sure the ~/.local/share/applications folder exists:

```
mkdir -p ~/.local/share/applications
```

Important: installing Turtl with sudo makes the application runnable as root only, so either install it without sudo (somewhere in your home folder), or manually fix the permissions (you can take a look at the AUR [package][8] for what permissions to set).

For instance, to install Turtl in the ~/turtl folder, use the following command (assumes you've extracted Turtl in your home folder):

````
~/turtl-*/install.sh ~/turtl
```

You can use "~/.turtl" instead of "~/turtl" to install Turtl to a hidden folder in your home directory. Or you can hide the ~/turtl folder using a simple trick.

If Turtl doesn't show up in the menu / Unity Dash, restart the session (logout / login).

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/08/turtl-secure-open-source-evernote.html

作者：[Andrew ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://turtl.it/docs/security/
[2]: https://github.com/turtl/api/issues/20
[3]: https://turtl.it/docs/server/
[4]: https://trello.com/b/yIQGkHia/turtl-product-dev
[5]: https://turtl.it/download/
[6]: https://github.com/turtl
[7]: https://aur.archlinux.org/packages/turtl/
[8]: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=turtl
[9]: https://turtlapp.com/
