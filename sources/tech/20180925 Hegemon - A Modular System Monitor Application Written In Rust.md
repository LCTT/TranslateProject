translating---geekpi

Hegemon – A Modular System Monitor Application Written In Rust
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/hegemon-720x340.png)

When it comes to monitor running processes in Unix-like systems, the most commonly used applications are **top** and **htop** , which is an enhanced version of top. My personal favorite is htop. However, the developers are releasing few alternatives to these applications every now and then. One such alternative to top and htop utilities is **Hegemon**. It is a modular system monitor application written using **Rust** programming language.

Concerning about the features of Hegemon, we can list the following:

  * Hegemon will monitor the usage of CPU, memory and Swap.
  * It monitors the system’s temperature and fan speed.
  * The update interval time can be adjustable. The default value is 3 seconds.
  * We can reveal more detailed graph and additional information by expanding the data streams.
  * Unit tests
  * Clean interface
  * Free and open source.



### Installing Hegemon

Make sure you have installed **Rust 1.26** or later version. To install Rust in your Linux distribution, refer the following guide:

[Install Rust Programming Language In Linux][2]

Also, install [libsensors][1] library. It is available in the default repositories of most Linux distributions. For example, you can install it in RPM based systems such as Fedora using the following command:

```
$ sudo dnf install lm_sensors-devel
```

On Debian-based systems like Ubuntu, Linux Mint, it can be installed using command:

```
$ sudo apt-get install libsensors4-dev
```

Once you installed Rust and libsensors, install Hegemon using command:

```
$ cargo install hegemon
```

Once hegemon installed, start monitoring the running processes in your Linux system using command:

```
$ hegemon
```

Here is the sample output from my Arch Linux desktop.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Hegemon-in-action.gif)

To exit, press **Q**.


Please be mindful that hegemon is still in its early development stage and it is not complete replacement for **top** command. There might be bugs and missing features. If you came across any bugs, report them in the project’s github page. The developer is planning to bring more features in the upcoming versions. So, keep an eye on this project.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/hegemon-a-modular-system-monitor-application-written-in-rust/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://github.com/lm-sensors/lm-sensors
[2]: https://www.ostechnix.com/install-rust-programming-language-in-linux/
