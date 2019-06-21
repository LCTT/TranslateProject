[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Personal assistant with Mycroft and Fedora)
[#]: via: (https://fedoramagazine.org/personal-assistant-with-mycroft-and-fedora/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

Personal assistant with Mycroft and Fedora
======

![][1]

Looking for an open source personal assistant ? [Mycroft][2] is allowing you to run an open source service which gives you better control of your data.

### Install Mycroft on Fedora

Mycroft is currently not available in the official package collection, but it can be easily installed from the project source. The first step is to download the source from Mycroft’s GitHub repository.

```
$ git clone https://github.com/MycroftAI/mycroft-core.git
```

Mycroft is a Python application and the project provides a script that takes care of creating a virtual environment before installing Mycroft and its dependencies.

```
$ cd mycroft-core
$ ./dev_setup.sh
```

The installation script prompts the user to help him with the installation process. It is recommended to run the stable version and get automatic updates.

When prompted to install locally the Mimic text-to-speech engine, answer No. Since as described in the installation process this can take a long time and Mimic is available as an rpm package in Fedora so it can be installed using dnf.

```
$ sudo dnf install mimic
```

### Starting Mycroft

After the installation is complete, the Mycroft services can be started using the following script.

```
$ ./start-mycroft.sh all
```

In order to start using Mycroft the device running the service needs to be registered. To do that an account is needed and can be created at <https://home.mycroft.ai/>.

Once the account created, it is possible to add a new device at the following address [https://account.mycroft.ai/devices.][3] Adding a new device requires a pairing code that will be spoken to you by your device after starting all the services.

![][4]

The device is now ready to be used.

### Using Mycroft

Mycroft provides a set of [skills][5] that are enabled by default or can be downloaded from the [Marketplace][5]. To start you can simply ask Mycroft how is doing, or what the weather is.

```
Hey Mycroft, how are you ?

Hey Mycroft, what's the weather like ?
```

If you are interested in how things works, the _start-mycroft.sh_ script provides a _cli_ option that lets you interact with the services using the command line. It is also displaying logs which is really useful for debugging.

Mycroft is always trying to learn new skills, and there are many way to help by [contributing][6] the Mycroft community.

* * *

Photo by [Przemyslaw Marczynski][7] on [Unsplash][8]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/personal-assistant-with-mycroft-and-fedora/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/mycroft-816x345.jpg
[2]: https://mycroft.ai/
[3]: https://account.mycroft.ai/devices
[4]: https://fedoramagazine.org/wp-content/uploads/2019/06/Screenshot_2019-06-14-Account.png
[5]: https://market.mycroft.ai/skills
[6]: https://mycroft.ai/contribute/
[7]: https://unsplash.com/@pemmax?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/ai?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
