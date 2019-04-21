[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Git as the backend for chat)
[#]: via: (https://opensource.com/article/19/4/git-based-chat)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

Use Git as the backend for chat
======
GIC is a prototype chat application that showcases a novel way to use Git.
![Team communication, chat][1]

[Git][2] is one of those rare applications that has managed to encapsulate so much of modern computing into one program that it ends up serving as the computational engine for many other applications. While it's best-known for tracking source code changes in software development, it has many other uses that can make your life easier and more organized. In this series leading up to Git's 14th anniversary on April 7, we'll share seven little-known ways to use Git. Today, we'll look at GIC, a Git-based chat application

### Meet GIC

While the authors of Git probably expected frontends to be created for Git, they undoubtedly never expected Git would become the backend for, say, a chat client. Yet, that's exactly what developer Ephi Gabay did with his experimental proof-of-concept [GIC][3]: a chat client written in [Node.js][4] using Git as its backend database.

GIC is by no means intended for production use. It's purely a programming exercise, but it's one that demonstrates the flexibility of open source technology. What's astonishing is that the client consists of just 300 lines of code, excluding the Node libraries and Git itself. And that's one of the best things about the chat client and about open source; the ability to build upon existing work. Seeing is believing, so you should give GIC a look for yourself.

### Get set up

GIC uses Git as its engine, so you need an empty Git repository to serve as its chatroom and logger. The repository can be hosted anywhere, as long as you and anyone who needs access to the chat service has access to it. For instance, you can set up a Git repository on a free Git hosting service like GitLab and grant chat users contributor access to the Git repository. (They must be able to make commits to the repository, because each chat message is a literal commit.)

If you're hosting it yourself, create a centrally located bare repository. Each user in the chat must have an account on the server where the bare repository is located. You can create accounts specific to Git with Git hosting software like [Gitolite][5] or [Gitea][6], or you can give them individual user accounts on your server, possibly using **git-shell** to restrict their access to Git.

Performance is best on a self-hosted instance. Whether you host your own or you use a hosting service, the Git repository you create must have an active branch, or GIC won't be able to make commits as users chat because there is no Git HEAD. The easiest way to ensure that a branch is initialized and active is to commit a README or license file upon creation. If you don't do that, you can create and commit one after the fact:

```
$ echo "chat logs" > README
$ git add README
$ git commit -m 'just creating a HEAD ref'
$ git push -u origin HEAD
```

### Install GIC

Since GIC is based on Git and written in Node.js, you must first install Git, Node.js, and the Node package manager, npm (which should be bundled with Node). The command to install these differs depending on your Linux or BSD distribution, but here's an example command on Fedora:

```
$ sudo dnf install git nodejs
```

If you're not running Linux or BSD, follow the installation instructions on [git-scm.com][7] and [nodejs.org][8].

There's no install process, as such, for GIC. Each user (Alice and Bob, in this example) must clone the repository to their hard drive:

```
$ git cone https://github.com/ephigabay/GIC GIC
```

Change directory into the GIC directory and install the Node.js dependencies with **npm** :

```
$ cd GIC
$ npm install
```

Wait for the Node modules to download and install.

### Configure GIC

The only configuration GIC requires is the location of your Git chat repository. Edit the **config.js** file:

```
module.exports = {
gitRepo: '[seth@example.com][9]:/home/gitchat/chatdemo.git',
messageCheckInterval: 500,
branchesCheckInterval: 5000
};
```


Test your connection to the Git repository before trying GIC, just to make sure your configuration is sane:

```
$ git clone --quiet seth@example.com:/home/gitchat/chatdemo.git > /dev/null
```

Assuming you receive no errors, you're ready to start chatting.

### Chat with Git

From within the GIC directory, start the chat client:

```
$ npm start
```

When the client first launches, it must clone the chat repository. Since it's nearly an empty repository, it won't take long. Type your message and press Enter to send a message.

![GIC][10]

A Git-based chat client. What will they think of next?

As the greeting message says, a branch in Git serves as a chatroom or channel in GIC. There's no way to create a new branch from within the GIC UI, but if you create one in another terminal session or in a web UI, it shows up immediately in GIC. It wouldn't take much to patch some IRC-style commands into GIC.

After chatting for a while, take a look at your Git repository. Since the chat happens in Git, the repository itself is also a chat log:

```
$ git log --pretty=format:"%p %cn %s"
4387984 Seth Kenlon Hey Chani, did you submit a talk for All Things Open this year?
36369bb Chani No I didn't get a chance. Did you?
[...]
```

### Exit GIC

Not since Vim has there been an application as difficult to stop as GIC. You see, there is no way to stop GIC. It will continue to run until it is killed. When you're ready to stop GIC, open another terminal tab or window and issue this command:

```
$ kill `pgrep npm`
```

GIC is a novelty. It's a great example of how an open source ecosystem encourages and enables creativity and exploration and challenges us to look at applications from different angles. Try GIC out. Maybe it will give you ideas. At the very least, it's a great excuse to spend an afternoon with Git.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/git-based-chat

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://git-scm.com/
[3]: https://github.com/ephigabay/GIC
[4]: https://nodejs.org/en/
[5]: http://gitolite.com
[6]: http://gitea.io
[7]: http://git-scm.com
[8]: http://nodejs.org
[9]: mailto:seth@example.com
[10]: https://opensource.com/sites/default/files/uploads/gic.jpg (GIC)
