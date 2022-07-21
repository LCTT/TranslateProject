[#]: subject: "Fedora and Parental Controls"
[#]: via: "https://fedoramagazine.org/fedora-36-and-parental-controls/"
[#]: author: "Kevin Degeling https://fedoramagazine.org/author/eonfge/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora and Parental Controls
======

![Two cudly penguins][1]

Photo by [Torsten Dederichs][2] on [Unsplash][3], font is [josefin-slab][4]

We all have people around us, whom we hold dear. Some of them might even rely on you to keep them save. And since the world is constantly changing, that can be a challenge. No more is this apparent than with children, and Linux has long been lacking simple tools to help parents. But that is changing, and here we’ll talk about the new parental controls that Fedora Linux provides.

### Users and permissions

First, it’s important to know that any Linux system has a lot of options for user, group, and permission management. Many of these advanced tools are aimed at [professional users][5], though, and we won’t be talking about those here. In this article we’ll focus on home users.

Additionally, parental controls are not just useful for parents. You can use them when helping family members who are technically illiterate. Or perhaps you want to configure a basic workstation for simple administrative tasks. Either way, parental control can offer many security and reliability benefits.

#### Creating users

From the _Settings_ panel, you can navigate to _Users_ and from there you can select _Add User…_ (after unlocking) to add a new user. You can give them a personal name, a username and their own icon. You can even decide if somebody else should also be an administrator.

![Adding a user to your machine is as simple as going to settings, users, and clicking Add User…][6]

You can also set a default password, or even allow a computer to automatically log in. You should help others understand digital security and the value of passwords, but for some people it might be better to just auto-login.

#### Admin rights

When you give somebody administrator rights, that user will have the same powers as you have on the system. They will be able to make any system change they prefer, and they can also add and remove users themselves.

Users who do not have admin rights, will not be able to make fundamental changes to the computer. They can still use all applications that are already on the system, and they can even download applications from the internet to their home folder. Still, they are ultimately blocked from doing anything that could damage the system.

![Accessing the user-directories of others. Only administrator users will be able to do this.][7]

Don’t forget that as an administrator, you can always reset a password. You can also enter another user’s home directory in case you have to. As with all ‘sudo’ rights, you should be careful and you should be considerate of other’s privacy.

### Application control

Once one or multiple users are created, you can choose to tweak and control what applications somebody can use. This is done from within _Settings > Users_ by selecting the new user then selecting _Parental Controls_ and then _Restrict Applications._ Other options are available there, as well.

![changing Parental Controls for a single user.][8]

### However, there is a big caveat

Parental controls come with a big caveat: If you want a simple home-user solution, you MUST use Flatpaks.

The problem is as follows. The existing Linux application landscape is quite complex, and it would be almost impossible to introduce a new user-friendly application-control system this late into its life cycle. Thus, the second best solution is to ensure that the next generation of packaging has such functionality from the start.

To use Flatpaks, you can use the Fedora’s repository, or the [Flathub repository][9]. If you want to know all the fine details about those projects, then don’t forget to read this [recent comparison][10].

### Compromise and limitations

No article would be complete without mentioning the inherit limitations of the parental controls. Besides all the obvious limits of computers not knowing right from wrong, there are also some technical limits to parental controls.

#### Parental Control’s limits

The security that Parental Controls provides will only work as long as Fedora Linux is running in working order. One could easily bypass all controls by flashing Fedora on a USB stick and starting from a clean, root-powered, installation image. At this point, human supervision is still superior to the machine’s rules.

Adding to that, there are the obvious issues of browsers, store fronts like Steam, and other on-line applications. You can’t block just parts of these applications. Minecraft is a great game for children, but it also allows direct communication with other people. Thus, you’ll have to constantly juggle permissions. Here too, it is better to focus on the human element instead of relying to much on the tools.

Finally, don’t forget about protecting the privacy and well-being of others online. Blocking bad actors with [Ublock Origin][11] and/or a [DNS based blocker][12] will also help a lot.

#### Legacy applications

As mentioned before, Fedora and Parental Controls only work with Flatpaks. Every application that is already on the system can be started by users who otherwise don’t have the permissions.

As a rule of thumb; If you want to share a computer with vulnerable family members, don’t install any software that’s inappropriate using the RPM Repositories. Instead, consider using a Flatpak.

![Starting the system-wide installation of Firefox from the Terminal. The Flatpak version of Firefox though, will not start.][13]

### Summary

There is much that you can do to help those who are less experienced with computers. By simply giving these users their own account and using Flatpaks, you can make their lives a lot easier. Age restrictions can even offer additional benefits. But it’s not all perfect, and good communication and supervision will still be important.

The Parental Controls will improve over time. They have been given more priority in the past few years and there are additional plans. Time-tracking is, for example planned. As the migration to Flatpaks continues, you can expect that more software will respect age-restrictions in the future.

#### Additional US and UK resources

  * <https://www.commonsensemedia.org/articles>
  * <https://saferinternet.org.uk/guide-and-resource/>



![Sharing Fedora Linux with Parental Controls][14]

_So, let’s start a small collaboration here. We’ve all been younger, so how did you escape your parents’ scrutiny? And for those who are taking care of others… how are you helping others? Let’s see what we can learn from each other._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-36-and-parental-controls/

作者：[Kevin Degeling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/07/fedora-and-parental-control-816x345.jpg
[2]: https://unsplash.com/photos/3dDa9p4FU9U
[3]: https://unsplash.com
[4]: https://fonts.google.com/specimen/Josefin+Slab
[5]: https://fedoramagazine.org/managing-user-accounts-with-cockpit/
[6]: https://fedoramagazine.org/wp-content/uploads/2022/07/Composition_01-1024x586.png
[7]: https://fedoramagazine.org/wp-content/uploads/2022/07/Screenshot-from-2022-07-13-19-56-52.png
[8]: https://fedoramagazine.org/wp-content/uploads/2022/07/Composition_02-1.png
[9]: https://flathub.org/home
[10]: https://fedoramagazine.org/comparison-of-fedora-flatpaks-and-flathub-remotes/
[11]: https://ublockorigin.com/
[12]: https://avoidthehack.com/best-dns-privacy
[13]: https://fedoramagazine.org/wp-content/uploads/2022/07/Screenshot-from-2022-07-13-19-39-12-1024x524.png
[14]: https://fedoramagazine.org/wp-content/uploads/2022/07/desktop-1024x524.png
