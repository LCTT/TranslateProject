[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Collaborate on text with Etherpad, an open source alternative to Google Docs)
[#]: via: (https://opensource.com/article/20/12/etherpad)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Collaborate on text with Etherpad, an open source alternative to Google Docs
======
Etherpad is a great text editor for working collaboratively in the cloud
or using someone else's machine.
![a checklist for a team][1]

Sometimes you just have to edit text on the cloud. Maybe you're using a computer you don't own to work on a document you want to keep. Maybe you need to collaborate with other people on a shared document. Or maybe your primary computing interface is a web browser, and you have no interest in using local applications or local storage.

For many reasons, it's pretty common these days to use the network as your computer, and it's always important to have open source tools for your work. For several years now, I've been a happy Nextcloud user—and a serious user of its default text editor, but it is not a public platform by design. So for collaboration with friends and colleagues, I use [Etherpad][2].

### Install Etherpad

Etherpad is open source, which is often a difficult concept to understand when talking about online tools. Whether a web app is or is not open source rarely seems to matter much because you're using an app installed on somebody else's server (or [cluster][3], in many cases). You don't actually own any cloud service, and if the service disappears, then quite probably the data you stored there will also disappear. However, you _can_ take ownership of open source services because you can install them on your own server or cluster. And with Etherpad, you can export your work even when you're using someone else's installation.

If you run your own server or cloud, you can [download][4] the latest version from Etherpad's website. It's written in Node.js and has options for running in a container, so installing it on a Linux server is easy.

### Access Etherpad without installing

You can also use Etherpad on somebody else's server. There are several instances of Etherpad on the internet that are open for public use, including [pad.riseup.net][5]. You might also consider banding together with other open source enthusiasts to host some shared services. This has been my solution lately, and I've found it to be a good compromise between running my own services and trusting someone else to run everything for me.

### Start a new document

To start using Etherpad, navigate to a public Etherpad instance and follow its instructions. Usually, the instructions are to type a unique name for your document and get to work, but some instances may require you to sign up for a login account.

Once you get used to Etherpad, you'll find that starting a new document is also dynamic: You can just type your Etherpad document path's URL followed by what you want to name your document, and a new file will be created for you. For instance, if you're using an Etherpad instance installed at `pad.example.com`, and you know that all documents are stored at `pad.example.com/p`, then you can start a new document called `note-to-self` by navigating to `pad.example.com/p/note-to-self`. Some instances have time limits on how long a document persists, while others let you set a document's life.

If you're using a public instance, then your document is accessible to anyone. It's not readily discoverable, so you probably need to share the URL with others, but without a login, you're relying on obscurity for document security. For most collaborative tasks, this is acceptable to me, but if it's a concern to you, be sure to use an Etherpad instance that requires authorization.

### Etherpad editing features

Etherpad is light on features. Its primary benefit is that it's a real-time collaborative editor. Whether you're writing code, a business document, school papers, personal notes, or something else, it treats everything the same: as plain text. It has no syntax highlighting nor interpretive styling or rendering aside from bold, italic, underline, and strikethrough.

It does have revision control, with an easy-to-use "playback" feature that lets you step through creating a document as easily as you scan through a video or audio file.

![Etherpad playback function][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Collaborative editing

Etherpad is a collaborative editor, so you can work on the same document at the same time someone else is working on it. You see each other's changes, color-coded to identify who is doing what by default. You can change your color identifier by clicking your profile in the upper-right corner of the Etherpad interface. If you don't like seeing a document marked up with different colors, you can deactivate the feature entirely.

There's also a chat function in the Etherpad window, so you can discuss your work in a chat window rather than typing chat questions into your working document (a common hack on similar platforms).

![Etherpad][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Import and export

By default, Etherpad can import and export plaintext and HTML. This is useful for many reasons, not the least of which is your own data security. Because Etherpad exists on a cloud, and it's often not _your_ cloud, you need to make sure you've got backups of your important data.

If the Etherpad administrator has installed some extra backend applications that Etherpad can use for diverse format support, you may also be able to import and export ODT (a common LibreOffice format) and other popular document types.

### Write on the cloud

Etherpad is an excellent tool. I use it for collaboration at work, as an easy way to develop ideas while away from my own computer, and of course, to author things like this article. When I use it, I usually forget that it's an editor in my browser because it doesn't "feel" like a browser editor to me. After I switch to another tab in my browser, I often find myself absent-mindedly pressing **Alt**+**Tab** to get back to Etherpad, thinking I've been writing in a desktop app as usual. I take that as a good sign.

If you need a reliable and pleasant editor that lives on the network, give Etherpad a try.

Take a look at five great open source alternatives to Google Docs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/etherpad

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: http://etherpad.org
[3]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[4]: https://etherpad.org/#download
[5]: https://pad.riseup.net/
[6]: https://opensource.com/sites/default/files/uploads/etherpad-revision.jpg (Etherpad playback function)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/etherpad_0.jpg (Etherpad)
