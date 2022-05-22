[#]: subject: (Access freenode using Matrix clients)
[#]: via: (https://fedoramagazine.org/access-freenode-using-matrix-clients/)
[#]: author: (TheEvilSkeleton https://fedoramagazine.org/author/theevilskeleton/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Access freenode using Matrix clients
======

![][1]

Fedora Linux 34 Background with freenode and Matrix logos

Matrix (also written [matrix]) is [an open source project][2] and [a communication protocol][3]. The protocol standard is open and it is free to use or implement. Matrix is being recognized as a modern successor to the older [Internet Relay Chat (IRC)][4] protocol. [Mozilla][5], [KDE][6], [FOSDEM][7] and [GNOME][8] are among several large projects that have started using chat clients and servers that operate over the Matrix protocol. Members of the Fedora project have [discussed][9] whether or not the community should switch to using the Matrix protocol.

The Matrix project has implemented an IRC bridge to enable communication between IRC networks (for example, [freenode][10]) and [Matrix homeservers][11]. This article is a guide on how to register, identify and join freenode channels from a Matrix client via the [Matrix IRC bridge][12].

Check out _[Beginner’s guide to IRC][13]_ for more information about IRC.

### Preparation

You need to set everything up before you register a nick. A nick is a username.

#### Install a client

Before you use the IRC bridge, you need to install a Matrix client. This guide will use Element. Other [Matrix clients][14] are available.

First, install the Matrix client _Element_ from [Flathub][15] on your PC. Alternatively, browse to [element.io][16] to run the Element client directly in your browser.

Next, click _Create Account_ to register a new account on matrix.org (a homeserver hosted by the Matrix project).

#### Create rooms

For the IRC bridge, you need to create rooms with the required users.

First, click the ➕ (plus) button next to _People_ on the left side in Element and type _@appservice-irc:matrix.org_ in the field to create a new room with the user.

Second, create another new room with _@freenode_NickServ:matrix.org_.

### Register a nick at freenode

If you have already registered a nick at freenode, skip the remainder of this section.

Registering a nickname is optional, but strongly recommended. Many freenode channels require a registered nickname to join.

First, open the room with _appservice-irc_ and enter the following:

```
!nick <your_nick>
```

Substitute _&lt;your_nick&gt;_ with the username you want to use. If the nick is already taken, _NickServ_ will send you the following message:

```
This nickname is registered. Please choose a different nickname, or identify via /msg NickServ identify <password>.
```

If you receive the above message, use another nick.

Second, open the room with _NickServ_ and enter the following:

```
REGISTER <your_password> <your_email@example.com>
```

You will receive a verification email from freenode. The email will contain a verification command similar to the following:

```
/msg NickServ VERIFY REGISTER <your_nick> <verification_code>
```

Ignore _/msg NickServ_ at the start of the command. Enter the remainder of the command in the room with _NickServ_. Be quick! You will have 24 hours to verify before the code expires.

### Identify your nick at freenode

If you just registered a new nick using the procedure in the previous section, then you should already be identified. If you are already identified, skip the remainder of this section.

First, open the room with _@appservice-irc:matrix.org_ and enter the following:

```
!nick <your_nick>
```

Next, open the room with _@freenode_NickServ:matrix.org_ and enter the following:

```
IDENTIFY <your_nick> <your_password>
```

### Join a freenode channel

To join a freenode channel, press the ➕ (plus) button next to _Rooms_ on the left side in Element and type _#freenode_#&lt;your_channel&gt;:matrix.org_. Substitute _&lt;your_channel&gt;_ with the freenode channel you want to join. For example, to join the _#fedora_ channel, use _#freenode_#fedora:matrix.org_. For a list of Fedora Project IRC channels, see _[Communicating_and_getting_help — IRC_for_interactive_community_support][17]_.

### Further reading

  * [Matrix IRC wiki][18]



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/access-freenode-using-matrix-clients/

作者：[TheEvilSkeleton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/freenode-matrix-816x345.jpeg
[2]: https://matrix.org/
[3]: https://matrix.org/docs/spec/
[4]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[5]: https://matrix.org/blog/2019/12/19/welcoming-mozilla-to-matrix/
[6]: https://matrix.org/blog/2019/02/20/welcome-to-matrix-kde/
[7]: https://matrix.org/blog/2021/01/04/taking-fosdem-online-via-matrix
[8]: https://wiki.gnome.org/Initiatives/Matrix
[9]: https://discussion.fedoraproject.org/t/the-future-of-real-time-chat-discussion-for-the-fedora-council/24628
[10]: https://en.wikipedia.org/wiki/Freenode
[11]: https://en.wikipedia.org/wiki/Matrix_(protocol)#Servers
[12]: https://github.com/matrix-org/matrix-appservice-irc
[13]: https://fedoramagazine.org/beginners-guide-irc/
[14]: https://matrix.org/clients/
[15]: https://flathub.org/apps/details/im.riot.Riot
[16]: https://app.element.io/
[17]: https://fedoraproject.org/wiki/Communicating_and_getting_help#IRC_for_interactive_community_support
[18]: https://github.com/matrix-org/matrix-appservice-irc/wiki
