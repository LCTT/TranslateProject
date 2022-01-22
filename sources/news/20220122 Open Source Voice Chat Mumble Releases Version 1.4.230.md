[#]: subject: "Open Source Voice Chat Mumble Releases Version 1.4.230"
[#]: via: "https://news.itsfoss.com/mumble-releases-version-1-4-230/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open Source Voice Chat Mumble Releases Version 1.4.230
======

Recently, the devs behind Mumble [announced][1] the release of version 1.4.230, which introduces a series of updates, improvements, and fixes. For those who are unfamiliar with Mumble, it is one of the top open source voice chat apps available. This newest release came about after two years of development. That is much quicker than the [10 years it took for 1.3.0 to be released][2].

### New Numbering Convention

Before we get started, I’d to note that Mumble has introduced a new versioning scheme. That’s why I typed 1.4.230 above instead of 1.4.0.

According to a [blog post][3] that the devs published in December, they made this change due to problems they encountered with Windows. Previously, the devs have used the semantic versioning scheme. This involved using a series of three numbers to denote major version, minor version, and patch number. However, this naming convention causes issues when they create a development snapshot, their version of a beta. When that happens, they add a fourth number representing build number.

This system worked well on Linux, but causes issues on Windows. Windows limits version numbers to three numbers. This led to Windows installing “an additional version of Mumble alongside the already installed version if one was to attempt to upgrade between Mumble versions that only differed in the build number.”

The solution that the Mumble devs came up with was to change their numbering convention so that the third would represent the build number. So, now the format is major version, minor version, and build number. Thus, the latest release is 1.4.230.

### New Features

Let me quickly list the new features.

#### Plugin Framework

Mumble’s plugin framework has been revamped in this latest version. Previously, the plugins were limited to “providing positional data from games”. These plugins also could not be updated separately from the main application.

The newly updated plugin framework now allows for the creation of more diverse plugins. Plugins can now be installed or updated at any time. Those who are interested in learning how to create plugins for Mumble can check out the [plugin documentation][4].

#### Search Function

Mumble search function used to be buggy and unstable. This latest release fixes those issues. Mumble now has a fully featured search dialog box that can either be opened from the menu bar or by using the `Ctrl + F` shortcut. `Ctrl + F` had previously been used to activate the channel filter, but that feature had been moved to `Ctrl + Shift + F`.

#### Listeners

The Mumble devs have added a feature that allows a user to listen to a channel. This is intended to be one-way only, meaning that you can listen to the channel, but not communicate with the people on that channel. The members of the channel are made aware of the listeners via the channel’s user list. However, older Mumble clients will not show listeners on the user list. User of older clients will be notified if the listen function is activated in a channel via chat.

#### TalkingUI

This feature allows users to quickly determine who is speaking. It adds an “optional floating window, containing a list of currently speaking users and their respective channels”. That information is already available from Mumble main interface, but is intended for everyday use. TalkingUI resizes itself to ensure that it only takes up enough space to show the required information.

#### Access Restriction UI Updates

On previous version of Mumble, you could not tell if a channel was access restricted, for example if a user needed a password to join. A user would have to try to join to see whether it was restricted or not. Now, it will display a lock icon to show that the channel is access restricted. This only works if the Mumble server is 1.4.x.

#### Markdown Support

Mumble now supports the use of Markdown in the chat bar. Unfortunately, this addition only includes a subset of Markdown, including “sections, inline-code, code-blocks, bold, italic and strike-through text, links and quotes”.

#### Stereo Playback

Mumble now supports stereo audio streams. This means a user can “send a stereo stream to a Mumble client and it will actually be played back without being mixed down to a mono stream”. However, this feature is limited to playback and is intended to be used “by (music) bots”.

#### Nicknames

Finally, users can assign nicknames to other users. The nickname can either be displayed next to the username or replace it. The nicknames will stay after both the server and client have been restarted because they are tied to the nicknamed user’s client-certificate.

You find the complete changelog [here][1].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mumble-releases-version-1-4-230/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://www.mumble.info/blog/mumble-1.4.230/
[2]: https://itsfoss.com/mumble-voice-chat/
[3]: https://www.mumble.info/blog/new-versioning-scheme/
[4]: https://github.com/mumble-voip/mumble/tree/master/docs/dev/plugins
