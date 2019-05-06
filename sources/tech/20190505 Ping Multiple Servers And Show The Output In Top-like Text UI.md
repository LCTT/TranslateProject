[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ping Multiple Servers And Show The Output In Top-like Text UI)
[#]: via: (https://www.ostechnix.com/ping-multiple-servers-and-show-the-output-in-top-like-text-ui/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Ping Multiple Servers And Show The Output In Top-like Text UI
======

![Ping Multiple Servers And Show The Output In Top-like Text UI][1]

A while ago, we wrote about [**“Fping”**][2] utility which enables us to ping multiple hosts at once. Unlike the traditional **“Ping”** utility, Fping doesn’t wait for one host’s timeout. It uses round-robin method. Meaning – It will send the ICMP Echo request to one host, then move to the another host and finally display which hosts are up or down at a time. Today, we are going to discuss about a similar utility named **“Pingtop”**. As the name says, it will ping multiple servers at a time and show the result in Top-like Terminal UI. It is free and open source, command line program written in **Python**.

### Install Pingtop

Pingtop can be installed using Pip, a package manager to install programs developed in Python. Make sure sure you have installed Python 3.7.x and Pip in your Linux box.

To install Pip on Linux, refer the following link.

  * [**How To Manage Python Packages Using Pip**][3]



Once Pip is installed, run the following command to install Pingtop:

```
$ pip install pingtop
```

Now let us go ahead and ping multiple systems using Pingtop.

### Ping Multiple Servers And Show The Output In Top-like Terminal UI

To ping mulstiple hosts/systems, run:

```
$ pingtop ostechnix.com google.com facebook.com twitter.com
```

You will now see the result in a nice top-like Terminal UI as shown in the following output.

![][4]

Ping multiple servers using Pingtop

* * *

**Suggested read:**

  * [**Some Alternatives To ‘top’ Command line Utility You Might Want To Know**][5]



* * *

I personally couldn’t find any use cases for Pingtop utility at the moment. But I like the idea of showing the ping command’s output in text user interface. Give it a try and see if it helps.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!

**Resource:**

  * [**Pingtop GitHub Repository**][6]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ping-multiple-servers-and-show-the-output-in-top-like-text-ui/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/pingtop-720x340.png
[2]: https://www.ostechnix.com/ping-multiple-hosts-linux/
[3]: https://www.ostechnix.com/manage-python-packages-using-pip/
[4]: http://www.ostechnix.com/wp-content/uploads/2019/04/pingtop-1.gif
[5]: https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/
[6]: https://github.com/laixintao/pingtop
