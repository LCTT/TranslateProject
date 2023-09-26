[#]: subject: "Share your game achievements with Gamerzilla"
[#]: via: "https://fedoramagazine.org/share-your-game-achievements-with-gamerzilla/"
[#]: author: "Dennis Payne https://fedoramagazine.org/author/dulsi/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Share your game achievements with Gamerzilla
======

![][1]

Photo by [Michał Parzuchowski][2] on [Unsplash][3]

Gamerzilla is an open source game achievement system that stores and shares your game achievements. Games use libgamerzilla to easily add achievements. The Gamerzilla library is written in C but bindings exist for other languages.

Two years ago I described how to setup a [Gamerzilla server][4]. In addition to the .net implementation, php and python implementations are available. But you probably don’t want to run your own server. Here is an introduction to a public server and the Gnome interface.

### Public server

My web server now hosts an instance of [Gamerzilla][5] with public registration enabled. To create an account click on the _Sign In_ link on the top right corner. From there click the _Register_ link next to the _Login_ button.

The user accounts collect very little information. Simply enter a username and password. You do not need to enter your real name or email address. As a result, forgotten password is not implemented.

Accounts start as invisible. If you want the public to see your achievements after login, click on your username on the top right of the page and select _Make Visible_. New users must be approved before they can upload achievements. Currently no indication appears whether you are approved or not.

### Getting an achievement

Before you get your first achievement, you need to install the Gamerzilla gnome shell extension with:

```

    sudo dnf install gnome-shell-extension

```

After installation you will need to logout and log back in. The extension needs to be enabled with the the following:

```

    gnome-extensions enable gamerzilla@gamerzilla.identicalsoftware.com

```

The game controller icon appears in the top bar of the gnome shell.

Click on the controller icon and select _preferences_. On the resulting screen enter your gamerzilla url including the trailing slash but without the ‘trophy’ destination for the UI. If using my server, the value will be ‘ _<https://identicalsoftware.com/>_ ‘. Fill in your username and password. Click on save. By default Automatic Connect is enabled. If you don’t want to always connect disable this.

![Gamerzilla Controller menu][6]

Unfortunately a bug prevents the shell extension from working right away. You need to logout and log back in again. Fixing this is high priority.

### Currently Supported Games

Several games in the Fedora repository support Gamerzilla achievements. If you want to get one to try it out, I suggest Shippy 1984, Seahorse Adventures, or Anagramarama. Seahorse Adventures will store some progress as soon as you complete a single level. If you play Super Tux Kart, you may already have achievements. Simply starting the game will synch any previous completed achievements. Gamerzilla does not display any notification when achievements complete but games may implement it on their own.

### Going Forward

Besides fixing the bug with connecting the first time, I want a local browser for achievements. That way you can view all your game achievements without forcing you to upload them.

Achievements do have negative aspects. Some people feel compelled to complete them. This can lead to negative play experience, if the achievements are very difficult. I understand this concern but some people enjoy these aspects as well. More importantly, to attract and retain players, I feel open source games need a game achievement system.

We need more games to implement Gamerzilla achievements. We need players to show their support for the system. I continue to add achievements to my games and other open source games I try out.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/share-your-game-achievements-with-gamerzilla/

作者：[Dennis Payne][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dulsi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/09/gamerzilla_achievenments-816x345.jpg
[2]: https://unsplash.com/@mparzuchowski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/geNNFqfvw48?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/open-source-game-achievements/
[5]: https://identicalsoftware.com/trophy/
[6]: https://fedoramagazine.org/wp-content/uploads/2023/09/gamerzilla_preferences.png
