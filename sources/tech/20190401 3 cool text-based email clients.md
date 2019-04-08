[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 cool text-based email clients)
[#]: via: (https://fedoramagazine.org/3-cool-text-based-email-clients/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

3 cool text-based email clients
======

![][1]

Writing and receiving email is a big part of everyone’s daily routine and choosing an email client is usually a major decision. The Fedora OS provides a large choice of email clients and among these are text-based email applications.

### Mutt

Mutt is probably one of the most popular text-based email clients. It supports all the common features that one would expect from an email client. Color coding, mail threading, POP3, and IMAP are all supported by Mutt. But one of its best features is it’s highly configurable. Indeed, the user can easily change the keybindings, and create macros to adapt the tool to a particular workflow.

To give Mutt a try, install it [using sudo][2] and dnf:

```
$ sudo dnf install mutt
```

To help newcomers get started, Mutt has a very comprehensive [wiki][3] full of macro examples and configuration tricks.

### Alpine

Alpine is also among the most popular text-based email clients. It’s more beginner friendly than Mutt, and you can configure most of Alpine via the application itself — no need to edit a configuration file. One powerful feature of Alpine is the ability to score emails. This is particularly interesting for users that are registered to a high volume mailing list like Fedora’s [devel list][4]. Using scores, Alpine can sort the email based on the user’s interests, showing emails with a high score first.

Alpine is also available to install from Fedora’s repository using dnf.

```
$ sudo dnf install alpine
```

While using Alpine, you can easily access the documentation by pressing the _Ctrl+G_ key combination.

### nmh

nmh (new Mail Handling) follows the UNIX tools philosophy. It provides a collection of single purpose programs to send, receive, save, retrieve, and manipulate e-mail messages. This lets you swap the _nmh_ command with other programs, or create scripts around _nmh_ to create more customized tools. For example, you can use Mutt with nmh.

nmh can be easily installed using dnf.

```
$ sudo dnf install nmh
```

To learn more about nmh and mail handling in general you can read this GPL licenced [book][5].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-cool-text-based-email-clients/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/07/email-clients-816x345.png
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://gitlab.com/muttmua/mutt/wikis/home
[4]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
[5]: https://rand-mh.sourceforge.io/book/
