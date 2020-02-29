[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use logzero for simple logging in Python)
[#]: via: (https://opensource.com/article/20/2/logzero-python)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

Use logzero for simple logging in Python
======
A quick primer on the handy log library that can help you master this
important programming concept.
![Snake charmer cartoon with a yellow snake and a blue snake][1]

The logzero library makes logging as easy as a print statement, which is quite a feat of simplicity. I'm not sure whether logzero took its name to fit in with the series of "zero boilerplate" libraries like pygame-zero, GPIO Zero, and guizero, but it's certainly in that category. It's a Python library that makes logging straightforward.

You can just use its basic logging to stdout the same way you might use print for information and debugging purposes, and it has a smooth learning curve towards more advanced logging, like logging to a file.

To start, install logzero with pip:


```
`$ sudo pip3 install logzero`
```

Now in a Python file, import logger and try one or all of these logging examples:


```
from logzero import logger

logger.debug("hello")
logger.info("info")
logger.warning("warning")
logger.error("error")
```

The output is automatically colored in an easy-to-read way:

![Python, Raspberry Pi: import logger][2]

So now, instead of using **print** to figure out what's going on, use logger instead, with the relevant log level.

### Writing logs to a file in Python

If you only read this far and make that one change in the way you write code, that's good enough for me. If you want to go further, read on!

Writing to **stdout** is fun for testing a new program, but it is only useful if you are logged into the computer where the script is running. Many times when using an application you'll want to execute the code remotely and review errors after the fact. That's when it's helpful to log to a file instead. Let's try it:


```
from logzero import logger, logfile

logfile('/home/pi/test.log')
```

Now your log entries will be logged into the file **test.log**. Remember to make sure that the [script has permission][3] to write to that file and its directory structure.

You can specify some more options too:


```
`logfile(’/home/pi/test.log’, maxBytes=1e6, backupCount=3)`
```

Now when the file provided to **logfile** reaches 1MB (1×106 bytes), it will rotate entries through **test.log.1**, **test.log.2**, and so on. This behavior is nice to avoid generating a massive log file that is I/O intensive for the system to open and close. You might also want to log to **/var/log** like a pro. Assuming you're on Linux, you a directory and make your user the owner so they can write to it:


```
$ sudo mkdir /var/log/test
$ sudo chown pi /var/log/test
```

Then in your Python code, change the **logfile** path:


```
`logfile(’/var/log/test/test.log’, maxBytes=1e6, backupCount=3)`
```

When it comes to catching exceptions in your **logfile**, you can either use **logging.exception:**


```
try:
    c = a / b
except Exception as e:
    logger.exception(e)
```

This will produce the following (in the case that b is zero):


```
[E 190422 23:41:59 test:9] division by zero
     Traceback (most recent call last):
       File "test.py", line 7, in
         c = a / b
     ZeroDivisionError: division by zero
```

You get the log entry, followed by the full traceback. Alternatively, you could use **logging.error** and hide the traceback:


```
try:
    c = a / b
except Exception as e:
    logger.error(f"{e.__class__.__name__}: {e}")
```

Now this will produce the more succinct:


```
`[E 190423 00:04:16 test:9] ZeroDivisionError: division by zero`
```

* * *

* * *

* * *

**![Logging output][4]**

There are plenty more options which you can read in the docs at [logzero.readthedocs.io][5].

### logzero shines for education

Logging can be a challenging concept for a new programmer. Most frameworks depend on flow control and lots of variable manipulation to make a meaningful log, but logzero is different. With its syntax being similar to a print statement, it is a big win for education as it saves from explaining another concept. Give it a try on your next project.

\--

_This article was originally written on [my blog][6] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/logzero-python

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Snake charmer cartoon with a yellow snake and a blue snake)
[2]: https://opensource.com/sites/default/files/uploads/rpi_ben_1.png (Python, Raspberry Pi: import logger)
[3]: https://opensource.com/article/19/6/understanding-linux-permissions
[4]: https://opensource.com/sites/default/files/uploads/rpi_ben_2.png (Logging output)
[5]: https://logzero.readthedocs.io/en/latest/
[6]: https://tooling.bennuttall.com/logzero/
