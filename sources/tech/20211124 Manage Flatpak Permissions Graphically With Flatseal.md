[#]: subject: "Manage Flatpak Permissions Graphically With Flatseal"
[#]: via: "https://itsfoss.com/flatseal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage Flatpak Permissions Graphically With Flatseal
======

The newer versions of Android give you a more granular control over the access and permission an individual app can have. This is vital because many applications were (are) abusing the system permissions. Download a weather app and it will ask to access your call logs as if that has anything to do with the weather.

Why am I talking about Android app permissions? Because that is something you could relate with this application’s functioning.

You probably already know [what Flatpak is][1]. These are sandboxed applications with selected access to system resources like file storage, network interface etc.

Just like Android, you can control the access to system resources by Flatpak applications. By default, that happens with [Flatpak commands][2] and not everyone can be comfortable with it.

And hence, there is this tiny utility called Flatseal that allows you to manage and control the Flatpak permissions at application level.

### Flatseal

![Flatseal][3]

[Flatseal][4] is a graphical utility to review and modify permissions your Flatpak applications has got. This makes things a lot easier than going through the commands.

Flatseal lists all the installed Flatpak applications. When you select one, you can see all the permissions. The enabled permissions can be easily spotted and if you want, you can disable it.

For example, Ksnip is a screenshot utility and it also has networking access to share the screenshots with online services like Imgur. If you do not need it, you can disable it.

![Control permissions of individual Flatpak apps][5]

If nothing else, it is interesting to see what kind of permissions an application has. For example, you can see that ksnip has the ability to run in the background (so that you can use it for taking screenshots with keyboard shortcuts).

![][6]

### Installing Flatseal

Since it’s all about Flatpak, it only makes sense that Flatseal is available as a Flatpak package.

On Fedora, if the Flathub repo is added, you can install it from the software center.

![Installing Flatseal from the software center][7]

Otherwise, the command line is always there to help you.

```

    flatpak install flathub com.github.tchx84.Flatseal

```

### Do you really need to control permissions?

That’s a subjective question and it totally depends on you. Thankfully, the desktop Linux apps are not as abusive as Android apps so far.

An average user usually does not bother with these things and that’s totally fine.

However, if you are overly cautious about these things or you find a good reason, Flatseal provides the easy option.

You should also be careful about what permissions you are changing. If you disable a permission crucial to the functioning of the application, it will surely cause trouble while using the application.

So, overall, this is not something an average user is going to use.

--------------------------------------------------------------------------------

via: https://itsfoss.com/flatseal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-flatpak/
[2]: https://itsfoss.com/flatpak-guide/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatseal.png?resize=800%2C474&ssl=1
[4]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-permission-control-flatseal.png?resize=800%2C503&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-permissions-with-flatseal.png?resize=800%2C441&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-flatseal.png?resize=800%2C467&ssl=1
