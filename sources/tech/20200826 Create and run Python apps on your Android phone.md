[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create and run Python apps on your Android phone)
[#]: via: (https://opensource.com/article/20/8/python-android-mobile)
[#]: author: (Phani Adabala https://opensource.com/users/adabala)

Create and run Python apps on your Android phone
======
Use Termux and Flask to create, develop, and run a web app on your
mobile device.
![Tux and Android stuffed animals on shelf][1]

Learning and using Python is fun. Thanks to its growing popularity, there are a plethora of ways it can be used to make the world of computing better than what it is today.

Imagine building and running python applications, whether it's a command-line tool developed to fetch your favorite curated articles from the Internet, or starting a web server that runs right in the palm of your hand, all with just an Android mobile device and open source tools. This would change how you view your mobile device entirely, changing it from a device that merely lets you consume content to a device that helps you be creative.

In this article, I'll demonstrate all of the tools, software packages, steps, and all the bells and whistles required to build, run, and test a simple Python application on any Android mobile device. I use the [Flask framework][2] to create a simple “Hello, World!” app running on a simple but powerful web server. And best of all, it all happens on the phone. No laptop or desktop required.

### Install Termux on Android

First, [install the Termux application][3]. Termux is a powerful terminal emulator that offers all the most popular Linux commands, plus hundreds of additional packages for easy installation. It doesn't require any special permissions You can use either the default [Google Play][4] store or the open source app repository [F-Droid][5] to install.

![Welcome to Termux][6]

Once you have installed Termux, launch it and perform a few requisite software installations using Termux's **pkg** command:

Subscribe to the additional repository “root-repo”:


```
`$ pkg install root-repo`
```

 Perform an update to bring all the installed software up to date:


```
`$ pkg update`
```

Finally, install Python:


```
`$ pkg install python`
```

![Install Python][7]

Once the installation and auto set-up of configuration is complete, it’s time to build your application.

### Build an app for Android on Android

Now that you have a terminal installed, you can work on your Android phone largely as if it were just another Linux computer. This is a great demonstration of just how powerful a terminal really is.

Start by creating a project directory:


```
$ mkdir Source
$ cd Source
```

Next, create a Python virtual environment. This is a common practice among Python developers, and it helps keep your Python project independent of your development system (in this case, your phone). Within your virtual environment, you'll be able to install Python modules specific to your app.


```
`$ python -m venv venv`
```

Activate your new virtual environment (note that the two dots at the start are separated by a space):


```
$ . ./venv/bin/activate
(env)$
```

Notice that your shell prompt is now preceded by **(env)** to indicate that you're in a virtual environment.

Now install the Flask Python module using **pip**:


```
`(env) $ pip install flask`
```

### Write Python code on Android

You're all set up. All you need now is to write the code for your app.

To do this, you should have experience with a classic text editor. I use **vi**. If you’re unfamiliar with **vi**, install and try the **vimtutor** application, which (as its name suggests) can teach you how to use this editor. If you have a different editor you prefer, such as **jove**, **jed**, **joe**, or **emacs**, you can install and use one of those instead.

For now, because this demonstration app is so simple, you can also just use the shell's **heredoc** function, which allows you to enter text directly at your prompt:


```
(env)$ cat &lt;&lt; EOF &gt;&gt; hello_world.py
&gt; from flask import Flask
&gt; app = Flask(__name__)
&gt;
&gt; @app.route('/')
&gt; def hello_world():
&gt;     return 'Hello, World!'
&gt; EOF
(env)$
```

That's just six lines of code, but with that you import Flask, create an app, and route incoming traffic to the function called **hello_world**.

![Vim on Android][8]

Now you have the web-server code ready. It's time to set up some [environment variables][9] and start a web server on your phone.


```
(env) $ export FLASK_APP=hello_world.py
(env) $ export FLASK_ENV=development
(evn) $ python hello_world.py
```

![Running a Flask app on your phone][10]

After starting your app, you see this message:


```
`serving Flask app… running on http://127.0.0.1:5000/`
```

This indicates that you now have a tiny web server running on **localhost** (that is, your device). This server is listening for requests looking for port 5000.

Open your mobile browser and navigate to **<http://localhost:5000>** to see your web app.

![Your web app][11]

You haven't compromised your phone's security. You're only running a local server, meaning that your phone isn't accepting requests from the outside world. Only you can access your Flask server.

To make your server visible to others, you can disable Flask's debugging mode by adding **\--host=0.0.0.0** to the **run** command. This does open ports on your phone, so use this wisely.


```
(env) $ export FLASK_ENV=””
(env) $ flask run –host=0.0.0.0
```

Stop the server by pressing **Ctrl+C** (use the special Termux key for Control).

### Decide what comes next

Your phone is probably not the ideal server platform for a serious web app, but this demonstrates that the possibilities are endless. You might program on your Android phone just because it’s a convenient way to stay in practice, or because you have an exciting new idea for localized web apps, or maybe you just happen to use a Flask app for your own daily tasks. As Einstein once said “Imagination is more important than knowledge”, and this is a fun little project for any new coder, or a seasoned Linux or Android enthusiast. It can be expanded to endless levels, so let your curiosity take over, and make something exciting!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/python-android-mobile

作者：[Phani Adabala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adabala
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_penguin_linux_android.jpg?itok=ctgANLI7 (Tux and Android stuffed animals on shelf)
[2]: https://opensource.com/article/18/4/flask
[3]: https://opensource.com/article/20/8/termux
[4]: https://play.google.com/store/apps/details?id=com.termux
[5]: https://f-droid.org/repository/browse/?fdid=com.termux
[6]: https://opensource.com/sites/default/files/termux-flask-1_0.webp (Welcome to Termux)
[7]: https://opensource.com/sites/default/files/termux-install-python.webp (Install Python)
[8]: https://opensource.com/sites/default/files/termux-python-vim.webp (Vim on Android)
[9]: https://opensource.com/article/19/8/what-are-environment-variables
[10]: https://opensource.com/sites/default/files/termux-flask-run.webp (Running a Flask app on your phone)
[11]: https://opensource.com/sites/default/files/flask-app-android.webp (Your web app)
